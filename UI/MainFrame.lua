-- MainFrame.lua
-- The tracker window. Three viewing modes:
--   ZONE   - dailies located in the player's current zone (default)
--   BROWSE - search/browse discovered dailies by Continent -> Zone
--   ALL    - the full master checklist grouped by expansion
-- Built with plain Blizzard widgets (no libraries). Created lazily on first open.
--
-- Visual design: a flat dark panel with a title bar (overall progress counter),
-- a thin context sub-bar (zone / reset), collapsible color-coded sections, and a
-- bottom tab bar for the modes. The Core layer is untouched; this file only
-- decides how the data is laid out and styled.
local addonName, DT = ...

DT.UI = {}

local ROW_HEIGHT = 20
local REPBAR_HEIGHT = 24        -- reputation bar row (Faction tab)
local SECTION_HEIGHT = 24
local SUBSECTION_HEIGHT = 21   -- nested zone / themed sub-group headers (level 2)
local SUBSECTION_INDENT = 14   -- how far level-2 headers are inset from the left
local CONTENT_WIDTH = 332

local rowPool, activeRows = {}, {}
local mainFrame

-- Flat dark theme palette (r, g, b, a). Kept here so the look is tweakable in
-- one place.
-- Bars use a top->bottom gradient (the *2 keys are the darker bottom stop) plus
-- 1px bevel hairlines, so flat strips read as raised surfaces. panelBg is nearly
-- opaque so the game world behind it doesn't wash out the dark look.
local THEME = {
    panelBg    = { 0.06, 0.07, 0.09, 0.98 },
    panelEdge  = { 0.16, 0.17, 0.21, 1.00 },
    titleBg    = { 0.13, 0.14, 0.17, 1.00 }, -- gradient top
    titleBg2   = { 0.09, 0.10, 0.13, 1.00 }, -- gradient bottom
    subBarBg   = { 0.085, 0.095, 0.12, 1.00 },
    tabBarBg   = { 0.13, 0.14, 0.17, 1.00 },
    tabBarBg2  = { 0.09, 0.10, 0.13, 1.00 },
    tabActive  = { 0.22, 0.24, 0.30, 1.00 },
    tabActive2 = { 0.16, 0.17, 0.22, 1.00 },
    sectionBg  = { 1, 1, 1, 0.05 },   -- multiplied by the section accent
    divider    = { 1, 1, 1, 0.06 },
    bevelHi    = { 1, 1, 1, 0.05 },   -- top highlight hairline
    bevelLo    = { 0, 0, 0, 0.35 },   -- bottom shadow hairline
    progress   = DT.COMPLETE_GREEN,    -- done/total counter -> the shared completion sage
}

-- Popup that shows a copyable Wowhead URL. Addons can't open a browser directly,
-- so we present the link pre-selected for Ctrl+C (the standard approach).
StaticPopupDialogs["QUESTTALLY_WOWHEAD"] = {
    text = "Wowhead link — press Ctrl+C to copy:",
    button1 = OKAY,
    hasEditBox = true,
    editBoxWidth = 260,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    preferredIndex = 3,  -- avoid UI taint from the default index
    OnShow = function(self, data)
        local eb = self.editBox or (self.GetEditBox and self:GetEditBox())
        if eb and data then
            eb:SetText(data)
            eb:HighlightText()
            eb:SetFocus()
        end
    end,
    EditBoxOnEnterPressed = function(self) self:GetParent():Hide() end,
    EditBoxOnEscapePressed = function(self) self:GetParent():Hide() end,
    -- Keep the text fixed: if the user types, re-select the URL.
    EditBoxOnTextChanged = function(self, data)
        if data and self:GetText() ~= data then
            self:SetText(data)
            self:HighlightText()
        end
    end,
}

-- Show the Wowhead page link for a quest ID.
function DT.UI:ShowWowheadLink(questID)
    if not questID then return end
    local url = "https://www.wowhead.com/quest=" .. questID
    StaticPopup_Show("QUESTTALLY_WOWHEAD", nil, nil, url)
end

-- Generic "copy this text" popup (same Ctrl+C pattern as the Wowhead link), used
-- by the About page's Discord copy button. The prompt label is the first arg; the
-- pre-selected text is passed as data.
StaticPopupDialogs["QUESTTALLY_COPY"] = {
    text = "%s",
    button1 = OKAY,
    hasEditBox = true,
    editBoxWidth = 260,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    preferredIndex = 3,
    OnShow = function(self, data)
        local eb = self.editBox or (self.GetEditBox and self:GetEditBox())
        if eb and data then
            eb:SetText(data)
            eb:HighlightText()
            eb:SetFocus()
        end
    end,
    EditBoxOnEnterPressed = function(self) self:GetParent():Hide() end,
    EditBoxOnEscapePressed = function(self) self:GetParent():Hide() end,
    EditBoxOnTextChanged = function(self, data)
        if data and self:GetText() ~= data then
            self:SetText(data)
            self:HighlightText()
        end
    end,
}

-- Pop a copyable-text dialog: `label` is the prompt line, `text` is pre-selected.
function DT.UI:ShowCopyText(label, text)
    if not text then return end
    StaticPopup_Show("QUESTTALLY_COPY", label or "Press Ctrl+C to copy:", nil, text)
end

-- Shared quest-row click handling for the main list AND the Tracked panel, so the
-- click scheme lives in one place:
--   Left            — quest details / select
--   Middle          — track / untrack (adds to the Tracked panel)
--   Shift+Middle    — open the Wowhead quest link
--   Right           — set a map pin / waypoint at the giver
--   Shift+Right     — set a TomTom waypoint at the giver (if TomTom is installed)
-- `e` is a quest entry (with .questID/.title/.giver). Callers handle non-quest rows
-- (e.g. section headers) before calling this.
function DT.UI:RowAction(e, button)
    if not e then return end
    if IsShiftKeyDown() then
        if button == "MiddleButton" then
            if e.questID then self:ShowWowheadLink(e.questID) end
        elseif button == "RightButton" then
            -- Explicit `if` so AddGiverWaypoint's second return (`reason`) survives.
            local ok, reason
            if DT.TomTom then ok, reason = DT.TomTom:AddGiverWaypoint(e) end
            if ok then
                print(string.format("|cff33ff99QuestTally|r: TomTom waypoint set to %s.",
                    (e.giver and e.giver.name) or (e.title or "the quest giver")))
            elseif reason == "nolocation" then
                print("|cff33ff99QuestTally|r: no known giver location for this "
                    .. "quest yet — visit its giver once so QuestTally can learn it.")
            else
                print("|cff33ff99QuestTally|r: TomTom isn't installed — install it "
                    .. "to set waypoints with Shift+Right Click.")
            end
        end
        return
    end
    if button == "LeftButton" then
        if DT.Details then DT.Details:Toggle(e) end
    elseif button == "MiddleButton" then
        if e.questID then
            DT.DB:TogglePinned(e.questID)
            self:Refresh()
            if DT.Pinned then DT.Pinned:Refresh() end
        end
    elseif button == "RightButton" then
        if DT.QuestLog:SetGiverWaypoint(e.giver) then
            local g = e.giver
            print(string.format("|cff33ff99QuestTally|r: map pin set to %s%s.",
                (e.title or "quest"), (g and g.name) and (" — " .. g.name) or ""))
        else
            print("|cff33ff99QuestTally|r: no known giver location for this "
                .. "quest yet — visit its giver once so QuestTally can learn it.")
        end
    end
end

-- THE canonical interaction scheme, appended to a GameTooltip after a spacer. This is
-- the single source of truth for the quest-row controls -- every list that shows quest
-- rows (the main list, the Tracked panel) calls this so the scheme reads identically
-- across the whole addon; the Guide text mirrors the same wording. Lines are gated to
-- what's actually possible for this entry (needs a known quest id / giver location /
-- TomTom installed) so we never advertise an action that would just print "no info".
-- Keep this in lockstep with RowAction (the handler) and HELP_GUIDE (the reference).
function DT.UI:AppendActionHints(tt, e)
    if not (tt and e) then return end
    local KEY = { 0.5, 0.8, 1 }  -- shared light-blue for every control line
    tt:AddLine(" ")
    tt:AddLine("Left-click: quest details / select", KEY[1], KEY[2], KEY[3])
    if e.questID then
        tt:AddLine("Middle-click: track / untrack", KEY[1], KEY[2], KEY[3])
        tt:AddLine("Shift + Middle-click: open the Wowhead quest link", KEY[1], KEY[2], KEY[3])
    end
    if e.giver and e.giver.x then
        tt:AddLine("Right-click: set a map pin / waypoint at the giver", KEY[1], KEY[2], KEY[3])
        if DT.TomTom and DT.TomTom:IsAvailable() then
            tt:AddLine("Shift + Right-click: set a TomTom waypoint", KEY[1], KEY[2], KEY[3])
        end
    end
    if not e.questID then
        tt:AddLine("Not yet seen in-game; pick it up once so QuestTally can show its live status.",
            0.6, 0.55, 0.7)
    end
end

-- Paint a row's status checkbox (a small BackdropTemplate box with a check child) for
-- a status colour + completion flag. Shared by the main list and the Tracked panel so
-- the checklist glyph looks identical everywhere:
--   * outstanding -> hollow box, border tinted to the status colour (finer state);
--   * done today  -> filled with the shared completion sage + a check (colour-blind
--     safe: the CHECK carries "done", not the colour alone).
function DT.UI:StyleStatusCheckbox(box, statusColor, completed)
    if not box then return end
    if completed then
        local g = DT.COMPLETE_GREEN
        box:SetBackdropColor(g[1], g[2], g[3], 0.90)
        box:SetBackdropBorderColor(g[1] * 0.7, g[2] * 0.7, g[3] * 0.7, 1)
        if box.check then
            box.check:SetVertexColor(0.10, 0.18, 0.10, 1)  -- dark check on the sage fill
            box.check:Show()
        end
    else
        box:SetBackdropColor(0, 0, 0, 0.35)                -- hollow, dark interior
        box:SetBackdropBorderColor(statusColor[1], statusColor[2], statusColor[3], 1)
        if box.check then box.check:Hide() end
    end
end

-- Current view state.
DT.UI.mode = "ZONE"            -- ZONE | ALL (Expansion) | FACTION | SEARCH
DT.UI.searchQuery = ""         -- active search query (empty = inactive / Search-home)
local collapsed = false        -- title-bar collapsed to a logo-only chip (session only)

-- The quest currently shown in the detail panel, kept highlighted in the list.
-- Stored as id + title (not an entry reference) because rows/entries are rebuilt
-- on every refresh; the DetailPanel owns this state via DT.UI:SetSelectedQuest.
DT.UI.selectedQuestID = nil
DT.UI.selectedTitle = nil

-- Does this entry match the current selection? Mirrors DT.Details:Toggle's
-- identity rule: match on questID when it's known, else fall back to title (some
-- catalog entries have no questID until seen in-game).
local function entryIsSelected(e)
    if not e then return false end
    local sid, stitle = DT.UI.selectedQuestID, DT.UI.selectedTitle
    if sid == nil and stitle == nil then return false end
    if sid ~= nil or e.questID ~= nil then
        return e.questID == sid
    end
    return e.title == stitle
end

-- ---------------------------------------------------------------------------
-- Sorting helpers
-- ---------------------------------------------------------------------------
local STATUS_RANK = {
    [DT.STATUS.READY_TURNIN] = 1,
    [DT.STATUS.IN_PROGRESS]  = 2,
    [DT.STATUS.AVAILABLE]    = 3,
    [DT.STATUS.COMPLETED]    = 4,
    [DT.STATUS.INACTIVE]     = 5,
    [DT.STATUS.UNDISCOVERED] = 6,
    [DT.STATUS.UNKNOWN]      = 7,
}

local function sortEntries(a, b)
    if a.pinned ~= b.pinned then return a.pinned end
    local ra, rb = STATUS_RANK[a.status] or 9, STATUS_RANK[b.status] or 9
    if ra ~= rb then return ra < rb end
    return (a.title or "") < (b.title or "")
end

local function expansionOrderIndex(expKey)
    local exp = DT.EXPANSION_BY_KEY[expKey]
    if not exp then return 999 end
    if DT.DB:GetSetting("expansionOrder") == "NEWEST" then return -exp.id end
    return exp.id
end

-- ---------------------------------------------------------------------------
-- Quest-kind classification (Profession / Battle Pet / PvP / Incursion)
-- ---------------------------------------------------------------------------
-- Quests are grouped by zone; their *kind* is shown as a small inline tag on the
-- row instead of a separate group, so e.g. a fishing daily and a battle in the
-- same zone sit together, each labeled. These classifiers also drive the
-- show/hide settings toggles. The data already labels most kinds: ChecklistData
-- uses type="Profession" / category="Battle Pets", and the world-quest catalog
-- stores its subtype in `category` (e.g. "Mining World Quest", "PvP World Quest").
local PROFESSION_WQ = {
    ["Alchemy World Quest"]       = true, ["Blacksmithing World Quest"] = true,
    ["Cooking World Quest"]       = true, ["Enchanting World Quest"]    = true,
    ["Engineering World Quest"]   = true, ["Fishing World Quest"]       = true,
    ["Herbalism World Quest"]     = true, ["Inscription World Quest"]   = true,
    ["Jewelcrafting World Quest"] = true, ["Leatherworking World Quest"]= true,
    ["Mining World Quest"]        = true, ["Skinning World Quest"]      = true,
    ["Tailoring World Quest"]     = true,
}

-- Profession dailies store the profession name directly in `category` (e.g.
-- "Jewelcrafting", "Cooking"). NOTE: `category` is overloaded — most quests use
-- it for a zone or holiday — so we match against this explicit whitelist of real
-- professions rather than treating any category as a profession. This also catches
-- entries whose `type` isn't "Profession" (e.g. Elemental Goo is type="Faction").
local PROFESSIONS = {
    ["Alchemy"]       = true, ["Blacksmithing"] = true, ["Cooking"]      = true,
    ["Enchanting"]    = true, ["Engineering"]   = true, ["Fishing"]      = true,
    ["Herbalism"]     = true, ["Inscription"]   = true, ["Jewelcrafting"]= true,
    ["Leatherworking"]= true, ["Mining"]        = true, ["Skinning"]     = true,
    ["Tailoring"]     = true, ["Archaeology"]   = true, ["First Aid"]    = true,
}

-- The specific profession to show on a quest's inline tag, or nil if not a
-- profession daily. World-quest profession variants are excluded — world quests
-- are filtered out of the list entirely and never render a row.
local function professionLabel(e)
    if e.category and PROFESSIONS[e.category] then return e.category end
    return nil
end

local function isBattlePet(e)
    return e.category == "Battle Pets"
        or (e.category and e.category:find("Battle Pet", 1, true) ~= nil)
end

local function isProfession(e)
    if e.type == "Profession" then return true end
    if professionLabel(e) then return true end
    return e.category ~= nil and PROFESSION_WQ[e.category] == true
end

-- Incursion content (e.g. "Nightmare Incursion" in TWW). Matched on the category
-- so future incursion flavors are caught without a curated list.
local function isIncursion(e)
    return e.category ~= nil and e.category:find("Incursion", 1, true) ~= nil
end

-- A few PvP zone-event dailies carry no PvP signal in the data (their category
-- is just the zone, e.g. the TWW Ashenvale battle). Tag them by quest ID. Extend
-- this set as new ones appear — it only drives the label, not the zone grouping.
local PVP_QUESTS = {
    [79090] = true, -- Repelling Invaders   (Ashenvale, Alliance) -- detail-only, not yet a tracked entry
    [79098] = true, -- Clear the Forest!    (Ashenvale, Horde)    -- detail-only, not yet a tracked entry
    -- Halaa world-PvP dailies (Nagrand, TBC): objective is "Defeat 10 enemy
    -- players", honor-rewarding, Wowhead-flagged "PvP required". Categorized by
    -- zone in the data, so they carry no PvP signal without this.
    [11502] = true, -- In Defense of Halaa  (Nagrand, Alliance)
    [11503] = true, -- Enemies Old and New  (Nagrand, Horde)
    -- Auchindoun spirit-tower dailies (Terokkar, TBC): "Secure a Spirit Tower" in
    -- the contested Bone Wastes — world-PvP *zone control*, the same basis on
    -- which PVP_ZONES already classifies Tol Barad as PvP.
    [11505] = true, -- Spirits of Auchindoun (Terokkar, Alliance)
    [11506] = true, -- Spirits of Auchindoun (Terokkar, Horde)
}

-- Contested PvP-control zones: every daily here is gated on your faction holding
-- the zone, so the whole zone reads as PvP content (Wintergrasp is listed for
-- consistency though it has no dailies in the current catalog).
local PVP_ZONES = {
    ["Tol Barad"]            = true,
    ["Tol Barad Peninsula"]  = true,
    ["Wintergrasp"]          = true,
}

-- PvP dailies: battleground "Call to Arms" quests, the PvP world-quest subtypes
-- ("PvP World Quest" / "PvP Elite World Quest"), the contested-zone dailies, and
-- the curated zone-event set.
local function isPvP(e)
    if e.questID and PVP_QUESTS[e.questID] then return true end
    if e.category and e.category:find("PvP", 1, true) then return true end
    if (e.zoneName and PVP_ZONES[e.zoneName]) or (e.category and PVP_ZONES[e.category]) then return true end
    local t = e.rawTitle or e.title
    return t ~= nil and t:find("^Call to Arms:") ~= nil
end

-- A *genuine* world quest — the kind Blizzard surfaces on the world map and
-- tracks natively. The catalog's category carries the subtype, so anything with
-- "World Quest" in it qualifies ("Battle Pet World Quest", "Mining World Quest",
-- ...). NOTE: the catalog also holds task quests that are NOT world quests
-- (Callings, Combat Ally, Island Weekly) — those have no "World Quest" in their
-- category, so they're correctly excluded here and tracked as ordinary dailies.
local function isWorldQuest(e)
    return e.category ~= nil and e.category:find("World Quest", 1, true) ~= nil
end

-- Non-WQ task quests that we DO track as dailies. Tagged so they stand out from
-- ordinary faction dailies in the same zone.
local function isCalling(e)    return e.category == "Calling Quest" end
local function isCombatAlly(e) return e.category == "Combat Ally Quest" end

-- Skyriding/dragonriding race courses (API-sourced gap entries mark these). Lots
-- of Advanced/Reverse/Challenge variants, so they're hidden behind a setting.
local function isRace(e) return e.type == "Race" or e.category == "Skyriding Race" end

-- Holiday / world-event dailies (Brewfest, Hallow's End, Love is in the Air, ...)
-- ship as type="Event"; the showSeasonal setting already gates them, the tag just
-- labels them. Garrison Support is the WoD garrison follower-mission hub.
local function isHoliday(e)  return e.type == "Event" end
-- Garrison follower-mission hub. The wiki labels most of these "Garrison Support"
-- but a few carry the bare "Garrison" spelling; accept both so none slip through.
local function isGarrison(e) return e.category == "Garrison Support" or e.category == "Garrison" end

-- Quest-kind labels — shown as an inline tag on the row (content isn't grouped
-- by these; it's grouped by zone).
local SUB_PROFESSIONS = "Professions"
local SUB_BATTLEPETS  = "Battle Pets"
local SUB_PVP         = "PvP"
local SUB_INCURSIONS  = "Incursions"
local SUB_CALLING     = "Calling"
local SUB_ALLY        = "Combat Ally"
local SUB_RACE        = "Skyracing"
local SUB_HOLIDAY     = "Holiday"
local SUB_GARRISON    = "Garrison"

-- Most specific first, so e.g. a "Battle Pet World Quest" wins over its zone.
local function themedSubgroup(e)
    if isRace(e)       then return SUB_RACE        end
    if isBattlePet(e)  then return SUB_BATTLEPETS  end
    if isProfession(e) then return SUB_PROFESSIONS end
    if isIncursion(e)  then return SUB_INCURSIONS  end
    if isPvP(e)        then return SUB_PVP         end
    if isCalling(e)    then return SUB_CALLING     end
    if isCombatAlly(e) then return SUB_ALLY        end
    if isGarrison(e)   then return SUB_GARRISON    end
    if isHoliday(e)    then return SUB_HOLIDAY     end
    return nil
end

-- Accent colors for each kind (used for the row tags).
local SUBGROUP_ACCENT = {
    [SUB_PROFESSIONS] = { 0.85, 0.62, 0.28 }, -- warm amber (a wrench / forge feel)
    [SUB_BATTLEPETS]  = { 0.70, 0.50, 0.34 }, -- warm brown/tan (fur); moved off green
                                              -- so green reads only as completion
    [SUB_PVP]         = { 0.86, 0.38, 0.36 }, -- red (conflict)
    [SUB_INCURSIONS]  = { 0.64, 0.46, 0.86 }, -- purple (nightmare / void)
    [SUB_CALLING]     = { 0.40, 0.70, 0.74 }, -- teal (covenant callings)
    [SUB_ALLY]        = { 0.46, 0.62, 0.86 }, -- blue (follower / ally)
    [SUB_RACE]        = { 0.40, 0.78, 0.90 }, -- cyan (speed / sky)
    [SUB_HOLIDAY]     = { 0.90, 0.55, 0.78 }, -- pink (festive)
    [SUB_GARRISON]    = { 0.66, 0.58, 0.40 }, -- khaki (garrison / outpost)
}

-- Weekly quests get a distinct gold tag that takes priority over the kind tag,
-- so the daily-vs-weekly distinction reads at a glance (weeklies are the minority).
local WEEKLY_ACCENT = { 0.95, 0.82, 0.40 }

-- Neutral slate used for the BACKGROUND of kind sub-section headers. The kind's
-- own accent (SUBGROUP_ACCENT) still colours the thin left spine, the icon and
-- the title text, but the header fill stays a cool neutral so three nested
-- same-hue bars (expansion -> zone -> kind) don't stack into a wall of colour.
local NEUTRAL_SECTION_BG = { 0.42, 0.45, 0.52 }

-- Short label drawn on a quest row's inline tag, per kind.
local SUB_BADGE = {
    [SUB_PROFESSIONS] = "Prof",
    [SUB_BATTLEPETS]  = "Pet",
    [SUB_PVP]         = "PvP",
    [SUB_INCURSIONS]  = "Incursion",
    [SUB_CALLING]     = "Calling",
    [SUB_ALLY]        = "Ally",
    [SUB_RACE]        = "Race",
    [SUB_HOLIDAY]     = "Holiday",
    [SUB_GARRISON]    = "Garrison",
}

-- Canonical order kind sub-sections render within a zone (matches the badge
-- priority above so the on-screen ordering is predictable). Any kind missing
-- here falls back to alphabetical after these.
local KIND_ORDER = {
    SUB_RACE, SUB_BATTLEPETS, SUB_PROFESSIONS, SUB_INCURSIONS,
    SUB_PVP, SUB_CALLING, SUB_ALLY, SUB_GARRISON, SUB_HOLIDAY,
}
local KIND_ORDER_INDEX = {}
for i, k in ipairs(KIND_ORDER) do KIND_ORDER_INDEX[k] = i end

-- Canonical zone label for grouping. Defined once in Core (DT.Zones:ZoneLabel)
-- so the Current Zone / All / Browse views, their dropdowns and filters all share
-- the SAME normalization (sub-hub aliases, junk-data cleanup). This is just a
-- thin local alias for terse call sites below.
local function zoneLabel(e)
    return DT.Zones:ZoneLabel(e)
end

-- Blizzard ships internal test / placeholder quests in the DB2 catalog, e.g.
-- "Calling Quest (DNT)" and "x.x Testing (YGR)" (DNT = "Do Not Translate"). These
-- aren't real content, so they're always hidden regardless of settings.
local function isPlaceholderQuest(e)
    local t = e.rawTitle or e.title
    if not t then return false end
    return t:find("%(DNT%)") ~= nil
        or t:find("%(YGR%)") ~= nil
        or t:find("^x%.x") ~= nil
end

-- Drop placeholder quests always; drop genuine world quests and profession /
-- battle-pet entries per the user's settings. Applied to the full entry list
-- before grouping so the filter holds in every view mode.
local function applyKindFilters(entries)
    local showProf  = DT.DB:GetSetting("showProfessions")
    local showPets  = DT.DB:GetSetting("showBattlePets")
    local showRaces = DT.DB:GetSetting("showRaces")
    local kept = {}
    for _, e in ipairs(entries) do
        -- Genuine world quests are always hidden: Blizzard surfaces and tracks
        -- them natively on the world map, so QuestTally stays focused on dailies.
        -- (The user toggle for these was removed from the Beta Filters panel, so
        -- this is hardcoded rather than read from a now-unsettable setting.)
        local drop = isPlaceholderQuest(e)
                  or isWorldQuest(e)
                  or (not showRaces and isRace(e))
                  or (not showPets and isBattlePet(e))
                  or (not showProf and isProfession(e))
        if not drop then kept[#kept + 1] = e end
    end
    return kept
end

-- How many entries in a list count as "done today".
local function doneCount(list)
    local n = 0
    for _, e in ipairs(list) do
        if e.status == DT.STATUS.COMPLETED then n = n + 1 end
    end
    return n
end

-- Lighten an accent color a touch for use as title text on a dark background.
local function lighten(c, amt)
    amt = amt or 0.25
    return math.min(1, c[1] + amt), math.min(1, c[2] + amt), math.min(1, c[3] + amt)
end

-- Split an expansion's entries into ordered zone sub-groups (alphabetical, with
-- the catch-all "Other" sinking to the bottom). Quest *type* — Profession, Battle
-- Pet, PvP, Incursion — is conveyed by a per-row tag rather than a separate
-- group, so everything lives under its zone. Each result is { name, list }.
local function subgroupEntries(entries)
    local groups, names = {}, {}
    for _, e in ipairs(entries) do
        local name = zoneLabel(e) or "Other"
        if not groups[name] then groups[name] = {}; names[#names+1] = name end
        table.insert(groups[name], e)
    end
    table.sort(names, function(a, b)
        if (a == "Other") ~= (b == "Other") then return b == "Other" end
        return a < b
    end)
    local ordered = {}
    for _, name in ipairs(names) do
        ordered[#ordered+1] = { name = name, list = groups[name] }
    end
    return ordered
end

-- Emit a zone section that may contain nested sub-zone groups one level deeper.
-- Entries carrying a `subZone` (e.g. "Molten Front" within "Mount Hyjal") are
-- split into their own collapsible sub-section under the zone; entries without
-- one render directly under the zone, above the sub-zone sections. `opts.level`
-- is the zone's own nesting level (1 in Browse, 2 in the All view), so sub-zones
-- sit at level+1. Computes its own done/total and sorts, so callers don't.
local function emitZoneWithSubzones(display, opts)
    -- All/Browse start every section folded by default (opts.defaultClosed); the
    -- Current Zone view leaves its single zone open (normal IsCollapsed).
    local isCollapsed = opts.defaultClosed and DT.DB.IsCollapsedByDefault or DT.DB.IsCollapsed
    local collapsed = isCollapsed(DT.DB, opts.key)
    display[#display+1] = {
        type = "section", level = opts.level,
        text = opts.text, done = doneCount(opts.list), total = #opts.list,
        color = opts.color, key = opts.key, collapsed = collapsed,
    }
    if collapsed then return end

    -- Partition a zone's entries into three buckets, all rendered at level+1:
    --   * kind sub-sections (Professions, PvP, Race, ...) -- the themed grouping;
    --   * geographic sub-zone sub-sections (e.g. Molten Front within Mount Hyjal);
    --   * direct quests (neither a kind nor a sub-zone) -- shown straight under
    --     the zone, above the sub-sections.
    -- A quest carrying BOTH a kind and a sub-zone goes under its kind (the themed
    -- grouping is the focus; such overlaps are rare).
    local direct = {}
    local kindNames, kindGroups = {}, {}
    local subNames, subGroups = {}, {}
    for _, e in ipairs(opts.list) do
        local kind = themedSubgroup(e)
        local sz = e.subZone
        if kind then
            if not kindGroups[kind] then kindGroups[kind] = {}; kindNames[#kindNames+1] = kind end
            kindGroups[kind][#kindGroups[kind] + 1] = e
        elseif sz then
            if not subGroups[sz] then subGroups[sz] = {}; subNames[#subNames+1] = sz end
            subGroups[sz][#subGroups[sz] + 1] = e
        else
            direct[#direct + 1] = e
        end
    end

    -- Helper: emit one collapsible sub-section header plus its rows, one level
    -- deeper than the parent zone so renderDisplay insets the rows past the header.
    -- All nested folders render with a neutral fill (see renderDisplay); `accent`
    -- (optional) overrides the thin spine/icon/text colour for a themed kind group
    -- (PvP, Skyracing, ...). Sub-zones pass none and inherit the parent's tint.
    local function emitSub(text, list, key, accent)
        table.sort(list, sortEntries)
        local subCollapsed = isCollapsed(DT.DB, key)
        display[#display+1] = {
            type = "section", level = opts.level + 1,
            text = text, done = doneCount(list), total = #list,
            color = opts.color, key = key, collapsed = subCollapsed,
            accent = accent,
        }
        if not subCollapsed then
            for _, e in ipairs(list) do display[#display+1] = { type = "quest", entry = e, depth = opts.level + 1 } end
        end
    end

    -- Direct quests first. `depth` carries the parent section's level so each row
    -- insets one step past its header (a zone at level 2 in the All view, 1 in Browse).
    table.sort(direct, sortEntries)
    for _, e in ipairs(direct) do display[#display+1] = { type = "quest", entry = e, depth = opts.level } end

    -- Kind sub-sections, in the canonical badge order (unknown kinds alphabetical).
    table.sort(kindNames, function(a, b)
        local ia, ib = KIND_ORDER_INDEX[a], KIND_ORDER_INDEX[b]
        if ia and ib then return ia < ib end
        if ia or ib then return ia ~= nil end
        return a < b
    end)
    for _, kind in ipairs(kindNames) do
        emitSub(kind, kindGroups[kind], opts.key .. "::KIND::" .. kind, SUBGROUP_ACCENT[kind])
    end

    -- Geographic sub-zone sub-sections (alphabetical), after the kind groups.
    table.sort(subNames)
    for _, sz in ipairs(subNames) do
        emitSub(sz, subGroups[sz], opts.key .. "::SZ::" .. sz)
    end
end

-- The expansion a quest is GROUPED under in the Expansion view: its zone's
-- geographic expansion (where the zone lives) rather than the quest's content-age
-- expansion (when it was added). So a Dragonflight skyriding race in Blade's Edge
-- sorts under The Burning Crusade, and old-world zones surface a Classic (Vanilla)
-- group -- matching how the continent is already resolved from geography. Events
-- are exempt (they intentionally bucket by their own seasonal expansion, like the
-- continent logic exempts them). Falls back to the quest's own expansion whenever
-- the zone can't be placed geographically.
local function groupingExpansion(e)
    if e.type ~= "Event" then
        local geo = DT.ZoneMap and DT.ZoneMap:ExpansionForZone(zoneLabel(e), e.expansion)
        if geo then return geo end
    end
    return e.expansion
end

-- Group entries by expansion, then by zone / themed sub-group within each
-- expansion -> nested display list of section/quest items.
local function groupByExpansion(entries)
    local groups, keys = {}, {}
    for _, e in ipairs(entries) do
        local key = groupingExpansion(e)
        if not groups[key] then groups[key] = {}; keys[#keys+1] = key end
        table.insert(groups[key], e)
    end
    table.sort(keys, function(a, b) return expansionOrderIndex(a) < expansionOrderIndex(b) end)
    local display = {}
    for _, key in ipairs(keys) do
        local list = groups[key]
        local exp = DT.EXPANSION_BY_KEY[key]
        local expColor = DT.EXPANSION_COLORS[key] or DT.EXPANSION_COLORS.OTHER
        local expKey = "EXP:" .. key
        local expCollapsed = DT.DB:IsCollapsedByDefault(expKey)  -- All tab starts folded

        -- Expansion header (level 1). Counts roll up the whole expansion.
        display[#display+1] = {
            type = "section", level = 1,
            text = exp and exp.name or key,
            done = doneCount(list), total = #list,
            color = expColor, key = expKey, collapsed = expCollapsed,
        }

        -- Nested zone sub-groups (level 2), each of which may itself nest its
        -- sub-zones (level 3); only built when the expansion is expanded.
        if not expCollapsed then
            for _, sub in ipairs(subgroupEntries(list)) do
                emitZoneWithSubzones(display, {
                    level = 2,
                    text  = sub.name,
                    list  = sub.list,
                    color = expColor,  -- zone sub-headers inherit the expansion tint
                    key   = expKey .. "::" .. sub.name,
                    defaultClosed = true,
                })
            end
        end
    end
    return display
end

-- Zone/continent accent colours and the hex helper live in Constants so the
-- tracker sub-bar and the detail panel share one source (local aliases here keep
-- the call sites below terse). Zones use the blue accent; the continent is the
-- muted parent tone in breadcrumbs.
local ZONE_ACCENT = DT.ZONE_ACCENT
local CONTINENT_ACCENT = DT.CONTINENT_ACCENT
local toHex = DT.ToHex
-- The shared completion green (see DT.COMPLETE_GREEN) + its inline hex, used for the
-- route "arrived" cue and the completed checkbox so every completion signal matches.
local COMPLETE_GREEN = DT.COMPLETE_GREEN
local COMPLETE_GREEN_HEX = toHex(DT.COMPLETE_GREEN)
local function groupByZone(entries)
    local groups, names = {}, {}
    for _, e in ipairs(entries) do
        local zn = zoneLabel(e) or "Unknown"
        if not groups[zn] then groups[zn] = {}; names[#names+1] = zn end
        table.insert(groups[zn], e)
    end
    table.sort(names)
    local display = {}
    for _, zn in ipairs(names) do
        emitZoneWithSubzones(display, {
            level = 1,
            text  = zn,
            list  = groups[zn],
            color = ZONE_ACCENT,
            key   = "ZONE:" .. zn,
            defaultClosed = true,  -- Browse tab starts folded
        })
    end
    return display
end

-- ---------------------------------------------------------------------------
-- Reputation-faction grouping (the "Faction" tab)
-- ---------------------------------------------------------------------------
-- Section accent for faction groups: a soft violet, distinct from the blue zone
-- accent and the per-expansion tints, so the Faction tab reads as its own view.
local FACTION_ACCENT = { 0.64, 0.55, 0.86 }

-- Section accent for currency groups on the Search tab: a warm gold (coin-like),
-- distinct from the violet faction and blue zone accents.
local CURRENCY_ACCENT = { 0.85, 0.70, 0.32 }

-- Quests with no known reputation reward bucket here; sorted to the bottom.
local NO_FACTION = "No Reputation"

-- Thousands-separated integer for the reputation bar's "cur / max" readout.
local function commaNum(n)
    local s = tostring(math.floor((n or 0) + 0.5))
    local out = s:reverse():gsub("(%d%d%d)", "%1,"):reverse()
    return (out:gsub("^,", ""))
end

-- Bar colors for the systems the standard 8-step reaction palette doesn't cover.
local RENOWN_BAR_COLOR     = { 0.35, 0.60, 0.95 }  -- major-faction renown (blue)
local FRIENDSHIP_BAR_COLOR = { 0.40, 0.75, 0.55 }  -- friendship reps (teal-green)
local PARAGON_BAR_COLOR    = { 0.72, 0.52, 0.95 }  -- past-exalted paragon (violet)
local REP_BAR_FALLBACK     = { 0.45, 0.60, 0.90 }

-- Resolve a faction NAME to the player's LIVE standing for the reputation bar.
-- The Faction tab groups by name; DT.FactionIDs (baked) maps name -> factionID so
-- we can hit the ID-based reputation API. Handles the three systems WoW exposes:
-- major/renown, friendships, and classic 8-step factions (+ paragon past exalted).
-- Returns a table: { discovered, level, cur, max, pct, color, maxed }.
local function factionRepInfo(name)
    local id = name and DT.FactionIDs and DT.FactionIDs[name]
    if not id then return { discovered = false } end

    -- Major / renown faction (Dragonflight+).
    if C_Reputation and C_Reputation.IsMajorFaction and C_Reputation.IsMajorFaction(id) then
        local d = C_MajorFactions and C_MajorFactions.GetMajorFactionData
            and C_MajorFactions.GetMajorFactionData(id)
        if not d or d.isUnlocked == false then return { discovered = false } end
        local maxed = C_MajorFactions.HasMaximumRenown and C_MajorFactions.HasMaximumRenown(id)
        local cur, max = d.renownReputationEarned or 0, d.renownLevelThreshold or 0
        return {
            discovered = true,
            level = "Renown " .. (d.renownLevel or 0),
            cur = cur, max = max,
            pct = maxed and 1 or ((max > 0) and (cur / max) or 0),
            color = RENOWN_BAR_COLOR, maxed = maxed,
        }
    end

    -- Friendship faction (Brann, Tuskarr, classic friendships, ...).
    if C_Reputation and C_Reputation.GetFriendshipReputation then
        local fr = C_Reputation.GetFriendshipReputation(id)
        if fr and (fr.friendshipFactionID or 0) > 0 then
            local hasNext = fr.nextThreshold and fr.reactionThreshold
            local cur = hasNext and ((fr.standing or 0) - fr.reactionThreshold) or 1
            local max = hasNext and (fr.nextThreshold - fr.reactionThreshold) or 1
            return {
                discovered = true,
                level = fr.reaction or "Friendship",
                cur = cur, max = max,
                pct = (max > 0) and (cur / max) or 1,
                color = FRIENDSHIP_BAR_COLOR, maxed = not hasNext,
            }
        end
    end

    -- Classic 8-step faction. GetFactionDataByID returns nil for factions the
    -- player has never encountered -> treat as not yet discovered.
    if C_Reputation and C_Reputation.GetFactionDataByID then
        local d = C_Reputation.GetFactionDataByID(id)
        if d and d.name then
            local reaction = d.reaction or 4
            local lo, hi = d.currentReactionThreshold or 0, d.nextReactionThreshold or 0
            local val = d.currentStanding or 0
            local exalted = (reaction >= 8) or (hi <= lo)
            local pal = _G.FACTION_BAR_COLORS and _G.FACTION_BAR_COLORS[reaction]
            local info = {
                discovered = true,
                level = _G["FACTION_STANDING_LABEL" .. reaction] or "Neutral",
                cur = val - lo, max = (hi > lo) and (hi - lo) or 0,
                pct = exalted and 1 or ((hi > lo) and ((val - lo) / (hi - lo)) or 0),
                color = pal and { pal.r, pal.g, pal.b } or REP_BAR_FALLBACK,
                maxed = exalted,
            }
            -- Paragon overlay: reputation earned past Exalted, cycling to a cache.
            if exalted and C_Reputation.IsFactionParagon and C_Reputation.IsFactionParagon(id) then
                local pv, pthresh = C_Reputation.GetFactionParagonInfo(id)
                if pthresh and pthresh > 0 then
                    info.level = "Paragon"
                    info.cur = (pv or 0) % pthresh
                    info.max = pthresh
                    info.pct = info.cur / pthresh
                    info.color = PARAGON_BAR_COLOR
                    info.maxed = false
                end
            end
            return info
        end
    end

    return { discovered = false }
end

-- Resolve a quest's PRIMARY reputation-faction NAME for grouping. Prefers the
-- live-harvested rep cached this session, then the baked wiki rep (the broad
-- source — ~70% of the catalog carries it). Returns nil when no rep is known, so
-- those rows fall into the NO_FACTION bucket. Only the faction name matters here;
-- the detail panel still resolves full amounts (incl. live renown) separately.
-- A quest that grants several factions groups under the first listed.
local function primaryFactionName(e)
    local qid = e.questID
    if not qid then return nil end
    local live = DT.DB and DT.DB.GetQuestDetails and DT.DB:GetQuestDetails(qid)
    local rep = live and live.rewards and live.rewards.reputation
    if type(rep) == "table" and rep[1] then
        return rep[1].name or rep[1].n
    end
    local w = DT.WikiDetails and DT.WikiDetails[qid]
    if w and type(w.rep) == "table" and w.rep[1] then
        return w.rep[1].n
    end
    return nil
end

-- Every reputation-faction NAME a quest rewards (deduped), drawn from all baked
-- sources plus this session's live data. Unlike primaryFactionName (first faction
-- only), this returns the FULL set, so the reputation filter can match a quest
-- that grants several factions -- e.g. the Outland "WANTED" dailies that award
-- Consortium + Thrallmar + Honor Hold at once. Returns an array, or nil if the
-- quest has no known rep. Source priority mirrors the detail panel's
-- bestReputation (live -> consolidated baked -> wiki); we union them all here.
local function entryFactions(e)
    local qid = e.questID
    if not qid then return nil end
    local names, seen = {}, {}
    local function add(list)
        if type(list) ~= "table" then return end
        for _, r in ipairs(list) do
            local n = r.name or r.n
            if n and n ~= "" and not seen[n] then
                seen[n] = true
                names[#names + 1] = n
            end
        end
    end
    local live = DT.DB and DT.DB.GetQuestDetails and DT.DB:GetQuestDetails(qid)
    if live and live.rewards then add(live.rewards.reputation) end
    local b = DT.BakedDetails and DT.BakedDetails[qid]
    if b and b.r then add(b.r.rep) end
    local w = DT.WikiDetails and DT.WikiDetails[qid]
    if w then add(w.rep) end
    return (#names > 0) and names or nil
end

-- Every CURRENCY NAME a quest rewards (deduped), from the consolidated baked
-- rewards (QuestRewards `cu`) and this session's live data. Used by the unified
-- Search tab to match "which dailies give currency X". Returns an array, or nil.
local function entryCurrencies(e)
    local qid = e.questID
    if not qid then return nil end
    local names, seen = {}, {}
    local function add(list)
        if type(list) ~= "table" then return end
        for _, c in ipairs(list) do
            local n = c.name or c.n
            if n and n ~= "" and not seen[n] then
                seen[n] = true
                names[#names + 1] = n
            end
        end
    end
    local live = DT.DB and DT.DB.GetQuestDetails and DT.DB:GetQuestDetails(qid)
    if live and live.rewards then add(live.rewards.currencies) end
    local b = DT.BakedDetails and DT.BakedDetails[qid]
    if b and b.r then add(b.r.cu) end
    return (#names > 0) and names or nil
end

-- Group entries by primary reputation faction (flat — one section per faction).
-- Faction sections are alphabetical; the catch-all "No Reputation" sinks to the
-- bottom. Mirrors groupByZone's section/fold handling so the existing collapse,
-- expand-all and selection-highlight machinery all work unchanged.
local function groupByFaction(entries)
    local groups, names = {}, {}
    for _, e in ipairs(entries) do
        local name = primaryFactionName(e) or NO_FACTION
        if not groups[name] then groups[name] = {}; names[#names+1] = name end
        table.insert(groups[name], e)
    end
    table.sort(names, function(a, b)
        if (a == NO_FACTION) ~= (b == NO_FACTION) then return b == NO_FACTION end
        return a < b
    end)
    local display = {}
    for _, name in ipairs(names) do
        local list = groups[name]
        table.sort(list, sortEntries)
        local key = "FACTION:" .. name
        local collapsed = DT.DB:IsCollapsedByDefault(key)  -- starts folded like All/Browse
        display[#display+1] = {
            type = "section", level = 1,
            text = name, done = doneCount(list), total = #list,
            color = FACTION_ACCENT, key = key, collapsed = collapsed,
        }
        if not collapsed then
            -- A live reputation bar tops each real faction section (not the
            -- catch-all "No Reputation" bucket).
            if name ~= NO_FACTION then
                display[#display+1] = { type = "repbar", faction = name, depth = 1 }
            end
            for _, e in ipairs(list) do
                display[#display+1] = { type = "quest", entry = e, depth = 1 }
            end
        end
    end
    return display
end

-- ---------------------------------------------------------------------------
-- Mode display builders. Each returns (displayList, summaryText).
-- ---------------------------------------------------------------------------
-- Empty-state for the Current Zone tab. A new user won't know discovery is passive,
-- so the second sentence tells them WHY it's empty and how it fills in (rather than
-- reading as "this zone has none").
local ZONE_EMPTY_MSG = "No known dailies mapped to this zone yet.  "
    .. "QuestTally learns them automatically as you pick up dailies or talk to their quest givers."

local function buildZoneMode()
    local zone = DT.Zones and DT.Zones:GetPlayerZone() or nil
    if not zone or not zone.zoneName then
        return { { type = "message", text = "Unable to determine your current zone." } },
               "Current zone"
    end
    -- Match the SAME zone bucketing the Browse/All tabs use: filter on the
    -- normalized zoneLabel (which folds sub-hubs/aliases like "Molten Front" ->
    -- "Mount Hyjal" and cleans numeric/multi-zone strings), not the raw catalog
    -- zoneName. Otherwise this tab silently drops quests those tabs group here.
    local target = DT.Zones.ZONE_ALIASES[zone.zoneName] or zone.zoneName
    local entries = {}
    for _, e in ipairs(applyKindFilters(DT.Checklist:GetEntries())) do
        if zoneLabel(e) == target then entries[#entries+1] = e end
    end
    local display = {}
    if DT.DB:GetSetting("todaysRoute") then
        -- Today's Route: one flat, always-open section listing the zone's dailies
        -- nearest-first, each tagged with its distance from you; completed /
        -- unplaceable ones trail without a distance. Reuses the search display shape.
        local ordered = DT.Route:Order(entries)
        display[#display+1] = {
            type = "section", level = 1,
            text = "Today's Route — " .. zone.zoneName,
            done = doneCount(entries), total = #entries,
            color = ZONE_ACCENT, key = "ROUTE:" .. zone.zoneName, collapsed = false,
        }
        -- Distance tags/arrival flags are applied centrally in Refresh
        -- (tagRouteDistances), so all tabs render them identically; here we only
        -- need Order's nearest-first sequence.
        for _, o in ipairs(ordered) do
            display[#display+1] = { type = "quest", entry = o.entry, depth = 1 }
        end
        if #entries == 0 then
            display[#display+1] = { type = "message", text = ZONE_EMPTY_MSG }
        end
    else
        emitZoneWithSubzones(display, {
            level = 1,
            text  = zone.zoneName,
            list  = entries,
            color = ZONE_ACCENT,
            -- Distinct "CZONE:" key so this view's fold state is independent of the
            -- Browse tab (which folds by default under the shared "ZONE:" key).
            key   = "CZONE:" .. zone.zoneName,
        })
        if #entries == 0 then
            display[#display+1] = { type = "message", text = ZONE_EMPTY_MSG }
        end
    end
    -- Breadcrumb reads as a path, broad -> specific: "Eastern Kingdoms — Elwynn
    -- Forest". The continent is muted (parent context); the current zone is the
    -- blue zone accent so it matches the section header just below it.
    local zoneText = "|cff" .. toHex(ZONE_ACCENT) .. zone.zoneName .. "|r"
    local sub
    if zone.continentName then
        sub = "|cff" .. toHex(CONTINENT_ACCENT) .. zone.continentName .. "|r"
            .. "  |cff707070—|r  " .. zoneText
    else
        sub = zoneText
    end
    return display, sub
end

-- The Search tab (formerly Browse) with an EMPTY box: a brief prompt of what you
-- can search. (A later increment turns this into a clickable directory of
-- factions / currencies / zones.)
local function buildSearchHomeMode()
    return {
        { type = "message",
          text = "Search dailies by quest name, currency, reputation / faction, or zone."
              .. "\n\nStart typing in the box above." },
    }, "Search"
end

-- The Search tab with a query: ONE search matched across four dimensions and
-- grouped by what matched -- Factions (with rep bars), Currencies, Zones, then
-- loose Quests (name matches not already shown under a dimension). Each section
-- header carries a muted "— Faction / Currency / Zone" tag so it's clear why it
-- matched. All sections render open. Reuses entryFactions / entryCurrencies.
local function buildUnifiedSearchMode()
    local q = (DT.UI.searchQuery or ""):lower()
    local all = applyKindFilters(DT.Checklist:GetEntries())

    local function newBuckets() return { map = {}, order = {} } end
    local function put(b, key, e)
        if not b.map[key] then b.map[key] = {}; b.order[#b.order + 1] = key end
        table.insert(b.map[key], e)
    end

    local facs, curs, zones = newBuckets(), newBuckets(), newBuckets()
    local shown, quests = {}, {}

    for _, e in ipairs(all) do
        local matched = false
        local fs = entryFactions(e)
        if fs then
            for _, n in ipairs(fs) do
                if n:lower():find(q, 1, true) then put(facs, n, e); matched = true end
            end
        end
        local cs = entryCurrencies(e)
        if cs then
            for _, n in ipairs(cs) do
                if n:lower():find(q, 1, true) then put(curs, n, e); matched = true end
            end
        end
        local zl = zoneLabel(e)
        if zl and zl:lower():find(q, 1, true) then put(zones, zl, e); matched = true end
        if matched and e.questID then shown[e.questID] = true end

        -- Title matches go to the loose "Quests" group, unless the quest already
        -- appears under a faction/currency/zone section above.
        local t  = (e.title or ""):lower()
        local rt = (e.rawTitle or ""):lower()
        if (t:find(q, 1, true) or rt:find(q, 1, true))
        and not (e.questID and shown[e.questID]) then
            quests[#quests + 1] = e
        end
    end

    local display, total = {}, 0
    local function emitGroup(b, accent, tag, withRepBar)
        table.sort(b.order)
        for _, name in ipairs(b.order) do
            local list = b.map[name]
            table.sort(list, sortEntries)
            total = total + #list
            display[#display + 1] = {
                type = "section", level = 1,
                text = name .. "  |cff707070— " .. tag .. "|r",
                done = doneCount(list), total = #list,
                color = accent, key = "SEARCH:" .. tag .. ":" .. name, collapsed = false,
            }
            if withRepBar then
                display[#display + 1] = { type = "repbar", faction = name, depth = 1 }
            end
            for _, e in ipairs(list) do
                display[#display + 1] = { type = "quest", entry = e, depth = 1 }
            end
        end
    end

    emitGroup(facs,  FACTION_ACCENT,  "Faction",  true)
    emitGroup(curs,  CURRENCY_ACCENT, "Currency", false)
    emitGroup(zones, ZONE_ACCENT,     "Zone",     false)

    if #quests > 0 then
        table.sort(quests, sortEntries)
        total = total + #quests
        display[#display + 1] = {
            type = "section", level = 1, text = "Quests  |cff707070— name match|r",
            done = doneCount(quests), total = #quests,
            color = { 0.60, 0.62, 0.66 }, key = "SEARCH:QUESTS", collapsed = false,
        }
        for _, e in ipairs(quests) do
            display[#display + 1] = { type = "quest", entry = e, depth = 1 }
        end
    end

    if #display == 0 then
        return { { type = "message",
                   text = 'Nothing matches "' .. (DT.UI.searchQuery or "") .. '".' } },
               "Search  |cff707070— no matches|r"
    end
    return display,
           string.format("Search  |cff707070— %d result%s|r", total, total == 1 and "" or "s")
end

local function buildAllMode()
    local entries = applyKindFilters(DT.Checklist:GetEntries())
    -- Count completed from the filtered list so the summary matches the rows on
    -- screen (hiding world quests drops the total substantially). "Discovered"
    -- was dropped: the catalog now ships real quest IDs, so nearly every entry
    -- counted as discovered, making it ~equal to the total and uninformative.
    local completed = 0
    for _, e in ipairs(entries) do
        if e.status == DT.STATUS.COMPLETED then completed = completed + 1 end
    end
    return groupByExpansion(entries),
           string.format("Expansion  |cff707070— %d quests, |r|cff66cc66%d completed|r", #entries, completed)
end

-- The Faction tab: the same filtered catalog as the Expansion tab, grouped by the
-- reputation faction each quest rewards instead of by expansion/zone. An active
-- search narrows this view (see buildFactionSearchMode) -- including by faction name.
local function buildFactionMode()
    local entries = applyKindFilters(DT.Checklist:GetEntries())
    local completed = 0
    for _, e in ipairs(entries) do
        if e.status == DT.STATUS.COMPLETED then completed = completed + 1 end
    end
    return groupByFaction(entries),
           string.format("Faction  |cff707070— %d quests, |r|cff66cc66%d completed|r", #entries, completed)
end

-- Faction tab + active search: filter the faction grouping to matches. A quest is
-- placed under EVERY rewarded faction whose name matches the query (so typing a
-- faction name surfaces that faction's section with its rep bar and all of its
-- dailies -- this is what the old dropdown did); a quest whose TITLE matches but no
-- faction does is placed under its primary faction. Sections render open (it's a
-- search result). Reuses entryFactions for the "every rewarded faction" lookup.
local function buildFactionSearchMode()
    local q = (DT.UI.searchQuery or ""):lower()
    local groups, order = {}, {}
    local function bucket(name)
        if not groups[name] then groups[name] = {}; order[#order + 1] = name end
        return groups[name]
    end

    for _, e in ipairs(applyKindFilters(DT.Checklist:GetEntries())) do
        local placed = false
        local fs = entryFactions(e)
        if fs then
            for _, n in ipairs(fs) do
                if n:lower():find(q, 1, true) then
                    table.insert(bucket(n), e); placed = true
                end
            end
        end
        if not placed then
            local t  = (e.title or ""):lower()
            local rt = (e.rawTitle or ""):lower()
            if t:find(q, 1, true) or rt:find(q, 1, true) then
                table.insert(bucket(primaryFactionName(e) or NO_FACTION), e)
            end
        end
    end

    if #order == 0 then
        return { { type = "message",
                   text = 'No factions or quests match "' .. (DT.UI.searchQuery or "") .. '".' } },
               "Faction  |cff707070— no matches|r"
    end

    table.sort(order, function(a, b)
        if (a == NO_FACTION) ~= (b == NO_FACTION) then return b == NO_FACTION end
        return a < b
    end)

    local display, count = {}, 0
    for _, name in ipairs(order) do
        local list = groups[name]
        table.sort(list, sortEntries)
        count = count + #list
        display[#display + 1] = {
            type = "section", level = 1, text = name,
            done = doneCount(list), total = #list,
            color = FACTION_ACCENT, key = "FACSEARCH:" .. name, collapsed = false,
        }
        if name ~= NO_FACTION then
            display[#display + 1] = { type = "repbar", faction = name, depth = 1 }
        end
        for _, e in ipairs(list) do
            display[#display + 1] = { type = "quest", entry = e, depth = 1 }
        end
    end
    return display,
           string.format("Faction  |cff707070— %d result%s|r", count, count == 1 and "" or "s")
end

-- Search mode: a name filter that overrides whatever tab is active. Matches the
-- typed query (case-insensitive substring) against the cleaned title and the raw
-- catalog title, across the WHOLE kind-filtered catalog, then presents the hits
-- as one flat, always-open "Search results" section sorted by name. A flat list
-- (rather than expansion grouping) keeps every match visible without the user
-- having to expand folded sections — the point of a search is to see results.
local function buildSearchMode()
    local q = (DT.UI.searchQuery or ""):lower()
    local matches = {}
    for _, e in ipairs(applyKindFilters(DT.Checklist:GetEntries())) do
        local t  = (e.title or ""):lower()
        local rt = (e.rawTitle or ""):lower()
        if t:find(q, 1, true) or rt:find(q, 1, true) then
            matches[#matches+1] = e
        end
    end
    table.sort(matches, function(a, b) return (a.title or "") < (b.title or "") end)

    if #matches == 0 then
        return { { type = "message",
                   text = 'No quests match "' .. (DT.UI.searchQuery or "") .. '".' } },
               "Search  |cff707070— no matches|r"
    end

    local display = {
        { type = "section", level = 1, text = "Search results",
          done = doneCount(matches), total = #matches,
          color = ZONE_ACCENT, key = "SEARCH:", collapsed = false },
    }
    for _, e in ipairs(matches) do
        display[#display+1] = { type = "quest", entry = e, depth = 1 }
    end
    return display,
           string.format('Search  |cff707070— %d match%s|r',
                         #matches, #matches == 1 and "" or "es")
end

-- Type-ahead suggestions under the search box, sorted and capped. Quest-title
-- suggestions carry the backing entry so picking one opens it in the Details panel.
-- On the Faction tab, matching faction NAMES are suggested first (marked `faction`,
-- entry-less) -- picking one just fills the box, which filters the view to that
-- faction. One catalog pass collects both.
local SEARCH_SUGGEST_MAX = 8
local function searchSuggestions(query)
    local q = (query or ""):lower()
    local factionMode = (DT.UI.mode == "FACTION")
    local titleSeen, titleOut = {}, {}
    local facSeen, facOut = {}, {}
    for _, e in ipairs(applyKindFilters(DT.Checklist:GetEntries())) do
        local title = e.title
        if title and not titleSeen[title] and title:lower():find(q, 1, true) then
            titleSeen[title] = true
            titleOut[#titleOut+1] = { title = title, entry = e }
        end
        if factionMode then
            local fs = entryFactions(e)
            if fs then
                for _, n in ipairs(fs) do
                    if not facSeen[n] and n:lower():find(q, 1, true) then
                        facSeen[n] = true
                        facOut[#facOut+1] = { title = n, faction = true }
                    end
                end
            end
        end
    end
    table.sort(facOut, function(a, b) return a.title < b.title end)
    table.sort(titleOut, function(a, b) return a.title < b.title end)
    -- Factions first (the tab's focus), then quest names.
    local out = {}
    for _, s in ipairs(facOut)   do out[#out+1] = s end
    for _, s in ipairs(titleOut) do out[#out+1] = s end
    while #out > SEARCH_SUGGEST_MAX do out[#out] = nil end
    return out
end

-- ---------------------------------------------------------------------------
-- Row / section widgets
-- ---------------------------------------------------------------------------
local function acquireRow(parent)
    local row = table.remove(rowPool)
    if not row then
        row = CreateFrame("Button", nil, parent)
        row:SetHeight(ROW_HEIGHT)

        -- Colored accent bar down the left edge (sections only).
        row.accent = row:CreateTexture(nil, "BACKGROUND")
        row.accent:SetTexture("Interface\\Buttons\\WHITE8X8")
        row.accent:SetPoint("TOPLEFT", 0, 0)
        row.accent:SetPoint("BOTTOMLEFT", 0, 0)
        row.accent:SetWidth(3)
        row.accent:Hide()

        -- Section row tinted background (multiplied by the accent color).
        row.headerBg = row:CreateTexture(nil, "BACKGROUND")
        row.headerBg:SetTexture("Interface\\Buttons\\WHITE8X8")
        row.headerBg:SetPoint("TOPLEFT", 1, 0)
        row.headerBg:SetPoint("BOTTOMRIGHT", 0, 0)
        row.headerBg:Hide()

        -- Bevel hairlines for section rows: a light line along the top edge and a
        -- dark line along the bottom give the header a subtle embossed lift.
        row.headerTop = row:CreateTexture(nil, "BORDER")
        row.headerTop:SetTexture("Interface\\Buttons\\WHITE8X8")
        row.headerTop:SetPoint("TOPLEFT", 1, 0)
        row.headerTop:SetPoint("TOPRIGHT", 0, 0)
        row.headerTop:SetHeight(1)
        row.headerTop:SetColorTexture(1, 1, 1, 0.05)
        row.headerTop:Hide()

        row.headerBot = row:CreateTexture(nil, "BORDER")
        row.headerBot:SetTexture("Interface\\Buttons\\WHITE8X8")
        row.headerBot:SetPoint("BOTTOMLEFT", 1, 0)
        row.headerBot:SetPoint("BOTTOMRIGHT", 0, 0)
        row.headerBot:SetHeight(1)
        row.headerBot:SetColorTexture(0, 0, 0, 0.35)
        row.headerBot:Hide()

        -- Small square section icon, tinted to the accent.
        row.icon = row:CreateTexture(nil, "ARTWORK")
        row.icon:SetTexture("Interface\\Buttons\\WHITE8X8")
        row.icon:SetSize(9, 9)
        row.icon:SetPoint("LEFT", 10, 0)
        row.icon:Hide()

        -- Status checkbox (quest rows only). A small bordered box that reads as a
        -- checklist item: empty (border tinted to the status colour) while a quest is
        -- outstanding, filled green with a check once it's done today. The shape --
        -- empty vs checked -- carries "done or not" WITHOUT relying on colour, so it's
        -- readable for colour-blind players; the border hue still conveys the finer
        -- status for everyone else. Styled per-render by DT.UI:StyleStatusCheckbox.
        row.dot = CreateFrame("Frame", nil, row, "BackdropTemplate")
        row.dot:SetSize(11, 11)
        row.dot:SetPoint("LEFT", 12, 0)
        row.dot:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8X8",
            edgeFile = "Interface\\Buttons\\WHITE8X8", edgeSize = 1,
        })
        row.dot.check = row.dot:CreateTexture(nil, "OVERLAY")
        row.dot.check:SetTexture("Interface\\Buttons\\UI-CheckBox-Check")
        row.dot.check:SetPoint("CENTER", 0, 0)
        row.dot.check:SetSize(15, 15)
        row.dot.check:Hide()

        row.title = row:CreateFontString(nil, "ARTWORK", "GameFontNormal")
        row.title:SetPoint("LEFT", row.dot, "RIGHT", 7, 0)
        row.title:SetJustifyH("LEFT")
        -- Single line: a long title truncates with an ellipsis (full name is in the
        -- hover tooltip) instead of wrapping, so every quest row is the same height.
        row.title:SetWordWrap(false)

        row.status = row:CreateFontString(nil, "ARTWORK", "GameFontDisableSmall")
        row.status:SetJustifyH("RIGHT")

        -- Collapse indicator at the far right of a section row.
        row.collapse = row:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
        row.collapse:SetPoint("RIGHT", -8, -1)
        row.collapse:SetJustifyH("RIGHT")
        row.collapse:Hide()

        -- Inline kind tag (quest rows): a small colored chip — "Prof" / "Pet" —
        -- sitting between the status dot and the title. A faint tinted backing
        -- gives it a pill look that matches the section accents.
        row.badgeBg = row:CreateTexture(nil, "ARTWORK")
        row.badgeBg:SetTexture("Interface\\Buttons\\WHITE8X8")
        row.badgeBg:Hide()
        row.badge = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        row.badge:SetJustifyH("CENTER")
        row.badge:Hide()

        -- Persistent "selected" highlight for the quest whose detail panel is
        -- open: a soft blue fill plus a brighter left accent bar. Drawn on the
        -- BORDER layer so it sits above the section backings but below the ARTWORK
        -- dot/title and the HIGHLIGHT hover sheen, so a selected row still lights
        -- up further on hover. Toggled per-row in renderDisplay / the lightweight
        -- UpdateSelectionHighlight pass.
        row.selected = row:CreateTexture(nil, "BORDER")
        row.selected:SetAllPoints()
        row.selected:SetColorTexture(0.30, 0.46, 0.66, 0.20)
        row.selected:Hide()
        row.selectedEdge = row:CreateTexture(nil, "BORDER")
        row.selectedEdge:SetPoint("TOPLEFT", 0, 0)
        row.selectedEdge:SetPoint("BOTTOMLEFT", 0, 0)
        row.selectedEdge:SetWidth(2)
        row.selectedEdge:SetColorTexture(0.46, 0.66, 0.92, 0.95)
        row.selectedEdge:Hide()

        -- Reputation bar (Faction tab): a dark track, a colored fill sized to the
        -- player's progress in the current standing, and centered status text.
        -- Fill sits a sublevel above the track; text on OVERLAY above both.
        row.repTrack = row:CreateTexture(nil, "ARTWORK", nil, 0)
        row.repTrack:SetTexture("Interface\\Buttons\\WHITE8X8")
        row.repTrack:Hide()
        row.repFill = row:CreateTexture(nil, "ARTWORK", nil, 1)
        row.repFill:SetTexture("Interface\\Buttons\\WHITE8X8")
        row.repFill:Hide()
        row.repText = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        row.repText:SetJustifyH("CENTER")
        row.repText:Hide()

        row.highlight = row:CreateTexture(nil, "HIGHLIGHT")
        row.highlight:SetAllPoints()
        row.highlight:SetColorTexture(1, 1, 1, 0.06)

        row:SetScript("OnClick", function(self, button)
            -- Dismiss a lingering (non-modal) search type-ahead popup so it
            -- doesn't hover over the list after you've picked from the list.
            if DT.UI.HideDropMenu then DT.UI.HideDropMenu() end
            -- Section header: toggle its collapsed state.
            if self.sectionKey then
                DT.DB:ToggleCollapsed(self.sectionKey)
                DT.UI:Refresh()
                return
            end
            local e = self.entry
            if not e then return end
            -- Shared scheme: L=details, M=track/untrack, Shift+M=Wowhead,
            -- R=map pin, Shift+R=TomTom (see DT.UI:RowAction).
            DT.UI:RowAction(e, button)
        end)
        row:RegisterForClicks("LeftButtonUp", "RightButtonUp", "MiddleButtonUp")

        row:SetScript("OnEnter", function(self)
            local e = self.entry
            if not e then return end
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText(e.title or "", 1, 1, 1)
            if e.category then GameTooltip:AddLine(e.category, 0.7, 0.7, 0.7) end
            if e.zoneName then GameTooltip:AddLine(e.zoneName, 0.7, 0.7, 0.7) end
            if e.side and e.side ~= "Both" then GameTooltip:AddLine("Faction: " .. e.side, 0.7, 0.7, 0.7) end
            -- Quest giver, captured live when you visited the NPC.
            if e.giver and e.giver.name then
                local where = ""
                if e.giver.x and e.giver.y then
                    where = string.format("  |cff808080(%.1f, %.1f)|r", e.giver.x * 100, e.giver.y * 100)
                elseif e.giver.loc and e.giver.loc ~= "" then
                    where = "  |cff808080" .. e.giver.loc .. "|r"
                end
                GameTooltip:AddLine("Giver: " .. e.giver.name .. where, 0.9, 0.8, 0.4)
            end
            DT.UI:AppendActionHints(GameTooltip, e)
            GameTooltip:Show()
        end)
        row:SetScript("OnLeave", function() GameTooltip:Hide() end)
    end
    row:SetParent(parent)
    row:Show()
    return row
end

local function releaseAllRows()
    for _, row in ipairs(activeRows) do
        row.entry = nil
        row.sectionKey = nil
        row.selected:Hide()
        row.selectedEdge:Hide()
        row.repTrack:Hide()
        row.repFill:Hide()
        row.repText:Hide()
        row:Hide()
        row:ClearAllPoints()
        rowPool[#rowPool + 1] = row
    end
    wipe(activeRows)
end

-- ---------------------------------------------------------------------------
-- Mode tabs
-- ---------------------------------------------------------------------------
local function setMode(mode)
    DT.UI.mode = mode
    -- Leaving the Search tab clears any active query (the box is hidden elsewhere,
    -- so a lingering search couldn't be seen or cleared). Setting the text fires
    -- OnTextChanged, which resets DT.UI.searchQuery and refreshes.
    if mode ~= "SEARCH" and mainFrame and mainFrame.searchBox and mainFrame.searchBox.editBox then
        mainFrame.searchBox.editBox:SetText("")
    end
    DT.UI:Refresh()
end

-- Expand/collapse-all support. Works off the top-level (level 1) section keys
-- that are actually on screen, so the one toggle serves both the All tab
-- (expansions) and the Browse tab (zones). Refreshed from the display each build.
local currentTopKeys = {}

local function setCurrentTopKeys(display)
    wipe(currentTopKeys)
    for _, item in ipairs(display) do
        if item.type == "section" and (item.level or 1) == 1 and item.key then
            currentTopKeys[#currentTopKeys + 1] = item.key
        end
    end
    -- The display has now been fully built (every section key recorded), so the
    -- one-shot "expand all" pass is done; clear it so later rebuilds fold new
    -- sections by default again.
    DT.DB._expandPass = nil
end

local function anyTopSectionExpanded()
    for _, key in ipairs(currentTopKeys) do
        if not DT.DB:IsCollapsed(key) then return true end
    end
    return false
end

local function setAllTopCollapsed(collapse)
    if collapse then
        -- Collapse every folder at every level (not just the top-level sections in
        -- view), so re-opening any parent reveals its children already folded.
        DT.DB:CollapseAll()
    else
        -- Expanding clears all fold state, and flags the upcoming rebuild as an
        -- "expand pass" so even never-yet-built sub-sections open (default-folded
        -- sections would otherwise re-fold). The flag is cleared once the rebuild
        -- has recorded every key (see setCurrentTopKeys).
        DT.DB:ExpandAll()
        DT.DB._expandPass = true
    end
end

-- Sync the title-bar Route button's lit/dim state to the todaysRoute setting.
local function updateRouteButton()
    if not mainFrame or not mainFrame.routeBtn then return end
    local on = DT.DB:GetSetting("todaysRoute")
    mainFrame.routeBtn.active:SetShown(on)
    mainFrame.routeBtn.label:SetTextColor(on and 1 or 0.85, on and 0.97 or 0.85, on and 0.78 or 0.82)
end

-- The content-filter toggles, in panel order. Drives the count shown on the Filters
-- button and its tooltip.
local FILTER_SETTINGS = {
    "showSeasonal", "showProfessions", "showBattlePets", "showRaces", "showCompleted",
}

-- How many categories are currently ENABLED (shown). Drives the "Filters (N)" count so
-- you can see at a glance how many of the categories are on -- e.g. "Filters (3)" out
-- of the box (Profession + Battle Pet + completed; Seasonal + Skyriding default off).
local function countEnabledFilters()
    local n = 0
    for _, key in ipairs(FILTER_SETTINGS) do
        if DT.DB:GetSetting(key) then n = n + 1 end
    end
    return n
end

-- Reflect the Filters button label (with hidden-count) and the Tracked/Filters
-- buttons' lit "open" state -- mirroring how the Route button shows it's active, so
-- every title-bar toggle reads its on/open state at a glance. Called on each refresh
-- and right after any click that opens/closes those panels.
local function updateToggleButtons()
    if not mainFrame then return end
    if mainFrame.filtersBtn then
        mainFrame.filtersBtn:SetText("Filters (" .. countEnabledFilters() .. ")")
        local open = mainFrame.filters and mainFrame.filters:IsShown() or false
        if mainFrame.filtersBtn.active then mainFrame.filtersBtn.active:SetShown(open) end
        mainFrame.filtersBtn.label:SetTextColor(open and 1 or 0.85, open and 0.97 or 0.85, open and 0.78 or 0.82)
    end
    if mainFrame.pinnedBtn then
        local open = DT.Pinned and DT.Pinned:IsShown() or false
        if mainFrame.pinnedBtn.active then mainFrame.pinnedBtn.active:SetShown(open) end
        mainFrame.pinnedBtn.label:SetTextColor(open and 1 or 0.85, open and 0.97 or 0.85, open and 0.78 or 0.82)
    end
end

local function updateModeButtons()
    if not mainFrame then return end
    updateRouteButton()
    updateToggleButtons()
    for _, b in ipairs(mainFrame.modeButtons) do
        local active = (b.mode == DT.UI.mode)
        b.bg:SetShown(active)
        if active then
            b.label:SetTextColor(0.95, 0.95, 0.92)
        else
            b.label:SetTextColor(0.55, 0.55, 0.52)
        end
    end
    -- The search box now lives ONLY on the Search tab (search has its own home). On
    -- the other tabs it's hidden and the list rises to fill the freed band. (The old
    -- Browse continent/zone dropdowns were removed with the Search-tab redesign.)
    local searching = (DT.UI.searchQuery ~= "")
    local onSearch = (DT.UI.mode == "SEARCH")
    mainFrame.searchBox:SetShown(onSearch)
    mainFrame.scroll:ClearAllPoints()
    mainFrame.scroll:SetPoint("TOPLEFT", 12, onSearch and -82 or -54)
    mainFrame.scroll:SetPoint("BOTTOMRIGHT", -18, 32)

    -- The Expansion and Faction tabs (grouped/collapsible, when not searching) show
    -- the expand/collapse-all toggle at the right of the sub-bar; the reset countdown
    -- shifts left to make room. Current Zone is a single section, and the Search tab
    -- shows flat/force-open results, so the toggle is pointless there.
    local hasGroups = not searching
        and (DT.UI.mode == "ALL" or DT.UI.mode == "FACTION")
    mainFrame.collapseAllBtn:SetShown(hasGroups)
    mainFrame.reset:ClearAllPoints()
    if hasGroups then
        mainFrame.collapseAllBtn:SetText(anyTopSectionExpanded() and "Collapse All" or "Expand All")
        mainFrame.reset:SetPoint("RIGHT", mainFrame.collapseAllBtn, "LEFT", -10, 0)
    else
        mainFrame.reset:SetPoint("RIGHT", mainFrame.subBar, "RIGHT", -10, 0)
    end
end

-- ---------------------------------------------------------------------------
-- Continuous route updates (TomTom-arrow style)
-- ---------------------------------------------------------------------------
-- While Today's Route is active and a routed surface is on screen, re-route as the
-- player moves so the step order and numbers track live position. Three guards keep
-- it cheap: a time throttle (a couple checks per second), a movement gate (only
-- rebuild once you've actually moved, in HBD world yards), and a visibility gate
-- (only when a route view is showing). A stationary player costs ~nothing.
local LibStub = _G.LibStub
local routeHBD
local function getRouteHBD()
    if routeHBD == nil then
        routeHBD = (LibStub and LibStub("HereBeDragons-2.0", true)) or false
    end
    return routeHBD or nil
end

local ROUTE_TICK    = 0.5        -- seconds between position checks
local ROUTE_MOVE_SQ = 8 * 8      -- re-route after moving ~8 yards (world coords are yards)
local routeAccum, lastRX, lastRY, lastRInst = 0, nil, nil, nil

-- Which routed surfaces, if any, are currently visible. Returns three flags:
--   zoneView  - Current Zone tab in route mode (a full re-route: reorders + tags);
--   groupView - Expansion/Faction tab (tag-only live update, grouping preserved);
--   pinnedView- the Tracked panel.
local function routeSurfacesVisible()
    if not DT.DB:GetSetting("todaysRoute") then return false, false, false end
    local mainShown  = mainFrame and mainFrame:IsShown() and not collapsed
        and (DT.UI.searchQuery or "") == ""
    local zoneView   = mainShown and DT.UI.mode == "ZONE"
    local groupView  = mainShown and (DT.UI.mode == "ALL" or DT.UI.mode == "FACTION")
    local pinnedView = DT.Pinned and DT.Pinned:IsShown()
    return zoneView, groupView, pinnedView
end

local routeTicker = CreateFrame("Frame")
routeTicker:SetScript("OnUpdate", function(_, elapsed)
    routeAccum = routeAccum + elapsed
    if routeAccum < ROUTE_TICK then return end
    routeAccum = 0

    local zoneView, groupView, pinnedView = routeSurfacesVisible()
    if not (zoneView or groupView or pinnedView) then return end

    local HBD = getRouteHBD()
    if not HBD then return end
    local x, y, inst = HBD:GetPlayerWorldPosition()
    if not x then return end

    -- Movement gate: skip the update unless we changed instance or moved enough.
    if lastRInst == inst and lastRX then
        local dx, dy = x - lastRX, y - lastRY
        if dx * dx + dy * dy < ROUTE_MOVE_SQ then return end
    end
    lastRX, lastRY, lastRInst = x, y, inst

    -- Current Zone re-routes (reorders nearest-first) via a full Refresh, which also
    -- rebuilds the pinned panel. The grouped tabs keep their layout, so they only need
    -- the cheap in-place tag update -- NOT a whole-catalog rebuild every step (that
    -- churn read as a memory leak). Pinned still refreshes alongside them when open.
    if zoneView then
        DT.UI:Refresh()
    else
        if groupView then DT.UI:UpdateRouteTags() end
        if pinnedView then DT.Pinned:Refresh() end
    end
end)

-- Live-ticking reset countdown: refresh just the sub-bar timer text once a second
-- (a full list rebuild would be wasteful), so the countdown visibly ticks instead
-- of only updating on quest events. Cheap: a single SetText when the window is open.
local resetAccum = 0
local resetTicker = CreateFrame("Frame")
resetTicker:SetScript("OnUpdate", function(_, elapsed)
    resetAccum = resetAccum + elapsed
    if resetAccum < 1 then return end
    resetAccum = 0
    if not (mainFrame and mainFrame:IsShown() and mainFrame.reset and mainFrame.reset:IsShown()) then
        return
    end
    local secs = DT.QuestLog:GetSecondsUntilReset()
    mainFrame.reset:SetText("resets |cffffd100" .. DT.QuestLog:FormatCountdown(secs) .. "|r")
end)

-- ---------------------------------------------------------------------------
-- Frame creation
-- ---------------------------------------------------------------------------
-- Paint a texture with a vertical top->bottom gradient. Falls back to a flat
-- fill on any client whose texture API lacks the modern SetGradient signature,
-- so the UI degrades to the old look instead of erroring.
local function setVGradient(tex, top, bottom)
    if tex.SetGradient and CreateColor then
        tex:SetColorTexture(1, 1, 1, 1)
        tex:SetGradient("VERTICAL",
            CreateColor(bottom[1], bottom[2], bottom[3], bottom[4] or 1),
            CreateColor(top[1], top[2], top[3], top[4] or 1))
        return true
    end
    tex:SetColorTexture(top[1], top[2], top[3], top[4] or 1)
    return false
end

-- Small helper: a color-textured strip. Flat by default; pass `color2` for a
-- vertical gradient from `color` (top) to `color2` (bottom).
local function makeStrip(parent, layer, color, color2)
    local t = parent:CreateTexture(nil, layer or "ARTWORK")
    t:SetTexture("Interface\\Buttons\\WHITE8X8")
    if color2 then
        setVGradient(t, color, color2)
    else
        t:SetColorTexture(color[1], color[2], color[3], color[4] or 1)
    end
    return t
end

-- ---------------------------------------------------------------------------
-- Custom widgets, styled to the theme, replacing the stock Blizzard close
-- button and scroll bar. Exported on DT.UI.Skin so sibling panels share them.
-- ---------------------------------------------------------------------------

-- A flat "X" close button: two thin diagonal strokes that brighten to a soft red
-- on hover over a faint red backing. Caller sets the anchor and OnClick.
local function createCloseButton(parent)
    local b = CreateFrame("Button", nil, parent)
    b:SetSize(20, 20)

    b.bg = b:CreateTexture(nil, "BACKGROUND")
    b.bg:SetAllPoints()

    local function stroke(angle)
        local t = b:CreateTexture(nil, "ARTWORK")
        t:SetTexture("Interface\\Buttons\\WHITE8X8")
        t:SetSize(11, 1.6)
        t:SetPoint("CENTER")
        t:SetRotation(angle)
        return t
    end
    b.s1 = stroke(0.785398)   -- +45 degrees
    b.s2 = stroke(-0.785398)  -- -45 degrees

    local IDLE = { 0.72, 0.72, 0.75 }
    local function paint(self, glow)
        local g = glow and { 1.0, 0.86, 0.86 } or IDLE
        self.s1:SetColorTexture(g[1], g[2], g[3], 1)
        self.s2:SetColorTexture(g[1], g[2], g[3], 1)
        self.bg:SetColorTexture(0.80, 0.25, 0.25, glow and 0.30 or 0)
    end
    paint(b, false)
    b:SetScript("OnEnter", function(self) paint(self, true) end)
    b:SetScript("OnLeave", function(self) paint(self, false) end)
    return b
end

-- A scroll frame with a slim themed scrollbar: mouse-wheel support and a
-- draggable thumb that hides itself whenever the content fits. The scrollbar is
-- anchored to the scroll frame's right edge, so the caller only positions the
-- scroll frame (and the bar follows, even when repositioned later). Returns
-- (scroll, content, scrollbar); `width` is the scroll child width.
local SCROLL_STEP = 24
local function createScrollFrame(parent, width)
    local scroll = CreateFrame("ScrollFrame", nil, parent)
    local content = CreateFrame("Frame", nil, scroll)
    content:SetSize(width, 10)
    scroll:SetScrollChild(content)
    scroll:EnableMouseWheel(true)

    local bar = CreateFrame("Frame", nil, parent)
    bar:SetWidth(6)
    bar:SetPoint("TOPLEFT", scroll, "TOPRIGHT", 4, 0)
    bar:SetPoint("BOTTOMLEFT", scroll, "BOTTOMRIGHT", 4, 0)
    bar:SetFrameLevel((scroll:GetFrameLevel() or 1) + 5)
    bar.track = bar:CreateTexture(nil, "BACKGROUND")
    bar.track:SetAllPoints()
    bar.track:SetColorTexture(0, 0, 0, 0.28)

    local thumb = CreateFrame("Button", nil, bar)
    thumb:SetWidth(6)
    thumb:SetPoint("TOP", bar, "TOP", 0, 0)
    thumb.tex = thumb:CreateTexture(nil, "ARTWORK")
    thumb.tex:SetAllPoints()
    bar.thumb = thumb

    local function paintThumb(glow)
        local top    = glow and { 0.46, 0.49, 0.58 } or { 0.34, 0.36, 0.43 }
        local bottom = glow and { 0.30, 0.32, 0.39 } or { 0.22, 0.23, 0.29 }
        setVGradient(thumb.tex, top, bottom)
    end
    paintThumb(false)

    local function update()
        local range = scroll:GetVerticalScrollRange()
        -- Never show the bar when there's nothing to scroll OR the scroll frame is
        -- hidden. The latter matters on collapse: shrinking the window resizes the
        -- (hidden) scroll frame, which fires OnScrollRangeChanged and would re-show
        -- the bar beside the logo chip right after applyCollapsedGeometry hid it.
        if range <= 1 or not scroll:IsShown() then bar:Hide(); return end
        bar:Show()
        if scroll:GetVerticalScroll() > range then scroll:SetVerticalScroll(range) end
        local trackH = bar:GetHeight()
        local viewH  = scroll:GetHeight()
        local thumbH = math.max(24, trackH * (viewH / (viewH + range)))
        thumb:SetHeight(thumbH)
        local pct = scroll:GetVerticalScroll() / range
        thumb:ClearAllPoints()
        thumb:SetPoint("TOP", bar, "TOP", 0, -(trackH - thumbH) * pct)
    end
    bar.Update = update

    scroll:SetScript("OnScrollRangeChanged", update)
    scroll:SetScript("OnVerticalScroll", update)
    scroll:SetScript("OnMouseWheel", function(self, delta)
        local range = self:GetVerticalScrollRange()
        self:SetVerticalScroll(math.min(math.max(0, self:GetVerticalScroll() - delta * SCROLL_STEP), range))
    end)

    thumb:SetScript("OnEnter", function() paintThumb(true) end)
    thumb:SetScript("OnLeave", function(self) if not self.drag then paintThumb(false) end end)
    thumb:SetScript("OnMouseDown", function(self)
        self.drag = true
        self.s0 = scroll:GetVerticalScroll()
        local _, cy = GetCursorPosition()
        self.cy0 = cy
    end)
    thumb:SetScript("OnMouseUp", function(self)
        self.drag = false
        if not self:IsMouseOver() then paintThumb(false) end
    end)
    thumb:SetScript("OnUpdate", function(self)
        if not self.drag then return end
        local range = scroll:GetVerticalScrollRange()
        local denom = bar:GetHeight() - self:GetHeight()
        if range <= 0 or denom <= 0 then return end
        local scale = UIParent:GetEffectiveScale()
        local _, cy = GetCursorPosition()
        local dy = (self.cy0 - cy) / scale
        scroll:SetVerticalScroll(math.min(math.max(0, self.s0 + dy * (range / denom)), range))
    end)

    return scroll, content, bar
end

-- A flat themed button matching the title/tab surfaces: subtle vertical
-- gradient, 1px edge, automatic hover highlight, light text. Replaces the stock
-- gold UIPanelButtonTemplate so the title-bar buttons and Browse dropdowns read
-- as part of the dark theme. The caller sets the anchor and scripts.
local function createThemedButton(parent, text, w, h)
    local b = CreateFrame("Button", nil, parent, "BackdropTemplate")
    b:SetSize(w, h or 18)
    if b.SetBackdrop then
        b:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8X8",
            edgeFile = "Interface\\Buttons\\WHITE8X8", edgeSize = 1,
        })
        b:SetBackdropColor(0, 0, 0, 0)  -- the gradient fill provides the colour
        b:SetBackdropBorderColor(unpack(THEME.panelEdge))
    end
    b.fill = makeStrip(b, "BACKGROUND", THEME.tabActive, THEME.tabActive2)
    b.fill:SetPoint("TOPLEFT", 1, -1)
    b.fill:SetPoint("BOTTOMRIGHT", -1, 1)

    b.label = b:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    b.label:SetPoint("CENTER")
    b.label:SetText(text or "")
    b.label:SetTextColor(0.85, 0.85, 0.82)

    b.hl = makeStrip(b, "HIGHLIGHT", { 1, 1, 1, 0.06 })
    b.hl:SetPoint("TOPLEFT", 1, -1)
    b.hl:SetPoint("BOTTOMRIGHT", -1, 1)

    function b:SetText(t) self.label:SetText(t) end
    return b
end

-- Give a themed title-bar button the same lit "active" overlay the Route button uses,
-- so on/open toggles share one visual language. Hidden by default; updateRouteButton /
-- updateToggleButtons show it. Uses the zone accent so all three toggles light alike.
local function addActiveOverlay(btn)
    btn.active = makeStrip(btn, "ARTWORK",
        { ZONE_ACCENT[1], ZONE_ACCENT[2], ZONE_ACCENT[3], 0.55 },
        { ZONE_ACCENT[1] * 0.55, ZONE_ACCENT[2] * 0.55, ZONE_ACCENT[3] * 0.55, 0.55 })
    btn.active:SetPoint("TOPLEFT", 1, -1)
    btn.active:SetPoint("BOTTOMRIGHT", -1, 1)
    btn.active:Hide()
    return btn.active
end

-- Custom themed dropdown, replacing UIDropDownMenuTemplate (whose menu list is a
-- shared global frame that can't be cleanly skinned). A single popup frame is
-- shared by every dropdown; a screen-wide catcher closes it on an outside click.
local dropMenu
local function ensureDropMenu()
    if dropMenu then return dropMenu end
    local catcher = CreateFrame("Button", nil, UIParent)
    catcher:SetAllPoints(UIParent)
    catcher:SetFrameStrata("FULLSCREEN_DIALOG")
    catcher:SetFrameLevel(1)
    catcher:RegisterForClicks("AnyUp")
    catcher:Hide()

    local m = CreateFrame("Frame", nil, UIParent, "BackdropTemplate")
    m:SetFrameStrata("FULLSCREEN_DIALOG")
    m:SetFrameLevel(20)
    m:SetClampedToScreen(true)
    m:EnableMouse(true)
    if m.SetBackdrop then
        m:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8X8",
            edgeFile = "Interface\\Buttons\\WHITE8X8", edgeSize = 1,
        })
        m:SetBackdropColor(0.10, 0.11, 0.14, 0.98)
        m:SetBackdropBorderColor(unpack(THEME.panelEdge))
    end
    m:Hide()
    catcher:SetScript("OnClick", function() m:Hide() end)
    m:SetScript("OnHide", function() catcher:Hide() end)
    m.catcher = catcher
    m.rows = {}
    dropMenu = m
    return m
end

local function getMenuRow(m, i)
    local r = m.rows[i]
    if r then return r end
    r = CreateFrame("Button", nil, m)
    r:SetHeight(18)
    r.hl = r:CreateTexture(nil, "HIGHLIGHT")
    r.hl:SetAllPoints()
    r.hl:SetColorTexture(1, 1, 1, 0.08)
    -- Small green dot marks the current selection (matches the progress accent).
    r.check = r:CreateTexture(nil, "ARTWORK")
    r.check:SetSize(5, 5)
    r.check:SetPoint("LEFT", 8, 0)
    r.check:SetColorTexture(THEME.progress[1], THEME.progress[2], THEME.progress[3], 1)
    r.label = r:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    r.label:SetPoint("LEFT", 18, 0)
    r.label:SetPoint("RIGHT", -10, 0)
    r.label:SetJustifyH("LEFT")
    r.label:SetWordWrap(false)
    m.rows[i] = r
    return r
end

local MENU_PAD = 6
local MENU_ROW_H = 18
-- modal (default): a fullscreen catcher closes the menu on any outside click —
-- right for the Browse dropdowns. modal=false skips the catcher so the menu does
-- NOT sit over (and swallow clicks meant for) the quest list — used by the search
-- type-ahead, which must let you click a result row underneath it.
local function openDropMenu(dd, modal)
    local m = ensureDropMenu()
    local entries = dd.builder and dd.builder() or {}
    local y = -MENU_PAD
    for i, e in ipairs(entries) do
        local r = getMenuRow(m, i)
        r:ClearAllPoints()
        r:SetPoint("TOPLEFT", m, "TOPLEFT", 3, y)
        r:SetPoint("TOPRIGHT", m, "TOPRIGHT", -3, y)
        r.label:SetText(e.text)
        r.check:SetShown(e.checked and not e.disabled)
        if e.disabled then
            r.label:SetTextColor(0.5, 0.5, 0.5)
            r.hl:Hide()
            r:EnableMouse(false)
            r:SetScript("OnClick", nil)
        else
            r.label:SetTextColor(0.90, 0.90, 0.88)
            r.hl:Show()
            r:EnableMouse(true)
            r:SetScript("OnClick", function()
                m:Hide()
                if e.func then e.func() end
            end)
        end
        r:Show()
        y = y - MENU_ROW_H
    end
    for i = #entries + 1, #m.rows do m.rows[i]:Hide() end

    m:SetWidth(math.max(dd:GetWidth(), 140))
    m:SetHeight(-y + MENU_PAD)
    m:ClearAllPoints()
    m:SetPoint("TOPLEFT", dd, "BOTTOMLEFT", 0, -2)
    if modal == false then m.catcher:Hide() else m.catcher:Show() end
    m:Show()
end

local function createDropdown(parent, width)
    local dd = createThemedButton(parent, "", width, 22)
    -- Left-align the label and leave room for the chevron at the right.
    dd.label:ClearAllPoints()
    dd.label:SetPoint("LEFT", 8, 0)
    dd.label:SetPoint("RIGHT", -16, 0)
    dd.label:SetJustifyH("LEFT")
    dd.label:SetWordWrap(false)

    -- Down chevron ("v") drawn as two short strokes, echoing the close-button X.
    local function stroke(rot, ox)
        local t = dd:CreateTexture(nil, "OVERLAY")
        t:SetTexture("Interface\\Buttons\\WHITE8X8")
        t:SetVertexColor(0.75, 0.75, 0.78, 1)
        t:SetSize(5, 1.5)
        t:SetPoint("CENTER", dd, "RIGHT", -10 + ox, 0)
        t:SetRotation(rot)
        return t
    end
    stroke(-0.7854, -1.4)  -- "\" left half
    stroke(0.7854, 1.4)    -- "/" right half

    function dd:SetBuilder(fn) self.builder = fn end
    dd:SetScript("OnClick", function(self)
        local m = ensureDropMenu()
        if m:IsShown() and m.owner == self then
            m:Hide()
        else
            m.owner = self
            openDropMenu(self)
        end
    end)
    return dd
end

local function hideDropMenu()
    if dropMenu then dropMenu:Hide() end
end
-- Exposed so the quest rows (whose OnClick is defined earlier) can dismiss a
-- lingering non-modal search popup when a result is clicked.
DT.UI.HideDropMenu = hideDropMenu

-- A themed search box: dark chip with a magnifier glyph, an EditBox, and a clear
-- (×) button that appears once there's text. Typing live-filters the list (the
-- query is stored on DT.UI and a Refresh rebuilds the display in search mode) and
-- pops a type-ahead menu of matching quest names beneath the box. Picking a
-- suggestion fills the box with that exact name. Reuses the shared dropMenu popup
-- so the suggestions match the Browse dropdowns' look.
local function createSearchBox(parent, width)
    local box = CreateFrame("Frame", nil, parent, "BackdropTemplate")
    box:SetSize(width, 22)
    if box.SetBackdrop then
        box:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8X8",
            edgeFile = "Interface\\Buttons\\WHITE8X8", edgeSize = 1,
        })
        box:SetBackdropColor(0.06, 0.07, 0.09, 0.95)
        box:SetBackdropBorderColor(unpack(THEME.panelEdge))
    end

    local icon = box:CreateTexture(nil, "ARTWORK")
    icon:SetSize(14, 14)
    icon:SetPoint("LEFT", 6, 0)
    icon:SetTexture("Interface\\Common\\UI-Searchbox-Icon")
    icon:SetVertexColor(0.65, 0.65, 0.68)

    -- Clear (×) button, only visible when the box has text.
    local clear = CreateFrame("Button", nil, box)
    clear:SetSize(16, 16)
    clear:SetPoint("RIGHT", -4, 0)
    clear.x = clear:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    clear.x:SetPoint("CENTER", 0, 1)
    clear.x:SetText("×")
    clear.x:SetTextColor(0.6, 0.6, 0.62)
    clear:SetScript("OnEnter", function(s) s.x:SetTextColor(1, 0.45, 0.45) end)
    clear:SetScript("OnLeave", function(s) s.x:SetTextColor(0.6, 0.6, 0.62) end)
    clear:Hide()

    local eb = CreateFrame("EditBox", nil, box)
    eb:SetAutoFocus(false)
    eb:SetFontObject("GameFontHighlightSmall")
    eb:SetTextColor(0.92, 0.92, 0.88)
    eb:SetMaxLetters(50)
    eb:SetPoint("LEFT", icon, "RIGHT", 5, 0)
    eb:SetPoint("RIGHT", clear, "LEFT", -2, 0)
    eb:SetHeight(20)
    box.editBox = eb

    -- Muted placeholder, hidden while typing or when text is present.
    local placeholder = box:CreateFontString(nil, "ARTWORK", "GameFontDisableSmall")
    placeholder:SetPoint("LEFT", eb, "LEFT", 1, 0)
    placeholder:SetText("Search quests by name…")
    placeholder:SetTextColor(0.5, 0.5, 0.52)

    -- Pop (or refresh) the type-ahead menu of matching names under the box.
    local function showSuggestions()
        local list = searchSuggestions(DT.UI.searchQuery)
        if #list == 0 then hideDropMenu(); return end
        box.builder = function()
            local out = {}
            for _, s in ipairs(list) do
                -- Tag faction suggestions so they're unmistakably NOT quests: the
                -- name in the faction accent colour plus a muted "— Faction" label.
                -- The box still receives the clean name (s.title) on pick.
                local display = s.faction
                    and ("|cff" .. toHex(FACTION_ACCENT) .. s.title .. "|r  |cff707070— Faction|r")
                    or s.title
                out[#out+1] = { text = display, func = function()
                    -- Picking a suggestion IS selecting that result. A quest opens in
                    -- the Details panel (first, so the row highlights when the list
                    -- rebuilds); a faction suggestion just narrows the view. Either
                    -- way mirror the name into the box (a programmatic set,
                    -- userInput=false, so the menu won't re-open and the list filters
                    -- down to the pick).
                    if not s.faction and DT.Details then
                        DT.Details:Show(s.entry)
                    end
                    eb:SetText(s.title)
                    eb:SetCursorPosition(#s.title)
                    eb:ClearFocus()
                    hideDropMenu()
                end }
            end
            return out
        end
        local m = ensureDropMenu()
        m.owner = box
        openDropMenu(box, false)  -- non-modal: never block clicks on the results list
    end

    -- Debounce the expensive search work. A full rebuild (buildSearchMode scans
    -- the whole catalog) plus the suggestion scan are too heavy to run twice on
    -- every keystroke, so the lightweight UI (placeholder, clear button) updates
    -- immediately while the rebuild + type-ahead coalesce to the last keystroke in
    -- a short window. Only one timer is ever in flight; it reads the latest query/
    -- intent when it fires, so fast typing collapses to a single rebuild.
    local SEARCH_DEBOUNCE = 0.15
    local searchPending, searchWantSuggest = false, false
    local function runSearch()
        searchPending = false
        DT.UI:Refresh()
        -- Re-check focus: a pending timer must not re-pop the type-ahead after the
        -- user dismissed it with Enter/Escape or by picking a result.
        -- On the Search tab the floating popup is suppressed entirely: the live
        -- grouped results (factions / currencies / zones / quests) already serve as
        -- the auto-populate, and a popup anchored under the box would just overlap
        -- them. Other tabs keep the popup (their search is a flat overlay).
        if searchWantSuggest and DT.UI.searchQuery ~= "" and eb:HasFocus()
        and DT.UI.mode ~= "SEARCH" then
            showSuggestions()
        else
            hideDropMenu()
        end
    end

    eb:SetScript("OnTextChanged", function(self, userInput)
        local text = self:GetText() or ""
        -- Trim leading/trailing spaces for matching but keep what the user typed.
        DT.UI.searchQuery = text:gsub("^%s+", ""):gsub("%s+$", "")
        -- Lightweight, immediate feedback (no catalog scan here).
        placeholder:SetShown(text == "")
        clear:SetShown(text ~= "")
        searchWantSuggest = userInput and DT.UI.searchQuery ~= ""
        if not searchPending then
            searchPending = true
            if C_Timer and C_Timer.After then
                C_Timer.After(SEARCH_DEBOUNCE, runSearch)
            else
                runSearch()
            end
        end
    end)
    eb:SetScript("OnEscapePressed", function(self)
        self:SetText("")
        self:ClearFocus()
        hideDropMenu()
    end)
    eb:SetScript("OnEnterPressed", function(self)
        self:ClearFocus()
        hideDropMenu()
    end)
    eb:SetScript("OnEditFocusGained", function() placeholder:Hide() end)
    eb:SetScript("OnEditFocusLost", function(self)
        placeholder:SetShown((self:GetText() or "") == "")
        hideDropMenu()
    end)

    clear:SetScript("OnClick", function()
        eb:SetText("")
        eb:SetFocus()
        hideDropMenu()
    end)

    -- Let the magnifier act as a focus target too.
    box:EnableMouse(true)
    box:SetScript("OnMouseDown", function() eb:SetFocus() end)

    return box
end

-- ---------------------------------------------------------------------------
-- Help & Settings window
-- ---------------------------------------------------------------------------
-- An independent, draggable pop-up with three content tabs -- Guide, About,
-- Changelog -- over a fixed Settings band. Created lazily (ensureHelpWindow) and
-- parented to UIParent so DT.UI:ShowChangelog can pop it on login without opening
-- the tracker. Opened/closed by the title-bar gear button.
local helpWindow

-- The Guide page text. Mirrors the in-game features and how to use them.
local HELP_GUIDE =
    "|cffffd100Tabs|r\n"
    .. "|cff8ec5ffCurrent Zone|r — dailies in the zone you're standing in.\n"
    .. "|cff8ec5ffExpansion|r — every tracked daily, grouped by expansion then zone.\n"
    .. "|cff8ec5ffFaction/Rep|r — grouped by the reputation faction each rewards, with a live reputation bar per faction.\n"
    .. "|cff8ec5ffSearch|r — one box that searches by quest name, currency, reputation/faction, or zone. Results group by what matched.\n\n"
    .. "|cffffd100Row clicks|r\n"
    .. "|cff8ec5ffLeft-click|r — open quest details (rewards, objectives, giver, description) / select.\n"
    .. "|cff8ec5ffMiddle-click|r — track / untrack (shows in the Tracked panel).\n"
    .. "|cff8ec5ffShift + Middle-click|r — open the Wowhead quest link.\n"
    .. "|cff8ec5ffRight-click|r — set a map pin / waypoint at the giver.\n"
    .. "|cff8ec5ffShift + Right-click|r — set a TomTom waypoint (if TomTom is installed).\n\n"
    .. "|cffffd100Title-bar buttons|r\n"
    .. "|cff8ec5ffRoute|r — orders the Current Zone tab and Tracked panel as a nearest-giver path, updating as you move.\n"
    .. "|cff8ec5ffTracked|r — show / hide the quests you've tracked (middle-click a quest to track it).\n"
    .. "|cff8ec5ffFilters|r — choose which kinds of quests appear (Holiday, Profession, Battle Pet, Skyriding).\n\n"
    .. "|cffffd100Good to know|r\n"
    .. "The sub-bar shows a live countdown to the next daily reset.\n"
    .. "A minimap button (and any data-broker bar) shows your done / total.\n"
    .. "Your daily streak appears in |cffffd100/qt stats|r and the minimap tooltip.\n"
    .. "Status colours: |cffd1ae47Available|r · |cff6b99c7In Progress|r · |cff75b875Ready to turn in|r · |cff737578Done today|r.\n\n"
    .. "|cffffd100Slash commands|r\n"
    .. "|cffffd100/qt|r toggle · |cffffd100/qt stats|r checklist & streak · |cffffd100/qt help|r all commands."

local URL_COMMENTS = "https://www.curseforge.com/wow/addons/questtally-daily-quest-tracker/comments"
local URL_ISSUES   = "https://legacy.curseforge.com/wow/addons/questtally-daily-quest-tracker/settings/issues"

local HELP_ABOUT =
    "|cffffd100About QuestTally|r\n"
    .. "QuestTally is a solo project by me, Soap64. This tool is something I've felt I've always needed, just never got around to actually building. I saw the CurseForge addon contest and decided to take my shot.\n\n"
    .. "It's free, and ships only first-party data. Because of how Blizzard maintains their old (pre-Cata) vs new quest data, it's a lot more legwork than you'd think, so please let me know if you see anything off!\n\n"
    .. "|cffffd100Get in touch|r\n"
    .. "Use the buttons below to drop a comment or report an issue on CurseForge (each opens a copyable link)."

-- Render DT.CHANGELOG into display text: a version header + bullet notes per entry.
local function buildChangelogText()
    if not DT.CHANGELOG or #DT.CHANGELOG == 0 then return "No changelog available." end
    local parts = {}
    for _, e in ipairs(DT.CHANGELOG) do
        parts[#parts + 1] = "|cffffd100v" .. e.version .. "|r  |cff707070"
            .. (e.date or "") .. "|r"
        for _, line in ipairs(e.notes or {}) do
            parts[#parts + 1] = "  • " .. line
        end
        parts[#parts + 1] = " "  -- blank spacer between versions
    end
    return table.concat(parts, "\n")
end

local function createInfoWindow()
    local w = CreateFrame("Frame", "QuestTallyHelpWindow", UIParent, "BackdropTemplate")
    w:SetSize(440, 520)
    w:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    w:SetFrameStrata("DIALOG")
    w:SetToplevel(true)
    w:EnableMouse(true)
    w:SetMovable(true)
    w:RegisterForDrag("LeftButton")
    w:SetScript("OnDragStart", w.StartMoving)
    w:SetScript("OnDragStop", w.StopMovingOrSizing)
    if w.SetBackdrop then
        w:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8X8",
            edgeFile = "Interface\\Buttons\\WHITE8X8", edgeSize = 1,
        })
        w:SetBackdropColor(0.07, 0.08, 0.10, 0.99)
        w:SetBackdropBorderColor(unpack(THEME.panelEdge))
    end
    w:Hide()

    local titleBar = makeStrip(w, "BORDER", THEME.titleBg, THEME.titleBg2)
    titleBar:SetPoint("TOPLEFT", 1, -1)
    titleBar:SetPoint("TOPRIGHT", -1, -1)
    titleBar:SetHeight(26)

    local title = w:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("LEFT", titleBar, "LEFT", 12, 0)
    title:SetText("QuestTally  |cff707070—|r  Help & Settings")
    title:SetTextColor(0.95, 0.95, 0.92)

    local close = createCloseButton(w)
    close:SetPoint("RIGHT", titleBar, "RIGHT", -6, 0)
    close:SetScript("OnClick", function() w:Hide() end)

    -- Settings band, pinned to the bottom; the content area fills the space above it.
    -- Kept as a home for future options -- the only former toggle ("newest
    -- expansions first") was retired in favour of that being the baked-in default.
    local setBlock = CreateFrame("Frame", nil, w)
    setBlock:SetPoint("BOTTOMLEFT", 1, 1)
    setBlock:SetPoint("BOTTOMRIGHT", -1, 1)
    setBlock:SetHeight(64)

    local sdiv = setBlock:CreateTexture(nil, "ARTWORK")
    sdiv:SetColorTexture(THEME.panelEdge[1], THEME.panelEdge[2], THEME.panelEdge[3], 1)
    sdiv:SetHeight(1)
    sdiv:SetPoint("TOPLEFT", setBlock, "TOPLEFT", 13, 0)
    sdiv:SetPoint("TOPRIGHT", setBlock, "TOPRIGHT", -13, 0)

    local setHeader = setBlock:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    setHeader:SetPoint("TOPLEFT", sdiv, "BOTTOMLEFT", 0, -10)
    setHeader:SetText("Settings")
    setHeader:SetTextColor(0.82, 0.68, 0.28)

    local setPlaceholder = setBlock:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    setPlaceholder:SetPoint("TOPLEFT", setHeader, "BOTTOMLEFT", 0, -7)
    setPlaceholder:SetText("More options coming soon.")
    setPlaceholder:SetTextColor(0.55, 0.55, 0.58)

    -- Content scroll (between the page tabs and the settings band).
    local scroll, content, helpBar = createScrollFrame(w, 440 - 30)
    scroll:SetPoint("TOPLEFT", titleBar, "BOTTOMLEFT", 13, -32)
    scroll:SetPoint("BOTTOMRIGHT", setBlock, "TOPRIGHT", -22, 8)

    local pageText = content:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    pageText:SetPoint("TOPLEFT", 2, -2)
    pageText:SetWidth(440 - 30 - 10)
    pageText:SetJustifyH("LEFT")
    pageText:SetJustifyV("TOP")
    pageText:SetSpacing(4)
    pageText:SetTextColor(0.86, 0.86, 0.84)

    -- CurseForge link buttons, shown only on the About page, floating at the bottom
    -- of the content area (above the settings band). WoW can't open a browser, so
    -- each pops a copyable URL (Ctrl+C), like the Wowhead link.
    local issueBtn = createThemedButton(w, "Report an issue", 130, 18)
    issueBtn:SetPoint("BOTTOMRIGHT", setBlock, "TOPRIGHT", -16, 8)
    issueBtn:SetScript("OnClick", function()
        DT.UI:ShowCopyText("Report an issue — press Ctrl+C to copy the link:", URL_ISSUES)
    end)
    issueBtn:Hide()

    local commentBtn = createThemedButton(w, "Drop a comment", 130, 18)
    commentBtn:SetPoint("RIGHT", issueBtn, "LEFT", -6, 0)
    commentBtn:SetScript("OnClick", function()
        DT.UI:ShowCopyText("Drop a comment — press Ctrl+C to copy the link:", URL_COMMENTS)
    end)
    commentBtn:Hide()

    local PAGES = { guide = HELP_GUIDE, about = HELP_ABOUT }  -- changelog built live

    -- Page tabs (mirroring the bottom mode-tab look: a hidden active fill + a
    -- dim/bright label that lights when selected).
    w.tabs = {}
    local function setPage(name)
        w.page = name
        pageText:SetText(name == "changelog" and buildChangelogText() or (PAGES[name] or ""))
        content:SetHeight(math.max((pageText:GetStringHeight() or 0) + 12, 10))
        scroll:SetVerticalScroll(0)
        if helpBar and helpBar.Update then helpBar:Update() end
        local onAbout = (name == "about")
        issueBtn:SetShown(onAbout)
        commentBtn:SetShown(onAbout)
        for key, tab in pairs(w.tabs) do
            local active = (key == name)
            tab.bg:SetShown(active)
            tab.label:SetTextColor(active and 0.95 or 0.58, active and 0.95 or 0.58, active and 0.92 or 0.56)
        end
    end
    -- Exposed as a method: DT.UI:ShowChangelog calls w:SetPage("changelog"), and the
    -- colon passes `w` as an implicit first arg. Swallow it here so `name` is always
    -- the page string -- otherwise setPage(name) would receive the frame and render a
    -- blank page (the changelog popped blank on login until you clicked the tab).
    w.SetPage = function(_, name) setPage(name) end

    local tabDefs = { { "guide", "Guide" }, { "about", "About" }, { "changelog", "Changelog" } }
    local prev
    for _, t in ipairs(tabDefs) do
        local tab = CreateFrame("Button", nil, w)
        tab:SetSize(96, 18)
        if prev then
            tab:SetPoint("LEFT", prev, "RIGHT", 4, 0)
        else
            tab:SetPoint("TOPLEFT", titleBar, "BOTTOMLEFT", 12, -7)
        end
        tab.bg = makeStrip(tab, "BACKGROUND", THEME.tabActive, THEME.tabActive2)
        tab.bg:SetAllPoints()
        tab.bg:Hide()
        tab.label = tab:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        tab.label:SetPoint("CENTER")
        tab.label:SetText(t[2])
        tab.hl = makeStrip(tab, "HIGHLIGHT", { 1, 1, 1, 0.06 })
        tab.hl:SetAllPoints()
        tab:SetScript("OnClick", function() setPage(t[1]) end)
        w.tabs[t[1]] = tab
        prev = tab
    end

    w:SetScript("OnShow", function()
        setPage(w.page or "guide")
    end)

    return w
end

local function ensureHelpWindow()
    if not helpWindow then helpWindow = createInfoWindow() end
    return helpWindow
end

local function createMainFrame()
    local f = CreateFrame("Frame", "QuestTallyFrame", UIParent, "BackdropTemplate")
    f:SetSize(372, 470)
    f:SetPoint("CENTER")
    f:SetFrameStrata("MEDIUM")
    f:SetClampedToScreen(true)
    f:SetMovable(true)
    f:EnableMouse(true)
    -- Persist the current position (CENTER/UIParent-CENTER, matching ResetPosition).
    local function saveFramePosition()
        local point, _, _, x, y = f:GetPoint()
        DT.DB.account.framePosition = { point = point, x = x, y = y }
    end

    -- Title-bar drag (expanded window) uses the built-in mover.
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", function(self) self:StopMovingOrSizing(); saveFramePosition() end)

    -- Cursor travel (UI units) before a press on the logo becomes a drag instead of
    -- a click. Small so the chip starts moving almost immediately; large enough that
    -- a normal click still toggles collapse. Tune here.
    local LOGO_DRAG_THRESHOLD = 3

    -- Drag the window by its logo. We drive this from OnMouseDown rather than
    -- RegisterForDrag because WoW's built-in drag dead-zone is far larger than the
    -- 30x30 chip, so the chip wouldn't start moving until the cursor was well past
    -- its edge. Here it follows as soon as the cursor passes LOGO_DRAG_THRESHOLD;
    -- a press with no real movement falls through to a collapse/expand toggle. We
    -- poll IsMouseButtonDown (not OnDragStop) so it keeps tracking even if the
    -- cursor briefly leaves the chip, and re-anchor by TOP-LEFT so the chip's corner
    -- stays under the grab point and the saved position matches ResetPosition.
    local function onLogoMouseDown(_, button)
        if button and button ~= "LeftButton" then return end
        local scale = f:GetEffectiveScale()
        local startCX, startCY = GetCursorPosition()
        local baseX = f:GetLeft() - UIParent:GetLeft()
        local baseY = f:GetTop() - UIParent:GetTop()
        local dragging = false
        f:SetScript("OnUpdate", function(self)
            if not IsMouseButtonDown("LeftButton") then
                self:SetScript("OnUpdate", nil)
                if dragging then saveFramePosition() else DT.UI:ToggleCollapsed() end
                return
            end
            local dx = (select(1, GetCursorPosition()) - startCX) / scale
            local dy = (select(2, GetCursorPosition()) - startCY) / scale
            if not dragging and (math.abs(dx) >= LOGO_DRAG_THRESHOLD or math.abs(dy) >= LOGO_DRAG_THRESHOLD) then
                dragging = true
            end
            if dragging then
                self:ClearAllPoints()
                self:SetPoint("TOPLEFT", UIParent, "TOPLEFT", baseX + dx, baseY + dy)
            end
        end)
    end
    f._onLogoMouseDown = onLogoMouseDown

    -- Flat dark panel with a thin 1px border.
    if f.SetBackdrop then
        f:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8X8",
            edgeFile = "Interface\\Buttons\\WHITE8X8",
            edgeSize = 1,
        })
        f:SetBackdropColor(unpack(THEME.panelBg))
        f:SetBackdropBorderColor(unpack(THEME.panelEdge))
    end

    -- Title bar strip (gradient + a top highlight and bottom shadow hairline so
    -- it reads as a raised bar rather than a flat block).
    f.titleBar = makeStrip(f, "BORDER", THEME.titleBg, THEME.titleBg2)
    f.titleBar:SetPoint("TOPLEFT", 1, -1)
    f.titleBar:SetPoint("TOPRIGHT", -1, -1)
    f.titleBar:SetHeight(28)

    f.titleHi = makeStrip(f, "BORDER", THEME.bevelHi)
    f.titleHi:SetPoint("TOPLEFT", f.titleBar, "TOPLEFT", 0, 0)
    f.titleHi:SetPoint("TOPRIGHT", f.titleBar, "TOPRIGHT", 0, 0)
    f.titleHi:SetHeight(1)

    f.titleLo = makeStrip(f, "BORDER", THEME.bevelLo)
    f.titleLo:SetPoint("BOTTOMLEFT", f.titleBar, "BOTTOMLEFT", 0, 0)
    f.titleLo:SetPoint("BOTTOMRIGHT", f.titleBar, "BOTTOMRIGHT", 0, 0)
    f.titleLo:SetHeight(1)

    -- Title icon + text. The QuestTally app-icon logo (baked to TGA by
    -- _generator/build-logo-texture.js); its art carries its own border, so the
    -- texture is shown full-frame rather than trimmed like a stock action icon.
    -- 22px in the 28px bar: fills more of the title bar's height than the original
    -- 18px while keeping a ~3px margin off the top/bottom bevels (the bar height is
    -- unchanged). Also fits the 30px collapsed chip with room to spare.
    f.portrait = f:CreateTexture(nil, "ARTWORK")
    f.portrait:SetSize(22, 22)
    f.portrait:SetPoint("LEFT", f.titleBar, "LEFT", 9, 0)
    f.portrait:SetTexture("Interface\\AddOns\\QuestTally\\Media\\QuestTally-Logo.tga")

    -- Clicking the logo collapses the whole window to a logo-only chip (and back).
    -- Scoped to the logo so the rest of the title bar still works as a drag handle.
    f.logoBtn = CreateFrame("Button", nil, f)
    f.logoBtn:SetAllPoints(f.portrait)
    f.logoBtn:SetFrameLevel(f:GetFrameLevel() + 5)
    -- Click toggles collapse; hold + move drags the window. Both are handled in
    -- onLogoMouseDown so dragging starts immediately (past LOGO_DRAG_THRESHOLD)
    -- rather than after WoW's large RegisterForDrag dead-zone.
    f.logoBtn:SetScript("OnMouseDown", onLogoMouseDown)
    f.logoBtn:SetScript("OnEnter", function(self)
        local isC = DT.UI:IsCollapsed()
        GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT")
        GameTooltip:SetText(isC and "Expand QuestTally" or "Collapse QuestTally", 1, 1, 1)
        GameTooltip:AddLine("Click the logo to " .. (isC and "expand" or "collapse") .. " the window.", 0.7, 0.7, 0.7)
        GameTooltip:Show()
    end)
    f.logoBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)

    f.title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    f.title:SetPoint("LEFT", f.portrait, "RIGHT", 7, 0)
    f.title:SetText("QuestTally")
    f.title:SetTextColor(0.95, 0.95, 0.92)

    f.close = createCloseButton(f)
    f.close:SetPoint("RIGHT", f.titleBar, "RIGHT", -6, 0)
    f.close:SetScript("OnClick", function() DT.UI:Hide() end)

    -- Settings (gear) button: opens the options panel. Wrapped in the same dark
    -- themed chip as the Filters/Pinned buttons (gradient fill, 1px edge, hover
    -- highlight) so it reads as part of the UI instead of a bare stock icon.
    f.settingsBtn = CreateFrame("Button", nil, f, "BackdropTemplate")
    f.settingsBtn:SetSize(22, 18)
    f.settingsBtn:SetPoint("RIGHT", f.close, "LEFT", -4, 0)
    if f.settingsBtn.SetBackdrop then
        f.settingsBtn:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8X8",
            edgeFile = "Interface\\Buttons\\WHITE8X8", edgeSize = 1,
        })
        f.settingsBtn:SetBackdropColor(0, 0, 0, 0)  -- gradient fill provides the colour
        f.settingsBtn:SetBackdropBorderColor(unpack(THEME.panelEdge))
    end
    f.settingsBtn.fill = makeStrip(f.settingsBtn, "BACKGROUND", THEME.tabActive, THEME.tabActive2)
    f.settingsBtn.fill:SetPoint("TOPLEFT", 1, -1)
    f.settingsBtn.fill:SetPoint("BOTTOMRIGHT", -1, 1)
    local cog = f.settingsBtn:CreateTexture(nil, "ARTWORK")
    cog:SetSize(13, 13)
    cog:SetPoint("CENTER")
    cog:SetTexture("Interface\\Buttons\\UI-OptionsButton")
    cog:SetVertexColor(0.85, 0.85, 0.82)
    f.settingsBtn.cog = cog
    f.settingsBtn.hl = makeStrip(f.settingsBtn, "HIGHLIGHT", { 1, 1, 1, 0.06 })
    f.settingsBtn.hl:SetPoint("TOPLEFT", 1, -1)
    f.settingsBtn.hl:SetPoint("BOTTOMRIGHT", -1, 1)
    f.settingsBtn:SetScript("OnEnter", function(self)
        self.cog:SetVertexColor(1, 1, 1)
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:SetText("Help & Settings", 1, 1, 1)
        GameTooltip:AddLine("A feature guide plus options.", 0.7, 0.7, 0.7)
        GameTooltip:Show()
    end)
    f.settingsBtn:SetScript("OnLeave", function(self)
        self.cog:SetVertexColor(0.85, 0.85, 0.82)
        GameTooltip:Hide()
    end)
    f.settingsBtn:SetScript("OnClick", function()
        if f.filters then f.filters:Hide() end
        updateToggleButtons()  -- Filters just closed -> dim its button
        local w = ensureHelpWindow()
        w:SetShown(not w:IsShown())
    end)

    -- "Filters" button toggles the content-filter panel (which KINDS of quests to
    -- show). Mirrors the gear/Settings pattern; the two overlays are mutually
    -- exclusive so only one is open at a time.
    -- Wider than a bare "Filters" so the hidden-count fits (e.g. "Filters (2)").
    f.filtersBtn = createThemedButton(f, "Filters", 66, 18)
    f.filtersBtn:SetPoint("RIGHT", f.settingsBtn, "LEFT", -4, 0)
    addActiveOverlay(f.filtersBtn)  -- lit when the Filters panel is open
    f.filtersBtn:SetScript("OnClick", function()
        if helpWindow then helpWindow:Hide() end
        if f.filters then f.filters:SetShown(not f.filters:IsShown()) end
        updateToggleButtons()
    end)
    f.filtersBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:SetText("Filters", 1, 1, 1)
        GameTooltip:AddLine("Choose which kinds of quests to show.", 0.7, 0.7, 0.7)
        GameTooltip:AddLine(countEnabledFilters() .. " of " .. #FILTER_SETTINGS .. " categories shown.",
            0.95, 0.82, 0.40)
        GameTooltip:Show()
    end)
    f.filtersBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)

    -- "Tracked" button toggles the companion panel of middle-clicked quests, docked
    -- to the left edge of the window. (The internal name stays `pinned` so saved
    -- tracked quests aren't lost; the user-facing concept is "tracked".)
    f.pinnedBtn = createThemedButton(f, "Tracked", 56, 18)
    f.pinnedBtn:SetPoint("RIGHT", f.filtersBtn, "LEFT", -4, 0)
    addActiveOverlay(f.pinnedBtn)  -- lit when the Tracked panel is open
    f.pinnedBtn:SetScript("OnClick", function()
        if DT.Pinned then DT.Pinned:Toggle() end
        updateToggleButtons()
    end)
    f.pinnedBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:SetText("Tracked quests", 1, 1, 1)
        GameTooltip:AddLine("Show/hide the quests you've tracked (middle-click).", 0.7, 0.7, 0.7)
        GameTooltip:Show()
    end)
    f.pinnedBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)

    -- "Route" button: toggles Today's Route ordering (nearest-giver travel order)
    -- on the Current Zone tab and the Pinned panel. A lit accent overlay marks the
    -- active state; tracked by updateRouteButton on every refresh.
    f.routeBtn = createThemedButton(f, "Route", 50, 18)
    f.routeBtn:SetPoint("RIGHT", f.pinnedBtn, "LEFT", -4, 0)
    f.routeBtn.active = makeStrip(f.routeBtn, "ARTWORK",
        { ZONE_ACCENT[1], ZONE_ACCENT[2], ZONE_ACCENT[3], 0.55 },
        { ZONE_ACCENT[1] * 0.55, ZONE_ACCENT[2] * 0.55, ZONE_ACCENT[3] * 0.55, 0.55 })
    f.routeBtn.active:SetPoint("TOPLEFT", 1, -1)
    f.routeBtn.active:SetPoint("BOTTOMRIGHT", -1, 1)
    f.routeBtn.active:Hide()
    f.routeBtn:SetScript("OnClick", function()
        DT.DB:SetSetting("todaysRoute", not DT.DB:GetSetting("todaysRoute"))
        DT.UI:Refresh()
        if DT.Pinned then DT.Pinned:Refresh() end
    end)
    f.routeBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:SetText("Today's Route", 1, 1, 1)
        GameTooltip:AddLine("Order the Current Zone tab and Tracked panel as a", 0.7, 0.7, 0.7)
        GameTooltip:AddLine("nearest-giver travel route from where you stand.", 0.7, 0.7, 0.7)
        GameTooltip:AddLine(DT.DB:GetSetting("todaysRoute") and "Currently: on" or "Currently: off",
            0.5, 0.8, 1)
        GameTooltip:Show()
    end)
    f.routeBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)

    -- Overall progress counter, right-aligned before the title-bar buttons.
    f.progress = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    f.progress:SetPoint("RIGHT", f.routeBtn, "LEFT", -8, 0)
    f.progress:SetJustifyH("RIGHT")

    -- Context sub-bar (zone / reset info).
    f.subBar = makeStrip(f, "BORDER", THEME.subBarBg)
    f.subBar:SetPoint("TOPLEFT", f.titleBar, "BOTTOMLEFT", 0, 0)
    f.subBar:SetPoint("TOPRIGHT", f.titleBar, "BOTTOMRIGHT", 0, 0)
    f.subBar:SetHeight(22)

    -- Slim completion bar at the title/sub-bar seam: a dark track with a sage fill
    -- sized to the on-screen done/total, so overall progress reads pre-attentively
    -- (you feel it before reading the "12 / 40" counter above). Width set per refresh.
    f.progressTrack = f:CreateTexture(nil, "OVERLAY")
    f.progressTrack:SetColorTexture(0, 0, 0, 0.35)
    f.progressTrack:SetHeight(2)
    f.progressTrack:SetPoint("BOTTOMLEFT", f.subBar, "TOPLEFT", 1, 0)
    f.progressTrack:SetPoint("BOTTOMRIGHT", f.subBar, "TOPRIGHT", -1, 0)
    f.progressFill = f:CreateTexture(nil, "OVERLAY")
    f.progressFill:SetColorTexture(DT.COMPLETE_GREEN[1], DT.COMPLETE_GREEN[2], DT.COMPLETE_GREEN[3], 0.95)
    f.progressFill:SetHeight(2)
    f.progressFill:SetPoint("BOTTOMLEFT", f.progressTrack, "BOTTOMLEFT", 0, 0)
    f.progressFill:Hide()

    f.summary = f:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    f.summary:SetPoint("LEFT", f.subBar, "LEFT", 10, 0)
    f.summary:SetJustifyH("LEFT")

    f.reset = f:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
    f.reset:SetPoint("RIGHT", f.subBar, "RIGHT", -10, 0)
    f.reset:SetJustifyH("RIGHT")

    -- Expand/collapse-all toggle (All tab only; shown/positioned in
    -- updateModeButtons). Flips every expansion section open or closed.
    f.collapseAllBtn = createThemedButton(f, "Collapse All", 84, 16)
    f.collapseAllBtn:SetPoint("RIGHT", f.subBar, "RIGHT", -8, 0)
    f.collapseAllBtn:SetScript("OnClick", function()
        setAllTopCollapsed(anyTopSectionExpanded())
        DT.UI:Refresh()
    end)
    f.collapseAllBtn:Hide()

    -- Always-visible search bar, docked just under the sub-bar and spanning the
    -- window width. Typing here filters the list by quest name across every tab.
    f.searchBox = createSearchBox(f, 348)
    f.searchBox:ClearAllPoints()
    f.searchBox:SetPoint("TOPLEFT", f.subBar, "BOTTOMLEFT", 10, -4)
    f.searchBox:SetPoint("TOPRIGHT", f.subBar, "BOTTOMRIGHT", -10, -4)

    -- Scroll list (its top is repositioned per mode in updateModeButtons). The
    -- custom scrollbar is anchored to the scroll frame's right edge, so it tracks
    -- those repositions automatically.
    local scroll, content, scrollbar = createScrollFrame(f, CONTENT_WIDTH)
    scroll:SetPoint("TOPLEFT", 12, -82)  -- leaves room for the search bar; updateModeButtons retunes per mode
    scroll:SetPoint("BOTTOMRIGHT", -18, 32)
    f.scroll, f.content, f.scrollbar = scroll, content, scrollbar

    -- Bottom tab bar (gradient + a top highlight hairline to lift it off the list).
    f.tabBar = makeStrip(f, "BORDER", THEME.tabBarBg, THEME.tabBarBg2)
    f.tabBar:SetPoint("BOTTOMLEFT", 1, 1)
    f.tabBar:SetPoint("BOTTOMRIGHT", -1, 1)
    f.tabBar:SetHeight(28)

    f.tabHi = makeStrip(f, "BORDER", THEME.bevelHi)
    f.tabHi:SetPoint("TOPLEFT", f.tabBar, "TOPLEFT", 0, 0)
    f.tabHi:SetPoint("TOPRIGHT", f.tabBar, "TOPRIGHT", 0, 0)
    f.tabHi:SetHeight(1)

    f.modeButtons = {}
    local modes = { { "ZONE", "Current Zone" }, { "ALL", "Expansion" }, { "FACTION", "Faction/Rep" }, { "SEARCH", "Search" } }
    local n = #modes
    for i, m in ipairs(modes) do
        local b = CreateFrame("Button", nil, f)
        b.mode = m[1]
        -- Even thirds across the tab bar.
        local tabW = 368 / n
        b:SetSize(tabW - 4, 26)
        b:SetPoint("TOPLEFT", f.tabBar, "TOPLEFT", 2 + (i - 1) * tabW, -1)

        b.bg = makeStrip(b, "BACKGROUND", THEME.tabActive, THEME.tabActive2)
        b.bg:SetAllPoints()
        b.bg:Hide()

        b.label = b:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        b.label:SetPoint("CENTER")
        b.label:SetText(m[2])

        b.hl = makeStrip(b, "HIGHLIGHT", { 1, 1, 1, 0.05 })
        b.hl:SetAllPoints()

        b:SetScript("OnClick", function() setMode(m[1]) end)
        f.modeButtons[#f.modeButtons+1] = b
    end

    -- Dark overlay panels of checkbox toggles, opened from the title bar. Both
    -- the Filters panel and the Settings (gear) panel share this builder; each
    -- anchors to the title bar's bottom-right and sizes itself to its rows.
    local function createTogglePanel(titleText)
        local p = CreateFrame("Frame", nil, f, "BackdropTemplate")
        p:SetWidth(180)  -- provisional; Finish() shrinks/grows this to fit the rows
        p:SetPoint("TOPRIGHT", f.titleBar, "BOTTOMRIGHT", -6, -6)
        p:SetFrameStrata("DIALOG")
        p:EnableMouse(true)  -- swallow clicks so they don't fall through to the list
        if p.SetBackdrop then
            p:SetBackdrop({
                bgFile = "Interface\\Buttons\\WHITE8X8",
                edgeFile = "Interface\\Buttons\\WHITE8X8", edgeSize = 1,
            })
            p:SetBackdropColor(0.10, 0.11, 0.14, 0.98)
            p:SetBackdropBorderColor(unpack(THEME.panelEdge))
        end

        local title = p:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        title:SetPoint("TOPLEFT", 12, -10)
        title:SetText(titleText)
        title:SetTextColor(0.95, 0.95, 0.92)

        p.checks = {}
        p.cy = -34
        p.maxLabelW = title:GetStringWidth() or 0  -- widest row drives the panel width
        function p:AddCheck(label, getFn, setFn)
            local cb = CreateFrame("CheckButton", nil, self, "UICheckButtonTemplate")
            cb:SetSize(22, 22)
            cb:SetPoint("TOPLEFT", 10, self.cy)
            local lbl = self:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            lbl:SetPoint("LEFT", cb, "RIGHT", 2, 0)
            lbl:SetJustifyH("LEFT")
            lbl:SetText(label)
            -- Track the natural (unwrapped) label width so Finish() can size the
            -- panel to its content instead of a fixed, mostly-empty width.
            self.maxLabelW = math.max(self.maxLabelW, lbl:GetStringWidth() or 0)
            cb.sync = function() cb:SetChecked(getFn() and true or false) end
            cb:SetScript("OnClick", function(s)
                setFn(s:GetChecked() and true or false)
                DT.UI:Refresh()
            end)
            self.checks[#self.checks + 1] = cb
            self.cy = self.cy - 26
        end
        -- Size to contents (both axes) and re-sync rows whenever shown. Width is
        -- the widest label plus the checkbox column and padding, clamped so the
        -- panel never gets uncomfortably narrow or runs off the frame.
        function p:Finish()
            -- 10 (left pad) + 22 (checkbox) + 2 (gap) + label + 12 (right pad)
            local w = 10 + 22 + 2 + self.maxLabelW + 12
            self:SetWidth(math.max(150, math.min(280, math.ceil(w))))
            self:SetHeight(-self.cy + 8)
            self:SetScript("OnShow", function(s)
                for _, cb in ipairs(s.checks) do cb.sync() end
            end)
            self:Hide()
        end
        return p
    end

    -- Filters panel: which KINDS of quests appear in the list. Opened by the
    -- "Filters" button in the title bar.
    local fp = createTogglePanel("Filters")
    fp:AddCheck("Holiday / Seasonal",
        function() return DT.DB:GetSetting("showSeasonal") end,
        function(v) DT.DB:SetSetting("showSeasonal", v) end)
    fp:AddCheck("Profession",
        function() return DT.DB:GetSetting("showProfessions") end,
        function(v) DT.DB:SetSetting("showProfessions", v) end)
    fp:AddCheck("Battle Pet",
        function() return DT.DB:GetSetting("showBattlePets") end,
        function(v) DT.DB:SetSetting("showBattlePets", v) end)
    fp:AddCheck("Skyriding",
        function() return DT.DB:GetSetting("showRaces") end,
        function(v) DT.DB:SetSetting("showRaces", v) end)
    -- Completion filter. Kept in the same "checked = visible" polarity as the kind
    -- toggles above; unchecking hides quests already done today to declutter the list
    -- (section done/total counts still include them -- only the rows are dropped).
    fp:AddCheck("Show completed",
        function() return DT.DB:GetSetting("showCompleted") end,
        function(v) DT.DB:SetSetting("showCompleted", v) end)
    -- (The "Map pins" toggle was removed with the map-pins feature; see the disabled
    -- Integrations\MapPins.lua in the .toc. Re-add it here when re-enabling pins.)
    fp:Finish()
    f.filters = fp

    -- The Help & Settings window is an independent, lazily-created frame (see
    -- ensureHelpWindow at file scope) so it can pop the changelog on login without
    -- forcing the tracker open. The gear button just toggles it.

    -- Everything that hides when the window collapses to its logo chip. The
    -- mode-conditional bits (dropdowns, collapse-all) are included so they hide on
    -- collapse; on expand a Refresh re-evaluates their per-tab visibility, so it's
    -- fine to blanket-Show them here first. The title bar, its bevels and the logo
    -- stay — they ARE the chip. The Filters/Settings overlays and the side panels
    -- are handled separately (snapshotted and restored) in SetCollapsed.
    f.collapsibles = {
        f.title, f.progress, f.close, f.settingsBtn, f.filtersBtn, f.pinnedBtn, f.routeBtn,
        f.subBar, f.summary, f.reset, f.searchBox, f.scroll, f.scrollbar,
        f.tabBar, f.tabHi, f.collapseAllBtn, f.progressTrack, f.progressFill,
    }
    for _, b in ipairs(f.modeButtons) do f.collapsibles[#f.collapsibles + 1] = b end

    return f
end

local function ensureFrame()
    if not mainFrame then
        mainFrame = createMainFrame()
        DT.UI:ResetPosition()
    end
    return mainFrame
end

-- ---------------------------------------------------------------------------
-- Rendering
-- ---------------------------------------------------------------------------
-- Paint a quest row's title: Route distance tag + tracked star + name, plus colour.
-- The tag is amber ("142 yd") while en route; once within the arrival threshold it
-- flips to a green • + distance and a green title -- matching the Tracked panel and
-- TomTom's arrival cue. routeDist/routeArrived are nil for rows with no comparable
-- distance (giver not in the player's current map instance). Shared by the full
-- render and the live tag updater (DT.UI:UpdateRouteTags) so both paint identically.
local function applyQuestRouteTitle(row, e, routeDist, routeArrived)
    local pin = e.pinned and "|cffffd100*|r " or ""
    local step = ""
    if routeDist then
        step = routeArrived
            and ("|cff" .. COMPLETE_GREEN_HEX .. "\226\128\162 " .. routeDist .. "|r  ")
            or  ("|cff" .. toHex(ZONE_ACCENT) .. routeDist .. "|r  ")
    end
    row.title:SetText(step .. pin .. (e.title or ("Quest " .. (e.questID or "?"))))
    if routeArrived then
        row.title:SetTextColor(COMPLETE_GREEN[1], COMPLETE_GREEN[2], COMPLETE_GREEN[3])
    else
        local done = (e.status == DT.STATUS.COMPLETED)
        row.title:SetTextColor(done and 0.55 or 0.92, done and 0.55 or 0.92, done and 0.52 or 0.88)
    end
end

local function renderDisplay(display)
    releaseAllRows()
    local content = mainFrame.content
    local y = 0
    local overallDone, overallTotal = 0, 0

    for _, item in ipairs(display) do
        local row = acquireRow(content)
        row:SetPoint("TOPLEFT", 0, -y)

        if item.type == "section" then
            local level = item.level or 1
            local sub = level >= 2          -- level 2 (zone) or 3 (sub-zone): inset + lighter
            local indent = (level - 1) * SUBSECTION_INDENT  -- each level steps in further
            local h = (level == 1) and SECTION_HEIGHT or SUBSECTION_HEIGHT
            row:SetSize(CONTENT_WIDTH, h)
            row.entry = nil
            row.sectionKey = item.key
            row.dot:Hide()
            row.badge:Hide(); row.badgeBg:Hide()
            row:EnableMouse(true)

            -- Only the TOP-LEVEL folder (level 1: the expansion in the All view, the
            -- zone in Browse / Current Zone) carries a full-colour bar. Every nested
            -- folder -- zones under an expansion, plus the kind/sub-zone groups under
            -- those -- drops to a neutral slate fill, keeping just a thin coloured
            -- accent on the spine/icon/text. `c` colours those lit elements: a themed
            -- group's own kind colour (item.accent), else a hint of the parent's
            -- logo/zone tint (item.color). `bg` fills the header behind them.
            local c = item.accent or item.color or THEME.progress
            local bg = sub and NEUTRAL_SECTION_BG or c
            -- Lit accent bar + chip (brighter top, darker bottom) and a tint
            -- gradient behind the header that fades to almost nothing at the base.
            -- Nested headers are inset from the left and use the faint neutral fill.
            local lt1, lt2, lt3 = lighten(c, 0.15)
            local bgTop = sub and 0.10 or 0.18
            row.accent:ClearAllPoints()
            row.accent:SetPoint("TOPLEFT", indent, 0)
            row.accent:SetPoint("BOTTOMLEFT", indent, 0)
            setVGradient(row.accent, { lt1, lt2, lt3, 1 }, { c[1] * 0.78, c[2] * 0.78, c[3] * 0.78, 1 })
            row.accent:Show()
            row.headerBg:ClearAllPoints()
            row.headerBg:SetPoint("TOPLEFT", 1 + indent, 0)
            row.headerBg:SetPoint("BOTTOMRIGHT", 0, 0)
            setVGradient(row.headerBg, { bg[1], bg[2], bg[3], bgTop }, { bg[1], bg[2], bg[3], 0.03 })
            row.headerBg:Show()
            row.headerTop:ClearAllPoints()
            row.headerTop:SetPoint("TOPLEFT", 1 + indent, 0)
            row.headerTop:SetPoint("TOPRIGHT", 0, 0)
            row.headerBot:ClearAllPoints()
            row.headerBot:SetPoint("BOTTOMLEFT", 1 + indent, 0)
            row.headerBot:SetPoint("BOTTOMRIGHT", 0, 0)
            row.icon:ClearAllPoints()
            row.icon:SetPoint("LEFT", 10 + indent, 0)
            row.icon:SetSize(sub and 7 or 9, sub and 7 or 9)
            setVGradient(row.icon, { lt1, lt2, lt3, 1 }, { c[1], c[2], c[3], 1 })
            row.icon:Show()
            row.headerTop:Show()
            row.headerBot:Show()

            row.title:SetFontObject(sub and "GameFontNormalSmall" or "GameFontNormal")
            row.title:SetWordWrap(false)  -- single line (pooled rows may arrive wrapped)
            row.title:ClearAllPoints()
            row.title:SetPoint("LEFT", row.icon, "RIGHT", sub and 7 or 8, 0)
            row.title:SetWidth(CONTENT_WIDTH - 110 - indent)
            row.title:SetTextColor(lighten(c, sub and 0.22 or 0.28))
            row.title:SetText(item.text)

            row.status:ClearAllPoints()
            row.status:SetPoint("RIGHT", row.collapse, "LEFT", -6, 0)
            row.status:SetText(string.format("|cff909090%d / %d|r", item.done or 0, item.total or 0))

            row.collapse:Show()
            row.collapse:SetText(item.collapsed and "|cff909090+|r" or "|cff909090\226\128\147|r") -- + / en-dash

            -- Only top-level sections roll into the title-bar counter; nested
            -- sub-groups would otherwise double-count their parent expansion.
            if not sub then
                overallDone = overallDone + (item.done or 0)
                overallTotal = overallTotal + (item.total or 0)
            end
            y = y + h

        elseif item.type == "message" then
            row.entry = nil
            row.sectionKey = nil
            row.dot:Hide(); row.accent:Hide(); row.headerBg:Hide()
            row.icon:Hide(); row.collapse:Hide()
            row.badge:Hide(); row.badgeBg:Hide()
            row.headerTop:Hide(); row.headerBot:Hide()
            row:EnableMouse(false)
            row.title:SetFontObject("GameFontDisable")
            row.title:SetWordWrap(true)  -- empty-state copy may run to two+ lines
            row.title:ClearAllPoints()
            row.title:SetPoint("LEFT", 14, 0)
            row.title:SetWidth(CONTENT_WIDTH - 18)
            row.title:SetTextColor(0.6, 0.6, 0.6)
            row.title:SetText(item.text)
            row.status:SetText("")
            -- Size to the (wrapped) copy so longer, explanatory empty states aren't clipped.
            local mh = math.max(ROW_HEIGHT * 2, (row.title:GetStringHeight() or 0) + 22)
            row:SetSize(CONTENT_WIDTH, mh)
            y = y + mh

        elseif item.type == "repbar" then
            -- Live reputation bar atop a faction section: track + progress fill +
            -- centered "Standing — cur / max" (or "Not yet discovered").
            local indent = (item.depth or 1) * SUBSECTION_INDENT
            local left, rightPad = 12 + indent, 10
            row:SetSize(CONTENT_WIDTH, REPBAR_HEIGHT)
            row.entry = nil
            row.sectionKey = nil
            row:EnableMouse(false)
            row.dot:Hide(); row.accent:Hide(); row.headerBg:Hide(); row.icon:Hide()
            row.collapse:Hide(); row.headerTop:Hide(); row.headerBot:Hide()
            row.badge:Hide(); row.badgeBg:Hide()
            row.title:SetText(""); row.status:SetText("")

            local info = factionRepInfo(item.faction)

            row.repTrack:Show()
            row.repTrack:ClearAllPoints()
            row.repTrack:SetPoint("TOPLEFT", left, -4)
            row.repTrack:SetPoint("BOTTOMRIGHT", -rightPad, 4)
            row.repTrack:SetColorTexture(0.09, 0.10, 0.13, 0.95)

            local trackW = CONTENT_WIDTH - left - rightPad
            local pct = math.max(0, math.min(1, info.pct or 0))
            row.repFill:ClearAllPoints()
            row.repFill:SetPoint("TOPLEFT", row.repTrack, "TOPLEFT", 0, 0)
            row.repFill:SetPoint("BOTTOMLEFT", row.repTrack, "BOTTOMLEFT", 0, 0)
            if info.discovered and pct > 0 then
                local col = info.color or REP_BAR_FALLBACK
                row.repFill:SetWidth(math.max(1, trackW * pct))
                row.repFill:SetColorTexture(col[1], col[2], col[3], 0.85)
                row.repFill:Show()
            else
                row.repFill:Hide()
            end

            row.repText:Show()
            row.repText:ClearAllPoints()
            row.repText:SetPoint("CENTER", row.repTrack, "CENTER", 0, 0)
            if info.discovered then
                local txt = info.level or "?"
                if info.maxed then
                    txt = txt .. "  \226\128\148  Max"
                elseif (info.max or 0) > 0 then
                    txt = string.format("%s  \226\128\148  %s / %s",
                        txt, commaNum(info.cur), commaNum(info.max))
                end
                row.repText:SetText(txt)
                row.repText:SetTextColor(0.97, 0.97, 0.93)
            else
                row.repText:SetText("Not yet discovered")
                row.repText:SetTextColor(0.55, 0.55, 0.58)
            end
            y = y + REPBAR_HEIGHT

        else
            local e = item.entry
            row:SetSize(CONTENT_WIDTH, ROW_HEIGHT)
            row.entry = e
            row.sectionKey = nil
            row:EnableMouse(true)
            row.accent:Hide(); row.headerBg:Hide(); row.icon:Hide(); row.collapse:Hide()
            row.headerTop:Hide(); row.headerBot:Hide()
            row.dot:Show()

            -- Inset each quest one step past its parent section's header so it
            -- nests under that header instead of lining up with a shallower one.
            -- `depth` is the parent section's level (1 in Browse/Current Zone, 2+
            -- under a zone in the All view). Re-anchored every render because rows
            -- are pooled (a reused row may carry a different indent).
            local qIndent = (item.depth or 1) * SUBSECTION_INDENT
            row.dot:ClearAllPoints()
            row.dot:SetPoint("LEFT", 12 + qIndent, 0)

            local c = DT.COLORS[e.status] or DT.COLORS[DT.STATUS.UNKNOWN]
            DT.UI:StyleStatusCheckbox(row.dot, c, e.status == DT.STATUS.COMPLETED)

            -- Inline kind tag between the dot and the title (Prof / Pet / PvP /
            -- Incursion). The title anchors to the badge when one is present, so
            -- it never overlaps; its width is trimmed so long titles still ellipsize.
            local tagText, tagColor
            local kind = themedSubgroup(e)
            if kind then
                tagText, tagColor = SUB_BADGE[kind], SUBGROUP_ACCENT[kind]
                -- Profession dailies show the specific profession (e.g.
                -- "Jewelcrafting") rather than the generic "Prof" chip.
                if kind == SUB_PROFESSIONS then
                    tagText = professionLabel(e) or tagText
                end
            end
            -- Weekly takes priority over the kind tag: the daily/weekly split is the
            -- more salient distinction in a daily tracker, and weeklies are rare.
            if e.freq == "weekly" then
                tagText, tagColor = "Weekly", WEEKLY_ACCENT
            end
            local titleAnchor, titleGap, titleWidth = row.dot, 7, CONTENT_WIDTH - 120 - qIndent
            if tagText then
                row.badge:Show()
                row.badge:SetText(tagText)
                row.badge:SetTextColor(lighten(tagColor, 0.35))
                row.badge:ClearAllPoints()
                row.badge:SetPoint("LEFT", row.dot, "RIGHT", 8, 0)
                row.badgeBg:Show()
                row.badgeBg:ClearAllPoints()
                row.badgeBg:SetPoint("TOPLEFT", row.badge, "TOPLEFT", -4, 2)
                row.badgeBg:SetPoint("BOTTOMRIGHT", row.badge, "BOTTOMRIGHT", 4, -2)
                row.badgeBg:SetColorTexture(tagColor[1], tagColor[2], tagColor[3], 0.16)
                titleAnchor, titleGap = row.badge, 9
                titleWidth = titleWidth - (row.badge:GetStringWidth() + 18)
            else
                row.badge:Hide(); row.badgeBg:Hide()
            end

            local done = (e.status == DT.STATUS.COMPLETED)
            row.title:SetFontObject("GameFontHighlight")
            row.title:SetWordWrap(false)  -- single line (pooled rows may arrive wrapped)
            row.title:ClearAllPoints()
            row.title:SetPoint("LEFT", titleAnchor, "RIGHT", titleGap, 0)
            row.title:SetWidth(titleWidth)
            applyQuestRouteTitle(row, e, item.routeDist, item.routeArrived)

            -- Every quest row is the same height: the title is single-line (word wrap
            -- off), so a long name truncates with an ellipsis rather than wrapping and
            -- pushing the row taller. The full name lives in the hover tooltip.
            row:SetHeight(ROW_HEIGHT)

            local hex = toHex(c)
            -- For an accepted quest, show its live objective progress ("12/20") in
            -- place of the redundant "In Progress" label -- the steel-blue dot already
            -- signals the status, and the fraction is the useful bit. Falls back to the
            -- label when there's no countable progress (e.g. a single yes/no objective).
            local statusLabel = DT.STATUS_LABEL[e.status] or ""
            if e.status == DT.STATUS.IN_PROGRESS and e.questID then
                local prog = DT.QuestLog:GetObjectiveProgress(e.questID)
                if prog then statusLabel = prog end
            end
            row.status:ClearAllPoints()
            row.status:SetPoint("RIGHT", -8, 0)
            row.status:SetText("|cff" .. hex .. statusLabel .. "|r")
            -- The checkbox stays full-strength when done (the green check IS the "done"
            -- signal); the grayed title already recedes the finished row.
            row.dot:SetAlpha(1)

            -- Keep the open-detail quest highlighted as the list rebuilds.
            local sel = entryIsSelected(e)
            row.selected:SetShown(sel)
            row.selectedEdge:SetShown(sel)
            y = y + ROW_HEIGHT
        end
        activeRows[#activeRows+1] = row
    end

    content:SetHeight(math.max(y, 10))

    -- Title-bar progress counter reflects the view that's on screen.
    if overallTotal > 0 then
        mainFrame.progress:SetText(string.format("%d / %d", overallDone, overallTotal))
        local pct = overallDone / overallTotal
        local pc = THEME.progress
        mainFrame.progress:SetTextColor(pc[1], pct >= 1 and 0.9 or pc[2], pc[3])
        -- Size the seam bar to match. Two-anchor track, so GetWidth is the live pixel
        -- span; fall back to the frame width if it hasn't laid out yet.
        local w = mainFrame.progressTrack:GetWidth()
        if not w or w <= 0 then w = mainFrame:GetWidth() - 2 end
        mainFrame.progressFill:SetWidth(math.max(0.01, w * pct))
        mainFrame.progressFill:SetShown(pct > 0)
    else
        mainFrame.progress:SetText("")
        mainFrame.progressFill:Hide()
    end
end

-- Repaint only the selection highlight on the rows already on screen — cheap
-- enough to call on every selection change without a full rebuild/reorder.
function DT.UI:UpdateSelectionHighlight()
    for _, row in ipairs(activeRows) do
        if row.entry then
            local sel = entryIsSelected(row.entry)
            row.selected:SetShown(sel)
            row.selectedEdge:SetShown(sel)
        end
    end
end

-- Live-update the Route distance tags on the rows already on screen, WITHOUT
-- rebuilding the list. Used by the route ticker on the grouped tabs (Expansion /
-- Faction), where a full Refresh would re-run the whole-catalog grouping every tick
-- and churn a lot of garbage (that showed up as a memory climb). Recomputes each
-- visible giver's distance once and repaints just the title text/colour in place;
-- since it doesn't touch the row pool, it also can't disturb a hovered row's tooltip.
-- Tag-only by design: it never reorders, matching "keep grouping" on these tabs.
function DT.UI:UpdateRouteTags()
    if not (DT.Route and DT.DB:GetSetting("todaysRoute")) then return end
    local entries = {}
    for _, row in ipairs(activeRows) do
        if row.entry then entries[#entries + 1] = row.entry end
    end
    if #entries == 0 then return end
    local lookup = DT.Route:DistanceLookup(entries)
    for _, row in ipairs(activeRows) do
        local e = row.entry
        if e then
            local d = lookup[e]
            applyQuestRouteTitle(row, e,
                d and DT.Route:FormatDistance(d) or nil,
                d and DT.Route:IsArrived(d) or nil)
        end
    end
end

-- Set (or clear, with nil) the quest highlighted in the list. Driven by the
-- DetailPanel so opening/closing the detail pane keeps the list in step.
function DT.UI:SetSelectedQuest(entry)
    if entry then
        DT.UI.selectedQuestID = entry.questID
        DT.UI.selectedTitle = entry.title
    else
        DT.UI.selectedQuestID = nil
        DT.UI.selectedTitle = nil
    end
    DT.UI:UpdateSelectionHighlight()
end

-- Tag each quest row in `display` with its live distance to the giver + an "arrived"
-- flag, for Today's Route mode. TAG-ONLY: it never reorders, so the Expansion/Faction
-- grouping stays intact -- only rows whose giver is in the player's current map
-- instance get a tag (others have no comparable distance). The row renderer turns the
-- tag amber (en route) or green with a • (arrived).
local function tagRouteDistances(display)
    if not (DT.Route and DT.DB:GetSetting("todaysRoute")) then return end
    local entries = {}
    for _, item in ipairs(display) do
        if item.type == "quest" and item.entry then
            entries[#entries + 1] = item.entry
        end
    end
    if #entries == 0 then return end
    local lookup = DT.Route:DistanceLookup(entries)
    for _, item in ipairs(display) do
        if item.type == "quest" and item.entry then
            local d = lookup[item.entry]
            if d then
                item.routeDist = DT.Route:FormatDistance(d)
                item.routeArrived = DT.Route:IsArrived(d)
            end
        end
    end
end

-- Drop already-completed quest ROWS from a built display when "Show completed" is off.
-- Returns a filtered copy (sections/repbars/messages kept as-is). Deliberately works
-- on the display, not the source entries, so section headers and the title-bar counter
-- -- computed at build time -- still reflect the true done/total; only the finished
-- rows disappear from view. The Tracked panel is exempt (pins ignore filters).
local function stripCompleted(display)
    if DT.DB:GetSetting("showCompleted") then return display end
    local out = {}
    for _, item in ipairs(display) do
        if not (item.type == "quest" and item.entry
                and item.entry.status == DT.STATUS.COMPLETED) then
            out[#out + 1] = item
        end
    end
    return out
end

function DT.UI:Refresh()
    if not mainFrame or not mainFrame:IsShown() then return end
    -- While collapsed to the logo chip, the body chrome is hidden. Bail out so a
    -- quest event firing Refresh doesn't re-show mode-conditional elements (the
    -- Collapse All button, dropdowns, etc.) floating over the chip. Expanding goes
    -- through SetCollapsed, which clears `collapsed` before calling Refresh itself.
    if collapsed then return end

    local display, summary
    if DT.UI.searchQuery ~= "" then
        -- A search overrides the active tab's content (the tab highlight stays, so
        -- clearing the box returns to that view). The Search tab runs the full
        -- multi-dimension search (name + currency + faction + zone, grouped); the
        -- Faction tab matches faction names too; every other tab is a flat name list.
        if DT.UI.mode == "SEARCH" then
            display, summary = buildUnifiedSearchMode()
        elseif DT.UI.mode == "FACTION" then
            display, summary = buildFactionSearchMode()
        else
            display, summary = buildSearchMode()
        end
    elseif DT.UI.mode == "SEARCH" then
        display, summary = buildSearchHomeMode()
    elseif DT.UI.mode == "ALL" then
        display, summary = buildAllMode()
    elseif DT.UI.mode == "FACTION" then
        display, summary = buildFactionMode()
    else
        display, summary = buildZoneMode()
    end

    -- Route mode: tag routable rows with a live distance/arrival marker across every
    -- tab (Current Zone, Expansion, Faction). Skipped on the Search tab, which is a
    -- lookup surface, not a travel view.
    if DT.UI.mode ~= "SEARCH" then
        tagRouteDistances(display)
    end
    -- Hide finished rows if "Show completed" is off (section counts stay intact).
    display = stripCompleted(display)

    mainFrame.summary:SetText(summary or "")
    local reset = DT.QuestLog:FormatCountdown(DT.QuestLog:GetSecondsUntilReset())
    mainFrame.reset:SetText("resets |cffffd100" .. reset .. "|r")

    -- Record the on-screen top-level sections so the expand/collapse-all toggle
    -- (and its label state) operate on exactly what's displayed.
    setCurrentTopKeys(display)
    updateModeButtons()
    renderDisplay(display)

    -- Keep the pinned companion panel in step (status/zone can change on refresh).
    if DT.Pinned then DT.Pinned:Refresh() end
end

-- ---------------------------------------------------------------------------
-- Collapse / expand (title bar -> logo-only chip)
-- ---------------------------------------------------------------------------
-- Apply only the GEOMETRY half of the toggle: shrink to / grow from the logo
-- chip and hide/show the body. Panel snapshot+restore lives in SetCollapsed so
-- this can also be reused to silently un-collapse on close.
local function applyCollapsedGeometry(f, on)
    -- Pivot collapse/expand around the TOP-LEFT corner: capture the current
    -- top-left (anchor-independent, in UIParent units) before resizing, then
    -- re-anchor the frame there afterward. So expanding grows DOWN and to the
    -- RIGHT of the chip, and collapsing shrinks back up-left into that corner --
    -- instead of the symmetric center-pivot a plain SetSize would give.
    local xOff = f:GetLeft() - UIParent:GetLeft()
    local yOff = f:GetTop() - UIParent:GetTop()
    if on then
        f._expW, f._expH = f:GetSize()
        for _, el in ipairs(f.collapsibles) do el:Hide() end
        f.portrait:ClearAllPoints()
        f.portrait:SetPoint("CENTER", f.titleBar, "CENTER", 0, 0)
        f:SetSize(30, 30)
    else
        f:SetSize(f._expW or 372, f._expH or 470)
        f.portrait:ClearAllPoints()
        f.portrait:SetPoint("LEFT", f.titleBar, "LEFT", 9, 0)
        for _, el in ipairs(f.collapsibles) do el:Show() end
    end
    -- Re-anchor by TOP-LEFT to the captured corner (SetPoint relativePoint matches
    -- the frame point so saveFramePosition/ResetPosition stay self-consistent).
    f:ClearAllPoints()
    f:SetPoint("TOPLEFT", UIParent, "TOPLEFT", xOff, yOff)
end

function DT.UI:IsCollapsed() return collapsed end

function DT.UI:SetCollapsed(want)
    local f = mainFrame
    if not f then return end
    want = not not want
    if want == collapsed then return end

    if want then
        -- Snapshot which overlays/panels are open so expand can restore exactly
        -- those (the Detail panel also needs the quest it was showing).
        DT.UI._restore = {
            pinned   = DT.Pinned  and DT.Pinned:IsShown()  or false,
            details  = DT.Details and DT.Details:IsShown() or false,
            entry    = DT.Details and DT.Details.GetEntry and DT.Details:GetEntry() or nil,
            filters  = f.filters    and f.filters:IsShown()    or false,
            help     = helpWindow and helpWindow:IsShown() or false,
        }
        if f.filters then f.filters:Hide() end
        if helpWindow then helpWindow:Hide() end
        if DT.Pinned then DT.Pinned:Hide() end
        if DT.Details then DT.Details:Hide() end
        if DT.UI.HideDropMenu then DT.UI.HideDropMenu() end
        applyCollapsedGeometry(f, true)
        collapsed = true
    else
        applyCollapsedGeometry(f, false)
        collapsed = false
        DT.UI:Refresh()  -- rebuilds the list + re-evaluates mode-conditional chrome
        if f.scrollbar and f.scrollbar.Update then f.scrollbar:Update() end
        local r = DT.UI._restore or {}
        if r.pinned and DT.Pinned then DT.Pinned:Show() end
        if r.details and r.entry and DT.Details then DT.Details:Show(r.entry) end
        if r.filters and f.filters then f.filters:Show() end
        if r.help and helpWindow then helpWindow:Show() end
        DT.UI._restore = nil
    end
end

function DT.UI:ToggleCollapsed() self:SetCollapsed(not collapsed) end

-- ---------------------------------------------------------------------------
-- Show / hide / position
-- ---------------------------------------------------------------------------
function DT.UI:Show()
    ensureFrame()
    mainFrame:Show()
    self:Refresh()
    -- First-ever open: a one-line pointer to the controls + the Guide, so new users
    -- discover the hover actions instead of finding them by accident. Shown once.
    if DT.DB and not DT.DB:GetSetting("firstRunHintSeen") then
        DT.DB:SetSetting("firstRunHintSeen", true)
        print("|cff33ff99QuestTally|r: hover any quest to see its controls "
            .. "(|cffffd100left-click|r = details, |cffffd100middle-click|r = track). "
            .. "Full guide under the |cffffd100gear|r button.")
    end
end

-- Open the Help & Settings window straight to the Changelog page. Independent of
-- the tracker window (used to pop "what's new" on the first login after an update).
function DT.UI:ShowChangelog()
    local w = ensureHelpWindow()
    -- Show first, THEN set the page: showing fires OnShow (which would otherwise
    -- restore the last page), so setting it afterward guarantees the Changelog tab.
    w:Show()
    w:SetPage("changelog")
end

function DT.UI:Hide()
    if mainFrame then
        -- Closing always returns to the expanded layout (collapse is session-only
        -- and a purely visual toggle); reset geometry silently, no panel restore.
        if collapsed then
            applyCollapsedGeometry(mainFrame, false)
            collapsed = false
        end
        DT.UI._restore = nil
        if helpWindow then helpWindow:Hide() end
        if mainFrame.filters then mainFrame.filters:Hide() end
        mainFrame:Hide()
    end
    -- The side panes are children of the main frame (so they hide with it), but
    -- clear their state too so a fresh open doesn't reuse a stale selection.
    if DT.Details then DT.Details:Hide() end
    if DT.Pinned then DT.Pinned:Hide() end
end

function DT.UI:Toggle()
    ensureFrame()
    if mainFrame:IsShown() then self:Hide() else self:Show() end
end

function DT.UI:ResetPosition()
    if not mainFrame then return end
    mainFrame:ClearAllPoints()
    local pos = DT.DB.account.framePosition
    if pos and pos.point then
        mainFrame:SetPoint(pos.point, UIParent, pos.point, pos.x, pos.y)
    else
        mainFrame:SetPoint("CENTER")
    end
end

-- Expose the panel skin (palette + texture helpers) so sibling UI modules -- the
-- detail panel in particular -- can match the main window's look without
-- duplicating the theme. Loaded before DetailPanel via the .toc order.
DT.UI.Skin = {
    THEME            = THEME,
    makeStrip        = makeStrip,
    setVGradient     = setVGradient,
    lighten          = lighten,
    CreateCloseButton = createCloseButton,
    CreateScrollFrame = createScrollFrame,
}
