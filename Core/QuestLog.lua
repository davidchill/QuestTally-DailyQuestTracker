-- QuestLog.lua
-- The "brain": reads live game state and produces a unified list of daily-quest
-- entries for the UI. Nothing here caches stale data -- every call re-reads the
-- real quest log and completion flags.
local addonName, DT = ...

DT.QuestLog = {}

local STATUS = DT.STATUS

-- Resolve the live status of a single quest ID.
-- `inLog` / `logInfo` are passed in when we already scanned the log, to avoid
-- redundant API calls; they're optional.
local function resolveStatus(questID, inLog)
    if inLog then
        -- ReadyForTurnIn covers the "go hand it in" case; IsComplete covers
        -- objectives-done on clients/quests where ReadyForTurnIn isn't set yet.
        if C_QuestLog.ReadyForTurnIn and C_QuestLog.ReadyForTurnIn(questID) then
            return STATUS.READY_TURNIN
        end
        if C_QuestLog.IsComplete and C_QuestLog.IsComplete(questID) then
            return STATUS.READY_TURNIN
        end
        return STATUS.IN_PROGRESS
    end

    -- Not in the log: either done today (flagged) or available to pick up.
    if C_QuestLog.IsQuestFlaggedCompleted(questID) then
        return STATUS.COMPLETED
    end
    return STATUS.AVAILABLE
end

-- Build one entry table the UI can render.
local function makeEntry(questID, title, status, expansionKey, fromCatalog)
    local catInfo = DT.QuestData:GetInfo(questID)
    return {
        questID    = questID,
        title      = title or (catInfo and catInfo.name) or ("Quest " .. questID),
        status     = status,
        expansion  = expansionKey or DT.QuestData:GetExpansionForQuest(questID),
        zone       = catInfo and catInfo.zone or nil,
        faction    = catInfo and catInfo.faction or nil,
        pinned     = DT.DB:IsPinned(questID),
        fromCatalog= fromCatalog or false,
    }
end

-- Scan the player's quest log for daily-frequency quests.
-- Returns a map of questID -> entry, so the caller can merge with the catalog.
-- Side effect: every daily we see is recorded into the account-wide learned DB
-- with its real quest ID, so it can be tracked later even when not in the log.
local function scanLogDailies()
    local found = {}
    local now = GetServerTime and GetServerTime() or (time and time()) or nil
    local playerFaction = UnitFactionGroup and UnitFactionGroup("player") or nil

    local numEntries = C_QuestLog.GetNumQuestLogEntries()
    for i = 1, numEntries do
        local info = C_QuestLog.GetInfo(i)
        if info and not info.isHeader and info.questID and info.questID > 0 then
            -- Enum.QuestFrequency.Daily == 1, .Weekly == 2 on modern clients.
            local isDaily = info.frequency == Enum.QuestFrequency.Daily
            if isDaily then
                local status = resolveStatus(info.questID, true)
                found[info.questID] = makeEntry(info.questID, info.title, status, nil, false)

                -- Learn it: capture the real ID + best-known name/faction/zone.
                local mapID = C_QuestLog.GetQuestUiMapID and C_QuestLog.GetQuestUiMapID(info.questID) or nil
                DT.DB:LearnDaily(info.questID, info.title, playerFaction,
                                 (mapID and mapID > 0) and mapID or nil, now)
            end
        end
    end
    return found
end

-- Public: resolve the live status of a single quest ID, checking the log for
-- whether it's currently accepted. Used by the checklist engine.
function DT.QuestLog:GetStatus(questID)
    if not questID then return DT.STATUS.UNKNOWN end
    local inLog = C_QuestLog.GetLogIndexForQuestID
        and C_QuestLog.GetLogIndexForQuestID(questID) ~= nil
    return resolveStatus(questID, inLog)
end

-- Learn dailies a quest giver is OFFERING or that are active on it, the moment
-- the player opens its gossip window -- no need to accept. Called on GOSSIP_SHOW.
-- The player's current map is used as the quest's zone (the giver's location).
function DT.QuestLog:ScanGossip()
    if not C_GossipInfo then return false end
    local now = GetServerTime and GetServerTime() or nil
    local faction = UnitFactionGroup and UnitFactionGroup("player") or nil
    local mapID = (C_Map and C_Map.GetBestMapForUnit) and C_Map.GetBestMapForUnit("player") or nil
    local learnedNew = false

    local function consider(q)
        if q and q.questID and q.questID > 0
        and q.frequency == Enum.QuestFrequency.Daily then
            if DT.DB:LearnDaily(q.questID, q.title, faction, mapID, now) then
                learnedNew = true
            end
        end
    end

    if C_GossipInfo.GetAvailableQuests then
        for _, q in ipairs(C_GossipInfo.GetAvailableQuests()) do consider(q) end
    end
    if C_GossipInfo.GetActiveQuests then
        for _, q in ipairs(C_GossipInfo.GetActiveQuests()) do consider(q) end
    end
    return learnedNew
end

-- Learn a daily from the quest detail page (the "accept/decline" screen),
-- before accepting. QuestIsDaily()/GetQuestID() are valid during QUEST_DETAIL.
function DT.QuestLog:ScanQuestDetail()
    local qID = GetQuestID and GetQuestID() or nil
    if not qID or qID == 0 then return false end
    if QuestIsDaily and QuestIsDaily() then
        local now = GetServerTime and GetServerTime() or nil
        local faction = UnitFactionGroup and UnitFactionGroup("player") or nil
        local mapID = (C_Map and C_Map.GetBestMapForUnit) and C_Map.GetBestMapForUnit("player") or nil
        return DT.DB:LearnDaily(qID, GetTitleText and GetTitleText() or nil, faction, mapID, now)
    end
    return false
end

-- Public: returns a flat array of entries combining:
--   1. Daily quests currently in the player's log (live).
--   2. Cataloged dailies NOT in the log (available or done-today).
-- The UI handles grouping/sorting.
function DT.QuestLog:GetEntries()
    local byID = scanLogDailies()

    -- Add cataloged dailies the player hasn't accepted, so they show as
    -- Available or Done Today even when not in the log.
    DT.QuestData:ForEach(function(questID, info, expKey)
        if not byID[questID] then
            local status = resolveStatus(questID, false)
            byID[questID] = makeEntry(questID, info.name, status, expKey, true)
        end
    end)

    -- Add auto-learned dailies (seen in a past session) not currently in the log,
    -- so they show as Available or Done Today. Catalog entries win if both exist.
    DT.DB:ForEachLearned(function(questID, info)
        if not byID[questID] then
            local status = resolveStatus(questID, false)
            local entry = makeEntry(questID, info.name, status, nil, false)
            entry.faction = entry.faction or info.faction
            byID[questID] = entry
        end
    end)

    local list = {}
    for _, entry in pairs(byID) do
        list[#list + 1] = entry
    end
    return list
end

-- Public: seconds until the next daily reset (or nil if unavailable).
function DT.QuestLog:GetSecondsUntilReset()
    if C_DateAndTime and C_DateAndTime.GetSecondsUntilDailyReset then
        return C_DateAndTime.GetSecondsUntilDailyReset()
    end
    if GetQuestResetTime then
        return GetQuestResetTime()
    end
    return nil
end

-- Public: format a seconds value as "Hh Mm".
function DT.QuestLog:FormatDuration(seconds)
    if not seconds or seconds < 0 then return "?" end
    local h = math.floor(seconds / 3600)
    local m = math.floor((seconds % 3600) / 60)
    return string.format("%dh %02dm", h, m)
end

-- Public: counts by status for a quick summary line.
function DT.QuestLog:Summarize(entries)
    local counts = { total = 0 }
    for _, e in ipairs(entries) do
        counts.total = counts.total + 1
        counts[e.status] = (counts[e.status] or 0) + 1
    end
    return counts
end
