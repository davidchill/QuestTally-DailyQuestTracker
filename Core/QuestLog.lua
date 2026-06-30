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

-- The daily-frequency enum value, resolved defensively (Daily == 1, Weekly == 2
-- on modern clients). Cached so the per-refresh scan below stays cheap.
local DAILY_FREQUENCY = Enum and Enum.QuestFrequency and Enum.QuestFrequency.Daily or 1

-- Passively learn every daily-frequency quest currently in the player's log into
-- the account-wide store, with its real quest ID and best-known name/faction/zone.
-- This catches dailies already sitting in the log (accepted before install, from
-- a quest item, or via a chain) that we never saw a gossip/detail page for. Pure
-- side-effect; called from Core on the throttled quest-log refresh.
function DT.QuestLog:ScanLogForLearning()
    if not (C_QuestLog and C_QuestLog.GetNumQuestLogEntries and C_QuestLog.GetInfo) then return end
    local now = GetServerTime and GetServerTime() or (time and time()) or nil
    local playerFaction = UnitFactionGroup and UnitFactionGroup("player") or nil

    local numEntries = C_QuestLog.GetNumQuestLogEntries()
    for i = 1, numEntries do
        local info = C_QuestLog.GetInfo(i)
        if info and not info.isHeader and info.questID and info.questID > 0
        and info.frequency == DAILY_FREQUENCY then
            local mapID = C_QuestLog.GetQuestUiMapID and C_QuestLog.GetQuestUiMapID(info.questID) or nil
            DT.DB:LearnDaily(info.questID, info.title, playerFaction,
                             (mapID and mapID > 0) and mapID or nil, now)
        end
    end
end

-- Public: resolve the live status of a single quest ID, checking the log for
-- whether it's currently accepted. Used by the checklist engine.
function DT.QuestLog:GetStatus(questID)
    if not questID then return DT.STATUS.UNKNOWN end
    local inLog = C_QuestLog.GetLogIndexForQuestID
        and C_QuestLog.GetLogIndexForQuestID(questID) ~= nil
    return resolveStatus(questID, inLog)
end

-- Status for a WORLD QUEST. Unlike a hub daily, a world quest only counts as
-- "available" while it's actively up in the world rotation; the catalog lists
-- every WQ that exists, so the ones not currently up are marked INACTIVE rather
-- than falsely shown as available.
function DT.QuestLog:GetWorldQuestStatus(questID)
    if not questID then return DT.STATUS.UNKNOWN end
    if C_QuestLog.IsQuestFlaggedCompleted and C_QuestLog.IsQuestFlaggedCompleted(questID) then
        return DT.STATUS.COMPLETED
    end
    local inLog = C_QuestLog.GetLogIndexForQuestID
        and C_QuestLog.GetLogIndexForQuestID(questID) ~= nil
    if inLog then return resolveStatus(questID, true) end
    if C_TaskQuest and C_TaskQuest.IsActive and C_TaskQuest.IsActive(questID) then
        return DT.STATUS.AVAILABLE
    end
    return DT.STATUS.INACTIVE
end

-- Capture the NPC the player is interacting with (the "npc" unit is valid during
-- GOSSIP_SHOW / QUEST_DETAIL) plus the player's position, which -- since you're
-- standing at the giver -- is the giver's location. Returns name, mapID, x, y.
local function captureGiver()
    local name
    if UnitExists then
        if UnitExists("npc") then name = UnitName("npc")
        elseif UnitExists("target") then name = UnitName("target") end
    end
    local mapID = (C_Map and C_Map.GetBestMapForUnit) and C_Map.GetBestMapForUnit("player") or nil
    local x, y
    if mapID and C_Map.GetPlayerMapPosition then
        local pos = C_Map.GetPlayerMapPosition(mapID, "player")
        if pos then x, y = pos:GetXY() end
    end
    return name, mapID, x, y
end

-- Learn dailies a quest giver is OFFERING or that are active on it, the moment
-- the player opens its gossip window -- no need to accept. Called on GOSSIP_SHOW.
-- The player's current map is used as the quest's zone (the giver's location).
function DT.QuestLog:ScanGossip()
    if not C_GossipInfo then return false end
    local now = GetServerTime and GetServerTime() or nil
    local faction = UnitFactionGroup and UnitFactionGroup("player") or nil
    local gName, gMap, gx, gy = captureGiver()
    local mapID = gMap
    local learnedNew = false

    local function consider(q)
        if q and q.questID and q.questID > 0
        and q.frequency == Enum.QuestFrequency.Daily then
            if DT.DB:LearnDaily(q.questID, q.title, faction, mapID, now) then
                learnedNew = true
            end
            DT.DB:SetQuestGiver(q.questID, gName, mapID, gx, gy)
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
        local gName, gMap, gx, gy = captureGiver()
        local res = DT.DB:LearnDaily(qID, GetTitleText and GetTitleText() or nil, faction, gMap, now)
        DT.DB:SetQuestGiver(qID, gName, gMap, gx, gy)
        -- Capture the quest-giver's flavor/description text. This is the only
        -- moment it's readable (GetQuestText is valid during QUEST_DETAIL); there
        -- is no per-questID getter, so we grab it opportunistically here.
        local desc = GetQuestText and GetQuestText() or nil
        if desc and desc ~= "" then
            DT.DB:SetQuestDetails(qID, { description = desc, harvested = now })
        end
        return res
    end
    return false
end

-- Set an on-screen/map waypoint to a quest giver location, so the player can
-- travel to pick the quest up. Takes a giver table { mapID, x, y } (from baked
-- data or live capture). Returns true if a waypoint was set.
function DT.QuestLog:SetGiverWaypoint(giver)
    if not giver or not giver.mapID or not giver.x or not giver.y then return false end
    if C_Map and C_Map.SetUserWaypoint and UiMapPoint and UiMapPoint.CreateFromCoordinates then
        C_Map.SetUserWaypoint(UiMapPoint.CreateFromCoordinates(giver.mapID, giver.x, giver.y))
        if C_SuperTrack and C_SuperTrack.SetSuperTrackedUserWaypoint then
            C_SuperTrack.SetSuperTrackedUserWaypoint(true)
        end
        return true
    end
    return false
end

-- Public: seconds until the next reset (or nil if unavailable). Pass freq="weekly"
-- for the weekly reset; anything else (or nil) returns the daily reset. Weeklies
-- and dailies are reset by the game itself -- we only read the countdown for display.
function DT.QuestLog:GetSecondsUntilReset(freq)
    if freq == "weekly" and C_DateAndTime and C_DateAndTime.GetSecondsUntilWeeklyReset then
        return C_DateAndTime.GetSecondsUntilWeeklyReset()
    end
    if C_DateAndTime and C_DateAndTime.GetSecondsUntilDailyReset then
        return C_DateAndTime.GetSecondsUntilDailyReset()
    end
    if GetQuestResetTime then
        return GetQuestResetTime()
    end
    return nil
end

-- Public: a stable id for the current daily-reset period -- an integer that bumps
-- by exactly 1 at each daily reset, without needing to know the reset hour. Built
-- from when the CURRENT period ends (now + seconds-until-reset) bucketed into days,
-- so two timestamps in the same daily window share an id and consecutive windows
-- differ by 1. Used to drive the daily-activity streak. Returns nil if time is
-- unavailable.
function DT.QuestLog:GetDailyPeriodId()
    local now = GetServerTime and GetServerTime() or (time and time()) or nil
    if not now then return nil end
    local untilReset = self:GetSecondsUntilReset() or 0
    return math.floor((now + untilReset) / 86400)
end

-- Public: format a seconds value as "Hh Mm".
function DT.QuestLog:FormatDuration(seconds)
    if not seconds or seconds < 0 then return "?" end
    local h = math.floor(seconds / 3600)
    local m = math.floor((seconds % 3600) / 60)
    return string.format("%dh %02dm", h, m)
end

-- Public: a live countdown string for the sub-bar's ticking timer. Far-out resets
-- read calm ("6h 32m" -- nothing meaningful changes second to second hours away);
-- once under an hour the seconds tick ("42m 09s"), and under a minute it's just
-- seconds. Distinct from FormatDuration (kept stable for the Titan/broker tooltips).
function DT.QuestLog:FormatCountdown(seconds)
    if not seconds or seconds < 0 then return "?" end
    local h = math.floor(seconds / 3600)
    local m = math.floor((seconds % 3600) / 60)
    local s = math.floor(seconds % 60)
    if h > 0 then return string.format("%dh %02dm", h, m) end
    if m > 0 then return string.format("%dm %02ds", m, s) end
    return string.format("%ds", s)
end

-- Public: compact objective progress for a quest currently in the log, or nil.
-- For a single-objective quest it's that objective's fulfilled/required ("12/20");
-- for a multi-objective quest it's the count of FINISHED objectives over the total
-- ("2/3"). Returns nil when the quest isn't accepted, has no countable objective
-- (a lone yes/no step), or exposes no objective data yet.
function DT.QuestLog:GetObjectiveProgress(questID)
    if not (questID and C_QuestLog and C_QuestLog.GetQuestObjectives) then return nil end
    -- Objective data is only populated while the quest is in the log.
    if not (C_QuestLog.GetLogIndexForQuestID and C_QuestLog.GetLogIndexForQuestID(questID)) then
        return nil
    end
    local objs = C_QuestLog.GetQuestObjectives(questID)
    if not objs or #objs == 0 then return nil end
    if #objs == 1 then
        local o = objs[1]
        local req = o.numRequired or 0
        if req > 1 then return (o.numFulfilled or 0) .. "/" .. req end
        return nil  -- single boolean objective: a fraction would be meaningless
    end
    local finished = 0
    for _, o in ipairs(objs) do if o.finished then finished = finished + 1 end end
    return finished .. "/" .. #objs
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
