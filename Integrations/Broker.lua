-- Integrations/Broker.lua
-- Optional LibDataBroker feed + LibDBIcon minimap button.
--
-- Unlike the Titan plugin (Integrations/TitanPanel.lua, which talks to Titan
-- directly), this exposes a STANDARD LibDataBroker "data source" that ANY display
-- addon can show -- Bazooka, ChocolateBar, ElvUI datatexts, even Titan via its LDB
-- bridge -- plus a LibDBIcon minimap button for players who run none of those bars.
--
-- Everything here no-ops cleanly if the embedded libraries are somehow missing, so
-- the addon still loads. The broker reads the SAME checklist data as the tracker
-- window and the Titan bar, so all three can never disagree on the counts.
local addonName, DT = ...

DT.Broker = {}

local LibStub = _G.LibStub
local ldb  = LibStub and LibStub("LibDataBroker-1.1", true)
local icon = LibStub and LibStub("LibDBIcon-1.0", true)

local ICON = "Interface\\Icons\\INV_Misc_Note_01"
local dataObject

-- Same summary the tracker window and Titan bar render from.
local function getCounts()
    return DT.QuestLog:Summarize(DT.Checklist:GetEntries())
end

-- The status breakdown shown when a display addon (or the minimap button) is
-- hovered. `tt` is a GameTooltip the host hands us.
local function buildTooltip(tt)
    local c = getCounts()
    local total = c.total or 0
    local done  = c[DT.STATUS.COMPLETED] or 0
    tt:AddLine("QuestTally")
    tt:AddLine(" ")
    tt:AddDoubleLine("Ready to turn in", c[DT.STATUS.READY_TURNIN] or 0, 1, 1, 1, 0.46, 0.72, 0.46)
    tt:AddDoubleLine("In progress",      c[DT.STATUS.IN_PROGRESS]  or 0, 1, 1, 1, 0.42, 0.60, 0.78)
    tt:AddDoubleLine("Available",        c[DT.STATUS.AVAILABLE]    or 0, 1, 1, 1, 0.82, 0.68, 0.28)
    tt:AddDoubleLine("Done today",       done .. "/" .. total,           1, 1, 1, 0.60, 0.60, 0.62)
    tt:AddLine(" ")
    tt:AddDoubleLine("Next reset",
        DT.QuestLog:FormatDuration(DT.QuestLog:GetSecondsUntilReset()), 1, 1, 1, 0.70, 0.70, 0.72)
    local cur, best = DT.DB:GetStreak(DT.QuestLog:GetDailyPeriodId())
    tt:AddDoubleLine("Daily streak", cur .. " (best " .. best .. ")", 1, 1, 1, 0.93, 0.82, 0.40)
    tt:AddLine(" ")
    tt:AddLine("Left-click: toggle tracker", 0.5, 0.8, 1)
    tt:AddLine("Right-click: reset window position", 0.5, 0.8, 1)
end

local function onClick(_, button)
    if button == "RightButton" then
        if DT.UI and DT.UI.ResetPosition then DT.UI:ResetPosition() end
    else
        if DT.UI and DT.UI.Toggle then DT.UI:Toggle() end
    end
end

-- Public: refresh the broker's "done/total" text. Driven from Core's throttled
-- RequestRefresh, alongside the tracker and Titan bar. No-ops if LDB is absent.
function DT.Broker:Update()
    if not dataObject then return end
    local c = getCounts()
    dataObject.text = string.format("%d/%d", c[DT.STATUS.COMPLETED] or 0, c.total or 0)
end

-- Register once the player world is ready (so DT.DB is initialized and the live
-- counts are meaningful). The minimap button's saved position/hidden state lives
-- in DT.DB.account.minimap (see Database.lua defaults).
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()
    if not ldb then return end
    if not dataObject then
        dataObject = ldb:NewDataObject("QuestTally", {
            type    = "data source",
            text    = "0/0",
            icon    = ICON,
            label   = "QuestTally",
            OnClick = onClick,
            OnTooltipShow = buildTooltip,
        })
        if icon and DT.DB and DT.DB.account and DT.DB.account.minimap then
            icon:Register("QuestTally", dataObject, DT.DB.account.minimap)
        end
    end
    DT.Broker:Update()
end)
