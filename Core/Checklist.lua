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

-- Index of our own harvested catalog (the shipped DT.BakedDetails, keyed by
-- quest ID) by normalized title -> { id, m }. This is the first-party
-- replacement for the old Questie giver table: it lets a name-only checklist
-- entry resolve to the real quest ID (and mapID, when we captured one) we saw
-- live. Built lazily once.
local bakedByTitle
local function ensureBakedIndex()
    if bakedByTitle then return end
    bakedByTitle = {}
    if not DT.BakedDetails then return end
    for id, info in pairs(DT.BakedDetails) do
        local _, key = normalize(info.n)
        if key and not bakedByTitle[key] then
            bakedByTitle[key] = { id = id, m = info.m }
        end
    end
end

-- Resolve a checklist entry to harvested catalog info (id/mapID) by title.
local function bakedFor(entry)
    ensureBakedIndex()
    return bakedByTitle[entry.matchKey]
end

-- Effective location: live (learned) zone if discovered, else the wiki-provided
-- zone, else the pre-mapped default. Returns (continent, zone).
local function effectiveLocation(entry, resolved, baked)
    local mapID = (resolved and resolved.mapID) or (baked and baked.m)
    if mapID and DT.Zones then
        local z = DT.Zones:Resolve(mapID)
        if z and z.zoneName then
            return z.continentName or entry.defContinent, z.zoneName
        end
    end
    if entry.zoneName then return entry.defContinent, entry.zoneName end
    return entry.defContinent, entry.defZone
end

-- Public: ensure the index is built (safe to call repeatedly).
function DT.Checklist:EnsureBuilt()
    if not next(titleIndex) then build() end
end

-- Append harvested REGULAR dailies (the shipped DT.BakedDetails table, keyed by
-- quest ID) that the name-only wiki checklist doesn't already cover. This carries
-- the dailies we've only ever seen live -- e.g. WoD garrison/Tanaan and modern
-- non-world-quest turn-in dailies. World quests are intentionally skipped here:
-- they come from the DB2 catalog (appendWorldQuestEntries) instead. Each quest is
-- classified into an expansion by its ID band. Honors the same `opts` filters.
local function appendBakedEntries(list, opts, emitted)
    local baked = DT.BakedDetails
    if not baked then return end
    local added = {}  -- guard against two harvested rows sharing a title
    for id, info in pairs(baked) do
        -- World quests are owned by the DB2 catalog; skip them here.
        if info.k ~= "worldquest" and not emitted[id] then
            local clean, key = normalize(info.n)
            -- Skip anything the wiki checklist already owns, or a dup we added.
            if key and not titleIndex[key] and not added[key] then
                local mapID = info.m
                local z = mapID and DT.Zones and DT.Zones:Resolve(mapID) or nil
                local continentName = z and z.continentName or nil
                local zoneName = z and z.zoneName or nil
                local expansion = DT.QuestData:GetExpansionForQuest(id)

                if (not opts.expansion or expansion == opts.expansion)
                and (not opts.type or opts.type == "Daily")
                and (not opts.continentName or continentName == opts.continentName)
                and (not opts.zoneName or zoneName == opts.zoneName) then
                    local status = DT.QuestLog:GetStatus(id) or DT.STATUS.UNDISCOVERED
                    if opts.undiscovered ~= false or status ~= DT.STATUS.UNDISCOVERED then
                        added[key] = true
                        emitted[id] = true
                        list[#list + 1] = {
                            title         = clean,
                            rawTitle      = info.n,
                            expansion     = expansion,
                            type          = "Daily",
                            category      = nil,
                            side          = info.f,
                            questID       = id,
                            status        = status,
                            pinned        = DT.DB:IsPinned(id),
                            continentName = continentName,
                            zoneName      = zoneName,
                            giver         = DT.DB:GetQuestGiver(id),
                        }
                    end
                end
            end
        end
    end
end

-- Append the world-quest catalog mined from Blizzard's retail DB2 (the shipped
-- DT.WorldQuests table, keyed by quest ID). Each entry already carries its
-- expansion key and uiMapID, so classification and zone are first-party and
-- exact. World-quest status is rotation-aware (see QuestLog:GetWorldQuestStatus):
-- WQs that exist but aren't currently up read as INACTIVE.
local function appendWorldQuestEntries(list, opts, emitted)
    local wq = DT.WorldQuests
    if not wq then return end
    -- By default only currently-active world quests show (a tracker wants what's
    -- actionable, not all ~3.6k that exist). Opt in to the full catalog via the
    -- showInactiveWQ setting.
    local showInactive = DT.DB:GetSetting("showInactiveWQ")
    for id, info in pairs(wq) do
        if not emitted[id] then
            local z = info.m and DT.Zones and DT.Zones:Resolve(info.m) or nil
            local continentName = z and z.continentName or nil
            local zoneName = z and z.zoneName or nil
            local expansion = info.e or DT.QuestData:GetExpansionForQuest(id)

            if (not opts.expansion or expansion == opts.expansion)
            and (not opts.type or opts.type == "WorldQuest")
            and (not opts.continentName or continentName == opts.continentName)
            and (not opts.zoneName or zoneName == opts.zoneName) then
                local status = DT.QuestLog:GetWorldQuestStatus(id)
                if (showInactive or status ~= DT.STATUS.INACTIVE)
                and (opts.undiscovered ~= false or status ~= DT.STATUS.UNDISCOVERED) then
                    emitted[id] = true
                    list[#list + 1] = {
                        title         = info.n,
                        rawTitle      = info.n,
                        expansion     = expansion,
                        type          = "WorldQuest",
                        category      = info.t,        -- e.g. "Battle Pet World Quest"
                        side          = nil,
                        questID       = id,
                        status        = status,
                        pinned        = DT.DB:IsPinned(id),
                        continentName = continentName,
                        zoneName      = zoneName,
                        giver         = DT.DB:GetQuestGiver(id),
                    }
                end
            end
        end
    end
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

    local playerFaction = UnitFactionGroup and UnitFactionGroup("player") or nil
    local showSeasonal = DT.DB:GetSetting("showSeasonal")

    local list = {}
    local emitted = {}  -- quest IDs already placed, so later sources don't dup
    for _, entry in ipairs(DT.ChecklistData.entries) do
        local resolved = resolution[entry.matchKey]
        local baked = bakedFor(entry)
        local continentName, zoneName = effectiveLocation(entry, resolved, baked)

        if (not opts.expansion or entry.expansion == opts.expansion)
        and (not opts.type or entry.type == opts.type)
        and (not opts.continentName or continentName == opts.continentName)
        and (not opts.zoneName or zoneName == opts.zoneName)
        -- Hide the opposite faction's variant of a quest.
        and (not entry.side or entry.side == "Both" or not playerFaction
             or entry.side == playerFaction)
        -- Hide holiday/seasonal dailies unless the player opts in.
        and (showSeasonal or not entry.seasonal) then
            -- Quest ID: the wiki list now ships real IDs; learned/harvested only
            -- serve as a fallback for any entry without one.
            local questID = entry.id or (resolved and resolved.id) or (baked and baked.id) or nil
            local status = questID and DT.QuestLog:GetStatus(questID) or DT.STATUS.UNDISCOVERED
            -- Giver: live capture wins; else the wiki's giver (name + coords).
            local giver = questID and DT.DB:GetQuestGiver(questID) or nil
            if not giver then
                local wd = questID and DT.WikiDetails and DT.WikiDetails[questID]
                if wd and wd.g then
                    giver = { name = wd.g.n, mapID = wd.g.m, x = wd.g.x, y = wd.g.y, loc = wd.g.loc }
                elseif entry.giver then
                    giver = { name = entry.giver }
                end
            end
            if opts.undiscovered ~= false or status ~= DT.STATUS.UNDISCOVERED then
                if questID then emitted[questID] = true end
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
                    giver         = giver,
                }
            end
        end
    end

    -- Fold in harvested regular dailies the wiki list doesn't cover, then the
    -- DB2 world-quest catalog. `emitted` keeps the three sources from duplicating.
    appendBakedEntries(list, opts, emitted)
    appendWorldQuestEntries(list, opts, emitted)
    return list
end

-- Look up the best checklist metadata for an in-game title (or nil).
local function metaForTitle(name)
    local _, key = normalize(name)
    local list = key and titleIndex[key]
    return list and list[1] or nil
end

-- Public: is this in-game title one of our known dailies? Returns the matching
-- checklist entry (with expansion/type/category/side), or nil. Used by the
-- harvester's discovery crawl to recognize dailies by name, first-party.
function DT.Checklist:FindByTitle(name)
    self:EnsureBuilt()
    return metaForTitle(name)
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
-- Counts the wiki master list PLUS harvested modern dailies, so the totals
-- line up with what the views actually show.
function DT.Checklist:GetStats()
    self:EnsureBuilt()
    local resolution = buildResolution()
    local stats = { total = 0, discovered = 0, completed = 0, byExpansion = {} }

    local function tally(exp, discovered, completed)
        local b = stats.byExpansion[exp] or { total = 0, discovered = 0 }
        stats.byExpansion[exp] = b
        b.total = b.total + 1
        stats.total = stats.total + 1
        if discovered then
            b.discovered = b.discovered + 1
            stats.discovered = stats.discovered + 1
            if completed then stats.completed = stats.completed + 1 end
        end
    end

    local showSeasonal = DT.DB:GetSetting("showSeasonal")
    for _, entry in ipairs(DT.ChecklistData.entries) do
        if showSeasonal or not entry.seasonal then
            local questID = entry.id or (resolution[entry.matchKey] and resolution[entry.matchKey].id)
            tally(entry.expansion, questID ~= nil,
                  questID and DT.QuestLog:GetStatus(questID) == DT.STATUS.COMPLETED)
        end
    end

    -- Harvested regular dailies not already on the wiki list (world quests are
    -- counted from the DB2 catalog below). These always have a real quest ID.
    if DT.BakedDetails then
        local added = {}
        for id, info in pairs(DT.BakedDetails) do
            if info.k ~= "worldquest" then
                local _, key = normalize(info.n)
                if key and not titleIndex[key] and not added[key] then
                    added[key] = true
                    tally(DT.QuestData:GetExpansionForQuest(id), true,
                          DT.QuestLog:GetStatus(id) == DT.STATUS.COMPLETED)
                end
            end
        end
    end

    -- DB2 world-quest catalog (every WQ has a real ID; "completed" means done
    -- for the current period).
    if DT.WorldQuests then
        for id, info in pairs(DT.WorldQuests) do
            tally(info.e or DT.QuestData:GetExpansionForQuest(id), true,
                  C_QuestLog and C_QuestLog.IsQuestFlaggedCompleted
                  and C_QuestLog.IsQuestFlaggedCompleted(id) or false)
        end
    end

    return stats
end
