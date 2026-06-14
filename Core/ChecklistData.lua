-- ChecklistData.lua
-- The "master checklist": the universe of known daily quests by NAME, sourced
-- from warcraft.wiki.gg's List of daily quests. These have no quest IDs -- the
-- addon links each title to its real quest ID at runtime, learned from live play
-- (see Checklist.lua + the learner in QuestLog.lua). Titles are stored exactly
-- as the wiki lists them; the engine normalizes wiki disambiguators such as
-- " (quest)" or " (Horde)" away when matching against in-game quest titles.
--
-- Line format (pipe-delimited so commas inside titles are safe):
--   EXPANSION|TYPE|CATEGORY|SIDE|TITLE
--     EXPANSION = catalog key (TBC, WRATH, CATA, MOP, ...)
--     TYPE      = Profession | Faction | PvP | Dungeon | Event | Other
--     CATEGORY  = sub-group (profession, reputation, event, hub, ...)
--     SIDE      = A (Alliance) | H (Horde) | B (Both)
--     TITLE     = quest title, verbatim from the wiki
--
-- To add quests: append lines below. Blank lines and lines starting with # are
-- ignored. This is a FIRST IMPORT (TBC-MoP) and is meant to be verified/expanded.
local addonName, DT = ...

-- Map the wiki's expansion tags to our Constants.lua keys.
local EXP = { TBC="TBC", WotLK="WRATH", Cata="CATA", MoP="MOP", WoD="WOD",
              Legion="LEGION", BfA="BFA", SL="SHADOWLANDS", DF="DRAGONFLIGHT",
              TWW="TWW", Other="OTHER" }

local SIDE = { A="Alliance", H="Horde", B="Both" }

-- The raw data. Kept as one string and parsed once at load.
local RAW = [[
# ===== PROFESSION =====
CATA|Profession|Fishing|B|Big Gulp
CATA|Profession|Fishing|B|Cold Water Fishing
CATA|Profession|Fishing|B|A Slippery Snack
CATA|Profession|Fishing|B|Diggin' For Worms
CATA|Profession|Fishing|B|Fish fer Squrky
CATA|Profession|Fishing|B|An Old Favorite
CATA|Profession|Fishing|B|Hitting a Walleye
CATA|Profession|Fishing|B|Live Bait
CATA|Profession|Fishing|B|Happy as a Clam Digger
CATA|Profession|Fishing|B|Rock Lobster (quest)
CATA|Profession|Fishing|B|One fer the Ages
CATA|Profession|Fishing|B|Stocking Up (Fishing)
CATA|Profession|Fishing|B|Thunder Falls (quest)
CATA|Profession|Fishing|B|The Gnomish Bait-o-Matic
CATA|Profession|Fishing|B|The Sister's Pendant
CATA|Profession|Fishing|B|A Furious Catch
CATA|Profession|Fishing|B|Fish Head
CATA|Profession|Fishing|B|Craving Crayfish
CATA|Profession|Fishing|B|A Golden Opportunity
CATA|Profession|Fishing|B|Like Pike?
CATA|Profession|Fishing|B|Pond Predators
CATA|Profession|Fishing|B|A Staggering Effort
CATA|Profession|Fishing|B|Moat Monster!
CATA|Profession|Fishing|B|Shiny Baubles
CATA|Profession|Fishing|B|Clammy Hands
CATA|Profession|Fishing|B|Tadpole Terror
CATA|Profession|Fishing|B|The Race to Restock
CATA|Profession|Fishing|B|No Dumping Allowed
CATA|Profession|Fishing|B|Time for Slime
CATA|Profession|Fishing|B|The Ring's the Thing
TBC|Profession|Fishing|B|Shrimpin' Ain't Easy
TBC|Profession|Fishing|B|Bait Bandits
TBC|Profession|Fishing|B|The One That Got Away
TBC|Profession|Fishing|B|Felblood Fillet
TBC|Profession|Fishing|B|Crocolisks in the City
WRATH|Profession|Fishing|B|Blood Is Thicker
WRATH|Profession|Fishing|B|Dangerously Delicious
WRATH|Profession|Fishing|B|The Ghostfish
WRATH|Profession|Fishing|B|Jewel Of The Sewers
WRATH|Profession|Fishing|B|Monsterbelly Appetite
MOP|Profession|Cooking|B|Noodle Time
MOP|Profession|Cooking|B|Noodle Time: Bonus
CATA|Profession|Cooking|B|Careful, This Fruit Bites Back
CATA|Profession|Cooking|B|Crawfish Creole
CATA|Profession|Cooking|B|Even Thieves Get Hungry
CATA|Profession|Cooking|B|Everything Is Better with Bacon
CATA|Profession|Cooking|B|Stealing From Our Own
CATA|Profession|Cooking|B|Stealing From Our Own (Troll)
CATA|Profession|Cooking|B|"Magic" Mushrooms
CATA|Profession|Cooking|B|Corn Mash
CATA|Profession|Cooking|B|Mulgore Spice Bread (quest)
CATA|Profession|Cooking|B|Perfectly Picked Portions
CATA|Profession|Cooking|B|Pining for Nuts
CATA|Profession|Cooking|B|Escargot A Go-Go
CATA|Profession|Cooking|B|Fungus Among Us
CATA|Profession|Cooking|B|Lily, Oh Lily
CATA|Profession|Cooking|B|Roach Coach
CATA|Profession|Cooking|B|Would You Like Some Flies With That?
CATA|Profession|Cooking|B|A Fisherman's Feast
CATA|Profession|Cooking|B|Feeling Crabby?
CATA|Profession|Cooking|B|Orphans Like Cookies Too!
CATA|Profession|Cooking|B|Penny's Pumpkin Pancakes
CATA|Profession|Cooking|B|The King's Cider
CATA|Profession|Cooking|B|A Fowl Shortage
CATA|Profession|Cooking|B|A Round for the Guards
CATA|Profession|Cooking|B|Can't Get Enough Spice Bread
CATA|Profession|Cooking|B|I Need to Cask a Favor
CATA|Profession|Cooking|B|Keepin' the Haggis Flowin'
CATA|Profession|Cooking|B|Back to Basics
CATA|Profession|Cooking|B|Remembering the Ancestors
CATA|Profession|Cooking|B|Ribs for the Sentinels
CATA|Profession|Cooking|B|Spice Bread Aplenty
CATA|Profession|Cooking|B|The Secret to Perfect Kimchi
WRATH|Profession|Cooking|B|Infused Mushroom Meatloaf (quest)
WRATH|Profession|Cooking|B|Sewer Stew
WRATH|Profession|Cooking|B|Mustard Dogs!
WRATH|Profession|Cooking|B|Convention at the Legerdemain
WRATH|Profession|Cooking|B|Cheese for Glowergold
TBC|Profession|Cooking|B|Manalicious
TBC|Profession|Cooking|B|Revenge is Tasty
TBC|Profession|Cooking|B|Soup for the Soul
TBC|Profession|Cooking|B|Super Hot Stew
CATA|Profession|Jewelcrafting|B|A Present for Lila
CATA|Profession|Jewelcrafting|B|Elemental Goo (quest)
CATA|Profession|Jewelcrafting|B|Nibbler! No!
CATA|Profession|Jewelcrafting|B|Ogrezonians in the Mood
CATA|Profession|Jewelcrafting|B|The Latest Fashion!
WRATH|Profession|Jewelcrafting|B|Shipment: Blood Jade Amulet
WRATH|Profession|Jewelcrafting|B|Shipment: Bright Armor Relic
WRATH|Profession|Jewelcrafting|B|Shipment: Glowing Ivory Figurine
WRATH|Profession|Jewelcrafting|B|Shipment: Intricate Bone Figurine
WRATH|Profession|Jewelcrafting|B|Shipment: Shifting Sun Curio
WRATH|Profession|Jewelcrafting|B|Shipment: Wicked Sun Brooch
MOP|Profession|Archaeology|B|Uncovering the Past (Vale of Eternal Blossoms)
MOP|Profession|Archaeology|B|Research Project: The Mogu Dynasties

# ===== FACTION =====
TBC|Faction|Sha'tari Skyguard|B|Fires Over Skettis
TBC|Faction|Sha'tari Skyguard|B|Escape from Skettis
TBC|Faction|Ogri'la|B|The Relic's Emanation
TBC|Faction|Ogri'la|B|Banish More Demons
TBC|Faction|Sha'tari Skyguard|B|Bomb Them Again!
TBC|Faction|Sha'tari Skyguard|B|Wrangle More Aether Rays!
TBC|Faction|Netherwing|B|A Slow Death
TBC|Faction|Netherwing|B|Nethercite Ore (quest)
TBC|Faction|Netherwing|B|Netherdust Pollen (quest)
TBC|Faction|Netherwing|B|Nethermine Flayer Hide (quest)
TBC|Faction|Netherwing|B|Netherwing Crystals
TBC|Faction|Netherwing|B|The Not-So-Friendly Skies...
TBC|Faction|Netherwing|B|Picking Up The Pieces...
TBC|Faction|Netherwing|B|Dragons are the Least of Our Problems
TBC|Faction|Netherwing|B|The Booterang: A Cure For The Common Worthless Peon
TBC|Faction|Netherwing|B|Disrupting the Twilight Portal
TBC|Faction|Netherwing|B|The Deadliest Trap Ever Laid (Scryers)
TBC|Faction|Netherwing|B|The Deadliest Trap Ever Laid (Aldor)
TBC|Faction|Shattered Sun Offensive|B|Blast the Gateway
TBC|Faction|Shattered Sun Offensive|B|Blood for Blood (quest)
TBC|Faction|Shattered Sun Offensive|B|Gaining the Advantage
TBC|Faction|Shattered Sun Offensive|B|The Multiphase Survey
TBC|Faction|Shattered Sun Offensive|B|Sunfury Attack Plans (quest)
TBC|Faction|Shattered Sun Offensive|B|Erratic Behavior
TBC|Faction|Shattered Sun Offensive|B|Further Conversions
TBC|Faction|Shattered Sun Offensive|B|The Sanctum Wards
TBC|Faction|Shattered Sun Offensive|B|Arm the Wards!
TBC|Faction|Shattered Sun Offensive|B|The Battle for the Sun's Reach Armory
TBC|Faction|Shattered Sun Offensive|B|The Battle Must Go On
TBC|Faction|Shattered Sun Offensive|B|Distraction at the Dead Scar
TBC|Faction|Shattered Sun Offensive|B|The Air Strikes Must Continue
TBC|Faction|Shattered Sun Offensive|B|Intercepting the Mana Cells
TBC|Faction|Shattered Sun Offensive|B|Maintaining the Sunwell Portal
TBC|Faction|Shattered Sun Offensive|B|Know Your Ley Lines
TBC|Faction|Shattered Sun Offensive|B|Intercept the Reinforcements
TBC|Faction|Shattered Sun Offensive|B|Keeping the Enemy at Bay
TBC|Faction|Shattered Sun Offensive|B|Taking the Harbor
TBC|Faction|Shattered Sun Offensive|B|Crush the Dawnblade
TBC|Faction|Shattered Sun Offensive|B|Making Ready
TBC|Faction|Shattered Sun Offensive|B|Don't Stop Now....
TBC|Faction|Shattered Sun Offensive|B|Ata'mal Armaments
TBC|Faction|Shattered Sun Offensive|B|A Charitable Donation
TBC|Faction|Shattered Sun Offensive|B|Disrupt the Greengill Coast
TBC|Faction|Shattered Sun Offensive|B|Discovering Your Roots
TBC|Faction|Shattered Sun Offensive|B|Rediscovering Your Roots
TBC|Faction|Shattered Sun Offensive|B|Open for Business
WRATH|Faction|Kalu'ak|B|Preparing for the Worst
WRATH|Faction|Kalu'ak|B|Planning for the Future
WRATH|Faction|Kalu'ak|B|The Way to His Heart...
WRATH|Faction|Knights of the Ebon Blade|B|From Their Corpses, Rise!
WRATH|Faction|Knights of the Ebon Blade|B|Intelligence Gathering
WRATH|Faction|Knights of the Ebon Blade|B|Leave Our Mark
WRATH|Faction|Knights of the Ebon Blade|B|No Fly Zone (quest)
WRATH|Faction|Knights of the Ebon Blade|B|Vile Like Fire!
WRATH|Faction|Knights of the Ebon Blade|B|Shoot 'Em Up
WRATH|Faction|Wyrmrest Accord|B|Drake Hunt (daily)
WRATH|Faction|Wyrmrest Accord|B|Defending Wyrmrest Temple
WRATH|Faction|Wyrmrest Accord|B|Aces High! (daily)
WRATH|Faction|Oracles|B|Hand of the Oracles
WRATH|Faction|Oracles|B|Mastery of the Crystals
WRATH|Faction|Oracles|B|Will of the Titans
WRATH|Faction|Oracles|B|Power of the Great Ones
WRATH|Faction|Oracles|B|Appeasing the Great Rain Stone
WRATH|Faction|Oracles|B|A Cleansing Song
WRATH|Faction|Oracles|B|Song of Fecundity
WRATH|Faction|Oracles|B|Song of Reflection
WRATH|Faction|Oracles|B|Song of Wind and Water
WRATH|Faction|Frenzyheart Tribe|B|Frenzyheart Champion
WRATH|Faction|Frenzyheart Tribe|B|Kartak's Rampage
WRATH|Faction|Frenzyheart Tribe|B|Tools of War
WRATH|Faction|Frenzyheart Tribe|B|Secret Strength of the Frenzyheart (quest)
WRATH|Faction|Frenzyheart Tribe|B|A Hero's Headgear
WRATH|Faction|Frenzyheart Tribe|B|Chicken Party!
WRATH|Faction|Frenzyheart Tribe|B|Rejek: First Blood
WRATH|Faction|Frenzyheart Tribe|B|Strength of the Tempest
WRATH|Faction|Frenzyheart Tribe|B|The Heartblood's Strength
WRATH|Faction|Sons of Hodir|B|Hodir's Call
WRATH|Faction|Sons of Hodir|B|Feeding Arngrim
WRATH|Faction|Sons of Hodir|B|Hot and Cold
WRATH|Faction|Sons of Hodir|B|A Viscous Cleaning
WRATH|Faction|Sons of Hodir|B|Spy Hunter
WRATH|Faction|Sons of Hodir|B|How To Slay Your Dragon
WRATH|Faction|Valiance Expedition|A|Break the Blockade
WRATH|Faction|Valiance Expedition|A|Assault by Air
WRATH|Faction|Valiance Expedition|A|Assault by Ground
WRATH|Faction|Valiance Expedition|A|Blood of the Chosen
WRATH|Faction|Valiance Expedition|A|Capture More Dispatches
WRATH|Faction|Valiance Expedition|A|King of the Mountain (quest)
WRATH|Faction|Valiance Expedition|A|Blackriver Skirmish
WRATH|Faction|Valiance Expedition|A|Life or Death
WRATH|Faction|Valiance Expedition|A|Kick 'Em While They're Down
WRATH|Faction|Explorer's League|A|Steel Gate Patrol
WRATH|Faction|Frostborn|A|Pushed Too Far
WRATH|Faction|Warsong Offensive|H|Keep 'Em on Their Heels
WRATH|Faction|Warsong Offensive|H|Making Repairs
WRATH|Faction|Warsong Offensive|H|Overwhelmed!
WRATH|Faction|Warsong Offensive|H|Shred the Alliance
WRATH|Faction|Warsong Offensive|H|Assault by Air
WRATH|Faction|Warsong Offensive|H|Assault by Ground
WRATH|Faction|Warsong Offensive|H|Blood of the Chosen
WRATH|Faction|Warsong Offensive|H|Keeping the Alliance Blind
WRATH|Faction|Warsong Offensive|H|King of the Mountain (quest)
WRATH|Faction|Argent Crusade|B|Slaves to Saronite
WRATH|Faction|Argent Crusade|B|Troll Patrol
WRATH|Faction|Argent Crusade|B|Troll Patrol: Can You Dig It?
WRATH|Faction|Argent Crusade|B|Troll Patrol: High Standards
WRATH|Faction|Argent Crusade|B|Troll Patrol: Something for the Pain
WRATH|Faction|Argent Crusade|B|Troll Patrol: Couldn't Care Less
WRATH|Faction|Argent Crusade|B|Troll Patrol: Creature Comforts
WRATH|Faction|Argent Crusade|B|Troll Patrol: Whatdya Want, a Medal?
WRATH|Faction|Argent Crusade|B|Troll Patrol: Done to Death
WRATH|Faction|Argent Crusade|B|Troll Patrol: Intestinal Fortitude
WRATH|Faction|Argent Crusade|B|Troll Patrol: Throwing Down
WRATH|Faction|Argent Crusade|B|Troll Patrol: The Alchemist's Apprentice
WRATH|Faction|Argent Crusade|B|Congratulations!
WRATH|Faction|Argent Crusade|B|Taking Battle To The Enemy
WRATH|Faction|Argent Crusade|B|Among the Champions
WRATH|Faction|Argent Crusade|B|Battle Before The Citadel
WRATH|Faction|Argent Crusade|B|Threat From Above
WRATH|Faction|Argent Crusade|B|Contributin' To The Cause
WRATH|Faction|Sunreavers|H|A Blade Fit For A Champion (Horde Aspirant)
WRATH|Faction|Sunreavers|H|A Blade Fit For A Champion (Horde Valiant)
WRATH|Faction|Silver Covenant|A|A Blade Fit For A Champion (Alliance Aspirant)
WRATH|Faction|Silver Covenant|A|A Blade Fit For A Champion (Alliance Valiant)
WRATH|Faction|Sunreavers|H|The Edge Of Winter (Horde Aspirant)
WRATH|Faction|Sunreavers|H|The Edge Of Winter (Horde Valiant)
WRATH|Faction|Silver Covenant|A|The Edge Of Winter (Alliance Aspirant)
WRATH|Faction|Silver Covenant|A|The Edge Of Winter (Alliance Valiant)
WRATH|Faction|Sunreavers|H|A Worthy Weapon (Horde Aspirant)
WRATH|Faction|Sunreavers|H|A Worthy Weapon (Horde Valiant)
WRATH|Faction|Silver Covenant|A|A Worthy Weapon (Alliance Aspirant)
WRATH|Faction|Silver Covenant|A|A Worthy Weapon (Alliance Valiant)
WRATH|Faction|Sunreavers|B|Training In The Field
WRATH|Faction|Sunreavers|B|Learning The Reins
WRATH|Faction|Sunreavers|B|A Valiant's Field Training
WRATH|Faction|Sunreavers|B|The Grand Melee
WRATH|Faction|Sunreavers|B|At The Enemy's Gates
CATA|Faction|Therazane|B|Beneath the Surface
CATA|Faction|Therazane|B|Lost In The Deeps
CATA|Faction|Therazane|B|Underground Economy
CATA|Faction|Therazane|B|The Restless Brood
CATA|Faction|Therazane|B|Glop, Son of Glop
CATA|Faction|Therazane|B|Fear of Boring
CATA|Faction|Therazane|B|Fungal Fury
CATA|Faction|Therazane|B|Motes
CATA|Faction|Therazane|B|Soft Rock
CATA|Faction|Therazane|B|Through Persistence
CATA|Faction|Ramkahen|B|Thieving Little Pluckers
CATA|Faction|Ramkahen|B|Fire From the Sky (daily)
CATA|Faction|Dragonmaw Clan|H|Another Maw to Feed
CATA|Faction|Dragonmaw Clan|H|Bring Down the High Shaman
CATA|Faction|Dragonmaw Clan|H|Crushing the Wildhammer (daily)
CATA|Faction|Dragonmaw Clan|H|Hook 'em High
CATA|Faction|Dragonmaw Clan|H|Total War (daily)
CATA|Faction|Wildhammer Clan|A|Beer Run
CATA|Faction|Wildhammer Clan|A|Fight Like a Wildhammer (daily)
CATA|Faction|Wildhammer Clan|A|Keeping the Dragonmaw at Bay
CATA|Faction|Wildhammer Clan|A|Never Leave a Dinner Behind (daily)
CATA|Faction|Wildhammer Clan|A|Warlord Halthar is Back
CATA|Faction|Baradin's Wardens|A|A Huge Problem
CATA|Faction|Baradin's Wardens|A|Swamp Bait
CATA|Faction|Baradin's Wardens|A|The Leftovers
CATA|Faction|Baradin's Wardens|A|Clearing the Depths
CATA|Faction|Baradin's Wardens|A|Learning From The Past
CATA|Faction|Baradin's Wardens|A|The Imprisoned Archmage
CATA|Faction|Baradin's Wardens|A|Cursed Shackles (quest)
CATA|Faction|Baradin's Wardens|A|D-Block (quest)
CATA|Faction|Baradin's Wardens|A|Svarnos (quest)
CATA|Faction|Baradin's Wardens|A|Food From Below
CATA|Faction|Baradin's Wardens|A|Prison Revolt
CATA|Faction|Baradin's Wardens|A|The Warden (quest)
CATA|Faction|Hellscream's Reach|H|Claiming The Keep
CATA|Faction|Hellscream's Reach|H|Leave No Weapon Behind
CATA|Faction|Hellscream's Reach|H|Walk A Mile In Their Shoes
CATA|Faction|Hellscream's Reach|H|A Sticky Task
CATA|Faction|Hellscream's Reach|H|Thinning the Brood
CATA|Faction|Hellscream's Reach|H|Finish The Job
CATA|Faction|Hellscream's Reach|H|Magnets, How Do They Work? (quest)
CATA|Faction|Hellscream's Reach|H|First Lieutenant Connor (quest)
CATA|Faction|Hellscream's Reach|H|Salvaging the Remains
CATA|Faction|Hellscream's Reach|H|The Forgotten
CATA|Faction|Hellscream's Reach|H|Boosting Morale
CATA|Faction|Hellscream's Reach|H|Captain P. Harris (quest)
CATA|Faction|Hellscream's Reach|H|Rattling Their Cages
CATA|Faction|Hellscream's Reach|H|Shark Tank
CATA|Faction|Hellscream's Reach|H|Not The Friendliest Town
CATA|Faction|Hellscream's Reach|H|Teach A Man To Fish.... Or Steal
CATA|Faction|Hellscream's Reach|H|Cannonball!
CATA|Faction|Hellscream's Reach|H|Taking the Overlook Back
CATA|Faction|Hellscream's Reach|H|Ghostbuster
CATA|Faction|Hellscream's Reach|H|Bombs Away!
CATA|Faction|Hellscream's Reach|H|WANTED: Foreman Wellson
CATA|Faction|Hellscream's Reach|H|Watch Out For Splinters!
CATA|Faction|Guardians of Hyjal|B|Vigilance on Wings
CATA|Faction|Guardians of Hyjal|B|Between the Trees
CATA|Faction|Guardians of Hyjal|B|The Power of Malorne
CATA|Faction|Guardians of Hyjal|B|Call the Flock
CATA|Faction|Guardians of Hyjal|B|Wings Aflame
CATA|Faction|Guardians of Hyjal|B|Perfecting Your Howl
CATA|Faction|Guardians of Hyjal|B|The Call of the Pack
CATA|Faction|Guardians of Hyjal|B|Punting Season
CATA|Faction|Guardians of Hyjal|B|Echoes of Nemesis
CATA|Faction|Guardians of Hyjal|B|Those Bears Up There
CATA|Faction|Guardians of Hyjal|B|Nature's Blessing (quest)
CATA|Faction|Guardians of Hyjal|B|Rage Against the Flames
CATA|Faction|Guardians of Hyjal|B|Supplies for the Other Side
CATA|Faction|Guardians of Hyjal|B|Aggressive Growth (quest)
CATA|Faction|Guardians of Hyjal|B|Wisp Away
CATA|Faction|Guardians of Hyjal|B|Burn Victims
CATA|Faction|Guardians of Hyjal|B|Hostile Elements
CATA|Faction|Guardians of Hyjal|B|Breach in the Defenses (Molten Front)
CATA|Faction|Guardians of Hyjal|B|The Dogs of War
CATA|Faction|Guardians of Hyjal|B|The Harder They Fall
CATA|Faction|Guardians of Hyjal|B|Traitors Return
CATA|Faction|Guardians of Hyjal|B|The Protectors of Hyjal
CATA|Faction|Guardians of Hyjal|B|Releasing the Pressure
CATA|Faction|Guardians of Hyjal|B|Relieving the Pain
CATA|Faction|Guardians of Hyjal|B|Treating the Wounds
CATA|Faction|Guardians of Hyjal|B|The Forlorn Spire (quest)
CATA|Faction|Guardians of Hyjal|B|Solar Core Destruction
CATA|Faction|Guardians of Hyjal|B|The Wardens are Watching
CATA|Faction|Guardians of Hyjal|B|Pyrorachnophobia
CATA|Faction|Guardians of Hyjal|B|Wicked Webs
CATA|Faction|Guardians of Hyjal|B|Egg-stinction
CATA|Faction|Guardians of Hyjal|B|Enduring the Heat
CATA|Faction|Guardians of Hyjal|B|Strike at the Heart
CATA|Faction|Guardians of Hyjal|B|Fandral's Methods
CATA|Faction|Guardians of Hyjal|B|The Flame Spider Queen
CATA|Faction|Guardians of Hyjal|B|Into the Fire
CATA|Faction|Guardians of Hyjal|B|Flamewakers of the Molten Flow
CATA|Faction|Guardians of Hyjal|B|Fire Flowers
CATA|Faction|Guardians of Hyjal|B|Hounds of Shannox
CATA|Faction|Guardians of Hyjal|B|How Hot
CATA|Faction|Guardians of Hyjal|B|Singed Wings
CATA|Faction|Guardians of Hyjal|B|Peaked Interest
CATA|Faction|Guardians of Hyjal|B|Starting Young
CATA|Faction|Guardians of Hyjal|B|Fire in the Skies
CATA|Faction|Guardians of Hyjal|B|Mother's Malice
CATA|Faction|Guardians of Hyjal|B|Territorial Birds
CATA|Faction|Guardians of Hyjal|B|Some Like It Hot
CATA|Faction|Guardians of Hyjal|B|Steal Magmolias
CATA|Faction|Guardians of Hyjal|B|Embergris
CATA|Faction|Guardians of Hyjal|B|The Bigger They Are (quest)
CATA|Faction|Guardians of Hyjal|B|Bye Bye Burdy
CATA|Faction|Guardians of Hyjal|B|A Bitter Pill
CATA|Faction|Guardians of Hyjal|B|Living Obsidium
CATA|Faction|Guardians of Hyjal|B|Strike at the Heart (Druids of the Talon)
CATA|Faction|Guardians of Hyjal|B|Strike at the Heart (Shadow Wardens)
MOP|Faction|Klaxxi|B|A Little Brain Work
MOP|Faction|Klaxxi|B|An Ancient Empire
MOP|Faction|Klaxxi|B|Bad Genes
MOP|Faction|Klaxxi|B|Brain Food
MOP|Faction|Klaxxi|B|Culling the Swarm
MOP|Faction|Klaxxi|B|Dark Skies (quest)
MOP|Faction|Klaxxi|B|Debugging the Terrace
MOP|Faction|Klaxxi|B|Dreadspinner Extermination
MOP|Faction|Klaxxi|B|Eradicating the Zan'thik
MOP|Faction|Klaxxi|B|Fear Takes Root
MOP|Faction|Klaxxi|B|Free From Her Clutches
MOP|Faction|Klaxxi|B|Infection
MOP|Faction|Klaxxi|B|Kunchong Treats
MOP|Faction|Klaxxi|B|Kypa'rak's Core
MOP|Faction|Klaxxi|B|Meltdown
MOP|Faction|Klaxxi|B|Mistblade Destruction
MOP|Faction|Klaxxi|B|Nope Nope Nope
MOP|Faction|Klaxxi|B|Ordnance Disposal
MOP|Faction|Klaxxi|B|Putting An Eye Out
MOP|Faction|Klaxxi|B|Quiet Now
MOP|Faction|Klaxxi|B|Rampage Against the Machine
MOP|Faction|Klaxxi|B|Sampling the Empire's Finest
MOP|Faction|Klaxxi|B|Sap Tapping
MOP|Faction|Klaxxi|B|Shackles of Manipulation
MOP|Faction|Klaxxi|B|Shortcut to Ruin
MOP|Faction|Klaxxi|B|Sonic Disruption
MOP|Faction|Klaxxi|B|Specimen Request
MOP|Faction|Klaxxi|B|The Fight Against Fear
MOP|Faction|Klaxxi|B|The Matriarch's Maw
MOP|Faction|Klaxxi|B|The Scale-Lord
MOP|Faction|Klaxxi|B|The Warlord's Ashes
MOP|Faction|Klaxxi|B|Vess-Guard Duty
MOP|Faction|Klaxxi|B|Wing Clip (quest)
MOP|Faction|Emperor Shaohao|B|Path of the Mistwalker
MOP|Faction|Order of the Cloud Serpent|B|A Feast for the Senses
MOP|Faction|Order of the Cloud Serpent|B|A Tangled Web
MOP|Faction|Order of the Cloud Serpent|B|Catch!
MOP|Faction|Order of the Cloud Serpent|B|Dark Huntress
MOP|Faction|Order of the Cloud Serpent|B|Disarming the Enemy
MOP|Faction|Order of the Cloud Serpent|B|Emptier Nests
MOP|Faction|Order of the Cloud Serpent|B|Feeding Time (quest)
MOP|Faction|Order of the Cloud Serpent|B|Fragments of the Past (Jade Forest)
MOP|Faction|Order of the Cloud Serpent|B|Just a Flesh Wound
MOP|Faction|Order of the Cloud Serpent|B|Lingering Doubt (quest)
MOP|Faction|Order of the Cloud Serpent|B|Madcap Mayhem
MOP|Faction|Order of the Cloud Serpent|B|Monkey Mischief
MOP|Faction|Order of the Cloud Serpent|B|Needle Me Not
MOP|Faction|Order of the Cloud Serpent|B|On The Prowl
MOP|Faction|Order of the Cloud Serpent|B|Pooped
MOP|Faction|Order of the Cloud Serpent|B|Preservation
MOP|Faction|Order of the Cloud Serpent|B|Restoring the Balance
MOP|Faction|Order of the Cloud Serpent|B|Saving the Serpents
MOP|Faction|Order of the Cloud Serpent|B|Serpent's Scale
MOP|Faction|Order of the Cloud Serpent|B|Slitherscale Suppression
MOP|Faction|Order of the Cloud Serpent|B|Snack Time
MOP|Faction|Order of the Cloud Serpent|B|Sprite Fright
MOP|Faction|Order of the Cloud Serpent|B|Sweet as Honey
MOP|Faction|Order of the Cloud Serpent|B|The Big Brew-haha
MOP|Faction|Order of the Cloud Serpent|B|The Big Kah-Oona
MOP|Faction|Order of the Cloud Serpent|B|The Easiest Way To A Serpent's Heart
MOP|Faction|Order of the Cloud Serpent|B|The Seed of Doubt
MOP|Faction|Order of the Cloud Serpent|B|The Shoe Is On The Other Foot
MOP|Faction|Order of the Cloud Serpent|B|The Sky Race
MOP|Faction|Order of the Cloud Serpent|B|The Trainer's Challenge: Ace Longpaw
MOP|Faction|Order of the Cloud Serpent|B|The Trainer's Challenge: Big Bao
MOP|Faction|Order of the Cloud Serpent|B|The Trainer's Challenge: Ningna Darkwheel
MOP|Faction|Order of the Cloud Serpent|B|The Trainer's Challenge: Qua-Ro Whitebrow
MOP|Faction|Order of the Cloud Serpent|B|The Trainer's Challenge: Suchi the Sweet
MOP|Faction|Order of the Cloud Serpent|B|Thinning The Pack
MOP|Faction|Order of the Cloud Serpent|B|Tiny Treats
MOP|Faction|Order of the Cloud Serpent|B|Weeping Widows
MOP|Faction|Shado-Pan|B|Assault Deadtalker's Plateau
MOP|Faction|Shado-Pan|B|A Morale Victory
MOP|Faction|Shado-Pan|B|Assault Fire Camp Gai-Cho
MOP|Faction|Shado-Pan|B|Born Free
MOP|Faction|Shado-Pan|B|Bronze Claws (quest)
MOP|Faction|Shado-Pan|B|Cheng Bo!
MOP|Faction|Shado-Pan|B|Dark Arts (quest)
MOP|Faction|Shado-Pan|B|Destroy the Siege Weapons!
MOP|Faction|Shado-Pan|B|Egg Rescue!
MOP|Faction|Shado-Pan|B|Friends, Not Food!
MOP|Faction|Shado-Pan|B|Fumigation
MOP|Faction|Shado-Pan|B|Grave Consequences
MOP|Faction|Shado-Pan|B|Illusions Of The Past
MOP|Faction|Shado-Pan|B|In Sprite Of Everything
MOP|Faction|Shado-Pan|B|Little Hatchlings
MOP|Faction|Shado-Pan|B|Onyx Hearts
MOP|Faction|Shado-Pan|B|Riding the Storm
MOP|Faction|Shado-Pan|B|Spirit Dust (quest)
MOP|Faction|Shado-Pan|B|Spiteful Sprites
MOP|Faction|Shado-Pan|B|Sra'vess Wetwork
MOP|Faction|Shado-Pan|B|Target of Opportunity: Sra'thik Hivelord
MOP|Faction|Shado-Pan|B|Target of Opportunity: Sra'thik Swarmlord
MOP|Faction|Shado-Pan|B|The Bigger They Come...
MOP|Faction|Shado-Pan|B|The Deadtalker Cipher
MOP|Faction|Shado-Pan|B|The Enemy of My Enemy... Is Still My Enemy!
MOP|Faction|Shado-Pan|B|The Mogu Menace
MOP|Faction|Shado-Pan|B|Uruk!
MOP|Faction|The Anglers|B|Armored Carp (quest)
MOP|Faction|The Anglers|B|Bright Bait
MOP|Faction|The Anglers|B|Fishing for a Bruising
MOP|Faction|The Anglers|B|Flying Tiger Gourami (quest)
MOP|Faction|The Anglers|B|Huff & Puff
MOP|Faction|The Anglers|B|Jagged Abalone
MOP|Faction|The Anglers|B|Jumping the Shark
MOP|Faction|The Anglers|B|Like Bombing Fish In A Barrel
MOP|Faction|The Anglers|B|Mimic Octopus (quest)
MOP|Faction|The Anglers|B|Piranha!
MOP|Faction|The Anglers|B|Scavenger Hunt
MOP|Faction|The Anglers|B|Shocking! (quest)
MOP|Faction|The Anglers|B|Snapclaw (quest)
MOP|Faction|The Anglers|B|Spinefish Alpha (quest)
MOP|Faction|The Anglers|B|Viseclaw Soup (quest)
MOP|Faction|The Anglers|B|What Lurks Below
MOP|Faction|The Anglers|B|Who Knew Fish Liked Eggs?
MOP|Faction|August Celestials|B|A Blade is a Blade
MOP|Faction|August Celestials|B|Arrows of Fortune
MOP|Faction|August Celestials|B|Behind the Masks
MOP|Faction|August Celestials|B|Champion of Chi-Ji (quest)
MOP|Faction|August Celestials|B|Chasing Hope
MOP|Faction|August Celestials|B|Contending With Bullies
MOP|Faction|August Celestials|B|Dextrous Izissha (quest)
MOP|Faction|August Celestials|B|Ellia Ravenmane (quest)
MOP|Faction|August Celestials|B|Ellia Ravenmane: Redemption
MOP|Faction|August Celestials|B|Ellia Ravenmane: Rematch
MOP|Faction|August Celestials|B|Fallen Sentinels
MOP|Faction|August Celestials|B|Fat Long-Fat (quest)
MOP|Faction|August Celestials|B|Fat Long-Fat: Rematch
MOP|Faction|August Celestials|B|Gifts of the Great Crane
MOP|Faction|August Celestials|B|Hidden Power
MOP|Faction|August Celestials|B|Huck Wheelbarrow (quest)
MOP|Faction|August Celestials|B|In Battle's Shadow
MOP|Faction|August Celestials|B|Julia Bates (quest)
MOP|Faction|August Celestials|B|Kuo-Na Quillpaw (quest)
MOP|Faction|August Celestials|B|Mindel Sunspeaker (quest)
MOP|Faction|August Celestials|B|Minh Do-Tan (quest)
MOP|Faction|August Celestials|B|Paying Tribute
MOP|Faction|August Celestials|B|Round 1: Brewmaster Chani
MOP|Faction|August Celestials|B|Round 1: The Streetfighter
MOP|Faction|August Celestials|B|Round 2: Clever Ashyo & Ken-Ken
MOP|Faction|August Celestials|B|Round 2: Kang Bramblestaff
MOP|Faction|August Celestials|B|Round 3: Master Boom Boom
MOP|Faction|August Celestials|B|Round 3: The Wrestler
MOP|Faction|August Celestials|B|Round 4: Master Windfur
MOP|Faction|August Celestials|B|Round 4: The P.U.G.
MOP|Faction|August Celestials|B|Saving the Sutras
MOP|Faction|August Celestials|B|Students of Chi-Ji
MOP|Faction|August Celestials|B|The Big Guns
MOP|Faction|August Celestials|B|The Darkness Around Us
MOP|Faction|August Celestials|B|The Overwhelming Swarm
MOP|Faction|August Celestials|B|The Shadow of Doubt
MOP|Faction|August Celestials|B|The Siege Swells
MOP|Faction|August Celestials|B|The Torch of Strength
MOP|Faction|August Celestials|B|The Unending Siege
MOP|Faction|August Celestials|B|Thelonius (quest)
MOP|Faction|August Celestials|B|Tukka-Tuk (quest)
MOP|Faction|August Celestials|B|Yan Quillpaw (quest)
MOP|Faction|The Tillers|B|A Gift For Chee Chee
MOP|Faction|The Tillers|B|A Gift For Ella
MOP|Faction|The Tillers|B|A Gift For Fish
MOP|Faction|The Tillers|B|A Gift For Fung
MOP|Faction|The Tillers|B|A Gift For Gina
MOP|Faction|The Tillers|B|A Gift For Haohan
MOP|Faction|The Tillers|B|A Gift For Jogu
MOP|Faction|The Tillers|B|A Gift For Old Hillpaw
MOP|Faction|The Tillers|B|A Gift For Sho
MOP|Faction|The Tillers|B|A Gift For Tina
MOP|Faction|The Tillers|B|A Pumpkin-y Perfume
MOP|Faction|The Tillers|B|Chasing the Chicken
MOP|Faction|The Tillers|B|It's Melon Time
MOP|Faction|The Tillers|B|Money Matters
MOP|Faction|The Tillers|B|Not in Chee-Chee's Backyard
MOP|Faction|The Tillers|B|Pest Problems
MOP|Faction|The Tillers|B|Red Blossom Leeks, You Make the Croc-in' World Go Down
MOP|Faction|The Tillers|B|Simian Sabotage
MOP|Faction|The Tillers|B|Squash Those Foul Odors
MOP|Faction|The Tillers|B|Stalling the Ravage
MOP|Faction|The Tillers|B|Stealing is Bad... Re-Stealing is OK
MOP|Faction|The Tillers|B|That Dangling Carrot
MOP|Faction|The Tillers|B|The Cabbage Test
MOP|Faction|The Tillers|B|The Kunzen Hunter-Chief
MOP|Faction|The Tillers|B|The Kunzen Legend-Chief
MOP|Faction|The Tillers|B|The Lesser of Two Evils
MOP|Faction|The Tillers|B|The Pink Turnip Challenge
MOP|Faction|The Tillers|B|The White Turnip Treatment
MOP|Faction|The Tillers|B|They Don't Even Wear Them
MOP|Faction|The Tillers|B|Water, Water Everywhere
MOP|Faction|The Tillers|B|Weed War II
MOP|Faction|The Tillers|B|Where It Counts
MOP|Faction|The Tillers|B|Which Berries? Witchberries.
MOP|Faction|The Tillers|B|Why Not Scallions?
MOP|Faction|The Tillers|B|You Have to Burn the Ropes
MOP|Faction|Golden Lotus|B|Bloodied Skies
MOP|Faction|Golden Lotus|B|Mantid Under Fire
MOP|Faction|Golden Lotus|B|Roll Club: Serpent's Spine
MOP|Faction|Golden Lotus|B|Survival Ring: Blades
MOP|Faction|Golden Lotus|B|Survival Ring: Flame
MOP|Faction|Golden Lotus|B|The Battle Ring
MOP|Faction|Golden Lotus|B|The Thunder Below
MOP|Faction|Dominance Offensive|H|All Dead, All Dead
MOP|Faction|Dominance Offensive|H|Another One Bites the Dust
MOP|Faction|Dominance Offensive|H|Bilgewater Infiltrators
MOP|Faction|Dominance Offensive|H|Death on Two Legs
MOP|Faction|Dominance Offensive|H|Flash! Aaaaaahhhh!
MOP|Faction|Dominance Offensive|H|Hard Counter
MOP|Faction|Dominance Offensive|H|Good Luck, Have Fun
MOP|Faction|Dominance Offensive|H|Hero Killer (Horde)
MOP|Faction|Dominance Offensive|H|It Is A Mystery (Horde)
MOP|Faction|Dominance Offensive|H|Kick 'em While They're Down
MOP|Faction|Dominance Offensive|H|Krasarang Steampot
MOP|Faction|Dominance Offensive|H|Legacy of Ogudei
MOP|Faction|Dominance Offensive|H|Mystery Meatloaf
MOP|Faction|Dominance Offensive|H|Ogudei's Lieutenants (Horde)
MOP|Faction|Dominance Offensive|H|Precious Resource
MOP|Faction|Dominance Offensive|H|Runnin' On Empty
MOP|Faction|Dominance Offensive|H|Sentry Wards (quest)
MOP|Faction|Dominance Offensive|H|Stacked!
MOP|Faction|Dominance Offensive|H|Storming the Beach (quest)
MOP|Faction|Dominance Offensive|H|Tear It Up
MOP|Faction|Dominance Offensive|H|The Spirit Trap (Horde)
MOP|Faction|Dominance Offensive|H|Universal Remote-Explode
MOP|Faction|Dominance Offensive|H|WANTED: Chief Engineer Cogwrench
MOP|Faction|Dominance Offensive|H|WANTED: Lieutenant Ethan Jacobson
MOP|Faction|Dominance Offensive|H|We Require More Minerals!
MOP|Faction|Dominance Offensive|H|We're Not Monsters!
MOP|Faction|Dominance Offensive|H|Worker Harassment
MOP|Faction|Operation: Shieldwall|A|A Kind of Magic
MOP|Faction|Operation: Shieldwall|A|Attack! Move!
MOP|Faction|Operation: Shieldwall|A|Burn Out!
MOP|Faction|Operation: Shieldwall|A|Circle of Life (quest)
MOP|Faction|Operation: Shieldwall|A|Dis-Assembly Required
MOP|Faction|Operation: Shieldwall|A|Eviction Notice
MOP|Faction|Operation: Shieldwall|A|Hammer to Fall
MOP|Faction|Operation: Shieldwall|A|Hero Killer (Alliance)
MOP|Faction|Operation: Shieldwall|A|It Is A Mystery (Alliance)
MOP|Faction|Operation: Shieldwall|A|It's Only Right
MOP|Faction|Operation: Shieldwall|A|Necessary Breaks
MOP|Faction|Operation: Shieldwall|A|Ogudei's Lieutenants (Alliance)
MOP|Faction|Operation: Shieldwall|A|Oi Ain't Afraid o' No Ghosts!
MOP|Faction|Operation: Shieldwall|A|Resource Gathering
MOP|Faction|Operation: Shieldwall|A|Shackles of the Past
MOP|Faction|Operation: Shieldwall|A|Siege Damage
MOP|Faction|Operation: Shieldwall|A|Supply Block
MOP|Faction|Operation: Shieldwall|A|The Only Good Goblin...
MOP|Faction|Operation: Shieldwall|A|The Spirit Trap (Alliance)
MOP|Faction|Operation: Shieldwall|A|Tower Defense (quest)
MOP|Faction|Operation: Shieldwall|A|Two Step Program
MOP|Faction|Operation: Shieldwall|A|Under Pressure
MOP|Faction|Operation: Shieldwall|A|Undermining the Under Miner
MOP|Faction|Operation: Shieldwall|A|We Will Rock You

# ===== PvP =====
WRATH|PvP|Grizzly Hills|B|Blackriver Brawl
WRATH|PvP|Grizzly Hills|B|Blackriver Skirmish
TBC|PvP|Alterac Valley|B|Call to Arms: Alterac Valley
TBC|PvP|Arathi Basin|B|Call to Arms: Arathi Basin
TBC|PvP|Eye of the Storm|B|Call to Arms: Eye of the Storm
TBC|PvP|Warsong Gulch|B|Call to Arms: Warsong Gulch
WRATH|PvP|Grizzly Hills|B|Crush Captain Brightwater!
WRATH|PvP|Grizzly Hills|B|Down With Captain Zorna!
WRATH|PvP|Grizzly Hills|B|Keep 'Em on Their Heels
WRATH|PvP|Grizzly Hills|B|Keep Them at Bay
WRATH|PvP|Grizzly Hills|B|Kick 'Em While They're Down
WRATH|PvP|Icecrown|B|King of the Mountain (quest)
WRATH|PvP|Icecrown|B|Make Them Pay!
WRATH|PvP|Grizzly Hills|B|Making Repairs
WRATH|PvP|Icecrown|B|No Mercy!
WRATH|PvP|Grizzly Hills|B|Overwhelmed!
WRATH|PvP|Grizzly Hills|B|Pieces Parts
WRATH|PvP|Grizzly Hills|B|Riding the Red Rocket
WRATH|PvP|Grizzly Hills|H|Shred the Alliance
WRATH|PvP|Grizzly Hills|B|Shredder Repair
WRATH|PvP|Grizzly Hills|B|Smoke 'Em Out
TBC|PvP|Terokkar Forest|B|Spirits of Auchindoun
TBC|PvP|Hellfire Peninsula|A|Hellfire Fortifications (Alliance daily)
TBC|PvP|Hellfire Peninsula|H|Hellfire Fortifications (Horde daily)
TBC|PvP|Nagrand|B|In Defense of Halaa
TBC|PvP|Nagrand|B|Enemies, Old and New

# ===== DUNGEON =====
TBC|Dungeon|Wanted|B|WANTED: Arcatraz Sentinels
TBC|Dungeon|Wanted|B|WANTED: Coilfang Myrmidons
TBC|Dungeon|Wanted|B|WANTED: Malicious Instructors
TBC|Dungeon|Wanted|B|WANTED: Rift Lords
TBC|Dungeon|Wanted|B|WANTED: Shattered Hand Centurions
TBC|Dungeon|Wanted|B|WANTED: Sisters of Torment
TBC|Dungeon|Wanted|B|WANTED: Sunseeker Channelers
TBC|Dungeon|Wanted|B|WANTED: Tempest-Forge Destroyers
TBC|Dungeon|Wanted|B|WANTED: Nazan's Riding Crop
TBC|Dungeon|Wanted|B|WANTED: Keli'dan's Feathered Stave
TBC|Dungeon|Wanted|B|WANTED: Bladefist's Seal
TBC|Dungeon|Wanted|B|WANTED: The Heart of Quagmirran
TBC|Dungeon|Wanted|B|WANTED: A Black Stalker Egg
TBC|Dungeon|Wanted|B|WANTED: The Warlord's Treatise
TBC|Dungeon|Wanted|B|WANTED: The Headfeathers of Ikiss
TBC|Dungeon|Wanted|B|WANTED: Shaffar's Wondrous Pendant
TBC|Dungeon|Wanted|B|WANTED: The Exarch's Soul Gem
TBC|Dungeon|Wanted|B|WANTED: Murmur's Whisper
TBC|Dungeon|Wanted|B|WANTED: The Epoch Hunter's Head
TBC|Dungeon|Wanted|B|WANTED: Aeonus's Hourglass
TBC|Dungeon|Wanted|B|WANTED: A Warp Splinter Clipping
TBC|Dungeon|Wanted|B|WANTED: Pathaleon's Projector
TBC|Dungeon|Wanted|B|WANTED: The Scroll of Skyriss
TBC|Dungeon|Wanted|B|WANTED: The Signet Ring of Prince Kael'thas
WRATH|Dungeon|Heroic Daily|B|Timear Foresees Centrifuge Constructs in your Future!
WRATH|Dungeon|Heroic Daily|B|Timear Foresees Infinite Agents in your Future!
WRATH|Dungeon|Heroic Daily|B|Timear Foresees Titanium Vanguards in your Future!
WRATH|Dungeon|Heroic Daily|B|Timear Foresees Ymirjar Berserkers in your Future!
WRATH|Dungeon|Heroic Daily|B|Proof of Demise: Anub'arak
WRATH|Dungeon|Heroic Daily|B|Proof of Demise: The Black Knight
WRATH|Dungeon|Heroic Daily|B|Proof of Demise: Cyanigosa
WRATH|Dungeon|Heroic Daily|B|Proof of Demise: Gal'darah
WRATH|Dungeon|Heroic Daily|B|Proof of Demise: Herald Volazj
WRATH|Dungeon|Heroic Daily|B|Proof of Demise: Ingvar the Plunderer
WRATH|Dungeon|Heroic Daily|B|Proof of Demise: Keristrasza
WRATH|Dungeon|Heroic Daily|B|Proof of Demise: King Ymiron
WRATH|Dungeon|Heroic Daily|B|Proof of Demise: Ley-Guardian Eregos
WRATH|Dungeon|Heroic Daily|B|Proof of Demise: Loken
WRATH|Dungeon|Heroic Daily|B|Proof of Demise: Mal'Ganis
WRATH|Dungeon|Heroic Daily|B|Proof of Demise: The Prophet Tharon'ja
WRATH|Dungeon|Heroic Daily|B|Proof of Demise: Sjonnir The Ironshaper

# ===== EVENT =====
TBC|Event|Brewfest|B|Bark for the Thunderbrews!
TBC|Event|Brewfest|B|Bark for the Barleybrews!
TBC|Event|Brewfest|B|Bark for Drohn's Distillery!
TBC|Event|Brewfest|B|Bark for T'chali's Voodoo Brewery!
TBC|Event|Brewfest|B|Brew For Brewfest
WRATH|Event|Hallow's End|B|Stop the Fires!
WRATH|Event|Hallow's End|B|Smash the Pumpkin
WRATH|Event|Midsummer Fire Festival|B|Summon Ahune
WRATH|Event|Midsummer Fire Festival|B|Striking Back (Ashenvale)
WRATH|Event|Midsummer Fire Festival|B|Striking Back (Desolace)
WRATH|Event|Midsummer Fire Festival|B|Striking Back (Northern Stranglethorn)
WRATH|Event|Midsummer Fire Festival|B|Striking Back (Searing Gorge)
WRATH|Event|Midsummer Fire Festival|B|Striking Back (Silithus)
WRATH|Event|Midsummer Fire Festival|B|Striking Back (Hellfire Peninsula)
WRATH|Event|Midsummer Fire Festival|B|More Torch Tossing
WRATH|Event|Midsummer Fire Festival|B|More Torch Catching
WRATH|Event|Pilgrim's Bounty|B|Don't Forget The Stuffing!
WRATH|Event|Pilgrim's Bounty|B|Easy As Pie
WRATH|Event|Pilgrim's Bounty|B|We're Out of Cranberry Chutney Again?
WRATH|Event|Pilgrim's Bounty|B|She Says Potato
WRATH|Event|Pilgrim's Bounty|B|Can't Get Enough Turkey
CATA|Event|Darkmoon Faire|B|The Humanoid Cannonball
CATA|Event|Darkmoon Faire|B|Target: Turtle
CATA|Event|Darkmoon Faire|B|He Shoots, He Scores!
CATA|Event|Darkmoon Faire|B|Tonk Commander
CATA|Event|Darkmoon Faire|B|It's Hammer Time

# ===== OTHER =====
WRATH|Other|Grizzly Hills|B|Seared Scourge (Daily)
WRATH|Other|Storm Peaks|B|Overstock
WRATH|Other|Storm Peaks|B|The Aberrations Must Die
WRATH|Other|Storm Peaks|B|Back to the Pit
WRATH|Other|Storm Peaks|B|Defending Your Title
WRATH|Other|Storm Peaks|B|Maintaining Discipline
WRATH|Other|Icecrown|B|No Mercy!
WRATH|Other|Icecrown|B|The Solution Solution
WRATH|Other|Icecrown|A|Retest Now (Alliance daily)
WRATH|Other|Icecrown|A|That's Abominable! (Alliance daily)
WRATH|Other|Icecrown|A|Drag and Drop (Alliance daily)
WRATH|Other|Icecrown|A|Not a Bug (Alliance daily)
WRATH|Other|Icecrown|A|Neutralizing the Plague (Alliance)
WRATH|Other|Icecrown|A|No Rest For The Wicked (Alliance daily)
WRATH|Other|Icecrown|B|Putting the Hertz: The Valley of Lost Hope
WRATH|Other|Icecrown|B|Static Shock Troops: the Bombardment
WRATH|Other|Icecrown|B|Total Ohmage: The Valley of Lost Hope!
WRATH|Other|Icecrown|B|Riding the Wavelength: The Bombardment
WRATH|Other|Icecrown|H|Drag and Drop (Horde daily)
WRATH|Other|Icecrown|H|Keeping the Alliance Blind
WRATH|Other|Icecrown|H|Not a Bug (Horde daily)
WRATH|Other|Icecrown|B|Volatility (daily)
WRATH|Other|Icecrown|H|Neutralizing the Plague (Horde)
WRATH|Other|Icecrown|H|No Rest For The Wicked (Horde daily)
WRATH|Other|Icecrown|H|Retest Now (Horde daily)
WRATH|Other|Icecrown|H|That's Abominable! (Horde daily)
]]

-- Parse RAW into DT.ChecklistData.entries once at load.
DT.ChecklistData = { entries = {} }

local function parse()
    local entries = DT.ChecklistData.entries
    for line in RAW:gmatch("[^\r\n]+") do
        -- Skip comments and blanks.
        local first = line:sub(1, 1)
        if first ~= "#" and line:match("%S") then
            local expTag, qtype, category, side, title =
                line:match("^([^|]*)|([^|]*)|([^|]*)|([^|]*)|(.+)$")
            if title then
                entries[#entries + 1] = {
                    expansion = EXP[expTag] or expTag or "OTHER",
                    type      = qtype,
                    category  = category,
                    side      = SIDE[side] or "Both",
                    rawTitle  = title,
                }
            end
        end
    end
end
parse()

function DT.ChecklistData:Count()
    return #self.entries
end
