-- QuestRewards.lua  (HAND-MAINTAINED -- safe to edit directly)
-- Baked quest titles + rewards + objectives, originally harvested first-party
-- from the live game client by the now-retired _generator/ toolchain. That
-- toolchain is no longer run, so edit this file in place. Loads into
-- DT.BakedDetails; the detail panel reads this when live data isn't cached, so
-- dailies are ready out of the box.
--   b[id] = { n=name, f=faction, m=mapID, k=kind, de=description,
--            r = { c/i/cu = {{n,q,ct,ic}...}, mo, xp, ho }, o = {objective text...} }
local _, DT = ...
DT.BakedDetails = DT.BakedDetails or {}
local b = DT.BakedDetails
b[10106]={n="Hellfire Fortifications",f="Both",k="daily",r={i={{n="Mark of Honor Hold",q=1,ct=3,ic=134502}},mo=78750,xp=35},o={"0/1 Capture The Overlook","0/1 Capture the Stadium","0/1 Capture Broken Hill"}}
b[10110]={n="Hellfire Fortifications",f="Both",k="daily",r={i={{n="Mark of Thrallmar",q=1,ct=3,ic=134504}},mo=78750,xp=35},o={"0/1 Capture The Overlook","0/1 Capture the Stadium","0/1 Capture Broken Hill"}}
b[11008]={n="Fires Over Skettis",f="Both",k="daily",r={mo=105000,xp=45},o={"0/20 Monstrous Kaliri Egg Destroyed"}}
b[11015]={n="Netherwing Crystals",f="Both",k="daily",r={mo=105000,xp=45}}
b[11016]={n="Nethermine Flayer Hide",f="Both",k="daily",r={mo=105000,xp=45}}
b[11017]={n="Netherdust Pollen",f="Both",k="daily",r={mo=105000,xp=45}}
b[11018]={n="Nethercite Ore",f="Both",k="daily",r={mo=105000,xp=45}}
b[11020]={n="A Slow Death",f="Both",k="daily",r={mo=105000,xp=45},o={"0/12 Dragonmaw Peon Camp Poisoned"}}
b[11023]={n="Bomb Them Again!",f="Both",k="daily",r={i={{n="Apexis Shard",q=1,ct=15,ic=133595}},mo=105000,xp=45},o={"0/15 Fel Cannonball Stacks destroyed"}}
b[11035]={n="The Not-So-Friendly Skies...",f="Both",k="daily",r={mo=105000,xp=45}}
b[11051]={n="Banish More Demons",f="Both",k="daily",r={i={{n="Kronk's Grab Bag",q=1,ic=133649},{n="Apexis Shard",q=1,ct=15,ic=133595}},mo=105000,xp=45},o={"0/15 Demons banished"}}
b[11055]={n="The Booterang: A Cure For The Common Worthless Peon",f="Both",k="daily",r={mo=105000,xp=45},o={"0/20 Dragonmaw Peon Disciplined"}}
b[11066]={n="Wrangle More Aether Rays!",f="Both",k="daily",r={i={{n="Apexis Shard",q=1,ct=15,ic=133595}},mo=105000,xp=45},o={"0/5 Aether Rays wrangled"}}
b[11076]={n="Picking Up The Pieces...",f="Both",k="daily",r={mo=210000,xp=55}}
b[11077]={n="Dragons are the Least of Our Problems",f="Both",k="daily",r={mo=105000,xp=45},o={"0/15 Nethermine Flayer slain","0/5 Nethermine Ravager slain"}}
b[11080]={n="The Relic's Emanation",f="Both",k="daily",r={i={{n="Apexis Shard",q=1,ct=15,ic=133595}},mo=78750,xp=35},o={"Apexis Emanations attained"}}
b[11085]={n="Escape from Skettis",f="Both",k="daily",r={mo=78750,xp=35},o={"Rescue the Skyguard Prisoner."}}
b[11086]={n="Disrupting the Twilight Portal",f="Both",k="daily",r={mo=105000,xp=45},o={"0/20 Deathshadow Agent slain"}}
b[11096]={n="Threat from Above",f="Both",k="daily",r={xp=45},o={"0/20 Gordunni Ogre"}}
b[11097]={n="The Deadliest Trap Ever Laid",f="Both",k="daily",r={mo=210000,xp=55},o={"Dragonmaw Forces Defeated"}}
b[11101]={n="The Deadliest Trap Ever Laid",f="Both",k="daily",r={mo=210000,xp=55},o={"Dragonmaw Forces Defeated"}}
b[11153]={n="Break the Blockade",f="Both",k="daily",r={mo=105000,xp=45},o={"0/25 Blockade Pirate slain","0/10 Blockade Cannons destroyed"}}
b[11219]={n="Stop the Fires!",f="Both",k="daily",r={i={{n="Hallow's End Pumpkin Treat",q=1,ct=3,ic=134015},{n="Weighted Jack-o'-Lantern",q=1,ic=133661}},mo=331700,xp=12700},o={"Put Out the Fires"}}
b[11334]={n="He Shoots, He Scores!",f="Both",k="daily"}
b[11338]={n="Call to Arms: Warsong Gulch",f="Both",k="daily",o={"Victory in Warsong Gulch"}}
b[11339]={n="Call to Arms: Arathi Basin",f="Both",k="daily",o={"Victory in Arathi Basin"}}
b[11342]={n="Call to Arms: Warsong Gulch",f="Both",k="daily",o={"Victory in Warsong Gulch"}}
b[11354]={n="WANTED: Nazan's Riding Crop",f="Both",k="daily",r={mo=315000,xp=70}}
b[11362]={n="WANTED: Keli'dan's Feathered Stave",f="Both",k="daily",r={mo=315000,xp=70}}
b[11363]={n="WANTED: Bladefist's Seal",f="Both",k="daily",r={mo=315000,xp=70}}
b[11364]={n="WANTED: Shattered Hand Centurions",f="Both",k="daily",r={i={{n="Ethereum Prison Key",q=2,ic=134889}},mo=210000,xp=45},o={"0/4   slain"}}
b[11368]={n="WANTED: The Heart of Quagmirran",f="Both",k="daily",r={mo=315000,xp=70}}
b[11370]={n="WANTED: The Warlord's Treatise",f="Both",k="daily",r={mo=315000,xp=70}}
b[11371]={n="WANTED: Coilfang Myrmidons",f="Both",k="daily",r={i={{n="Ethereum Prison Key",q=2,ic=134889}},mo=210000,xp=45},o={"0/14 Coilfang Myrmidon slain"}}
b[11372]={n="WANTED: The Headfeathers of Ikiss",f="Both",k="daily",r={mo=315000,xp=70}}
b[11373]={n="WANTED: Shaffar's Wondrous Pendant",f="Both",k="daily",r={mo=315000,xp=70}}
b[11374]={n="WANTED: The Exarch's Soul Gem",f="Both",k="daily",r={mo=315000,xp=70}}
b[11375]={n="WANTED: Murmur's Whisper",f="Both",k="daily",r={mo=315000,xp=70}}
b[11376]={n="WANTED: Malicious Instructors",f="Both",k="daily",r={i={{n="Ethereum Prison Key",q=2,ic=134889}},mo=210000,xp=45},o={"0/3 Malicious Instructor slain"}}
b[11377]={n="Revenge is Tasty",f="Both",k="daily",r={xp=45}}
b[11378]={n="WANTED: The Epoch Hunter's Head",f="Both",k="daily",r={mo=315000,xp=70}}
b[11379]={n="Super Hot Stew",f="Both",k="daily",r={xp=45}}
b[11380]={n="Manalicious",f="Both",k="daily",r={c={{n="Barrel of Fish",q=1,ic=132620},{n="Crate of Meat",q=1,ic=132765}},xp=45}}
b[11381]={n="Soup for the Soul",f="Both",k="daily",r={c={{n="Barrel of Fish",q=1,ic=132620},{n="Crate of Meat",q=1,ic=132765}},xp=45}}
b[11382]={n="WANTED: Aeonus's Hourglass",f="Both",k="daily",r={mo=315000,xp=70}}
b[11383]={n="WANTED: Rift Lords",f="Both",k="daily",r={i={{n="Ethereum Prison Key",q=2,ic=134889}},mo=210000,xp=45},o={"0/4 Rift Lord slain"}}
b[11384]={n="WANTED: A Warp Splinter Clipping",f="Both",k="daily",r={mo=315000,xp=70}}
b[11385]={n="WANTED: Sunseeker Channelers",f="Both",k="daily",r={i={{n="Ethereum Prison Key",q=2,ic=134889}},mo=210000,xp=45},o={"0/6 Sunseeker Channeler slain"}}
b[11386]={n="WANTED: Pathaleon's Projector",f="Both",k="daily",r={mo=315000,xp=70}}
b[11387]={n="WANTED: Tempest-Forge Destroyers",f="Both",k="daily",r={i={{n="Ethereum Prison Key",q=2,ic=134889}},mo=210000,xp=45},o={"0/5 Tempest-Forge Destroyer slain"}}
b[11388]={n="WANTED: The Scroll of Skyriss",f="Both",k="daily",r={mo=315000,xp=70}}
b[11389]={n="WANTED: Arcatraz Sentinels",f="Both",k="daily",r={i={{n="Ethereum Prison Key",q=2,ic=134889}},mo=210000,xp=45},o={"0/5 Arcatraz Sentinel slain"}}
b[11410]={n="The One That Got Away",f="Both",k="daily",r={mo=105000,xp=45},o={"0/1 Frostfin slain"}}
b[11472]={n="The Way to His Heart...",f="Both",k="daily",r={mo=105000,xp=45},o={"Reef Bull led to a Reef Cow"}}
b[11499]={n="WANTED: The Signet Ring of Prince Kael'thas",f="Both",k="daily",r={mo=315000,xp=70}}
b[11500]={n="WANTED: Sisters of Torment",f="Both",k="daily",r={i={{n="Ethereum Prison Key",q=2,ic=134889}},mo=210000,xp=45},o={"0/4 Sister of Torment slain"}}
b[11502]={n="In Defense of Halaa",f="Both",k="daily",r={mo=105000,xp=45},o={"0/10 Halaa Enemy Combatant slain"}}
b[11503]={n="Enemies, Old and New",f="Both",k="daily",r={mo=105000,xp=45},o={"0/10 Halaa Enemy Combatant slain"}}
b[11505]={n="Spirits of Auchindoun",f="Both",k="daily",r={mo=105000,xp=45},o={"Secure a Spirit Tower"}}
b[11506]={n="Spirits of Auchindoun",f="Both",k="daily",r={mo=105000,xp=45},o={"Secure a Spirit Tower"}}
b[11514]={n="Maintaining the Sunwell Portal",f="Both",k="daily",r={i={{n="Shattered Sun Supplies",q=1,ic=133646}},mo=105000,xp=35}}
b[11515]={n="Blood for Blood",f="Both",k="daily",r={mo=105000,xp=45},o={"0/4 Emaciated Felblood slain"}}
b[11516]={n="Blast the Gateway",f="Both",k="daily",r={i={{n="Shattered Sun Supplies",q=1,ic=133646}},mo=105000,xp=35},o={"Legion Gateway Destroyed"}}
b[11521]={n="Rediscovering Your Roots",f="Both",k="daily",r={i={{n="Shattered Sun Supplies",q=1,ic=133646}},mo=105000,xp=45}}
b[11523]={n="Arm the Wards!",f="Both",k="daily",r={mo=78750,xp=35},o={"Energize a Crystal Ward"}}
b[11525]={n="Further Conversions",f="Both",k="daily",r={mo=78750,xp=35},o={"0/5 Converted Sentry Deployed"}}
b[11533]={n="The Air Strikes Must Continue",f="Both",k="daily",r={mo=78750,xp=35},o={"0/2 Pit Overlord slain","0/3 Eredar Sorcerer slain","0/12 Wrath Enforcer slain"}}
b[11536]={n="Don't Stop Now....",f="Both",k="daily",r={mo=105000,xp=45}}
b[11537]={n="The Battle Must Go On",f="Both",k="daily",r={mo=105000,xp=35},o={"0/1 Emissary of Hate impaled","0/6 Burning Legion Demon slain"}}
b[11540]={n="Crush the Dawnblade",f="Both",k="daily",r={mo=105000,xp=45},o={"0/6 Dawnblade Summoner slain","0/6 Dawnblade Blood Knight slain","0/3 Dawnblade Marksman slain"}}
b[11541]={n="Disrupt the Greengill Coast",f="Both",k="daily",r={mo=105000,xp=45},o={"0/10 Greengill Slave freed"}}
b[11543]={n="Keeping the Enemy at Bay",f="Both",k="daily",r={xp=45},o={"0/1 Sin'loren sails burned","0/1 Bloodoath sails burned","0/1 Dawnchaser sails burned","0/6 Dawnblade Reservist slain"}}
b[11544]={n="Ata'mal Armaments",f="Both",k="daily",r={mo=210000,xp=55}}
b[11546]={n="Open for Business",f="Both",k="daily",r={i={{n="Bloodberry Elixir",q=1,ic=134734}},mo=105000,xp=45}}
b[11547]={n="Know Your Ley Lines",f="Both",k="daily",r={i={{n="Darnarian's Scroll of Teleportation",q=1,ic=134938}},mo=105000,xp=45},o={"0/1 Portal Reading Taken","0/1 Shrine Reading Taken","0/1 Bloodcrystal Reading Taken"}}
b[11665]={n="Crocolisks in the City",f="Both",k="daily",r={i={{n="Bag of Fishing Treasures",q=1,ic=133642}}}}
b[11666]={n="Bait Bandits",f="Both",k="daily",r={i={{n="Bag of Fishing Treasures",q=1,ic=133642}}}}
b[11667]={n="The One That Got Away",f="Both",k="daily",r={i={{n="Bag of Fishing Treasures",q=1,ic=133642}}}}
b[11668]={n="Shrimpin' Ain't Easy",f="Both",k="daily",r={i={{n="Bag of Fishing Treasures",q=1,ic=133642}}}}
b[11669]={n="Felblood Fillet",f="Both",k="daily",r={i={{n="Bag of Fishing Treasures",q=1,ic=133642}}}}
b[11691]={n="Summon Ahune",f="Both",k="daily",r={mo=331700,xp=12700}}
b[11875]={n="Gaining the Advantage",f="Both",k="daily",r={i={{n="Major Rejuvenation Potion",q=1,ic=134771}},mo=210000,xp=45}}
b[11877]={n="Sunfury Attack Plans",f="Both",k="daily",r={i={{n="Shattered Sun Supplies",q=1,ic=133646}},mo=105000,xp=35}}
b[11880]={n="The Multiphase Survey",f="Both",k="daily",r={mo=78750,xp=35},o={"0/6 Multiphase Readings Taken"}}
b[11919]={n="Drake Hunt",f="Both",k="daily",r={mo=105000,xp=45},o={"0/1 Captured Nexus Drake"}}
b[11921]={n="More Torch Tossing",f="Both",k="daily",r={i={{n="Burning Blossom",q=2,ct=15,ic=135263}},mo=331700,xp=12700},o={"Hit 20 braziers."}}
b[11924]={n="More Torch Catching",f="Both",k="daily",r={i={{n="Burning Blossom",q=2,ct=15,ic=135263}},mo=331700,xp=12700},o={"0/10 Torches caught"}}
b[11940]={n="Drake Hunt",f="Both",k="daily",r={mo=105000,xp=45},o={"0/1 Captured Nexus Drake"}}
b[11945]={n="Preparing for the Worst",f="Both",k="daily",r={mo=105000,xp=45}}
b[11960]={n="Planning for the Future",f="Both",k="daily",r={mo=105000,xp=45}}
b[12029]={n="Seared Scourge",f="Both",k="daily",r={mo=105000,xp=45},o={"0/20 Scourge Trolls Burned"}}
b[12038]={n="Seared Scourge",f="Both",k="daily",r={mo=105000,xp=45},o={"0/30 Scourge Trolls Burned"}}
b[12044]={n="Stocking Up",f="Both",k="daily",r={mo=105000,xp=45}}
b[12133]={n="Smash the Pumpkin",f="Both",k="daily",r={mo=331700,xp=12700}}
b[12170]={n="Blackriver Brawl",f="Both",k="daily",r={mo=105000,xp=45},o={"0/10 Alliance in Blackriver slain"}}
b[12244]={n="Shredder Repair",f="Both",k="daily",r={i={{n="Key to Refurbished Shredder",q=1,ic=134248}},mo=105000,xp=45},o={"0/3 Shredder Delivered"}}
b[12268]={n="Pieces Parts",f="Both",k="daily",r={mo=105000,xp=45}}
b[12270]={n="Shred the Alliance",f="Both",k="daily",r={i={{n="Key to Refurbished Shredder",q=1,ic=134248}},mo=105000,xp=45},o={"0/3 Shredder delivered"}}
b[12280]={n="Making Repairs",f="Both",k="daily",r={mo=105000,xp=45},o={"0/4 Grooved Cog","0/3 Notched Sprocket","0/2 High Tension Spring"}}
b[12284]={n="Keep 'Em on Their Heels",f="Both",k="daily",r={mo=105000,xp=45},o={"0/15 Alliance units eliminated"}}
b[12288]={n="Overwhelmed!",f="Both",k="daily",r={mo=105000,xp=45},o={"0/10 Wounded Skirmishers Healed"}}
b[12289]={n="Kick 'Em While They're Down",f="Both",k="daily",r={mo=105000,xp=45},o={"0/15 Horde units eliminated"}}
b[12296]={n="Life or Death",f="Both",k="daily",r={mo=105000,xp=45},o={"0/10 Westfall Infantry Healed"}}
b[12314]={n="Down With Captain Zorna!",f="Both",k="daily",r={mo=105000,xp=45},o={"0/1 Captain Zorna slain"}}
b[12315]={n="Crush Captain Brightwater!",f="Both",k="daily",r={mo=105000,xp=45},o={"0/1 Captain Brightwater slain"}}
b[12323]={n="Smoke 'Em Out",f="Both",k="daily",r={mo=105000,xp=45},o={"0/20 Venture Company Stragglers smoked out"}}
b[12372]={n="Defending Wyrmrest Temple",f="Both",k="daily",r={mo=105000,xp=45},o={"0/3 Azure Dragon slain","0/5 Azure Drake slain","0/1 Destabilize the Azure Dragonshrine"}}
b[12432]={n="Riding the Red Rocket",f="Both",k="daily",r={mo=105000,xp=45},o={"0/1 Destroyed Alliance Lumber Shipment"}}
b[12437]={n="Riding the Red Rocket",f="Both",k="daily",r={mo=105000,xp=45},o={"0/1 Horde Lumberboat destroyed"}}
b[12444]={n="Blackriver Skirmish",f="Both",k="daily",r={mo=105000,xp=45},o={"0/10 Horde in Blackriver slain"}}
b[12501]={n="Troll Patrol",f="Both",k="daily",r={mo=105000,xp=45},o={"0/1 Captain Brandon's Task","0/1 Captain Rupert's Task","0/1 Captain Grondel's Task","0/1 Alchemist Finklestein's's Task"}}
b[12502]={n="Troll Patrol: High Standards",f="Both",k="daily",r={mo=26250,xp=10},o={"0/1 Argent Crusade Banner South","0/1 Argent Crusade Banner North","0/1 Argent Crusade Banner East"}}
b[12509]={n="Troll Patrol: Intestinal Fortitude",f="Both",k="daily",r={mo=26250,xp=10},o={"0/5 Recruit's Courage Restored"}}
b[12519]={n="Troll Patrol: Whatdya Want, a Medal?",f="Both",k="daily",r={mo=26250,xp=10}}
b[12541]={n="Troll Patrol: The Alchemist's Apprentice",f="Both",k="daily",r={mo=26250,xp=10},o={"0/1 Truth Serum Created"}}
b[12563]={n="Troll Patrol",f="Both",k="daily",r={mo=105000,xp=45},o={"0/1 Captain Brandon's Task","0/1 Captain Rupert's Task","0/1 Captain Grondel's Task","0/1 Alchemist Finklestein's Task"}}
b[12582]={n="Frenzyheart Champion",f="Both",k="daily",r={mo=52500,xp=25}}
b[12587]={n="Troll Patrol",f="Both",k="daily",r={mo=105000,xp=45},o={"0/1 Captain Brandon's Task","0/1 Captain Rupert's Task","0/1 Captain Grondel's Task","0/1 Alchemist Finklestein's Task"}}
b[12689]={n="Hand of the Oracles",f="Both",k="daily",r={mo=52500,xp=25}}
b[12702]={n="Chicken Party!",f="Both",k="daily",r={mo=105000,xp=45}}
b[12704]={n="Appeasing the Great Rain Stone",f="Both",k="daily",r={mo=105000,xp=45}}
b[12705]={n="Will of the Titans",f="Both",k="daily",r={mo=210000,xp=55},o={"0/50 Frenzyheart Attacker slain"}}
b[12726]={n="Song of Wind and Water",f="Both",k="daily",r={mo=105000,xp=45},o={"0/3 Aqueous Spirit devoured","0/3 Storm Revenant devoured"}}
b[12732]={n="The Heartblood's Strength",f="Both",k="daily",r={mo=105000,xp=45}}
b[12735]={n="A Cleansing Song",f="Both",k="daily",r={mo=105000,xp=45},o={"0/1 Spirit of Atha slain","0/1 Spirit of Ha-Khalan slain","0/1 Spirit of Koosu slain"}}
b[12736]={n="Song of Reflection",f="Both",k="daily",r={mo=105000,xp=45},o={"0/1 Contemplation at Glimmering Pillar","0/1 Contemplation at Mosslight Pillar","0/1 Contemplation at Skyreach Pillar","0/1 Contemplation at Suntouched Pillar"}}
b[12737]={n="Song of Fecundity",f="Both",k="daily",r={mo=105000,xp=45},o={"0/8 Song of Fecundity played"}}
b[12758]={n="A Hero's Headgear",f="Both",k="daily",r={mo=105000,xp=45}}
b[12760]={n="Secret Strength of the Frenzyheart",f="Both",k="daily",r={mo=210000,xp=55},o={"0/30 Sparktouched Gorloc"}}
b[12761]={n="Mastery of the Crystals",f="Both",k="daily",r={mo=210000,xp=55},o={"0/50 Frenzyheart Attacker"}}
b[12762]={n="Power of the Great Ones",f="Both",k="daily",r={mo=210000,xp=55},o={"0/30 Frenzyheart Attacker"}}
b[12813]={n="From Their Corpses, Rise!",f="Both",k="daily",r={mo=105000,xp=45},o={"0/10 Scarlet Onslaught corpse transformed"}}
b[12815]={n="No Fly Zone",f="Both",k="daily",r={mo=105000,xp=45},o={"0/10 Onslaught Gryphon Rider slain"}}
b[12833]={n="Overstock",f="Both",k="daily",r={mo=105000,xp=45},o={"0/12 Garm Invader slain"}}
b[12838]={n="Intelligence Gathering",f="Both",k="daily",r={mo=105000,xp=45}}
b[12869]={n="Pushed Too Far",f="Both",k="daily",r={mo=105000,xp=45},o={"0/16 Stormpeak Wyrm slain"}}
b[12958]={n="Shipment: Blood Jade Amulet",f="Both",k="daily",r={mo=105000,xp=45}}
b[12959]={n="Shipment: Glowing Ivory Figurine",f="Both",k="daily",r={mo=105000,xp=45}}
b[12960]={n="Shipment: Wicked Sun Brooch",f="Both",k="daily",r={mo=105000,xp=45}}
b[12961]={n="Shipment: Intricate Bone Figurine",f="Both",k="daily",r={mo=105000,xp=45}}
b[12962]={n="Shipment: Bright Armor Relic",f="Both",k="daily",r={mo=105000,xp=45}}
b[12963]={n="Shipment: Shifting Sun Curio ",f="Both",k="daily",r={mo=105000,xp=45}}
b[12977]={n="Hodir's Call",f="Both",k="daily",r={mo=105000,xp=45},o={"0/5 Niffelem Forefather freed","0/5 Restless Frostborn freed"}}
b[12981]={n="Hot and Cold",f="Both",k="daily",r={mo=105000,xp=45}}
b[12994]={n="Spy Hunter",f="Both",k="daily",r={mo=105000,xp=45},o={"0/3 Stormforged Infiltrators Slain"}}
b[12995]={n="Leave Our Mark",f="Both",k="daily",r={mo=105000,xp=45},o={"0/15 Ebon Blade Banner planted near vrykul corpse"}}
b[13003]={n="How To Slay Your Dragon",f="Both",k="daily",r={mo=210000,xp=55},o={"0/1 Wild Wyrm Slain"}}
b[13006]={n="A Viscous Cleaning",f="Both",k="daily",r={mo=105000,xp=45}}
b[13046]={n="Feeding Arngrim",f="Both",k="daily",r={mo=105000,xp=45},o={"0/5 Arngrim's spirit fed"}}
b[13069]={n="Shoot 'Em Up",f="Both",k="daily",r={mo=105000,xp=45},o={"0/15 Jotunheim Proto-Drakes & their riders shot down"}}
b[13071]={n="Vile Like Fire!",f="Both",k="daily",r={mo=52500,xp=45},o={"0/8 Vrykul buildings set ablaze"}}
b[13100]={n="Infused Mushroom Meatloaf",f="Both",k="daily",r={i={{n="Small Spice Bag",q=1,ic=133644}},mo=78750,xp=35}}
b[13101]={n="Convention at the Legerdemain",f="Both",k="daily",r={i={{n="Small Spice Bag",q=1,ic=133644}},mo=78750,xp=35}}
b[13102]={n="Sewer Stew",f="Both",k="daily",r={i={{n="Small Spice Bag",q=1,ic=133644}},mo=78750,xp=35}}
b[13103]={n="Cheese for Glowergold",f="Both",k="daily",r={i={{n="Small Spice Bag",q=1,ic=133644},{n="Eversong Party Platter",q=2,ic=7461532}},mo=78750,xp=35}}
b[13107]={n="Mustard Dogs!",f="Both",k="daily",r={i={{n="Small Spice Bag",q=1,ic=133644}},mo=78750,xp=35}}
b[13112]={n="Infused Mushroom Meatloaf",f="Both",k="daily",r={i={{n="Small Spice Bag",q=1,ic=133644}},mo=78750,xp=35},o={"0/1 Infused Mushroom Meatloaf"}}
b[13113]={n="Convention at the Legerdemain",f="Both",k="daily",r={i={{n="Small Spice Bag",q=1,ic=133644}},mo=78750,xp=35},o={"0/4 Northern Stew","0/1 Jug of Wine"}}
b[13114]={n="Sewer Stew",f="Both",k="daily",r={i={{n="Small Spice Bag",q=1,ic=133644}},mo=78750,xp=35},o={"0/1 Vegetable Stew"}}
b[13115]={n="Cheese for Glowergold",f="Both",k="daily",r={i={{n="Small Spice Bag",q=1,ic=133644},{n="Eversong Party Platter",q=2,ic=7461532}},mo=78750,xp=35},o={"0/1 Wine and Cheese Platter"}}
b[13116]={n="Mustard Dogs!",f="Both",k="daily",r={i={{n="Small Spice Bag",q=1,ic=133644}},mo=78750,xp=35},o={"0/1 Mustard Dog Basket"}}
b[13233]={n="No Mercy!",f="Both",k="daily",r={mo=105000,xp=45,ho=200},o={"0/15 Horde Players slain"}}
b[13234]={n="Make Them Pay!",f="Both",k="daily",r={mo=105000,xp=45,ho=200},o={"0/15 Horde Players slain"}}
b[13239]={n="Volatility",f="Both",k="daily",r={mo=105000,xp=45},o={"0/3 Field Tests Conducted"}}
b[13261]={n="Volatility",f="Both",k="daily",r={mo=105000,xp=45},o={"0/3 Field Tests Conducted"}}
b[13264]={n="That's Abominable!",f="Both",k="daily",r={mo=105000,xp=45},o={"0/15 Icy Ghouls Exploded","0/15 Vicious Geists Exploded","0/15 Risen Alliance Soldiers Exploded"}}
b[13276]={n="That's Abominable!",f="Both",k="daily",r={mo=105000,xp=45},o={"0/15 Icy Ghouls Exploded","0/15 Vicious Geists Exploded","0/15 Risen Alliance Soldiers Exploded"}}
b[13280]={n="King of the Mountain",f="Both",k="daily",r={mo=105000,xp=45},o={"0/1 Alliance Battle Standard planted"}}
b[13281]={n="Neutralizing the Plague",f="Both",k="daily",r={mo=315000,xp=70},o={"0/1 Plague Cauldron Neutralized"}}
b[13283]={n="King of the Mountain",f="Both",k="daily",r={mo=105000,xp=45},o={"0/1 Horde Battle Standard planted"}}
b[13284]={n="Assault by Ground",f="Both",k="daily",r={mo=105000,xp=45},o={"0/4 Alliance troops escorted to Ymirheim"}}
b[13288]={n="That's Abominable!",f="Both",k="daily",r={c={{n="Scourgebane Pauldrons",q=2,ic=135094}},mo=105000,xp=45},o={"0/15 Icy Ghouls Exploded","0/15 Vicious Geists Exploded","0/15 Risen Alliance Soldiers Exploded"}}
b[13292]={n="The Solution Solution",f="Both",k="daily",r={mo=105000,xp=45},o={"0/3 Frostbrood Skytalons Destroyed"}}
b[13297]={n="Neutralizing the Plague",f="Both",k="daily",r={mo=315000,xp=70},o={"0/1 Plague Cauldron Neutralized"}}
b[13300]={n="Slaves to Saronite",f="Both",k="daily",r={mo=105000,xp=45},o={"0/10 Saronite Mine Slave rescued"}}
b[13301]={n="Assault by Ground",f="Both",k="daily",r={mo=105000,xp=45},o={"0/4 Horde troops escorted to Ymirheim"}}
b[13302]={n="Slaves to Saronite",f="Both",k="daily",r={mo=105000,xp=45},o={"0/10 Saronite Mine Slave rescued"}}
b[13309]={n="Assault by Air",f="Both",k="daily",r={mo=105000,xp=45},o={"0/4 Skybreaker Infiltrators dropped"}}
b[13310]={n="Assault by Air",f="Both",k="daily",r={mo=105000,xp=45},o={"0/4 Kor'kron Infiltrators dropped"}}
b[13318]={n="Drag and Drop",f="Both",k="daily",r={mo=105000,xp=45},o={"0/3 Dark Subjugator dragged and dropped"}}
b[13321]={n="Retest Now",f="Both",k="daily",r={mo=105000,xp=45},o={"0/1 Writhing Mass Banished"}}
b[13322]={n="Retest Now",f="Both",k="daily",r={mo=105000,xp=45},o={"0/1 Writhing Mass Banished"}}
b[13323]={n="Drag and Drop",f="Both",k="daily",r={mo=105000,xp=45},o={"0/3 Dark Subjugators dragged and dropped"}}
b[13330]={n="Blood of the Chosen",f="Both",k="daily",r={mo=105000,xp=45},o={"0/20 Ymirheim Vrykul slain"}}
b[13336]={n="Blood of the Chosen",f="Both",k="daily",r={mo=105000,xp=45},o={"0/20 Ymirheim Vrykul slain"}}
b[13342]={n="Not a Bug",f="Both",k="daily",r={mo=105000,xp=45},o={"0/1 Dark Messenger summoned"}}
b[13344]={n="Not a Bug",f="Both",k="daily",r={mo=105000,xp=45},o={"0/1 Dark Messenger summoned"}}
b[13346]={n="No Rest For The Wicked",f="Both",k="daily",r={mo=315000,xp=70},o={"0/1 Alumeth the Ascended Defeated"}}
b[13350]={n="No Rest For The Wicked",f="Both",k="daily",r={mo=315000,xp=70},o={"0/1 Alumeth the Ascended Slain"}}
b[13352]={n="Drag and Drop",f="Both",k="daily",r={mo=105000,xp=45},o={"0/3 Dark Subjugator dragged and dropped"}}
b[13353]={n="Drag and Drop",f="Both",k="daily",r={mo=105000,xp=45},o={"0/3 Dark Subjugator dragged and dropped"}}
b[13356]={n="Retest Now",f="Both",k="daily",r={c={{n="Twisted Hooligan Whacker",q=2,ic=133542},{n="Writhing Mace",q=2,ic=133547}},mo=105000,xp=45},o={"0/1 Writhing Mass Banished"}}
b[13358]={n="Not a Bug",f="Both",k="daily",r={c={{n="Legplates of the Northern Expedition",q=2,ic=134686},{n="Gutbuster of Aldur'thar",q=2,ic=132522}},mo=105000,xp=45},o={"0/1 Dark Messenger summoned"}}
b[13365]={n="Not a Bug",f="Both",k="daily",r={mo=105000,xp=45},o={"0/1 Dark Messenger summoned"}}
b[13367]={n="No Rest For The Wicked",f="Both",k="daily",r={mo=315000,xp=70},o={"0/1 Alumeth the Ascended Defeated"}}
b[13368]={n="No Rest For The Wicked",f="Both",k="daily",r={mo=315000,xp=70},o={"0/1 Alumeth the Ascended Defeated"}}
b[13408]={n="Hellfire Fortifications",f="Both",k="daily",r={i={{n="Mark of Honor Hold",q=1,ct=3,ic=134502}},mo=78750,xp=35},o={"0/1 Capture The Overlook","0/1 Capture the Stadium","0/1 Capture Broken Hill"}}
b[13409]={n="Hellfire Fortifications",f="Both",k="daily",r={i={{n="Mark of Thrallmar",q=1,ct=3,ic=134504}},mo=78750,xp=35},o={"0/1 Capture The Overlook","0/1 Capture the Stadium","0/1 Capture Broken Hill"}}
b[13410]={n="Hellfire Fortifications",f="Both",k="daily",r={i={{n="Mark of Honor Hold",q=1,ct=3,ic=134502}},mo=78750,xp=35},o={"0/1 Capture The Overlook","0/1 Capture the Stadium","0/1 Capture Broken Hill"}}
b[13411]={n="Hellfire Fortifications",f="Both",k="daily",r={i={{n="Mark of Thrallmar",q=1,ct=3,ic=134504}},mo=78750,xp=35},o={"0/1 Capture The Overlook","0/1 Capture the Stadium","0/1 Capture Broken Hill"}}
b[13413]={n="Aces High!",f="Both",k="daily",r={mo=210000,xp=55},o={"0/5 Scalesworn Elites Killed"}}
b[13414]={n="Aces High!",f="Both",k="daily",r={mo=105000,xp=45},o={"0/5 Scalesworn Elites Slain"}}
b[13422]={n="Maintaining Discipline",f="Both",k="daily",r={i={{n="Hyldnir Spoils",q=1,ic=133649}},mo=78750,xp=35},o={"0/6 Exhausted Vrykul Disciplined"}}
b[13424]={n="Back to the Pit",f="Both",k="daily",r={i={{n="Hyldnir Spoils",q=1,ic=133649}},mo=105000,xp=45},o={"0/6 Hyldsmeet Warbear slain"}}
b[13425]={n="The Aberrations Must Die",f="Both",k="daily",r={i={{n="Hyldnir Spoils",q=1,ic=133649}},mo=105000,xp=45}}
b[13592]={n="A Valiant's Field Training",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/10 Converted Hero slain"}}
b[13600]={n="A Worthy Weapon",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ct=2,ic=133441}},mo=105000,xp=45}}
b[13603]={n="A Blade Fit For A Champion",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ct=2,ic=133441}},mo=105000,xp=45}}
b[13616]={n="The Edge Of Winter",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ct=2,ic=133441}},mo=105000,xp=45}}
b[13625]={n="Learning The Reins",f="Both",k="daily",r={i={{n="Aspirant's Seal",q=1,ct=2,ic=133443}},mo=78750,xp=45},o={"0/5 Use Thrust on Melee Target","0/2 Use Shield-Breaker on vulnerable Ranged Target","0/2 Use Charge on vulnerable Charge Target"}}
b[13665]={n="The Grand Melee",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45}}
b[13666]={n="A Blade Fit For A Champion",f="Both",k="daily",r={i={{n="Aspirant's Seal",q=1,ct=2,ic=133443}},mo=78750,xp=45},o={"0/1 Ashwood Brand"}}
b[13669]={n="A Worthy Weapon",f="Both",k="daily",r={i={{n="Aspirant's Seal",q=1,ct=2,ic=133443}},mo=78750,xp=45},o={"0/1 Blade of Drak'Mar"}}
b[13670]={n="The Edge Of Winter",f="Both",k="daily",r={i={{n="Aspirant's Seal",q=1,ct=2,ic=133443}},mo=78750,xp=45},o={"0/1 Winter's Edge"}}
b[13671]={n="Training In The Field",f="Both",k="daily",r={i={{n="Aspirant's Seal",q=1,ic=133443}},mo=78750,xp=45},o={"0/8 Icecrown Scourge slain"}}
b[13673]={n="A Blade Fit For A Champion",f="Both",k="daily",r={i={{n="Aspirant's Seal",q=1,ct=2,ic=133443}},mo=78750,xp=45},o={"0/1 Ashwood Brand"}}
b[13674]={n="A Worthy Weapon",f="Both",k="daily",r={i={{n="Aspirant's Seal",q=1,ct=2,ic=133443}},mo=78750,xp=45},o={"0/1 Blade of Drak'Mar"}}
b[13675]={n="The Edge Of Winter",f="Both",k="daily",r={i={{n="Aspirant's Seal",q=1,ct=2,ic=133443}},mo=78750,xp=45},o={"0/1 Winter's Edge"}}
b[13676]={n="Training In The Field",f="Both",k="daily",r={i={{n="Aspirant's Seal",q=1,ic=133443}},mo=78750,xp=45},o={"0/8 Icecrown Scourge slain"}}
b[13677]={n="Learning The Reins",f="Both",k="daily",r={i={{n="Aspirant's Seal",q=1,ct=2,ic=133443}},mo=78750,xp=45},o={"0/5 Use Thrust on Melee Target","0/2 Use Shield-Breaker on vulnerable Ranged Target","0/2 Use Charge on vulnerable Charge Target"}}
b[13682]={n="Threat From Above",f="Both",k="daily",r={xp=45},o={"0/1 Chillmaw slain","0/3 Cultist Bombardier slain"}}
b[13741]={n="A Blade Fit For A Champion",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ct=2,ic=133441}},mo=105000,xp=45},o={"0/1 Ashwood Brand"}}
b[13742]={n="A Worthy Weapon",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ct=2,ic=133441}},mo=105000,xp=45},o={"0/1 Blade of Drak'Mar"}}
b[13743]={n="The Edge Of Winter",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ct=2,ic=133441}},mo=105000,xp=45},o={"0/1 Winter's Edge"}}
b[13744]={n="A Valiant's Field Training",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/10 Converted Hero slain"}}
b[13745]={n="The Grand Melee",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/3 Mark of the Valiant"}}
b[13747]={n="A Worthy Weapon",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ct=2,ic=133441}},mo=105000,xp=45},o={"0/1 Blade of Drak'Mar"}}
b[13748]={n="The Edge Of Winter",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ct=2,ic=133441}},mo=105000,xp=45},o={"0/1 Winter's Edge"}}
b[13749]={n="A Valiant's Field Training",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/10 Converted Hero slain"}}
b[13750]={n="The Grand Melee",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/3 Mark of the Valiant"}}
b[13753]={n="A Worthy Weapon",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ct=2,ic=133441}},mo=105000,xp=45},o={"0/1 Blade of Drak'Mar"}}
b[13754]={n="The Edge Of Winter",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ct=2,ic=133441}},mo=105000,xp=45},o={"0/1 Winter's Edge"}}
b[13755]={n="A Valiant's Field Training",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/10 Converted Hero slain"}}
b[13756]={n="The Grand Melee",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/3 Mark of the Valiant"}}
b[13757]={n="A Blade Fit For A Champion",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ct=2,ic=133441}},mo=105000,xp=45},o={"0/1 Ashwood Brand"}}
b[13758]={n="A Worthy Weapon",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ct=2,ic=133441}},mo=105000,xp=45},o={"0/1 Blade of Drak'Mar"}}
b[13759]={n="The Edge Of Winter",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ct=2,ic=133441}},mo=105000,xp=45},o={"0/1 Winter's Edge"}}
b[13760]={n="A Valiant's Field Training",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/10 Converted Hero slain"}}
b[13761]={n="The Grand Melee",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/3 Mark of the Valiant"}}
b[13762]={n="A Blade Fit For A Champion",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ct=2,ic=133441}},mo=105000,xp=45},o={"0/1 Ashwood Brand"}}
b[13763]={n="A Worthy Weapon",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ct=2,ic=133441}},mo=105000,xp=45},o={"0/1 Blade of Drak'Mar"}}
b[13764]={n="The Edge Of Winter",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ct=2,ic=133441}},mo=105000,xp=45},o={"0/1 Winter's Edge"}}
b[13765]={n="A Valiant's Field Training",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/10 Converted Hero slain"}}
b[13767]={n="The Grand Melee",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/3 Mark of the Valiant"}}
b[13768]={n="A Blade Fit For A Champion",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ct=2,ic=133441}},mo=105000,xp=45},o={"0/1 Ashwood Brand"}}
b[13769]={n="A Worthy Weapon",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ct=2,ic=133441}},mo=105000,xp=45},o={"0/1 Blade of Drak'Mar"}}
b[13770]={n="The Edge Of Winter",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ct=2,ic=133441}},mo=105000,xp=45},o={"0/1 Winter's Edge"}}
b[13771]={n="A Valiant's Field Training",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/10 Converted Hero slain"}}
b[13772]={n="The Grand Melee",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/3 Mark of the Valiant"}}
b[13774]={n="A Worthy Weapon",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ct=2,ic=133441}},mo=105000,xp=45},o={"0/1 Blade of Drak'Mar"}}
b[13775]={n="The Edge Of Winter",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ct=2,ic=133441}},mo=105000,xp=45},o={"0/1 Winter's Edge"}}
b[13776]={n="A Valiant's Field Training",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/10 Converted Hero slain"}}
b[13777]={n="The Grand Melee",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/3 Mark of the Valiant"}}
b[13778]={n="A Blade Fit For A Champion",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ct=2,ic=133441}},mo=105000,xp=45},o={"0/1 Ashwood Brand"}}
b[13779]={n="A Worthy Weapon",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ct=2,ic=133441}},mo=105000,xp=45},o={"0/1 Blade of Drak'Mar"}}
b[13780]={n="The Edge Of Winter",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ct=2,ic=133441}},mo=105000,xp=45},o={"0/1 Winter's Edge"}}
b[13781]={n="A Valiant's Field Training",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/10 Converted Hero slain"}}
b[13782]={n="The Grand Melee",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/3 Mark of the Valiant"}}
b[13783]={n="A Blade Fit For A Champion",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ct=2,ic=133441}},mo=105000,xp=45},o={"0/1 Ashwood Brand"}}
b[13784]={n="A Worthy Weapon",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ct=2,ic=133441}},mo=105000,xp=45},o={"0/1 Blade of Drak'Mar"}}
b[13785]={n="The Edge Of Winter",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ct=2,ic=133441}},mo=105000,xp=45},o={"0/1 Winter's Edge"}}
b[13786]={n="A Valiant's Field Training",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/10 Converted Hero slain"}}
b[13787]={n="The Grand Melee",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/3 Mark of the Valiant"}}
b[13788]={n="Threat From Above",f="Both",k="daily",r={c={{n="Champion's Writ",q=1,ic=237446},{n="Champion's Purse",q=1,ic=133641}},xp=45},o={"0/1 Chillmaw slain","0/3 Cultist Bombardier slain"}}
b[13789]={n="Taking Battle To The Enemy",f="Both",k="daily",r={c={{n="Champion's Writ",q=1,ic=237446},{n="Champion's Purse",q=1,ic=133641}},xp=45},o={"0/15 Cult of the Damned member slain"}}
b[13790]={n="Among the Champions",f="Both",k="daily",r={c={{n="Champion's Writ",q=1,ic=237446},{n="Champion's Purse",q=1,ic=133641}},xp=45}}
b[13791]={n="Taking Battle To The Enemy",f="Both",k="daily",r={c={{n="Champion's Writ",q=1,ic=237446},{n="Champion's Purse",q=1,ic=133641}},xp=45},o={"0/15 Cult of the Damned member slain"}}
b[13793]={n="Among the Champions",f="Both",k="daily",r={c={{n="Champion's Writ",q=1,ic=237446},{n="Champion's Purse",q=1,ic=133641}},xp=45},o={"0/4 Mark of the Champion"}}
b[13809]={n="Threat From Above",f="Both",k="daily",r={c={{n="Champion's Writ",q=1,ic=237446},{n="Champion's Purse",q=1,ic=133641}},xp=45},o={"0/1 Chillmaw slain","0/3 Cultist Bombardier slain"}}
b[13810]={n="Taking Battle To The Enemy",f="Both",k="daily",r={c={{n="Champion's Writ",q=1,ic=237446},{n="Champion's Purse",q=1,ic=133641}},xp=45},o={"0/15 Cult of the Damned member slain"}}
b[13811]={n="Among the Champions",f="Both",k="daily",r={c={{n="Champion's Writ",q=1,ic=237446},{n="Champion's Purse",q=1,ic=133641}},xp=45},o={"0/4 Mark of the Champion"}}
b[13812]={n="Threat From Above",f="Both",k="daily",r={c={{n="Champion's Writ",q=1,ic=237446},{n="Champion's Purse",q=1,ic=133641}},xp=45},o={"0/1 Chillmaw slain","0/3 Cultist Bombardier slain"}}
b[13813]={n="Taking Battle To The Enemy",f="Both",k="daily",r={c={{n="Champion's Writ",q=1,ic=237446},{n="Champion's Purse",q=1,ic=133641}},xp=45},o={"0/15 Cult of the Damned member slain"}}
b[13814]={n="Among the Champions",f="Both",k="daily",r={c={{n="Champion's Writ",q=1,ic=237446},{n="Champion's Purse",q=1,ic=133641}},xp=45},o={"0/4 Mark of the Champion"}}
b[13830]={n="The Ghostfish",f="Both",k="daily",r={i={{n="Bag of Fishing Treasures",q=1,ic=133630}},xp=45},o={"Discover the Ghostfish mystery"}}
b[13832]={n="Jewel Of The Sewers",f="Both",k="daily",r={i={{n="Bag of Fishing Treasures",q=1,ic=133630}},xp=45}}
b[13833]={n="Blood Is Thicker",f="Both",k="daily",r={i={{n="Bag of Fishing Treasures",q=1,ic=133630}},xp=45}}
b[13834]={n="Dangerously Delicious",f="Both",k="daily",r={i={{n="Bag of Fishing Treasures",q=1,ic=133630}},xp=45}}
b[13846]={n="Contributin' To The Cause",f="Both",k="daily"}
b[13847]={n="At The Enemy's Gates",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/15 Boneguard Footman slain","0/10 Boneguard Scout slain","0/3 Boneguard Lieutenant slain"}}
b[13851]={n="At The Enemy's Gates",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/15 Boneguard Footman slain","0/10 Boneguard Scout slain","0/3 Boneguard Lieutenant slain"}}
b[13852]={n="At The Enemy's Gates",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/15 Boneguard Footman slain","0/10 Boneguard Scout slain","0/3 Boneguard Lieutenant slain"}}
b[13854]={n="At The Enemy's Gates",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/15 Boneguard Footman slain","0/10 Boneguard Scout slain","0/3 Boneguard Lieutenant slain"}}
b[13855]={n="At The Enemy's Gates",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/15 Boneguard Footman slain","0/10 Boneguard Scout slain","0/3 Boneguard Lieutenant slain"}}
b[13856]={n="At The Enemy's Gates",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/15 Boneguard Footman slain","0/10 Boneguard Scout slain","0/3 Boneguard Lieutenant slain"}}
b[13857]={n="At The Enemy's Gates",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/15 Boneguard Footman slain","0/10 Boneguard Scout slain","0/3 Boneguard Lieutenant slain"}}
b[13858]={n="At The Enemy's Gates",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/15 Boneguard Footman slain","0/10 Boneguard Scout slain","0/3 Boneguard Lieutenant slain"}}
b[13859]={n="At The Enemy's Gates",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/15 Boneguard Footman slain","0/10 Boneguard Scout slain","0/3 Boneguard Lieutenant slain"}}
b[13860]={n="At The Enemy's Gates",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/15 Boneguard Footman slain","0/10 Boneguard Scout slain","0/3 Boneguard Lieutenant slain"}}
b[13861]={n="Battle Before The Citadel",f="Both",k="daily",r={c={{n="Champion's Writ",q=1,ic=237446},{n="Champion's Purse",q=1,ic=133641}},mo=105000,xp=45},o={"0/3 Boneguard Commander slain"}}
b[13862]={n="Battle Before The Citadel",f="Both",k="daily",r={c={{n="Champion's Writ",q=1,ic=237446},{n="Champion's Purse",q=1,ic=133641}},mo=105000,xp=45},o={"0/3 Boneguard Commander slain"}}
b[13863]={n="Battle Before The Citadel",f="Both",k="daily",r={c={{n="Champion's Writ",q=1,ic=237446},{n="Champion's Purse",q=1,ic=133641}},mo=105000,xp=45},o={"0/3 Boneguard Commander slain"}}
b[13864]={n="Battle Before The Citadel",f="Both",k="daily",r={c={{n="Champion's Writ",q=1,ic=237446},{n="Champion's Purse",q=1,ic=133641}},mo=105000,xp=45},o={"0/3 Boneguard Commander slain"}}
b[14048]={n="Can't Get Enough Turkey",f="Both",k="daily",r={xp=6350}}
b[14051]={n="Don't Forget The Stuffing!",f="Both",k="daily",r={c={{n="Pilgrim's Hat",q=2,ic=133167},{n="Pilgrim's Attire",q=2,ic=135022},{n="Pilgrim's Dress",q=2,ic=132692},{n="Pilgrim's Robe",q=2,ic=132681},{n="Pilgrim's Boots",q=2,ic=132574},{n="Pilgrim's Bounty",q=2,ic=348523}},xp=6350}}
b[14053]={n="We're Out of Cranberry Chutney Again?",f="Both",k="daily",r={c={{n="Pilgrim's Hat",q=2,ic=133167},{n="Pilgrim's Attire",q=2,ic=135022},{n="Pilgrim's Dress",q=2,ic=132692},{n="Pilgrim's Robe",q=2,ic=132681},{n="Pilgrim's Boots",q=2,ic=132574},{n="Pilgrim's Bounty",q=2,ic=348523}},xp=6350}}
b[14054]={n="Easy As Pie",f="Both",k="daily",r={c={{n="Pilgrim's Hat",q=2,ic=133167},{n="Pilgrim's Attire",q=2,ic=135022},{n="Pilgrim's Dress",q=2,ic=132692},{n="Pilgrim's Robe",q=2,ic=132681},{n="Pilgrim's Boots",q=2,ic=132574},{n="Pilgrim's Bounty",q=2,ic=348523}},xp=6350}}
b[14055]={n="She Says Potato",f="Both",k="daily",r={c={{n="Pilgrim's Hat",q=2,ic=133167},{n="Pilgrim's Attire",q=2,ic=135022},{n="Pilgrim's Dress",q=2,ic=132692},{n="Pilgrim's Robe",q=2,ic=132681},{n="Pilgrim's Boots",q=2,ic=132574},{n="Pilgrim's Bounty",q=2,ic=348523}},xp=9550}}
b[25105]={n="Nibbler!  No!",f="Both",k="daily",r={xp=55},o={"0/3 Solid Zephyrites Cut"}}
b[25154]={n="A Present for Lila",f="Both",k="daily",r={xp=55},o={"0/3 Timeless Nightstones Cut"}}
b[25155]={n="Ogrezonians in the Mood",f="Both",k="daily",r={xp=55},o={"0/3 Jagged Jasper Cut"}}
b[25156]={n="Elemental Goo",f="Both",k="daily",r={xp=55}}
b[25157]={n="The Latest Fashion!",f="Both",k="daily",r={xp=55},o={"0/10 Stardust No. 2 Tested"}}
b[25158]={n="Nibbler!  No!",f="Both",k="daily",r={xp=55},o={"0/3 Solid Zephyrites Cut","0/3 Solid Zephyrite"}}
b[25159]={n="The Latest Fashion!",f="Both",k="daily",r={xp=55},o={"0/10 Stardust No. 2 Tested"}}
b[25160]={n="A Present for Lila",f="Both",k="daily",r={xp=55},o={"0/3 Timeless Nightstones Cut","0/3 Timeless Nightstone"}}
b[25161]={n="Ogrezonians in the Mood",f="Both",k="daily",r={xp=55},o={"0/3 Jagged Jasper Cut","0/3 Jagged Jasper"}}
b[25162]={n="Elemental Goo",f="Both",k="daily",r={xp=55},o={"0/10 Elemental Goo"}}
b[26094]={n="Striking Back",f="Both",k="daily",r={mo=105000,xp=45},o={"0/30 Dark Iron attackers slain"}}
b[26153]={n="Penny's Pumpkin Pancakes",f="Both",k="daily",r={mo=331700,xp=12700}}
b[26177]={n="Feeling Crabby?",f="Both",k="daily",r={mo=331700,xp=12700}}
b[26183]={n="The King's Cider",f="Both",k="daily",r={mo=331700,xp=12700}}
b[26190]={n="A Fisherman's Feast",f="Both",k="daily",r={mo=331700,xp=12700}}
b[26192]={n="Orphans Like Cookies Too!",f="Both",k="daily",r={mo=331700,xp=12700}}
b[26220]={n="Everything Is Better with Bacon",f="Both",k="daily",r={mo=331700,xp=12700}}
b[26226]={n="Crawfish Creole",f="Both",k="daily",r={mo=331700,xp=12700}}
b[26227]={n="Careful, This Fruit Bites Back",f="Both",k="daily",r={mo=331700,xp=12700}}
b[26233]={n="Stealing From Our Own",f="Both",k="daily",r={mo=331700,xp=12700}}
b[26235]={n="Even Thieves Get Hungry",f="Both",k="daily",r={mo=331700,xp=12700}}
b[26414]={n="Hitting a Walleye",f="Both",k="daily",r={i={{n="Bag of Shiny Things",q=1,ic=133645}},mo=331700,xp=12700}}
b[26420]={n="Diggin' For Worms",f="Both",k="daily",r={i={{n="Bag of Shiny Things",q=1,ic=133645}},mo=331700,xp=12700}}
b[26442]={n="Rock Lobster",f="Both",k="daily",r={i={{n="Bag of Shiny Things",q=1,ic=133645}},mo=331700,xp=12700}}
b[26488]={n="Big Gulp",f="Both",k="daily",r={i={{n="Bag of Shiny Things",q=1,ic=133645}},mo=331700,xp=12700}}
b[26536]={n="Thunder Falls",f="Both",k="daily",r={i={{n="Bag of Shiny Things",q=1,ic=133645}},mo=331700,xp=12700}}
b[26543]={n="Clammy Hands",f="Both",k="daily",r={i={{n="Bag of Shiny Things",q=1,ic=133645}},mo=331700,xp=12700}}
b[26556]={n="No Dumping Allowed",f="Both",k="daily",r={i={{n="Bag of Shiny Things",q=1,ic=133645}},mo=331700,xp=12700}}
b[26557]={n="A Staggering Effort",f="Both",k="daily",r={i={{n="Bag of Shiny Things",q=1,ic=133645}},mo=331700,xp=12700}}
b[26572]={n="A Golden Opportunity",f="Both",k="daily",r={i={{n="Bag of Shiny Things",q=1,ic=133645}},mo=331700,xp=12700}}
b[26588]={n="A Furious Catch",f="Both",k="daily",r={i={{n="Bag of Shiny Things",q=1,ic=133645}},mo=331700,xp=12700}}
b[26710]={n="Lost In The Deeps",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1 Pebble brought to safety"}}
b[27046]={n="Fear of Boring",f="Both",k="daily",r={mo=137400,xp=55},o={"0/10 Gyreworm slain"}}
b[27047]={n="Motes",f="Both",k="daily",r={mo=137400,xp=55}}
b[27048]={n="Underground Economy",f="Both",k="daily",r={mo=137400,xp=55}}
b[27049]={n="Soft Rock",f="Both",k="daily",r={mo=137400,xp=55},o={"0/8 Fungal Behemoth slain"}}
b[27050]={n="Fungal Fury",f="Both",k="daily",r={mo=137400,xp=55},o={"0/10 Freshly sprouted mushroom destroyed"}}
b[27051]={n="Through Persistence",f="Both",k="daily",r={mo=137400,xp=55}}
b[27509]={n="Breach in the Defenses",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1 Twilight Portal destroyed"}}
b[27747]={n="Total War",f="Both",k="daily",r={mo=137400,xp=55},o={"0/10 Wildhammer Kegs Smashed"}}
b[27751]={n="Crushing the Wildhammer",f="Both",k="daily",r={mo=137400,xp=55}}
b[27752]={n="Fight Like a Wildhammer",f="Both",k="daily",r={mo=137400,xp=55}}
b[27753]={n="Never Leave a Dinner Behind",f="Both",k="daily",r={mo=137400,xp=55}}
b[27944]={n="Thinning the Brood",f="Both",k="daily",r={mo=137400,xp=55},o={"0/12   slain"}}
b[27948]={n="A Sticky Task",f="Both",k="daily",r={mo=137400,xp=55}}
b[27949]={n="The Forgotten",f="Both",k="daily",r={mo=137400,xp=55}}
b[27966]={n="Salvaging the Remains",f="Both",k="daily",r={mo=137400,xp=55}}
b[27967]={n="First Lieutenant Connor",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1   slain"}}
b[27970]={n="Captain P. Harris",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1   slain"}}
b[27971]={n="Rattling Their Cages",f="Both",k="daily",r={mo=137400,xp=55},o={"0/8   slain"}}
b[27972]={n="Boosting Morale",f="Both",k="daily",r={mo=137400,xp=55}}
b[27973]={n="Watch Out For Splinters!",f="Both",k="daily",r={mo=137400,xp=55}}
b[27975]={n="WANTED: Foreman Wellson",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1   slain"}}
b[27978]={n="Ghostbuster",f="Both",k="daily",r={mo=137400,xp=55},o={"0/14 Largo's Overlook Ghosts Slain"}}
b[27991]={n="Taking the Overlook Back",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1   slain"}}
b[27992]={n="Magnets, How Do They Work?",f="Both",k="daily",r={mo=137400,xp=55}}
b[28046]={n="Finish The Job",f="Both",k="daily",r={mo=137400,xp=55},o={"0/5   slain"}}
b[28050]={n="Shark Tank",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1   slain"}}
b[28059]={n="Claiming The Keep",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1   slain"}}
b[28063]={n="Leave No Weapon Behind",f="Both",k="daily",r={mo=137400,xp=55}}
b[28065]={n="Walk A Mile In Their Shoes",f="Both",k="daily",r={mo=137400,xp=55},o={"Farson Prisoner Escorted"}}
b[28117]={n="Clearing the Depths",f="Both",k="daily",r={mo=274800,xp=55},o={"0/9 Ghosts Slain"}}
b[28118]={n="The Imprisoned Archmage",f="Both",k="daily",r={mo=274800,xp=55}}
b[28120]={n="Learning From The Past",f="Both",k="daily",r={mo=274800,xp=55}}
b[28122]={n="A Huge Problem",f="Both",k="daily",r={mo=274800,xp=55},o={"0/1   slain"}}
b[28130]={n="Not The Friendliest Town",f="Both",k="daily",r={mo=137400,xp=55},o={"0/14 Rustberg Village Residents"}}
b[28137]={n="Teach A Man To Fish.... Or Steal",f="Both",k="daily",r={mo=137400,xp=55}}
b[28162]={n="Swamp Bait",f="Both",k="daily",r={mo=274800,xp=55}}
b[28163]={n="The Leftovers",f="Both",k="daily",r={mo=274800,xp=55},o={"0/12 Horde Infantry"}}
b[28165]={n="D-Block",f="Both",k="daily",r={mo=274800,xp=55},o={"0/10 Demons Slain"}}
b[28177]={n="Stocking Up",f="Both",k="daily",r={c={{n="Enchanted Scorpid Tail",q=2,ic=133057},{n="Envenomed Scorpid Tail",q=2,ic=133476}},mo=105000,xp=45}}
b[28185]={n="Svarnos",f="Both",k="daily",r={mo=274800,xp=55}}
b[28186]={n="Cursed Shackles",f="Both",k="daily",r={mo=274800,xp=55}}
b[28188]={n="Prison Revolt",f="Both",k="daily",r={mo=274800,xp=55},o={"0/10 Prisoners Slain"}}
b[28223]={n="The Warden",f="Both",k="daily",r={mo=274800,xp=55}}
b[28232]={n="Food From Below",f="Both",k="daily",r={mo=274800,xp=55}}
b[28250]={n="Thieving Little Pluckers",f="Both",k="daily",r={mo=103050,xp=40},o={"0/30 Thieving plucker smashed"}}
b[28275]={n="Bombs Away!",f="Both",k="daily",r={mo=137400,xp=55},o={"0/10 Wellson Supply Boats Destroyed"}}
b[28390]={n="Glop, Son of Glop",f="Both",k="daily",r={mo=274800,xp=65},o={"0/1   slain"}}
b[28391]={n="The Restless Brood",f="Both",k="daily",r={mo=274800,xp=65},o={"0/1 Pale Resonating Crystal struck","0/1 Aeosera defeated"}}
b[28419]={n="Stocking Up",f="Both",k="daily",r={c={{n="Enchanted Scorpid Tail",q=2,ic=133057}},mo=105000,xp=45},o={"0/5 Razor-Sharp Scorpid Barb"}}
b[28497]={n="Fire From the Sky",f="Both",k="daily",r={c={{n="Confiscated Dog Tags",q=2,ic=133330},{n="Canopic Chestplate",q=2,ic=463456}},mo=137400,xp=55},o={"0/100 Schnottz Infantrymen Slain"}}
b[28657]={n="A Huge Problem",f="Both",k="daily",r={mo=274800,xp=55},o={"0/1 Problim slain"}}
b[28658]={n="Swamp Bait",f="Both",k="daily",r={mo=274800,xp=55},o={"0/8 Crocolisk Hide"}}
b[28659]={n="The Leftovers",f="Both",k="daily",r={mo=274800,xp=55},o={"0/12 Alliance Infantry"}}
b[28660]={n="Clearing the Depths",f="Both",k="daily",r={mo=274800,xp=55},o={"0/9 Ghosts Slain"}}
b[28661]={n="The Imprisoned Archmage",f="Both",k="daily",r={mo=274800,xp=55},o={"0/1 Archmage Galus' Staff"}}
b[28662]={n="Learning From The Past",f="Both",k="daily",r={mo=274800,xp=55},o={"0/4 Dusty Prison Journal"}}
b[28663]={n="D-Block",f="Both",k="daily",r={mo=274800,xp=55},o={"0/10 Demons Slain"}}
b[28664]={n="Svarnos",f="Both",k="daily",r={mo=274800,xp=55},o={"0/1 Svarnos' Cursed Collar"}}
b[28665]={n="Cursed Shackles",f="Both",k="daily",r={mo=274800,xp=55},o={"0/8 Cursed Shackles"}}
b[28668]={n="Prison Revolt",f="Both",k="daily",r={mo=274800,xp=55},o={"0/10 Prisoners Slain"}}
b[28669]={n="The Warden",f="Both",k="daily",r={mo=274800,xp=55},o={"0/1 Warden's Keys"}}
b[28670]={n="Food From Below",f="Both",k="daily",r={mo=274800,xp=55},o={"0/12 Cellblock Rations"}}
b[28678]={n="Captain P. Harris",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1 Captain P. Harris slain"}}
b[28679]={n="Rattling Their Cages",f="Both",k="daily",r={mo=137400,xp=55},o={"0/8 Shipwrecked Sailor slain"}}
b[28680]={n="Boosting Morale",f="Both",k="daily",r={mo=137400,xp=55},o={"0/6 Barrel of Southsea Rum"}}
b[28681]={n="Shark Tank",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1 Tank slain"}}
b[28682]={n="Claiming The Keep",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1 Keep Lord Farson slain"}}
b[28683]={n="Thinning the Brood",f="Both",k="daily",r={mo=137400,xp=55},o={"0/12 Darkwood Lurker slain"}}
b[28684]={n="A Sticky Task",f="Both",k="daily",r={mo=137400,xp=55},o={"0/4 Sticky Silk Gland"}}
b[28685]={n="Leave No Weapon Behind",f="Both",k="daily",r={mo=137400,xp=55},o={"0/12 Rusty Rifle"}}
b[28686]={n="Not The Friendliest Town",f="Both",k="daily",r={mo=137400,xp=55},o={"0/14 Rustberg Village Residents"}}
b[28687]={n="Teach A Man To Fish.... Or Steal",f="Both",k="daily",r={mo=137400,xp=55},o={"0/22 Rustberg Seabass"}}
b[28689]={n="The Forgotten",f="Both",k="daily",r={mo=137400,xp=55}}
b[28690]={n="Salvaging the Remains",f="Both",k="daily",r={mo=137400,xp=55},o={"0/9 Cursed Femur"}}
b[28691]={n="First Lieutenant Connor",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1 First Lieutenant Connor slain"}}
b[28692]={n="Magnets, How Do They Work?",f="Both",k="daily",r={mo=137400,xp=55},o={"0/7 Siege Engine Scrap"}}
b[28693]={n="Finish The Job",f="Both",k="daily",r={mo=137400,xp=55},o={"0/5   slain"}}
b[28694]={n="Watch Out For Splinters!",f="Both",k="daily",r={mo=137400,xp=55},o={"0/15 Shipyard Lumber"}}
b[28695]={n="WANTED: Foreman Wellson",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1 Foreman Wellson slain"}}
b[28696]={n="Bombs Away!",f="Both",k="daily",r={mo=137400,xp=55},o={"0/10 Wellson Supply Boats Destroyed"}}
b[28697]={n="Ghostbuster",f="Both",k="daily",r={mo=137400,xp=55},o={"0/14 Largo's Overlook Ghosts Slain"}}
b[28698]={n="Cannonball!",f="Both",k="daily",r={mo=137400,xp=55}}
b[28700]={n="Taking the Overlook Back",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1 Commander Largo slain"}}
b[28736]={n="Fire From the Sky",f="Both",k="daily",r={mo=137400,xp=55},o={"0/100 Infantrymen Slain"}}
b[28860]={n="Keeping the Dragonmaw at Bay",f="Both",k="daily",r={mo=137400,xp=55}}
b[28861]={n="Fight Like a Wildhammer",f="Both",k="daily",r={mo=137400,xp=55},o={"0/10 Keg of Thundermar Ale"}}
b[28862]={n="Never Leave a Dinner Behind",f="Both",k="daily",r={mo=137400,xp=55},o={"0/10 Wildhammer Food Stores"}}
b[28863]={n="Warlord Halthar is Back",f="Both",k="daily",r={mo=274800,xp=65},o={"0/1   slain"}}
b[28864]={n="Beer Run",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1 Supply Caravan Escorted"}}
b[28871]={n="Crushing the Wildhammer",f="Both",k="daily",r={mo=137400,xp=55},o={"0/8 Wildhammer Insignia"}}
b[28872]={n="Total War",f="Both",k="daily",r={mo=137400,xp=55},o={"0/10 Wildhammer Kegs Smashed"}}
b[28873]={n="Another Maw to Feed",f="Both",k="daily",r={mo=137400,xp=55},o={"0/10 Wildhammer Food Stores"}}
b[28874]={n="Hook 'em High",f="Both",k="daily",r={mo=137400,xp=55},o={"0/4   slain"}}
b[28875]={n="Bring Down the High Shaman",f="Both",k="daily",r={mo=274800,xp=65},o={"0/1   slain"}}
b[29101]={n="Punting Season",f="Both",k="daily",r={xp=40},o={"0/5 Child of Tortolla punted into water"}}
b[29122]={n="Echoes of Nemesis",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1   slain"}}
b[29123]={n="Rage Against the Flames",f="Both",k="daily",r={mo=137400,xp=55},o={"0/6 Invader from the Firelands slain"}}
b[29125]={n="Between the Trees",f="Both",k="daily",r={xp=40},o={"0/3 Spirit of Malorne captured"}}
b[29127]={n="Rage Against the Flames",f="Both",k="daily",r={mo=137400,xp=55},o={"0/8 Invader from the Firelands slain"}}
b[29128]={n="The Protectors of Hyjal",f="Both",k="daily",r={mo=274800,xp=65},o={"0/6 Invader slain at Sethria's Roost"}}
b[29137]={n="Breach in the Defenses",f="Both",k="daily",r={mo=137400,xp=55},o={"0/5   slain"}}
b[29138]={n="Burn Victims",f="Both",k="daily",r={mo=137400,xp=55},o={"0/8 Wounded Hyjal Defender saved"}}
b[29139]={n="Aggressive Growth",f="Both",k="daily",r={mo=137400,xp=55},o={"0/5 Smothervine planted"}}
b[29141]={n="The Harder They Fall",f="Both",k="daily",r={mo=137400,xp=55},o={"0/3   slain"}}
b[29143]={n="Wisp Away",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1 Close a Fire Portal"}}
b[29147]={n="Call the Flock",f="Both",k="daily",r={xp=40},o={"0/12 Alpine Songbird gathered","0/5 Forest Owl gathered","0/2 Goldwing Hawk gathered"}}
b[29149]={n="Rage Against the Flames",f="Both",k="daily",r={mo=137400,xp=55},o={"0/7 Invader from the Firelands slain"}}
b[29159]={n="Pyrorachnophobia",f="Both",k="daily",r={mo=137400,xp=55},o={"0/8 Cinderweb spider slain"}}
b[29161]={n="Those Bears Up There",f="Both",k="daily",r={xp=40},o={"0/6 Hyjal Bear Cubs chucked to safety"}}
b[29162]={n="Nature's Blessing",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1   slain"}}
b[29163]={n="Rage Against the Flames",f="Both",k="daily",r={mo=137400,xp=55},o={"0/9 Invader from the Firelands slain"}}
b[29164]={n="Perfecting Your Howl",f="Both",k="daily",r={xp=40},o={"0/10 Howl atop an invader's corpse"}}
b[29165]={n="The Call of the Pack",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1   slain"}}
b[29166]={n="Supplies for the Other Side",f="Both",k="daily",r={mo=137400,xp=55}}
b[29177]={n="Vigilance on Wings",f="Both",k="daily",r={mo=137400,xp=55},o={"0/10   slain"}}
b[29179]={n="Hostile Elements",f="Both",k="daily",r={mo=137400,xp=55},o={"0/8 Charred Combatant slain"}}
b[29189]={n="Wicked Webs",f="Both",k="daily",r={mo=137400,xp=55},o={"0/8 Victims freed"}}
b[29192]={n="The Wardens are Watching",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1 Druid of the Flame captured"}}
b[29205]={n="The Forlorn Spire",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1 Druid Assault Group Protected"}}
b[29206]={n="Into the Fire",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1 Druid of the Talon Windcaller protected"}}
b[29210]={n="Enduring the Heat",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1 Enter the Igneous Depths","0/1 All Flame Runes Destroyed"}}
b[29211]={n="Solar Core Destruction",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1 Solar Core detonated"}}
b[29243]={n="Strike at the Heart",f="Both",k="daily",r={mo=274800,xp=65},o={"0/1   slain"}}
b[29246]={n="Relieving the Pain",f="Both",k="daily",r={mo=137400,xp=55}}
b[29247]={n="Treating the Wounds",f="Both",k="daily",r={mo=137400,xp=55}}
b[29248]={n="Releasing the Pressure",f="Both",k="daily",r={mo=137400,xp=55}}
b[29255]={n="Embergris",f="Both",k="daily",r={mo=137400,xp=55}}
b[29257]={n="Steal Magmolias",f="Both",k="daily",r={mo=137400,xp=55}}
b[29264]={n="Flamewakers of the Molten Flow",f="Both",k="daily",r={mo=137400,xp=55},o={"0/8 Flamewaker slain"}}
b[29265]={n="Fire Flowers",f="Both",k="daily",r={mo=137400,xp=55}}
b[29273]={n="How Hot",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1 Northwestern Lava Pool sampled","0/1 Northeastern Lava Pool sampled","0/1 Central Lava Pool sampled"}}
b[29274]={n="Hounds of Shannox",f="Both",k="daily",r={mo=137400,xp=55}}
b[29275]={n="Fandral's Methods",f="Both",k="daily",r={mo=137400,xp=55}}
b[29278]={n="Living Obsidium",f="Both",k="daily",r={mo=137400,xp=55}}
b[29288]={n="Starting Young",f="Both",k="daily",r={mo=137400,xp=55}}
b[29290]={n="Fire in the Skies",f="Both",k="daily",r={mo=137400,xp=55},o={"0/100 Amassing Flamewakers slain","0/40 Amassing Cinderwebs slain","0/3 Molten Lords slain"}}
b[29296]={n="Territorial Birds",f="Both",k="daily",r={mo=137400,xp=55},o={"0/5   slain"}}
b[29299]={n="Some Like It Hot",f="Both",k="daily",r={mo=137400,xp=55},o={"0/6 Help the Crimson Lasher Drink from Ember Pools"}}
b[29304]={n="The Dogs of War",f="Both",k="daily",r={mo=137400,xp=55},o={"0/5   slain"}}
b[29305]={n="Strike at the Heart",f="Both",k="daily",r={mo=274800,xp=65},o={"0/1 Lieutenant of Flame slain"}}
b[29313]={n="The Secret to Perfect Kimchi",f="Both",k="daily",r={mo=331700,xp=12700}}
b[29314]={n="Remembering the Ancestors",f="Both",k="daily",r={mo=331700,xp=12700}}
b[29315]={n="Fungus Among Us",f="Both",k="daily",r={mo=331700,xp=12700}}
b[29316]={n="Back to Basics",f="Both",k="daily",r={mo=331700,xp=12700},o={"0/6 Practice Making Rice Flour"}}
b[29318]={n="Ribs for the Sentinels",f="Both",k="daily",r={mo=331700,xp=12700},o={"0/5 Feed Ribs to Sentinels"}}
b[29319]={n="Tadpole Terror",f="Both",k="daily",r={i={{n="Bag of Shiny Things",q=1,ic=133645}},mo=331700,xp=12700}}
b[29320]={n="Like Pike?",f="Both",k="daily",r={i={{n="Bag of Shiny Things",q=1,ic=133645}},mo=331700,xp=12700}}
b[29321]={n="Happy as a Clam Digger",f="Both",k="daily",r={i={{n="Bag of Shiny Things",q=1,ic=133645}},mo=331700,xp=12700}}
b[29322]={n="Time for Slime",f="Both",k="daily",r={i={{n="Bag of Shiny Things",q=1,ic=133645}},mo=331700,xp=12700}}
b[29323]={n="Stocking Up",f="Both",k="daily",r={i={{n="Bag of Shiny Things",q=1,ic=133645}},mo=331700,xp=12700}}
b[29324]={n="The Sister's Pendant",f="Both",k="daily",r={i={{n="Bag of Shiny Things",q=1,ic=133645}},mo=331700,xp=12700}}
b[29325]={n="A Slippery Snack",f="Both",k="daily",r={i={{n="Bag of Shiny Things",q=1,ic=133645}},mo=331700,xp=12700}}
b[29332]={n="Lily, Oh Lily",f="Both",k="daily",r={mo=331700,xp=12700}}
b[29333]={n="Escargot A Go-Go",f="Both",k="daily",r={mo=331700,xp=12700}}
b[29334]={n="Roach Coach",f="Both",k="daily",r={mo=331700,xp=12700}}
b[29342]={n="Cold Water Fishing",f="Both",k="daily",r={i={{n="Bag of Shiny Things",q=1,ic=133645}},mo=331700,xp=12700}}
b[29343]={n="One fer the Ages",f="Both",k="daily",r={i={{n="Bag of Shiny Things",q=1,ic=133645}},mo=331700,xp=12700},o={"0/1 Put Young Ironjaw on Display"}}
b[29344]={n="Fish fer Squrky",f="Both",k="daily",r={i={{n="Bag of Shiny Things",q=1,ic=133645}},mo=331700,xp=12700},o={"0/3 Feed Squrky"}}
b[29345]={n="Pond Predators",f="Both",k="daily",r={i={{n="Bag of Shiny Things",q=1,ic=133645}},mo=331700,xp=12700}}
b[29346]={n="The Ring's the Thing",f="Both",k="daily",r={i={{n="Bag of Shiny Things",q=1,ic=133645}},mo=331700,xp=12700}}
b[29347]={n="Live Bait",f="Both",k="daily",r={i={{n="Bag of Shiny Things",q=1,ic=133645}},mo=331700,xp=12700},o={"0/1 Catch Cold Water Crayfish","0/1 Take Crayfish to Cook Ghilm"}}
b[29348]={n="The Race to Restock",f="Both",k="daily",r={i={{n="Bag of Shiny Things",q=1,ic=133645}},mo=331700,xp=12700}}
b[29349]={n="Craving Crayfish",f="Both",k="daily",r={i={{n="Bag of Shiny Things",q=1,ic=133645}},mo=331700,xp=12700}}
b[29350]={n="The Gnomish Bait-o-Matic",f="Both",k="daily",r={i={{n="Bag of Shiny Things",q=1,ic=133645}},mo=331700,xp=12700}}
b[29351]={n="A Round for the Guards",f="Both",k="daily",r={mo=331700,xp=12700},o={"0/6 Ironforge Guards Fed"}}
b[29352]={n="A Fowl Shortage",f="Both",k="daily",r={mo=331700,xp=12700}}
b[29353]={n="Keepin' the Haggis Flowin'",f="Both",k="daily",r={mo=331700,xp=12700}}
b[29354]={n="Shiny Baubles",f="Both",k="daily",r={i={{n="Bag of Shiny Things",q=1,ic=133645}},mo=331700,xp=12700}}
b[29355]={n="Can't Get Enough Spice Bread",f="Both",k="daily",r={mo=331700,xp=12700}}
b[29356]={n="I Need to Cask a Favor",f="Both",k="daily",r={mo=331700,xp=12700},o={"0/1 Cask of Drugan's IPA","0/1 Deliver Cask of Drugan's IPA"}}
b[29357]={n="Spice Bread Aplenty",f="Both",k="daily",r={mo=331700,xp=12700},o={"0/10 Spice Bread"}}
b[29358]={n="Pining for Nuts",f="Both",k="daily",r={mo=331700,xp=12700}}
b[29359]={n="An Old Favorite",f="Both",k="daily",r={i={{n="Bag of Shiny Things",q=1,ic=133645}},mo=331700,xp=12700}}
b[29360]={n="Would You Like Some Flies With That?",f="Both",k="daily",r={mo=331700,xp=12700}}
b[29362]={n="\"Magic\" Mushrooms",f="Both",k="daily",r={mo=331700,xp=12700}}
b[29363]={n="Mulgore Spice Bread",f="Both",k="daily",r={mo=331700,xp=12700}}
b[29364]={n="Corn Mash",f="Both",k="daily",r={mo=331700,xp=12700},o={"0/6 Grind Corn Kernels"}}
b[29365]={n="Perfectly Picked Portions",f="Both",k="daily",r={mo=331700,xp=12700}}
b[29438]={n="He Shoots, He Scores!",f="Both",k="daily",r={i={{n="Darkmoon Game Prize",q=2,ic=134143}}},o={"0/25 Targets Hit"}}
b[29455]={n="Target: Turtle",f="Both",k="daily",r={i={{n="Darkmoon Game Prize",q=2,ic=134143}}},o={"0/3 Rings Landed"}}
b[29463]={n="It's Hammer Time",f="Both",k="daily",r={i={{n="Darkmoon Game Prize",q=2,ic=134143}}},o={"0/30 Gnolls Whacked"}}
b[30146]={n="Snack Time",f="Both",k="daily",r={mo=137400,xp=55}}
b[30147]={n="Fragments of the Past",f="Both",k="daily",r={mo=137400,xp=55}}
b[30148]={n="Just a Flesh Wound",f="Both",k="daily",r={mo=137400,xp=55},o={"0/8 Injured Hatchlings bandaged"}}
b[30149]={n="A Feast for the Senses",f="Both",k="daily",r={mo=137400,xp=55}}
b[30317]={n="Water, Water Everywhere",f="Both",k="daily",r={mo=137400,xp=55},o={"0/35 Dusty Spots watered"}}
b[30318]={n="Chasing the Chicken",f="Both",k="daily",r={mo=137400,xp=55}}
b[30319]={n="Pest Problems",f="Both",k="daily",r={mo=137400,xp=55},o={"0/25 Black-Nose Marmot stomped"}}
b[30321]={n="Weed War II",f="Both",k="daily",r={mo=137400,xp=55},o={"0/100 Weeds pulled"}}
b[30322]={n="Money Matters",f="Both",k="daily",r={mo=137400,xp=55}}
b[30323]={n="They Don't Even Wear Them",f="Both",k="daily",r={mo=137400,xp=55}}
b[30324]={n="Not in Chee-Chee's Backyard",f="Both",k="daily",r={mo=137400,xp=55},o={"0/8 Kunzen tribe member slain"}}
b[30325]={n="Where It Counts",f="Both",k="daily",r={mo=137400,xp=55},o={"0/8 Kunzen Ritual Candle thrown","0/4 Blazing Ember kicked","0/1   slain"}}
b[30326]={n="The Kunzen Legend-Chief",f="Both",k="daily",r={mo=137400,xp=55}}
b[30327]={n="You Have to Burn the Ropes",f="Both",k="daily",r={mo=137400,xp=55},o={"0/6 Rope Burned"}}
b[30333]={n="The Lesser of Two Evils",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1   slain"}}
b[30334]={n="Stealing is Bad... Re-Stealing is OK",f="Both",k="daily",r={mo=137400,xp=55}}
b[30335]={n="Stalling the Ravage",f="Both",k="daily",r={mo=137400,xp=55},o={"0/12 Kunzen hozen slain"}}
b[30336]={n="The Kunzen Hunter-Chief",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1 Kunzen Hunter-Chief slain"}}
b[30337]={n="Simian Sabotage",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1 Stolen weapons exploded","0/1 Stolen tools exploded","0/1 Stolen beer exploded","0/1 Stolen grain exploded"}}
b[30470]={n="A Gift For Tina",f="Both",k="daily",r={mo=137400,xp=55}}
b[30471]={n="A Gift For Chee Chee",f="Both",k="daily",r={mo=137400,xp=55}}
b[30472]={n="A Gift For Sho",f="Both",k="daily",r={mo=137400,xp=55}}
b[30473]={n="A Gift For Fish",f="Both",k="daily",r={mo=137400,xp=55}}
b[30474]={n="A Gift For Ella",f="Both",k="daily",r={mo=137400,xp=55}}
b[30475]={n="A Gift For Fung",f="Both",k="daily",r={mo=137400,xp=55}}
b[30476]={n="A Gift For Old Hillpaw",f="Both",k="daily",r={mo=137400,xp=55}}
b[30477]={n="A Gift For Haohan",f="Both",k="daily",r={mo=137400,xp=55}}
b[30478]={n="A Gift For Jogu",f="Both",k="daily",r={mo=137400,xp=55}}
b[30479]={n="A Gift For Gina",f="Both",k="daily",r={mo=137400,xp=55}}
b[31288]={n="Research Project: The Mogu Dynasties",f="Both",k="daily",r={mo=137400,xp=55},o={"11/20 Mogu Archaeology Fragments obtained"}}
b[31291]={n="Uncovering the Past",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1 Artifact of Pandaria Solved"}}
b[31443]={n="Flying Tiger Gourami",f="Both",k="daily",r={mo=137400}}
b[31444]={n="Spinefish Alpha",f="Both",k="daily",r={mo=137400}}
b[31446]={n="Mimic Octopus",f="Both",k="daily",r={mo=137400}}
b[31669]={n="The Cabbage Test",f="Both",k="daily",r={mo=68700,xp=25},o={"0/1 Plant Green Cabbage Seeds"}}
b[31670]={n="That Dangling Carrot",f="Both",k="daily",r={mo=68700,xp=25},o={"0/1 Plant Juicycrunch Carrot Seeds"}}
b[31671]={n="Why Not Scallions?",f="Both",k="daily",r={mo=68700,xp=25},o={"0/1 Plant Scallion Seeds"}}
b[31672]={n="A Pumpkin-y Perfume",f="Both",k="daily",r={mo=68700,xp=25},o={"0/1 Plant Mogu Pumpkin Seeds"}}
b[31673]={n="Red Blossom Leeks, You Make the Croc-in' World Go Down",f="Both",k="daily",r={mo=68700,xp=25},o={"0/1 Plant Red Blossom Leek Seeds"}}
b[31675]={n="The White Turnip Treatment",f="Both",k="daily",r={mo=68700,xp=25},o={"0/1 Plant White Turnip Seeds"}}
b[31941]={n="Squash Those Foul Odors",f="Both",k="daily",r={mo=68700,xp=25},o={"0/1 Plant Jade Squash Seeds"}}
b[31942]={n="It's Melon Time",f="Both",k="daily",r={mo=68700,xp=25},o={"0/1 Plant Striped Melon Seeds"}}
b[31943]={n="Which Berries? Witchberries.",f="Both",k="daily",r={mo=68700,xp=25},o={"0/1 Plant Witchberry Seeds"}}
b[32107]={n="Flying Tiger Gourami",f="Both",k="daily",r={mo=137400},o={"0/1 Flying Tiger Gourami"}}
b[33146]={n="Noodle Time",f="Both",k="daily",r={mo=274800,xp=65},o={"0/1 Queue for your next shift through Sungshin Ironpaw","0/1 Complete a shift at the Halfhill noodle stand"}}
b[33358]={n="Noodle Time: Bonus",f="Both",k="daily",r={mo=274800,xp=65},o={"0/1 Queue for your next shift through Sungshin Ironpaw","0/1 Complete the bonus objective during the scenario: Noodle Time"}}
b[35147]={n="Fragments of the Past",f="Both",k="daily"}
b[40896]={n="Threnody of Chieftains",k="worldquest",r={mo=693200,xp=70},o={"Burial Ground cleansed (0%)","0/3 Resurrected Chieftain slain"}}
b[41446]={n="Darkened Felslate Deposits",k="worldquest",r={i={{n="Felslate",q=1,ct=40,ic=1394961}}}}
b[42075]={n="Botanical Backlash",k="worldquest",r={i={{n="Blood of Sargeras",q=3,ic=1417744}},mo=202200,xp=70},o={"0/1   slain","0/5   slain","0/10 Corrupted Plantlife slain"}}
b[42108]={n="Rally the Nightwatchers",k="worldquest",r={mo=202200,xp=70},o={"0/1   slain","0/1   slain","0/10 Nightwatcher Rallied"}}
b[42124]={n="Hags and Hexes",k="worldquest",r={mo=593100,xp=70},o={"0/5 Sylvan Owl saved","0/7 Cragtalon Harpy slain","0/1   slain"}}
b[42712]={n="Eye of Azshara: Termination Claws",k="worldquest",r={i={{n="Tumultuous Aftershock",q=4,ic=348539}},mo=202200,xp=70},o={"0/1 Gom Crabbar slain","0/1 Wrath of Azshara slain"}}
b[43183]={n="Warden Tower Assault: Starstalker's Point",k="worldquest",r={ho=30},o={"Kill Horde Forces or Players (0%)","0/1 Queensguard captain slain"}}
b[43943]={n="Withered Army Training",k="worldquest",r={i={{n="Access to the Ruins of Falanaar",q=1,ic=1409002}},mo=202200,xp=70},o={"0/1 Bring 400 Ancient Mana to Thalyssra"}}
b[43963]={n="Vampirates!",k="worldquest",r={mo=202200,xp=70},o={"0/10 Stolen artifacts collected"}}
b[43964]={n="A Jarl's Feast",k="worldquest",r={mo=202200,xp=70},o={"Revelry. (0%)","0/1 Pay respects to the Fallen Jarl"}}
b[44301]={n="WANTED: Bahagar",k="worldquest",r={mo=202200,xp=70},o={"0/1   slain"}}
b[44811]={n="Help on the Way",k="worldquest",r={i={{n="Ambition of the Forlorn",q=4,ic=135922}},mo=202200,xp=70},o={"0/8 Notices served"}}
b[45379]={n="Treasure Master Iks'reeged",k="worldquest",r={i={{n="Wyrmtongue's Cache Key",q=3,ic=134245}},mo=202200,xp=70},o={"0/1 Bring 100 Nethershards to Iks'reeged"}}
b[45791]={n="War Materiel",k="worldquest",r={mo=697900,xp=70}}
b[47828]={n="Memories of the Fallen",k="worldquest",r={mo=780500,xp=70}}
b[48095]={n="Dark Experimentation",k="worldquest",r={mo=202200,xp=70},o={"0/8 Test subjects released"}}
b[48097]={n="Gatekeeper's Review: Cunning",k="worldquest",r={mo=823900,xp=70}}
b[48175]={n="Hidden in the Hollows",k="worldquest",r={mo=202200,xp=70},o={"0/1 Enter the Void Tear"}}
b[48192]={n="Tar Spitter",k="worldquest",r={i={{n="Primal Sargerite",q=3,ct=5,ic=1686582}},mo=606600,xp=100},o={"0/1   slain"}}
b[48287]={n="Harvesters of Sorrow",k="worldquest",r={i={{n="Primal Sargerite",q=3,ic=1686582}},mo=202200,xp=70},o={"0/1 Western Soul Harvester destroyed","0/1 Eastern Soul Harvester destroyed","0/1 Northern Soul Harvester destroyed"}}
b[48502]={n="Naroua, King of the Forest",k="worldquest",r={mo=606600,xp=100},o={"0/1 Naroua slain"}}
b[48511]={n="Commander Endaxis",k="worldquest",r={i={{n="Primal Sargerite",q=3,ct=5,ic=1686582}},mo=606600,xp=100},o={"0/1   slain"}}
b[48592]={n="Holding the Spire",k="worldquest",r={mo=202200,xp=70},o={"0/1 Take control of the Lightforged Warframe"}}
b[48662]={n="Short Fuses",k="worldquest",r={mo=202200,xp=70},o={"0/6 Legion Hullbreaker fuses replaced"}}
b[48738]={n="Zul'tan the Numerous",k="worldquest",o={"0/1   slain"}}
b[48957]={n="Seat of the Triumvirate: Void-Blade Zedaat",k="worldquest",r={i={{n="Vault Watcher's Cloak",q=4,ic=1325258}},mo=202200,xp=70},o={"0/1 Void-Blade Zedaat slain","0/1 L'ura slain"}}
b[49042]={n="Foulclaw",k="worldquest",o={"Defeat Foulclaw"}}
b[50518]={n="Zanxib",k="worldquest",r={mo=1822100},o={"0/1   slain"}}
b[50527]={n="Behind Mogu Lines",k="worldquest",o={"0/1 Chao's report received","0/1 Feng's report received","0/1 Pao-me's report received","0/8 Mogu slain"}}
b[50848]={n="Brgl-Lrgl the Basher",k="worldquest",o={"0/1   slain"}}
b[50849]={n="Witch Doctor Habra'du",k="worldquest",o={"0/1   slain"}}
b[50851]={n="Mor'fani the Exile",k="worldquest",o={"0/1   slain"}}
b[50852]={n="Lady Seirine",k="worldquest",o={"0/1   slain"}}
b[50962]={n="Cargo Reclamation",k="worldquest",o={"0/1   slain"}}
b[51084]={n="Dark Chronicler",k="worldquest",o={"0/1   slain"}}
b[51104]={n="Skycaller Teskris",k="worldquest",o={"0/1   slain"}}
b[51118]={n="Bloodwing Bonepicker",k="worldquest",o={"0/1   slain"}}
b[51157]={n="Golanar",k="worldquest",r={i={{n="Herculean Golden Sword",q=3,ic=1788661}}},o={"0/1   slain"}}
b[51185]={n="Azerite Empowerment",k="worldquest",r={i={{n="Azerite Armor Cache",q=3,ic=2201832}}},o={"0/1   slain"}}
b[51212]={n="Waycrest Manor: Witchy Kitchen",k="worldquest",o={"0/1 Executive Chef Daniel slain","0/1 Roast Chef Rhonda slain","0/1 Sauciere Samuel slain","0/1 Gorak Tul slain"}}
b[51225]={n="Albatrocity",k="worldquest",r={i={{n="Pearl Diver's Compass",q=3,ic=134234}}},o={"0/8 Terrified Civilian calmed"}}
b[51245]={n="I'm a Lumberjack and I'm Okay",k="worldquest",o={"0/4 Entangled Lumberjack freed","0/8 Wicker invaders slain"}}
b[51405]={n="Corruption in the Bay",k="worldquest",r={i={{n="Harbormaster Legplates",q=3,ic=1727713}}},o={"Purge the corruption (0%)"}}
b[51450]={n="Azerite Mining",k="worldquest",o={"Azerite recovered (0%)"}}
b[51453]={n="Shrine of the Storm: Behold, Pure Water",k="worldquest",o={"0/3 Mote of Pure Water collected","0/1 Vol'zith the Whisperer slain"}}
b[51454]={n="Once More Into Battle",k="worldquest",o={"Join in the endless battle (0%)"}}
b[51546]={n="It's the Pits",k="worldquest",o={"0/8   slain","0/4 Surveyors rescued"}}
b[51586]={n="Azerite Empowerment",k="worldquest",r={mo=1342800},o={"0/1   slain"}}
b[51617]={n="Azerite Empowerment",k="worldquest",r={i={{n="Azerite Armor Cache",q=3,ic=2201832}}},o={"0/1   slain"}}
b[51625]={n="Shell Game",k="worldquest",o={"0/1 Speak to Collector Kojo"}}
b[51633]={n="Make Loh Go",k="worldquest",o={"0/1 Speak to Toki"}}
b[51635]={n="Make Loh Go",k="worldquest",o={"0/1 Speak to Toki"}}
b[51676]={n="What a Gull Wants",k="worldquest",o={"0/10   slain","0/5 Fishing Rod reeled in"}}
b[51699]={n="Blighted Monstrosity",k="worldquest",o={"0/1   slain"}}
b[51891]={n="Sythian the Swift",k="worldquest",o={"0/1   slain"}}
b[51892]={n="Shiverscale the Toxic",k="worldquest",o={"0/1   slain"}}
b[52871]={n="Azerite Empowerment",k="worldquest",r={i={{n="Azerite Armor Cache",q=3,ic=2201832}}},o={"0/1   slain"}}
b[55304]={n="The Cycle of Life",k="worldquest",o={"0/1 Speak to Scrollsage Nola"}}
b[55341]={n="Calligraphy",k="worldquest",o={"0/1 Speak to Scrollsage Nola"}}
b[55640]={n="Vision of Stormwind",k="worldquest",o={"0/1 Vision of Stormwind completed"}}
b[55887]={n="Champion Alzana, Arrow of Thunder",k="worldquest",o={"0/1   slain"}}
b[55894]={n="Zoko, Her Iron Defender",k="worldquest",r={mo=2259700},o={"0/1   slain"}}
b[56057]={n="The Soulbinder",k="worldquest",o={"0/1   slain","0/1   slain","0/1   slain"}}
b[57328]={n="Trashin' the Camp",k="worldquest",r={mo=2508700,xp=90},o={"Stalker's Lodge assaulted (0%)"}}
b[57336]={n="Putting the Past to Rest",k="worldquest",o={"0/10   slain"}}
b[58207]={n="Buggin' Out",k="worldquest",r={xp=90},o={"0/1 Gain Twigin's aid (Optional)","0/6 Injured Scout saved","0/12 Bony Spindel Insects slain"}}
b[58276]={n="Mar'at In Flames",k="worldquest",r={mo=447500}}
b[58705]={n="Grand Empress Shek'zara",k="worldquest",o={"0/1   slain"}}
b[58744]={n="I Am The One Who Whispers",k="worldquest",o={"Defeat Whispers"}}
b[58746]={n="Tiny Madness",k="worldquest",r={i={{n="Polished Pet Charm",q=1,ct=14,ic=2004597}}},o={"Defeat K'tiny the Mad"}}
b[59743]={n="The Spider on the Wall",k="worldquest",r={i={{n="Steelcore Girdle",q=3,ic=3395742}},xp=90},o={"0/1 Speak with Khaliiq"}}
b[59771]={n="History of Corruption",k="worldquest",r={i={{n="Centurion Power Core",q=3,ct=4,ic=3528288}},xp=90},o={"0/1 Vesper of History rung"}}
b[60655]={n="A Stolen Stone Fiend",k="worldquest",r={i={{n="Darkhaven Soul Lantern",q=3,ct=3,ic=3536205}},xp=90},o={"0/1 Missing Stone Fiend found"}}
b[60739]={n="Tough Crowd",k="worldquest",r={xp=90},o={"0/8   slain"}}
b[61220]={n="AHHH! Real Monsters!",k="worldquest",r={mo=2502600,xp=90},o={"0/1 Assist Aspirant Thetes","Repel the Devourer threat (0%)"}}
b[61303]={n="It's Raining Sparkles",k="worldquest",r={i={{n="Astral Sapwood",q=3,ct=5,ic=134119}},xp=90},o={"0/1 Speak to Lady Moonberry"}}
b[61517]={n="zz",k="worldquest",r={xp=90},o={"0/1 Orophea soothed"}}
b[61596]={n="Cooking: Arden Apple Pie",k="worldquest",r={i={{n="Aethereal Meat",q=1,ct=10,ic=3671885}},xp=90},o={"0/1 Gather materials from the Crafter's Basket"}}
b[61612]={n="Jewelcrafting: Carved Crystal Ring",k="worldquest",r={i={{n="Laestrite Ore",q=1,ct=10,ic=3594132}},xp=90},o={"0/1 Gather materials from the Crafter's Crate"}}
b[61623]={n="Fishing: Bloodthroated Grouper",k="worldquest",r={i={{n="Lost Sole",q=1,ct=20,ic=3535750}},xp=90}}
b[61866]={n="Mighty Minions of Maldraxxus",k="worldquest",r={i={{n="Battle Pet Bandage",q=2,ct=20,ic=133675}},xp=90},o={"Defeat Caregiver Maximillian in a Pet Battle"}}
b[61946]={n="Natural Defenders",k="worldquest",r={i={{n="Polished Pet Charm",q=1,ct=19,ic=2004597}},xp=90},o={"Defeat Glitterdust in a Pet Battle"}}
b[64531]={n="Mor'geth",k="worldquest",r={i={{n="Concentrated Anima",q=4,ct=2,ic=134888}},xp=90},o={"0/1   slain"}}
b[66419]={n="Allegiance to One",k="worldquest",r={xp=130},o={"0/1 Show support to Wrathion or Sabellian"}}
b[66588]={n="Swog the Elder",k="worldquest",r={i={{n="Polished Pet Charm",q=1,ct=16,ic=2004597}},xp=110},o={"Defeat Swog in a Pet Battle"}}
b[67024]={n="Smoldering Reinforcement",k="worldquest",r={xp=110},o={"Primalist Forces Cleared (0%)"}}
b[69928]={n="Liskanoth",k="worldquest",o={"0/1   slain"}}
b[69994]={n="The Field of Ferocity Redux: Elemental Revenge Round!",k="worldquest",r={xp=130},o={"0/1 Primalist challenger defeated"}}
b[70012]={n="Protect the Nets!",k="worldquest",r={mo=907200,xp=110},o={"0/6 Inspect fishing nets"}}
b[70064]={n="For Imbu!",k="worldquest",r={i={{n="Wyrmforged Legguards",q=2,ic=4295889}},xp=130},o={"Imbu liberated (0%)"}}
b[70068]={n="Cobalt Catastrophe",k="worldquest",r={xp=130},o={"Sundered Flame disrupted (0%)"}}
b[70075]={n="Cataloging the Waking Shores",k="worldquest",r={xp=110},o={"0/1 Ride the Cataloger's Raft"}}
b[70112]={n="Furbolg Threat",k="worldquest",r={mo=1002000,xp=110},o={"0/15 Rustpine furbolg slain"}}
b[70146]={n="Highlands Rebuttal",k="worldquest",r={i={{n="Billowing Magmathrower's Cudgel",q=2,ic=4266751}},xp=110},o={"Eliminate Nokhud and primalist forces (0%)"}}
b[70176]={n="Web Victims",k="worldquest",r={xp=110},o={"0/6 Victims Freed"}}
b[70412]={n="Dragonrider Racing - Wild Preserve Slalom",k="worldquest",r={i={{n="Dragon Racer's Purse",q=3,ic=1519429}},xp=110},o={"0/1 Complete the race"}}
b[70646]={n="Pressure Valve",k="worldquest",r={xp=110},o={"Relieve the elemental pressure (0%)"}}
b[70659]={n="Cataloging the Ohn'ahran Plains",k="worldquest",r={i={{n="Wyrmforged Armplates",q=2,ic=4295884}},xp=110},o={"0/1 Ride the Cataloger's Raft"}}
b[71206]={n="Eye of the Stormling",k="worldquest",r={i={{n="Battle Pet Bandage",q=2,ct=17,ic=133675}},xp=110},o={"Defeat Stormamu in a Pet Battle"}}
b[72906]={n="[DNT] Storm Pet Battle",k="worldquest",o={"0/1 [DNT] Defeat Storm Pet Boss Kill Credit"}}
b[73147]={n="Shifting Ground",k="worldquest",r={i={{n="Polished Pet Charm",q=1,ct=17,ic=2004597}}},o={"0/1 Defeat Tremblor in a Pet Battle"}}
b[74292]={n="Deephollow Mysteries",k="worldquest",r={xp=130},o={"0/1 Use Arcane Magnetbubble to breathe underwater (Optional)"}}
b[75267]={n="Kob'rok",k="worldquest",r={xp=130},o={"0/1   slain"}}
b[75269]={n="Kapraku",k="worldquest",r={xp=130},o={"0/1   slain"}}
b[75271]={n="Aquifon",k="worldquest",r={xp=130},o={"0/1   slain"}}
b[75274]={n="Goopal",k="worldquest",r={xp=130},o={"0/1   slain"}}
b[75276]={n="Spinmarrow",k="worldquest",r={xp=130},o={"0/1   slain"}}
b[75285]={n="Alcanon",k="worldquest",r={xp=130},o={"0/1   slain"}}
b[75292]={n="Professor Gastrinax",k="worldquest",r={xp=130},o={"0/1   slain"}}
b[75296]={n="General Zskorro",k="worldquest",r={xp=130},o={"0/1   slain"}}
b[75298]={n="Underlight Queen",k="worldquest",r={xp=130},o={"0/1   slain"}}
b[75322]={n="Klakatak",k="worldquest",r={xp=130},o={"0/1   slain"}}
b[75326]={n="Brullo the Strong",k="worldquest",r={xp=130},o={"0/1 Brullo the Strong","0/1 Gains showed off (Optional)"}}
b[75334]={n="Karokta",k="worldquest",r={xp=130},o={"0/1 Karokta slain"}}
b[75336]={n="Invoq",k="worldquest",r={xp=130},o={"0/1   slain"}}
b[75340]={n="Magtembo",k="worldquest",r={xp=130},o={"0/1   slain"}}
b[75349]={n="Skornak",k="worldquest",r={xp=130},o={"0/1   slain"}}
b[75353]={n="Dinn",k="worldquest",r={xp=130},o={"0/1   slain"}}
b[75358]={n="Flowfy",k="worldquest",r={xp=130},o={"0/1   slain"}}
b[75360]={n="Subterrax",k="worldquest",r={xp=130},o={"0/1   slain"}}
b[75364]={n="Emberdusk",k="worldquest",r={xp=130},o={"0/1   slain"}}
b[75366]={n="Viridian King",k="worldquest",r={xp=130},o={"0/1   slain"}}
b[75459]={n="Brand New Digs",k="worldquest",o={"0/1 Myrrit picked up"}}
b[75476]={n="Colossian",k="worldquest",r={xp=130},o={"0/1   slain"}}
b[78691]={n="The One That Got Away",f="Both",k="daily",r={mo=619600,xp=160},o={"0/1 Defeat Boneseer Hookjaw"}}
b[79381]={n="Captain's Orders: X Marks the Spot",k="worldquest",o={"0/1 Items collected"}}
b[79965]={n="Learn the Ropes or Walk the Plank",k="worldquest",o={"0/1 Swing your sword","0/1 Drink your Health Brew","0/1 Open a chest","0/1 Pick up a spell","0/1 Try reviving a dead pirate"}}
b[80110]={n="Daily Doubloons",k="worldquest",o={"0/1 Captain's Orders completed"}}
b[82535]={n="[REUSE THIS RECORD]",k="worldquest",r={mo=309800,xp=130},o={"Salien Gutters scavenged (0%)"}}
b[82537]={n="[REUSE THIS RECORD]",k="worldquest",r={mo=309800,xp=130},o={"Salien Gutters scavenged (0%)"}}
b[84948]={n="Contract Work",k="worldquest",r={i={{n="Undermine Cartel Work",q=3,ic=4549147}},xp=130},o={"0/1 Sign an Undermine cartel contract"}}
b[91207]={n="Prey: Apex Predator",k="worldquest",r={mo=331700,xp=12700},o={"Defeat enemies to lure out your Prey target (0%)"}}
b[91458]={n="Prey: Endurance Hunter",k="worldquest",r={mo=331700,xp=12700},o={"Chase your Prey (0%)"}}
b[91523]={n="Prey: Concealed Threat",k="worldquest",r={mo=331700,xp=12700},o={"0/5 Empowering Voidsphere destroyed"}}
b[91590]={n="Prey: Concealed Threat",k="worldquest",r={mo=331700,xp=12700},o={"0/5 Empowering Focus destroyed"}}
b[91591]={n="Prey: Concealed Threat",k="worldquest",r={mo=331700,xp=12700},o={"0/5 Empowering Urn destroyed"}}
b[91592]={n="Prey: Concealed Threat",k="worldquest",r={mo=331700,xp=12700},o={"0/5 Empowering Bloom destroyed"}}
b[91594]={n="Prey: Endurance Hunter",k="worldquest",r={mo=331700,xp=12700},o={"Chase your Prey (0%)"}}
b[91595]={n="Prey: Endurance Hunter",k="worldquest",r={mo=331700,xp=12700},o={"Chase your Prey (0%)"}}
b[91596]={n="Prey: Endurance Hunter",k="worldquest",r={mo=331700,xp=12700},o={"Chase your Prey (0%)"}}
b[91601]={n="Prey: Apex Predator",k="worldquest",r={mo=331700,xp=12700},o={"Defeat enemies to lure out your Prey target (0%)"}}
b[91602]={n="Prey: Apex Predator",k="worldquest",r={mo=331700,xp=12700},o={"Defeat enemies to lure out your Prey target (0%)"}}
b[91604]={n="Prey: Apex Predator",k="worldquest",r={mo=331700,xp=12700},o={"Defeat enemies to lure out your Prey target (0%)"}}
b[92018]={n="x.x Testing (YGR)",k="worldquest"}
