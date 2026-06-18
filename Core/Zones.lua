-- Zones.lua
-- Map/zone helpers built on Blizzard's C_Map API. Used to (a) figure out which
-- zone the player is standing in and (b) group discovered dailies by
-- continent -> zone for the browse/search view.
--
-- A quest's zone comes from the mapID the learner recorded for it (live, from
-- the game), so it's always accurate. We resolve that mapID up the map
-- hierarchy to its Zone-level and Continent-level ancestors.
local addonName, DT = ...

DT.Zones = {}

-- Map type constants (with numeric fallbacks in case Enum is unavailable).
local MAPTYPE_ZONE      = (Enum and Enum.UIMapType and Enum.UIMapType.Zone) or 3
local MAPTYPE_CONTINENT = (Enum and Enum.UIMapType and Enum.UIMapType.Continent) or 2

-- Memoize resolutions; map hierarchy never changes within a session.
local resolveCache = {}

-- Resolve a mapID to { zoneID, zoneName, continentID, continentName }.
-- Walks up parentMapID, recording the first Zone-level and Continent-level maps.
function DT.Zones:Resolve(mapID)
    if not mapID or mapID == 0 or not C_Map then return nil end
    if resolveCache[mapID] then return resolveCache[mapID] end

    local zoneID, zoneName, contID, contName
    local cur, guard = mapID, 0
    while cur and cur ~= 0 and guard < 25 do
        guard = guard + 1
        local info = C_Map.GetMapInfo(cur)
        if not info then break end
        if info.mapType == MAPTYPE_ZONE and not zoneID then
            zoneID, zoneName = info.mapID, info.name
        end
        if info.mapType == MAPTYPE_CONTINENT then
            contID, contName = info.mapID, info.name
            break
        end
        cur = info.parentMapID
    end

    -- If the map was already a zone or something below Zone with no Zone ancestor,
    -- fall back to the map itself for the zone label.
    if not zoneID then
        local info = C_Map.GetMapInfo(mapID)
        if info then zoneID, zoneName = info.mapID, info.name end
    end

    local result = {
        zoneID = zoneID, zoneName = zoneName,
        continentID = contID, continentName = contName,
    }
    resolveCache[mapID] = result
    return result
end

-- Reverse lookup: zone NAME -> uiMapID. Needed to place a right-click waypoint on
-- a quest whose giver coordinates we know but whose map ID we don't (the wiki
-- dailies ship zone-relative x/y but no map ID). WoW only exposes name->ID at
-- runtime, so we walk the whole map tree once from the cosmic root and index every
-- Zone-level map. Same zone name can repeat across expansions (two Shadowmoon
-- Valleys, two Dalarans), so we also key by continent+zone to disambiguate.
local COSMIC_MAP = 946          -- root of the uiMap hierarchy
local nameToMap                 -- { [zoneName] = mapID }            (first writer wins)
local contZoneToMap             -- { ["continent|zone"] = mapID }    (disambiguated)

local function buildNameIndex()
    nameToMap, contZoneToMap = {}, {}
    if not (C_Map and C_Map.GetMapChildrenInfo) then return end
    local zones = C_Map.GetMapChildrenInfo(COSMIC_MAP, MAPTYPE_ZONE, true) or {}
    for _, info in ipairs(zones) do
        if info.name and info.mapID then
            if not nameToMap[info.name] then nameToMap[info.name] = info.mapID end
            local res = DT.Zones:Resolve(info.mapID)
            if res and res.continentName then
                contZoneToMap[res.continentName .. "|" .. info.name] = info.mapID
            end
        end
    end
end

-- Public: best uiMapID for a zone name (continentName optional but recommended,
-- it disambiguates names shared across expansions). nil if the zone is unknown.
function DT.Zones:MapIDForZone(zoneName, continentName)
    if not zoneName then return nil end
    if not nameToMap then buildNameIndex() end
    if continentName then
        local id = contZoneToMap[continentName .. "|" .. zoneName]
        if id then return id end
    end
    return nameToMap[zoneName]
end

-- The player's current map and its resolved zone/continent.
function DT.Zones:GetPlayerZone()
    if not C_Map or not C_Map.GetBestMapForUnit then return nil, nil end
    local mapID = C_Map.GetBestMapForUnit("player")
    return self:Resolve(mapID), mapID
end

-- Build a continent -> zone tree from a list of entries (each having
-- continentName/zoneName). Only continents/zones that actually contain dailies
-- appear, so the browse dropdowns are never empty. Identity is by NAME, since
-- pre-mapped (undiscovered) entries have no numeric map IDs.
-- Returns an array of continents, each { name, zones = { {name, count}... } },
-- both lists sorted by name.
function DT.Zones:BuildTree(entries)
    local byContinent = {}
    for _, e in ipairs(entries) do
        local cname = e.continentName or "Other"
        local zname = e.zoneName or "Unknown"
        local c = byContinent[cname]
        if not c then
            c = { name = cname, zones = {}, _zoneMap = {} }
            byContinent[cname] = c
        end
        local z = c._zoneMap[zname]
        if not z then
            z = { name = zname, count = 0 }
            c._zoneMap[zname] = z
            c.zones[#c.zones + 1] = z
        end
        z.count = z.count + 1
    end

    local continents = {}
    for _, c in pairs(byContinent) do
        table.sort(c.zones, function(a, b) return a.name < b.name end)
        c._zoneMap = nil
        continents[#continents + 1] = c
    end
    table.sort(continents, function(a, b) return a.name < b.name end)
    return continents
end
