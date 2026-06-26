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

-- The real continent/island for a zone, keyed by its normalized ZoneLabel. The
-- continent is a fact of the zone's geography, NOT of the expansion that added the
-- quest -- and the two often disagree. A Dragonflight skyriding race in Hellfire
-- Peninsula, a TWW race course in Zul'Drak, a MoP battle-pet daily in Icecrown:
-- all carry a modern `expansion` tag but sit in old-world zones. Resolving the
-- continent from the zone NAME (here) instead of the per-expansion default keeps
-- the Browse/All dropdowns sorted by true geography and immune to tag drift.
--
-- This table is comprehensive across every zone the static checklist references.
-- A handful of zone NAMES exist on TWO continents (the TBC vs WoD Shadowmoon
-- Valley/Nagrand, the WotLK vs Legion Dalaran); those CANNOT be keyed by name
-- alone and live in AMBIGUOUS_ZONE_CONTINENT below instead. Verified against
-- Wowhead. Tol Barad and Deepholm keep their own island/elemental-plane buckets,
-- matching how the reputation-mapped quests already group.
local ZONE_CONTINENT = {
    -- Eastern Kingdoms
    ["Twilight Highlands"]       = "Eastern Kingdoms",
    ["Hillsbrad Foothills"]      = "Eastern Kingdoms",
    ["Stormwind City"]           = "Eastern Kingdoms",
    ["Elwynn Forest"]            = "Eastern Kingdoms",
    ["Dun Morogh"]               = "Eastern Kingdoms",
    ["Ironforge"]                = "Eastern Kingdoms",
    ["Undercity"]                = "Eastern Kingdoms",
    ["Gnomeregan"]               = "Eastern Kingdoms",
    ["Deadwind Pass"]            = "Eastern Kingdoms",
    ["Duskwood"]                 = "Eastern Kingdoms",
    ["Redridge Mountains"]       = "Eastern Kingdoms",
    ["Burning Steppes"]          = "Eastern Kingdoms",
    ["Searing Gorge"]            = "Eastern Kingdoms",
    ["Northern Stranglethorn"]   = "Eastern Kingdoms",
    ["Cape of Stranglethorn"]    = "Eastern Kingdoms",
    ["Swamp of Sorrows"]         = "Eastern Kingdoms",
    ["The Hinterlands"]          = "Eastern Kingdoms",
    ["Eastern Plaguelands"]      = "Eastern Kingdoms",
    ["Isle of Quel'Danas"]       = "Eastern Kingdoms",
    ["Eversong Woods"]           = "Eastern Kingdoms",
    ["Silvermoon City"]          = "Eastern Kingdoms",
    ["Darkmoon Island"]          = "Eastern Kingdoms",
    ["Blackrock Depths"]         = "Eastern Kingdoms",
    ["Scholomance"]              = "Eastern Kingdoms",
    ["Scarlet Halls"]            = "Eastern Kingdoms",
    -- Kalimdor
    ["Mount Hyjal"]              = "Kalimdor",
    ["Uldum"]                    = "Kalimdor",
    ["Winterspring"]             = "Kalimdor",
    ["Stonetalon Mountains"]     = "Kalimdor",
    ["Orgrimmar"]                = "Kalimdor",
    ["Thunder Bluff"]            = "Kalimdor",
    ["Darnassus"]                = "Kalimdor",
    ["Durotar"]                  = "Kalimdor",
    ["Dustwallow Marsh"]         = "Kalimdor",
    ["Tanaris"]                  = "Kalimdor",
    -- Outland (Shadowmoon Valley / Nagrand are ambiguous -- see below)
    ["Hellfire Peninsula"]       = "Outland",
    ["Terokkar Forest"]          = "Outland",
    ["Blade's Edge Mountains"]   = "Outland",
    ["Netherstorm"]              = "Outland",
    ["Zangarmarsh"]              = "Outland",
    ["Shattrath City"]           = "Outland",
    -- Northrend (Dalaran is ambiguous -- see below)
    ["Borean Tundra"]            = "Northrend",
    ["Howling Fjord"]            = "Northrend",
    ["Dragonblight"]             = "Northrend",
    ["Grizzly Hills"]            = "Northrend",
    ["Zul'Drak"]                 = "Northrend",
    ["Sholazar Basin"]           = "Northrend",
    ["The Storm Peaks"]          = "Northrend",
    ["Crystalsong Forest"]       = "Northrend",
    ["Icecrown"]                 = "Northrend",
    -- Pandaria
    ["The Jade Forest"]          = "Pandaria",
    ["Jade Forest"]              = "Pandaria",
    ["Valley of the Four Winds"] = "Pandaria",
    ["Krasarang Wilds"]          = "Pandaria",
    ["Kun-Lai Summit"]           = "Pandaria",
    ["Townlong Steppes"]         = "Pandaria",
    ["Dread Wastes"]             = "Pandaria",
    ["Vale of Eternal Blossoms"] = "Pandaria",
    ["Timeless Isle"]            = "Pandaria",
    ["Isle of Thunder"]          = "Pandaria",
    ["Isle of Giants"]           = "Pandaria",
    ["Unga Ingoo"]               = "Pandaria",
    ["Mogu'shan Palace"]         = "Pandaria",
    ["Gate of the Setting Sun"]  = "Pandaria",
    ["Temple of the Jade Serpent"] = "Pandaria",
    ["Siege of Niuzao Temple"]   = "Pandaria",
    ["Shado-Pan Monastery"]      = "Pandaria",
    -- Draenor (Shadowmoon Valley / Nagrand are ambiguous -- see below)
    ["Frostfire Ridge"]          = "Draenor",
    ["Tanaan Jungle"]            = "Draenor",
    ["Iron Docks"]               = "Draenor",
    ["Shadowmoon Burial Grounds"] = "Draenor",
    ["Garrison Support"]         = "Draenor",
    -- The Shadowlands
    ["Bastion"]                  = "The Shadowlands",
    ["Maldraxxus"]               = "The Shadowlands",
    ["Ardenweald"]               = "The Shadowlands",
    ["The Maw"]                  = "The Shadowlands",
    ["Korthia"]                  = "The Shadowlands",
    ["Zereth Mortis"]            = "The Shadowlands",
    ["Torghast, Tower of the Damned"] = "The Shadowlands",
    -- Dragon Isles
    ["The Waking Shores"]        = "Dragon Isles",
    ["Ohn'ahran Plains"]         = "Dragon Isles",
    ["The Azure Span"]           = "Dragon Isles",
    ["Thaldraszus"]              = "Dragon Isles",
    ["Valdrakken"]               = "Dragon Isles",
    ["Zaralek Cavern"]           = "Dragon Isles",
    ["The Forbidden Reach"]      = "Dragon Isles",
    ["Emerald Dream"]            = "Dragon Isles",
    ["Obsidian Citadel"]         = "Dragon Isles",
    -- Kul Tiras / Zandalar
    ["Mechagon"]                 = "Kul Tiras / Zandalar",
    ["Zuldazar"]                 = "Kul Tiras / Zandalar",
    -- Khaz Algar
    ["Azj-Kahet"]                = "Khaz Algar",
    ["Hallowfall"]               = "Khaz Algar",
    ["Siren Isle"]               = "Khaz Algar",
    ["Infinite Bazaars"]         = "Khaz Algar",
    -- Distinct island / elemental-plane buckets (already used for the
    -- reputation-mapped quests in these zones).
    ["Tol Barad"]                = "Tol Barad",
    ["Tol Barad Peninsula"]      = "Tol Barad",
    ["Deepholm"]                 = "Deepholm",
}

-- Zone NAMES that exist on two continents -- the flat map above can't tell them
-- apart, so the EXPANSION breaks the tie. Each gives the per-expansion continent
-- plus a default for every other tag (TBC/MoP-era reuse of the Outland originals,
-- WotLK for Dalaran). Verified against Wowhead.
local AMBIGUOUS_ZONE_CONTINENT = {
    ["Shadowmoon Valley"] = { WOD = "Draenor",       LEGION = "Draenor", default = "Outland" },
    ["Nagrand"]           = { WOD = "Draenor",                           default = "Outland" },
    ["Dalaran"]           = { LEGION = "Broken Isles",                   default = "Northrend" },
}

-- Public: real continent/island for a normalized zone label, or nil if we don't
-- pin one (caller then keeps the per-expansion default). `expansion` disambiguates
-- the few zone names that exist on two continents.
function DT.ZoneMap:ContinentForZone(zoneLabel, expansion)
    if not zoneLabel then return nil end
    local amb = AMBIGUOUS_ZONE_CONTINENT[zoneLabel]
    if amb then return amb[expansion or ""] or amb.default end
    return ZONE_CONTINENT[zoneLabel]
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
