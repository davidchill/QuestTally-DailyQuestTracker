-- PinnedPanel.lua
-- A companion pane docked to the LEFT edge of the tracker window (mirroring the
-- DetailPanel, which docks right). It lists the quests the player has pinned by
-- middle-clicking a row, so favourites stay in view regardless of which tab or
-- zone the main list is showing.
--
-- Each pinned row is clickable: left-click opens that quest in the detail panel,
-- right-click un-pins it. The list rebuilds whenever a quest is pinned/unpinned
-- or the tracker refreshes.
local addonName, DT = ...

DT.Pinned = {}

local PANEL_WIDTH = 230
local LINE_PAD = 12
local ROW_HEIGHT = 34
local panel  -- created lazily on first Show

-- ---------------------------------------------------------------------------
-- Row pool. Each row is a clickable button with a status dot, a title, and a
-- small "<status> • <zone>" sub-line. Recycled between renders like the main list.
-- ---------------------------------------------------------------------------
local rowPool, activeRows = {}, {}

local function acquireRow(parent)
    local r = table.remove(rowPool)
    if not r then
        r = CreateFrame("Button", nil, parent)
        r:SetHeight(ROW_HEIGHT)
        r:RegisterForClicks("LeftButtonUp", "RightButtonUp")

        r.hl = r:CreateTexture(nil, "HIGHLIGHT")
        r.hl:SetAllPoints()
        r.hl:SetColorTexture(1, 1, 1, 0.06)

        r.dot = r:CreateTexture(nil, "ARTWORK")
        r.dot:SetTexture("Interface\\Buttons\\WHITE8X8")
        r.dot:SetSize(8, 8)
        r.dot:SetPoint("TOPLEFT", 2, -5)

        r.title = r:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
        r.title:SetPoint("TOPLEFT", r.dot, "TOPRIGHT", 8, 2)
        r.title:SetPoint("RIGHT", r, "RIGHT", -4, 0)
        r.title:SetJustifyH("LEFT")
        r.title:SetWordWrap(false)

        r.sub = r:CreateFontString(nil, "ARTWORK", "GameFontDisableSmall")
        r.sub:SetPoint("TOPLEFT", r.title, "BOTTOMLEFT", 0, -2)
        r.sub:SetPoint("RIGHT", r, "RIGHT", -4, 0)
        r.sub:SetJustifyH("LEFT")
        r.sub:SetWordWrap(false)

        r:SetScript("OnClick", function(self, button)
            local e = self.entry
            if not e then return end
            if button == "RightButton" then
                if e.questID then
                    DT.DB:TogglePinned(e.questID)
                    DT.UI:Refresh()       -- repaint the pin marker in the main list
                    DT.Pinned:Refresh()   -- drop the row from this panel
                end
            else
                if DT.Details then DT.Details:Toggle(e) end
            end
        end)
        r:SetScript("OnEnter", function(self)
            local e = self.entry
            if not e then return end
            GameTooltip:SetOwner(self, "ANCHOR_LEFT")
            GameTooltip:SetText(e.title or "", 1, 1, 1)
            if e.zoneName then GameTooltip:AddLine(e.zoneName, 0.7, 0.7, 0.7) end
            GameTooltip:AddLine("Left-click: details", 0.5, 0.8, 1)
            GameTooltip:AddLine("Right-click: unpin", 0.5, 0.8, 1)
            GameTooltip:Show()
        end)
        r:SetScript("OnLeave", function() GameTooltip:Hide() end)
    end
    r:SetParent(parent)
    r:Show()
    return r
end

local function releaseAllRows()
    for _, r in ipairs(activeRows) do
        r:Hide()
        r:ClearAllPoints()
        r.entry = nil
        rowPool[#rowPool + 1] = r
    end
    wipe(activeRows)
end

-- Status ordering for the pinned list: actionable first (ready to turn in, in
-- progress, available), then the rest. Mirrors the main list's STATUS_RANK.
local STATUS_RANK = {
    [DT.STATUS.READY_TURNIN] = 1,
    [DT.STATUS.IN_PROGRESS]  = 2,
    [DT.STATUS.AVAILABLE]    = 3,
    [DT.STATUS.COMPLETED]    = 4,
    [DT.STATUS.INACTIVE]     = 5,
    [DT.STATUS.UNDISCOVERED] = 6,
    [DT.STATUS.UNKNOWN]      = 7,
}

-- Collect pinned entries from the unified checklist (full metadata: title,
-- status, zone, expansion). Pins ignore the kind show/hide filters on purpose --
-- if you pinned it, you want to see it here.
local function gatherPinned()
    local out = {}
    for _, e in ipairs(DT.Checklist:GetEntries()) do
        if e.pinned then out[#out + 1] = e end
    end
    table.sort(out, function(a, b)
        local ra, rb = STATUS_RANK[a.status] or 9, STATUS_RANK[b.status] or 9
        if ra ~= rb then return ra < rb end
        return (a.title or "") < (b.title or "")
    end)
    return out
end

-- ---------------------------------------------------------------------------
-- Render: rebuild the row list from the current pins.
-- ---------------------------------------------------------------------------
local function render()
    if not panel then return end
    releaseAllRows()
    local content = panel.content
    local pinned = gatherPinned()

    panel.count:SetText(#pinned > 0 and ("|cff808080" .. #pinned .. "|r") or "")

    if #pinned == 0 then
        panel.empty:Show()
        content:SetHeight(10)
        return
    end
    panel.empty:Hide()

    local y = 0
    for _, e in ipairs(pinned) do
        local row = acquireRow(content)
        row.entry = e
        row:SetPoint("TOPLEFT", 0, -y)
        row:SetPoint("TOPRIGHT", 0, -y)

        local c = DT.COLORS[e.status] or DT.COLORS[DT.STATUS.UNKNOWN]
        row.dot:SetColorTexture(c[1], c[2], c[3], 1)
        row.title:SetText(e.title or ("Quest " .. (e.questID or "?")))
        row.title:SetTextColor(0.92, 0.92, 0.90)

        local label = DT.STATUS_LABEL[e.status] or ""
        local zone = e.zoneName or ""
        local sub = label
        if zone ~= "" then sub = (label ~= "" and (label .. "  |cff606060•|r  ") or "") .. zone end
        row.sub:SetText(sub)
        row.sub:SetTextColor(c[1] * 0.9, c[2] * 0.9, c[3] * 0.9)

        activeRows[#activeRows + 1] = row
        y = y + ROW_HEIGHT
    end
    content:SetHeight(math.max(y, 10))
end

-- ---------------------------------------------------------------------------
-- Panel frame creation. Docked to the LEFT edge of the main tracker window.
-- ---------------------------------------------------------------------------
local function createPanel()
    local host = _G["QuestTallyFrame"]
    if not host then return nil end

    local skin = DT.UI and DT.UI.Skin
    local THEME = skin and skin.THEME
    local panelBg   = (THEME and THEME.panelBg)   or { 0.06, 0.07, 0.09, 0.98 }
    local panelEdge = (THEME and THEME.panelEdge) or { 0.16, 0.17, 0.21, 1.00 }
    local accentCol = { 0.93, 0.62, 0.28 }  -- amber, matching the pin marker

    local p = CreateFrame("Frame", "QuestTallyPinnedPanel", host, "BackdropTemplate")
    p:SetWidth(PANEL_WIDTH)
    -- Dock flush against the main frame's left edge (no overlap): a positive X
    -- offset here would push the panel's right edge INTO the window and draw its
    -- border over the list's left margin. 0 keeps the two borders adjacent.
    p:SetPoint("TOPRIGHT", host, "TOPLEFT", 0, 0)
    p:SetPoint("BOTTOMRIGHT", host, "BOTTOMLEFT", 0, 0)
    p:SetFrameStrata("MEDIUM")
    p:EnableMouse(true)

    if p.SetBackdrop then
        p:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8X8",
            edgeFile = "Interface\\Buttons\\WHITE8X8",
            edgeSize = 1,
        })
        p:SetBackdropColor(panelBg[1], panelBg[2], panelBg[3], panelBg[4] or 1)
        p:SetBackdropBorderColor(panelEdge[1], panelEdge[2], panelEdge[3], panelEdge[4] or 1)
    end

    p.accent = p:CreateTexture(nil, "ARTWORK")
    p.accent:SetTexture("Interface\\Buttons\\WHITE8X8")
    p.accent:SetPoint("TOPLEFT", 1, -1)
    p.accent:SetPoint("TOPRIGHT", -1, -1)
    p.accent:SetHeight(2)
    p.accent:SetColorTexture(accentCol[1], accentCol[2], accentCol[3], 0.9)

    p.close = (skin and skin.CreateCloseButton and skin.CreateCloseButton(p))
        or CreateFrame("Button", nil, p, "UIPanelCloseButton")
    p.close:SetPoint("TOPRIGHT", -4, -4)
    p.close:SetScript("OnClick", function() DT.Pinned:Hide() end)

    p.title = p:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    p.title:SetPoint("TOPLEFT", LINE_PAD, -14)
    p.title:SetText("Pinned")

    p.count = p:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    p.count:SetPoint("LEFT", p.title, "RIGHT", 6, 0)

    p.divider = p:CreateTexture(nil, "ARTWORK")
    p.divider:SetColorTexture(accentCol[1], accentCol[2], accentCol[3], 0.28)
    p.divider:SetHeight(1)
    p.divider:SetPoint("TOPLEFT", p, "TOPLEFT", LINE_PAD, -38)
    p.divider:SetPoint("TOPRIGHT", p, "TOPRIGHT", -LINE_PAD, -38)

    -- Empty-state hint, shown when nothing is pinned.
    p.empty = p:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    p.empty:SetPoint("TOPLEFT", p.divider, "BOTTOMLEFT", 0, -12)
    p.empty:SetPoint("TOPRIGHT", p.divider, "BOTTOMRIGHT", 0, -12)
    p.empty:SetJustifyH("LEFT")
    p.empty:SetText("No pinned quests yet.\n\nMiddle-click any quest in the list to pin it here.")
    p.empty:SetTextColor(0.6, 0.6, 0.62)

    local scroll, content
    if skin and skin.CreateScrollFrame then
        scroll, content = skin.CreateScrollFrame(p, PANEL_WIDTH - (LINE_PAD * 2))
        scroll:SetPoint("TOPLEFT", p.divider, "BOTTOMLEFT", 0, -8)
        scroll:SetPoint("BOTTOMRIGHT", -20, 16)
    else
        scroll = CreateFrame("ScrollFrame", "QuestTallyPinnedScroll", p, "UIPanelScrollFrameTemplate")
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
function DT.Pinned:Show()
    -- Never paint over the collapsed logo chip (see DT.Details:Show).
    if DT.UI and DT.UI.IsCollapsed and DT.UI:IsCollapsed() then return end
    if not panel then panel = createPanel() end
    if not panel then return end
    panel:Show()
    render()
end

function DT.Pinned:Hide()
    if panel then panel:Hide() end
end

function DT.Pinned:IsShown()
    return panel and panel:IsShown()
end

function DT.Pinned:Toggle()
    if self:IsShown() then self:Hide() else self:Show() end
end

-- Rebuild the list if the panel is open (called when pins change or the tracker
-- refreshes). No-op when hidden, so it's cheap to call liberally.
function DT.Pinned:Refresh()
    if panel and panel:IsShown() then render() end
end
