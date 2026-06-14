# Daily Grind

A World of Warcraft (Retail) addon that lists daily quests, tracks which ones
you've completed, and helps you finish them — organized by **expansion** and
**zone**.

> **Version 0.1.0** — initial release. Built and tested against Retail patch
> **12.0.5**.

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
- **Reset timer.** Time remaining until the next daily reset.
- **Row actions.** Left-click to **pin**, right-click to set a **waypoint**,
  **Shift-click to copy the Wowhead link**.
- **WoW-native window.** Gold header banner, portrait, dark panel, grouped
  section bars. Movable, with remembered position.
- **TitanPanel support (optional).** If [TitanPanel](https://www.curseforge.com/wow/addons/titan-panel)
  is installed, a bar button shows a live **"Dailies: done/total"** summary with
  a per-status tooltip. Works fully without Titan.

## Installation

1. Copy the **`DailyGrind`** folder (the inner one, not the repo root) into
   your WoW AddOns directory:
   ```
   World of Warcraft\_retail_\Interface\AddOns\DailyGrind
   ```
2. Restart WoW, or `/reload` if it's running.
3. Make sure **Daily Grind** is enabled on the character-select AddOns list.

## Usage

Open the window with **`/grind`** (or `/ddt`, `/dailies`).

| Command | Action |
|---|---|
| `/grind` | Toggle the window |
| `/grind show` / `hide` | Open / close the window |
| `/grind reset` | Reset the window position to center |
| `/grind stats` | Checklist & discovery summary |
| `/grind help` | List commands |

## How it works

The WoW API can report the live status of **any quest ID you ask about**, but it
**cannot list every daily in the world** — and the wiki lists daily *names* but
not their numeric IDs. Daily Grind bridges that gap:

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

Adding more dailies is a one-line append in `Core/ChecklistData.lua`.

## Roadmap

- Expand the checklist to WoD → The War Within.
- World-map and minimap pins for daily turn-ins and objectives.
- Live-ticking reset countdown and a settings panel.
- Refine pre-mapped zones for capital-city and multi-zone dailies.
- Classic / progression-client support via version-specific `.toc` files.

## Project layout

```
DailyGrind/
├── DailyGrind.toc      Addon manifest + load order
├── Core/
│   ├── Constants.lua        Version, expansion list, colors, status enums
│   ├── Database.lua         SavedVariables, defaults, learned-quest store
│   ├── QuestData.lua        Optional expansion-keyed catalog of quest IDs
│   ├── ChecklistData.lua    Master checklist of daily quest titles (712)
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
