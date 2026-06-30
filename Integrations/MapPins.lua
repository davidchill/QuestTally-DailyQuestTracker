-- Integrations/MapPins.lua
-- Optional world-map + minimap pins at the quest givers of AVAILABLE dailies in
-- your CURRENT ZONE, drawn via the embedded HereBeDragons-Pins library.
--
-- Scope is deliberately the current zone only: a tracker pin answers "where do I
-- go in THIS zone", and pinning every available daily across the catalog would
-- bury the map. As you move between zones the pins rebuild (Core's ZONE_CHANGED
-- refresh drives DT.MapPins:Refresh, same throttle as the tracker window).
--
-- The whole module no-ops if HereBeDragons is missing or the player has turned
-- pins off (the "Map pins" Filters checkbox -> showMapPins setting).
--
-- HereBeDragons-Pins notes:
--   * A pin's icon must be a Frame; HBD reparents it onto the map/minimap, so a
--     world-map pin and a minimap pin need SEPARATE frames (one frame can't live
--     on both) -- hence the two pools below.
--   * pins:AddWorldMapIconMap(ref, icon, uiMapID, x, y, showFlag) -- x/y are 0-1.
--   * pins:AddMinimapIconMap(ref, icon, uiMapID, x, y, showInParentZone, floatOnEdge)
--   * pins:RemoveAllWorldMapIcons(ref) / RemoveAllMinimapIcons(ref) release ours
--     without touching other addons' pins (REF is our private ownership token).
local addonName, DT = ...

DT.MapPins = {}

local LibStub = _G.LibStub
local HBDPins = LibStub and LibStub("HereBeDragons-Pins-2.0", true)

local REF = {}  -- private token so RemoveAll*Icons only touches our pins

local AVAILABLE_TEX = "Interface\\GossipFrame\\AvailableQuestIcon"  -- yellow "!"
local TURNIN_TEX    = "Interface\\GossipFrame\\ActiveQuestIcon"     -- yellow "?"

-- Two pools (world / minimap) plus the currently-shown frames in each, so a
-- rebuild can recycle frames instead of churning them.
local worldPool, miniPool = {}, {}
local worldActive, miniActive = {}, {}

local function makePin()
    local pin = CreateFrame("Frame", nil, UIParent)
    pin:SetSize(16, 16)
    -- Leave strata/level to HereBeDragons: it reparents the frame onto the map
    -- canvas (or minimap) and manages layering there; forcing a strata here would
    -- fight that and can make pins draw over unrelated UI.
    local tex = pin:CreateTexture(nil, "OVERLAY")
    tex:SetAllPoints()
    pin.tex = tex
    pin:EnableMouse(true)
    pin:SetScript("OnEnter", function(self)
        local e = self.entry
        if not e then return end
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(e.title or "", 1, 1, 1)
        if e.giver and e.giver.name then
            GameTooltip:AddLine("Giver: " .. e.giver.name, 0.9, 0.8, 0.4)
        end
        if e.status == DT.STATUS.READY_TURNIN then
            GameTooltip:AddLine("Ready to turn in", 0.46, 0.72, 0.46)
        else
            GameTooltip:AddLine("Available", 0.82, 0.68, 0.28)
        end
        GameTooltip:AddLine("QuestTally", 0.3, 1, 0.6)
        GameTooltip:Show()
    end)
    pin:SetScript("OnLeave", function() GameTooltip:Hide() end)
    return pin
end

local function acquire(pool)
    local pin = table.remove(pool) or makePin()
    pin:Show()
    return pin
end

local function releaseAll()
    if HBDPins then
        HBDPins:RemoveAllWorldMapIcons(REF)
        HBDPins:RemoveAllMinimapIcons(REF)
    end
    for _, pin in ipairs(worldActive) do
        pin.entry = nil; pin:Hide(); worldPool[#worldPool + 1] = pin
    end
    for _, pin in ipairs(miniActive) do
        pin.entry = nil; pin:Hide(); miniPool[#miniPool + 1] = pin
    end
    wipe(worldActive); wipe(miniActive)
end

-- Public: rebuild the pin set for the player's current zone. Cheap and idempotent;
-- safe to call on every throttled refresh.
function DT.MapPins:Refresh()
    if not HBDPins then return end
    releaseAll()
    if not (DT.DB and DT.DB:GetSetting("showMapPins")) then return end

    local playerMap = C_Map and C_Map.GetBestMapForUnit and C_Map.GetBestMapForUnit("player")
    if not playerMap then return end

    for _, e in ipairs(DT.Checklist:GetEntries()) do
        local g = e.giver
        local actionable = (e.status == DT.STATUS.AVAILABLE or e.status == DT.STATUS.READY_TURNIN)
        if actionable and g and g.mapID == playerMap and g.x and g.y then
            local tex = (e.status == DT.STATUS.READY_TURNIN) and TURNIN_TEX or AVAILABLE_TEX

            local wp = acquire(worldPool)
            wp.entry = e; wp.tex:SetTexture(tex)
            worldActive[#worldActive + 1] = wp
            HBDPins:AddWorldMapIconMap(REF, wp, g.mapID, g.x, g.y, HBD_PINS_WORLDMAP_SHOW_PARENT)

            local mp = acquire(miniPool)
            mp.entry = e; mp.tex:SetTexture(tex)
            miniActive[#miniActive + 1] = mp
            -- showInParentZone=false (only our own zone), floatOnEdge=true (stick to
            -- the minimap rim with a direction hint when the giver is off-screen).
            HBDPins:AddMinimapIconMap(REF, mp, g.mapID, g.x, g.y, false, true)
        end
    end
end
