-- Integrations/TomTom.lua
-- Optional TomTom integration. The whole file is a no-op unless TomTom is
-- installed and loaded, so the addon works perfectly fine standalone.
--
-- When TomTom IS present, Shift+Left Click on a quest row (wired up in
-- MainFrame.lua) drops a TomTom waypoint -- complete with the directional
-- "crazy arrow" -- at that quest's giver, so you can navigate straight to it.
--
-- TomTom API notes (retail / Legion+):
--   * TomTom:AddWaypoint(uiMapID, x, y, opts) where x and y are 0-1 fractions
--     of the map -- exactly the form QuestTally already stores giver coords in
--     (C_Map.GetPlayerMapPosition returns 0-1, see QuestLog.captureGiver).
--   * opts.crazy enables the on-screen arrow; opts.from is shown in the
--     waypoint's tooltip so the user can see it came from us.
local addonName, DT = ...

DT.TomTom = {}

-- True only when TomTom's public waypoint API is actually present.
function DT.TomTom:IsAvailable()
    return TomTom ~= nil and type(TomTom.AddWaypoint) == "function"
end

-- Add a TomTom waypoint at a quest giver's location. `entry` is a checklist
-- entry; its `.giver` carries { name, mapID, x, y } (x/y are 0-1 fractions).
-- Returns true on success, or false plus a reason string the caller can turn
-- into a message:
--   "notomtom"   - TomTom isn't installed/loaded
--   "nolocation" - we don't know the giver's map position for this quest yet
function DT.TomTom:AddGiverWaypoint(entry)
    if not self:IsAvailable() then return false, "notomtom" end
    local g = entry and entry.giver
    if not g or not g.mapID or not g.x or not g.y then return false, "nolocation" end

    -- Label the waypoint with the giver's name (when known) and the quest title.
    local title = entry.title or "Quest giver"
    if g.name and g.name ~= "" then title = g.name .. " \226\128\147 " .. (entry.title or "Quest") end

    TomTom:AddWaypoint(g.mapID, g.x, g.y, {
        title      = title,
        from       = "QuestTally",
        minimap    = true,
        world      = true,
        crazy      = true,   -- show TomTom's directional arrow to the giver
        persistent = false,  -- a "go here now" pin, not a saved bookmark
    })
    return true
end
