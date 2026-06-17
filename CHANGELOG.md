# Changelog

All notable changes to QuestTally are documented here.

## [0.2.0] - 2026-06-16

First-party quest-data harvesting: a developer toolchain that builds the
catalog, rewards, and quest details straight from the live game client (no
third-party datasets), the detail panel that displays them, TitanPanel bar
improvements, and a fix for a detail-panel rendering bug.

### Added
- **In-game harvester** (`Core/Harvester.lua`) — generates quest data
  first-party from your own client:
  - **Full Scan / Discover** — scans the quest-ID space, recognizing dailies by
    matching titles to the checklist and world quests via
    `C_QuestLog.IsWorldQuest` (so Legion→Midnight world-quest content is found
    without a curated list).
  - **Enrich** — re-reads title/rewards/objectives for already-known dailies.
  - **Sweep** — learns active world quests via `C_TaskQuest`.
  - Throttled with in-flight backpressure and per-request expiry, so a full
    unattended scan can't flood the server or hang on non-existent IDs.
- **Harvester panel** (`UI/HarvestPanel.lua`) — a **Tools** button on the tracker
  (and bare `/qt harvest`) opens a panel with one-click **Full Scan**, custom
  range, Enrich, Sweep, Stop, and Export, plus a live progress readout.
- **Baked rewards & objectives in the detail panel** — money, XP, items,
  currencies, and objectives now show for dailies you haven't picked up,
  sourced from harvested data (`Core/QuestRewards.lua` → `DT.BakedDetails`).
- **Quest descriptions** — the giver's flavor text is captured when you view a
  quest (`QUEST_DETAIL`) and displayed in the detail panel.
- **Build pipeline** (`_generator/`, Node, zero dependencies):
  - `build-from-harvest.js` — converts harvested SavedVariables into shippable
    `Core/QuestRewards.lua`; **merges multiple snapshots** (e.g. Alliance + Horde).
  - `build-chains.js` + `lib/wago.js` — quest chains from Blizzard's own DB2
    tables via wago.tools.
- **`Core/QuestRewards.lua`** — baked titles/rewards/objectives for **702 quests**
  (Alliance harvest; Horde merge to follow).
- **Midnight** added to the expansion list (`Core/Constants.lua`).

### Fixed
- **Detail-panel body now renders.** Row text was created without an anchor
  point, so everything below the header (status, giver, objectives, rewards) drew
  nothing. Text is now anchored within its row — this affected all quests, baked
  or live.

### Changed
- The detail panel falls back to harvested/baked data when the live API hasn't
  cached a quest, so undiscovered dailies show their rewards out of the box.
- `/qt harvest` subcommands: `full`, `discover`, `start`, `sweep`, `status`,
  `stop`, `export`.
- **TitanPanel bar** (`Integrations/TitanPanel.lua`) now reads from the same
  checklist engine (`DT.Checklist`) the tracker window uses, so the bar and
  window can never disagree on counts or status. The tooltip adds **"Not yet
  seen"** and **"Discovered X/total"** lines, and bar refreshes are driven by
  Core's shared throttled refresh (so the bar updates on quest-giver discovery
  too) instead of the plugin's own quest-event handlers.

### Notes
- **Sourcing is first-party only.** Quest titles, the daily flag, and rewards are
  not in any static retail file (verified: retail ships no `Quest`/`QuestSparse`
  DB2 — `QuestV2` is just an ID registry) — that data is streamed to the client,
  so the harvester reads it there. wago.tools DB2 (Blizzard's own files) is used
  only for quest chains; no curated third-party quest datasets.
- The harvester is a **developer tool** for generating the data that ships; end
  users simply load the baked files.
- World quests mostly capture titles, not rewards (inactive WQs don't stream
  reward data — that fills in via Sweep when they're live); quest descriptions
  accumulate as quests are viewed.

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
- **Renamed the addon from *DailyGrind* to *QuestTally — Daily Quest Tracker***
  (folder, `.toc`, SavedVariables, and slash commands). The old slash commands
  `/grind`, `/ddt`, and `/dailies` are replaced; the primary command is now
  **`/qt`** (aliases `/questtally`, `/dailies`). *Any references to "DailyGrind"
  in the 0.1.0 entry below describe the project under its former name.*
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
