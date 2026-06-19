-- ZoneMap.lua
-- Pre-map baseline: assigns a continent + zone to each checklist entry by its
-- category, so the full master list is browsable by location BEFORE the player
-- has discovered each quest. Live discovery (a quest's real learned zone)
-- overrides this default whenever it's available -- that's the "hybrid".
--
-- Ambiguous cases (multi-zone reputations, capital-city profession dailies that
-- differ by expansion/faction) use the reputation/hub name as a stand-in zone
-- until live data pins the exact zone. These are the rough edges we'll refine.
local addonName, DT = ...

DT.ZoneMap = {}

-- Fallback continent per expansion.
local CONTINENT_BY_EXP = {
    TBC = "Outland", WRATH = "Northrend", CATA = "Azeroth",
    MOP = "Pandaria", WOD = "Draenor", LEGION = "Broken Isles",
    BFA = "Kul Tiras / Zandalar", SHADOWLANDS = "The Shadowlands",
    DRAGONFLIGHT = "Dragon Isles", TWW = "Khaz Algar", OTHER = "Other",
}

-- Profession dailies are hub/capital based; the hub differs by expansion.
local PROF_BY_EXP = {
    TBC   = { "Outland",   "Shattrath City" },
    WRATH = { "Northrend", "Dalaran" },
    CATA  = { "Azeroth",   "Stormwind / Orgrimmar" },
    MOP   = { "Pandaria",  "Vale of Eternal Blossoms" },
}

-- Category -> { continent, zone }. Zone names match Blizzard map names where a
-- single zone is correct; otherwise the reputation/hub name is used.
local CATEGORY_ZONE = {
    -- TBC
    ["Sha'tari Skyguard"]       = { "Outland", "Terokkar Forest" },
    ["Ogri'la"]                 = { "Outland", "Blade's Edge Mountains" },
    ["Netherwing"]              = { "Outland", "Shadowmoon Valley" },
    ["Shattered Sun Offensive"] = { "Eastern Kingdoms", "Isle of Quel'Danas" },
    ["Terokkar Forest"]         = { "Outland", "Terokkar Forest" },
    ["Hellfire Peninsula"]      = { "Outland", "Hellfire Peninsula" },
    ["Nagrand"]                 = { "Outland", "Nagrand" },
    ["Wanted"]                  = { "Outland", "Hellfire Peninsula" },
    -- Battlegrounds
    ["Alterac Valley"]          = { "Battlegrounds", "Alterac Valley" },
    ["Arathi Basin"]            = { "Battlegrounds", "Arathi Basin" },
    ["Eye of the Storm"]        = { "Battlegrounds", "Eye of the Storm" },
    ["Warsong Gulch"]           = { "Battlegrounds", "Warsong Gulch" },
    -- WotLK
    ["Kalu'ak"]                 = { "Northrend", "Kalu'ak" },
    ["Knights of the Ebon Blade"] = { "Northrend", "Icecrown" },
    ["Wyrmrest Accord"]         = { "Northrend", "Dragonblight" },
    ["Oracles"]                 = { "Northrend", "Sholazar Basin" },
    ["Frenzyheart Tribe"]       = { "Northrend", "Sholazar Basin" },
    ["Sons of Hodir"]           = { "Northrend", "The Storm Peaks" },
    ["Valiance Expedition"]     = { "Northrend", "Borean Tundra" },
    ["Explorer's League"]       = { "Northrend", "Howling Fjord" },
    ["Frostborn"]               = { "Northrend", "Howling Fjord" },
    ["Warsong Offensive"]       = { "Northrend", "Borean Tundra" },
    ["Argent Crusade"]          = { "Northrend", "Icecrown" },
    ["Sunreavers"]              = { "Northrend", "Icecrown" },
    ["Silver Covenant"]         = { "Northrend", "Icecrown" },
    ["Grizzly Hills"]           = { "Northrend", "Grizzly Hills" },
    ["Storm Peaks"]             = { "Northrend", "The Storm Peaks" },
    ["Icecrown"]                = { "Northrend", "Icecrown" },
    ["Heroic Daily"]            = { "Northrend", "Dalaran" },
    -- Cataclysm
    ["Therazane"]               = { "Deepholm", "Deepholm" },
    ["Ramkahen"]                = { "Kalimdor", "Uldum" },
    ["Dragonmaw Clan"]          = { "Eastern Kingdoms", "Twilight Highlands" },
    ["Wildhammer Clan"]         = { "Eastern Kingdoms", "Twilight Highlands" },
    ["Baradin's Wardens"]       = { "Tol Barad", "Tol Barad Peninsula" },
    ["Hellscream's Reach"]      = { "Tol Barad", "Tol Barad Peninsula" },
    ["Guardians of Hyjal"]      = { "Kalimdor", "Mount Hyjal" },
    -- Mists of Pandaria
    ["Klaxxi"]                  = { "Pandaria", "Dread Wastes" },
    ["Emperor Shaohao"]         = { "Pandaria", "Timeless Isle" },
    ["Order of the Cloud Serpent"] = { "Pandaria", "The Jade Forest" },
    ["Shado-Pan"]               = { "Pandaria", "Townlong Steppes" },
    ["The Anglers"]             = { "Pandaria", "Krasarang Wilds" },
    ["August Celestials"]       = { "Pandaria", "August Celestials" },
    ["The Tillers"]             = { "Pandaria", "Valley of the Four Winds" },
    ["Golden Lotus"]            = { "Pandaria", "Vale of Eternal Blossoms" },
    ["Dominance Offensive"]     = { "Pandaria", "Krasarang Wilds" },
    ["Operation: Shieldwall"]   = { "Pandaria", "Krasarang Wilds" },
}

-- Per-quest location overrides for capital-city cooking/fishing dailies whose
-- shipped zoneName is a non-geographic placeholder ("Cooking"/"Fishing"/"Various").
-- These dailies are spread one-per-capital, so the city can only be pinned per
-- quest -- resolved from each daily's giver (Wowhead). Keyed by quest ID; value is
-- { continentName, zoneName }. Live discovery still overrides this when available.
local QUEST_ZONE_OVERRIDE = {
    -- WotLK -- Dalaran fishing/cooking dailies (Marcia Chase / Olisarra the Kind)
    [13830] = { "Northrend", "Dalaran" },
    [13832] = { "Northrend", "Dalaran" },
    [13833] = { "Northrend", "Dalaran" },
    [13834] = { "Northrend", "Dalaran" },
    [13836] = { "Northrend", "Dalaran" },
    -- Cataclysm cooking -- Stormwind (Robby Flay, Alliance)
    [26177] = { "Eastern Kingdoms", "Stormwind City" },
    [26183] = { "Eastern Kingdoms", "Stormwind City" },
    [26190] = { "Eastern Kingdoms", "Stormwind City" },
    -- Cataclysm cooking -- Orgrimmar (Marogg, Horde)
    [26220] = { "Kalimdor", "Orgrimmar" },
    [26226] = { "Kalimdor", "Orgrimmar" },
    [26235] = { "Kalimdor", "Orgrimmar" },
    -- Cataclysm fishing -- Orgrimmar (Razgar, Horde)
    [26543] = { "Kalimdor", "Orgrimmar" },
    [26556] = { "Kalimdor", "Orgrimmar" },
    [26557] = { "Kalimdor", "Orgrimmar" },
    [26572] = { "Kalimdor", "Orgrimmar" },
    [26588] = { "Kalimdor", "Orgrimmar" },
    -- MoP cooking -- Darnassus (Alegorn, Alliance)
    [29313] = { "Kalimdor", "Darnassus" },
    [29314] = { "Kalimdor", "Darnassus" },
    [29316] = { "Kalimdor", "Darnassus" },
    [29318] = { "Kalimdor", "Darnassus" },
    [29357] = { "Kalimdor", "Darnassus" },
    -- MoP fishing -- Darnassus (Astaia, Alliance)
    [29321] = { "Kalimdor", "Darnassus" },
    [29323] = { "Kalimdor", "Darnassus" },
    [29324] = { "Kalimdor", "Darnassus" },
    [29325] = { "Kalimdor", "Darnassus" },
    [29359] = { "Kalimdor", "Darnassus" },
    -- MoP fishing/cooking -- Thunder Bluff (Kah Mistrunner / Nahari Cloudchaser, Horde)
    [29345] = { "Kalimdor", "Thunder Bluff" },
    [29346] = { "Kalimdor", "Thunder Bluff" },
    [29349] = { "Kalimdor", "Thunder Bluff" },
    [29354] = { "Kalimdor", "Thunder Bluff" },
    -- MoP cooking -- Valley of the Four Winds, Halfhill (Mei Mei Ironpaw)
    [30331] = { "Pandaria", "Valley of the Four Winds" },
    -- MoP fishing -- Krasarang Wilds, Anglers Wharf (Nat Pagle)
    [31443] = { "Pandaria", "Krasarang Wilds" },
    [31446] = { "Pandaria", "Krasarang Wilds" },
    -- Cataclysm Firelands Invasion -- givers Mylune & Matoclaw at the Sanctuary of
    -- Malorne in Mount Hyjal (Molten Front staging hub; confirmed via Wowhead).
    -- These carry placeholder zoneNames ("Various"/"Firelands Invasion"), so they
    -- need pinning here; their Molten-Front-tagged siblings resolve to Mount Hyjal
    -- on their own (real zone name) and now share Kalimdor as the continent.
    [29101] = { "Kalimdor", "Mount Hyjal" },
    [29125] = { "Kalimdor", "Mount Hyjal" },
    [29127] = { "Kalimdor", "Mount Hyjal" },
    [29147] = { "Kalimdor", "Mount Hyjal" },
    [29161] = { "Kalimdor", "Mount Hyjal" },
    [29164] = { "Kalimdor", "Mount Hyjal" },
    [29166] = { "Kalimdor", "Mount Hyjal" },
    [29122] = { "Kalimdor", "Mount Hyjal" },
    [29126] = { "Kalimdor", "Mount Hyjal" },
    [29148] = { "Kalimdor", "Mount Hyjal" },
    [29162] = { "Kalimdor", "Mount Hyjal" },
    [29165] = { "Kalimdor", "Mount Hyjal" },
    -- More Firelands Invasion dailies (were mis-tagged MoP, actually patch 4.2;
    -- givers all in Mount Hyjal / Molten Front -- confirmed via Wowhead). Only the
    -- "Various"-zoned ones need pinning; their Molten Front / Mount Hyjal siblings
    -- already resolve on their own.
    [29210] = { "Kalimdor", "Mount Hyjal" },
    [29211] = { "Kalimdor", "Mount Hyjal" },
    [29243] = { "Kalimdor", "Mount Hyjal" },
    [29263] = { "Kalimdor", "Mount Hyjal" },
    [29264] = { "Kalimdor", "Mount Hyjal" },
    [29265] = { "Kalimdor", "Mount Hyjal" },
    [29273] = { "Kalimdor", "Mount Hyjal" },
    [29274] = { "Kalimdor", "Mount Hyjal" },
    [29275] = { "Kalimdor", "Mount Hyjal" },
    [29276] = { "Kalimdor", "Mount Hyjal" },
    [29278] = { "Kalimdor", "Mount Hyjal" },
    [29287] = { "Kalimdor", "Mount Hyjal" },  -- Peaked Interest
    [29288] = { "Kalimdor", "Mount Hyjal" },
    [29289] = { "Kalimdor", "Mount Hyjal" },  -- Mother's Malice (was a dup of 29287)
    [29293] = { "Kalimdor", "Mount Hyjal" },
    [29297] = { "Kalimdor", "Mount Hyjal" },
    -- WoD fishing -- Lunarfall Garrison fishing shack (Ron Ashton)
    [36511] = { "Draenor", "Garrison Support" },
    [36513] = { "Draenor", "Garrison Support" },
    [36514] = { "Draenor", "Garrison Support" },
    [36515] = { "Draenor", "Garrison Support" },
    [36517] = { "Draenor", "Garrison Support" },
}

-- Public: curated { continentName, zoneName } for a quest ID, or nil. Consulted by
-- the checklist's effectiveLocation, below live discovery but above the raw
-- catalog zoneName, so placeholder "Cooking"/"Fishing" zones resolve to a real city.
function DT.ZoneMap:Override(questID)
    return questID and QUEST_ZONE_OVERRIDE[questID] or nil
end

-- The real continent/island for a zone, keyed by its normalized ZoneLabel. This
-- replaces Cataclysm's "Azeroth" stand-in continent: every Cata zone is sorted to
-- the actual Eastern Kingdoms / Kalimdor (or its own island bucket, Tol Barad /
-- Deepholm, matching how the reputation-mapped quests already group). Zones not
-- listed fall through to the per-expansion default, so other expansions are
-- unaffected. These names are unambiguous (no zone here exists on two continents).
local ZONE_CONTINENT = {
    -- Eastern Kingdoms
    ["Twilight Highlands"]   = "Eastern Kingdoms",
    ["Hillsbrad Foothills"]  = "Eastern Kingdoms",
    ["Stormwind City"]       = "Eastern Kingdoms",
    -- Kalimdor
    ["Mount Hyjal"]          = "Kalimdor",
    ["Uldum"]                = "Kalimdor",
    ["Winterspring"]         = "Kalimdor",
    ["Stonetalon Mountains"] = "Kalimdor",
    ["Orgrimmar"]            = "Kalimdor",
    -- Distinct island / elemental-plane buckets (already used for the
    -- reputation-mapped quests in these zones).
    ["Tol Barad"]            = "Tol Barad",
    ["Tol Barad Peninsula"]  = "Tol Barad",
    ["Deepholm"]             = "Deepholm",
}

-- Public: real continent/island for a normalized zone label, or nil if we don't
-- pin one (caller then keeps the per-expansion default).
function DT.ZoneMap:ContinentForZone(zoneLabel)
    return zoneLabel and ZONE_CONTINENT[zoneLabel] or nil
end

-- Resolve an entry to (continentName, zoneName). Order: events bucket ->
-- professions by expansion -> explicit category map -> expansion fallback.
function DT.ZoneMap:Resolve(entry)
    if entry.type == "Event" then
        return "Holidays & Events", entry.category
    end
    if entry.type == "Profession" then
        local p = PROF_BY_EXP[entry.expansion]
        if p then return p[1], p[2] end
    end
    local z = CATEGORY_ZONE[entry.category]
    if z then return z[1], z[2] end
    return CONTINENT_BY_EXP[entry.expansion] or "Other", entry.category or "Unknown"
end
