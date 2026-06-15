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
        showCompleted = true,       -- show dailies already done today
        sortMode = "EXPANSION",     -- EXPANSION | STATUS | NAME
        expansionOrder = "NEWEST",  -- NEWEST first or OLDEST first
        windowScale = 1.0,
    },
    framePosition = nil,            -- { point, x, y } once the user moves the window
    -- Auto-learned daily quests, account-wide. The addon fills this in from live
    -- play: every daily-frequency quest the player has seen, with its REAL id.
    -- learned[questID] = { name, faction, mapID, firstSeen, lastSeen }
    learned = {},
}

local CHAR_DEFAULTS = {
    version = DT.VERSION,
    -- Snapshot of completion, keyed by questID -> last reset timestamp we saw it done.
    -- Live API is the source of truth; this is only a fallback/history cache.
    completedCache = {},
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

function DT.DB:IsPinned(questID)
    return self.char.pinned[questID] == true
end

function DT.DB:TogglePinned(questID)
    if self.char.pinned[questID] then
        self.char.pinned[questID] = nil
    else
        self.char.pinned[questID] = true
    end
    return self.char.pinned[questID] == true
end
