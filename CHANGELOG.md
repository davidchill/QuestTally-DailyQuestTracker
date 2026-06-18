# Changelog

All notable changes to QuestTally are documented here.

## [0.4.1] - 2026-06-18

A polish release: a new **Pinned** companion panel, the **QuestTally logo** in the
title bar, and fixes to quest tagging, the right-click waypoint, and the Current
Zone tab.

### Added
- **Pinned panel.** A companion pane docked to the **left** of the window
  (mirroring the detail panel on the right) lists every quest you've **pinned** by
  middle-clicking. Each row shows status + zone; **left-click** opens its details,
  **right-click** un-pins it. Toggle it with the new **Pinned** button on the title
  bar. (`UI/PinnedPanel.lua`)
- **Logo in the title bar.** The stock note icon is replaced by the QuestTally
  app-icon logo (`Media/QuestTally-Logo.tga`, baked from the first-party art).

### Fixed
- **Skyriding races now tag correctly.** Base race courses (e.g. *Elwynn Forest
  Flash*, *Azure Span Sprint*) were mislabeled as faction dailies — only their
  *Advanced/Reverse* variants got the **Race** tag. All **75** base courses are now
  tagged, and 13 incidental expansion mislabels (Mount Hyjal, Zangarmarsh) were
  corrected.
- **Right-click waypoints work for the whole catalog.** The waypoint needs a giver
  map ID, which the wiki data never supplied — so for **572** quests with known
  coordinates the pin silently failed. The giver's map is now resolved from live
  data or, failing that, from the quest's zone (via a new runtime zone-name → map
  index), so right-click reliably drops the tracked map pin.
- **Current Zone tab no longer drops quests.** It filtered on each quest's raw zone
  name while the other tabs use normalized zone grouping, so ~45 quests under
  sub-hub names (Molten Front, Shrine of Seven Stars, Landfall, …) were missing.
  The tab now shows every quest mapped to your zone, matching the All/Browse view.
- **A few more quests tagged right.** Tol Barad / Tol Barad Peninsula dailies now
  carry the **PvP** tag (contested-control zones), and a stray garrison daily
  (*Scrap Meltdown*) now gets the **Garrison** tag.

## [0.4.0] - 2026-06-17

A data-quality and organization release. A fourth first-party source — the
official **Blizzard Game Data API** — was added to the build pipeline and used to
**audit, correct, and complete** the daily catalog: hundreds of zones fixed, ~400
genuinely-missing dailies filled in, and descriptions baked for the gaps. The
list is now organized by **zone within each expansion** and **tagged by quest
kind**, with world quests hidden by default.

### Added
- **Zone sub-grouping.** In the **All** view, each expansion now nests its quests
  into **collapsible zone sub-sections** (e.g. *The War Within → Hallowfall*),
  with their own `done / total` counts and persisted fold state.
- **Quest-kind tags.** Inline colored badges label a quest's kind while it still
  groups by zone: **Prof**, **Pet**, **PvP**, **Incursion**, **Calling**,
  **Ally** (Combat Ally), **Race** (skyriding), **Holiday**, and **Garrison**.
- **~400 missing dailies.** A completeness sweep against the Blizzard API found
  dailies the wiki list never had — they ship in the new `Core/ChecklistDataExtra.lua`
  (397 hub dailies + 253 skyriding races), zone-classified and faction-aware.
- **Baked quest descriptions.** `Core/ApiDetails.lua` ships **~2,000 quest
  descriptions** from the Blizzard API, so the gap dailies (and any entry the wiki
  never described) show their flavor text in the detail panel.
- **New Settings toggles:** *Show world quests* (off by default), *Show skyriding
  races* (off), *Show profession dailies*, and *Show battle pet dailies*.
- **Blizzard Game Data API pipeline.** New developer tools
  (`_generator/build-quest-details-from-api.js`, `build-gap-entries.js`,
  `build-api-details.js`) audit our titles/zones, find gaps, and bake details —
  all first-party, build-time only (addons can't make web requests).

### Changed
- **Group by zone, tag by kind.** Professions, battle pets, PvP, incursions,
  callings, etc. are no longer pseudo-"zones" — every quest groups under its real
  geographic zone and carries a kind tag instead.
- **World quests hidden by default.** Blizzard tracks world quests natively on the
  map, so the ~3,600-entry catalog is now off by default (one toggle reveals it).
  The catalog's non-WQ task quests — **Callings, Combat Ally, Island Weekly** — are
  correctly told apart and **kept** as tracked dailies.
- **452 zones corrected** from the Blizzard API: the placeholder `"Various"` zone
  (390 quests), character-level leaks (`"60"`/`"90"`), and plain-wrong zones
  (e.g. a Korthia daily mislabeled Revendreth) now use Blizzard's canonical names.
- **Sub-hub zones merged.** Aliases fold Molten Front → Mount Hyjal, Argent
  Tournament → Icecrown, Landfall → Krasarang Wilds, Shrine of Seven Stars → Vale,
  etc., so they group with their parent zone.
- **Expansion classification is zone-based** for the new entries — the quest-ID
  band is unreliable because Blizzard reissues old dailies with modern IDs (439 of
  the 650 gaps would have been misfiled by ID alone).

### Fixed
- **Quest descriptions no longer go blank.** The detail panel resolved description
  from the *first* data source that existed, even when it had none — so a quest
  with a harvested or wiki entry lacking a description showed nothing, even when
  another source had the text (702 harvested + 726 wiki entries were affected).
  Description is now resolved independently across every source (live → harvested →
  wiki → API). ~99% of tracked quests now show their description.
- **Detail panel no longer hangs on "Loading…".** Quests whose data the client
  can't supply (group/raid-style, never-harvested) now settle on the available
  objectives or a clear note, instead of spinning forever; added a load-timeout
  safety net.
- **Placeholder quests hidden.** Blizzard's internal test entries that leaked into
  the catalog (`Calling Quest (DNT)`, `x.x Testing (YGR)`) are filtered out, and
  the catalog generator's junk filter was widened to catch them at the source.

## [0.3.0] - 2026-06-17

A visual overhaul of the tracker — a darker, less-flat theme with custom widgets —
plus a round of dead-code removal and a restored learning path.

### Added
- **Custom themed widgets** replacing the stock Blizzard ones on the tracker and
  detail panel: a slim **scrollbar** (gradient thumb, mouse-wheel, draggable, and
  it **auto-hides when the content fits** — no more stray arrow buttons), and a
  flat **"X" close button** that lights to a soft red on hover. Both are shared
  via `DT.UI.Skin` so every panel stays consistent.
- **Depth styling.** Vertical gradients plus 1px highlight/shadow bevel hairlines
  on the title bar, tab bar, active tab, and each section header; lit accent bars
  and section icon-chips. The panel is now near-opaque so the game world no longer
  bleeds through and washes out the dark look.
- **Detail panel header.** A **status pill** (e.g. *Available*, *Ready to Turn In*)
  and a top **expansion-accent stripe** that ties the open panel to the section
  the quest came from.

### Changed
- **Expansion section colors** retuned toward each expansion logo's signature color
  — Iron-Horde red for Warlords, fel-lime green for Legion, frost-blue for Wrath,
  Deathwing orange for Cataclysm, void-violet for Midnight, and so on — held to a
  mid tone so they sit on the dark panel instead of glowing.
- **Status colors** desaturated and darkened (neon gold → amber, neon green →
  sage, bright blue → steel) so nothing neons against the dark UI.
- **Detail panel reskinned** from the old parchment dialog to the flat dark theme,
  so it reads as one piece with the main window.

### Fixed
- **Restored passive quest-log learning.** Dailies already sitting in your log
  (accepted before installing, from a quest item, or via a chain) are learned
  again — the learning side-effect had been orphaned when the UI moved to the
  checklist engine, so those quests were only learned on giver interaction. It now
  runs via `DT.QuestLog:ScanLogForLearning()` on the throttled quest-log refresh.

### Removed
- **Dead code.** `QuestLog:GetEntries`/`makeEntry`, `Checklist:GetDiscoveredEntries`,
  `QuestData:GetExpansionForMap`/`GetInfo`/`_catalog`, `DB:GetQuestKind`,
  `Harvester:IsRunning`, the unused `completedCache` store, and four settings that
  were defined but never read (`showCompleted`, `sortMode`, `windowScale`,
  `groupBy`).
- Relabeled the in-game `/qt harvest export` box as a **quick snapshot** (titles +
  rewards only) rather than a drop-in `QuestRewards.lua`, so it can't overwrite the
  richer generated file (which also bakes objectives and quest kind).

## [0.2.1] - 2026-06-17

A ground-up rebuild of how the addon both **looks** and **gets its data**. The
window is now a modern flat-dark panel with collapsible, color-coded sections,
and the entire quest catalog is rebuilt from first-party sources — the Questie
dependency is gone. Three pipelines now feed the catalog: warcraft.wiki for
dailies (with IDs, zones, givers, rewards, and coordinates), Blizzard's own
client database for world quests, and the live in-game harvester for the rest.

### Added
- **Modern UI** (`UI/MainFrame.lua`) — flat dark panel with a title bar +
  overall progress counter, **collapsible color-coded sections** (one accent per
  expansion, `done / total` counters, `+/–` toggles, fold state persisted), and a
  bottom tab bar. Completed quests dim; status dots keep their color coding.
- **Settings panel** — a gear button on the title bar opens a toggle panel:
  *Show holiday / seasonal quests*, *Show inactive world quests*, *Newest
  expansions first*.
- **World-quest catalog** (`Core/WorldQuestData.lua`, `DT.WorldQuests`) — **~3,600
  world quests** (Legion → Midnight) with title, expansion, and zone, mined
  first-party from Blizzard's retail client database (DB2) via wago.tools
  (`_generator/build-db2-catalog.js`). World-quest status is **rotation-aware**:
  ones not currently up read as *Not Active* rather than falsely *Available*.
- **Wiki daily catalog** (`Core/ChecklistData.lua` + `Core/WikiDetails.lua`) —
  **~1,460 dailies across every expansion** imported from warcraft.wiki.gg
  (CC BY-SA) via `_generator/build-checklist-from-wiki.js`, carrying real quest
  IDs, zones, givers, rewards, objectives, descriptions, and giver coordinates.
  Old-era dailies now light up with live status immediately (no scan needed).
- **Detail panel** now fills from wiki data too — rewards, objectives,
  description, and giver name + coordinates (or location text when coords aren't
  on the wiki).

### Changed
- **Catalog engine** (`Core/Checklist.lua`) merges three first-party sources
  (wiki dailies, harvested dailies, DB2 world quests) into one de-duplicated list,
  and **hides opposite-faction variants** for your character.
- **Seasonal / holiday dailies** (Love is in the Air, Brewfest, Hallow's End, …)
  are tagged and **hidden by default** (they're only up during their festival);
  toggle them on in Settings.
- Bottom tab order is now **Current Zone | All | Browse**.
- Expansion classification now uses quest-ID bands plus content data, so modern
  expansions group correctly.

### Removed
- **Questie dependency** — deleted `Core/QuestDetails.lua` and the `_questie/`
  dataset. All giver/coordinate data is now first-party (wiki + live capture).

### Fixed
- **Wiki importer cache collision** — the data-build cache key was truncated and
  could serve one request's data to another, corrupting givers/rewards in bulk.
  Cache keys are now hashed, so the imported catalog is accurate.

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
