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
        -- Keep the optional TitanPanel bar in lockstep with the tracker; both
        -- read the same checklist data, so they refresh from the same trigger.
        -- No-ops cleanly if Titan isn't installed/registered.
        if DT.Titan and DT.Titan.Update then
            DT.Titan:Update()
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
    print("  |cffffd100/qt harvest|r    - open the harvester panel (buttons for everything)")
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
    print(string.format("   harvested: %d dailies have baked rewards/details.",
        DT.DB:GetHarvestedCount()))
    print("Discovery grows automatically as you pick up dailies in-game.")
end

local function printHarvestHelp()
    print("|cff33ff99QuestTally|r harvest -- bake quest data first-party from your client:")
    print("  |cffffd100/qt harvest full|r - one-button scan of every quest id (dailies + world quests)")
    print("  |cffffd100/qt harvest discover [from] [to]|r - scan a custom id range (dev)")
    print("  |cffffd100/qt harvest start|r  - enrich all known dailies (title/rewards/objectives)")
    print("  |cffffd100/qt harvest sweep|r  - learn active world quests on known maps")
    print("  |cffffd100/qt harvest status|r - progress of a running harvest")
    print("  |cffffd100/qt harvest stop|r   - cancel a running harvest")
    print("  |cffffd100/qt harvest export|r - open a copy box with ship-ready Lua")
end

-- Handle the `/qt harvest ...` subcommands. `rest` is the text after "harvest";
-- it may carry its own arguments (e.g. "discover 1 5000").
local function handleHarvest(rest)
    local sub, args = (rest or ""):match("^(%S*)%s*(.-)$")

    -- Bare "/qt harvest" (or "panel") opens the button panel -- no commands to memorize.
    if sub == "" or sub == "panel" or sub == "tools" then
        if DT.HarvestPanel then DT.HarvestPanel:Toggle() end
        return
    end

    if sub == "start" then
        DT.Harvester:Start()
    elseif sub == "full" or sub == "fullscan" then
        DT.Harvester:StartFullScan()
    elseif sub == "discover" or sub == "range" then
        local from, to = args:match("^(%d*)%s*(%d*)$")
        if not (tonumber(from) and tonumber(to)) then
            print("|cff33ff99QuestTally|r: give an id range to scan, in chunks, e.g.")
            print("  |cffffd100/qt harvest discover 1 25000|r   (then 25001 50000, etc.)")
            print("  Retail quest ids run from 1 to ~95000. Scan ~25k at a time.")
            return
        end
        DT.Harvester:StartRange(tonumber(from), tonumber(to))
    elseif sub == "stop" or sub == "cancel" then
        DT.Harvester:Stop()
    elseif sub == "status" then
        DT.Harvester:Status()
    elseif sub == "sweep" then
        local n, err = DT.Harvester:SweepWorldQuests()
        if err then
            print("|cff33ff99QuestTally|r: " .. err)
        else
            print(string.format("|cff33ff99QuestTally|r: world-quest sweep learned %d new quests.", n or 0))
        end
    elseif sub == "export" then
        DT.Harvester:Export()
    else
        printHarvestHelp()
    end
end

SlashCmdList["QUESTTALLY"] = function(msg)
    local full = strtrim((msg or ""):lower())
    -- Split into first word + remainder so multi-word commands ("harvest start")
    -- dispatch on the verb while keeping their argument.
    local cmd, rest = full:match("^(%S*)%s*(.-)$")
    cmd = cmd or full

    if cmd == "harvest" then
        handleHarvest(rest)
        return
    end

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
