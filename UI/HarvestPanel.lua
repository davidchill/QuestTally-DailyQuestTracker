-- HarvestPanel.lua
-- A small button panel for the harvester, so you don't have to memorize the
-- /qt harvest subcommands. This is a DEVELOPER tool: it drives the first-party
-- crawls that generate the data shipped in the addon. End users don't need it.
--
-- Buttons map 1:1 to DT.Harvester methods. A throttled OnUpdate polls
-- DT.Harvester:GetProgress() so the status line stays live during a crawl
-- without spamming chat.
local addonName, DT = ...

DT.HarvestPanel = {}
local P = DT.HarvestPanel

local PANEL_W, PANEL_H = 340, 380
local panel  -- created lazily

-- Confirm before a full scan, since it's a long unattended run.
StaticPopupDialogs["QUESTTALLY_FULLSCAN"] = {
    text = "Run a full scan of all quest ids (1-%d)?\n\nThis takes roughly %d minutes and runs on its own -- you can leave it going. Progress saves as it works.",
    button1 = YES,
    button2 = NO,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    preferredIndex = 3,
    OnAccept = function()
        DT.Harvester:StartFullScan()
        if DT.HarvestPanel then DT.HarvestPanel:Refresh() end
    end,
}

-- ---------------------------------------------------------------------------
-- Live status text + button enable/disable based on whether a crawl is running.
-- ---------------------------------------------------------------------------
local function describeProgress(pr)
    if pr.active then
        local pct = pr.total > 0 and math.floor((pr.done / pr.total) * 100) or 0
        if pr.mode == "discover" then
            return string.format(
                "|cffffd100Discovering|r  %d/%d (%d%%)\n"
                .. "|cff66cc66%d dailies|r + |cff66ccff%d world quests|r, %d baked\n"
                .. "%d in flight, %d queued",
                pr.done, pr.total, pct, pr.matched, pr.worldquests or 0, pr.captured, pr.pending, pr.queued)
        end
        return string.format(
            "|cffffd100Enriching|r  %d/%d (%d%%)\n"
            .. "|cff66cc66%d enriched|r, %d empty\n"
            .. "%d in flight, %d queued",
            pr.done, pr.total, pct, pr.captured, pr.skipped, pr.pending, pr.queued)
    end
    -- Idle: show the data we currently hold.
    local learned = DT.DB and DT.DB.GetLearnedCount and DT.DB:GetLearnedCount() or 0
    local baked = DT.DB and DT.DB.GetHarvestedCount and DT.DB:GetHarvestedCount() or 0
    return string.format("|cff999999Idle.|r\n%d dailies known, |cff66cc66%d with baked rewards|r.",
        learned, baked)
end

local function refresh()
    if not panel or not panel:IsShown() then return end
    local pr = DT.Harvester:GetProgress()
    panel.status:SetText(describeProgress(pr))

    -- While a crawl runs, only Stop is usable; otherwise the launchers are.
    local running = pr.active
    panel.fullBtn:SetEnabled(not running)
    panel.scanBtn:SetEnabled(not running)
    panel.enrichBtn:SetEnabled(not running)
    panel.sweepBtn:SetEnabled(not running)
    panel.exportBtn:SetEnabled(not running)
    panel.stopBtn:SetEnabled(running)
end
P.Refresh = refresh

-- ---------------------------------------------------------------------------
-- Small widget helpers
-- ---------------------------------------------------------------------------
local function makeButton(parent, text, width, onClick)
    local b = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
    b:SetSize(width, 22)
    b:SetText(text)
    b:SetScript("OnClick", onClick)
    return b
end

local function makeNumBox(parent, width, default)
    local e = CreateFrame("EditBox", nil, parent, "InputBoxTemplate")
    e:SetSize(width, 20)
    e:SetAutoFocus(false)
    e:SetNumeric(true)
    e:SetMaxLetters(7)
    e:SetText(tostring(default))
    e:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
    e:SetScript("OnEnterPressed", function(self) self:ClearFocus() end)
    return e
end

-- ---------------------------------------------------------------------------
-- Frame creation
-- ---------------------------------------------------------------------------
local function create()
    local f = CreateFrame("Frame", "QuestTallyHarvestPanel", UIParent, "BackdropTemplate")
    f:SetSize(PANEL_W, PANEL_H)
    f:SetPoint("CENTER", 200, 0)
    f:SetFrameStrata("HIGH")
    f:SetClampedToScreen(true)
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", f.StopMovingOrSizing)

    if f.SetBackdrop then
        f:SetBackdrop({
            bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark",
            edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
            tile = true, tileSize = 32, edgeSize = 32,
            insets = { left = 8, right = 8, top = 8, bottom = 8 },
        })
    end

    f.title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    f.title:SetPoint("TOP", 0, -14)
    f.title:SetText("QuestTally Harvester")

    f.sub = f:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    f.sub:SetPoint("TOP", f.title, "BOTTOM", 0, -3)
    f.sub:SetText("developer tool \226\128\148 generates shippable data")

    f.close = CreateFrame("Button", nil, f, "UIPanelCloseButton")
    f.close:SetPoint("TOPRIGHT", -4, -4)
    f.close:SetScript("OnClick", function() P:Hide() end)

    -- --- Full scan (the one-button path) ---
    f.fullBtn = makeButton(f, "Full Scan (all expansions)", 308, function()
        local maxID, mins = DT.Harvester:GetFullScanInfo()
        StaticPopup_Show("QUESTTALLY_FULLSCAN", maxID, mins)
    end)
    f.fullBtn:SetPoint("TOPLEFT", 16, -52)

    -- --- Discover row: From / To + Scan (custom range, optional) ---
    f.discoverLabel = f:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    f.discoverLabel:SetPoint("TOPLEFT", 16, -84)
    f.discoverLabel:SetText("...or scan a custom id range:")

    local fromLbl = f:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    fromLbl:SetPoint("TOPLEFT", 16, -104)
    fromLbl:SetText("From")
    f.fromBox = makeNumBox(f, 56, 1)
    f.fromBox:SetPoint("LEFT", fromLbl, "RIGHT", 8, 0)

    local toLbl = f:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    toLbl:SetPoint("LEFT", f.fromBox, "RIGHT", 12, 0)
    toLbl:SetText("To")
    f.toBox = makeNumBox(f, 56, 25000)
    f.toBox:SetPoint("LEFT", toLbl, "RIGHT", 8, 0)

    f.scanBtn = makeButton(f, "Scan", 56, function()
        local from = tonumber(f.fromBox:GetText())
        local to = tonumber(f.toBox:GetText())
        DT.Harvester:StartRange(from, to)
        refresh()
    end)
    f.scanBtn:SetPoint("LEFT", f.toBox, "RIGHT", 12, 0)

    -- --- Action buttons ---
    f.enrichBtn = makeButton(f, "Enrich Known", 150, function()
        DT.Harvester:Start(); refresh()
    end)
    f.enrichBtn:SetPoint("TOPLEFT", 16, -138)

    f.sweepBtn = makeButton(f, "Sweep World Quests", 150, function()
        local n, err = DT.Harvester:SweepWorldQuests()
        if err then print("|cff33ff99QuestTally|r: " .. err) end
        refresh()
    end)
    f.sweepBtn:SetPoint("LEFT", f.enrichBtn, "RIGHT", 8, 0)

    f.stopBtn = makeButton(f, "Stop", 150, function()
        DT.Harvester:Stop(); refresh()
    end)
    f.stopBtn:SetPoint("TOPLEFT", 16, -164)

    f.exportBtn = makeButton(f, "Export Lua", 150, function()
        DT.Harvester:Export()
    end)
    f.exportBtn:SetPoint("LEFT", f.stopBtn, "RIGHT", 8, 0)

    -- --- Status box ---
    f.statusBg = f:CreateTexture(nil, "BACKGROUND")
    f.statusBg:SetColorTexture(0, 0, 0, 0.30)
    f.statusBg:SetPoint("TOPLEFT", 16, -196)
    f.statusBg:SetPoint("BOTTOMRIGHT", -16, 46)

    f.status = f:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    f.status:SetPoint("TOPLEFT", f.statusBg, "TOPLEFT", 8, -8)
    f.status:SetPoint("BOTTOMRIGHT", f.statusBg, "BOTTOMRIGHT", -8, 8)
    f.status:SetJustifyH("LEFT")
    f.status:SetJustifyV("TOP")

    f.hint = f:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    f.hint:SetPoint("BOTTOMLEFT", 16, 16)
    f.hint:SetPoint("BOTTOMRIGHT", -16, 16)
    f.hint:SetJustifyH("LEFT")
    f.hint:SetText("Full Scan runs unattended (~30-130 min). Run it on a Horde and an Alliance max-level char for full coverage.")

    -- Throttled live refresh while shown.
    f.elapsed = 0
    f:SetScript("OnUpdate", function(self, dt)
        self.elapsed = self.elapsed + dt
        if self.elapsed >= 0.25 then
            self.elapsed = 0
            refresh()
        end
    end)

    return f
end

-- ---------------------------------------------------------------------------
-- Public API
-- ---------------------------------------------------------------------------
function P:Show()
    if not panel then panel = create() end
    panel:Show()
    refresh()
end

function P:Hide()
    if panel then panel:Hide() end
end

function P:Toggle()
    if not panel then panel = create() end
    if panel:IsShown() then self:Hide() else self:Show() end
end

function P:IsShown()
    return panel and panel:IsShown()
end
