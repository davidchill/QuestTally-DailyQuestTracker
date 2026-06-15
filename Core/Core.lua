-- Core.lua
-- Bootstraps the addon: sets up the event handler, initializes the database,
-- registers slash commands, and tells the UI when to refresh.
local addonName, DT = ...

-- A hidden frame is the standard way an addon listens for game events.
local eventFrame = CreateFrame("Frame")

-- Events that mean "the daily-quest picture may have changed" -> refresh the UI.
local REFRESH_EVENTS = {
    "QUEST_LOG_UPDATE",
    "QUEST_TURNED_IN",
    "QUEST_ACCEPTED",
    "QUEST_REMOVED",
    "UNIT_QUEST_LOG_CHANGED",
    "ZONE_CHANGED_NEW_AREA",  -- player moved to a new zone (Current Zone view)
    "ZONE_CHANGED",
}

-- Events where we actively discover daily IDs by interacting with a quest giver
-- (talking to it / viewing a quest), so dailies are learned without accepting.
local DISCOVERY_EVENTS = {
    "GOSSIP_SHOW",
    "QUEST_DETAIL",
}

-- Throttle: many of the above can fire in bursts. We coalesce refreshes so the
-- UI rebuilds at most a few times per second instead of dozens.
local refreshPending = false
local function requestRefresh()
    if refreshPending then return end
    refreshPending = true
    C_Timer.After(0.2, function()
        refreshPending = false
        if DT.UI and DT.UI.Refresh then
            DT.UI:Refresh()
        end
    end)
end
DT.RequestRefresh = requestRefresh

local function onAddonLoaded()
    DT.DB:Initialize()

    -- Now that saved vars exist, register the live-data events.
    for _, event in ipairs(REFRESH_EVENTS) do
        eventFrame:RegisterEvent(event)
    end
    for _, event in ipairs(DISCOVERY_EVENTS) do
        eventFrame:RegisterEvent(event)
    end

    print(string.format("|cff33ff99%s|r v%s loaded. Type |cffffd100/qt|r to open.",
        "QuestTally", DT.VERSION))
end

eventFrame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" then
        if arg1 == addonName then
            onAddonLoaded()
            self:UnregisterEvent("ADDON_LOADED")
        end
        return
    end

    if event == "PLAYER_LOGIN" then
        -- UI is created lazily on first open; nothing required here yet.
        return
    end

    -- Interaction-based discovery: learn dailies without accepting them.
    if event == "GOSSIP_SHOW" then
        DT.QuestLog:ScanGossip()
        requestRefresh()
        return
    end
    if event == "QUEST_DETAIL" then
        DT.QuestLog:ScanQuestDetail()
        requestRefresh()
        return
    end

    -- Any of the REFRESH_EVENTS: refresh the list if the window is up.
    requestRefresh()
end)

eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("PLAYER_LOGIN")

-- ---------------------------------------------------------------------------
-- Slash commands: /qt and /dailies
-- ---------------------------------------------------------------------------
SLASH_QUESTTALLY1 = "/qt"
SLASH_QUESTTALLY2 = "/dailies"
SLASH_QUESTTALLY3 = "/questtally"

local function printHelp()
    print("|cff33ff99QuestTally|r commands:")
    print("  |cffffd100/qt|r            - toggle the tracker window")
    print("  |cffffd100/qt show|r       - open the window")
    print("  |cffffd100/qt hide|r       - close the window")
    print("  |cffffd100/qt reset|r      - reset window position")
    print("  |cffffd100/qt stats|r      - checklist & discovery summary")
    print("  |cffffd100/qt help|r       - show this help")
    print("  aliases: |cffffd100/questtally|r, |cffffd100/dailies|r")
end

local function printStats()
    local s = DT.Checklist:GetStats()
    print(string.format("|cff33ff99QuestTally|r: |cffffd100%d|r checklist quests, "
        .. "|cff66cc66%d discovered|r (IDs learned), %d done today.",
        s.total, s.discovered, s.completed))
    -- Per-expansion breakdown, newest-known first via the Constants order.
    for i = #DT.EXPANSIONS, 1, -1 do
        local exp = DT.EXPANSIONS[i]
        local b = s.byExpansion[exp.key]
        if b then
            print(string.format("   %s: %d/%d discovered", exp.name, b.discovered, b.total))
        end
    end
    print("Discovery grows automatically as you pick up dailies in-game.")
end

SlashCmdList["QUESTTALLY"] = function(msg)
    local cmd = strtrim((msg or ""):lower())

    if cmd == "" or cmd == "toggle" then
        if DT.UI and DT.UI.Toggle then DT.UI:Toggle() end
    elseif cmd == "show" or cmd == "open" then
        if DT.UI and DT.UI.Show then DT.UI:Show() end
    elseif cmd == "hide" or cmd == "close" then
        if DT.UI and DT.UI.Hide then DT.UI:Hide() end
    elseif cmd == "reset" then
        DT.DB.account.framePosition = nil
        if DT.UI and DT.UI.ResetPosition then DT.UI:ResetPosition() end
        print("|cff33ff99QuestTally|r: window position reset.")
    elseif cmd == "stats" then
        printStats()
    else
        printHelp()
    end
end
