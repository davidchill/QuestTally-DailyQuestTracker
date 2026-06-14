-- MainFrame.lua
-- The tracker window. Three viewing modes:
--   ZONE   - dailies located in the player's current zone (default)
--   BROWSE - search/browse discovered dailies by Continent -> Zone
--   ALL    - the full master checklist grouped by expansion
-- Built with plain Blizzard widgets (no libraries). Created lazily on first open.
local addonName, DT = ...

DT.UI = {}

local ROW_HEIGHT = 20
local HEADER_HEIGHT = 22
local CONTENT_WIDTH = 360

local rowPool, activeRows = {}, {}
local mainFrame

-- Popup that shows a copyable Wowhead URL. Addons can't open a browser directly,
-- so we present the link pre-selected for Ctrl+C (the standard approach).
StaticPopupDialogs["DAILYGRIND_WOWHEAD"] = {
    text = "Wowhead link — press Ctrl+C to copy:",
    button1 = OKAY,
    hasEditBox = true,
    editBoxWidth = 260,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    preferredIndex = 3,  -- avoid UI taint from the default index
    OnShow = function(self, data)
        local eb = self.editBox or (self.GetEditBox and self:GetEditBox())
        if eb and data then
            eb:SetText(data)
            eb:HighlightText()
            eb:SetFocus()
        end
    end,
    EditBoxOnEnterPressed = function(self) self:GetParent():Hide() end,
    EditBoxOnEscapePressed = function(self) self:GetParent():Hide() end,
    -- Keep the text fixed: if the user types, re-select the URL.
    EditBoxOnTextChanged = function(self, data)
        if data and self:GetText() ~= data then
            self:SetText(data)
            self:HighlightText()
        end
    end,
}

-- Show the Wowhead page link for a quest ID.
function DT.UI:ShowWowheadLink(questID)
    if not questID then return end
    local url = "https://www.wowhead.com/quest=" .. questID
    StaticPopup_Show("DAILYGRIND_WOWHEAD", nil, nil, url)
end

-- Current view state.
DT.UI.mode = "ZONE"            -- ZONE | BROWSE | ALL
DT.UI.browseContinent = nil    -- selected continent NAME
DT.UI.browseZone = nil         -- selected zone NAME (nil = all zones)
local browseTree = {}          -- cached continent->zone tree for the dropdowns

-- ---------------------------------------------------------------------------
-- Sorting helpers
-- ---------------------------------------------------------------------------
local STATUS_RANK = {
    [DT.STATUS.READY_TURNIN] = 1,
    [DT.STATUS.IN_PROGRESS]  = 2,
    [DT.STATUS.AVAILABLE]    = 3,
    [DT.STATUS.COMPLETED]    = 4,
    [DT.STATUS.UNDISCOVERED] = 5,
    [DT.STATUS.UNKNOWN]      = 6,
}

local function sortEntries(a, b)
    if a.pinned ~= b.pinned then return a.pinned end
    local ra, rb = STATUS_RANK[a.status] or 9, STATUS_RANK[b.status] or 9
    if ra ~= rb then return ra < rb end
    return (a.title or "") < (b.title or "")
end

local function expansionOrderIndex(expKey)
    local exp = DT.EXPANSION_BY_KEY[expKey]
    if not exp then return 999 end
    if DT.DB:GetSetting("expansionOrder") == "NEWEST" then return -exp.id end
    return exp.id
end

-- Group entries by expansion -> display list of header/quest items.
local function groupByExpansion(entries)
    local groups, keys = {}, {}
    for _, e in ipairs(entries) do
        if not groups[e.expansion] then groups[e.expansion] = {}; keys[#keys+1] = e.expansion end
        table.insert(groups[e.expansion], e)
    end
    table.sort(keys, function(a, b) return expansionOrderIndex(a) < expansionOrderIndex(b) end)
    local display = {}
    for _, key in ipairs(keys) do
        table.sort(groups[key], sortEntries)
        local exp = DT.EXPANSION_BY_KEY[key]
        display[#display+1] = { type = "header", text = exp and exp.name or key, count = #groups[key] }
        for _, e in ipairs(groups[key]) do display[#display+1] = { type = "quest", entry = e } end
    end
    return display
end

-- Group entries by zone name -> display list.
local function groupByZone(entries)
    local groups, names = {}, {}
    for _, e in ipairs(entries) do
        local zn = e.zoneName or "Unknown"
        if not groups[zn] then groups[zn] = {}; names[#names+1] = zn end
        table.insert(groups[zn], e)
    end
    table.sort(names)
    local display = {}
    for _, zn in ipairs(names) do
        table.sort(groups[zn], sortEntries)
        display[#display+1] = { type = "header", text = zn, count = #groups[zn] }
        for _, e in ipairs(groups[zn]) do display[#display+1] = { type = "quest", entry = e } end
    end
    return display
end

-- ---------------------------------------------------------------------------
-- Mode display builders. Each returns (displayList, summaryText).
-- ---------------------------------------------------------------------------
local function buildZoneMode()
    local zone = DT.Zones and DT.Zones:GetPlayerZone() or nil
    if not zone or not zone.zoneName then
        return { { type = "message", text = "Unable to determine your current zone." } },
               "Current Zone"
    end
    local entries = DT.Checklist:GetEntries({ zoneName = zone.zoneName })
    table.sort(entries, sortEntries)
    local display = {}
    local title = zone.zoneName
    if zone.continentName then title = title .. "  |cff808080(" .. zone.continentName .. ")|r" end
    display[#display+1] = { type = "header", text = title, count = #entries }
    if #entries == 0 then
        display[#display+1] = { type = "message",
            text = "No known dailies mapped to this zone yet." }
    else
        for _, e in ipairs(entries) do display[#display+1] = { type = "quest", entry = e } end
    end
    return display, string.format("Current Zone  |  %d dailies", #entries)
end

local function buildBrowseMode()
    local all = DT.Checklist:GetEntries()
    browseTree = DT.Zones:BuildTree(all)

    -- Default the continent selection to the first available.
    if not DT.UI.browseContinent and browseTree[1] then
        DT.UI.browseContinent = browseTree[1].name
    end

    local entries = {}
    for _, e in ipairs(all) do
        if e.continentName == DT.UI.browseContinent
        and (not DT.UI.browseZone or e.zoneName == DT.UI.browseZone) then
            entries[#entries+1] = e
        end
    end

    local display = groupByZone(entries)
    if #display == 0 then
        display = { { type = "message", text = "No dailies for this selection." } }
    end
    return display, string.format("Browse  |  %d dailies total", #all)
end

local function buildAllMode()
    local entries = DT.Checklist:GetEntries()
    local stats = DT.Checklist:GetStats()
    return groupByExpansion(entries),
           string.format("All  |  %d quests, |cff66cc66%d discovered|r", stats.total, stats.discovered)
end

-- ---------------------------------------------------------------------------
-- Row widgets
-- ---------------------------------------------------------------------------
local function acquireRow(parent)
    local row = table.remove(rowPool)
    if not row then
        row = CreateFrame("Button", nil, parent)
        row:SetHeight(ROW_HEIGHT)

        row.dot = row:CreateTexture(nil, "ARTWORK")
        row.dot:SetSize(10, 10)
        row.dot:SetPoint("LEFT", 4, 0)
        row.dot:SetTexture("Interface\\Buttons\\WHITE8X8")

        row.title = row:CreateFontString(nil, "ARTWORK", "GameFontNormal")
        row.title:SetPoint("LEFT", row.dot, "RIGHT", 6, 0)
        row.title:SetJustifyH("LEFT")

        row.status = row:CreateFontString(nil, "ARTWORK", "GameFontDisableSmall")
        row.status:SetPoint("RIGHT", -6, 0)
        row.status:SetJustifyH("RIGHT")

        row.highlight = row:CreateTexture(nil, "HIGHLIGHT")
        row.highlight:SetAllPoints()
        row.highlight:SetColorTexture(1, 1, 1, 0.08)

        -- Faint gold bar behind section headers (shown only for headers).
        row.headerBg = row:CreateTexture(nil, "BACKGROUND")
        row.headerBg:SetAllPoints()
        row.headerBg:SetColorTexture(1, 0.82, 0, 0.10)
        row.headerBg:Hide()

        row:SetScript("OnClick", function(self, button)
            local e = self.entry
            if not e or not e.questID then return end
            if IsShiftKeyDown() then
                DT.UI:ShowWowheadLink(e.questID)
                return
            end
            if button == "RightButton" then
                if C_SuperTrack and C_SuperTrack.SetSuperTrackedQuestID then
                    C_SuperTrack.SetSuperTrackedQuestID(e.questID)
                    print("|cff33ff99Daily Grind|r: tracking waypoint for " .. (e.title or e.questID))
                end
            else
                DT.DB:TogglePinned(e.questID)
                DT.UI:Refresh()
            end
        end)
        row:RegisterForClicks("LeftButtonUp", "RightButtonUp")

        row:SetScript("OnEnter", function(self)
            local e = self.entry
            if not e then return end
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText(e.title or "", 1, 1, 1)
            if e.category then GameTooltip:AddLine(e.category, 0.7, 0.7, 0.7) end
            if e.zoneName then GameTooltip:AddLine(e.zoneName, 0.7, 0.7, 0.7) end
            if e.side and e.side ~= "Both" then GameTooltip:AddLine("Faction: " .. e.side, 0.7, 0.7, 0.7) end
            GameTooltip:AddLine(" ")
            if e.questID then
                GameTooltip:AddLine("Left-click: pin/unpin", 0.5, 0.8, 1)
                GameTooltip:AddLine("Right-click: set waypoint", 0.5, 0.8, 1)
                GameTooltip:AddLine("Shift-click: Wowhead link", 0.5, 0.8, 1)
            else
                GameTooltip:AddLine("Not yet seen in-game; pick it up to track it live.", 0.6, 0.55, 0.7)
            end
            GameTooltip:Show()
        end)
        row:SetScript("OnLeave", function() GameTooltip:Hide() end)
    end
    row:SetParent(parent)
    row:Show()
    return row
end

local function releaseAllRows()
    for _, row in ipairs(activeRows) do
        row.entry = nil
        row:Hide()
        row:ClearAllPoints()
        rowPool[#rowPool + 1] = row
    end
    wipe(activeRows)
end

-- ---------------------------------------------------------------------------
-- Dropdowns (Browse mode)
-- ---------------------------------------------------------------------------
local function refreshDropdownLabels()
    if not mainFrame then return end
    UIDropDownMenu_SetText(mainFrame.continentDD, DT.UI.browseContinent or "Continent")
    UIDropDownMenu_SetText(mainFrame.zoneDD, DT.UI.browseZone or "All Zones")
end

local function addEmptyNotice(level)
    local info = UIDropDownMenu_CreateInfo()
    info.text = "No dailies available"
    info.disabled = true
    info.notClickable = true
    UIDropDownMenu_AddButton(info, level)
end

local function initContinentDropdown(self, level)
    if #browseTree == 0 then addEmptyNotice(level); return end
    for _, c in ipairs(browseTree) do
        local info = UIDropDownMenu_CreateInfo()
        info.text = c.name
        info.value = c.name
        info.checked = (c.name == DT.UI.browseContinent)
        info.func = function()
            DT.UI.browseContinent = c.name
            DT.UI.browseZone = nil
            DT.UI:Refresh()
        end
        UIDropDownMenu_AddButton(info, level)
    end
end

local function initZoneDropdown(self, level)
    -- "All Zones" entry first.
    local allInfo = UIDropDownMenu_CreateInfo()
    allInfo.text = "All Zones"
    allInfo.checked = (DT.UI.browseZone == nil)
    allInfo.func = function() DT.UI.browseZone = nil; DT.UI:Refresh() end
    UIDropDownMenu_AddButton(allInfo, level)

    for _, c in ipairs(browseTree) do
        if c.name == DT.UI.browseContinent then
            for _, z in ipairs(c.zones) do
                local info = UIDropDownMenu_CreateInfo()
                info.text = string.format("%s (%d)", z.name, z.count)
                info.value = z.name
                info.checked = (z.name == DT.UI.browseZone)
                info.func = function() DT.UI.browseZone = z.name; DT.UI:Refresh() end
                UIDropDownMenu_AddButton(info, level)
            end
        end
    end
end

-- ---------------------------------------------------------------------------
-- Mode buttons
-- ---------------------------------------------------------------------------
local function setMode(mode)
    DT.UI.mode = mode
    DT.UI:Refresh()
end

local function updateModeButtons()
    if not mainFrame then return end
    for _, b in ipairs(mainFrame.modeButtons) do
        if b.mode == DT.UI.mode then
            b:SetNormalFontObject("GameFontHighlight")
            b:LockHighlight()
        else
            b:SetNormalFontObject("GameFontNormal")
            b:UnlockHighlight()
        end
    end
    -- Dropdowns only matter in browse mode.
    local show = (DT.UI.mode == "BROWSE")
    mainFrame.continentDD:SetShown(show)
    mainFrame.zoneDD:SetShown(show)
end

-- ---------------------------------------------------------------------------
-- Frame creation
-- ---------------------------------------------------------------------------
local function createMainFrame()
    local f = CreateFrame("Frame", "DailyGrindFrame", UIParent, "BackdropTemplate")
    f:SetSize(400, 480)
    f:SetPoint("CENTER")
    f:SetFrameStrata("MEDIUM")
    f:SetClampedToScreen(true)
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        local point, _, _, x, y = self:GetPoint()
        DT.DB.account.framePosition = { point = point, x = x, y = y }
    end)

    if f.SetBackdrop then
        f:SetBackdrop({
            bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark",
            edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
            tile = true, tileSize = 32, edgeSize = 32,
            insets = { left = 8, right = 8, top = 8, bottom = 8 },
        })
    end

    -- Classic gold header banner with the title sitting on it.
    f.banner = f:CreateTexture(nil, "ARTWORK")
    f.banner:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Header")
    f.banner:SetSize(310, 64)
    f.banner:SetPoint("TOP", 0, 12)

    f.title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    f.title:SetPoint("TOP", f.banner, "TOP", 0, -16)
    f.title:SetText("Daily Grind")

    -- Portrait icon (border trimmed off via texcoords).
    f.portrait = f:CreateTexture(nil, "ARTWORK")
    f.portrait:SetSize(32, 32)
    f.portrait:SetPoint("TOPLEFT", 10, -8)
    f.portrait:SetTexture("Interface\\Icons\\INV_Misc_Note_01")
    f.portrait:SetTexCoord(0.08, 0.92, 0.08, 0.92)

    f.close = CreateFrame("Button", nil, f, "UIPanelCloseButton")
    f.close:SetPoint("TOPRIGHT", -6, -6)
    f.close:SetScript("OnClick", function() DT.UI:Hide() end)

    f.summary = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    f.summary:SetPoint("TOP", f.title, "BOTTOM", 0, -8)

    -- Mode buttons.
    f.modeButtons = {}
    local modes = { { "ZONE", "Current Zone" }, { "BROWSE", "Browse" }, { "ALL", "All" } }
    local prev
    for _, m in ipairs(modes) do
        local b = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
        b:SetSize(118, 20)
        b:SetText(m[2])
        b.mode = m[1]
        if prev then b:SetPoint("LEFT", prev, "RIGHT", 4, 0)
        else b:SetPoint("TOPLEFT", 14, -60) end
        b:SetScript("OnClick", function() setMode(m[1]) end)
        f.modeButtons[#f.modeButtons+1] = b
        prev = b
    end

    -- Browse dropdowns.
    f.continentDD = CreateFrame("Frame", "DailyGrindContinentDD", f, "UIDropDownMenuTemplate")
    f.continentDD:SetPoint("TOPLEFT", 0, -84)
    UIDropDownMenu_SetWidth(f.continentDD, 120)
    UIDropDownMenu_Initialize(f.continentDD, initContinentDropdown)

    f.zoneDD = CreateFrame("Frame", "DailyGrindZoneDD", f, "UIDropDownMenuTemplate")
    f.zoneDD:SetPoint("LEFT", f.continentDD, "RIGHT", 6, 0)
    UIDropDownMenu_SetWidth(f.zoneDD, 120)
    UIDropDownMenu_Initialize(f.zoneDD, initZoneDropdown)

    -- Divider under the controls.
    f.divider = f:CreateTexture(nil, "ARTWORK")
    f.divider:SetColorTexture(1, 0.82, 0, 0.18)
    f.divider:SetHeight(1)
    f.divider:SetPoint("TOPLEFT", 14, -114)
    f.divider:SetPoint("TOPRIGHT", -32, -114)

    -- Scroll list. Top leaves room for the dropdown row in browse mode.
    local scroll = CreateFrame("ScrollFrame", "DailyGrindScroll", f, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", 14, -120)
    scroll:SetPoint("BOTTOMRIGHT", -34, 16)
    local content = CreateFrame("Frame", nil, scroll)
    content:SetSize(CONTENT_WIDTH, 10)
    scroll:SetScrollChild(content)
    f.scroll, f.content = scroll, content

    return f
end

local function ensureFrame()
    if not mainFrame then
        mainFrame = createMainFrame()
        DT.UI:ResetPosition()
    end
    return mainFrame
end

-- ---------------------------------------------------------------------------
-- Rendering
-- ---------------------------------------------------------------------------
local function renderDisplay(display)
    releaseAllRows()
    local content = mainFrame.content
    local y = 0
    for _, item in ipairs(display) do
        local row = acquireRow(content)
        row:SetPoint("TOPLEFT", 0, -y)

        if item.type == "header" then
            row:SetSize(CONTENT_WIDTH, HEADER_HEIGHT)
            row.dot:Hide(); row.entry = nil
            row.headerBg:Show()
            row.title:SetFontObject("GameFontNormal")
            row.title:SetWidth(CONTENT_WIDTH - 20)
            row.title:SetText(string.format("|cffffd100%s|r |cff808080(%d)|r", item.text, item.count or 0))
            row.status:SetText("")
            row:EnableMouse(false)
            y = y + HEADER_HEIGHT
        elseif item.type == "message" then
            row:SetSize(CONTENT_WIDTH, ROW_HEIGHT * 2)
            row.dot:Hide(); row.entry = nil
            row.headerBg:Hide()
            row.title:SetFontObject("GameFontDisable")
            row.title:SetWidth(CONTENT_WIDTH - 10)
            row.title:SetText("|cff999999" .. item.text .. "|r")
            row.status:SetText("")
            row:EnableMouse(false)
            y = y + ROW_HEIGHT * 2
        else
            local e = item.entry
            row:SetSize(CONTENT_WIDTH, ROW_HEIGHT)
            row.entry = e
            row:EnableMouse(true)
            row.headerBg:Hide()
            row.dot:Show()
            local c = DT.COLORS[e.status] or DT.COLORS[DT.STATUS.UNKNOWN]
            row.dot:SetVertexColor(c[1], c[2], c[3])
            local pin = e.pinned and "|cffffd100*|r " or ""
            row.title:SetFontObject("GameFontHighlight")
            row.title:SetWidth(CONTENT_WIDTH - 120)
            row.title:SetText(pin .. (e.title or ("Quest " .. (e.questID or "?"))))
            local hex = string.format("%02x%02x%02x",
                math.floor(c[1]*255), math.floor(c[2]*255), math.floor(c[3]*255))
            row.status:SetText("|cff" .. hex .. (DT.STATUS_LABEL[e.status] or "") .. "|r")
            y = y + ROW_HEIGHT
        end
        activeRows[#activeRows+1] = row
    end
    content:SetHeight(math.max(y, 10))
end

function DT.UI:Refresh()
    if not mainFrame or not mainFrame:IsShown() then return end

    local display, summary
    if DT.UI.mode == "BROWSE" then
        display, summary = buildBrowseMode()
        refreshDropdownLabels()
    elseif DT.UI.mode == "ALL" then
        display, summary = buildAllMode()
    else
        display, summary = buildZoneMode()
    end

    -- Append the reset timer to whatever the mode summary is.
    local reset = DT.QuestLog:FormatDuration(DT.QuestLog:GetSecondsUntilReset())
    mainFrame.summary:SetText((summary or "") .. "  |  Reset |cffffd100" .. reset .. "|r")

    updateModeButtons()
    renderDisplay(display)
end

-- ---------------------------------------------------------------------------
-- Show / hide / position
-- ---------------------------------------------------------------------------
function DT.UI:Show()
    ensureFrame()
    mainFrame:Show()
    self:Refresh()
end

function DT.UI:Hide()
    if mainFrame then mainFrame:Hide() end
end

function DT.UI:Toggle()
    ensureFrame()
    if mainFrame:IsShown() then self:Hide() else self:Show() end
end

function DT.UI:ResetPosition()
    if not mainFrame then return end
    mainFrame:ClearAllPoints()
    local pos = DT.DB.account.framePosition
    if pos and pos.point then
        mainFrame:SetPoint(pos.point, UIParent, pos.point, pos.x, pos.y)
    else
        mainFrame:SetPoint("CENTER")
    end
end
