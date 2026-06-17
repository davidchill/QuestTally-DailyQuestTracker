-- DetailPanel.lua
-- A details pane docked to the right edge of the tracker window. Left-clicking a
-- quest in the list opens this panel and shows that quest's objectives and
-- rewards (items, money, XP, honor, currencies).
--
-- The catch with WoW's API: reward/objective data for a quest you DON'T currently
-- have in your log isn't available synchronously. We have to ask the server to
-- load it (C_QuestLog.RequestLoadQuestByID), wait for the QUEST_DATA_LOAD_RESULT
-- event, and only then read the rewards. So this module shows a "Loading..."
-- state and re-renders once the data arrives. Quests with no known ID yet
-- (never seen in-game) can't be queried at all; we say so instead.
local addonName, DT = ...

DT.Details = {}

local PANEL_WIDTH = 250
local LINE_PAD = 14          -- left/right inset for content
local panel                  -- created lazily on first Show
local lastEntry              -- the entry currently displayed (for re-render on load)

-- One hidden frame listens for the async "quest data is ready" event.
local loader = CreateFrame("Frame")
local pendingQuestID         -- the questID we're currently waiting on (if any)

-- ---------------------------------------------------------------------------
-- Line-widget pool. Each "line" is a row that can show an optional icon plus
-- wrapped text. We recycle them between renders the same way the main list does.
-- ---------------------------------------------------------------------------
local linePool, activeLines = {}, {}

local function acquireLine(parent)
    local line = table.remove(linePool)
    if not line then
        line = CreateFrame("Frame", nil, parent)
        line.icon = line:CreateTexture(nil, "ARTWORK")
        line.icon:SetSize(16, 16)
        line.icon:SetPoint("TOPLEFT", 0, 0)
        line.icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)  -- trim the default icon border

        line.text = line:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
        line.text:SetJustifyH("LEFT")
        line.text:SetJustifyV("TOP")
    end
    line:SetParent(parent)
    line:Show()
    return line
end

local function releaseAllLines()
    for _, line in ipairs(activeLines) do
        line:Hide()
        line:ClearAllPoints()
        line.icon:Hide()
        linePool[#linePool + 1] = line
    end
    wipe(activeLines)
end

-- Add one content line to the panel and advance the layout cursor.
-- opts: { text, icon, color={r,g,b}, indent, spacingBefore }
-- Returns the new y-cursor value.
local function addLine(content, y, opts)
    local line = acquireLine(content)
    local indent = opts.indent or 0
    local hasIcon = opts.icon ~= nil
    local textOffset = hasIcon and 20 or 0          -- room for the icon, if any
    local width = PANEL_WIDTH - (LINE_PAD * 2) - indent - textOffset

    y = y + (opts.spacingBefore or 0)
    line:SetPoint("TOPLEFT", indent, -y)
    line:SetWidth(PANEL_WIDTH - (LINE_PAD * 2) - indent)

    if hasIcon then
        line.icon:SetTexture(opts.icon)
        line.icon:Show()
    else
        line.icon:Hide()
    end

    -- Anchor the text within the row (to the right of the icon when present).
    -- Without this the FontString has no position and renders nothing.
    line.text:ClearAllPoints()
    line.text:SetPoint("TOPLEFT", line, "TOPLEFT", textOffset, 0)
    line.text:SetWidth(width)
    line.text:SetText(opts.text or "")
    if opts.color then
        line.text:SetTextColor(opts.color[1], opts.color[2], opts.color[3])
    else
        line.text:SetTextColor(1, 1, 1)
    end

    -- The line is as tall as its (possibly wrapped) text, or the icon, whichever
    -- is taller, so the next line never overlaps it.
    local textH = line.text:GetStringHeight()
    local h = math.max(textH, hasIcon and 16 or 0)
    line:SetHeight(h)

    activeLines[#activeLines + 1] = line
    return y + h + 4  -- 4px gap between lines
end

-- ---------------------------------------------------------------------------
-- Reward reading. All of these accept the questID as a trailing argument and
-- only return real data once QUEST_DATA_LOAD_RESULT has fired for the quest.
-- Each is wrapped defensively: the API surface shifts a little between patches,
-- so a missing/renamed function degrades to "skip that section" instead of
-- throwing.
-- ---------------------------------------------------------------------------
local function qualityColor(quality)
    local c = quality and ITEM_QUALITY_COLORS and ITEM_QUALITY_COLORS[quality]
    if c then return { c.r, c.g, c.b } end
    return { 1, 1, 1 }
end

-- Render the rewards portion. Returns the updated y-cursor.
local function renderRewards(content, y, questID)
    local rendered = false

    local function sectionHeader(label)
        y = addLine(content, y, { text = label, color = { 1, 0.82, 0 },
                                  spacingBefore = rendered and 8 or 4 })
        rendered = true
    end

    -- Choice rewards ("pick one of these").
    local numChoices = GetNumQuestLogChoices and GetNumQuestLogChoices(questID) or 0
    if numChoices > 0 then
        sectionHeader("Choose one of:")
        for i = 1, numChoices do
            local name, texture, numItems, quality = GetQuestLogChoiceInfo(i, questID)
            if name then
                local qty = (numItems and numItems > 1) and (" x" .. numItems) or ""
                y = addLine(content, y, { text = name .. qty, icon = texture,
                                          color = qualityColor(quality), indent = 6 })
            end
        end
    end

    -- Guaranteed item rewards ("you will also receive").
    local numRewards = GetNumQuestLogRewards and GetNumQuestLogRewards(questID) or 0
    if numRewards > 0 then
        sectionHeader(numChoices > 0 and "You will also receive:" or "Rewards:")
        for i = 1, numRewards do
            local name, texture, numItems, quality = GetQuestLogRewardInfo(i, questID)
            if name then
                local qty = (numItems and numItems > 1) and (" x" .. numItems) or ""
                y = addLine(content, y, { text = name .. qty, icon = texture,
                                          color = qualityColor(quality), indent = 6 })
            end
        end
    end

    -- Currencies (valor, marks, tokens, etc.).
    local numCurr = GetNumQuestLogRewardCurrencies and GetNumQuestLogRewardCurrencies(questID) or 0
    if numCurr > 0 then
        sectionHeader("Currency:")
        for i = 1, numCurr do
            local name, texture, numItems = GetQuestLogRewardCurrencyInfo(i, questID)
            if name then
                y = addLine(content, y, { text = (numItems or 1) .. "x " .. name,
                                          icon = texture, indent = 6 })
            end
        end
    end

    -- Money / XP / honor as plain lines under a single "Also:" header.
    local money = GetQuestLogRewardMoney and GetQuestLogRewardMoney(questID) or 0
    local xp = GetQuestLogRewardXP and GetQuestLogRewardXP(questID) or 0
    local honor = GetQuestLogRewardHonor and GetQuestLogRewardHonor(questID) or 0

    if money > 0 or xp > 0 or honor > 0 then
        sectionHeader("Also:")
        if money > 0 then
            local moneyStr = GetCoinTextureString and GetCoinTextureString(money)
                or (math.floor(money / 10000) .. "g")
            y = addLine(content, y, { text = moneyStr, indent = 6 })
        end
        if xp > 0 then
            y = addLine(content, y, { text = BreakUpLargeNumbers(xp) .. " XP",
                                      color = { 0.6, 0.4, 0.9 }, indent = 6 })
        end
        if honor > 0 then
            y = addLine(content, y, { text = honor .. " Honor",
                                      color = { 1, 0.4, 0.3 }, indent = 6 })
        end
    end

    if not rendered then
        y = addLine(content, y, { text = "No rewards listed for this quest.",
                                  color = { 0.6, 0.6, 0.6 }, spacingBefore = 4 })
    end

    return y
end

-- ---------------------------------------------------------------------------
-- Baked-data fallback. When the live reward API has nothing cached (the player
-- hasn't loaded this quest this session), we fall back to details captured
-- earlier by the harvester (DT.DB:GetQuestDetails). The shape mirrors what
-- Harvester:readRewards produces: lists of { name, icon, count, quality }.
-- ---------------------------------------------------------------------------
local function renderBakedRewards(content, y, rewards)
    local rendered = false
    local function sectionHeader(label)
        y = addLine(content, y, { text = label, color = { 1, 0.82, 0 },
                                  spacingBefore = rendered and 8 or 4 })
        rendered = true
    end
    local function rewardLine(it)
        local qty = (it.count and it.count > 1) and (" x" .. it.count) or ""
        y = addLine(content, y, { text = it.name .. qty, icon = it.icon,
                                  color = qualityColor(it.quality), indent = 6 })
    end

    if rewards.choices then
        sectionHeader("Choose one of:")
        for _, it in ipairs(rewards.choices) do rewardLine(it) end
    end
    if rewards.items then
        sectionHeader(rewards.choices and "You will also receive:" or "Rewards:")
        for _, it in ipairs(rewards.items) do rewardLine(it) end
    end
    if rewards.currencies then
        sectionHeader("Currency:")
        for _, it in ipairs(rewards.currencies) do
            y = addLine(content, y, { text = (it.count or 1) .. "x " .. it.name,
                                      icon = it.icon, indent = 6 })
        end
    end
    if rewards.money or rewards.xp or rewards.honor then
        sectionHeader("Also:")
        if rewards.money then
            local moneyStr = GetCoinTextureString and GetCoinTextureString(rewards.money)
                or (math.floor(rewards.money / 10000) .. "g")
            y = addLine(content, y, { text = moneyStr, indent = 6 })
        end
        if rewards.xp then
            y = addLine(content, y, { text = BreakUpLargeNumbers(rewards.xp) .. " XP",
                                      color = { 0.6, 0.4, 0.9 }, indent = 6 })
        end
        if rewards.honor then
            y = addLine(content, y, { text = rewards.honor .. " Honor",
                                      color = { 1, 0.4, 0.3 }, indent = 6 })
        end
    end
    return y, rendered
end

-- Convert a shipped DT.BakedDetails entry (compact short keys, emitted by the
-- build-from-harvest generator) into the full-key shape the renderer uses.
local function normalizeBaked(e)
    local function conv(list)
        local out = {}
        for _, it in ipairs(list) do
            out[#out + 1] = { name = it.n, quality = it.q, count = it.ct or 1, icon = it.ic }
        end
        return out
    end
    local d = { title = e.n, objectives = e.o, description = e.de }
    if e.r then
        local r = { money = e.r.mo, xp = e.r.xp, honor = e.r.ho }
        if e.r.c then r.choices = conv(e.r.c) end
        if e.r.i then r.items = conv(e.r.i) end
        if e.r.cu then r.currencies = conv(e.r.cu) end
        d.rewards = r
    end
    return d
end

-- Best baked details for a quest: live-harvested (this session) wins, else the
-- shipped baked table loaded from QuestRewards.lua.
local function resolveBaked(questID)
    if not questID then return nil end
    local live = DT.DB and DT.DB.GetQuestDetails and DT.DB:GetQuestDetails(questID)
    if live and (live.rewards or live.objectives or live.description) then return live end
    local shipped = DT.BakedDetails and DT.BakedDetails[questID]
    if shipped then return normalizeBaked(shipped) end
    return nil
end

-- Render the harvested fallback for an entry. Returns the new y-cursor, or nil
-- if there's no baked data to show.
local function renderBaked(content, y, questID)
    local details = resolveBaked(questID)
    if not details or not (details.rewards or details.objectives) then return nil end

    y = addLine(content, y, { text = "Saved from an earlier visit:",
                              color = { 0.6, 0.55, 0.7 }, spacingBefore = 8 })
    if details.objectives and #details.objectives > 0 then
        y = addLine(content, y, { text = "Objectives:", color = { 1, 0.82, 0 }, spacingBefore = 8 })
        for _, txt in ipairs(details.objectives) do
            y = addLine(content, y, { text = "- " .. txt, color = { 0.85, 0.85, 0.85 }, indent = 6 })
        end
    end
    if details.rewards then
        y = addLine(content, y, { text = "Rewards", color = { 1, 0.82, 0 }, spacingBefore = 10 })
        y = renderBakedRewards(content, y, details.rewards)
    end
    return y
end

-- Render objectives, if the API can give them for this quest. Returns y-cursor.
local function renderObjectives(content, y, questID)
    local objectives = C_QuestLog.GetQuestObjectives and C_QuestLog.GetQuestObjectives(questID)
    if not objectives or #objectives == 0 then return y end

    y = addLine(content, y, { text = "Objectives:", color = { 1, 0.82, 0 }, spacingBefore = 8 })
    for _, obj in ipairs(objectives) do
        if obj and obj.text and obj.text ~= "" then
            local color = obj.finished and { 0.4, 1, 0.4 } or { 0.85, 0.85, 0.85 }
            y = addLine(content, y, { text = "- " .. obj.text, color = color, indent = 6 })
        end
    end
    return y
end

-- ---------------------------------------------------------------------------
-- Main render: clears the panel and rebuilds it from the given entry.
-- ---------------------------------------------------------------------------
local function render(entry)
    if not panel then return end
    releaseAllLines()
    local content = panel.content
    local y = 0

    -- Title (color it by status, like the list does).
    local c = DT.COLORS[entry.status] or DT.COLORS[DT.STATUS.UNKNOWN]
    panel.title:SetText(entry.title or ("Quest " .. (entry.questID or "?")))
    panel.title:SetTextColor(c[1], c[2], c[3])

    -- Meta line: zone / faction / expansion.
    local bits = {}
    if entry.zoneName then bits[#bits + 1] = entry.zoneName end
    if entry.side and entry.side ~= "Both" then bits[#bits + 1] = entry.side end
    local exp = entry.expansion and DT.EXPANSION_BY_KEY[entry.expansion]
    if exp then bits[#bits + 1] = exp.name end
    panel.meta:SetText(table.concat(bits, "  |cff808080•|r  "))

    -- Status label.
    y = addLine(content, y, { text = DT.STATUS_LABEL[entry.status] or "", color = c })

    -- Quest giver (captured live when you visited the NPC), if we know it.
    if entry.giver and entry.giver.name then
        local coords = ""
        if entry.giver.x and entry.giver.y then
            coords = string.format("  (%.1f, %.1f)", entry.giver.x * 100, entry.giver.y * 100)
        end
        y = addLine(content, y, { text = "Giver: " .. entry.giver.name .. coords,
                                  color = { 0.9, 0.8, 0.4 } })
    end

    -- Quest description / flavor text, captured when the giver was viewed.
    -- Shown regardless of which data branch follows. Italic-ish parchment tone.
    local stored = entry.questID and resolveBaked(entry.questID) or nil
    if stored and stored.description and stored.description ~= "" then
        y = addLine(content, y, { text = stored.description,
                                  color = { 0.82, 0.78, 0.64 }, spacingBefore = 8 })
    end

    if not entry.questID then
        -- Never seen in-game, so there's no ID to query the server with. Baked
        -- harvester data can't help here either (it's keyed by questID).
        y = addLine(content, y, {
            text = "This quest hasn't been seen in-game yet, so its details aren't "
                .. "available. Pick it up (or talk to its giver) to load rewards "
                .. "and objectives.",
            color = { 0.6, 0.55, 0.7 }, spacingBefore = 8 })
    elseif not (HaveQuestRewardData and HaveQuestRewardData(entry.questID)) then
        -- Live data not cached yet. Fall back to anything the harvester baked,
        -- and still kick off the async load so fresh data replaces it when ready.
        local bakedY = renderBaked(content, y, entry.questID)
        if bakedY then
            y = bakedY
        else
            y = addLine(content, y, { text = "Loading details...",
                                      color = { 0.7, 0.7, 0.7 }, spacingBefore = 8 })
        end
    else
        y = renderObjectives(content, y, entry.questID)
        y = addLine(content, y, { text = "Rewards", color = { 1, 0.82, 0 }, spacingBefore = 10 })
        y = renderRewards(content, y, entry.questID)
    end

    content:SetHeight(math.max(y, 10))
end

-- ---------------------------------------------------------------------------
-- Async load: ask the server for a quest's data, then re-render when it lands.
-- ---------------------------------------------------------------------------
loader:SetScript("OnEvent", function(_, event, questID, success)
    if event ~= "QUEST_DATA_LOAD_RESULT" then return end
    if questID ~= pendingQuestID then return end
    pendingQuestID = nil
    -- Only re-render if this is still the quest the user is looking at.
    if lastEntry and lastEntry.questID == questID and panel and panel:IsShown() then
        render(lastEntry)
    end
end)

local function requestData(questID)
    if not questID then return end
    if HaveQuestRewardData and HaveQuestRewardData(questID) then return end  -- already cached
    if not C_QuestLog.RequestLoadQuestByID then return end
    pendingQuestID = questID
    loader:RegisterEvent("QUEST_DATA_LOAD_RESULT")
    C_QuestLog.RequestLoadQuestByID(questID)
end

-- ---------------------------------------------------------------------------
-- Panel frame creation. Docked to the right edge of the main tracker window.
-- ---------------------------------------------------------------------------
local function createPanel()
    local host = _G["QuestTallyFrame"]
    if not host then return nil end

    local p = CreateFrame("Frame", "QuestTallyDetailPanel", host, "BackdropTemplate")
    p:SetWidth(PANEL_WIDTH)
    p:SetPoint("TOPLEFT", host, "TOPRIGHT", -8, 0)
    p:SetPoint("BOTTOMLEFT", host, "BOTTOMRIGHT", -8, 0)
    p:SetFrameStrata("MEDIUM")
    p:EnableMouse(true)  -- swallow clicks so they don't fall through to the world

    if p.SetBackdrop then
        p:SetBackdrop({
            bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark",
            edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
            tile = true, tileSize = 32, edgeSize = 32,
            insets = { left = 8, right = 8, top = 8, bottom = 8 },
        })
    end

    p.close = CreateFrame("Button", nil, p, "UIPanelCloseButton")
    p.close:SetPoint("TOPRIGHT", -4, -4)
    p.close:SetScript("OnClick", function() DT.Details:Hide() end)

    p.title = p:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    p.title:SetPoint("TOPLEFT", LINE_PAD, -14)
    p.title:SetPoint("TOPRIGHT", -28, -14)  -- leave room for the close button
    p.title:SetJustifyH("LEFT")
    p.title:SetWordWrap(true)

    p.meta = p:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    p.meta:SetPoint("TOPLEFT", p.title, "BOTTOMLEFT", 0, -6)
    p.meta:SetPoint("TOPRIGHT", p.title, "BOTTOMRIGHT", 0, -6)
    p.meta:SetJustifyH("LEFT")
    p.meta:SetWordWrap(true)

    p.divider = p:CreateTexture(nil, "ARTWORK")
    p.divider:SetColorTexture(1, 0.82, 0, 0.18)
    p.divider:SetHeight(1)
    p.divider:SetPoint("TOPLEFT", p.meta, "BOTTOMLEFT", 0, -8)
    p.divider:SetPoint("TOPRIGHT", p.meta, "BOTTOMRIGHT", 0, -8)

    -- Scroll list for the (variable-length) body.
    local scroll = CreateFrame("ScrollFrame", "QuestTallyDetailScroll", p, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", p.divider, "BOTTOMLEFT", 0, -8)
    scroll:SetPoint("BOTTOMRIGHT", -28, 16)
    local content = CreateFrame("Frame", nil, scroll)
    content:SetSize(PANEL_WIDTH - (LINE_PAD * 2), 10)
    scroll:SetScrollChild(content)
    p.scroll, p.content = scroll, content

    return p
end

-- ---------------------------------------------------------------------------
-- Public API
-- ---------------------------------------------------------------------------
function DT.Details:Show(entry)
    if not entry then return end
    if not panel then panel = createPanel() end
    if not panel then return end  -- main frame doesn't exist yet

    lastEntry = entry
    panel:Show()
    requestData(entry.questID)  -- kick off async load if not cached
    render(entry)               -- render immediately with whatever we have
end

function DT.Details:Hide()
    if panel then panel:Hide() end
    lastEntry = nil
end

function DT.Details:IsShown()
    return panel and panel:IsShown()
end

-- Left-click behavior: open the panel for this entry, or close it if the same
-- quest is clicked again (a quick toggle).
function DT.Details:Toggle(entry)
    if not entry then return end
    local sameQuest = lastEntry and panel and panel:IsShown()
        and lastEntry.questID == entry.questID
        and (entry.questID ~= nil or lastEntry.title == entry.title)
    if sameQuest then
        self:Hide()
    else
        self:Show(entry)
    end
end
