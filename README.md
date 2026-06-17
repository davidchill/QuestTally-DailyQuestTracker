# QuestTally — Daily Quest Tracker

A World of Warcraft (Retail) addon **designed to track ALL daily quests
available on Retail — from Vanilla through Midnight** — listing what's
available, tracking completion, and helping you finish them, organized by
**expansion** and **zone**.

> **Version 0.3.0** — built and tested against Retail patch **12.0.x**.
> Catalog covers **~1,460 dailies across every expansion** plus **~3,600 world
> quests** (Legion → Midnight), all from first-party sources.
>
> *Formerly named **DailyGrind**. The addon was renamed to QuestTally in 0.1.1;
> the old slash commands (`/grind`, `/ddt`) are replaced by **`/qt`**.*

## Features

- **Full quest catalog.** **~1,460 daily quests across every expansion** (from
  warcraft.wiki) plus **~3,600 world quests** (Legion → Midnight, from Blizzard's
  own client database), grouped by expansion.
- **Modern window.** A dark panel with subtle gradients and bevels (not flat),
  **collapsible sections color-coded to each expansion's logo**, an overall
  **progress counter**, per-section `done / total` counts, custom themed
  scrollbars and close buttons, and bottom tabs. Movable, with remembered position
  and persisted fold state.
- **Live status, always accurate.** Reads your real quest log and completion
  flags — never stale. Each quest is color-coded:
  - 🟡 **Available** · 🔵 **In Progress** · 🟢 **Ready to Turn In** ·
    ⚪ **Done Today** · ⚫ **Not Active** *(world quest not currently up)* ·
    🟣 **Not Yet Seen**
- **World quests, rotation-aware.** Only world quests that are **currently active**
  show by default; the full catalog is one toggle away in Settings.
- **Seasonal quests, out of the way.** Holiday dailies (Love is in the Air,
  Brewfest, Hallow's End, …) are **hidden by default** and revealed via Settings,
  so they don't clutter the list year-round.
- **Settings panel.** A **gear button** on the title bar toggles holiday quests,
  inactive world quests, and newest-expansions-first ordering.
- **Quest givers & coordinates — baked in.** Dailies ship with their **giver name
  and (where the wiki has them) map coordinates**, so the tooltip shows the giver
  and **right-click drops a travel waypoint**. Talking to a giver captures it
  **live**, which overrides the baked data.
- **Quest details — baked in.** Click a quest to see its **rewards** (money,
  items, currencies), **objectives**, **description**, and **giver + location** —
  even for quests you haven't picked up.
- **Search by location.** Three tabs: **Current Zone** *(default)* · **All**
  (everything by expansion) · **Browse** (pick a Continent → Zone).
- **Faction-aware.** Only your character's faction's dailies are shown.
- **Reset timer, row actions.** Time until daily reset; left-click to **pin**,
  right-click to **travel to the giver / track the quest**, **Shift-click to copy
  the Wowhead link**.
- **First-party data only.** All quest data comes from Blizzard's client database,
  the openly-licensed community wiki, or your live game — never scraped from a
  commercial site. A developer **harvester** (`/qt harvest`) reads fresh data from
  your own client.
- **TitanPanel support (optional).** If [TitanPanel](https://www.curseforge.com/wow/addons/titan-panel)
  is installed, a bar button shows a live **"Dailies: done/total"** summary with
  a per-status tooltip. Works fully without Titan.

## Installation

1. Copy the **`QuestTally`** folder (the inner one, not the repo root) into
   your WoW AddOns directory:
   ```
   World of Warcraft\_retail_\Interface\AddOns\QuestTally
   ```
2. Restart WoW, or `/reload` if it's running.
3. Make sure **QuestTally** is enabled on the character-select AddOns list.

## Usage

Open the window with **`/qt`** (or `/questtally`, `/dailies`).

| Command | Action |
|---|---|
| `/qt` | Toggle the window |
| `/qt show` / `hide` | Open / close the window |
| `/qt reset` | Reset the window position to center |
| `/qt stats` | Checklist & discovery summary |
| `/qt harvest` | Open the harvester panel (developer data tools) |
| `/qt help` | List commands |

## How it works

The WoW API can report the live status of **any quest ID you ask about**, but it
**cannot list every quest in the world**. So QuestTally ships the catalog ahead
of time — assembled from first-party sources — and lets the live game light each
entry up with real-time status:

1. **Daily catalog (the wiki).** `Core/ChecklistData.lua` ships **~1,460 dailies
   across every expansion** — with real quest IDs, zones, and givers — and
   `Core/WikiDetails.lua` ships their rewards, objectives, descriptions, and giver
   coordinates. Both are imported from warcraft.wiki.gg (CC BY-SA).
2. **World-quest catalog (Blizzard's database).** `Core/WorldQuestData.lua` ships
   **~3,600 world quests** (Legion → Midnight) — title, expansion, zone — mined
   from Blizzard's own retail client database (DB2, via wago.tools).
3. **Harvested details.** `Core/QuestRewards.lua` ships rewards/objectives read
   first-party from the live client (see the harvester, below).
4. **Live status.** `Core/Checklist.lua` merges those catalogs and asks the game
   for each quest's real-time status — never stale. World quests are
   **rotation-aware**: ones not currently up read as *Not Active*.
5. **Live capture.** Talking to a quest giver records its **exact coordinates**
   account-wide, overriding the baked data — so locations sharpen as you play.

### First-party harvesting (developer toolchain)

Retail does **not** ship quest titles, the daily flag, or rewards in any static
file (`Quest`/`QuestSparse` don't exist on retail; `QuestV2` is just an ID
registry) — that data is streamed to the client on demand. So QuestTally's data
is generated from the **client itself**:

- `_generator/build-db2-catalog.js` mines the **world-quest catalog** straight
  from Blizzard's retail client DB2 (`QuestV2CliTask` + `QuestInfo` +
  `ContentTuning` + `QuestPOIBlob`) via [wago.tools](https://wago.tools) and bakes
  `Core/WorldQuestData.lua`. This covers the world-quest era (Legion → Midnight).
- The in-game **harvester** (`Core/Harvester.lua`, the **Tools** panel) covers
  what DB2 can't: regular hub/turn-in dailies (pre-Legion and modern non-WQ),
  recognized by checklist title-match and read live, plus `C_TaskQuest` sweeps.
- `_generator/build-checklist-from-wiki.js` imports the daily-quest master list
  from warcraft.wiki.gg (CC BY-SA) — real quest IDs, zones, givers, rewards,
  objectives, descriptions, and giver coordinates — baking `Core/ChecklistData.lua`
  and `Core/WikiDetails.lua`.
- `_generator/build-from-harvest.js` converts the harvested SavedVariables into
  the shipped `Core/QuestRewards.lua` (merging Alliance + Horde passes).

This is a **developer workflow**: the data is baked and shipped, so end users
just install the addon. Re-running the generators against a newer client build
or wiki refreshes the catalogs.

## Roadmap

- Complete the harvest on both factions and bake the full reward/detail set.
- Extend the checklist to WoD → Midnight; world-quest content is already covered
  first-party via the harvester's `IsWorldQuest` classifier.
- Fill in world-quest rewards via periodic `Sweep` (inactive WQs don't stream
  reward data until live).
- REST API enrichment (item stats/icons, achievements, currencies) — pending
  Blizzard API credentials.
- World-map and minimap pins for daily turn-ins and objectives.
- Live-ticking reset countdown (currently updates on quest events, not every second).

## Project layout

```
QuestTally/
├── QuestTally.toc      Addon manifest + load order
├── Core/
│   ├── Constants.lua        Version, expansion list, colors, status enums
│   ├── Database.lua         SavedVariables, defaults, learned-quest store
│   ├── QuestData.lua        Optional expansion-keyed catalog of quest IDs
│   ├── ChecklistData.lua    Daily master list from warcraft.wiki (id/zone/giver)
│   ├── WikiDetails.lua       Wiki rewards/objectives/desc/giver coords (by id)
│   ├── QuestRewards.lua      Baked rewards/objectives/descriptions (harvested)
│   ├── WorldQuestData.lua    World-quest catalog from retail DB2 (Legion+)
│   ├── QuestLog.lua         Live scanning, status logic, auto-learner, discovery
│   ├── Harvester.lua        First-party data harvester (dev tool; Tools panel)
│   ├── Zones.lua            Map/zone resolution + current-zone lookup
│   ├── ZoneMap.lua          Pre-mapped continent/zone per category
│   ├── Checklist.lua        Title↔ID matching engine + zone resolution
│   └── Core.lua             Events, init, slash commands
├── UI/
│   ├── MainFrame.lua        The tracker window (3 modes, dark theme + DT.UI.Skin)
│   ├── DetailPanel.lua      Per-quest details pane (rewards/objectives/desc)
│   └── HarvestPanel.lua     Harvester button panel (developer tool)
└── Integrations/
    └── TitanPanel.lua       Optional TitanPanel bar plugin (no-op without Titan)
```

The `_generator/` folder (Node tools that bake harvested data into shipped Lua)
sits at the repo root, alongside this addon folder. It's dev-only and not part
of the installed addon.

## Credits

All quest data is first-party: the world-quest catalog is mined from Blizzard's
own retail client database (DB2) via [wago.tools](https://wago.tools), and daily
titles/rewards are harvested live from the game client. QuestTally uses no
third-party quest databases.
