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

-- Faction tint for the faction line: Alliance blue, Horde red.
local FACTION_COLORS = {
    Alliance = { 0.30, 0.55, 1.00 },
    Horde    = { 0.90, 0.27, 0.27 },
}

-- One hidden frame listens for the async "quest data is ready" event.
local loader = CreateFrame("Frame")
local pendingQuestID         -- the questID we're currently waiting on (if any)
-- Quests whose async load has finished (value = whether the server reported
-- success). Lets us tell "still loading" apart from "loaded, but the client has
-- no reward data for it" — the latter must show a terminal state, not loop on
-- the "Loading..." message forever.
local loadResult = {}
-- The questID whose objective *text* we're still polling for after its data
-- loaded (set while the poll is active, nil once text arrives or we give up).
-- Lets render() show "Loading objectives..." instead of flashing the definitive
-- "pick it up in-game" note during the brief gap before the text lands.
local objectivePoll

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
        -- First header sits further below the objectives (10) to separate the two
        -- blocks now that there's no outer "Rewards" divider; later ones use 8.
        y = addLine(content, y, { text = label, color = { 0.82, 0.68, 0.28 },
                                  spacingBefore = rendered and 8 or 10 })
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

    -- Caller decides what to show when nothing rendered (the "No rewards" line in
    -- the cached path, or a softer note in the post-load fallback).
    return y, rendered
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
        -- First header sits further below the objectives (10) to separate the two
        -- blocks now that there's no outer "Rewards" divider; later ones use 8.
        y = addLine(content, y, { text = label, color = { 0.82, 0.68, 0.28 },
                                  spacingBefore = rendered and 8 or 10 })
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

-- Wiki objective strings arrive as one raw blob carrying three things mashed
-- together: leftover image markup ("[400px|]thumb|Caption. "), the main
-- objective sentence(s), and a "*"-delimited list of sub-objectives / provided
-- items. Split that into clean renderable pieces:
--   { { text = <main sentence>, heading = true }, { text = <bullet> }, ... }
-- The heading entry renders as a plain line; the bullets get a "- " prefix and a
-- deeper indent in renderObjectiveLines, matching how warcraft.wiki lays it out.
local function parseWikiObjectives(raw)
    if not raw or raw == "" then return nil end
    local s = raw

    -- Strip leading thumbnail captions, e.g. "thumb|Final Doubt. " possibly with
    -- a size prefix ("400px|thumb|...") and possibly several in a row. Each ends
    -- at the first ". " so the real objective sentence is left intact.
    while true do
        local stripped = s:gsub("^%s*%d*%a*|?thumb|.-%.%s+", "", 1)
        if stripped == s then break end
        s = stripped
    end
    -- Drop any stray image markup that wasn't a clean leading caption.
    s = s:gsub("%d+px|thumb|", ""):gsub("thumb|", "")
    s = strtrim(s)
    if s == "" then return nil end

    -- Everything before the first "*" is the main objective; the rest is the
    -- "*"-delimited bullet list.
    local main, rest = s:match("^(.-)%s*%*(.*)$")
    if not main then main, rest = s, nil end

    local out = {}
    main = strtrim(main)
    if main ~= "" then out[#out + 1] = { text = main, heading = true } end
    if rest then
        for item in rest:gmatch("[^%*]+") do
            item = strtrim(item)
            if item ~= "" then out[#out + 1] = { text = item } end
        end
    end
    if #out == 0 then return nil end
    return out
end

-- Pull an honor amount out of a free-form reward string ("209 honor",
-- "+209 honor (620 honor at 80)"). PvP dailies historically stored honor as a
-- pseudo-item in the reward list or inside the rep text rather than a clean
-- field, so we route it to the honor line instead of rendering it as a nameless
-- item or a fake faction. Returns a number, or nil if the string isn't honor.
local function parseHonor(s)
    if not s then return nil end
    local n = s:match("(%d+)%s*[Hh]onor")
    return n and tonumber(n) or nil
end

-- True if a free-form reputation string is worth showing: it must name a faction
-- (letters) and an amount (a digit), and not actually be honor. Filters the noise
-- left by the import -- bare "+", "up to +", etc.
local function repIsRenderable(s)
    if not s or s == "" then return false end
    if s:match("[Hh]onor") then return false end        -- honor is handled separately
    return s:match("%a") ~= nil and s:match("%d") ~= nil
end

-- Normalize a raw WikiDetails `rep` value to the renderer shape: a structured
-- list {{n,v},...} becomes {{name,value},...}; a legacy free-form string passes
-- through when renderable; anything else is nil. Shared by normalizeWiki and the
-- standalone bestReputation() resolver.
local function normalizeRep(rep)
    if type(rep) == "table" then
        local out = {}
        for _, r in ipairs(rep) do out[#out + 1] = { name = r.n, value = r.v } end
        return (#out > 0) and out or nil
    elseif repIsRenderable(rep) then
        return strtrim(rep)
    end
    return nil
end

-- Convert a shipped DT.WikiDetails entry (from warcraft.wiki, compact keys) into
-- the renderer shape. Objectives arrive as one raw wiki string (parsed into clean
-- lines above); the description is a plain string. Honor and reputation are
-- salvaged from the loosely-typed fields so PvP/rep dailies render their full
-- rewards (see parseHonor/repIsRenderable above).
local function normalizeWiki(e)
    local d = { objectives = parseWikiObjectives(e.o), description = e.de }

    -- Honor can land as an explicit field, inside a legacy rep STRING, or as a
    -- pseudo-item. (rep may also be a structured table now, so guard parseHonor.)
    local honor = e.ho or (type(e.rep) == "string" and parseHonor(e.rep)) or nil
    local items
    if e.r then
        for _, it in ipairs(e.r) do
            local h = parseHonor(it.n)
            if h then
                honor = honor or h               -- "209 honor" pseudo-item -> honor line
            else
                items = items or {}
                items[#items + 1] = { name = it.n, count = 1 }
            end
        end
    end

    -- Reputation: structured Blizzard data or a legacy string (see normalizeRep).
    local reputation = normalizeRep(e.rep)

    if items or e.mo or honor or reputation then
        d.rewards = { money = e.mo, honor = honor, items = items, reputation = reputation }
    end
    return d
end

-- Best baked details for a quest (rewards/objectives), in priority order:
-- live-harvested (this session) wins, then the shipped harvested table
-- (QuestRewards.lua), then the wiki-imported details (WikiDetails.lua).
local function resolveBaked(questID)
    if not questID then return nil end
    local live = DT.DB and DT.DB.GetQuestDetails and DT.DB:GetQuestDetails(questID)
    if live and (live.rewards or live.objectives or live.description) then return live end
    local shipped = DT.BakedDetails and DT.BakedDetails[questID]
    if shipped then return normalizeBaked(shipped) end
    local wiki = DT.WikiDetails and DT.WikiDetails[questID]
    if wiki then return normalizeWiki(wiki) end
    return nil
end

-- Resolve the DESCRIPTION on its own, across every source, taking the first that
-- actually has one. This matters because a source can exist for a quest yet lack
-- a description (e.g. a WikiDetails entry with only objectives/giver) -- in that
-- case we must still fall through to the API-baked text rather than show nothing.
local function bestDescription(questID)
    if not questID then return nil end
    local live = DT.DB and DT.DB.GetQuestDetails and DT.DB:GetQuestDetails(questID)
    if live and live.description and live.description ~= "" then return live.description end
    local b = DT.BakedDetails and DT.BakedDetails[questID]
    if b and b.de and b.de ~= "" then return b.de end
    local w = DT.WikiDetails and DT.WikiDetails[questID]
    if w and w.de and w.de ~= "" then return w.de end
    local a = DT.ApiDetails and DT.ApiDetails[questID]
    if a and a.de and a.de ~= "" then return a.de end
    return nil
end

-- Resolve REPUTATION on its own, across every source -- same reason as
-- bestDescription: resolveBaked() returns the first source with ANY detail, so a
-- harvested description (or a BakedDetails entry) would otherwise SHADOW the rep
-- that only lives in WikiDetails. Returns the normalized rep (list or string).
local function bestReputation(questID)
    if not questID then return nil end
    local live = DT.DB and DT.DB.GetQuestDetails and DT.DB:GetQuestDetails(questID)
    if live and live.rewards and live.rewards.reputation then return live.rewards.reputation end
    -- BakedDetails (harvested) has no rep field; WikiDetails is the baked source.
    local w = DT.WikiDetails and DT.WikiDetails[questID]
    if w and w.rep then return normalizeRep(w.rep) end
    return nil
end

-- Render a baked objectives list (no header). Items are either plain strings
-- (harvested/live objectives -> "- " bullets) or { text, heading } tables from
-- the wiki parser: heading is the main sentence (no bullet), the rest are
-- deeper-indented sub-objectives. Returns the new y-cursor.
local function renderObjectiveLines(content, y, list)
    for _, txt in ipairs(list) do
        if type(txt) == "table" then
            if txt.heading then
                y = addLine(content, y, { text = txt.text, color = { 0.85, 0.85, 0.85 }, indent = 6 })
            else
                y = addLine(content, y, { text = "- " .. txt.text, color = { 0.85, 0.85, 0.85 }, indent = 14 })
            end
        else
            y = addLine(content, y, { text = "- " .. txt, color = { 0.85, 0.85, 0.85 }, indent = 6 })
        end
    end
    return y
end

-- True if an API objective string carries a real description, not just a bare
-- "0/1" progress count. The API returns count-only text ("0/1") for quests the
-- player hasn't picked up yet, which is useless on its own -- in that case the
-- caller should fall back to the baked wiki/harvest objective text.
local function objectiveHasText(s)
    if not s or s == "" then return false end
    return strtrim((s:gsub("^%s*%d+%s*/%s*%d+%s*", ""))) ~= ""
end

-- Render objectives from the live API, if it can give descriptive text for this
-- quest. Returns y-cursor, hadAny. hadAny is false when the API only had bare
-- counts (so the caller can fall back to baked objectives).
local function renderObjectives(content, y, questID)
    local objectives = C_QuestLog.GetQuestObjectives and C_QuestLog.GetQuestObjectives(questID)
    if not objectives or #objectives == 0 then return y, false end

    -- Keep only objectives that actually describe something.
    local shown = {}
    for _, obj in ipairs(objectives) do
        if obj and objectiveHasText(obj.text) then shown[#shown + 1] = obj end
    end
    if #shown == 0 then return y, false end

    y = addLine(content, y, { text = "Objectives:", color = { 0.82, 0.68, 0.28 }, spacingBefore = 8 })
    for _, obj in ipairs(shown) do
        local color = obj.finished and { 0.4, 1, 0.4 } or { 0.85, 0.85, 0.85 }
        y = addLine(content, y, { text = "- " .. obj.text, color = color, indent = 6 })
    end
    return y, true
end

-- Reputation reward text tint (a soft faction blue, distinct from the gold
-- section headers and the orange honor line).
local REP_COLOR = { 0.55, 0.75, 1.0 }

-- Resolve a factionID to its display name. Major (renown) factions go through
-- C_MajorFactions; the others fall back to the general faction getters so the
-- helper still works if the API ever returns a non-major faction.
local function factionName(factionID)
    if not factionID then return nil end
    if C_MajorFactions and C_MajorFactions.GetMajorFactionData then
        local data = C_MajorFactions.GetMajorFactionData(factionID)
        if data and data.name then return data.name end
    end
    if C_Reputation and C_Reputation.GetFactionDataByID then
        local data = C_Reputation.GetFactionDataByID(factionID)
        if data and data.name then return data.name end
    end
    if GetFactionInfoByID then
        local name = GetFactionInfoByID(factionID)
        if name then return name end
    end
    return nil
end

-- Render the reputation section. Live MAJOR-faction (renown) rewards come from
-- the API; classic-faction rep isn't exposed live, so it falls back to baked data
-- resolved across ALL sources (bestReputation -- not the resolveBaked primary,
-- which a harvested description would shadow). Kept independent of the item-reward
-- section so a quest can show live items AND its baked classic-faction rep at once.
-- Returns the new y-cursor and whether anything was rendered.
local function renderReputation(content, y, questID)
    local live = C_QuestLog and C_QuestLog.GetQuestLogMajorFactionReputationRewards
        and C_QuestLog.GetQuestLogMajorFactionReputationRewards(questID)
    if live and #live > 0 then
        y = addLine(content, y, { text = "Reputation:", color = { 0.82, 0.68, 0.28 }, spacingBefore = 8 })
        for _, rr in ipairs(live) do
            local name = factionName(rr.factionID) or ("Faction " .. tostring(rr.factionID or "?"))
            y = addLine(content, y, { text = "+" .. (rr.rewardAmount or 0) .. " " .. name,
                                      color = REP_COLOR, indent = 6 })
        end
        return y, true
    end

    local rep = bestReputation(questID)
    if rep then
        y = addLine(content, y, { text = "Reputation:", color = { 0.82, 0.68, 0.28 }, spacingBefore = 8 })
        if type(rep) == "table" then
            -- Structured: one "+amount Faction" line each (matches the live layout).
            for _, r in ipairs(rep) do
                y = addLine(content, y, { text = "+" .. (r.value or 0) .. " " .. (r.name or "?"),
                                          color = REP_COLOR, indent = 6 })
            end
        else
            y = addLine(content, y, { text = rep, color = REP_COLOR, indent = 6 })  -- legacy string
        end
        return y, true
    end
    return y, false
end

-- Render the objectives + rewards body for a quest that has a questID. Per
-- section, prefer Blizzard's LIVE data and fall back to baked/wiki only when the
-- live API has nothing. This matters for rewards: the live API returns each item
-- with its icon and quality, while the wiki fallback is bare names -- so as soon
-- as the async load lands we upgrade an icon-less wiki render to the real icons.
-- Both renderObjectives/renderRewards return false when the live API has nothing
-- yet (e.g. before the load completes), which is our cue to use baked data so the
-- panel always shows something on first paint.
local function renderQuestBody(content, y, questID)
    local baked = resolveBaked(questID)
    -- "still loading" = the async load hasn't resolved yet, or we're polling for
    -- objective text that trails the load. Drives "Loading..." vs the definitive
    -- "pick it up in-game" note, so the latter never flashes mid-load.
    local stillLoading = loadResult[questID] == nil or objectivePoll == questID

    -- Objectives: live text first, then baked objectives.
    local hadObj
    y, hadObj = renderObjectives(content, y, questID)
    local objShown = hadObj
    if not hadObj and baked and baked.objectives and #baked.objectives > 0 then
        y = addLine(content, y, { text = "Objectives:", color = { 0.82, 0.68, 0.28 }, spacingBefore = 8 })
        y = renderObjectiveLines(content, y, baked.objectives)
        objShown = true
    end

    -- Rewards: live (icons + quality) first, then baked/wiki names.
    local hadRewards
    y, hadRewards = renderRewards(content, y, questID)
    local rewardsShown = hadRewards
    if not hadRewards and baked and baked.rewards then
        local shown
        y, shown = renderBakedRewards(content, y, baked.rewards)
        rewardsShown = shown
    end

    -- Reputation: its own section (live renown -> baked string), so it can show
    -- alongside live item rewards even though the API only covers major factions.
    -- Counts toward "rewards shown" so the empty-rewards note never contradicts it.
    local repShown
    y, repShown = renderReputation(content, y, questID)
    rewardsShown = rewardsShown or repShown

    -- Fill in placeholders for whatever's still missing.
    if not (objShown and rewardsShown) then
        if stillLoading and not objShown and not rewardsShown then
            -- Nothing at all yet; one neutral line rather than two stacked ones.
            y = addLine(content, y, { text = "Loading details...",
                                      color = { 0.7, 0.7, 0.7 }, spacingBefore = 8 })
        elseif not stillLoading then
            -- Load finished but a section is genuinely empty for this quest.
            if not objShown then
                y = addLine(content, y, {
                    text = "Objectives become available once you pick this quest up in-game.",
                    color = { 0.6, 0.6, 0.6 }, spacingBefore = 8 })
            end
            if not rewardsShown then
                y = addLine(content, y, {
                    text = "No reward details are available yet. Pick it up in-game to load them.",
                    color = { 0.6, 0.6, 0.6 }, spacingBefore = 8 })
            end
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

    -- Top accent stripe + divider tint follow the quest's expansion color (falling
    -- back to the status color when the expansion is unknown).
    local exp = entry.expansion and DT.EXPANSION_BY_KEY[entry.expansion]
    local accent = (entry.expansion and DT.EXPANSION_COLORS[entry.expansion]) or c
    panel.accent:SetColorTexture(accent[1], accent[2], accent[3], 0.9)
    panel.divider:SetColorTexture(accent[1], accent[2], accent[3], 0.28)

    -- Status pill: a tinted chip sized to its label, replacing the old body line.
    panel.pillText:SetText(DT.STATUS_LABEL[entry.status] or "")
    panel.pillText:SetTextColor(math.min(1, c[1] + 0.25), math.min(1, c[2] + 0.25), math.min(1, c[3] + 0.25))
    panel.pill:SetColorTexture(c[1], c[2], c[3], 0.20)
    panel.pill:SetWidth((panel.pillText:GetStringWidth() or 20) + 12)

    -- Breadcrumb rows, stacked one per line:
    --   1. Faction  2. Expansion  3. Continent | Zone
    -- Each row anchors below the previous *visible* row, so a hidden faction or
    -- expansion line leaves no empty gap. Colours match the rest of the UI -- the
    -- faction tinted to its side, the expansion in its All-tab section colour (the
    -- accent lightened the same way the section title is), the continent muted, and
    -- the zone the blue accent. Zone uses the shared canonical label so it agrees
    -- with the list's grouping.
    local anchor, gap = panel.pill, -7

    -- Faction line: only shown when the quest is faction-specific (not "Both").
    local hasFaction = entry.side and entry.side ~= "Both"
    if hasFaction then
        local fc = FACTION_COLORS[entry.side] or { 0.8, 0.8, 0.8 }
        panel.faction:SetText(entry.side)
        panel.faction:SetTextColor(fc[1], fc[2], fc[3])
        panel.faction:Show()
        anchor, gap = panel.faction, -4
    else
        panel.faction:Hide()
    end

    -- Expansion line.
    panel.expansion:ClearAllPoints()
    panel.expansion:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, gap)
    panel.expansion:SetPoint("RIGHT", panel.title, "RIGHT")
    if exp then
        local ec = DT.EXPANSION_COLORS[entry.expansion] or DT.EXPANSION_COLORS.OTHER
        local lit = { math.min(1, ec[1] + 0.28), math.min(1, ec[2] + 0.28), math.min(1, ec[3] + 0.28) }
        panel.expansion:SetText("|cff" .. DT.ToHex(lit) .. exp.name .. "|r")
        panel.expansion:Show()
        anchor, gap = panel.expansion, -4
    else
        panel.expansion:Hide()
    end

    -- Continent | Zone line.
    panel.meta:ClearAllPoints()
    panel.meta:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, gap)
    panel.meta:SetPoint("RIGHT", panel.title, "RIGHT")
    local bits = {}
    if entry.continentName then
        bits[#bits + 1] = "|cff" .. DT.ToHex(DT.CONTINENT_ACCENT) .. entry.continentName .. "|r"
    end
    local zlabel = DT.Zones and DT.Zones:ZoneLabel(entry) or nil
    if zlabel then
        bits[#bits + 1] = "|cff" .. DT.ToHex(DT.ZONE_ACCENT) .. zlabel .. "|r"
    end
    panel.meta:SetText(table.concat(bits, "  |cff808080|||r  "))

    -- Quest giver: live-captured coords win; else the wiki's coords; else its
    -- location text; else just the name.
    if entry.giver and entry.giver.name then
        local where = ""
        if entry.giver.x and entry.giver.y then
            where = string.format("  (%.1f, %.1f)", entry.giver.x * 100, entry.giver.y * 100)
        elseif entry.giver.loc and entry.giver.loc ~= "" then
            where = "  |cff808080" .. entry.giver.loc .. "|r"
        end
        y = addLine(content, y, { text = "Giver: " .. entry.giver.name .. where,
                                  color = { 0.9, 0.8, 0.4 } })
    end

    -- Quest description / flavor text. Resolved across all sources so an entry
    -- that has (say) wiki objectives but no wiki description still shows the
    -- API-baked text. Italic-ish parchment tone.
    local desc = bestDescription(entry.questID)
    if desc and desc ~= "" then
        y = addLine(content, y, { text = desc,
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
    else
        -- Prefer Blizzard's live reward/objective data (icons + quality) over the
        -- icon-less baked/wiki fallback, upgrading as the async load lands.
        y = renderQuestBody(content, y, entry.questID)
    end

    content:SetHeight(math.max(y, 10))
end

-- True when the live API can give descriptive objective text for this quest
-- (not just a bare "0/1" count). Mirrors the filter renderObjectives uses.
local function hasObjectiveText(questID)
    local objs = C_QuestLog.GetQuestObjectives and C_QuestLog.GetQuestObjectives(questID)
    if not objs then return false end
    for _, obj in ipairs(objs) do
        if obj and objectiveHasText(obj.text) then return true end
    end
    return false
end

-- Re-render the panel for `questID`, then keep polling for a short window if the
-- objective *text* hasn't arrived yet. For a quest you haven't picked up, the
-- client streams the objective text a tick or two AFTER QUEST_DATA_LOAD_RESULT
-- fires, so a single re-render lands too early and shows the "Objectives become
-- available..." placeholder. Without this poll the only way to see them was to
-- click away and back (by then the text had cached). Bounded so quests that
-- genuinely have no objective text settle on the placeholder instead of looping.
local function rerenderUntilObjectives(questID, tries)
    -- Stop if the user navigated away from this quest.
    if not (lastEntry and lastEntry.questID == questID
            and panel and panel:IsShown()) then
        objectivePoll = nil
        return
    end
    -- Done once the text has arrived, or after a bounded number of retries.
    local done = hasObjectiveText(questID) or (tries or 0) >= 8
    objectivePoll = done and nil or questID  -- keep render() in "Loading" mode while waiting
    render(lastEntry)
    if done then return end
    if C_Timer and C_Timer.After then
        C_Timer.After(0.25, function()
            rerenderUntilObjectives(questID, (tries or 0) + 1)
        end)
    else
        objectivePoll = nil
    end
end

-- ---------------------------------------------------------------------------
-- Async load: ask the server for a quest's data, then re-render when it lands.
-- ---------------------------------------------------------------------------
loader:SetScript("OnEvent", function(_, event, questID, success)
    if event ~= "QUEST_DATA_LOAD_RESULT" then return end
    -- Remember the load finished (even on failure) so render() can stop looping
    -- on "Loading..." for quests the client simply has no reward data for.
    loadResult[questID] = success and true or false
    if questID ~= pendingQuestID then return end
    pendingQuestID = nil
    -- Only re-render if this is still the quest the user is looking at. The
    -- objective text may trail the load event, so poll briefly for it.
    if lastEntry and lastEntry.questID == questID and panel and panel:IsShown() then
        rerenderUntilObjectives(questID, 0)
    end
end)

local function requestData(questID)
    if not questID then return end
    -- "Ready" requires BOTH reward data AND live objectives. Reward data is often
    -- cached while the objective text hasn't loaded yet (typical for an Available
    -- quest you haven't picked up). Bailing on reward data alone left the panel
    -- stuck on the "Objectives become available..." placeholder until the user
    -- clicked away and back -- requesting the load lets QUEST_DATA_LOAD_RESULT (or
    -- the safety timer) re-render once the objectives land.
    -- Only treat the quest as fully cached when we have reward data AND real
    -- objective *text*. GetQuestObjectives returns a bare count ("0/8" with no
    -- description) for a quest you haven't picked up, so the old `#objs > 0`
    -- check wrongly declared it cached and skipped the load -- leaving the panel
    -- on the "Objectives become available..." placeholder until a manual reopen.
    if HaveQuestRewardData and HaveQuestRewardData(questID)
    and hasObjectiveText(questID) then
        return  -- fully cached (rewards + real objective text)
    end
    if loadResult[questID] ~= nil then return end  -- already attempted this session
    if not C_QuestLog.RequestLoadQuestByID then
        loadResult[questID] = false  -- can't ask the server; treat as terminal
        return
    end
    pendingQuestID = questID
    loader:RegisterEvent("QUEST_DATA_LOAD_RESULT")
    C_QuestLog.RequestLoadQuestByID(questID)

    -- Safety net: if QUEST_DATA_LOAD_RESULT never arrives for this quest, stop the
    -- "Loading..." state after a few seconds and fall through to the terminal note.
    if C_Timer and C_Timer.After then
        C_Timer.After(4, function()
            if loadResult[questID] == nil then
                loadResult[questID] = false
                if pendingQuestID == questID then pendingQuestID = nil end
                if lastEntry and lastEntry.questID == questID
                and panel and panel:IsShown() then
                    render(lastEntry)
                end
            end
        end)
    end
end

-- ---------------------------------------------------------------------------
-- Panel frame creation. Docked to the right edge of the main tracker window.
-- ---------------------------------------------------------------------------
local function createPanel()
    local host = _G["QuestTallyFrame"]
    if not host then return nil end

    local skin = DT.UI and DT.UI.Skin
    local THEME = skin and skin.THEME
    local panelBg   = (THEME and THEME.panelBg)   or { 0.06, 0.07, 0.09, 0.98 }
    local panelEdge = (THEME and THEME.panelEdge) or { 0.16, 0.17, 0.21, 1.00 }

    local p = CreateFrame("Frame", "QuestTallyDetailPanel", host, "BackdropTemplate")
    p:SetWidth(PANEL_WIDTH)
    p:SetPoint("TOPLEFT", host, "TOPRIGHT", -8, 0)
    p:SetPoint("BOTTOMLEFT", host, "BOTTOMRIGHT", -8, 0)
    p:SetFrameStrata("MEDIUM")
    p:EnableMouse(true)  -- swallow clicks so they don't fall through to the world

    -- Flat dark panel + 1px border, matching the main tracker window (replaces the
    -- old parchment DialogBox skin so the two frames read as one piece).
    if p.SetBackdrop then
        p:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8X8",
            edgeFile = "Interface\\Buttons\\WHITE8X8",
            edgeSize = 1,
        })
        p:SetBackdropColor(panelBg[1], panelBg[2], panelBg[3], panelBg[4] or 1)
        p:SetBackdropBorderColor(panelEdge[1], panelEdge[2], panelEdge[3], panelEdge[4] or 1)
    end

    -- Expansion-accent stripe across the very top, tinted per quest at render time;
    -- ties the open detail panel back to the section the quest came from.
    p.accent = p:CreateTexture(nil, "ARTWORK")
    p.accent:SetTexture("Interface\\Buttons\\WHITE8X8")
    p.accent:SetPoint("TOPLEFT", 1, -1)
    p.accent:SetPoint("TOPRIGHT", -1, -1)
    p.accent:SetHeight(2)

    p.close = (skin and skin.CreateCloseButton and skin.CreateCloseButton(p))
        or CreateFrame("Button", nil, p, "UIPanelCloseButton")
    p.close:SetPoint("TOPRIGHT", -4, -4)
    p.close:SetScript("OnClick", function() DT.Details:Hide() end)

    p.title = p:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    p.title:SetPoint("TOPLEFT", LINE_PAD, -14)
    p.title:SetPoint("TOPRIGHT", -28, -14)  -- leave room for the close button
    p.title:SetJustifyH("LEFT")
    p.title:SetWordWrap(true)

    -- Status pill: a small tinted chip whose width is fit to its label at render.
    p.pill = p:CreateTexture(nil, "ARTWORK")
    p.pill:SetTexture("Interface\\Buttons\\WHITE8X8")
    p.pill:SetPoint("TOPLEFT", p.title, "BOTTOMLEFT", 0, -7)
    p.pill:SetHeight(15)
    p.pillText = p:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    p.pillText:SetPoint("LEFT", p.pill, "LEFT", 6, 0)

    -- Breadcrumb is split across stacked rows (each anchored in render()):
    --   1. Faction (Alliance/Horde) -- hidden for "Both"
    --   2. Expansion
    --   3. Continent | Zone
    -- The faction line is tinted to the faction; render() re-anchors the rows that
    -- follow so a hidden faction line leaves no empty gap.
    p.faction = p:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    p.faction:SetPoint("TOPLEFT", p.pill, "BOTTOMLEFT", 0, -7)
    p.faction:SetJustifyH("LEFT")

    -- Expansion line on its own row.
    p.expansion = p:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    p.expansion:SetPoint("TOPLEFT", p.pill, "BOTTOMLEFT", 0, -7)
    p.expansion:SetPoint("RIGHT", p.title, "RIGHT")
    p.expansion:SetJustifyH("LEFT")

    -- Continent | Zone breadcrumb. Anchored in render() below the expansion line;
    -- the right edge tracks the title.
    p.meta = p:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    p.meta:SetPoint("TOPLEFT", p.pill, "BOTTOMLEFT", 0, -7)
    p.meta:SetPoint("RIGHT", p.title, "RIGHT")
    p.meta:SetJustifyH("LEFT")
    p.meta:SetWordWrap(true)

    p.divider = p:CreateTexture(nil, "ARTWORK")
    p.divider:SetColorTexture(0.5, 0.5, 0.5, 0.20)  -- recolored to the accent at render
    p.divider:SetHeight(1)
    p.divider:SetPoint("TOPLEFT", p.meta, "BOTTOMLEFT", 0, -8)
    p.divider:SetPoint("TOPRIGHT", p.meta, "BOTTOMRIGHT", 0, -8)

    -- Scroll list for the (variable-length) body, with the custom scrollbar.
    local scroll, content
    if skin and skin.CreateScrollFrame then
        scroll, content = skin.CreateScrollFrame(p, PANEL_WIDTH - (LINE_PAD * 2))
        scroll:SetPoint("TOPLEFT", p.divider, "BOTTOMLEFT", 0, -8)
        scroll:SetPoint("BOTTOMRIGHT", -20, 16)
    else
        scroll = CreateFrame("ScrollFrame", "QuestTallyDetailScroll", p, "UIPanelScrollFrameTemplate")
        scroll:SetPoint("TOPLEFT", p.divider, "BOTTOMLEFT", 0, -8)
        scroll:SetPoint("BOTTOMRIGHT", -28, 16)
        content = CreateFrame("Frame", nil, scroll)
        content:SetSize(PANEL_WIDTH - (LINE_PAD * 2), 10)
        scroll:SetScrollChild(content)
    end
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
