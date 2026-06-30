# Changelog

All notable changes to QuestTally are documented here.

## [0.8.0] - 2026-06-30

A **major feature** release. QuestTally gains embedded libraries (a first), a
full-fledged unified Search tab, a distance-aware Today's Route, a LibDataBroker
minimap button, a tabbed Help/About/Changelog window, a daily streak, and a
reworked click scheme — and "Pinned" becomes "Tracked" throughout.

### Added

- **Embedded libraries.** The addon now bundles standard, unmodified community
  libraries in `Libs/` — LibStub, CallbackHandler-1.0, LibDataBroker-1.1,
  LibDBIcon-1.0, and HereBeDragons-2.0 / -Pins-2.0 — credited in the README. (Quest
  *data* is still 100% first-party; these are *code* libraries.)
- **Unified Search tab** (replaces Browse). One box matches across **quest name,
  currency, reputation/faction, and zone**, with results grouped by what matched
  (Factions with rep bars, Currencies, Zones, then loose Quests), each section
  tagged. Zone is now a search dimension, so geographic browsing isn't lost.
- **Today's Route.** A title-bar **Route** toggle orders the Current Zone tab and
  the Tracked panel **nearest-giver first**, tagging each row with its **live
  distance in yards** (via HereBeDragons), re-sorting as you move.
- **LibDataBroker feed + minimap button.** A standard broker any display bar
  (Bazooka, ChocolateBar, ElvUI, …) can show, plus a LibDBIcon minimap button —
  done/total with a per-status, reset, and streak tooltip.
- **Help & Settings window.** The gear opens a draggable pop-up with **Guide**,
  **About** (CurseForge comment/issue links), and **Changelog** tabs over a Settings
  section. The changelog auto-pops once on the first login after an update
  (`Core/Changelog.lua` ships the in-game version history).
- **Daily streak.** Turning in tracked dailies builds a current/best streak, shown
  in `/qt stats`, the broker/minimap tooltip, and the Titan plugin.
- **Reputation in search.** The Faction/Rep tab's search also matches faction names
  (and the type-ahead tags faction suggestions distinctly from quests).
- **Objective progress & currency holdings.** In-progress rows show a live `12/20`
  count; currency reward lines show how much you already hold `(have 1,234)` /
  `(1,234 / 5,000)` when capped.

### Changed

- **"Pinned" is now "Tracked"** everywhere user-facing — the button, the side panel,
  tooltips, and the Guide. (The saved-variable field stays `pinned` so existing
  tracked quests aren't lost.)
- **New click scheme** (shared by the list and the Tracked panel): **Left** details
  / select · **Middle** track/untrack · **Shift+Middle** Wowhead link · **Right**
  map pin at the giver · **Shift+Right** TomTom waypoint.
- **Search lives only on the Search tab** now (removed from Expansion and
  Faction/Rep); the Faction tab gained the "/Rep" label.
- **Live-ticking reset countdown** — the sub-bar timer now updates every second
  (calm hours-out, ticking seconds under an hour).
- The Settings "Newest expansions first" toggle was retired — it's the baked-in
  default now; the Settings section remains for future options.

### Removed

- **Map pins** (world-map / minimap giver pins) are **disabled for now** — the
  feature and its HereBeDragons libraries stay in the package for an easy re-add.

## [0.7.3] - 2026-06-28

A **navigation, structure, and accuracy** release. The grouped views gain themed
sub-sections and a calmer color hierarchy, the Expansion tab now sorts zones by
where they actually are in the world, currency rewards finally show their icons,
and quest givers can vary by faction.

### Added
- **Themed sub-sections within zones.** Each zone now splits its quests into
  collapsible kind groups — Professions, Battle Pets, PvP, Incursions, Calling,
  Combat Ally, Skyracing, Holiday, Garrison — instead of conveying the kind only
  as a per-row badge. Direct (un-themed) quests still list first, then the kind
  groups, then any geographic sub-zones. Works in every zone-grouped view (All,
  Browse, Current Zone) through the one shared section emitter.
- **Currency reward icons.** Baked currency rewards (e.g. *Oil*, *Apexis
  Crystal*) shipped only a name + amount, so they rendered icon-less when a quest
  wasn't in your log. A new `CurrencyIDs.lua` maps each of the 23 reward
  currencies to its Blizzard currency ID — sourced from the first-party quest
  cache — and the detail panel now resolves the icon live via `C_CurrencyInfo`.
- **Faction-aware quest givers.** A giver can now stand in a different place per
  faction. *Budd's Gambit* (Budd, a garrison NPC) is the first: Frostwall for
  Horde, Lunarfall for Alliance, each with its own map and coordinates pulled
  from Wowhead's pin data. The giver model gained optional `A`/`H` overrides;
  every existing single-location giver is unchanged.

### Changed
- **"Race" is now "Skyracing"** in the sub-section headers (the compact row chip
  still reads "Race").
- **The Expansion tab groups zones by geography, not content patch.** Previously
  a quest was filed by *when it was added* (its ID band), so Dragonflight
  skyriding races dragged old zones like Blade's Edge Mountains under
  Dragonflight, and original-world zones never surfaced at all. Zones now sort by
  the expansion whose world they belong to — Blade's Edge under The Burning
  Crusade, Deadwind Pass under a new **Classic (Vanilla)** group — mirroring how
  the continent was already resolved from geography. The underlying per-quest
  expansion tag is untouched (still used for stats and ID-band fallback).
- **Calmer section color hierarchy.** Only the top-level folder of a view (the
  expansion in All, the zone in Browse / Current Zone) carries a full-color bar.
  Every nested folder drops to a neutral slate fill with just a thin colored
  accent on its spine, icon, and title — a themed group shows its kind color, a
  zone shows a hint of its parent's tint. Three same-hue bars no longer stack
  into a wall of color.
- **Collapse All now folds every folder at every level**, not just the top-level
  sections in view. Re-opening any parent reveals its children already collapsed.
- **The title-bar logo is larger** (18 → 22px), filling more of the bar without
  changing its height.

### Fixed
- **Wrapped quest names are no longer cramped.** A long title that word-wrapped to
  two lines was squeezed into a single fixed-height row and overlapped the row
  below; rows now grow to fit a wrapped title.

## [0.7.2] - 2026-06-28

A **performance, polish, and forward-compatibility** release. No new features —
this pass makes the tracker noticeably lighter on a full quest log, corrects an
internal version stamp, tidies dead data, and declares compatibility with the
**12.1.0** PTR ahead of its launch.

### Performance
- **World-quest catalog is no longer built and discarded on every refresh.** The
  ~3,600-row world-quest list was being assembled into entries — each requiring a
  live task-quest status read (~11,000 API calls) — on every list rebuild, then
  filtered out entirely by every view. It's now gated behind the (previously
  unused) `showWorldQuests` setting and skipped on the default path. No visible
  change: world quests were already hidden everywhere they could appear.
- **The quest list is now memoized per frame.** A single refresh asks the
  checklist engine for its entries 2–3 times (the main list, the Pinned panel, the
  Titan bar). Those calls now share one build per frame instead of rebuilding the
  whole catalog each time, with a generation counter that forces a fresh build the
  instant a pin or setting changes — so nothing ever shows stale.
- **The name search no longer rebuilds twice per keystroke.** Typing in the search
  box ran a full catalog rebuild *and* a separate suggestion scan on every
  keypress, synchronously. The work is now debounced (0.15s) and coalesced to the
  last keystroke, so fast typing stays smooth.

### Fixed
- **Reported version corrected.** The in-game load message, the Titan plugin
  registry, and `/qt stats` were stamped **0.7.0** while the addon was actually
  0.7.1 (the `.toc` and code version had drifted apart). They now agree.
- **`/qt stats` totals match what the tabs show.** The stats summary counted all
  ~3,600 world quests even though the views hide them, wildly over-reporting. It
  now follows the same world-quest gating as the list.

### Changed
- **Internal cleanup.** Removed vestigial placeholder tables and an unused
  iterator from the quest-classification module, and corrected its now-misleading
  header documentation. No behavioral change.

### Compatibility
- **Flagged compatible with the 12.1.0 PTR.** The TOC now lists both `120007`
  (live 12.0.7) and `120100` (12.1.0), so the addon reads as up to date on both
  clients — no "out of date" prompt on either. All game-API calls remain guarded,
  so a missing or renamed function degrades gracefully rather than erroring.

## [0.7.1] - 2026-06-27

A **quest-giver location** fix release. A batch of daily-quest givers displayed
**"Various"** instead of a location in the detail panel because their baked
coordinates were missing. This release backfills accurate coordinates — sourced
from each NPC's actual Wowhead map pin and cross-referenced against a second
source — so the giver line shows precise coordinates and a named landmark, and
**TomTom waypoints land on the NPC** instead of falling back to a placeholder.

### Fixed
- **Quest-giver coordinates restored for 64 daily quests across 16 givers** that
  previously showed **"Various"** with no usable location. Each now displays map
  coordinates plus a real landmark — e.g. *Klaxxi'vess, Dread Wastes* (Kil'ruk,
  Kaz'tik, Korven), *Temple of the White Tiger, Kun-Lai Summit* (Xuen, Lin
  Tenderpaw), *Shado-Pan Garrison, Townlong Steppes* (Ban Bearheart),
  *Violet Rise, Isle of Thunder* (High Arcanist Savor, Archmage Modera),
  *Everywhen Inn, Thaldraszus* (Soridormi, Anduin Wrynn), and the Khadgar/Draven
  capital-city and Korthia dailies.
- **Klaxxi paragon coordinates corrected.** An earlier estimate placed all three
  paragons at one shared point ~2 map-units off; they now use their individual
  Wowhead pins, so TomTom arrows point at the right NPC within Klaxxi'vess.

### Changed
- **"Secrets of Soulbinding" (Darion Mograine) re-zoned** from *Shadowmoon Burial
  Grounds* to **Tanaan Jungle** — Shadowmoon Burial Grounds was only the quest's
  objective; the giver actually stands in Tanaan Jungle. Both the zone grouping
  and the giver waypoint now resolve to the correct map.

## [0.7.0] - 2026-06-27

A **client-compat, reward-data, and UI-polish** release. Updated for Retail
**12.0.7**, completed a **full reward audit** that makes `Core/QuestRewards.lua`
the single baked source for every reward type — closing large gaps in **currency**,
**reputation**, and **XP** coverage — and fixed a batch of **collapse-chip** and
**side-panel** behaviors.

### Changed
- **Updated for patch 12.0.7** (Interface `120007`).
- **One consolidated reward source.** All structured rewards — items, currency,
  money, XP, honor, and **reputation** — now live in `Core/QuestRewards.lua`. The
  detail panel resolves each section **live-first** and fills the rest from this baked
  table, so reputation and XP now display for quests that previously couldn't render
  them (the data used to be split across `QuestRewards`/`WikiDetails` in a way that
  shadowed XP and reputation).
- **XP shown by player level.** Quest XP is now **hidden entirely at max level** (the
  game awards none there) and shows the **live, level-scaled** value while leveling,
  with the baked nominal value as a pre-load placeholder. Uses
  `GetMaxLevelForPlayerExpansion()`, so it adapts to any level cap.
- **Collapse chip opens down-and-right.** Collapsing and expanding now pivot around
  the chip's **top-left corner** — the window grows down-and-right from the chip and
  shrinks back into it — instead of around the center.
- **Snappier chip drag.** Dragging the collapsed chip now begins almost immediately
  (a small 3px threshold) rather than after WoW's larger built-in drag dead-zone; a
  plain click still toggles collapse.

### Fixed
- **XP no longer flickers then vanishes** after a quest's data finishes loading (the
  live API reports 0 XP at max level, which used to wipe the value shown a moment
  earlier).
- **Legacy currency rewards now show** (e.g. *Lesser Charm of Good Fortune*). Reward
  rendering now merges live and baked data **per category**, so a reward type the live
  API silently drops is still filled in from the baked table.
- **Collapsed-chip cleanups:** the **Collapse All** button no longer reappears over
  the chip after a quest event; the chip no longer **jumps off the cursor** when you
  start dragging; and a stray **scrollbar stub** no longer appears beside the chip
  (the list scrollbar was re-showing itself when the window shrank).
- **Pinned panel no longer overlaps** the main window — it now docks **flush** against
  the left edge instead of intruding 8px over the list.

### Data
- **Full reward audit (Blizzard Game Data API).** Pulled rewards for all **1,949**
  catalog quests and rebuilt `Core/QuestRewards.lua` from that first-party data:
  **702 → 2,194 entries**. Added **reputation** to ~1,100 quests and **currency** to
  ~820, filled XP/money for ~1,000 more, and corrected **63** stale money values plus
  the harvested-at-max-level XP across **405** quests. The ~40 quests the API doesn't
  carry (mostly Call-to-Arms battleground dailies) keep their existing data.

## [0.6.0] - 2026-06-26

A **UI & quality-of-life** release. Profession dailies now show their **specific
profession** on the inline tag, **PvP** coverage is rounded out, the **Faction
tab** gains a **live reputation bar** atop each faction section, the **search box**
reliably opens results in the detail panel, and the whole window can **collapse to
a logo-only chip**.

### Added
- **Reputation bars on the Faction tab.** Each faction section now opens with a
  horizontal **reputation bar** showing your live standing with that faction — fill
  proportional to progress in the current level, with the **status and numbers
  centered** (e.g. `Honored — 5,000 / 12,000`, `Renown 12 — Max`). Uses Blizzard's
  standard standing colors, and handles all three systems: **classic** 8-step
  factions, **renown / major** factions, **friendships**, and **paragon** past
  Exalted. Factions you haven't encountered show a muted *Not yet discovered* bar.
  Updates live as your reputation changes.
- **Collapsible window.** **Click the QuestTally logo** in the title bar to condense
  the entire window — list, tabs, search, and any open side panels — down to a
  **logo-only chip**. Click it again to restore everything, **including the panels
  that were open** (the detail panel reopens to the same quest). The chip stays
  draggable; the rest of the title bar still works as the move handle.

### Changed
- **Profession tags name the profession.** The generic **Prof** chip is replaced by
  the **specific profession** — *Jewelcrafting*, *Cooking*, *Fishing*, *Engineering*,
  *Archaeology*, *First Aid*, etc. Driven off a profession whitelist, so profession
  dailies whose data type isn't literally "Profession" (e.g. *Elemental Goo*, a
  Jewelcrafting daily) are now tagged **and** respond to the Profession filter.
- **Search results open the detail panel.** Picking a name from the type-ahead now
  **opens that quest's details** directly (instead of only filling the box), and the
  suggestion popup no longer blocks the first click on a result row — clicking any
  search result reliably opens it on the first try.

### Fixed
- **PvP tag coverage.** World-PvP dailies that carried no PvP signal in the data are
  now tagged: the **Halaa** dailies in *Nagrand* (*In Defense of Halaa*, *Enemies
  Old and New* — "defeat 10 enemy players", honor-flagged) and the **Auchindoun
  spirit-tower** dailies in *Terokkar Forest* (*Spirits of Auchindoun*, world-PvP
  zone control like Tol Barad). Verified across Wowhead + the community wikis.

### Data
- **Profession re-tags (multi-source verified).** *Just a Flesh Wound* (30148, MoP)
  re-tagged from a zone bucket to **First Aid**; *Fencing the Rose* (38399) corrected
  **off** a false *Engineering* tag (it's a Booty Bay reputation daily, not a
  profession quest). A full cross-reference sweep of the catalog confirmed every
  other profession daily was already labeled correctly.
- **New `Core/FactionIDs.lua`.** A baked faction **name → factionID** table (86
  factions our catalog rewards), generated from the first-party Blizzard Game Data
  quest-reward cache, so the reputation bar can resolve any faction via the live API
  without a fragile reputation-pane scan.

## [0.5.2] - 2026-06-25

A **search & data-integrity** release. Adds a **name search bar** with type-ahead
suggestions, and runs a deep, multi-source **cross-reference audit** of the whole
catalog that removed quests which were never genuine retail dailies — wrong-game
(Classic/SoD/MoP-Classic) IDs, rotating world-event "assault" quests, and a few
one-time quests — and re-tagged some skyriding races that were leaking into the
daily list. The "No Reputation" group in the Faction tab is now dailies-only.

### Added
- **Search bar.** A persistent search box under the sub-bar filters the list by
  quest name as you type (matched against the cleaned and raw titles, across every
  tab — not just the current view). Results show as a single flat, always-open
  *Search results* section with a live match count, so every hit is visible without
  expanding folded sections. Clearing the box returns to the active tab.
- **Type-ahead suggestions.** Typing pops a themed auto-complete menu of up to 8
  matching quest names; click one to fill the box with that exact name. Reuses the
  shared popup so it matches the Browse dropdowns. `Esc` clears, `Enter` keeps the
  filter and unfocuses.

### Changed
- **"No Reputation" is dailies-only.** Every quest in the Faction tab's
  *No Reputation* group was cross-referenced; non-dailies were removed or re-tagged
  (see **Data**). The Browse dropdowns hide while a search is active (they don't
  apply to search results), reclaiming that row for the list.
- **List selection highlight.** Opening a quest's detail panel now highlights that
  quest's row in the list, and the highlight clears whenever the panel closes (by the
  close button, a toggle-off, or the main window hiding) so it can't get stuck on a
  row with no panel open.

### Data
- **Removed non-retail "stowaway" quests (26).** Classic, *Season of Discovery*,
  and *MoP Classic* use quest IDs that overlap retail's modern ID bands, so the
  ID-band classifier had mis-filed some into the retail catalog. Confirmed via the
  retail **Game Data API** (they return 404 — they don't exist on retail) plus
  source verification: the SoD "Blackrock Eruption" set, the MoP-Classic "Celestial
  Challenge" dungeon dailies, SoD Ashenvale / Nightmare Incursion quests, WotLK
  "Proof of Demise" (resolving a long-standing mis-tag), and the one-time WoD
  dungeon quest *The Void-Gate* (which had also carried the wrong title).
- **Removed rotating-assault quests (56).** The BFA 8.3 *N'Zoth Assault* dailies in
  **Uldum** and the **Vale of Eternal Blossoms** are flagged "daily" but are only
  available while that zone's assault is the active rotation — so in a tracker they
  read as perpetually incomplete. They're not standing dailies, so they're out.
- **Removed one-time quests (4 more):** *A Special Book* (Secrets of Azeroth chain
  step), *Specter of War: Visectus* (a repeatable with no daily reset), plus
  *The Funky Monkey Brew* and a mis-IDed *"Assault on Lost Veil Anzu"* entry.
- **Re-tagged skyriding races (13).** Dragonflight race time-trials (zone *Rallies*,
  *Storm Gryphon* courses, and *Little Scales Daycare* practice runs) were tagged as
  faction dailies, so they bypassed the Skyriding filter and showed in the daily
  list. They're now `type="Race"` like the rest of the courses, governed by the
  **Skyriding** filter (hidden by default).
- **Added 2 Midnight dailies.** *The Ephemeron Masquerade* (the Decor Duel daily)
  and *Addition of Anguish*, both in **Silvermoon City** — neither was in the
  catalog. Added `Silvermoon City → Eastern Kingdoms` to the zone map so they group
  correctly.
- Net catalog: **1,949** checklist dailies/weeklies (down from ~2,030 as the
  non-dailies were pruned), **341** skyriding races, plus **3,632** world quests.

### Fixed
- **Brand-new dailies can be added at all.** Surfaced that the addon only renders
  quests present in its shipped catalog — passive learning attaches status to an
  *existing* entry but never creates a new row — so genuinely new content (e.g. the
  Midnight Silvermoon dailies) has to be added to the catalog by hand.

### Dev / tooling
- **Cross-reference is now the standing process.** A new `_generator/lib/verify.js`
  combines three independent signals — DB2 **QuestLine** membership (one-time/story),
  the **Wowhead** daily/weekly flag, and the Blizzard **Game Data API** existence
  check — because no single source is reliable (the API *over*-reports daily on
  revamped/assault content; the Wowhead tooltip *under*-reports). The `--find-gaps`
  completeness tool now bakes this in and only auto-confirms a daily when the sources
  agree. Added `audit-full-catalog.js` (retail-existence sweep) and the No-Reputation
  audit pipeline. All dev-only, outside the shipped addon.

## [0.5.1] - 2026-06-20

A **detail-panel & rewards** release. The detail panel now shows **reputation and
honor rewards** — sourced first-party from Blizzard — and renders live reward data
(with item icons) in preference to baked text. Several layout bugs are fixed, and
the reputation/honor data was backfilled across the whole catalog.

### Added
- **Reputation rewards.** The detail panel now shows a **Reputation** section.
  *Major (renown) factions* — Dragonflight/War Within/Midnight, e.g. *Flame's
  Radiance* — are read **live** from the in-game API
  (`C_QuestLog.GetQuestLogMajorFactionReputationRewards`); *classic factions* —
  which the in-game API does **not** expose — fall back to data baked from
  Blizzard's Game Data API (`rewards.reputations[]`). Rendered as `+N Faction`,
  one line per faction.
- **Honor rewards.** PvP dailies now show an **Honor** line. Honor reads live from
  `GetQuestLogRewardHonor` and is also baked from the Game Data API; honor that the
  old wiki data had buried inside reward/reputation strings (e.g. `"209 honor"`) is
  now salvaged onto the proper Honor line.

### Changed
- **Live rewards preferred (with icons).** The panel now renders Blizzard's **live**
  reward data — which carries item **icons and quality colors** — in preference to
  the icon-less baked/wiki text, upgrading automatically the moment the async load
  lands. Each section (objectives / rewards / reputation) falls back to baked data
  independently, so nothing is blank on first paint.
- **Quest rows indent to their parent.** Nested quests are now inset one step past
  their section header, so a zone's quests sit under that zone (and sub-zone quests
  under the sub-zone) instead of lining up with the expansion above them.

### Fixed
- **Detail-panel layout.** Removed a misplaced `Details:` header that rendered
  *below* the giver/description, and a **duplicate `Rewards` header** (the section
  showed "Rewards" then "Rewards:"). Reward sub-sections are now consistent.
- **Reputation/honor no longer shadowed.** Reputation is resolved across **all**
  baked sources (`bestReputation`), so a cached live-harvested description no longer
  hides the reputation that lives in the wiki detail table.

### Data
- **Reputation + honor backfilled from Blizzard's Game Data API** across the whole
  catalog: **942** quests gained clean structured reputation (`rep={{n,v},…}`),
  **40** major-faction strings were preserved as live-fallbacks, **2** honor values
  were baked, and **173 stub entries** were added for tracked quests that had rep in
  Blizzard's data but no detail entry — so every tracked daily/weekly that grants
  reputation now shows it. The 70 remaining un-cached quests were fetched to
  complete the cache.
- **De-duplicated `WikiDetails.lua`.** Removed **15** quest IDs that were defined
  twice (faction cross-contamination, patch-update drift such as Cairne → **Baine**
  Bloodhoof, and a few genuinely different quests mis-keyed to one ID). Each was
  adjudicated against Blizzard's canonical API data; the catalog now has no
  duplicate IDs.

### Dev / tooling
- The Blizzard Game Data API credentials now live in `_generator/.env` (gitignored,
  auto-loaded by `load-env.js`), so the API tooling runs without re-exporting them.
  Added `backfill-reputation.js`. Also corrected a long-standing bug in the
  generator's `normalize()` that read reputation at the wrong JSON path
  (`reward_reputation.faction.name` instead of `reward.name`) — which is why
  reputation had never been baked despite the API providing it all along.

## [0.5.0] - 2026-06-20

A **data-integrity & feature** release. A full multi-source verification of the
quest catalog removed one-time quests the retired harvester had wrongly ingested
as dailies, and the tracker now **distinguishes Weekly quests from Dailies**.

### Added
- **Weekly quest support.** Quests carry a new `freq` field (`"daily"` by default,
  or `"weekly"`), and weekly quests now show a distinct **gold "Weekly" tag** on
  their row (taking priority over the kind tag) so the daily-vs-weekly split reads
  at a glance. A full-catalog wiki pass identified the **6 weekly quests** in the
  catalog (incl. *Defender of the Flame* and the Siren Isle weeklies) and stamped
  them; everything else is daily. The reset countdown is now **frequency-aware**
  (`GetSecondsUntilReset("weekly")` returns the weekly reset). Completion tracking
  needed no new logic — the game resets weeklies on the weekly timer natively and
  the addon reads completion live.

### Changed
- **Multi-source daily/weekly verification.** Establishing whether a quest is
  actually a repeatable daily/weekly turned out to need **three live sources**, not
  one: the Wowhead tooltip endpoint (`nether.wowhead.com`) plus the two community
  wikis (**warcraft.wiki.gg** and **wowpedia.fandom.com**, read as raw wikitext).
  No single source is complete — the Blizzard Game Data API's `is_daily` flag
  proved **unreliable** (it both misses long-standing dailies and carried stale
  pre-launch/PTR flags), and the Wowhead tooltip under-reports modern world-state
  "soft" dailies. A quest is kept when **any** id-matched source confirms it as
  daily/weekly. The full ~2,030-quest catalog was re-checked this way.

### Removed
- **One-time quests the harvester mis-ingested as dailies.** Three verified passes
  removed **91 non-daily entries** from `ChecklistDataExtra.lua` (665 → 574): the
  36-quest **"Saltheril's Haven"** Midnight storyline (the bug that kicked this
  off — *A Bit of Bloodthistle* et al.), then **18**, then **37** more confirmed
  one-time quests (Dragonflight "Specialized Secrets" profession quests, MoP "Work
  Order" / "Aid the …" entries, Zereth Mortis and Dragonbane Keep campaign quests).
  Each removal was triangulated against the live sources above; the detailed list
  is retained for review. Orphaned descriptions were pruned from `ApiDetails.lua`
  to match.
- **The retired generator toolchain.** The dead catalog-*generation* scripts
  (`build-checklist-from-wiki.js`, `build-gap-entries.js`, `build-from-harvest.js`,
  `build-chains.js`, and other one-offs) and their wiki/gap caches were deleted.
  The API/DB2 **verification** tooling and the cached Blizzard API responses are
  preserved. (Dev-only; never part of the shipped addon.)

### Fixed
- **Story quests no longer appear as dailies.** *A Bit of Bloodthistle* and the
  rest of the Midnight Eversong Woods "Saltheril's Haven" chain — one-time campaign
  quests — were incorrectly listed in the daily tracker and are now gone.

## [0.4.6] - 2026-06-19

A **bug-fix** release that finishes off the detail-panel objectives loading the
0.4.5 fix only partially solved: objectives now appear on the **first** open of a
quest — no more clicking away and back — and the brief placeholder flash while
they load is gone.

### Fixed
- **Objectives now load on the first open (for real this time).** Opening a daily
  you haven't picked up could still show the "Objectives become available once you
  pick this quest up in-game" note until you navigated to another quest and back.
  Root cause: the panel's "is this quest's data already cached?" check treated a
  bare progress count (`0/8` with no text) as if the objectives were loaded, so it
  **skipped the server request entirely** — meaning the load event that drives the
  re-render never fired. The check now requires real objective *text*, so the load
  is requested up front and the panel refreshes the moment the objectives arrive.
- **No more placeholder flash.** While a quest's objectives are still streaming in,
  the panel now shows a neutral **"Loading objectives…"** instead of flashing the
  definitive "pick it up in-game" note for a split second before the real
  objectives appear. The definitive note is shown only after the load finishes and
  the quest genuinely has no objective text. A short bounded poll (≈2s) re-renders
  as soon as the text lands, then stops on its own.

### Docs
- **architecture.md** corrected: the main-window description was updated from the
  old "flat dark panel" to the current themed look (gradients/bevels), and now
  documents the third-level **sub-zone** nesting and all three title-bar buttons
  (Pinned / Filters / Settings gear).

## [0.4.5] - 2026-06-19

A **navigation & polish** release: the list now nests a third level deep —
**sub-zones within zones** (e.g. *Molten Front* inside *Mount Hyjal*) — sections
**start collapsed** so you drill into just what you need, the detail panel loads
objectives and flavor text reliably, and a broad accuracy pass cleared the
"Various" zone bucket and backfilled missing quest descriptions.

### Added
- **Sub-zone sub-sections.** Quests whose giver sits in a named sub-zone now nest
  in their own collapsible section *within* the parent zone, **indented a step** so
  they read as belonging there. Shipped for **7 sub-zones / 185 quests**: Molten
  Front (Mount Hyjal), Argent Tournament Grounds (Icecrown), Lion's Landing &
  Domination Point (Krasarang Wilds), Shrine of Seven Stars & Shrine of Two Moons
  (Vale of Eternal Blossoms), and Little Scales Daycare (Valdrakken).
- **Quest descriptions backfilled.** ~86 dailies that shipped without flavor text
  now have it (sourced from warcraft.wiki.gg), bringing description coverage to
  **2,115 / 2,122 tracked quests (99.7%)** — the remaining few genuinely have no
  in-game offer text.
- **More giver coordinates.** The Argent Tournament Horde givers, the Firelands
  Sanctuary-of-Malorne dailies, and others gained verified giver coordinates, so
  **Shift+Left-click drops a TomTom waypoint** where it previously couldn't.

### Changed
- **Sections start collapsed** on the **All** and **Browse** tabs — every section
  and sub-section — so the list opens compact. Your manual toggles and the
  expand/collapse-all button still work and persist (expand-all opens everything in
  one click). The **Current Zone** tab stays open.
- **Detail-panel breadcrumb split across three lines** — Faction / Expansion /
  Continent | Zone — for easier reading.
- **"Various"-zone cleanup.** ~80 dailies left the placeholder "Various" bucket for
  their real giver zone — Argent Tournament → **Icecrown**, Dalaran fishing →
  **Dalaran**, the Landfall campaign → **Krasarang Wilds** (with corrected
  coordinates), Firelands Invasion → **Mount Hyjal**, Razgar → **Orgrimmar**,
  the Alegorn/Astaia cooking & fishing dailies → **Darnassus**, and more (all
  Wowhead-verified). The MoP "A Worthy Challenge" dungeon dailies now group under
  the **shrine where you pick them up** (Vale of Eternal Blossoms) instead of their
  target dungeon.

### Fixed
- **Objectives load on first open.** The detail panel no longer shows the "pick
  this quest up" placeholder until you click away and back — it requests the quest's
  objectives up front and refreshes as soon as they arrive.
- **TomTom "not installed" false alarm.** A Lua multi-return bug made *every*
  waypoint failure read as "TomTom isn't installed"; the correct message (and the
  waypoint itself, for quests with known giver coordinates) now works.

## [0.4.4] - 2026-06-19

A **data-accuracy** release: the Browse tab's **World / Continent sorting** now
follows real geography, the **"Other / Unknown"** bucket is eliminated, duplicate
quest IDs are corrected, and the Burning Crusade dailies gained giver coordinates —
all cross-checked against Wowhead.

### Added
- **66 missing dailies promoted into the catalog.** Harvested dailies the master
  list didn't carry — and that fell into Browse's **"Other / Unknown"** bucket —
  are now first-class entries sorted by their real zone: the TBC heroic-dungeon
  **WANTED** bounties (Shattrath City), **Shattered Sun Offensive** (Isle of
  Quel'Danas), the **Argent Tournament** set (Icecrown), Cataclysm **Stormwind
  fishing**, **Molten Front** (Mount Hyjal), **Darkmoon Faire** games, and the MoP
  **Anglers / Ironpaw** dailies. Six multi-city holiday dailies (Pilgrim's Bounty,
  Hallow's End) now live in **Holidays & Events**.
- **Quest-giver coordinates for the Burning Crusade dailies.** ~33 TBC dailies
  gained giver map coordinates, so **Shift+Left-click drops a TomTom waypoint** at
  the giver where it previously couldn't. New detail records were also created for
  several TBC quests that had none, with their givers identified.

### Changed
- **World / Continent sorting now follows geography, not the expansion tag.** A
  quest's continent is resolved from its **zone** instead of the expansion that
  introduced it, so dailies set in old-world zones no longer misfile — e.g. a
  **Dragonflight skyriding race in Hellfire Peninsula** now sorts under **Outland**
  instead of the Dragon Isles, TWW races in Northrend zones sort under
  **Northrend**, and Midnight-tagged Eversong Woods quests leave the catch-all
  bucket for **Eastern Kingdoms**. Duplicate-named zones (Shadowmoon Valley,
  Nagrand, Dalaran) are disambiguated by expansion. ~315 entries across 70
  zone-groups were re-bucketed. Holiday dailies stay grouped under **Holidays &
  Events** rather than scattering to the zone they occupy.

### Fixed
- **The "Other / Unknown" Browse bucket is gone** (was 68 dailies) — every one now
  sorts to a real continent and zone (see Added).
- **Duplicate quest IDs.** 14 quest IDs that each pointed at two different quests
  are corrected: faction-paired dailies (Dalaran cooking, WoD garrison fishing)
  re-pointed to their correct per-faction IDs, genuine two-quests-one-ID collisions
  split apart, and stale renamed-quest titles dropped ("Monsterbelly Appetite" is
  now "Disarmed!"; "A Gift for the King of Stormwind" is now "…Emissary of
  Stormwind" since Varian's death).
- **MoP Anglers fishing givers and zones.** Nat Pagle's rare-fish dailies (Flying
  Tiger Gourami, Mimic Octopus, Spinefish Alpha) listed the *fish* as the quest
  giver and "Fishing" as the zone — now correctly **Nat Pagle, Krasarang Wilds**.

## [0.4.3] - 2026-06-18

A polish + data-accuracy release: **TomTom integration**, colored **breadcrumbs**,
a unified **Browse** organization, and a thorough **zone/continent cleanup** that
removes the "Azeroth" pseudo-continent and sorts capital-city dailies and the
whole Firelands Invasion to their real locations (cross-checked against Wowhead).

### Added
- **TomTom integration.** With [TomTom](https://www.curseforge.com/wow/addons/tomtom)
  installed, **Shift+Left Click** a quest drops a TomTom waypoint (with the crazy
  arrow) at its giver. No-op without TomTom (prints an install note). The **Wowhead
  link moved to Shift+Right Click**.
- **Expand / Collapse all on the Browse tab.** The sub-bar toggle now works on
  Browse (zones) as well as the All tab (expansions), operating on whatever
  top-level sections are on screen.
- **Location breadcrumbs.** The Current Zone sub-bar reads **Continent — Zone**
  (continent muted, zone in the blue accent). The detail panel meta line reads
  **Expansion • Continent • Zone**, with the expansion in its All-tab section
  color, and **faction on its own line** above it (Alliance blue / Horde red).

### Changed
- **Unified Browse organization.** The zone normalizer (`ZoneLabel` + aliases)
  moved into Core so the Browse dropdowns, the filter, and the section headers all
  use the **same** names — aliased zones no longer double-list and placeholder
  zones no longer appear as phantom dropdown entries. Per-zone counts now match
  what's shown.
- **"Azeroth" continent removed.** Cataclysm's "Azeroth" stand-in continent is
  gone; its zones now sort to their real continent/island — **Eastern Kingdoms**
  (Twilight Highlands, Hillsbrad, Stormwind City), **Kalimdor** (Mount Hyjal,
  Uldum, Winterspring, Stonetalon, Orgrimmar), and the **Tol Barad** / **Deepholm**
  buckets.
- **Capital-city profession dailies sorted by giver's city.** ~38 cooking/fishing
  dailies that shipped with placeholder zones ("Cooking"/"Fishing"/"Various") now
  group under the city their giver lives in — Stormwind, Orgrimmar, Darnassus,
  Thunder Bluff, Dalaran, Valley of the Four Winds, Krasarang Wilds, or the
  Garrison — confirmed against Wowhead.
- **Themed Settings gear.** The gear button is now a dark themed chip (matching the
  Pinned/Filters buttons) with a tooltip, instead of a bare stock icon.
- **Tidier Filters panel.** The Filters/Settings dropdown sizes its width to its
  contents instead of a fixed, mostly-empty width. Title-bar tooltips now anchor
  above the buttons so they don't cover the list.

### Fixed
- **Firelands Invasion consolidated to Mount Hyjal.** ~35 Firelands/Molten Front
  dailies were scattered across wrong continents and placeholder zones — and 22
  were mis-tagged **Mists of Pandaria** (they're patch 4.2 **Cataclysm**). All are
  now correctly Cataclysm and grouped under **Mount Hyjal** in both Browse and All.
- **Duplicate quest ID fixed.** The catalog had two rows sharing id **29287**; it's
  now **29287 = "Peaked Interest"** and **29289 = "Mother's Malice"** (both real
  4.2 Molten Front dailies).
- **Quest objectives now format correctly.** Wiki-sourced objectives that dumped
  raw image markup (`thumb|…`) and an unsplit `*` list on one line are now parsed
  into a clean objective + indented sub-objectives. For an Available quest the live
  API only returns a bare "0/1" with no description, so the panel shows a clear
  note instead of a meaningless count.

## [0.4.2] - 2026-06-18

A Beta-prep release: a dedicated **Filters** menu, themed UI controls, an
**Expand/Collapse-all** toggle, and a thorough **data-quality pass** that cleans
up phantom "completed" quests. The developer harvester was also moved out of the
shipped addon.

### Added
- **Filters button + panel.** A new **Filters** button on the title bar opens a
  panel of content toggles — **Holiday / Seasonal**, **Profession**, **Battle
  Pet**, **Skyriding** — separate from the gear/Settings panel. The two panels are
  mutually exclusive (opening one closes the other).
- **Expand / Collapse all (All tab).** A toggle at the right of the sub-bar folds
  or unfolds every expansion section at once. Its label flips between
  *Collapse All* and *Expand All* to match the current state.

### Changed
- **Themed UI controls.** The **Pinned** and **Filters** title-bar buttons and the
  **Browse** dropdowns are now custom dark-themed widgets matching the rest of the
  window, replacing the stock gold Blizzard button/dropdown art. The Browse menus
  use a custom popup with hover highlighting and a selection marker (no more
  taint-prone `UIDropDownMenu`).
- **Simpler Filters.** The old Settings list of six "Show …" checkboxes is reduced
  to the four content filters above (in the Filters panel); the **world quests**
  and **inactive world quests** toggles were removed. Genuine world quests are now
  always hidden (Blizzard tracks them natively); the Settings panel keeps only the
  *Newest expansions first* sort.
- **All-tab summary.** The sub-bar now reads *N quests, M completed* instead of
  *N quests, M discovered* — "discovered" had become meaningless now that the
  catalog ships real quest IDs for nearly every entry.

### Fixed
- **Phantom "completed" quests removed.** The All tab counted many quests as
  completed that you'd never done this reset — they were one-time-completion
  quests permanently flagged by the game. Cleaned up across three sources:
  - **Gap batch reviewed (`ChecklistDataExtra.lua`, 650 → 600).** Removed the WoD
    garrison stable "X Training: Y" one-time quests and a dev placeholder; fixed
    ~280 skyriding races' expansion tags; resolved 95 expansion misclassifications
    (e.g. Eversong dailies → Midnight, Twilight Highlands → Cataclysm) where a
    reused zone name had skewed the guess.
  - **Curated ID bugs corrected.** *Tending the Garden* (28733 → 28751), *Angler's
    Challenge* (74908 → 74119) and *Filming the Caldera* (74908 → 74389) pointed at
    the wrong quest IDs, so they resolved completion against the wrong quest.
  - **Calling parents dropped.** The four covenant *"A Calling in …"* parent quests
    flagged complete permanently; removed from the world-quest catalog (the 97 real
    rotating callings stay).

### Developer
- **Harvester un-shipped.** `Core/Harvester.lua` and `UI/HarvestPanel.lua` (the
  **Tools** button + `/qt harvest` dev tooling) were moved out of the addon to a
  sibling `_harvester/` folder, so they no longer ship to end users. The engine is
  still reachable for data baking by dropping the files back in.
- **Generators hardened.** `build-gap-entries.js` now excludes one-time/placeholder
  quests, fixes race typing/expansion, and uses the addon's authoritative ID bands;
  `build-db2-catalog.js` drops the permanently-flagged Calling parents. Added a
  read-only `review-gap-entries.js` audit tool. Added a repo `.gitignore` that keeps
  AI-agent files out of commits.

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
