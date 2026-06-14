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
