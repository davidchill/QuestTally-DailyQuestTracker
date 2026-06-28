-- QuestData.lua
-- Expansion classification for quest IDs.
--
-- The shipped master list of dailies lives in ChecklistData/ChecklistDataExtra;
-- this file's job is narrower: answer "which expansion does quest N belong to?"
-- for any ID -- needed to bucket harvested and world-quest entries that carry no
-- explicit expansion tag.
--
-- Two sources, checked in order:
--   1. An explicit per-quest override table (`catalog`), for the few IDs the
--      numeric bands below would misclassify. Each [questID] = { name, zone,
--      faction, group }; only the expansion key it's filed under is consulted
--      today (the other fields are descriptive).
--   2. The ID-band classifier -- Blizzard assigns quest IDs in roughly
--      chronological order, so the number alone places everything else.
local addonName, DT = ...

DT.QuestData = {}

-- catalog[EXPANSION_KEY] = { [questID] = info, ... }
local catalog = {
    WRATH = {
        -- Argent Tournament dailies (still completable on Retail at level cap).
        [13796] = { name = "Threat From Above",        zone = "Icecrown - Argent Tournament", faction = "Both", group = "Argent Tournament" },
        [13790] = { name = "A Blade Fit For A Champion", zone = "Icecrown - Argent Tournament", faction = "Both", group = "Argent Tournament" },
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
