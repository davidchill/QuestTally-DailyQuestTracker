-- Constants.lua
-- Static definitions used across the addon: version, expansion list, colors.
-- Every file in this addon receives the addon name and a shared table as varargs.
-- `DT` is our private namespace; everything we attach to it is visible to the
-- other files but invisible to the rest of the WoW UI (no global pollution).
local addonName, DT = ...

DT.ADDON_NAME = addonName
DT.VERSION = "0.1.1"

-- Expansion catalog keys. We order them so the UI can display oldest -> newest
-- (or reverse). `id` matches Blizzard's LE_EXPANSION_* constants where useful,
-- but we keep our own table so the addon doesn't break if those constants
-- are missing on older clients.
DT.EXPANSIONS = {
    { key = "CLASSIC",     id = 0,  name = "Classic",            short = "Vanilla" },
    { key = "TBC",         id = 1,  name = "The Burning Crusade", short = "TBC" },
    { key = "WRATH",       id = 2,  name = "Wrath of the Lich King", short = "WotLK" },
    { key = "CATA",        id = 3,  name = "Cataclysm",          short = "Cata" },
    { key = "MOP",         id = 4,  name = "Mists of Pandaria",  short = "MoP" },
    { key = "WOD",         id = 5,  name = "Warlords of Draenor", short = "WoD" },
    { key = "LEGION",      id = 6,  name = "Legion",             short = "Legion" },
    { key = "BFA",         id = 7,  name = "Battle for Azeroth", short = "BfA" },
    { key = "SHADOWLANDS", id = 8,  name = "Shadowlands",        short = "SL" },
    { key = "DRAGONFLIGHT",id = 9,  name = "Dragonflight",       short = "DF" },
    { key = "TWW",         id = 10, name = "The War Within",     short = "TWW" },
    { key = "OTHER",       id = 99, name = "Uncategorized",      short = "Other" },
}

-- Fast lookup: expansion key -> display info.
DT.EXPANSION_BY_KEY = {}
for _, exp in ipairs(DT.EXPANSIONS) do
    DT.EXPANSION_BY_KEY[exp.key] = exp
end

-- Status a daily can be in, from the player's perspective.
DT.STATUS = {
    AVAILABLE    = "AVAILABLE",    -- known daily, not in log, not completed today
    IN_PROGRESS  = "IN_PROGRESS",  -- accepted, in the quest log
    READY_TURNIN = "READY_TURNIN", -- objectives done, ready to hand in
    COMPLETED    = "COMPLETED",    -- completed/turned in today (on cooldown until reset)
    UNDISCOVERED = "UNDISCOVERED", -- on the master checklist, but we don't know its ID yet
    UNKNOWN      = "UNKNOWN",
}

-- Colors used by the UI (r, g, b in 0-1).
DT.COLORS = {
    [DT.STATUS.AVAILABLE]    = { 1.00, 0.82, 0.00 }, -- gold
    [DT.STATUS.IN_PROGRESS]  = { 0.40, 0.70, 1.00 }, -- blue
    [DT.STATUS.READY_TURNIN] = { 0.40, 1.00, 0.40 }, -- green
    [DT.STATUS.COMPLETED]    = { 0.50, 0.50, 0.50 }, -- gray
    [DT.STATUS.UNDISCOVERED] = { 0.45, 0.40, 0.55 }, -- muted purple
    [DT.STATUS.UNKNOWN]      = { 0.80, 0.80, 0.80 },
}

-- Short human label for each status, shown in the list.
DT.STATUS_LABEL = {
    [DT.STATUS.AVAILABLE]    = "Available",
    [DT.STATUS.IN_PROGRESS]  = "In Progress",
    [DT.STATUS.READY_TURNIN] = "Ready to Turn In",
    [DT.STATUS.COMPLETED]    = "Done Today",
    [DT.STATUS.UNDISCOVERED] = "Not Yet Seen",
    [DT.STATUS.UNKNOWN]      = "Unknown",
}
