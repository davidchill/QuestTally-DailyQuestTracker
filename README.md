# QuestTally — Daily Quest Tracker

A World of Warcraft (Retail) addon **designed to track ALL daily quests
available on Retail — from Vanilla through Midnight** — listing what's
available, tracking completion, and helping you finish them, organized by
**expansion** and **zone**.

> **Version 0.4.2** — built and tested against Retail patch **12.0.x**.
> Catalog covers **~2,000 dailies across every expansion** (wiki + Blizzard-API
> gap-fill) plus **~3,600 world quests** (Legion → Midnight) from first-party
> sources.
>
> *Formerly named **DailyGrind**. The addon was renamed to QuestTally in 0.1.1;
> the old slash commands (`/grind`, `/ddt`) are replaced by **`/qt`**.*

## Features

- **Full quest catalog.** **~2,100 daily quests across every expansion** — from
  warcraft.wiki, completed and zone-corrected against Blizzard's own Game Data API
  — plus **~3,600 world quests** (Legion → Midnight, from Blizzard's client
  database). Grouped by **expansion → zone**.
- **Modern window.** A dark panel with subtle gradients and bevels (not flat),
  the **QuestTally logo** in the title bar, **collapsible sections color-coded to
  each expansion's logo** that **nest by zone**, an overall **progress counter**,
  per-section `done / total` counts, custom themed scrollbars and close buttons,
  and bottom tabs. Movable, with remembered position and persisted fold state.
- **Pinned panel.** Middle-click any quest to **pin** it; a companion panel docks
  to the left of the window listing your pins (status + zone). Left-click a pinned
  row to open its details, right-click to un-pin. Toggle it with the title-bar
  **Pinned** button.
- **Quest-kind tags.** A small inline badge labels each quest's kind — **Prof**,
  **Pet**, **PvP**, **Incursion**, **Calling**, **Ally**, **Race**, **Holiday**,
  **Garrison** — so it groups by zone yet stays identifiable at a glance.
- **Live status, always accurate.** Reads your real quest log and completion
  flags — never stale. Each quest is color-coded:
  - 🟡 **Available** · 🔵 **In Progress** · 🟢 **Ready to Turn In** ·
    ⚪ **Done Today** · ⚫ **Not Active** *(world quest not currently up)* ·
    🟣 **Not Yet Seen**
- **World quests stay hidden.** Blizzard already tracks world quests natively on
  the map, so QuestTally focuses on the dailies it *doesn't* surface well.
- **Filters menu.** A **Filters** button on the title bar toggles the content
  categories — **Holiday / Seasonal**, **Profession**, **Battle Pet**, and
  **Skyriding** (Skyriding and Holiday are **hidden by default**) — so the list
  stays focused year-round.
- **Settings panel.** A **gear button** on the title bar holds the **Newest
  expansions first** sort toggle.
- **Expand / collapse all.** On the **All** tab, a one-click toggle folds or
  unfolds every expansion section at once.
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
- **Reset timer, row actions.** Time until daily reset; **left-click** for
  details, **middle-click** to **pin**, **right-click** to **travel to the giver /
  track the quest**, **Shift-click** to copy the **Wowhead link**.
- **First-party data only.** All quest data comes from Blizzard's client database,
  Blizzard's official **Game Data API**, the openly-licensed community wiki, or
  your live game — never scraped from a commercial site. (A developer-only **harvester**,
  kept outside the shipped addon, reads fresh data from the live client to refresh
  the catalogs.)
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
2. **Gap-fill + corrections (Blizzard Game Data API).** `Core/ChecklistDataExtra.lua`
   adds **~600 more dailies** the wiki list missed (found by sweeping the official
   API for `is_daily` quests, then reviewed to drop one-time quests and fix
   expansion tags), and the same API corrected **452 zones** in the wiki
   list. `Core/ApiDetails.lua` ships **~2,000 quest descriptions** so the gap
   dailies show their flavor text.
3. **World-quest catalog (Blizzard's database).** `Core/WorldQuestData.lua` ships
   **~3,600 world quests** (Legion → Midnight) — title, expansion, zone — mined
   from Blizzard's own retail client database (DB2, via wago.tools). Hidden by
   default (Blizzard tracks these on the map already).
4. **Harvested details.** `Core/QuestRewards.lua` ships rewards/objectives read
   first-party from the live client (see the harvester, below).
5. **Live status.** `Core/Checklist.lua` merges those catalogs and asks the game
   for each quest's real-time status — never stale. World quests are
   **rotation-aware**: ones not currently up read as *Not Active*.
6. **Live capture.** Talking to a quest giver records its **exact coordinates**
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
- The in-game **harvester** (`_harvester/Harvester.lua`, kept outside the shipped
  addon) covers what DB2 can't: regular hub/turn-in dailies (pre-Legion and modern
  non-WQ), recognized by checklist title-match and read live, plus `C_TaskQuest`
  sweeps. Drop it back into the addon to run a fresh harvest.
- `_generator/build-checklist-from-wiki.js` imports the daily-quest master list
  from warcraft.wiki.gg (CC BY-SA) — real quest IDs, zones, givers, rewards,
  objectives, descriptions, and giver coordinates — baking `Core/ChecklistData.lua`
  and `Core/WikiDetails.lua`.
- `_generator/build-from-harvest.js` converts the harvested SavedVariables into
  the shipped `Core/QuestRewards.lua` (merging Alliance + Horde passes).
- `_generator/build-quest-details-from-api.js` queries Blizzard's official **Game
  Data API** to **audit** our titles/zones (`--fix-zones` rewrote 452 zones) and
  **find gaps** (`--find-gaps` sweeps each zone for `is_daily` quests we lack).
  `build-gap-entries.js` turns those gaps into `Core/ChecklistDataExtra.lua`, and
  `build-api-details.js` bakes their descriptions into `Core/ApiDetails.lua`.
  (Needs a free Battle.net API client; build-time only — addons can't call the web.)

This is a **developer workflow**: the data is baked and shipped, so end users
just install the addon. Re-running the generators against a newer client build
or wiki refreshes the catalogs.

## Roadmap

- Complete the harvest on both factions and bake the full reward/detail set.
- Place the remaining "Various"-zone dailies (Blizzard's API has no area for them;
  only a live harvest can resolve their zone).
- Fill in world-quest rewards via periodic `Sweep` (inactive WQs don't stream
  reward data until live).
- Extend the API enrichment to **rewards/currencies** (descriptions and zones are
  done as of 0.4.0).
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
│   ├── ChecklistDataExtra.lua  API-found dailies the wiki missed (~650; gaps + races)
│   ├── WikiDetails.lua       Wiki rewards/objectives/desc/giver coords (by id)
│   ├── ApiDetails.lua        Quest descriptions baked from the Blizzard Game Data API
│   ├── QuestRewards.lua      Baked rewards/objectives/descriptions (harvested)
│   ├── WorldQuestData.lua    World-quest catalog from retail DB2 (Legion+)
│   ├── QuestLog.lua         Live scanning, status logic, auto-learner, discovery
│   ├── Zones.lua            Map/zone resolution + current-zone lookup
│   ├── ZoneMap.lua          Pre-mapped continent/zone per category
│   ├── Checklist.lua        Title↔ID matching engine + zone resolution
│   └── Core.lua             Events, init, slash commands
├── UI/
│   ├── MainFrame.lua        The tracker window (3 modes, dark theme + DT.UI.Skin)
│   ├── DetailPanel.lua      Per-quest details pane, right side (rewards/objectives/desc)
│   └── PinnedPanel.lua      Pinned-quests pane, left side (middle-clicked favourites)
├── Media/
│   └── QuestTally-Logo.tga  Title-bar logo (baked from the first-party art)
└── Integrations/
    └── TitanPanel.lua       Optional TitanPanel bar plugin (no-op without Titan)
```

The `_generator/` folder (Node tools that bake harvested data into shipped Lua)
and `_harvester/` folder (the in-game harvester files, kept out of the shipped
addon) sit alongside this addon folder. Both are dev-only and not part of the
installed addon.

## Credits

All quest data is first-party: the world-quest catalog is mined from Blizzard's
own retail client database (DB2) via [wago.tools](https://wago.tools), and daily
titles/rewards are harvested live from the game client. QuestTally uses no
third-party quest databases.
