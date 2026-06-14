# Changelog

All notable changes to Daily Grind are documented here.

## [0.1.0] - 2026-06-14

Initial release of **Daily Grind** — a daily-quest tracker and assistant for
World of Warcraft Retail, organized by expansion and zone.

### Added

**Core framework**
- Modular `Core/` + `UI/` + `Integrations/` layout under the `DailyGrind`
  addon folder, using a private namespace (no global pollution).
- `Core/Constants.lua` — version, the full expansion list (Classic → The War
  Within + "Uncategorized"), status enum, and per-status colors/labels.
- `Core/Database.lua` — account-wide and per-character SavedVariables with
  recursive default-filling (new settings never wipe existing data), pin storage,
  and the account-wide learned-quest store.
- `.toc` manifest set to Retail interface **120005** (patch 12.0.5);
  `## OptionalDeps: Titan`.

**Master checklist (712 dailies)**
- `Core/ChecklistData.lua` — a curated list of 712 daily quest titles sourced
  from warcraft.wiki.gg, grouped by expansion (TBC–MoP) and type
  (Profession / Faction / PvP / Dungeon / Event / Other), stored as a compact,
  easily-extended pipe-delimited block with a small parser.
- `Core/Checklist.lua` — the matching engine that links each title to its real
  quest ID (learned from play), with title normalization, live status, and
  discovery/stats helpers.

**Live tracking & discovery**
- `Core/QuestLog.lua` — scans the quest log for daily-frequency quests, resolves
  live status (Available / In Progress / Ready to Turn In / Done Today), computes
  the daily-reset countdown, and **auto-learns** each daily's real quest ID,
  title, faction, and zone.
- **Interaction discovery** — opening a quest giver's dialog (`GOSSIP_SHOW`) or
  the quest detail page (`QUEST_DETAIL`) learns its dailies *without* requiring
  the player to accept them.

**Zones & location**
- `Core/Zones.lua` — resolves a quest's map to its zone and continent and finds
  the player's current zone.
- `Core/ZoneMap.lua` — pre-maps every checklist entry to a continent/zone by
  category, so the full list is browsable by location immediately; live-learned
  zones override the defaults as quests are discovered (hybrid).

**User interface** (`UI/MainFrame.lua`)
- Movable, position-saving window with a WoW-native skin: gold header banner,
  portrait icon, dark panel background, and section-header bars.
- Three modes: **Current Zone** (default), **Browse** by Continent → Zone
  (dropdown search), and **All** (full checklist grouped by expansion).
- Color-coded status, pinned-first sorting, tooltips, summary line with the
  reset timer.
- Row actions: left-click to pin, right-click to set a waypoint
  (super-track), and **Shift-click to copy the Wowhead quest link**.

**Integrations**
- `Integrations/TitanPanel.lua` — optional TitanPanel plugin showing a live
  "Dailies: done/total" summary with a per-status tooltip; no-ops cleanly when
  Titan isn't installed.

**Commands**
- `/grind`, `/ddt`, and `/dailies` (aliases) — toggle/show/hide/reset/stats/help.

### Notes
- Zone-based views show a quest's exact location once it's been **discovered**;
  until then they use the pre-mapped default. Capital-city profession dailies and
  multi-zone reputations use a stand-in location that live data refines over time.
- The reset countdown updates on quest events, not every second.
