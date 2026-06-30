-- Core/Route.lua
-- "Today's Route" ordering: turn a set of quest entries into a nearest-giver
-- travel path from where the player is standing, so the Current Zone tab and the
-- Pinned panel can list dailies in the order you'd actually run them.
--
-- The trick that makes ONE algorithm serve both a single zone and a cross-zone
-- pin list is HereBeDragons world coordinates: HBD:GetWorldCoordinatesFromZone
-- maps every giver's zone-relative x/y into a shared continuous space (per map
-- "instance" -- continent/Azeroth/etc.), so distances are comparable whether the
-- givers share a zone or span continents. Without HBD loaded this degrades to a
-- no-op (everything returns in its original order, unnumbered).
local addonName, DT = ...

DT.Route = {}

local LibStub = _G.LibStub
local function getHBD()
    return LibStub and LibStub("HereBeDragons-2.0", true)
end

-- Statuses worth routing to: ones where you physically travel to the giver (pick
-- up, finish, or hand in). Completed / inactive / not-yet-seen are skipped -- they
-- still show, but after the route and without a step number.
local ROUTABLE_STATUS = {
    [DT.STATUS.AVAILABLE]    = true,
    [DT.STATUS.IN_PROGRESS]  = true,
    [DT.STATUS.READY_TURNIN] = true,
}

-- World position of an entry's giver (wx, wy, instance), or nil if we can't place
-- it (no coords, or HBD couldn't resolve the map).
local function giverWorld(HBD, e)
    local g = e.giver
    if not (g and g.mapID and g.x and g.y) then return nil end
    return HBD:GetWorldCoordinatesFromZone(g.x, g.y, g.mapID)
end

-- Public: order `entries` nearest-first by their giver's distance from the player.
-- Returns a flat array of { entry = <entry>, dist = <yards or nil> }:
--   * placeable entries (routable status + giver coords in the player's instance)
--     first, sorted by ascending distance, each carrying its straight-line `dist`;
--   * then placeable entries in OTHER instances (distance not comparable) -> dist nil;
--   * then the rest (completed / unplaceable) in original order, dist nil.
-- Pure: never mutates the entries it's handed (dist lives on the returned wrapper).
function DT.Route:Order(entries)
    local HBD = getHBD()

    -- Player's position. May be unavailable (loading screen, some instances); then
    -- no distances can be computed and everything routable falls to the dist-less set.
    local px, py, pInst
    if HBD then px, py, pInst = HBD:GetPlayerWorldPosition() end

    local pts, rest = {}, {}
    for _, e in ipairs(entries) do
        local wx, wy, inst
        if HBD and ROUTABLE_STATUS[e.status] then
            wx, wy, inst = giverWorld(HBD, e)
        end
        if wx then
            -- Distance only meaningful within the player's own map instance.
            local dist
            if px and inst == pInst then
                local dx, dy = wx - px, wy - py
                dist = math.sqrt(dx * dx + dy * dy)
            end
            pts[#pts + 1] = { entry = e, dist = dist }
        else
            rest[#rest + 1] = e
        end
    end

    -- Known distance ascending; dist-less placeables after (stable by title).
    table.sort(pts, function(a, b)
        if (a.dist == nil) ~= (b.dist == nil) then return b.dist == nil end
        if a.dist and b.dist then return a.dist < b.dist end
        return (a.entry.title or "") < (b.entry.title or "")
    end)

    local ordered = {}
    for _, p in ipairs(pts) do
        ordered[#ordered + 1] = { entry = p.entry, dist = p.dist }
    end
    for _, e in ipairs(rest) do
        ordered[#ordered + 1] = { entry = e }  -- no distance: shown after the route
    end
    return ordered
end

-- Public: format a distance for display, e.g. "142 yd", or nil if no distance.
-- The value is in yards: HereBeDragons world coordinates are a yard grid, so the
-- straight-line distance computed in Order() is already in yards.
function DT.Route:FormatDistance(dist)
    if not dist then return nil end
    return string.format("%d yd", math.floor(dist + 0.5))
end
