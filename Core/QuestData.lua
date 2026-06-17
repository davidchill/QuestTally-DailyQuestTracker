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

-- Quest-ID range -> expansion. Blizzard assigns quest IDs roughly in
-- chronological (expansion) order, so the ID alone is a good classifier when we
-- have nothing else -- which is the case for harvested dailies, whose mapID the
-- game often doesn't report. Thresholds are the LOWER bound of each band and are
-- approximate near boundaries; nudge them if a daily lands in the wrong section.
-- Evaluated high-to-low; first threshold the ID meets or exceeds wins.
local ID_BANDS = {
    { 88000, "MIDNIGHT" },
    { 78000, "TWW" },
    { 64500, "DRAGONFLIGHT" },
    { 57000, "SHADOWLANDS" },
    { 46500, "BFA" },
    { 38800, "LEGION" },
    { 35000, "WOD" },
    { 29200, "MOP" },
    { 24000, "CATA" },
    { 11800, "WRATH" },
    {  9000, "TBC" },
    {     1, "CLASSIC" },
}

-- Classify a quest ID into an expansion KEY by its numeric band.
local function expansionByIdBand(questID)
    for _, band in ipairs(ID_BANDS) do
        if questID >= band[1] then return band[2] end
    end
    return "OTHER"
end

-- Returns the expansion KEY for a quest ID. Prefers an explicit catalog entry,
-- then falls back to the ID-band classifier. "OTHER" only for non-positive IDs.
function DT.QuestData:GetExpansionForQuest(questID)
    if not questID or questID <= 0 then return "OTHER" end
    return questToExpansion[questID] or expansionByIdBand(questID)
end

-- Blizzard continent-map NAME -> expansion key. Used to classify harvested
-- dailies (which carry only a mapID) into an expansion section. This is the
-- approximate "mapID -> continent -> expansion" path: every modern continent
-- maps 1:1 to its expansion. Eastern Kingdoms / Kalimdor are shared between
-- Classic and Cataclysm content; at retail, dailies there are overwhelmingly
-- Cata-era, so we bucket them as CATA. Spellings cover the variants C_Map may
-- return across client versions.
local CONTINENT_EXP = {
    ["Outland"]           = "TBC",
    ["Northrend"]         = "WRATH",
    ["Eastern Kingdoms"]  = "CATA",
    ["Kalimdor"]          = "CATA",
    ["Deepholm"]          = "CATA",
    ["Pandaria"]          = "MOP",
    ["The Wandering Isle"]= "MOP",
    ["Draenor"]           = "WOD",
    ["Broken Isles"]      = "LEGION",
    ["Argus"]             = "LEGION",
    ["Zandalar"]          = "BFA",
    ["Kul Tiras"]         = "BFA",
    ["Shadowlands"]       = "SHADOWLANDS",
    ["The Shadowlands"]   = "SHADOWLANDS",
    ["Dragon Isles"]      = "DRAGONFLIGHT",
    ["The Dragon Isles"]  = "DRAGONFLIGHT",
    ["Khaz Algar"]        = "TWW",
    ["Isle of Dorn"]      = "TWW",
}
DT.QuestData.CONTINENT_EXP = CONTINENT_EXP

-- Best-effort expansion KEY for a mapID, via its continent. Returns "OTHER"
-- when the map can't be resolved or its continent isn't mapped. Depends on
-- DT.Zones (resolved at call time, after all files have loaded).
function DT.QuestData:GetExpansionForMap(mapID)
    if not mapID or not DT.Zones then return "OTHER" end
    local z = DT.Zones:Resolve(mapID)
    local cont = z and z.continentName
    return (cont and CONTINENT_EXP[cont]) or "OTHER"
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
