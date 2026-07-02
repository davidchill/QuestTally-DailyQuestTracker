-- Database.lua
-- Thin wrapper around the SavedVariables tables declared in the .toc.
-- QuestTallyDB        -> account-wide (settings shared across all characters)
-- QuestTallyCharDB    -> per-character (this character's tracking state)
--
-- We never touch the global tables directly elsewhere; everything goes through
-- DT.DB so defaults and migrations live in one place.
local addonName, DT = ...

DT.DB = {}

-- Defaults are deep-copied into the saved table on first run, and any missing
-- keys are filled in on later runs (so adding a new setting won't wipe old ones).
local ACCOUNT_DEFAULTS = {
    version = DT.VERSION,
    settings = {
        expansionOrder = "NEWEST",  -- NEWEST first or OLDEST first (All view)
        showWorldQuests = false,    -- show genuine world quests (Blizzard tracks these natively; off by default)
        showInactiveWQ = false,     -- show world quests that exist but aren't currently up
        showSeasonal = false,       -- show holiday/seasonal dailies (only up during their festival)
        showProfessions = true,     -- show profession dailies (Cooking, Fishing, gathering WQs, ...)
        showBattlePets = true,      -- show battle pet dailies / pet battle world quests
        showRaces = false,          -- show skyriding/dragonriding race courses (off by default; lots of variants)
        showCompleted = true,       -- show quests already done today (grayed); off declutters the main list
        firstRunHintSeen = false,   -- one-time "hover a quest / see the Guide" pointer on first open
        showMapPins = true,         -- drop world-map + minimap pins at available dailies' givers in your current zone
        todaysRoute = false,        -- order the Current Zone tab + Pinned panel as a nearest-giver travel route
    },
    -- LibDBIcon stores the minimap button's angle + hidden state here (account-wide).
    minimap = { hide = false },
    -- Daily-activity streak (account-wide): consecutive daily-reset periods in which
    -- you completed at least one tracked daily. `lastDay` is the period id of the
    -- most recent completion (see QuestLog:GetDailyPeriodId).
    streak = { current = 0, best = 0, lastDay = nil },
    -- Per-section collapsed state for the modern UI, keyed by a stable group key
    -- (e.g. an expansion key or zone name). ui.collapsed[key] = true when folded.
    -- collapseSeen tracks which keys have had the "start folded" default applied,
    -- so it's applied exactly once per section (not re-forced on every rebuild).
    ui = { collapsed = {}, collapseSeen = {} },
    framePosition = nil,            -- { point, x, y } once the user moves the window
    -- Auto-learned daily quests, account-wide. The addon fills this in from live
    -- play: every daily-frequency quest the player has seen, with its REAL id.
    -- learned[questID] = { name, faction, mapID, firstSeen, lastSeen }
    learned = {},
}

local CHAR_DEFAULTS = {
    version = DT.VERSION,
    -- Quests the user has pinned/favorited for emphasis.
    pinned = {},
}

-- Recursively fill missing keys in `target` from `defaults` without overwriting
-- values the user already has.
local function applyDefaults(target, defaults)
    for k, v in pairs(defaults) do
        if type(v) == "table" then
            if type(target[k]) ~= "table" then
                target[k] = {}
            end
            applyDefaults(target[k], v)
        elseif target[k] == nil then
            target[k] = v
        end
    end
    return target
end

-- Called once SavedVariables are loaded (ADDON_LOADED for our addon).
function DT.DB:Initialize()
    QuestTallyDB = QuestTallyDB or {}
    QuestTallyCharDB = QuestTallyCharDB or {}

    self.account = applyDefaults(QuestTallyDB, ACCOUNT_DEFAULTS)
    self.char = applyDefaults(QuestTallyCharDB, CHAR_DEFAULTS)

    -- Keep the stored version current for future migrations.
    self.account.version = DT.VERSION
    self.char.version = DT.VERSION
end

-- Convenience accessors.
function DT.DB:GetSetting(key)
    return self.account.settings[key]
end

function DT.DB:SetSetting(key, value)
    self.account.settings[key] = value
    -- A setting change can alter which entries the checklist emits (seasonal,
    -- profession/pet/race, world-quest gating), so drop the per-frame memo.
    if DT.Checklist and DT.Checklist.Invalidate then DT.Checklist:Invalidate() end
end

-- Modern-UI section fold state. Keyed by a stable group key (expansion key,
-- zone name, status, ...). Absent/false means expanded.
function DT.DB:IsCollapsed(key)
    return self.account.ui.collapsed[key] == true
end

-- Like IsCollapsed, but a key's FIRST appearance defaults to collapsed (folded),
-- and that default is remembered. Used by the All/Browse builders so every section
-- and sub-section starts folded; the user's later toggles persist, and expand-all
-- (which wipes `collapsed` but not `collapseSeen`) keeps sections open on rebuild.
function DT.DB:IsCollapsedByDefault(key)
    if not self.account.ui.collapseSeen[key] then
        self.account.ui.collapseSeen[key] = true
        -- During an "expand all" pass, newly-built sections default OPEN so the
        -- single rebuild cascades fully open; otherwise they default folded.
        self.account.ui.collapsed[key] = (not self._expandPass) and true or nil
    end
    return self.account.ui.collapsed[key] == true
end

function DT.DB:ToggleCollapsed(key)
    if self.account.ui.collapsed[key] then
        self.account.ui.collapsed[key] = nil
    else
        self.account.ui.collapsed[key] = true
    end
    return self.account.ui.collapsed[key] == true
end

-- Explicit set (nil clears the entry so "expanded" stays the absent default).
function DT.DB:SetCollapsed(key, collapsed)
    self.account.ui.collapsed[key] = collapsed and true or nil
end

-- Clear all fold state -> every section expanded.
function DT.DB:ExpandAll()
    wipe(self.account.ui.collapsed)
end

-- Collapse every section we've ever built, at ALL nesting levels (not just the
-- top-level folders currently on screen). `collapseSeen` records every key ever
-- rendered -- expansions, zones, and the kind/sub-zone groups under them -- so
-- folding them all means re-opening any parent reveals its children already
-- folded. Nested folders never yet built default to collapsed on first reveal
-- (no expand pass is active), so the whole tree ends up folded.
function DT.DB:CollapseAll()
    for key in pairs(self.account.ui.collapseSeen) do
        self.account.ui.collapsed[key] = true
    end
end

-- Record (or refresh) a daily we've seen live. `now` is the current server
-- time in seconds (passed in so this module stays free of time calls).
-- Returns true if this was the first time we'd ever seen this quest.
function DT.DB:LearnDaily(questID, name, faction, mapID, now)
    if not questID or questID <= 0 then return false end
    local learned = self.account.learned
    local existing = learned[questID]
    if existing then
        -- Keep the best info we have; names/maps can become known later.
        existing.name = name or existing.name
        existing.faction = faction or existing.faction
        existing.mapID = mapID or existing.mapID
        existing.lastSeen = now or existing.lastSeen
        return false
    end
    learned[questID] = {
        name = name,
        faction = faction,
        mapID = mapID,
        firstSeen = now,
        lastSeen = now,
    }
    return true
end

-- Iterate every learned daily as (questID, info).
function DT.DB:ForEachLearned(callback)
    for questID, info in pairs(self.account.learned) do
        callback(questID, info)
    end
end

function DT.DB:GetLearnedCount()
    local n = 0
    for _ in pairs(self.account.learned) do n = n + 1 end
    return n
end

-- Record the quest giver's location, captured live when the player interacts
-- with the NPC. Stored as learned[questID].giver = { name, mapID, x, y }.
-- Only overwrites fields we actually have, keeping the best known info.
function DT.DB:SetQuestGiver(questID, name, mapID, x, y)
    local e = self.account.learned[questID]
    if not e then return end
    e.giver = e.giver or {}
    if name then e.giver.name = name end
    if mapID then e.giver.mapID = mapID end
    if x and y then e.giver.x = x; e.giver.y = y end
end

function DT.DB:GetQuestGiver(questID)
    local e = self.account.learned[questID]
    return e and e.giver or nil
end

-- Store baked quest details captured by the harvester (title/rewards/objectives),
-- so they can be shown for dailies the player hasn't loaded this session. Merges
-- field-by-field, keeping the best data we have. `details` may contain any of:
--   { title, rewards = {...}, objectives = {...}, harvested = <serverTime> }
function DT.DB:SetQuestDetails(questID, details)
    if not questID or not details then return end
    local e = self.account.learned[questID]
    if not e then return end  -- LearnDaily must have created the record first
    e.details = e.details or {}
    local d = e.details
    if details.title then d.title = details.title end
    if details.rewards then d.rewards = details.rewards end
    if details.objectives then d.objectives = details.objectives end
    if details.description then d.description = details.description end
    if details.harvested then d.harvested = details.harvested end
end

function DT.DB:GetQuestDetails(questID)
    local e = self.account.learned[questID]
    return e and e.details or nil
end

-- Tag a learned quest with the kind of content it is, as classified first-party
-- during a discovery crawl: "daily" (matched the checklist) or "worldquest"
-- (flagged by C_QuestLog.IsWorldQuest). Lets modern content be told apart from
-- classic-style dailies without a curated list for it.
function DT.DB:SetQuestKind(questID, kind)
    local e = self.account.learned[questID]
    if e and kind then e.kind = kind end
end

-- How many learned dailies carry baked harvester details (rewards/objectives).
function DT.DB:GetHarvestedCount()
    local n = 0
    for _, info in pairs(self.account.learned) do
        if info.details and (info.details.rewards or info.details.objectives) then
            n = n + 1
        end
    end
    return n
end

-- Record that a tracked daily was completed in the daily period `periodId` (a
-- monotonically increasing integer that bumps by 1 each daily reset; computed by
-- QuestLog:GetDailyPeriodId and passed in so this module stays time-call-free).
-- Extends the streak when the previous completion was the period immediately
-- before; otherwise the streak restarts at 1. Counts at most once per period.
function DT.DB:RecordDailyActivity(periodId)
    if not periodId then return end
    local s = self.account.streak
    if s.lastDay == periodId then return end          -- already counted this period
    if s.lastDay == periodId - 1 then
        s.current = (s.current or 0) + 1               -- consecutive period
    else
        s.current = 1                                  -- first ever, or streak broken
    end
    s.lastDay = periodId
    if (s.current or 0) > (s.best or 0) then s.best = s.current end
end

-- Current and best daily streak. `periodId` is today's period (QuestLog:
-- GetDailyPeriodId). The current streak is live: it survives "today not done yet"
-- (last activity was the previous period) but reads 0 once a whole period has
-- lapsed with no completion. Returns (current, best).
function DT.DB:GetStreak(periodId)
    local s = self.account.streak
    local best = s.best or 0
    if not s.lastDay or not periodId then return 0, best end
    if s.lastDay >= periodId - 1 then return s.current or 0, best end
    return 0, best  -- a full period passed with nothing -> streak broken
end

-- The addon version this character's owner last saw the changelog for. Used to pop
-- the "what's new" changelog once after an update (nil on a fresh install -> shown
-- once as a welcome). Account-wide so alts don't each re-show it.
function DT.DB:GetLastSeenVersion()
    return self.account.lastSeenVersion
end

function DT.DB:SetLastSeenVersion(v)
    self.account.lastSeenVersion = v
end

function DT.DB:IsPinned(questID)
    return self.char.pinned[questID] == true
end

function DT.DB:TogglePinned(questID)
    if self.char.pinned[questID] then
        self.char.pinned[questID] = nil
    else
        self.char.pinned[questID] = true
    end
    -- Pinned state is baked into each entry (and drives sort order), so a toggle
    -- must invalidate the per-frame memo or the star won't update until next frame.
    if DT.Checklist and DT.Checklist.Invalidate then DT.Checklist:Invalidate() end
    return self.char.pinned[questID] == true
end
