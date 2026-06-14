-- Checklist.lua
-- The matching engine that turns the name-only master checklist (ChecklistData)
-- into live-tracked entries by linking each title to the REAL quest ID the
-- learner recorded from play (account-wide).
--
-- The "cross-check" you wanted happens here, but the game itself supplies the
-- title<->ID pairing, so it's always correct. A checklist entry with no learned
-- ID yet shows as "Not Yet Seen"; once any character has had that quest, it
-- lights up with live status (Available / In Progress / Done Today / ...).
local addonName, DT = ...

DT.Checklist = {}

-- Normalize a quest title for matching:
--   * trim surrounding whitespace
--   * strip a trailing wiki disambiguator in parentheses, e.g. " (quest)",
--     " (Horde)", " (daily)", " (Vale of Eternal Blossoms)"
--   * collapse internal whitespace
-- Returns (cleanTitle, matchKey) where matchKey is also lowercased.
local function normalize(title)
    if not title then return nil, nil end
    local clean = title:gsub("^%s+", ""):gsub("%s+$", "")
    -- Remove one trailing balanced-parenthesis group and any space before it.
    clean = clean:gsub("%s*%b()%s*$", "")
    clean = clean:gsub("%s+", " ")
    return clean, clean:lower()
end
DT.Checklist.Normalize = normalize

-- Index: matchKey -> array of checklist entries sharing that title.
local titleIndex = {}

-- Build the cleaned title/index once. Each entry gets .title (display) and
-- .matchKey (for resolution).
local function build()
    titleIndex = {}
    for _, entry in ipairs(DT.ChecklistData.entries) do
        local clean, key = normalize(entry.rawTitle)
        entry.title = clean
        entry.matchKey = key
        -- Pre-map default location (overridden by live data when discovered).
        if DT.ZoneMap then
            entry.defContinent, entry.defZone = DT.ZoneMap:Resolve(entry)
        end
        titleIndex[key] = titleIndex[key] or {}
        table.insert(titleIndex[key], entry)
    end
end

-- Resolve learned quest IDs onto checklist entries. Builds matchKey ->
-- { id = questID, mapID = N } from the account-wide learned DB (in-game titles
-- are authoritative). When a title maps to several IDs (faction variants share
-- a name), we keep the first; live status is the same for the player regardless.
local function buildResolution()
    local keyToInfo = {}
    DT.DB:ForEachLearned(function(questID, info)
        if info and info.name then
            local _, key = normalize(info.name)
            if key and not keyToInfo[key] then
                keyToInfo[key] = { id = questID, mapID = info.mapID }
            end
        end
    end)
    return keyToInfo
end

-- Effective location for a checklist entry: the live (learned) zone if we have
-- a discovered mapID, otherwise the pre-mapped default. Returns (continent, zone).
local function effectiveLocation(entry, resolved)
    if resolved and resolved.mapID and DT.Zones then
        local z = DT.Zones:Resolve(resolved.mapID)
        if z and z.zoneName then
            return z.continentName or entry.defContinent, z.zoneName
        end
    end
    return entry.defContinent, entry.defZone
end

-- Public: ensure the index is built (safe to call repeatedly).
function DT.Checklist:EnsureBuilt()
    if not next(titleIndex) then build() end
end

-- Public: return checklist entries as renderable rows with live status and
-- effective location (live zone if discovered, else pre-mapped default).
-- opts (optional): {
--   expansion = KEY, type = "Faction",
--   continentName = "Northrend", zoneName = "Icecrown",
--   undiscovered = false,   -- set false to hide quests with no learned ID
-- }
function DT.Checklist:GetEntries(opts)
    self:EnsureBuilt()
    opts = opts or {}
    local resolution = buildResolution()

    local list = {}
    for _, entry in ipairs(DT.ChecklistData.entries) do
        local resolved = resolution[entry.matchKey]
        local continentName, zoneName = effectiveLocation(entry, resolved)

        if (not opts.expansion or entry.expansion == opts.expansion)
        and (not opts.type or entry.type == opts.type)
        and (not opts.continentName or continentName == opts.continentName)
        and (not opts.zoneName or zoneName == opts.zoneName) then
            local questID = resolved and resolved.id or nil
            local status = questID and DT.QuestLog:GetStatus(questID) or DT.STATUS.UNDISCOVERED
            if opts.undiscovered ~= false or status ~= DT.STATUS.UNDISCOVERED then
                list[#list + 1] = {
                    title         = entry.title,
                    rawTitle      = entry.rawTitle,
                    expansion     = entry.expansion,
                    type          = entry.type,
                    category      = entry.category,
                    side          = entry.side,
                    questID       = questID,
                    status        = status,
                    pinned        = questID and DT.DB:IsPinned(questID) or false,
                    continentName = continentName,
                    zoneName      = zoneName,
                }
            end
        end
    end
    return list
end

-- Look up the best checklist metadata for an in-game title (or nil).
local function metaForTitle(name)
    local _, key = normalize(name)
    local list = key and titleIndex[key]
    return list and list[1] or nil
end

-- Public: entries for every DISCOVERED daily (a learned quest ID), enriched with
-- checklist metadata and resolved zone. These are the only quests we can place
-- on a map, so the zone views are built from this.
-- opts (optional): { zoneID = N, continentID = N, type = "Faction" }
function DT.Checklist:GetDiscoveredEntries(opts)
    self:EnsureBuilt()
    opts = opts or {}
    local list = {}
    DT.DB:ForEachLearned(function(questID, info)
        local meta = metaForTitle(info.name)
        local zone = info.mapID and DT.Zones and DT.Zones:Resolve(info.mapID) or nil

        if (not opts.zoneID or (zone and zone.zoneID == opts.zoneID))
        and (not opts.continentID or (zone and zone.continentID == opts.continentID))
        and (not opts.type or (meta and meta.type == opts.type)) then
            list[#list + 1] = {
                questID       = questID,
                title         = (meta and meta.title) or info.name or ("Quest " .. questID),
                expansion     = (meta and meta.expansion) or DT.QuestData:GetExpansionForQuest(questID),
                type          = meta and meta.type or nil,
                category      = meta and meta.category or nil,
                side          = meta and meta.side or info.faction,
                status        = DT.QuestLog:GetStatus(questID),
                pinned        = DT.DB:IsPinned(questID),
                mapID         = info.mapID,
                zoneID        = zone and zone.zoneID,
                zoneName      = zone and zone.zoneName,
                continentID   = zone and zone.continentID,
                continentName = zone and zone.continentName,
            }
        end
    end)
    return list
end

-- Public: summary stats for the whole checklist (or a filtered slice).
function DT.Checklist:GetStats()
    self:EnsureBuilt()
    local resolution = buildResolution()
    local stats = {
        total = #DT.ChecklistData.entries,
        discovered = 0,
        completed = 0,
        byExpansion = {},
    }
    for _, entry in ipairs(DT.ChecklistData.entries) do
        local exp = entry.expansion
        stats.byExpansion[exp] = stats.byExpansion[exp] or { total = 0, discovered = 0 }
        stats.byExpansion[exp].total = stats.byExpansion[exp].total + 1
        local questID = resolution[entry.matchKey] and resolution[entry.matchKey].id
        if questID then
            stats.discovered = stats.discovered + 1
            stats.byExpansion[exp].discovered = stats.byExpansion[exp].discovered + 1
            if DT.QuestLog:GetStatus(questID) == DT.STATUS.COMPLETED then
                stats.completed = stats.completed + 1
            end
        end
    end
    return stats
end
