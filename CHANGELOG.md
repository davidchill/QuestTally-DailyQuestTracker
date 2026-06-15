# Changelog

All notable changes to QuestTally are documented here.

## [0.1.1] - 2026-06-14

Quest-giver locations and a baked-in giver/coordinate database, so dailies are
ready out of the box without exploring.

### Added
- **Baked quest-giver database** (`Core/QuestDetails.lua`) — **609 daily quests
  (TBC–MoP)** ship with their giver name, map, and coordinates, so a fresh
  install can show live status and set travel waypoints with zero discovery.
  Data is derived from the [Questie](https://github.com/Questie/Questie) project
  (MIT-licensed); generated offline and verified against retail UI maps.
- **Quest-giver tracking** — the giver's name and coordinates are also captured
  **live** the moment you talk to a quest giver (`GOSSIP_SHOW` / `QUEST_DETAIL`),
  and live data overrides the baked defaults.
- **Travel waypoints** — right-click a daily you haven't picked up to drop a map
  waypoint on its giver (`C_Map.SetUserWaypoint`), so you can fly straight there.
- **Giver in the tooltip** — hovering a quest now shows `Giver: <name> (x, y)`.

### Changed
- **Renamed the addon to QuestTally — Daily Quest Tracker** (folder, `.toc`,
  SavedVariables, and slash commands). Primary command is now **`/qt`**
  (aliases `/questtally`, `/dailies`).
- Checklist entries now resolve a **real quest ID from the baked data** even
  before discovery, so **live status, Wowhead links, and zone placement work
  out of the box** for the covered dailies (previously only after discovery).
- Browse / Current Zone use the baked giver's actual zone for covered dailies.

### Notes
- ~92 dailies are intentionally not baked (holiday/event quests, heroic-dungeon
  dailies, and heavily-phased war-campaign quests) — these have no fixed giver
  and still fill in via live capture if encountered.
- Credit: quest/NPC/coordinate data adapted from Questie.

## [0.1.0] - 2026-06-14

Initial release of **QuestTally** — a daily-quest tracker and assistant for
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
