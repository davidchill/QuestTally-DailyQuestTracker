-- QuestData.lua
-- The catalog of KNOWN daily quests, grouped by expansion.
--
-- Why this file exists: the WoW API can tell us the status of any quest ID we
-- ask about, but it cannot list "every daily in the world." So to show dailies
-- the player has NOT yet picked up, we need a list of quest IDs to ask about.
-- That list lives here. Status is still 100% live -- this only tells the addon
-- WHICH quests to check.
--
-- Each entry:
--   [questID] = {
--       name    = "Display Name",        -- fallback label; live name is used when available
--       zone    = "Zone / Hub",          -- where it's picked up / done
--       faction = "Both" | "Alliance" | "Horde",
--       group   = "Optional sub-group",  -- e.g. a daily hub or reputation
--   }
--
-- This catalog starts small on purpose. It's designed to grow -- adding a quest
-- is a one-line addition and requires no other code changes. Quest IDs can be
-- found on Wowhead (the number in the quest's URL).
local addonName, DT = ...

DT.QuestData = {}

-- catalog[EXPANSION_KEY] = { [questID] = info, ... }
local catalog = {
    WRATH = {
        -- Argent Tournament dailies (still completable on Retail at level cap).
        [13796] = { name = "Threat From Above",        zone = "Icecrown - Argent Tournament", faction = "Both", group = "Argent Tournament" },
        [13790] = { name = "A Blade Fit For A Champion", zone = "Icecrown - Argent Tournament", faction = "Both", group = "Argent Tournament" },
    },

    LEGION = {
        -- Example placeholder; replace/expand with real Legion world quest emissaries
        -- or Broken Shore dailies as you verify IDs.
    },

    DRAGONFLIGHT = {
        -- Example placeholder for DF reputation/profession dailies.
    },

    TWW = {
        -- Example placeholder for The War Within daily content.
    },
}

-- Reverse index: questID -> expansion key, built once at load.
local questToExpansion = {}
for expKey, quests in pairs(catalog) do
    for questID in pairs(quests) do
        questToExpansion[questID] = expKey
    end
end

-- Returns the expansion KEY for a quest ID, or "OTHER" if we don't have it cataloged.
function DT.QuestData:GetExpansionForQuest(questID)
    return questToExpansion[questID] or "OTHER"
end

-- Returns the catalog info table for a quest ID, or nil if uncataloged.
function DT.QuestData:GetInfo(questID)
    local expKey = questToExpansion[questID]
    if not expKey then return nil end
    return catalog[expKey][questID]
end

-- Iterate every cataloged daily as (questID, info, expansionKey).
-- Used for "discovery" -- checking availability of dailies not yet in the log.
function DT.QuestData:ForEach(callback)
    for expKey, quests in pairs(catalog) do
        for questID, info in pairs(quests) do
            callback(questID, info, expKey)
        end
    end
end

-- Expose the raw catalog for tooling/debugging.
DT.QuestData._catalog = catalog
