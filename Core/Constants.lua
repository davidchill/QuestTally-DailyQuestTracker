-- Constants.lua
-- Static definitions used across the addon: version, expansion list, colors.
-- Every file in this addon receives the addon name and a shared table as varargs.
-- `DT` is our private namespace; everything we attach to it is visible to the
-- other files but invisible to the rest of the WoW UI (no global pollution).
local addonName, DT = ...

DT.ADDON_NAME = addonName
DT.VERSION = "0.9.0"

-- Expansion catalog keys. We order them so the UI can display oldest -> newest
-- (or reverse). `id` matches Blizzard's LE_EXPANSION_* constants where useful,
-- but we keep our own table so the addon doesn't break if those constants
-- are missing on older clients.
DT.EXPANSIONS = {
    { key = "CLASSIC",     id = 0,  name = "Classic (Vanilla)",  short = "Vanilla" },
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
    { key = "MIDNIGHT",    id = 11, name = "Midnight",           short = "Midnight" },
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
    INACTIVE     = "INACTIVE",     -- a world quest that exists but isn't currently up
    UNDISCOVERED = "UNDISCOVERED", -- on the master checklist, but we don't know its ID yet
    UNKNOWN      = "UNKNOWN",
}

-- THE one "completion" green (sage). It means exactly one thing across the whole
-- addon -- done / ready / arrived -- and nothing else. Everything that signals
-- completion references this single table: the Ready-to-Turn-In status, the
-- title-bar progress counter, the route "arrived" marker, and the completed
-- checkbox. (Expansion brand greens are a separate identity family and keep their
-- own hues.) Change it here to retune every completion cue at once.
DT.COMPLETE_GREEN = { 0.46, 0.72, 0.46 } -- sage

-- Colors used by the UI (r, g, b in 0-1). Tuned darker and lower-saturation so
-- nothing glows against the dark panel; each still reads as its own status.
DT.COLORS = {
    [DT.STATUS.AVAILABLE]    = { 0.82, 0.68, 0.28 }, -- muted amber
    [DT.STATUS.IN_PROGRESS]  = { 0.42, 0.60, 0.78 }, -- steel blue
    [DT.STATUS.READY_TURNIN] = DT.COMPLETE_GREEN,    -- the shared completion sage
    [DT.STATUS.COMPLETED]    = { 0.45, 0.45, 0.47 }, -- gray
    [DT.STATUS.INACTIVE]     = { 0.36, 0.38, 0.44 }, -- dim slate (exists, not up now)
    [DT.STATUS.UNDISCOVERED] = { 0.40, 0.36, 0.48 }, -- muted purple
    [DT.STATUS.UNKNOWN]      = { 0.62, 0.62, 0.64 },
}

-- Accent color per expansion (r, g, b in 0-1), used by the modern UI to tint
-- each collapsible section's accent bar, icon, and title. Each is keyed to its
-- expansion logo's signature color, then held to a mid tone so it reads on the
-- dark panel (the section gradient lights the top edge). Where logos share a
-- family (the warm Cata/WoD pair, the TBC/MoP/Legion greens) the hue/lightness
-- is nudged so adjacent sections stay distinguishable. OTHER is neutral slate.
DT.EXPANSION_COLORS = {
    CLASSIC      = { 0.74, 0.62, 0.30 }, -- gold lettering
    TBC          = { 0.36, 0.56, 0.30 }, -- fel green portal
    WRATH        = { 0.44, 0.64, 0.84 }, -- Lich King frost blue
    CATA         = { 0.84, 0.44, 0.18 }, -- Deathwing fire orange
    MOP          = { 0.34, 0.64, 0.46 }, -- jade green
    WOD          = { 0.64, 0.31, 0.27 }, -- Iron Horde red
    LEGION       = { 0.55, 0.66, 0.22 }, -- fel lime green
    BFA          = { 0.80, 0.58, 0.26 }, -- azerite bronze-gold
    SHADOWLANDS  = { 0.42, 0.66, 0.74 }, -- cold anima cyan
    DRAGONFLIGHT = { 0.24, 0.62, 0.50 }, -- Dragon Isles teal
    TWW          = { 0.34, 0.52, 0.72 }, -- earthen azure
    MIDNIGHT     = { 0.56, 0.36, 0.66 }, -- void violet
    OTHER        = { 0.45, 0.45, 0.50 }, -- slate
}

-- Breadcrumb / location accent colors, shared by the tracker sub-bar and the
-- detail panel so a "Continent — Zone" path reads the same everywhere. The
-- continent is a muted cool grey (the broader parent context); the zone is the
-- brighter blue accent (the specific, emphasised part).
DT.ZONE_ACCENT      = { 0.36, 0.62, 0.92 }
DT.CONTINENT_ACCENT = { 0.64, 0.69, 0.80 }

-- Format an {r,g,b} color (0-1 components) as an "RRGGBB" hex string for inline
-- |cff..|r color codes.
function DT.ToHex(c)
    return string.format("%02x%02x%02x",
        math.floor(c[1] * 255), math.floor(c[2] * 255), math.floor(c[3] * 255))
end

-- Short human label for each status, shown in the list.
DT.STATUS_LABEL = {
    [DT.STATUS.AVAILABLE]    = "Available",
    [DT.STATUS.IN_PROGRESS]  = "In Progress",
    [DT.STATUS.READY_TURNIN] = "Ready to Turn In",
    [DT.STATUS.COMPLETED]    = "Done Today",
    [DT.STATUS.INACTIVE]     = "Not Active",
    [DT.STATUS.UNDISCOVERED] = "Not Yet Seen",
    [DT.STATUS.UNKNOWN]      = "Unknown",
}
