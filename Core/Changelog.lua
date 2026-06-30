-- Changelog.lua
-- In-game changelog data, shown in the Help & Settings window's Changelog tab and
-- popped automatically the first time you log in after the version changes.
--
-- MAINTENANCE: when bundling a release, add a new entry at the TOP here (newest
-- first) to match the headline points in CHANGELOG.md. Keep notes short -- this is
-- a "what's new" summary, not the full markdown changelog.
local addonName, DT = ...

DT.CHANGELOG = {
    { version = "0.8.0", date = "2026-06-30", notes = {
        "New unified Search tab — search by quest name, currency, faction, or zone.",
        "Today's Route now tags each quest with its live distance (yards), nearest first.",
        "Minimap button + data-broker feed (done/total, with a streak tooltip).",
        "Help & Settings window with Guide / About / Changelog tabs.",
        "Daily streak tracking (current + best); live-ticking reset countdown.",
        "\"Pinned\" is now \"Tracked\"; new click scheme (see the Guide tab).",
        "Now bundles standard libraries (HereBeDragons, LibDataBroker, ...).",
    } },
    { version = "0.7.3", date = "2026-06-28", notes = {
        "Themed sub-sections within each zone (Professions, PvP, Skyracing, ...).",
        "Expansion tab now sorts zones by where they are in the world.",
        "Currency rewards show their icons; quest givers can vary by faction.",
    } },
    { version = "0.7.2", date = "2026-06-28", notes = {
        "Performance, polish & forward-compatibility; lighter on a full quest log.",
    } },
    { version = "0.7.1", date = "2026-06-27", notes = {
        "Fixed the displayed location for a batch of daily-quest givers.",
    } },
    { version = "0.7.0", date = "2026-06-27", notes = {
        "Consolidated baked rewards: items, currency, money, XP, honor & reputation.",
        "Updated for the current Retail client; detail-panel polish.",
    } },
    { version = "0.6.0", date = "2026-06-26", notes = {
        "Profession dailies name their specific profession; quality-of-life polish.",
    } },
    { version = "0.5.2", date = "2026-06-25", notes = {
        "Name search bar with type-ahead; pruned non-retail / mis-tagged quests.",
    } },
    { version = "0.5.1", date = "2026-06-20", notes = {
        "Reputation & honor rewards in the detail panel, with live renown.",
    } },
    { version = "0.5.0", date = "2026-06-20", notes = {
        "Full multi-source catalog verification; one-time story quests removed.",
    } },
    { version = "0.4.6", date = "2026-06-19", notes = {
        "Detail-panel objectives now load reliably on first open.",
    } },
    { version = "0.4.5", date = "2026-06-19", notes = {
        "Third nesting level for sub-zones (e.g. Molten Front within Mount Hyjal).",
    } },
    { version = "0.4.4", date = "2026-06-19", notes = {
        "Corrected World / Continent sorting in the Browse tab.",
    } },
    { version = "0.4.3", date = "2026-06-18", notes = {
        "TomTom integration and colored location breadcrumbs.",
    } },
    { version = "0.4.2", date = "2026-06-18", notes = {
        "Dedicated Filters menu, themed controls, expand/collapse-all.",
    } },
    { version = "0.4.1", date = "2026-06-18", notes = {
        "Pinned companion panel and the QuestTally logo in the title bar.",
    } },
    { version = "0.4.0", date = "2026-06-17", notes = {
        "Added the Blizzard Game Data API as a source for descriptions & zones.",
    } },
    { version = "0.3.0", date = "2026-06-17", notes = {
        "Visual overhaul: a darker, less-flat theme with custom widgets.",
    } },
    { version = "0.2.1", date = "2026-06-17", notes = {
        "Ground-up rebuild of how the addon looks and sources its data.",
    } },
    { version = "0.2.0", date = "2026-06-16", notes = {
        "First-party quest-data harvesting toolchain.",
    } },
    { version = "0.1.1", date = "2026-06-14", notes = {
        "Baked giver/coordinate database; renamed DailyGrind to QuestTally.",
    } },
    { version = "0.1.0", date = "2026-06-14", notes = {
        "Initial release — a daily-quest tracker and assistant for Retail.",
    } },
}
