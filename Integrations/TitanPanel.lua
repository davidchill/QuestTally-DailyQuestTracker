-- Integrations/TitanPanel.lua
-- Optional TitanPanel plugin. The whole file is a no-op unless TitanPanel is
-- installed and loaded, so the addon works perfectly fine standalone.
--
-- When Titan IS present, this registers a bar button that shows a live
-- "Dailies: done/total" summary, toggles the main window on left-click, and
-- shows a per-expansion breakdown in its tooltip.
--
-- Titan plugin design notes:
--   * Titan finds a plugin via a Button frame that inherits "TitanPanelComboTemplate"
--     and carries a `.registry` table describing the plugin.
--   * The registry references its text/tooltip builders BY GLOBAL NAME (strings),
--     so those functions must be globals -- that's why a few functions below are
--     declared without `local`.
local addonName, DT = ...

DT.Titan = {}

local PLUGIN_ID    = "QuestTally"
local BUTTON_NAME  = "TitanPanelQuestTallyButton"
local ICON         = "Interface\\Icons\\INV_Misc_Note_01"

local registered = false

-- True only when Titan's core API is actually present.
local function titanAvailable()
    return TitanPanelButton_OnLoad ~= nil and TitanUtils_GetButton ~= nil
end

-- Pull a fresh summary from the SAME source the tracker window renders from:
-- the checklist engine (master checklist + baked catalog + live-learned data).
-- Sharing DT.Checklist:GetEntries() with the main window guarantees the bar and
-- the tracker can never disagree about which dailies exist or their status.
local function getCounts()
    return DT.QuestLog:Summarize(DT.Checklist:GetEntries())
end

-- ---------------------------------------------------------------------------
-- Globals referenced by the registry (must be global, by Titan convention).
-- ---------------------------------------------------------------------------

-- The text shown on the Titan bar next to the icon.
-- Titan calls this as buttonTextFunction(id) and expects a display string.
function QuestTally_GetButtonText(id)
    local c = getCounts()
    local total = c.total or 0
    local done  = c[DT.STATUS.COMPLETED] or 0

    local label = "Dailies: "
    local value = done .. "/" .. total

    -- Use Titan's color helpers when available for the native look; fall back
    -- to plain text otherwise.
    if TitanUtils_GetHighlightText then
        return label, TitanUtils_GetHighlightText(value)
    end
    return label .. value
end

-- The tooltip body. Lines are separated by "\n"; within a line, "\t" splits the
-- left label from the right-aligned value (Titan renders these as two columns).
function QuestTally_GetTooltipText()
    local c = getCounts()
    local ready  = c[DT.STATUS.READY_TURNIN] or 0
    local prog   = c[DT.STATUS.IN_PROGRESS] or 0
    local avail  = c[DT.STATUS.AVAILABLE] or 0
    local done   = c[DT.STATUS.COMPLETED] or 0
    local unseen = c[DT.STATUS.UNDISCOVERED] or 0
    local total  = c.total or 0
    local discovered = total - unseen   -- dailies with a resolved (known) quest ID
    local reset = DT.QuestLog:FormatDuration(DT.QuestLog:GetSecondsUntilReset())
    local streakCur, streakBest = DT.DB:GetStreak(DT.QuestLog:GetDailyPeriodId())
    local streakText = streakCur .. " (best " .. streakBest .. ")"

    local lines = {
        "Ready to turn in\t" .. ready,
        "In progress\t" .. prog,
        "Available\t" .. avail,
        "Done today\t" .. done,
        "Not yet seen\t" .. unseen,
        " \t ",
        "Discovered\t" .. discovered .. "/" .. total,
        " \t ",
        "Next reset\t" .. reset,
        "Daily streak\t" .. streakText,
        " \t ",
        TitanUtils_GetGreenText and TitanUtils_GetGreenText("Left-click: open tracker")
            or "Left-click: open tracker",
        TitanUtils_GetGreenText and TitanUtils_GetGreenText("Right-click: options")
            or "Right-click: options",
    }
    return "\n" .. table.concat(lines, "\n")
end

-- Right-click options menu. Titan builds the menu by calling the function named
-- TitanPanelRightClickMenu_Prepare<ID>Menu.
function TitanPanelRightClickMenu_PrepareQuestTallyMenu()
    -- Title.
    if TitanPanelRightClickMenu_AddTitle then
        TitanPanelRightClickMenu_AddTitle("QuestTally")
    end

    -- Toggle the main window.
    local info = {}
    info.text = "Open / close tracker"
    info.notCheckable = true
    info.func = function() DT.UI:Toggle() end
    if UIDropDownMenu_AddButton then UIDropDownMenu_AddButton(info) end

    -- Standard Titan toggles (show icon / label / right-side).
    if TitanPanelRightClickMenu_AddToggleIcon then
        TitanPanelRightClickMenu_AddToggleIcon(PLUGIN_ID)
    end
    if TitanPanelRightClickMenu_AddToggleLabelText then
        TitanPanelRightClickMenu_AddToggleLabelText(PLUGIN_ID)
    end

    if TitanPanelRightClickMenu_AddSpacer then TitanPanelRightClickMenu_AddSpacer() end
    if TitanPanelRightClickMenu_AddCommand then
        TitanPanelRightClickMenu_AddCommand("Close menu", PLUGIN_ID, TITAN_PANEL_MENU_FUNC_HIDE)
    end
end

-- ---------------------------------------------------------------------------
-- Click handling
-- ---------------------------------------------------------------------------
local function onClick(self, button)
    if button == "LeftButton" then
        DT.UI:Toggle()
    else
        -- Let Titan show the right-click options menu.
        if TitanPanelButton_OnClick then
            TitanPanelButton_OnClick(self, button)
        end
    end
end

-- ---------------------------------------------------------------------------
-- Registration
-- ---------------------------------------------------------------------------
local function registerPlugin()
    if registered or not titanAvailable() then return end

    local button = CreateFrame("Button", BUTTON_NAME, UIParent, "TitanPanelComboTemplate")
    button:SetFrameStrata("FULLSCREEN")
    button:SetID(0)

    -- The registry table Titan reads to wire everything up.
    button.registry = {
        id = PLUGIN_ID,
        category = "Information",
        version = DT.VERSION,
        menuText = "QuestTally",
        buttonTextFunction = "QuestTally_GetButtonText",
        tooltipTitle = "QuestTally",
        tooltipTextFunction = "QuestTally_GetTooltipText",
        icon = ICON,
        iconWidth = 16,
        controlVariables = {
            ShowIcon      = true,
            ShowLabelText = true,
            DisplayOnRightSide = true,
        },
        savedVariables = {
            ShowIcon = 1,
            ShowLabelText = 1,
            DisplayOnRightSide = false,
        },
    }

    button:SetScript("OnClick", onClick)
    button:RegisterForClicks("LeftButtonUp", "RightButtonUp")

    -- This is the standard combo-template load path: it adds the plugin to
    -- Titan's registry and makes it selectable from Titan's menu.
    TitanPanelButton_OnLoad(button)

    DT.Titan.button = button
    registered = true
end

-- Public: refresh the bar text/value. Safe to call anytime; no-ops if Titan
-- isn't loaded or the plugin isn't registered/shown yet.
function DT.Titan:Update()
    if not registered then return end
    if TitanPanelButton_UpdateButton then
        TitanPanelButton_UpdateButton(PLUGIN_ID)
    end
end

-- ---------------------------------------------------------------------------
-- Lifecycle: register the plugin once Titan and the player world are ready.
-- After that, bar refreshes are driven by Core's RequestRefresh (the same
-- throttled trigger that refreshes the tracker window), so the bar and the
-- tracker always update together -- including on quest-giver discovery, which
-- this plugin would otherwise miss. We only need PLAYER_ENTERING_WORLD here.
-- ---------------------------------------------------------------------------
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function()
    registerPlugin()
    DT.Titan:Update()
end)
