# QuestTally — Daily Quest Tracker

A World of Warcraft (Retail) addon **designed to track ALL daily quests
available on Retail — from Vanilla through Midnight** — listing what's
available, tracking completion, and helping you finish them, organized by
**expansion** and **zone**.

> **Version 0.1.1** — built and tested against Retail patch **12.0.5**.
> Quest-giver/coordinate coverage currently spans **TBC–MoP** and is expanding
> toward the full Vanilla → Midnight goal.

## Features

- **712-quest master checklist.** Daily quests from TBC through Mists of Pandaria,
  grouped by expansion and category (Profession / Faction / PvP / Dungeon / Event
  / Other). Designed to grow over time.
- **Live status, always accurate.** Reads your real quest log and completion
  flags — never stale. Each daily is color-coded:
  - 🟡 **Available** · 🔵 **In Progress** · 🟢 **Ready to Turn In** ·
    ⚪ **Done Today** · 🟣 **Not Yet Seen**
- **Automatic discovery.** Just **open a quest giver's dialog** and its dailies
  are learned — no need to accept them. Picking up or completing a daily learns
  it too.
- **Search by location.** Three modes:
  - **Current Zone** *(default)* — dailies in the zone you're standing in.
  - **Browse** — pick a **Continent → Zone** from dropdowns.
  - **All** — the full checklist grouped by expansion.
- **Quest giver locations — baked in.** **609 dailies (TBC–MoP) ship with their
  giver name and coordinates**, so the tooltip shows the giver and **right-click
  drops a travel waypoint** on them right out of the box — no exploring required.
  Talking to a giver also captures it **live**, which overrides the baked data.
- **Reset timer.** Time remaining until the next daily reset.
- **Row actions.** Left-click to **pin**, right-click to **travel to the giver /
  track the quest**, **Shift-click to copy the Wowhead link**.
- **WoW-native window.** Gold header banner, portrait, dark panel, grouped
  section bars. Movable, with remembered position.
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
**cannot list every daily in the world** — and the wiki lists daily *names* but
not their numeric IDs. QuestTally bridges that gap:

1. **Master checklist (names).** A curated list of 712 daily quest titles
   (`Core/ChecklistData.lua`) tells the addon *what exists*, grouped by expansion.
2. **The learner (IDs).** As you play — talking to quest givers or doing dailies —
   the addon records each quest's **real ID, title, and zone** straight from the
   game, account-wide. This is always accurate (no scraping).
3. **Title matching.** `Core/Checklist.lua` links each checklist title to its
   learned ID, so the quest "lights up" with live status. The game itself supplies
   the title↔ID pairing, so it's never wrong.
4. **Hybrid zones.** Every quest has a pre-mapped continent/zone
   (`Core/ZoneMap.lua`) so the list is browsable by location immediately; once a
   quest is discovered, its *real* learned zone takes over.
5. **Baked giver details.** `Core/QuestDetails.lua` ships 609 dailies' quest IDs,
   giver names, and map coordinates (TBC–MoP), so status, Wowhead links, and
   travel waypoints work immediately. Live capture refines any of it as you play.

Adding more dailies is a one-line append in `Core/ChecklistData.lua`.

## Roadmap

- Expand the checklist to WoD → The War Within.
- World-map and minimap pins for daily turn-ins and objectives.
- Live-ticking reset countdown and a settings panel.
- Refine pre-mapped zones for capital-city and multi-zone dailies.
- Classic / progression-client support via version-specific `.toc` files.

## Project layout

```
QuestTally/
├── QuestTally.toc      Addon manifest + load order
├── Core/
│   ├── Constants.lua        Version, expansion list, colors, status enums
│   ├── Database.lua         SavedVariables, defaults, learned-quest store
│   ├── QuestData.lua        Optional expansion-keyed catalog of quest IDs
│   ├── ChecklistData.lua    Master checklist of daily quest titles (712)
│   ├── QuestDetails.lua      Baked giver/coordinate database (609, TBC–MoP)
│   ├── QuestLog.lua         Live scanning, status logic, auto-learner, discovery
│   ├── Zones.lua            Map/zone resolution + current-zone lookup
│   ├── ZoneMap.lua          Pre-mapped continent/zone per category
│   ├── Checklist.lua        Title↔ID matching engine + zone resolution
│   └── Core.lua             Events, init, slash commands
├── UI/
│   └── MainFrame.lua        The tracker window (3 modes, native skin)
└── Integrations/
    └── TitanPanel.lua       Optional TitanPanel bar plugin (no-op without Titan)
```

## Credits

Quest, NPC, and coordinate data for the baked giver database is adapted from the
[Questie](https://github.com/Questie/Questie) project (MIT-licensed). QuestTally
is not affiliated with Questie.
