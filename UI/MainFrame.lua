-- MainFrame.lua
-- The tracker window. Three viewing modes:
--   ZONE   - dailies located in the player's current zone (default)
--   BROWSE - search/browse discovered dailies by Continent -> Zone
--   ALL    - the full master checklist grouped by expansion
-- Built with plain Blizzard widgets (no libraries). Created lazily on first open.
--
-- Visual design: a flat dark panel with a title bar (overall progress counter),
-- a thin context sub-bar (zone / reset), collapsible color-coded sections, and a
-- bottom tab bar for the modes. The Core layer is untouched; this file only
-- decides how the data is laid out and styled.
local addonName, DT = ...

DT.UI = {}

local ROW_HEIGHT = 20
local SECTION_HEIGHT = 24
local CONTENT_WIDTH = 332

local rowPool, activeRows = {}, {}
local mainFrame

-- Flat dark theme palette (r, g, b, a). Kept here so the look is tweakable in
-- one place.
local THEME = {
    panelBg    = { 0.07, 0.08, 0.10, 0.96 },
    panelEdge  = { 0.18, 0.19, 0.24, 1.00 },
    titleBg    = { 0.11, 0.12, 0.15, 1.00 },
    subBarBg   = { 0.09, 0.10, 0.13, 1.00 },
    tabBarBg   = { 0.11, 0.12, 0.15, 1.00 },
    tabActive  = { 0.20, 0.22, 0.28, 1.00 },
    sectionBg  = { 1, 1, 1, 0.05 },   -- multiplied by the section accent
    divider    = { 1, 1, 1, 0.06 },
    progress   = { 0.59, 0.77, 0.35 }, -- green-ish counter text
}

-- Popup that shows a copyable Wowhead URL. Addons can't open a browser directly,
-- so we present the link pre-selected for Ctrl+C (the standard approach).
StaticPopupDialogs["QUESTTALLY_WOWHEAD"] = {
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
    StaticPopup_Show("QUESTTALLY_WOWHEAD", nil, nil, url)
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
    [DT.STATUS.INACTIVE]     = 5,
    [DT.STATUS.UNDISCOVERED] = 6,
    [DT.STATUS.UNKNOWN]      = 7,
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

-- How many entries in a list count as "done today".
local function doneCount(list)
    local n = 0
    for _, e in ipairs(list) do
        if e.status == DT.STATUS.COMPLETED then n = n + 1 end
    end
    return n
end

-- Lighten an accent color a touch for use as title text on a dark background.
local function lighten(c, amt)
    amt = amt or 0.25
    return math.min(1, c[1] + amt), math.min(1, c[2] + amt), math.min(1, c[3] + amt)
end

-- Build one collapsible section header item plus (when expanded) its quest rows.
local function emitSection(display, opts)
    local collapsed = DT.DB:IsCollapsed(opts.key)
    display[#display+1] = {
        type = "section",
        text = opts.text,
        done = opts.done,
        total = opts.total,
        color = opts.color,
        key = opts.key,
        collapsed = collapsed,
    }
    if not collapsed then
        for _, e in ipairs(opts.list) do
            display[#display+1] = { type = "quest", entry = e }
        end
    end
end

-- Group entries by expansion -> display list of section/quest items.
local function groupByExpansion(entries)
    local groups, keys = {}, {}
    for _, e in ipairs(entries) do
        if not groups[e.expansion] then groups[e.expansion] = {}; keys[#keys+1] = e.expansion end
        table.insert(groups[e.expansion], e)
    end
    table.sort(keys, function(a, b) return expansionOrderIndex(a) < expansionOrderIndex(b) end)
    local display = {}
    for _, key in ipairs(keys) do
        local list = groups[key]
        table.sort(list, sortEntries)
        local exp = DT.EXPANSION_BY_KEY[key]
        emitSection(display, {
            text  = exp and exp.name or key,
            list  = list,
            total = #list,
            done  = doneCount(list),
            color = DT.EXPANSION_COLORS[key] or DT.EXPANSION_COLORS.OTHER,
            key   = "EXP:" .. key,
        })
    end
    return display
end

-- Group entries by zone name -> display list. Zones share a neutral blue accent.
local ZONE_ACCENT = { 0.36, 0.62, 0.92 }
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
        local list = groups[zn]
        table.sort(list, sortEntries)
        emitSection(display, {
            text  = zn,
            list  = list,
            total = #list,
            done  = doneCount(list),
            color = ZONE_ACCENT,
            key   = "ZONE:" .. zn,
        })
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
               "Current zone"
    end
    local entries = DT.Checklist:GetEntries({ zoneName = zone.zoneName })
    table.sort(entries, sortEntries)
    local display = {}
    emitSection(display, {
        text  = zone.zoneName,
        list  = entries,
        total = #entries,
        done  = doneCount(entries),
        color = ZONE_ACCENT,
        key   = "ZONE:" .. zone.zoneName,
    })
    if #entries == 0 then
        display[#display+1] = { type = "message",
            text = "No known dailies mapped to this zone yet." }
    end
    local sub = zone.zoneName
    if zone.continentName then sub = sub .. "  |cff707070— " .. zone.continentName .. "|r" end
    return display, sub
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
    return display, string.format("Browse  |cff707070— %d dailies total|r", #all)
end

local function buildAllMode()
    local entries = DT.Checklist:GetEntries()
    local stats = DT.Checklist:GetStats()
    return groupByExpansion(entries),
           string.format("All  |cff707070— %d quests, |r|cff66cc66%d discovered|r", stats.total, stats.discovered)
end

-- ---------------------------------------------------------------------------
-- Row / section widgets
-- ---------------------------------------------------------------------------
local function acquireRow(parent)
    local row = table.remove(rowPool)
    if not row then
        row = CreateFrame("Button", nil, parent)
        row:SetHeight(ROW_HEIGHT)

        -- Colored accent bar down the left edge (sections only).
        row.accent = row:CreateTexture(nil, "BACKGROUND")
        row.accent:SetTexture("Interface\\Buttons\\WHITE8X8")
        row.accent:SetPoint("TOPLEFT", 0, 0)
        row.accent:SetPoint("BOTTOMLEFT", 0, 0)
        row.accent:SetWidth(3)
        row.accent:Hide()

        -- Section row tinted background (multiplied by the accent color).
        row.headerBg = row:CreateTexture(nil, "BACKGROUND")
        row.headerBg:SetTexture("Interface\\Buttons\\WHITE8X8")
        row.headerBg:SetPoint("TOPLEFT", 1, 0)
        row.headerBg:SetPoint("BOTTOMRIGHT", 0, 0)
        row.headerBg:Hide()

        -- Small square section icon, tinted to the accent.
        row.icon = row:CreateTexture(nil, "ARTWORK")
        row.icon:SetTexture("Interface\\Buttons\\WHITE8X8")
        row.icon:SetSize(9, 9)
        row.icon:SetPoint("LEFT", 10, 0)
        row.icon:Hide()

        -- Status dot (quest rows only).
        row.dot = row:CreateTexture(nil, "ARTWORK")
        row.dot:SetSize(9, 9)
        row.dot:SetPoint("LEFT", 12, 0)
        row.dot:SetTexture("Interface\\Buttons\\WHITE8X8")

        row.title = row:CreateFontString(nil, "ARTWORK", "GameFontNormal")
        row.title:SetPoint("LEFT", row.dot, "RIGHT", 7, 0)
        row.title:SetJustifyH("LEFT")

        row.status = row:CreateFontString(nil, "ARTWORK", "GameFontDisableSmall")
        row.status:SetJustifyH("RIGHT")

        -- Collapse indicator at the far right of a section row.
        row.collapse = row:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
        row.collapse:SetPoint("RIGHT", -8, -1)
        row.collapse:SetJustifyH("RIGHT")
        row.collapse:Hide()

        row.highlight = row:CreateTexture(nil, "HIGHLIGHT")
        row.highlight:SetAllPoints()
        row.highlight:SetColorTexture(1, 1, 1, 0.06)

        row:SetScript("OnClick", function(self, button)
            -- Section header: toggle its collapsed state.
            if self.sectionKey then
                DT.DB:ToggleCollapsed(self.sectionKey)
                DT.UI:Refresh()
                return
            end
            local e = self.entry
            if not e then return end
            -- Shift-click: copyable Wowhead link (needs a known quest ID).
            if IsShiftKeyDown() then
                if e.questID then DT.UI:ShowWowheadLink(e.questID) end
                return
            end
            if button == "LeftButton" then
                -- Left-click: open the details pane (rewards / objectives).
                DT.Details:Toggle(e)
            elseif button == "MiddleButton" then
                -- Middle-click: pin/unpin (this used to be left-click).
                if e.questID then
                    DT.DB:TogglePinned(e.questID)
                    DT.UI:Refresh()
                end
            elseif button == "RightButton" then
                if not e.questID then return end
                -- If the quest isn't in the log yet and we know its giver's
                -- location, point the waypoint at the giver so you can go get it.
                -- Otherwise super-track the quest (objective / turn-in).
                local inLog = C_QuestLog.GetLogIndexForQuestID
                    and C_QuestLog.GetLogIndexForQuestID(e.questID) ~= nil
                if not inLog and DT.QuestLog:SetGiverWaypoint(e.giver) then
                    local g = e.giver
                    print(string.format("|cff33ff99QuestTally|r: waypoint set to %s%s.",
                        (e.title or "quest"),
                        (g and g.name) and (" — " .. g.name) or ""))
                elseif C_SuperTrack and C_SuperTrack.SetSuperTrackedQuestID then
                    C_SuperTrack.SetSuperTrackedQuestID(e.questID)
                    print("|cff33ff99QuestTally|r: tracking " .. (e.title or e.questID))
                end
            end
        end)
        row:RegisterForClicks("LeftButtonUp", "RightButtonUp", "MiddleButtonUp")

        row:SetScript("OnEnter", function(self)
            local e = self.entry
            if not e then return end
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText(e.title or "", 1, 1, 1)
            if e.category then GameTooltip:AddLine(e.category, 0.7, 0.7, 0.7) end
            if e.zoneName then GameTooltip:AddLine(e.zoneName, 0.7, 0.7, 0.7) end
            if e.side and e.side ~= "Both" then GameTooltip:AddLine("Faction: " .. e.side, 0.7, 0.7, 0.7) end
            -- Quest giver, captured live when you visited the NPC.
            if e.giver and e.giver.name then
                local where = ""
                if e.giver.x and e.giver.y then
                    where = string.format("  |cff808080(%.1f, %.1f)|r", e.giver.x * 100, e.giver.y * 100)
                elseif e.giver.loc and e.giver.loc ~= "" then
                    where = "  |cff808080" .. e.giver.loc .. "|r"
                end
                GameTooltip:AddLine("Giver: " .. e.giver.name .. where, 0.9, 0.8, 0.4)
            end
            GameTooltip:AddLine(" ")
            GameTooltip:AddLine("Left-click: quest details", 0.5, 0.8, 1)
            if e.questID then
                GameTooltip:AddLine("Middle-click: pin/unpin", 0.5, 0.8, 1)
                if e.giver and e.giver.x then
                    GameTooltip:AddLine("Right-click: travel to giver / track quest", 0.5, 0.8, 1)
                else
                    GameTooltip:AddLine("Right-click: track quest", 0.5, 0.8, 1)
                end
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
        row.sectionKey = nil
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
-- Mode tabs
-- ---------------------------------------------------------------------------
local function setMode(mode)
    DT.UI.mode = mode
    DT.UI:Refresh()
end

local function updateModeButtons()
    if not mainFrame then return end
    for _, b in ipairs(mainFrame.modeButtons) do
        local active = (b.mode == DT.UI.mode)
        b.bg:SetShown(active)
        if active then
            b.label:SetTextColor(0.95, 0.95, 0.92)
        else
            b.label:SetTextColor(0.55, 0.55, 0.52)
        end
    end
    -- Dropdowns only matter in browse mode; the list start shifts to make room.
    local browsing = (DT.UI.mode == "BROWSE")
    mainFrame.continentDD:SetShown(browsing)
    mainFrame.zoneDD:SetShown(browsing)
    mainFrame.scroll:ClearAllPoints()
    mainFrame.scroll:SetPoint("TOPLEFT", 12, browsing and -86 or -54)
    mainFrame.scroll:SetPoint("BOTTOMRIGHT", -28, 32)
end

-- ---------------------------------------------------------------------------
-- Frame creation
-- ---------------------------------------------------------------------------
-- Small helper: a flat color-textured strip.
local function makeStrip(parent, layer, color)
    local t = parent:CreateTexture(nil, layer or "ARTWORK")
    t:SetTexture("Interface\\Buttons\\WHITE8X8")
    t:SetColorTexture(color[1], color[2], color[3], color[4] or 1)
    return t
end

local function createMainFrame()
    local f = CreateFrame("Frame", "QuestTallyFrame", UIParent, "BackdropTemplate")
    f:SetSize(372, 470)
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

    -- Flat dark panel with a thin 1px border.
    if f.SetBackdrop then
        f:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8X8",
            edgeFile = "Interface\\Buttons\\WHITE8X8",
            edgeSize = 1,
        })
        f:SetBackdropColor(unpack(THEME.panelBg))
        f:SetBackdropBorderColor(unpack(THEME.panelEdge))
    end

    -- Title bar strip.
    f.titleBar = makeStrip(f, "BORDER", THEME.titleBg)
    f.titleBar:SetPoint("TOPLEFT", 1, -1)
    f.titleBar:SetPoint("TOPRIGHT", -1, -1)
    f.titleBar:SetHeight(28)

    -- Title icon + text.
    f.portrait = f:CreateTexture(nil, "ARTWORK")
    f.portrait:SetSize(18, 18)
    f.portrait:SetPoint("LEFT", f.titleBar, "LEFT", 9, 0)
    f.portrait:SetTexture("Interface\\Icons\\INV_Misc_Note_01")
    f.portrait:SetTexCoord(0.08, 0.92, 0.08, 0.92)

    f.title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    f.title:SetPoint("LEFT", f.portrait, "RIGHT", 7, 0)
    f.title:SetText("QuestTally")
    f.title:SetTextColor(0.95, 0.95, 0.92)

    f.close = CreateFrame("Button", nil, f, "UIPanelCloseButton")
    f.close:SetSize(24, 24)
    f.close:SetPoint("RIGHT", f.titleBar, "RIGHT", 2, 0)
    f.close:SetScript("OnClick", function() DT.UI:Hide() end)

    -- Settings (gear) button: opens the options panel.
    f.settingsBtn = CreateFrame("Button", nil, f)
    f.settingsBtn:SetSize(18, 18)
    f.settingsBtn:SetPoint("RIGHT", f.close, "LEFT", -2, 0)
    local cog = f.settingsBtn:CreateTexture(nil, "ARTWORK")
    cog:SetAllPoints()
    cog:SetTexture("Interface\\Buttons\\UI-OptionsButton")
    cog:SetVertexColor(0.85, 0.85, 0.82)
    f.settingsBtn.cog = cog
    f.settingsBtn:SetScript("OnEnter", function(self) self.cog:SetVertexColor(1, 1, 1) end)
    f.settingsBtn:SetScript("OnLeave", function(self) self.cog:SetVertexColor(0.85, 0.85, 0.82) end)
    f.settingsBtn:SetScript("OnClick", function()
        if f.settings then f.settings:SetShown(not f.settings:IsShown()) end
    end)

    -- Small "Tools" button opens the harvester panel (the dev data-baking tools).
    f.toolsBtn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    f.toolsBtn:SetSize(44, 18)
    f.toolsBtn:SetText("Tools")
    f.toolsBtn:SetPoint("RIGHT", f.settingsBtn, "LEFT", -4, 0)
    f.toolsBtn:SetScript("OnClick", function()
        if DT.HarvestPanel then DT.HarvestPanel:Toggle() end
    end)
    f.toolsBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
        GameTooltip:SetText("Harvester tools", 1, 1, 1)
        GameTooltip:AddLine("Bake quest data from your client (dev).", 0.7, 0.7, 0.7)
        GameTooltip:Show()
    end)
    f.toolsBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)

    -- Overall progress counter, right-aligned before the Tools button.
    f.progress = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    f.progress:SetPoint("RIGHT", f.toolsBtn, "LEFT", -8, 0)
    f.progress:SetJustifyH("RIGHT")

    -- Context sub-bar (zone / reset info).
    f.subBar = makeStrip(f, "BORDER", THEME.subBarBg)
    f.subBar:SetPoint("TOPLEFT", f.titleBar, "BOTTOMLEFT", 0, 0)
    f.subBar:SetPoint("TOPRIGHT", f.titleBar, "BOTTOMRIGHT", 0, 0)
    f.subBar:SetHeight(22)

    f.summary = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    f.summary:SetPoint("LEFT", f.subBar, "LEFT", 10, 0)
    f.summary:SetJustifyH("LEFT")

    f.reset = f:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    f.reset:SetPoint("RIGHT", f.subBar, "RIGHT", -10, 0)
    f.reset:SetJustifyH("RIGHT")

    -- Browse dropdowns (shown only in browse mode), sitting under the sub-bar.
    f.continentDD = CreateFrame("Frame", "QuestTallyContinentDD", f, "UIDropDownMenuTemplate")
    f.continentDD:SetPoint("TOPLEFT", f.subBar, "BOTTOMLEFT", -6, -2)
    UIDropDownMenu_SetWidth(f.continentDD, 120)
    UIDropDownMenu_Initialize(f.continentDD, initContinentDropdown)

    f.zoneDD = CreateFrame("Frame", "QuestTallyZoneDD", f, "UIDropDownMenuTemplate")
    f.zoneDD:SetPoint("LEFT", f.continentDD, "RIGHT", 4, 0)
    UIDropDownMenu_SetWidth(f.zoneDD, 120)
    UIDropDownMenu_Initialize(f.zoneDD, initZoneDropdown)

    -- Scroll list (its top is repositioned per mode in updateModeButtons).
    local scroll = CreateFrame("ScrollFrame", "QuestTallyScroll", f, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", 12, -54)
    scroll:SetPoint("BOTTOMRIGHT", -28, 32)
    local content = CreateFrame("Frame", nil, scroll)
    content:SetSize(CONTENT_WIDTH, 10)
    scroll:SetScrollChild(content)
    f.scroll, f.content = scroll, content

    -- Bottom tab bar.
    f.tabBar = makeStrip(f, "BORDER", THEME.tabBarBg)
    f.tabBar:SetPoint("BOTTOMLEFT", 1, 1)
    f.tabBar:SetPoint("BOTTOMRIGHT", -1, 1)
    f.tabBar:SetHeight(28)

    f.modeButtons = {}
    local modes = { { "ZONE", "Current Zone" }, { "ALL", "All" }, { "BROWSE", "Browse" } }
    local n = #modes
    for i, m in ipairs(modes) do
        local b = CreateFrame("Button", nil, f)
        b.mode = m[1]
        -- Even thirds across the tab bar.
        local tabW = 368 / n
        b:SetSize(tabW - 4, 26)
        b:SetPoint("TOPLEFT", f.tabBar, "TOPLEFT", 2 + (i - 1) * tabW, -1)

        b.bg = makeStrip(b, "BACKGROUND", THEME.tabActive)
        b.bg:SetAllPoints()
        b.bg:Hide()

        b.label = b:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        b.label:SetPoint("CENTER")
        b.label:SetText(m[2])

        b.hl = makeStrip(b, "HIGHLIGHT", { 1, 1, 1, 0.05 })
        b.hl:SetAllPoints()

        b:SetScript("OnClick", function() setMode(m[1]) end)
        f.modeButtons[#f.modeButtons+1] = b
    end

    -- Settings panel: a small dark overlay of toggles, opened by the gear button.
    local sp = CreateFrame("Frame", nil, f, "BackdropTemplate")
    sp:SetSize(244, 132)
    sp:SetPoint("TOPRIGHT", f.titleBar, "BOTTOMRIGHT", -6, -6)
    sp:SetFrameStrata("DIALOG")
    sp:EnableMouse(true)  -- swallow clicks so they don't fall through to the list
    if sp.SetBackdrop then
        sp:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8X8",
            edgeFile = "Interface\\Buttons\\WHITE8X8", edgeSize = 1,
        })
        sp:SetBackdropColor(0.10, 0.11, 0.14, 0.98)
        sp:SetBackdropBorderColor(unpack(THEME.panelEdge))
    end

    local spTitle = sp:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    spTitle:SetPoint("TOPLEFT", 12, -10)
    spTitle:SetText("Settings")
    spTitle:SetTextColor(0.95, 0.95, 0.92)

    sp.checks = {}
    local cy = -34
    local function addCheck(label, getFn, setFn)
        local cb = CreateFrame("CheckButton", nil, sp, "UICheckButtonTemplate")
        cb:SetSize(22, 22)
        cb:SetPoint("TOPLEFT", 10, cy)
        local lbl = sp:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        lbl:SetPoint("LEFT", cb, "RIGHT", 2, 0)
        lbl:SetPoint("RIGHT", sp, "RIGHT", -8, 0)
        lbl:SetJustifyH("LEFT")
        lbl:SetText(label)
        cb.sync = function() cb:SetChecked(getFn() and true or false) end
        cb:SetScript("OnClick", function(self)
            setFn(self:GetChecked() and true or false)
            DT.UI:Refresh()
        end)
        sp.checks[#sp.checks + 1] = cb
        cy = cy - 26
    end

    addCheck("Show holiday / seasonal quests",
        function() return DT.DB:GetSetting("showSeasonal") end,
        function(v) DT.DB:SetSetting("showSeasonal", v) end)
    addCheck("Show inactive world quests",
        function() return DT.DB:GetSetting("showInactiveWQ") end,
        function(v) DT.DB:SetSetting("showInactiveWQ", v) end)
    addCheck("Newest expansions first",
        function() return DT.DB:GetSetting("expansionOrder") == "NEWEST" end,
        function(v) DT.DB:SetSetting("expansionOrder", v and "NEWEST" or "OLDEST") end)

    -- Re-sync checkbox states whenever the panel is shown.
    sp:SetScript("OnShow", function(self)
        for _, cb in ipairs(self.checks) do cb.sync() end
    end)
    sp:Hide()
    f.settings = sp

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
    local overallDone, overallTotal = 0, 0

    for _, item in ipairs(display) do
        local row = acquireRow(content)
        row:SetPoint("TOPLEFT", 0, -y)

        if item.type == "section" then
            row:SetSize(CONTENT_WIDTH, SECTION_HEIGHT)
            row.entry = nil
            row.sectionKey = item.key
            row.dot:Hide()
            row:EnableMouse(true)

            local c = item.color or THEME.progress
            row.accent:SetColorTexture(c[1], c[2], c[3], 1)
            row.accent:Show()
            row.headerBg:SetColorTexture(c[1], c[2], c[3], 0.10)
            row.headerBg:Show()
            row.icon:SetColorTexture(c[1], c[2], c[3], 1)
            row.icon:Show()

            row.title:SetFontObject("GameFontNormal")
            row.title:ClearAllPoints()
            row.title:SetPoint("LEFT", row.icon, "RIGHT", 8, 0)
            row.title:SetWidth(CONTENT_WIDTH - 110)
            row.title:SetTextColor(lighten(c, 0.28))
            row.title:SetText(item.text)

            row.status:ClearAllPoints()
            row.status:SetPoint("RIGHT", row.collapse, "LEFT", -6, 0)
            row.status:SetText(string.format("|cff909090%d / %d|r", item.done or 0, item.total or 0))

            row.collapse:Show()
            row.collapse:SetText(item.collapsed and "|cff909090+|r" or "|cff909090\226\128\147|r") -- + / en-dash

            overallDone = overallDone + (item.done or 0)
            overallTotal = overallTotal + (item.total or 0)
            y = y + SECTION_HEIGHT

        elseif item.type == "message" then
            row:SetSize(CONTENT_WIDTH, ROW_HEIGHT * 2)
            row.entry = nil
            row.sectionKey = nil
            row.dot:Hide(); row.accent:Hide(); row.headerBg:Hide()
            row.icon:Hide(); row.collapse:Hide()
            row:EnableMouse(false)
            row.title:SetFontObject("GameFontDisable")
            row.title:ClearAllPoints()
            row.title:SetPoint("LEFT", 14, 0)
            row.title:SetWidth(CONTENT_WIDTH - 18)
            row.title:SetTextColor(0.6, 0.6, 0.6)
            row.title:SetText(item.text)
            row.status:SetText("")
            y = y + ROW_HEIGHT * 2

        else
            local e = item.entry
            row:SetSize(CONTENT_WIDTH, ROW_HEIGHT)
            row.entry = e
            row.sectionKey = nil
            row:EnableMouse(true)
            row.accent:Hide(); row.headerBg:Hide(); row.icon:Hide(); row.collapse:Hide()
            row.dot:Show()

            local c = DT.COLORS[e.status] or DT.COLORS[DT.STATUS.UNKNOWN]
            row.dot:SetColorTexture(c[1], c[2], c[3], 1)

            local done = (e.status == DT.STATUS.COMPLETED)
            local pin = e.pinned and "|cffffd100*|r " or ""
            row.title:SetFontObject("GameFontHighlight")
            row.title:ClearAllPoints()
            row.title:SetPoint("LEFT", row.dot, "RIGHT", 7, 0)
            row.title:SetWidth(CONTENT_WIDTH - 120)
            row.title:SetText(pin .. (e.title or ("Quest " .. (e.questID or "?"))))
            row.title:SetTextColor(done and 0.55 or 0.92, done and 0.55 or 0.92, done and 0.52 or 0.88)

            local hex = string.format("%02x%02x%02x",
                math.floor(c[1]*255), math.floor(c[2]*255), math.floor(c[3]*255))
            row.status:ClearAllPoints()
            row.status:SetPoint("RIGHT", -8, 0)
            row.status:SetText("|cff" .. hex .. (DT.STATUS_LABEL[e.status] or "") .. "|r")
            row.dot:SetAlpha(done and 0.5 or 1)
            y = y + ROW_HEIGHT
        end
        activeRows[#activeRows+1] = row
    end

    content:SetHeight(math.max(y, 10))

    -- Title-bar progress counter reflects the view that's on screen.
    if overallTotal > 0 then
        mainFrame.progress:SetText(string.format("%d / %d", overallDone, overallTotal))
        local pct = overallDone / overallTotal
        local pc = THEME.progress
        mainFrame.progress:SetTextColor(pc[1], pct >= 1 and 0.9 or pc[2], pc[3])
    else
        mainFrame.progress:SetText("")
    end
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

    mainFrame.summary:SetText(summary or "")
    local reset = DT.QuestLog:FormatDuration(DT.QuestLog:GetSecondsUntilReset())
    mainFrame.reset:SetText("resets |cffffd100" .. reset .. "|r")

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
    if mainFrame then
        if mainFrame.settings then mainFrame.settings:Hide() end
        mainFrame:Hide()
    end
    -- The details pane is a child of the main frame (so it hides with it), but
    -- clear its state too so a fresh open doesn't reuse a stale selection.
    if DT.Details then DT.Details:Hide() end
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
