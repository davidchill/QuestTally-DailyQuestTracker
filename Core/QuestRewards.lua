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
b[10106]={n="Hellfire Fortifications",f="Both",k="daily",r={i={{n="Mark of Honor Hold",ic=134502}},mo=78750,xp=3100,rep={{n="Honor Hold",v=150}}},o={"0/1 Capture The Overlook","0/1 Capture the Stadium","0/1 Capture Broken Hill"}}
b[10110]={n="Hellfire Fortifications",f="Both",k="daily",r={i={{n="Mark of Thrallmar",ic=134504}},mo=78750,xp=3100,rep={{n="Thrallmar",v=150}}},o={"0/1 Capture The Overlook","0/1 Capture the Stadium","0/1 Capture Broken Hill"}}
b[11008]={n="Fires Over Skettis",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Sha'tari Skyguard",v=350}}},o={"0/20 Monstrous Kaliri Egg Destroyed"}}
b[11015]={n="Netherwing Crystals",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Netherwing",v=250}}}}
b[11016]={n="Nethermine Flayer Hide",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Netherwing",v=250}}}}
b[11017]={n="Netherdust Pollen",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Netherwing",v=250}}}}
b[11018]={n="Nethercite Ore",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Netherwing",v=250}}}}
b[11020]={n="A Slow Death",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Netherwing",v=250}}},o={"0/12 Dragonmaw Peon Camp Poisoned"}}
b[11023]={n="Bomb Them Again!",f="Both",k="daily",r={i={{n="Apexis Shard",ic=133595}},mo=105000,xp=4100,rep={{n="Sha'tari Skyguard",v=500},{n="Ogri'la",v=500}}},o={"0/15 Fel Cannonball Stacks destroyed"}}
b[11035]={n="The Not-So-Friendly Skies...",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Netherwing",v=250}}}}
b[11051]={n="Banish More Demons",f="Both",k="daily",r={i={{n="Kronk's Grab Bag",ic=133649},{n="Apexis Shard",ic=133595}},mo=105000,xp=4100,rep={{n="Ogri'la",v=350}}},o={"0/15 Demons banished"}}
b[11055]={n="The Booterang: A Cure For The Common Worthless Peon",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Netherwing",v=350}}},o={"0/20 Dragonmaw Peon Disciplined"}}
b[11066]={n="Wrangle More Aether Rays!",f="Both",k="daily",r={i={{n="Apexis Shard",ic=133595}},mo=105000,xp=4100,rep={{n="Sha'tari Skyguard",v=350},{n="Ogri'la",v=350}}},o={"0/5 Aether Rays wrangled"}}
b[11076]={n="Picking Up The Pieces...",f="Both",k="daily",r={mo=210000,xp=5150,rep={{n="Netherwing",v=350}}}}
b[11077]={n="Dragons are the Least of Our Problems",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Netherwing",v=350}}},o={"0/15 Nethermine Flayer slain","0/5 Nethermine Ravager slain"}}
b[11080]={n="The Relic's Emanation",f="Both",k="daily",r={i={{n="Apexis Shard",ic=133595}},mo=78750,xp=3100,rep={{n="Ogri'la",v=350}}},o={"Apexis Emanations attained"}}
b[11085]={n="Escape from Skettis",f="Both",k="daily",r={mo=78750,xp=3100,rep={{n="Sha'tari Skyguard",v=150}}},o={"Rescue the Skyguard Prisoner."}}
b[11086]={n="Disrupting the Twilight Portal",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Netherwing",v=500}}},o={"0/20 Deathshadow Agent slain"}}
b[11096]={n="Threat from Above",f="Both",k="daily",r={xp=45},o={"0/20 Gordunni Ogre"}}
b[11097]={n="The Deadliest Trap Ever Laid",f="Both",k="daily",r={mo=210000,xp=5150,rep={{n="Netherwing",v=500}}},o={"Dragonmaw Forces Defeated"}}
b[11101]={n="The Deadliest Trap Ever Laid",f="Both",k="daily",r={mo=210000,xp=5150,rep={{n="Netherwing",v=500}}},o={"Dragonmaw Forces Defeated"}}
b[11153]={n="Break the Blockade",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Valiance Expedition",v=250}}},o={"0/25 Blockade Pirate slain","0/10 Blockade Cannons destroyed"}}
b[11219]={n="Stop the Fires!",f="Both",k="daily",r={i={{n="Hallow's End Pumpkin Treat",ic=134015},{n="Weighted Jack-o'-Lantern",ic=133661}},mo=280900,xp=9500},o={"Put Out the Fires"}}
b[11334]={n="He Shoots, He Scores!",f="Both",k="daily"}
b[11338]={n="Call to Arms: Warsong Gulch",f="Both",k="daily",o={"Victory in Warsong Gulch"}}
b[11339]={n="Call to Arms: Arathi Basin",f="Both",k="daily",o={"Victory in Arathi Basin"}}
b[11342]={n="Call to Arms: Warsong Gulch",f="Both",k="daily",o={"Victory in Warsong Gulch"}}
b[11354]={n="WANTED: Nazan's Riding Crop",f="Both",k="daily",r={mo=315000,xp=6200,rep={{n="The Consortium",v=350},{n="Thrallmar",v=350},{n="Honor Hold",v=350}}}}
b[11362]={n="WANTED: Keli'dan's Feathered Stave",f="Both",k="daily",r={mo=315000,xp=6200,rep={{n="The Consortium",v=350},{n="Thrallmar",v=350},{n="Honor Hold",v=350}}}}
b[11363]={n="WANTED: Bladefist's Seal",f="Both",k="daily",r={mo=315000,xp=6200,rep={{n="The Consortium",v=350},{n="Thrallmar",v=350},{n="Honor Hold",v=350}}}}
b[11364]={n="WANTED: Shattered Hand Centurions",f="Both",k="daily",r={i={{n="Ethereum Prison Key",ic=134889}},mo=210000,xp=4100,rep={{n="The Consortium",v=250},{n="Honor Hold",v=250},{n="Thrallmar",v=250}}},o={"0/4   slain"}}
b[11368]={n="WANTED: The Heart of Quagmirran",f="Both",k="daily",r={mo=315000,xp=6200,rep={{n="The Consortium",v=350},{n="Cenarion Expedition",v=350}}}}
b[11370]={n="WANTED: The Warlord's Treatise",f="Both",k="daily",r={mo=315000,xp=6200,rep={{n="The Consortium",v=350},{n="Cenarion Expedition",v=350}}}}
b[11371]={n="WANTED: Coilfang Myrmidons",f="Both",k="daily",r={i={{n="Ethereum Prison Key",ic=134889}},mo=210000,xp=4100,rep={{n="The Consortium",v=250},{n="Cenarion Expedition",v=250}}},o={"0/14 Coilfang Myrmidon slain"}}
b[11372]={n="WANTED: The Headfeathers of Ikiss",f="Both",k="daily",r={mo=315000,xp=6200,rep={{n="The Consortium",v=350},{n="Lower City",v=350}}}}
b[11373]={n="WANTED: Shaffar's Wondrous Pendant",f="Both",k="daily",r={mo=315000,xp=6200,rep={{n="The Consortium",v=500}}}}
b[11374]={n="WANTED: The Exarch's Soul Gem",f="Both",k="daily",r={mo=315000,xp=6200,rep={{n="The Consortium",v=350},{n="Lower City",v=350}}}}
b[11375]={n="WANTED: Murmur's Whisper",f="Both",k="daily",r={mo=315000,xp=6200,rep={{n="The Consortium",v=350},{n="Lower City",v=350}}}}
b[11376]={n="WANTED: Malicious Instructors",f="Both",k="daily",r={i={{n="Ethereum Prison Key",ic=134889}},mo=210000,xp=4100,rep={{n="The Consortium",v=250},{n="Lower City",v=250}}},o={"0/3 Malicious Instructor slain"}}
b[11377]={n="Revenge is Tasty",f="Both",k="daily",r={xp=4100}}
b[11378]={n="WANTED: The Epoch Hunter's Head",f="Both",k="daily",r={mo=315000,xp=6200,rep={{n="The Consortium",v=350},{n="Keepers of Time",v=350}}}}
b[11379]={n="Super Hot Stew",f="Both",k="daily",r={xp=4100}}
b[11380]={n="Manalicious",f="Both",k="daily",r={c={{n="Barrel of Fish",q=1,ic=132620},{n="Crate of Meat",q=1,ic=132765}},xp=4100}}
b[11381]={n="Soup for the Soul",f="Both",k="daily",r={c={{n="Barrel of Fish",q=1,ic=132620},{n="Crate of Meat",q=1,ic=132765}},xp=4100}}
b[11382]={n="WANTED: Aeonus's Hourglass",f="Both",k="daily",r={mo=315000,xp=6200,rep={{n="The Consortium",v=350},{n="Keepers of Time",v=350}}}}
b[11383]={n="WANTED: Rift Lords",f="Both",k="daily",r={i={{n="Ethereum Prison Key",ic=134889}},mo=210000,xp=4100,rep={{n="The Consortium",v=250},{n="Keepers of Time",v=250}}},o={"0/4 Rift Lord slain"}}
b[11384]={n="WANTED: A Warp Splinter Clipping",f="Both",k="daily",r={mo=315000,xp=6200,rep={{n="The Consortium",v=350},{n="The Sha'tar",v=350}}}}
b[11385]={n="WANTED: Sunseeker Channelers",f="Both",k="daily",r={i={{n="Ethereum Prison Key",ic=134889}},mo=210000,xp=4100,rep={{n="The Consortium",v=250},{n="The Sha'tar",v=250}}},o={"0/6 Sunseeker Channeler slain"}}
b[11386]={n="WANTED: Pathaleon's Projector",f="Both",k="daily",r={mo=315000,xp=6200,rep={{n="The Consortium",v=350},{n="The Sha'tar",v=350}}}}
b[11387]={n="WANTED: Tempest-Forge Destroyers",f="Both",k="daily",r={i={{n="Ethereum Prison Key",ic=134889}},mo=210000,xp=4100,rep={{n="The Consortium",v=250},{n="The Sha'tar",v=250}}},o={"0/5 Tempest-Forge Destroyer slain"}}
b[11388]={n="WANTED: The Scroll of Skyriss",f="Both",k="daily",r={mo=315000,xp=6200,rep={{n="The Consortium",v=350},{n="The Sha'tar",v=350}}}}
b[11389]={n="WANTED: Arcatraz Sentinels",f="Both",k="daily",r={i={{n="Ethereum Prison Key",ic=134889}},mo=210000,xp=4100,rep={{n="The Consortium",v=250},{n="The Sha'tar",v=250}}},o={"0/5 Arcatraz Sentinel slain"}}
b[11410]={n="The One That Got Away",f="Both",k="daily",r={mo=105000,xp=45},o={"0/1 Frostfin slain"}}
b[11472]={n="The Way to His Heart...",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="The Kalu'ak",v=250}}},o={"Reef Bull led to a Reef Cow"}}
b[11499]={n="WANTED: The Signet Ring of Prince Kael'thas",f="Both",k="daily",r={mo=315000,xp=6200,rep={{n="The Consortium",v=350},{n="Shattered Sun Offensive",v=350}}}}
b[11500]={n="WANTED: Sisters of Torment",f="Both",k="daily",r={i={{n="Ethereum Prison Key",ic=134889}},mo=210000,xp=4100,rep={{n="The Consortium",v=250},{n="Shattered Sun Offensive",v=250}}},o={"0/4 Sister of Torment slain"}}
b[11502]={n="In Defense of Halaa",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Kurenai",v=250}}},o={"0/10 Halaa Enemy Combatant slain"}}
b[11503]={n="Enemies, Old and New",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="The Mag'har",v=250}}},o={"0/10 Halaa Enemy Combatant slain"}}
b[11505]={n="Spirits of Auchindoun",f="Both",k="daily",r={mo=105000,xp=4100},o={"Secure a Spirit Tower"}}
b[11506]={n="Spirits of Auchindoun",f="Both",k="daily",r={mo=105000,xp=4100},o={"Secure a Spirit Tower"}}
b[11514]={n="Maintaining the Sunwell Portal",f="Both",k="daily",r={i={{n="Shattered Sun Supplies",ic=133646}},mo=105000,xp=3100,rep={{n="Shattered Sun Offensive",v=250}}}}
b[11515]={n="Blood for Blood",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Shattered Sun Offensive",v=250}}},o={"0/4 Emaciated Felblood slain"}}
b[11516]={n="Blast the Gateway",f="Both",k="daily",r={i={{n="Shattered Sun Supplies",ic=133646}},mo=105000,xp=3100,rep={{n="Shattered Sun Offensive",v=250}}},o={"Legion Gateway Destroyed"}}
b[11521]={n="Rediscovering Your Roots",f="Both",k="daily",r={i={{n="Shattered Sun Supplies",ic=133646}},mo=105000,xp=4100,rep={{n="Shattered Sun Offensive",v=350}}}}
b[11523]={n="Arm the Wards!",f="Both",k="daily",r={mo=78750,xp=3100,rep={{n="Shattered Sun Offensive",v=150}}},o={"Energize a Crystal Ward"}}
b[11525]={n="Further Conversions",f="Both",k="daily",r={mo=78750,xp=3100,rep={{n="Shattered Sun Offensive",v=150}}},o={"0/5 Converted Sentry Deployed"}}
b[11533]={n="The Air Strikes Must Continue",f="Both",k="daily",r={mo=78750,xp=3100,rep={{n="Shattered Sun Offensive",v=150}}},o={"0/2 Pit Overlord slain","0/3 Eredar Sorcerer slain","0/12 Wrath Enforcer slain"}}
b[11536]={n="Don't Stop Now....",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Shattered Sun Offensive",v=250}}}}
b[11537]={n="The Battle Must Go On",f="Both",k="daily",r={mo=105000,xp=3100,rep={{n="Shattered Sun Offensive",v=250}}},o={"0/1 Emissary of Hate impaled","0/6 Burning Legion Demon slain"}}
b[11540]={n="Crush the Dawnblade",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Shattered Sun Offensive",v=250}}},o={"0/6 Dawnblade Summoner slain","0/6 Dawnblade Blood Knight slain","0/3 Dawnblade Marksman slain"}}
b[11541]={n="Disrupt the Greengill Coast",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Shattered Sun Offensive",v=250}}},o={"0/10 Greengill Slave freed"}}
b[11543]={n="Keeping the Enemy at Bay",f="Both",k="daily",r={xp=4100,rep={{n="Shattered Sun Offensive",v=250}}},o={"0/1 Sin'loren sails burned","0/1 Bloodoath sails burned","0/1 Dawnchaser sails burned","0/6 Dawnblade Reservist slain"}}
b[11544]={n="Ata'mal Armaments",f="Both",k="daily",r={mo=210000,xp=5150,rep={{n="Shattered Sun Offensive",v=350}}}}
b[11546]={n="Open for Business",f="Both",k="daily",r={i={{n="Bloodberry Elixir",ic=134734}},mo=105000,xp=4100,rep={{n="Shattered Sun Offensive",v=250}}}}
b[11547]={n="Know Your Ley Lines",f="Both",k="daily",r={i={{n="Darnarian's Scroll of Teleportation",ic=134938}},mo=105000,xp=4100,rep={{n="Shattered Sun Offensive",v=250}}},o={"0/1 Portal Reading Taken","0/1 Shrine Reading Taken","0/1 Bloodcrystal Reading Taken"}}
b[11665]={n="Crocolisks in the City",f="Both",k="daily",r={i={{n="Bag of Fishing Treasures",ic=133630}}}}
b[11666]={n="Bait Bandits",f="Both",k="daily",r={i={{n="Bag of Fishing Treasures",ic=133630}}}}
b[11667]={n="The One That Got Away",f="Both",k="daily",r={i={{n="Bag of Fishing Treasures",ic=133630}}}}
b[11668]={n="Shrimpin' Ain't Easy",f="Both",k="daily",r={i={{n="Bag of Fishing Treasures",ic=133630}}}}
b[11669]={n="Felblood Fillet",f="Both",k="daily",r={i={{n="Bag of Fishing Treasures",ic=133630}}}}
b[11691]={n="Summon Ahune",f="Both",k="daily",r={mo=280900,xp=9500}}
b[11875]={n="Gaining the Advantage",f="Both",k="daily",r={i={{n="Major Rejuvenation Potion",ic=134771}},mo=210000,xp=4100,rep={{n="Shattered Sun Offensive",v=250}}}}
b[11877]={n="Sunfury Attack Plans",f="Both",k="daily",r={i={{n="Shattered Sun Supplies",ic=133646}},mo=105000,xp=3100,rep={{n="Shattered Sun Offensive",v=250}}}}
b[11880]={n="The Multiphase Survey",f="Both",k="daily",r={mo=78750,xp=3100,rep={{n="Shattered Sun Offensive",v=150}}},o={"0/6 Multiphase Readings Taken"}}
b[11919]={n="Drake Hunt",f="Both",k="daily",r={mo=105000,xp=45},o={"0/1 Captured Nexus Drake"}}
b[11921]={n="More Torch Tossing",f="Both",k="daily",r={mo=280900,xp=9500},o={"Hit 20 braziers."}}
b[11924]={n="More Torch Catching",f="Both",k="daily",r={mo=280900,xp=9500},o={"0/10 Torches caught"}}
b[11940]={n="Drake Hunt",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="The Wyrmrest Accord",v=250}}},o={"0/1 Captured Nexus Drake"}}
b[11945]={n="Preparing for the Worst",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="The Kalu'ak",v=250}}}}
b[11960]={n="Planning for the Future",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="The Kalu'ak",v=250}}}}
b[12029]={n="Seared Scourge",f="Both",k="daily",r={mo=105000,xp=45},o={"0/20 Scourge Trolls Burned"}}
b[12038]={n="Seared Scourge",f="Both",k="daily",r={mo=105000,xp=4100},o={"0/30 Scourge Trolls Burned"}}
b[12044]={n="Stocking Up",f="Both",k="daily",r={mo=105000,xp=45}}
b[12133]={n="Smash the Pumpkin",f="Both",k="daily",r={i={{n="Crudely Wrapped Gift"}},mo=280900,xp=9500}}
b[12170]={n="Blackriver Brawl",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Horde Expedition",v=250}}},o={"0/10 Alliance in Blackriver slain"}}
b[12244]={n="Shredder Repair",f="Both",k="daily",r={i={{n="Key to Refurbished Shredder",ic=134248}},mo=105000,xp=4100,rep={{n="Valiance Expedition",v=250}}},o={"0/3 Shredder Delivered"}}
b[12268]={n="Pieces Parts",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Valiance Expedition",v=250}}}}
b[12270]={n="Shred the Alliance",f="Both",k="daily",r={i={{n="Key to Refurbished Shredder",ic=134248}},mo=105000,xp=4100,rep={{n="Warsong Offensive",v=250}}},o={"0/3 Shredder delivered"}}
b[12280]={n="Making Repairs",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Warsong Offensive",v=250}}},o={"0/4 Grooved Cog","0/3 Notched Sprocket","0/2 High Tension Spring"}}
b[12284]={n="Keep 'Em on Their Heels",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Warsong Offensive",v=250}}},o={"0/15 Alliance units eliminated"}}
b[12288]={n="Overwhelmed!",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Warsong Offensive",v=250}}},o={"0/10 Wounded Skirmishers Healed"}}
b[12289]={n="Kick 'Em While They're Down",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Valiance Expedition",v=250}}},o={"0/15 Horde units eliminated"}}
b[12296]={n="Life or Death",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Valiance Expedition",v=250}}},o={"0/10 Westfall Infantry Healed"}}
b[12314]={n="Down With Captain Zorna!",f="Both",k="daily",r={mo=105000,xp=4100},o={"0/1 Captain Zorna slain"}}
b[12315]={n="Crush Captain Brightwater!",f="Both",k="daily",r={mo=105000,xp=4100},o={"0/1 Captain Brightwater slain"}}
b[12323]={n="Smoke 'Em Out",f="Both",k="daily",r={mo=105000,xp=4100},o={"0/20 Venture Company Stragglers smoked out"}}
b[12372]={n="Defending Wyrmrest Temple",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="The Wyrmrest Accord",v=250}}},o={"0/3 Azure Dragon slain","0/5 Azure Drake slain","0/1 Destabilize the Azure Dragonshrine"}}
b[12432]={n="Riding the Red Rocket",f="Both",k="daily",r={mo=105000,xp=4100},o={"0/1 Destroyed Alliance Lumber Shipment"}}
b[12437]={n="Riding the Red Rocket",f="Both",k="daily",r={mo=105000,xp=4100},o={"0/1 Horde Lumberboat destroyed"}}
b[12444]={n="Blackriver Skirmish",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Valiance Expedition",v=250}}},o={"0/10 Horde in Blackriver slain"}}
b[12501]={n="Troll Patrol",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Argent Crusade",v=350}}},o={"0/1 Captain Brandon's Task","0/1 Captain Rupert's Task","0/1 Captain Grondel's Task","0/1 Alchemist Finklestein's's Task"}}
b[12502]={n="Troll Patrol: High Standards",f="Both",k="daily",r={mo=26250,xp=1050},o={"0/1 Argent Crusade Banner South","0/1 Argent Crusade Banner North","0/1 Argent Crusade Banner East"}}
b[12509]={n="Troll Patrol: Intestinal Fortitude",f="Both",k="daily",r={mo=26250,xp=1050},o={"0/5 Recruit's Courage Restored"}}
b[12519]={n="Troll Patrol: Whatdya Want, a Medal?",f="Both",k="daily",r={mo=26250,xp=1050}}
b[12541]={n="Troll Patrol: The Alchemist's Apprentice",f="Both",k="daily",r={mo=26250,xp=1050},o={"0/1 Truth Serum Created"}}
b[12563]={n="Troll Patrol",f="Both",k="daily",r={mo=105000,xp=45},o={"0/1 Captain Brandon's Task","0/1 Captain Rupert's Task","0/1 Captain Grondel's Task","0/1 Alchemist Finklestein's Task"}}
b[12582]={n="Frenzyheart Champion",f="Both",k="daily",r={mo=52500,xp=2050}}
b[12587]={n="Troll Patrol",f="Both",k="daily",r={mo=105000,xp=45},o={"0/1 Captain Brandon's Task","0/1 Captain Rupert's Task","0/1 Captain Grondel's Task","0/1 Alchemist Finklestein's Task"}}
b[12689]={n="Hand of the Oracles",f="Both",k="daily",r={mo=52500,xp=2050}}
b[12702]={n="Chicken Party!",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Frenzyheart Tribe",v=250}}}}
b[12704]={n="Appeasing the Great Rain Stone",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="The Oracles",v=250}}}}
b[12705]={n="Will of the Titans",f="Both",k="daily",r={mo=210000,xp=5150,rep={{n="The Oracles",v=350}}},o={"0/50 Frenzyheart Attacker slain"}}
b[12726]={n="Song of Wind and Water",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="The Oracles",v=250}}},o={"0/3 Aqueous Spirit devoured","0/3 Storm Revenant devoured"}}
b[12732]={n="The Heartblood's Strength",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Frenzyheart Tribe",v=250}}}}
b[12735]={n="A Cleansing Song",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="The Oracles",v=250}}},o={"0/1 Spirit of Atha slain","0/1 Spirit of Ha-Khalan slain","0/1 Spirit of Koosu slain"}}
b[12736]={n="Song of Reflection",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="The Oracles",v=250}}},o={"0/1 Contemplation at Glimmering Pillar","0/1 Contemplation at Mosslight Pillar","0/1 Contemplation at Skyreach Pillar","0/1 Contemplation at Suntouched Pillar"}}
b[12737]={n="Song of Fecundity",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="The Oracles",v=250}}},o={"0/8 Song of Fecundity played"}}
b[12758]={n="A Hero's Headgear",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Frenzyheart Tribe",v=250}}}}
b[12760]={n="Secret Strength of the Frenzyheart",f="Both",k="daily",r={mo=210000,xp=5150,rep={{n="Frenzyheart Tribe",v=350}}},o={"0/30 Sparktouched Gorloc"}}
b[12761]={n="Mastery of the Crystals",f="Both",k="daily",r={mo=210000,xp=5150,rep={{n="The Oracles",v=350}}},o={"0/50 Frenzyheart Attacker"}}
b[12762]={n="Power of the Great Ones",f="Both",k="daily",r={mo=210000,xp=5150,rep={{n="The Oracles",v=350}}},o={"0/30 Frenzyheart Attacker"}}
b[12813]={n="From Their Corpses, Rise!",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Knights of the Ebon Blade",v=250}}},o={"0/10 Scarlet Onslaught corpse transformed"}}
b[12815]={n="No Fly Zone",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Knights of the Ebon Blade",v=250}}},o={"0/10 Onslaught Gryphon Rider slain"}}
b[12833]={n="Overstock",f="Both",k="daily",r={mo=105000,xp=4100},o={"0/12 Garm Invader slain"}}
b[12838]={n="Intelligence Gathering",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Knights of the Ebon Blade",v=250}}}}
b[12869]={n="Pushed Too Far",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="The Frostborn",v=250}}},o={"0/16 Stormpeak Wyrm slain"}}
b[12958]={n="Shipment: Blood Jade Amulet",f="Both",k="daily",r={cu={{n="Dalaran Jewelcrafter's Token",ct=1}},mo=105000,xp=4100,rep={{n="Kirin Tor",v=25}}}}
b[12959]={n="Shipment: Glowing Ivory Figurine",f="Both",k="daily",r={cu={{n="Dalaran Jewelcrafter's Token",ct=1}},mo=105000,xp=4100,rep={{n="Kirin Tor",v=25}}}}
b[12960]={n="Shipment: Wicked Sun Brooch",f="Both",k="daily",r={cu={{n="Dalaran Jewelcrafter's Token",ct=1}},mo=105000,xp=4100,rep={{n="Kirin Tor",v=25}}}}
b[12961]={n="Shipment: Intricate Bone Figurine",f="Both",k="daily",r={cu={{n="Dalaran Jewelcrafter's Token",ct=1}},mo=105000,xp=4100,rep={{n="Kirin Tor",v=25}}}}
b[12962]={n="Shipment: Bright Armor Relic",f="Both",k="daily",r={cu={{n="Dalaran Jewelcrafter's Token",ct=1}},mo=105000,xp=4100,rep={{n="Kirin Tor",v=25}}}}
b[12963]={n="Shipment: Shifting Sun Curio ",f="Both",k="daily",r={cu={{n="Dalaran Jewelcrafter's Token",ct=1}},mo=105000,xp=4100,rep={{n="Kirin Tor",v=25}}}}
b[12977]={n="Hodir's Call",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="The Sons of Hodir",v=350}}},o={"0/5 Niffelem Forefather freed","0/5 Restless Frostborn freed"}}
b[12981]={n="Hot and Cold",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="The Sons of Hodir",v=350}}}}
b[12994]={n="Spy Hunter",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="The Sons of Hodir",v=350}}},o={"0/3 Stormforged Infiltrators Slain"}}
b[12995]={n="Leave Our Mark",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Knights of the Ebon Blade",v=250}}},o={"0/15 Ebon Blade Banner planted near vrykul corpse"}}
b[13003]={n="How To Slay Your Dragon",f="Both",k="daily",r={mo=210000,xp=5150,rep={{n="The Sons of Hodir",v=500}}},o={"0/1 Wild Wyrm Slain"}}
b[13006]={n="A Viscous Cleaning",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="The Sons of Hodir",v=350}}}}
b[13046]={n="Feeding Arngrim",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="The Sons of Hodir",v=350}}},o={"0/5 Arngrim's spirit fed"}}
b[13069]={n="Shoot 'Em Up",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Knights of the Ebon Blade",v=250}}},o={"0/15 Jotunheim Proto-Drakes & their riders shot down"}}
b[13071]={n="Vile Like Fire!",f="Both",k="daily",r={mo=52500,xp=4100,rep={{n="Knights of the Ebon Blade",v=250}}},o={"0/8 Vrykul buildings set ablaze"}}
b[13100]={n="Infused Mushroom Meatloaf",f="Both",k="daily",r={i={{n="Small Spice Bag",ic=133644}},cu={{n="Epicurean's Award",ct=1}},mo=78750,xp=3100,rep={{n="Kirin Tor",v=150}}}}
b[13101]={n="Convention at the Legerdemain",f="Both",k="daily",r={i={{n="Small Spice Bag",ic=133644}},cu={{n="Epicurean's Award",ct=1}},mo=78750,xp=3100,rep={{n="Kirin Tor",v=150}}}}
b[13102]={n="Sewer Stew",f="Both",k="daily",r={i={{n="Small Spice Bag",ic=133644}},cu={{n="Epicurean's Award",ct=1}},mo=78750,xp=3100,rep={{n="Kirin Tor",v=150}}}}
b[13103]={n="Cheese for Glowergold",f="Both",k="daily",r={i={{n="Small Spice Bag",ic=133644}},cu={{n="Epicurean's Award",ct=1}},mo=78750,xp=3100,rep={{n="Kirin Tor",v=150}}}}
b[13107]={n="Mustard Dogs!",f="Both",k="daily",r={i={{n="Small Spice Bag",ic=133644}},cu={{n="Epicurean's Award",ct=2}},mo=78750,xp=3100,rep={{n="Kirin Tor",v=150}}}}
b[13112]={n="Infused Mushroom Meatloaf",f="Both",k="daily",r={i={{n="Small Spice Bag",ic=133644}},cu={{n="Epicurean's Award",ct=1}},mo=78750,xp=3100,rep={{n="Kirin Tor",v=150}}},o={"0/1 Infused Mushroom Meatloaf"}}
b[13113]={n="Convention at the Legerdemain",f="Both",k="daily",r={i={{n="Small Spice Bag",ic=133644}},cu={{n="Epicurean's Award",ct=1}},mo=78750,xp=3100,rep={{n="Kirin Tor",v=150}}},o={"0/4 Northern Stew","0/1 Jug of Wine"}}
b[13114]={n="Sewer Stew",f="Both",k="daily",r={i={{n="Small Spice Bag",ic=133644}},cu={{n="Epicurean's Award",ct=1}},mo=78750,xp=3100,rep={{n="Kirin Tor",v=150}}},o={"0/1 Vegetable Stew"}}
b[13115]={n="Cheese for Glowergold",f="Both",k="daily",r={i={{n="Small Spice Bag",ic=133644}},cu={{n="Epicurean's Award",ct=1}},mo=78750,xp=3100,rep={{n="Kirin Tor",v=150}}},o={"0/1 Wine and Cheese Platter"}}
b[13116]={n="Mustard Dogs!",f="Both",k="daily",r={i={{n="Small Spice Bag",ic=133644}},cu={{n="Epicurean's Award",ct=2}},mo=78750,xp=3100,rep={{n="Kirin Tor",v=150}}},o={"0/1 Mustard Dog Basket"}}
b[13233]={n="No Mercy!",f="Both",k="daily",r={mo=105000,xp=4100,ho=200},o={"0/15 Horde Players slain"}}
b[13234]={n="Make Them Pay!",f="Both",k="daily",r={mo=105000,xp=4100,ho=200},o={"0/15 Horde Players slain"}}
b[13239]={n="Volatility",f="Both",k="daily",r={mo=105000,xp=45},o={"0/3 Field Tests Conducted"}}
b[13261]={n="Volatility",f="Both",k="daily",r={mo=105000,xp=4100},o={"0/3 Field Tests Conducted"}}
b[13264]={n="That's Abominable!",f="Both",k="daily",r={mo=105000,xp=45},o={"0/15 Icy Ghouls Exploded","0/15 Vicious Geists Exploded","0/15 Risen Alliance Soldiers Exploded"}}
b[13276]={n="That's Abominable!",f="Both",k="daily",r={mo=105000,xp=4100},o={"0/15 Icy Ghouls Exploded","0/15 Vicious Geists Exploded","0/15 Risen Alliance Soldiers Exploded"}}
b[13280]={n="King of the Mountain",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Valiance Expedition",v=250}}},o={"0/1 Alliance Battle Standard planted"}}
b[13281]={n="Neutralizing the Plague",f="Both",k="daily",r={mo=315000,xp=6200},o={"0/1 Plague Cauldron Neutralized"}}
b[13283]={n="King of the Mountain",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Warsong Offensive",v=250}}},o={"0/1 Horde Battle Standard planted"}}
b[13284]={n="Assault by Ground",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Valiance Expedition",v=250}}},o={"0/4 Alliance troops escorted to Ymirheim"}}
b[13288]={n="That's Abominable!",f="Both",k="daily",r={c={{n="Scourgebane Pauldrons",q=2,ic=135094}},mo=105000,xp=45},o={"0/15 Icy Ghouls Exploded","0/15 Vicious Geists Exploded","0/15 Risen Alliance Soldiers Exploded"}}
b[13292]={n="The Solution Solution",f="Both",k="daily",r={mo=105000,xp=4100},o={"0/3 Frostbrood Skytalons Destroyed"}}
b[13297]={n="Neutralizing the Plague",f="Both",k="daily",r={mo=315000,xp=70},o={"0/1 Plague Cauldron Neutralized"}}
b[13300]={n="Slaves to Saronite",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Argent Crusade",v=250}}},o={"0/10 Saronite Mine Slave rescued"}}
b[13301]={n="Assault by Ground",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Warsong Offensive",v=250}}},o={"0/4 Horde troops escorted to Ymirheim"}}
b[13302]={n="Slaves to Saronite",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Argent Crusade",v=250}}},o={"0/10 Saronite Mine Slave rescued"}}
b[13309]={n="Assault by Air",f="Both",k="daily",r={mo=105000,xp=45},o={"0/4 Skybreaker Infiltrators dropped"}}
b[13310]={n="Assault by Air",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Warsong Offensive",v=250}}},o={"0/4 Kor'kron Infiltrators dropped"}}
b[13318]={n="Drag and Drop",f="Both",k="daily",r={mo=105000,xp=45},o={"0/3 Dark Subjugator dragged and dropped"}}
b[13321]={n="Retest Now",f="Both",k="daily",r={mo=105000,xp=45},o={"0/1 Writhing Mass Banished"}}
b[13322]={n="Retest Now",f="Both",k="daily",r={mo=105000,xp=4100},o={"0/1 Writhing Mass Banished"}}
b[13323]={n="Drag and Drop",f="Both",k="daily",r={mo=105000,xp=4100},o={"0/3 Dark Subjugators dragged and dropped"}}
b[13330]={n="Blood of the Chosen",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Warsong Offensive",v=250}}},o={"0/20 Ymirheim Vrykul slain"}}
b[13336]={n="Blood of the Chosen",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="Valiance Expedition",v=250}}},o={"0/20 Ymirheim Vrykul slain"}}
b[13342]={n="Not a Bug",f="Both",k="daily",r={mo=105000,xp=45},o={"0/1 Dark Messenger summoned"}}
b[13344]={n="Not a Bug",f="Both",k="daily",r={mo=105000,xp=4100},o={"0/1 Dark Messenger summoned"}}
b[13346]={n="No Rest For The Wicked",f="Both",k="daily",r={mo=315000,xp=70},o={"0/1 Alumeth the Ascended Defeated"}}
b[13350]={n="No Rest For The Wicked",f="Both",k="daily",r={mo=315000,xp=70},o={"0/1 Alumeth the Ascended Slain"}}
b[13352]={n="Drag and Drop",f="Both",k="daily",r={mo=105000,xp=45},o={"0/3 Dark Subjugator dragged and dropped"}}
b[13353]={n="Drag and Drop",f="Both",k="daily",r={mo=105000,xp=4100},o={"0/3 Dark Subjugator dragged and dropped"}}
b[13356]={n="Retest Now",f="Both",k="daily",r={c={{n="Twisted Hooligan Whacker",q=2,ic=133542},{n="Writhing Mace",q=2,ic=133547}},mo=105000,xp=45},o={"0/1 Writhing Mass Banished"}}
b[13358]={n="Not a Bug",f="Both",k="daily",r={c={{n="Legplates of the Northern Expedition",q=2,ic=134686},{n="Gutbuster of Aldur'thar",q=2,ic=132522}},mo=105000,xp=45},o={"0/1 Dark Messenger summoned"}}
b[13365]={n="Not a Bug",f="Both",k="daily",r={mo=105000,xp=45},o={"0/1 Dark Messenger summoned"}}
b[13367]={n="No Rest For The Wicked",f="Both",k="daily",r={mo=315000,xp=70},o={"0/1 Alumeth the Ascended Defeated"}}
b[13368]={n="No Rest For The Wicked",f="Both",k="daily",r={mo=315000,xp=6200},o={"0/1 Alumeth the Ascended Defeated"}}
b[13408]={n="Hellfire Fortifications",f="Both",k="daily",r={i={{n="Mark of Honor Hold",q=1,ct=3,ic=134502}},mo=78750,xp=35},o={"0/1 Capture The Overlook","0/1 Capture the Stadium","0/1 Capture Broken Hill"}}
b[13409]={n="Hellfire Fortifications",f="Both",k="daily",r={i={{n="Mark of Thrallmar",q=1,ct=3,ic=134504}},mo=78750,xp=35},o={"0/1 Capture The Overlook","0/1 Capture the Stadium","0/1 Capture Broken Hill"}}
b[13410]={n="Hellfire Fortifications",f="Both",k="daily",r={i={{n="Mark of Honor Hold",q=1,ct=3,ic=134502}},mo=78750,xp=35},o={"0/1 Capture The Overlook","0/1 Capture the Stadium","0/1 Capture Broken Hill"}}
b[13411]={n="Hellfire Fortifications",f="Both",k="daily",r={i={{n="Mark of Thrallmar",q=1,ct=3,ic=134504}},mo=78750,xp=35},o={"0/1 Capture The Overlook","0/1 Capture the Stadium","0/1 Capture Broken Hill"}}
b[13413]={n="Aces High!",f="Both",k="daily",r={mo=210000,xp=55},o={"0/5 Scalesworn Elites Killed"}}
b[13414]={n="Aces High!",f="Both",k="daily",r={mo=105000,xp=4100,rep={{n="The Wyrmrest Accord",v=250}}},o={"0/5 Scalesworn Elites Slain"}}
b[13422]={n="Maintaining Discipline",f="Both",k="daily",r={i={{n="Hyldnir Spoils",ic=133649}},mo=78750,xp=3100},o={"0/6 Exhausted Vrykul Disciplined"}}
b[13424]={n="Back to the Pit",f="Both",k="daily",r={i={{n="Hyldnir Spoils",ic=133649}},mo=105000,xp=4100},o={"0/6 Hyldsmeet Warbear slain"}}
b[13425]={n="The Aberrations Must Die",f="Both",k="daily",r={i={{n="Hyldnir Spoils",ic=133649}},mo=105000,xp=4100}}
b[13592]={n="A Valiant's Field Training",f="Both",k="daily",r={i={{n="Valiant's Seal",ic=133441}},mo=105000,xp=4100,rep={{n="Stormwind",v=250},{n="The Silver Covenant",v=250}}},o={"0/10 Converted Hero slain"}}
b[13600]={n="A Worthy Weapon",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ct=2,ic=133441}},mo=105000,xp=45}}
b[13603]={n="A Blade Fit For A Champion",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ct=2,ic=133441}},mo=105000,xp=45}}
b[13616]={n="The Edge Of Winter",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ct=2,ic=133441}},mo=105000,xp=45}}
b[13625]={n="Learning The Reins",f="Both",k="daily",r={i={{n="Aspirant's Seal",ic=133443}},mo=78750,xp=4100,rep={{n="The Silver Covenant",v=250}}},o={"0/5 Use Thrust on Melee Target","0/2 Use Shield-Breaker on vulnerable Ranged Target","0/2 Use Charge on vulnerable Charge Target"}}
b[13665]={n="The Grand Melee",f="Both",k="daily",r={i={{n="Valiant's Seal",ic=133441}},mo=105000,xp=4100,rep={{n="Stormwind",v=250},{n="The Silver Covenant",v=250}}}}
b[13666]={n="A Blade Fit For A Champion",f="Both",k="daily",r={i={{n="Aspirant's Seal",ic=133443}},mo=78750,xp=4100,rep={{n="The Silver Covenant",v=250}}},o={"0/1 Ashwood Brand"}}
b[13669]={n="A Worthy Weapon",f="Both",k="daily",r={i={{n="Aspirant's Seal",ic=133443}},mo=78750,xp=4100,rep={{n="The Silver Covenant",v=250}}},o={"0/1 Blade of Drak'Mar"}}
b[13670]={n="The Edge Of Winter",f="Both",k="daily",r={i={{n="Aspirant's Seal",ic=133443}},mo=78750,xp=4100,rep={{n="The Silver Covenant",v=250}}},o={"0/1 Winter's Edge"}}
b[13671]={n="Training In The Field",f="Both",k="daily",r={i={{n="Aspirant's Seal",ic=133443}},mo=78750,xp=4100,rep={{n="The Silver Covenant",v=250}}},o={"0/8 Icecrown Scourge slain"}}
b[13673]={n="A Blade Fit For A Champion",f="Both",k="daily",r={i={{n="Aspirant's Seal",ic=133443}},mo=78750,xp=4100,rep={{n="The Sunreavers",v=250}}},o={"0/1 Ashwood Brand"}}
b[13674]={n="A Worthy Weapon",f="Both",k="daily",r={i={{n="Aspirant's Seal",ic=133443}},mo=78750,xp=4100,rep={{n="The Sunreavers",v=250}}},o={"0/1 Blade of Drak'Mar"}}
b[13675]={n="The Edge Of Winter",f="Both",k="daily",r={i={{n="Aspirant's Seal",q=1,ct=2,ic=133443}},mo=78750,xp=45},o={"0/1 Winter's Edge"}}
b[13676]={n="Training In The Field",f="Both",k="daily",r={i={{n="Aspirant's Seal",ic=133443}},mo=78750,xp=4100,rep={{n="The Sunreavers",v=250}}},o={"0/8 Icecrown Scourge slain"}}
b[13677]={n="Learning The Reins",f="Both",k="daily",r={i={{n="Aspirant's Seal",ic=133443}},mo=78750,xp=4100,rep={{n="The Sunreavers",v=250}}},o={"0/5 Use Thrust on Melee Target","0/2 Use Shield-Breaker on vulnerable Ranged Target","0/2 Use Charge on vulnerable Charge Target"}}
b[13682]={n="Threat From Above",f="Both",k="daily",r={cu={{n="Champion's Seal",ct=2}},xp=4100,rep={{n="Argent Crusade",v=250},{n="The Silver Covenant",v=250}}},o={"0/1 Chillmaw slain","0/3 Cultist Bombardier slain"}}
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
b[13789]={n="Taking Battle To The Enemy",f="Both",k="daily",r={c={{n="Champion's Writ",q=1,ic=237446},{n="Champion's Purse",q=1,ic=133641}},cu={{n="Champion's Seal",ct=1}},xp=4100,rep={{n="Argent Crusade",v=250},{n="The Silver Covenant",v=250}}},o={"0/15 Cult of the Damned member slain"}}
b[13790]={n="Among the Champions",f="Both",k="daily",r={c={{n="Champion's Writ",q=1,ic=237446},{n="Champion's Purse",q=1,ic=133641}},cu={{n="Champion's Seal",ct=1}},xp=4100,rep={{n="Argent Crusade",v=250},{n="The Silver Covenant",v=250}}}}
b[13791]={n="Taking Battle To The Enemy",f="Both",k="daily",r={c={{n="Champion's Writ",q=1,ic=237446},{n="Champion's Purse",q=1,ic=133641}},xp=45},o={"0/15 Cult of the Damned member slain"}}
b[13793]={n="Among the Champions",f="Both",k="daily",r={c={{n="Champion's Writ",q=1,ic=237446},{n="Champion's Purse",q=1,ic=133641}},xp=45},o={"0/4 Mark of the Champion"}}
b[13809]={n="Threat From Above",f="Both",k="daily",r={c={{n="Champion's Writ",q=1,ic=237446},{n="Champion's Purse",q=1,ic=133641}},xp=45},o={"0/1 Chillmaw slain","0/3 Cultist Bombardier slain"}}
b[13810]={n="Taking Battle To The Enemy",f="Both",k="daily",r={c={{n="Champion's Writ",q=1,ic=237446},{n="Champion's Purse",q=1,ic=133641}},xp=45},o={"0/15 Cult of the Damned member slain"}}
b[13811]={n="Among the Champions",f="Both",k="daily",r={c={{n="Champion's Writ",q=1,ic=237446},{n="Champion's Purse",q=1,ic=133641}},xp=45},o={"0/4 Mark of the Champion"}}
b[13812]={n="Threat From Above",f="Both",k="daily",r={c={{n="Champion's Writ",q=1,ic=237446},{n="Champion's Purse",q=1,ic=133641}},xp=45},o={"0/1 Chillmaw slain","0/3 Cultist Bombardier slain"}}
b[13813]={n="Taking Battle To The Enemy",f="Both",k="daily",r={c={{n="Champion's Writ",q=1,ic=237446},{n="Champion's Purse",q=1,ic=133641}},xp=45},o={"0/15 Cult of the Damned member slain"}}
b[13814]={n="Among the Champions",f="Both",k="daily",r={c={{n="Champion's Writ",q=1,ic=237446},{n="Champion's Purse",q=1,ic=133641}},xp=45},o={"0/4 Mark of the Champion"}}
b[13830]={n="The Ghostfish",f="Both",k="daily",r={i={{n="Bag of Fishing Treasures",ic=133630}},xp=4100,rep={{n="Kirin Tor",v=250}}},o={"Discover the Ghostfish mystery"}}
b[13832]={n="Jewel Of The Sewers",f="Both",k="daily",r={i={{n="Bag of Fishing Treasures",ic=133630}},xp=4100,rep={{n="Kirin Tor",v=250}}}}
b[13833]={n="Blood Is Thicker",f="Both",k="daily",r={i={{n="Bag of Fishing Treasures",ic=133630}},xp=4100,rep={{n="Kirin Tor",v=250}}}}
b[13834]={n="Dangerously Delicious",f="Both",k="daily",r={i={{n="Bag of Fishing Treasures",ic=133630}},xp=4100,rep={{n="Kirin Tor",v=250}}}}
b[13846]={n="Contributin' To The Cause",f="Both",k="daily",r={rep={{n="Argent Crusade",v=100}}}}
b[13847]={n="At The Enemy's Gates",f="Both",k="daily",r={i={{n="Valiant's Seal",ic=133441}},mo=105000,xp=4100,rep={{n="Stormwind",v=250},{n="The Silver Covenant",v=250}}},o={"0/15 Boneguard Footman slain","0/10 Boneguard Scout slain","0/3 Boneguard Lieutenant slain"}}
b[13851]={n="At The Enemy's Gates",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/15 Boneguard Footman slain","0/10 Boneguard Scout slain","0/3 Boneguard Lieutenant slain"}}
b[13852]={n="At The Enemy's Gates",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/15 Boneguard Footman slain","0/10 Boneguard Scout slain","0/3 Boneguard Lieutenant slain"}}
b[13854]={n="At The Enemy's Gates",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/15 Boneguard Footman slain","0/10 Boneguard Scout slain","0/3 Boneguard Lieutenant slain"}}
b[13855]={n="At The Enemy's Gates",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/15 Boneguard Footman slain","0/10 Boneguard Scout slain","0/3 Boneguard Lieutenant slain"}}
b[13856]={n="At The Enemy's Gates",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/15 Boneguard Footman slain","0/10 Boneguard Scout slain","0/3 Boneguard Lieutenant slain"}}
b[13857]={n="At The Enemy's Gates",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/15 Boneguard Footman slain","0/10 Boneguard Scout slain","0/3 Boneguard Lieutenant slain"}}
b[13858]={n="At The Enemy's Gates",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/15 Boneguard Footman slain","0/10 Boneguard Scout slain","0/3 Boneguard Lieutenant slain"}}
b[13859]={n="At The Enemy's Gates",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/15 Boneguard Footman slain","0/10 Boneguard Scout slain","0/3 Boneguard Lieutenant slain"}}
b[13860]={n="At The Enemy's Gates",f="Both",k="daily",r={i={{n="Valiant's Seal",q=1,ic=133441}},mo=105000,xp=45},o={"0/15 Boneguard Footman slain","0/10 Boneguard Scout slain","0/3 Boneguard Lieutenant slain"}}
b[13861]={n="Battle Before The Citadel",f="Both",k="daily",r={c={{n="Champion's Writ",q=1,ic=237446},{n="Champion's Purse",q=1,ic=133641}},cu={{n="Champion's Seal",ct=1}},mo=105000,xp=4100,rep={{n="Argent Crusade",v=250},{n="The Silver Covenant",v=250}}},o={"0/3 Boneguard Commander slain"}}
b[13862]={n="Battle Before The Citadel",f="Both",k="daily",r={c={{n="Champion's Writ",q=1,ic=237446},{n="Champion's Purse",q=1,ic=133641}},mo=105000,xp=45},o={"0/3 Boneguard Commander slain"}}
b[13863]={n="Battle Before The Citadel",f="Both",k="daily",r={c={{n="Champion's Writ",q=1,ic=237446},{n="Champion's Purse",q=1,ic=133641}},mo=105000,xp=45},o={"0/3 Boneguard Commander slain"}}
b[13864]={n="Battle Before The Citadel",f="Both",k="daily",r={c={{n="Champion's Writ",q=1,ic=237446},{n="Champion's Purse",q=1,ic=133641}},mo=105000,xp=45},o={"0/3 Boneguard Commander slain"}}
b[14048]={n="Can't Get Enough Turkey",f="Both",k="daily",r={xp=4750,rep={{n="Ironforge",v=150}}}}
b[14051]={n="Don't Forget The Stuffing!",f="Both",k="daily",r={c={{n="Pilgrim's Hat",q=2,ic=133167},{n="Pilgrim's Attire",q=2,ic=135022},{n="Pilgrim's Dress",q=2,ic=132692},{n="Pilgrim's Robe",q=2,ic=132681},{n="Pilgrim's Boots",q=2,ic=132574},{n="Pilgrim's Bounty",q=2,ic=348523}},xp=4750,rep={{n="Ironforge",v=150}}}}
b[14053]={n="We're Out of Cranberry Chutney Again?",f="Both",k="daily",r={c={{n="Pilgrim's Hat",q=2,ic=133167},{n="Pilgrim's Attire",q=2,ic=135022},{n="Pilgrim's Dress",q=2,ic=132692},{n="Pilgrim's Robe",q=2,ic=132681},{n="Pilgrim's Boots",q=2,ic=132574},{n="Pilgrim's Bounty",q=2,ic=348523}},xp=4750,rep={{n="Stormwind",v=150}}}}
b[14054]={n="Easy As Pie",f="Both",k="daily",r={c={{n="Pilgrim's Hat",q=2,ic=133167},{n="Pilgrim's Attire",q=2,ic=135022},{n="Pilgrim's Dress",q=2,ic=132692},{n="Pilgrim's Robe",q=2,ic=132681},{n="Pilgrim's Boots",q=2,ic=132574},{n="Pilgrim's Bounty",q=2,ic=348523}},xp=4750,rep={{n="Darnassus",v=150}}}}
b[14055]={n="She Says Potato",f="Both",k="daily",r={c={{n="Pilgrim's Hat",q=2,ic=133167},{n="Pilgrim's Attire",q=2,ic=135022},{n="Pilgrim's Dress",q=2,ic=132692},{n="Pilgrim's Robe",q=2,ic=132681},{n="Pilgrim's Boots",q=2,ic=132574},{n="Pilgrim's Bounty",q=2,ic=348523}},xp=7150,rep={{n="Stormwind",v=150}}}}
b[25105]={n="Nibbler!  No!",f="Both",k="daily",r={cu={{n="Illustrious Jewelcrafter's Token",ct=1}},xp=4800},o={"0/3 Solid Zephyrites Cut"}}
b[25154]={n="A Present for Lila",f="Both",k="daily",r={cu={{n="Illustrious Jewelcrafter's Token",ct=1}},xp=4800},o={"0/3 Timeless Nightstones Cut"}}
b[25155]={n="Ogrezonians in the Mood",f="Both",k="daily",r={cu={{n="Illustrious Jewelcrafter's Token",ct=1}},xp=4800},o={"0/3 Jagged Jasper Cut"}}
b[25156]={n="Elemental Goo",f="Both",k="daily",r={cu={{n="Illustrious Jewelcrafter's Token",ct=1}},xp=4800}}
b[25157]={n="The Latest Fashion!",f="Both",k="daily",r={cu={{n="Illustrious Jewelcrafter's Token",ct=1}},xp=4800},o={"0/10 Stardust No. 2 Tested"}}
b[25158]={n="Nibbler!  No!",f="Both",k="daily",r={cu={{n="Illustrious Jewelcrafter's Token",ct=1}},xp=4800},o={"0/3 Solid Zephyrites Cut","0/3 Solid Zephyrite"}}
b[25159]={n="The Latest Fashion!",f="Both",k="daily",r={cu={{n="Illustrious Jewelcrafter's Token",ct=1}},xp=4800},o={"0/10 Stardust No. 2 Tested"}}
b[25160]={n="A Present for Lila",f="Both",k="daily",r={cu={{n="Illustrious Jewelcrafter's Token",ct=1}},xp=4800},o={"0/3 Timeless Nightstones Cut","0/3 Timeless Nightstone"}}
b[25161]={n="Ogrezonians in the Mood",f="Both",k="daily",r={cu={{n="Illustrious Jewelcrafter's Token",ct=1}},xp=4800},o={"0/3 Jagged Jasper Cut","0/3 Jagged Jasper"}}
b[25162]={n="Elemental Goo",f="Both",k="daily",r={cu={{n="Illustrious Jewelcrafter's Token",ct=1}},xp=4800},o={"0/10 Elemental Goo"}}
b[26094]={n="Striking Back",f="Both",k="daily",r={mo=105000,xp=45},o={"0/30 Dark Iron attackers slain"}}
b[26153]={n="Penny's Pumpkin Pancakes",f="Both",k="daily",r={cu={{n="Epicurean's Award",ct=1}},mo=280900,xp=9500,rep={{n="Stormwind",v=250}}}}
b[26177]={n="Feeling Crabby?",f="Both",k="daily",r={cu={{n="Epicurean's Award",ct=2}},mo=280900,xp=9500,rep={{n="Stormwind",v=250}}}}
b[26183]={n="The King's Cider",f="Both",k="daily",r={cu={{n="Epicurean's Award",ct=1}},mo=280900,xp=9500,rep={{n="Stormwind",v=250}}}}
b[26190]={n="A Fisherman's Feast",f="Both",k="daily",r={cu={{n="Epicurean's Award",ct=1}},mo=280900,xp=9500,rep={{n="Stormwind",v=250}}}}
b[26192]={n="Orphans Like Cookies Too!",f="Both",k="daily",r={cu={{n="Epicurean's Award",ct=1}},mo=280900,xp=9500,rep={{n="Stormwind",v=250}}}}
b[26220]={n="Everything Is Better with Bacon",f="Both",k="daily",r={cu={{n="Epicurean's Award",ct=2}},mo=280900,xp=9500,rep={{n="Orgrimmar",v=250}}}}
b[26226]={n="Crawfish Creole",f="Both",k="daily",r={cu={{n="Epicurean's Award",ct=1}},mo=280900,xp=9500,rep={{n="Orgrimmar",v=250}}}}
b[26227]={n="Careful, This Fruit Bites Back",f="Both",k="daily",r={cu={{n="Epicurean's Award",ct=1}},mo=280900,xp=9500,rep={{n="Orgrimmar",v=250}}}}
b[26233]={n="Stealing From Our Own",f="Both",k="daily",r={cu={{n="Epicurean's Award",ct=1}},mo=280900,xp=9500,rep={{n="Orgrimmar",v=250}}}}
b[26235]={n="Even Thieves Get Hungry",f="Both",k="daily",r={cu={{n="Epicurean's Award",ct=1}},mo=280900,xp=9500,rep={{n="Orgrimmar",v=250}}}}
b[26414]={n="Hitting a Walleye",f="Both",k="daily",r={i={{n="Bag of Shiny Things",ic=133645}},mo=280900,xp=9500,rep={{n="Stormwind",v=250}}}}
b[26420]={n="Diggin' For Worms",f="Both",k="daily",r={i={{n="Bag of Shiny Things",ic=133645}},mo=280900,xp=9500,rep={{n="Stormwind",v=250}}}}
b[26442]={n="Rock Lobster",f="Both",k="daily",r={i={{n="Bag of Shiny Things",ic=133645}},mo=280900,xp=9500,rep={{n="Stormwind",v=250}}}}
b[26488]={n="Big Gulp",f="Both",k="daily",r={i={{n="Bag of Shiny Things",ic=133645}},mo=280900,xp=9500,rep={{n="Stormwind",v=250}}}}
b[26536]={n="Thunder Falls",f="Both",k="daily",r={i={{n="Bag of Shiny Things",ic=133645}},mo=280900,xp=9500,rep={{n="Stormwind",v=250}}}}
b[26543]={n="Clammy Hands",f="Both",k="daily",r={i={{n="Bag of Shiny Things",ic=133645}},mo=280900,xp=9500,rep={{n="Orgrimmar",v=250}}}}
b[26556]={n="No Dumping Allowed",f="Both",k="daily",r={i={{n="Bag of Shiny Things",ic=133645}},mo=280900,xp=9500,rep={{n="Orgrimmar",v=250}}}}
b[26557]={n="A Staggering Effort",f="Both",k="daily",r={i={{n="Bag of Shiny Things",ic=133645}},mo=280900,xp=9500,rep={{n="Orgrimmar",v=250}}}}
b[26572]={n="A Golden Opportunity",f="Both",k="daily",r={i={{n="Bag of Shiny Things",ic=133645}},mo=280900,xp=9500,rep={{n="Orgrimmar",v=250}}}}
b[26588]={n="A Furious Catch",f="Both",k="daily",r={i={{n="Bag of Shiny Things",ic=133645}},mo=280900,xp=9500,rep={{n="Orgrimmar",v=250}}}}
b[26710]={n="Lost In The Deeps",f="Both",k="daily",r={mo=137400,xp=4800,rep={{n="Therazane",v=250}}},o={"0/1 Pebble brought to safety"}}
b[27046]={n="Fear of Boring",f="Both",k="daily",r={mo=137400,xp=4800,rep={{n="Therazane",v=250}}},o={"0/10 Gyreworm slain"}}
b[27047]={n="Motes",f="Both",k="daily",r={mo=137400,xp=4800,rep={{n="Therazane",v=250}}}}
b[27048]={n="Underground Economy",f="Both",k="daily",r={mo=137400,xp=4800,rep={{n="Therazane",v=250}}}}
b[27049]={n="Soft Rock",f="Both",k="daily",r={mo=137400,xp=4800,rep={{n="Therazane",v=250}}},o={"0/8 Fungal Behemoth slain"}}
b[27050]={n="Fungal Fury",f="Both",k="daily",r={mo=137400,xp=4800,rep={{n="Therazane",v=250}}},o={"0/10 Freshly sprouted mushroom destroyed"}}
b[27051]={n="Through Persistence",f="Both",k="daily",r={mo=137400,xp=4800,rep={{n="Therazane",v=250}}}}
b[27509]={n="Breach in the Defenses",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1 Twilight Portal destroyed"}}
b[27747]={n="Total War",f="Both",k="daily",r={mo=137400,xp=55},o={"0/10 Wildhammer Kegs Smashed"}}
b[27751]={n="Crushing the Wildhammer",f="Both",k="daily",r={mo=137400,xp=55}}
b[27752]={n="Fight Like a Wildhammer",f="Both",k="daily",r={mo=137400,xp=55}}
b[27753]={n="Never Leave a Dinner Behind",f="Both",k="daily",r={mo=137400,xp=55}}
b[27944]={n="Thinning the Brood",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=137400,xp=4800,rep={{n="Baradin's Wardens",v=250}}},o={"0/12   slain"}}
b[27948]={n="A Sticky Task",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=137400,xp=4800,rep={{n="Baradin's Wardens",v=250}}}}
b[27949]={n="The Forgotten",f="Both",k="daily",r={mo=137400,xp=55}}
b[27966]={n="Salvaging the Remains",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=137400,xp=4800,rep={{n="Baradin's Wardens",v=250}}}}
b[27967]={n="First Lieutenant Connor",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=137400,xp=4800,rep={{n="Baradin's Wardens",v=250}}},o={"0/1   slain"}}
b[27970]={n="Captain P. Harris",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=137400,xp=4800,rep={{n="Baradin's Wardens",v=250}}},o={"0/1   slain"}}
b[27971]={n="Rattling Their Cages",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=137400,xp=4800,rep={{n="Baradin's Wardens",v=250}}},o={"0/8   slain"}}
b[27972]={n="Boosting Morale",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=137400,xp=4800,rep={{n="Baradin's Wardens",v=250}}}}
b[27973]={n="Watch Out For Splinters!",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=137400,xp=4800,rep={{n="Baradin's Wardens",v=250}}}}
b[27975]={n="WANTED: Foreman Wellson",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=137400,xp=4800,rep={{n="Baradin's Wardens",v=250}}},o={"0/1   slain"}}
b[27978]={n="Ghostbuster",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=137400,xp=4800,rep={{n="Baradin's Wardens",v=250}}},o={"0/14 Largo's Overlook Ghosts Slain"}}
b[27991]={n="Taking the Overlook Back",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=137400,xp=4800,rep={{n="Baradin's Wardens",v=250}}},o={"0/1   slain"}}
b[27992]={n="Magnets, How Do They Work?",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=137400,xp=4800,rep={{n="Baradin's Wardens",v=250}}}}
b[28046]={n="Finish The Job",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=137400,xp=4800,rep={{n="Baradin's Wardens",v=250}}},o={"0/5   slain"}}
b[28050]={n="Shark Tank",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=2}},mo=137400,xp=4800,rep={{n="Baradin's Wardens",v=350}}},o={"0/1   slain"}}
b[28059]={n="Claiming The Keep",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=137400,xp=4800,rep={{n="Baradin's Wardens",v=250}}},o={"0/1   slain"}}
b[28063]={n="Leave No Weapon Behind",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=137400,xp=4800,rep={{n="Baradin's Wardens",v=250}}}}
b[28065]={n="Walk A Mile In Their Shoes",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=137400,xp=4800,rep={{n="Baradin's Wardens",v=250}}},o={"Farson Prisoner Escorted"}}
b[28117]={n="Clearing the Depths",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=274800,xp=4800,rep={{n="Baradin's Wardens",v=350}}},o={"0/9 Ghosts Slain"}}
b[28118]={n="The Imprisoned Archmage",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=274800,xp=4800,rep={{n="Baradin's Wardens",v=350}}}}
b[28120]={n="Learning From The Past",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=274800,xp=4800,rep={{n="Baradin's Wardens",v=350}}}}
b[28122]={n="A Huge Problem",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=274800,xp=4800,rep={{n="Baradin's Wardens",v=350}}},o={"0/1   slain"}}
b[28130]={n="Not The Friendliest Town",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=137400,xp=4800,rep={{n="Baradin's Wardens",v=250}}},o={"0/14 Rustberg Village Residents"}}
b[28137]={n="Teach A Man To Fish.... Or Steal",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=137400,xp=4800,rep={{n="Baradin's Wardens",v=250}}}}
b[28162]={n="Swamp Bait",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=274800,xp=4800,rep={{n="Baradin's Wardens",v=350}}}}
b[28163]={n="The Leftovers",f="Both",k="daily",r={mo=274800,xp=55},o={"0/12 Horde Infantry"}}
b[28165]={n="D-Block",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=274800,xp=4800,rep={{n="Baradin's Wardens",v=350}}},o={"0/10 Demons Slain"}}
b[28177]={n="Stocking Up",f="Both",k="daily",r={c={{n="Enchanted Scorpid Tail",q=2,ic=133057},{n="Envenomed Scorpid Tail",q=2,ic=133476}},mo=105000,xp=45}}
b[28185]={n="Svarnos",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=274800,xp=4800,rep={{n="Baradin's Wardens",v=350}}}}
b[28186]={n="Cursed Shackles",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=274800,xp=4800,rep={{n="Baradin's Wardens",v=350}}}}
b[28188]={n="Prison Revolt",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=274800,xp=4800,rep={{n="Baradin's Wardens",v=350}}},o={"0/10 Prisoners Slain"}}
b[28223]={n="The Warden",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=274800,xp=4800,rep={{n="Baradin's Wardens",v=350}}}}
b[28232]={n="Food From Below",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=274800,xp=4800,rep={{n="Baradin's Wardens",v=350}}}}
b[28250]={n="Thieving Little Pluckers",f="Both",k="daily",r={mo=103050,xp=3600,rep={{n="Ramkahen",v=150}}},o={"0/30 Thieving plucker smashed"}}
b[28275]={n="Bombs Away!",f="Both",k="daily",r={mo=137400,xp=55},o={"0/10 Wellson Supply Boats Destroyed"}}
b[28390]={n="Glop, Son of Glop",f="Both",k="daily",r={mo=274800,xp=6000,rep={{n="Therazane",v=350}}},o={"0/1   slain"}}
b[28391]={n="The Restless Brood",f="Both",k="daily",r={mo=274800,xp=6000,rep={{n="Therazane",v=350}}},o={"0/1 Pale Resonating Crystal struck","0/1 Aeosera defeated"}}
b[28419]={n="Stocking Up",f="Both",k="daily",r={c={{n="Enchanted Scorpid Tail",q=2,ic=133057}},mo=105000,xp=45},o={"0/5 Razor-Sharp Scorpid Barb"}}
b[28497]={n="Fire From the Sky",f="Both",k="daily",r={c={{n="Confiscated Dog Tags",q=2,ic=133330},{n="Canopic Chestplate",q=2,ic=463456}},mo=137400,xp=55},o={"0/100 Schnottz Infantrymen Slain"}}
b[28657]={n="A Huge Problem",f="Both",k="daily",r={mo=274800,xp=55},o={"0/1 Problim slain"}}
b[28658]={n="Swamp Bait",f="Both",k="daily",r={mo=274800,xp=55},o={"0/8 Crocolisk Hide"}}
b[28659]={n="The Leftovers",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=274800,xp=4800,rep={{n="Hellscream's Reach",v=350}}},o={"0/12 Alliance Infantry"}}
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
b[28679]={n="Rattling Their Cages",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=137400,xp=4800,rep={{n="Hellscream's Reach",v=250}}},o={"0/8 Shipwrecked Sailor slain"}}
b[28680]={n="Boosting Morale",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=137400,xp=4800,rep={{n="Hellscream's Reach",v=250}}},o={"0/6 Barrel of Southsea Rum"}}
b[28681]={n="Shark Tank",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1 Tank slain"}}
b[28682]={n="Claiming The Keep",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1 Keep Lord Farson slain"}}
b[28683]={n="Thinning the Brood",f="Both",k="daily",r={mo=137400,xp=55},o={"0/12 Darkwood Lurker slain"}}
b[28684]={n="A Sticky Task",f="Both",k="daily",r={mo=137400,xp=55},o={"0/4 Sticky Silk Gland"}}
b[28685]={n="Leave No Weapon Behind",f="Both",k="daily",r={mo=137400,xp=55},o={"0/12 Rusty Rifle"}}
b[28686]={n="Not The Friendliest Town",f="Both",k="daily",r={mo=137400,xp=55},o={"0/14 Rustberg Village Residents"}}
b[28687]={n="Teach A Man To Fish.... Or Steal",f="Both",k="daily",r={mo=137400,xp=55},o={"0/22 Rustberg Seabass"}}
b[28689]={n="The Forgotten",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=137400,xp=4800,rep={{n="Hellscream's Reach",v=250}}}}
b[28690]={n="Salvaging the Remains",f="Both",k="daily",r={mo=137400,xp=55},o={"0/9 Cursed Femur"}}
b[28691]={n="First Lieutenant Connor",f="Both",k="daily",r={mo=137400,xp=55},o={"0/1 First Lieutenant Connor slain"}}
b[28692]={n="Magnets, How Do They Work?",f="Both",k="daily",r={mo=137400,xp=55},o={"0/7 Siege Engine Scrap"}}
b[28693]={n="Finish The Job",f="Both",k="daily",r={mo=137400,xp=55},o={"0/5   slain"}}
b[28694]={n="Watch Out For Splinters!",f="Both",k="daily",r={mo=137400,xp=55},o={"0/15 Shipyard Lumber"}}
b[28695]={n="WANTED: Foreman Wellson",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=137400,xp=4800,rep={{n="Hellscream's Reach",v=250}}},o={"0/1 Foreman Wellson slain"}}
b[28696]={n="Bombs Away!",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=137400,xp=4800,rep={{n="Hellscream's Reach",v=250}}},o={"0/10 Wellson Supply Boats Destroyed"}}
b[28697]={n="Ghostbuster",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=137400,xp=4800,rep={{n="Hellscream's Reach",v=250}}},o={"0/14 Largo's Overlook Ghosts Slain"}}
b[28698]={n="Cannonball!",f="Both",k="daily",r={mo=137400,xp=55}}
b[28700]={n="Taking the Overlook Back",f="Both",k="daily",r={cu={{n="Tol Barad Commendation",ct=1}},mo=137400,xp=4800,rep={{n="Hellscream's Reach",v=250}}},o={"0/1 Commander Largo slain"}}
b[28736]={n="Fire From the Sky",f="Both",k="daily",r={mo=137400,xp=4800,rep={{n="Ramkahen",v=250}}},o={"0/100 Infantrymen Slain"}}
b[28860]={n="Keeping the Dragonmaw at Bay",f="Both",k="daily",r={mo=137400,xp=4800,rep={{n="Wildhammer Clan",v=250}}}}
b[28861]={n="Fight Like a Wildhammer",f="Both",k="daily",r={mo=137400,xp=4800,rep={{n="Wildhammer Clan",v=250}}},o={"0/10 Keg of Thundermar Ale"}}
b[28862]={n="Never Leave a Dinner Behind",f="Both",k="daily",r={mo=137400,xp=4800,rep={{n="Wildhammer Clan",v=250}}},o={"0/10 Wildhammer Food Stores"}}
b[28863]={n="Warlord Halthar is Back",f="Both",k="daily",r={mo=274800,xp=6000,rep={{n="Wildhammer Clan",v=350}}},o={"0/1   slain"}}
b[28864]={n="Beer Run",f="Both",k="daily",r={mo=137400,xp=4800,rep={{n="Wildhammer Clan",v=250}}},o={"0/1 Supply Caravan Escorted"}}
b[28871]={n="Crushing the Wildhammer",f="Both",k="daily",r={mo=137400,xp=4800,rep={{n="Dragonmaw Clan",v=250}}},o={"0/8 Wildhammer Insignia"}}
b[28872]={n="Total War",f="Both",k="daily",r={mo=137400,xp=4800,rep={{n="Dragonmaw Clan",v=250}}},o={"0/10 Wildhammer Kegs Smashed"}}
b[28873]={n="Another Maw to Feed",f="Both",k="daily",r={mo=137400,xp=4800,rep={{n="Dragonmaw Clan",v=250}}},o={"0/10 Wildhammer Food Stores"}}
b[28874]={n="Hook 'em High",f="Both",k="daily",r={mo=137400,xp=4800,rep={{n="Dragonmaw Clan",v=250}}},o={"0/4   slain"}}
b[28875]={n="Bring Down the High Shaman",f="Both",k="daily",r={mo=274800,xp=6000,rep={{n="Dragonmaw Clan",v=350}}},o={"0/1   slain"}}
b[29101]={n="Punting Season",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=1}},xp=3600,rep={{n="Guardians of Hyjal",v=150}}},o={"0/5 Child of Tortolla punted into water"}}
b[29122]={n="Echoes of Nemesis",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=2}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}},o={"0/1   slain"}}
b[29123]={n="Rage Against the Flames",f="Both",k="daily",r={mo=137400,xp=55},o={"0/6 Invader from the Firelands slain"}}
b[29125]={n="Between the Trees",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=1}},xp=3600,rep={{n="Guardians of Hyjal",v=150}}},o={"0/3 Spirit of Malorne captured"}}
b[29127]={n="Rage Against the Flames",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=1}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}},o={"0/8 Invader from the Firelands slain"}}
b[29128]={n="The Protectors of Hyjal",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=2}},mo=274800,xp=6000,rep={{n="Guardians of Hyjal",v=350}}},o={"0/6 Invader slain at Sethria's Roost"}}
b[29137]={n="Breach in the Defenses",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=2}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}},o={"0/5   slain"}}
b[29138]={n="Burn Victims",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=2}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}},o={"0/8 Wounded Hyjal Defender saved"}}
b[29139]={n="Aggressive Growth",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=2}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}},o={"0/5 Smothervine planted"}}
b[29141]={n="The Harder They Fall",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=2}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}},o={"0/3   slain"}}
b[29143]={n="Wisp Away",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=2}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}},o={"0/1 Close a Fire Portal"}}
b[29147]={n="Call the Flock",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=1}},xp=3600,rep={{n="Guardians of Hyjal",v=150}}},o={"0/12 Alpine Songbird gathered","0/5 Forest Owl gathered","0/2 Goldwing Hawk gathered"}}
b[29149]={n="Rage Against the Flames",f="Both",k="daily",r={mo=137400,xp=55},o={"0/7 Invader from the Firelands slain"}}
b[29159]={n="Pyrorachnophobia",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=2}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}},o={"0/8 Cinderweb spider slain"}}
b[29161]={n="Those Bears Up There",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=1}},xp=3600,rep={{n="Guardians of Hyjal",v=150}}},o={"0/6 Hyjal Bear Cubs chucked to safety"}}
b[29162]={n="Nature's Blessing",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=2}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}},o={"0/1   slain"}}
b[29163]={n="Rage Against the Flames",f="Both",k="daily",r={mo=137400,xp=55},o={"0/9 Invader from the Firelands slain"}}
b[29164]={n="Perfecting Your Howl",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=1}},xp=3600,rep={{n="Guardians of Hyjal",v=150}}},o={"0/10 Howl atop an invader's corpse"}}
b[29165]={n="The Call of the Pack",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=2}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}},o={"0/1   slain"}}
b[29166]={n="Supplies for the Other Side",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=1}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}}}
b[29177]={n="Vigilance on Wings",f="Both",k="daily",r={mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}},o={"0/10   slain"}}
b[29179]={n="Hostile Elements",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=2}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}},o={"0/8 Charred Combatant slain"}}
b[29189]={n="Wicked Webs",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=2}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}},o={"0/8 Victims freed"}}
b[29192]={n="The Wardens are Watching",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=2}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}},o={"0/1 Druid of the Flame captured"}}
b[29205]={n="The Forlorn Spire",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=2}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}},o={"0/1 Druid Assault Group Protected"}}
b[29206]={n="Into the Fire",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=2}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}},o={"0/1 Druid of the Talon Windcaller protected"}}
b[29210]={n="Enduring the Heat",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=2}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}},o={"0/1 Enter the Igneous Depths","0/1 All Flame Runes Destroyed"}}
b[29211]={n="Solar Core Destruction",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=2}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}},o={"0/1 Solar Core detonated"}}
b[29243]={n="Strike at the Heart",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=3}},mo=274800,xp=6000,rep={{n="Guardians of Hyjal",v=350}}},o={"0/1   slain"}}
b[29246]={n="Relieving the Pain",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=1}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}}}
b[29247]={n="Treating the Wounds",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=1}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}}}
b[29248]={n="Releasing the Pressure",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=1}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}}}
b[29255]={n="Embergris",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=1}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}}}
b[29257]={n="Steal Magmolias",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=1}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}}}
b[29264]={n="Flamewakers of the Molten Flow",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=2}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}},o={"0/8 Flamewaker slain"}}
b[29265]={n="Fire Flowers",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=2}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}}}
b[29273]={n="How Hot",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=1}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}},o={"0/1 Northwestern Lava Pool sampled","0/1 Northeastern Lava Pool sampled","0/1 Central Lava Pool sampled"}}
b[29274]={n="Hounds of Shannox",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=1}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}}}
b[29275]={n="Fandral's Methods",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=1}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}}}
b[29278]={n="Living Obsidium",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=2}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}}}
b[29288]={n="Starting Young",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=2}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}}}
b[29290]={n="Fire in the Skies",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=2}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}},o={"0/100 Amassing Flamewakers slain","0/40 Amassing Cinderwebs slain","0/3 Molten Lords slain"}}
b[29296]={n="Territorial Birds",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=2}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}},o={"0/5   slain"}}
b[29299]={n="Some Like It Hot",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=1}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}},o={"0/6 Help the Crimson Lasher Drink from Ember Pools"}}
b[29304]={n="The Dogs of War",f="Both",k="daily",r={cu={{n="Mark of the World Tree",ct=2}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}},o={"0/5   slain"}}
b[29305]={n="Strike at the Heart",f="Both",k="daily",r={mo=274800,xp=65},o={"0/1 Lieutenant of Flame slain"}}
b[29313]={n="The Secret to Perfect Kimchi",f="Both",k="daily",r={cu={{n="Epicurean's Award",ct=1}},mo=280900,xp=9500,rep={{n="Darnassus",v=250}}}}
b[29314]={n="Remembering the Ancestors",f="Both",k="daily",r={cu={{n="Epicurean's Award",ct=1}},mo=280900,xp=9500,rep={{n="Darnassus",v=250}}}}
b[29315]={n="Fungus Among Us",f="Both",k="daily",r={cu={{n="Epicurean's Award",ct=1}},mo=280900,xp=9500,rep={{n="Undercity",v=250}}}}
b[29316]={n="Back to Basics",f="Both",k="daily",r={cu={{n="Epicurean's Award",ct=1}},mo=280900,xp=9500,rep={{n="Darnassus",v=250}}},o={"0/6 Practice Making Rice Flour"}}
b[29318]={n="Ribs for the Sentinels",f="Both",k="daily",r={cu={{n="Epicurean's Award",ct=2}},mo=280900,xp=9500,rep={{n="Darnassus",v=250}}},o={"0/5 Feed Ribs to Sentinels"}}
b[29319]={n="Tadpole Terror",f="Both",k="daily",r={i={{n="Bag of Shiny Things",ic=133645}},mo=280900,xp=9500,rep={{n="Undercity",v=250}}}}
b[29320]={n="Like Pike?",f="Both",k="daily",r={i={{n="Bag of Shiny Things",ic=133645}},mo=280900,xp=9500,rep={{n="Undercity",v=250}}}}
b[29321]={n="Happy as a Clam Digger",f="Both",k="daily",r={i={{n="Bag of Shiny Things",ic=133645}},mo=280900,xp=9500,rep={{n="Darnassus",v=250}}}}
b[29322]={n="Time for Slime",f="Both",k="daily",r={i={{n="Bag of Shiny Things",ic=133645}},mo=280900,xp=9500,rep={{n="Undercity",v=250}}}}
b[29323]={n="Stocking Up",f="Both",k="daily",r={i={{n="Bag of Shiny Things",ic=133645}},mo=280900,xp=9500,rep={{n="Darnassus",v=250}}}}
b[29324]={n="The Sister's Pendant",f="Both",k="daily",r={i={{n="Bag of Shiny Things",ic=133645}},mo=280900,xp=9500,rep={{n="Darnassus",v=250}}}}
b[29325]={n="A Slippery Snack",f="Both",k="daily",r={i={{n="Bag of Shiny Things",ic=133645}},mo=280900,xp=9500,rep={{n="Darnassus",v=250}}}}
b[29332]={n="Lily, Oh Lily",f="Both",k="daily",r={cu={{n="Epicurean's Award",ct=1}},mo=280900,xp=9500,rep={{n="Undercity",v=250}}}}
b[29333]={n="Escargot A Go-Go",f="Both",k="daily",r={cu={{n="Epicurean's Award",ct=1}},mo=280900,xp=9500,rep={{n="Undercity",v=250}}}}
b[29334]={n="Roach Coach",f="Both",k="daily",r={cu={{n="Epicurean's Award",ct=2}},mo=280900,xp=9500,rep={{n="Undercity",v=250}}}}
b[29342]={n="Cold Water Fishing",f="Both",k="daily",r={i={{n="Bag of Shiny Things",ic=133645}},mo=280900,xp=9500,rep={{n="Ironforge",v=250}}}}
b[29343]={n="One fer the Ages",f="Both",k="daily",r={i={{n="Bag of Shiny Things",ic=133645}},mo=280900,xp=9500,rep={{n="Ironforge",v=250}}},o={"0/1 Put Young Ironjaw on Display"}}
b[29344]={n="Fish fer Squrky",f="Both",k="daily",r={i={{n="Bag of Shiny Things",ic=133645}},mo=280900,xp=9500,rep={{n="Ironforge",v=250}}},o={"0/3 Feed Squrky"}}
b[29345]={n="Pond Predators",f="Both",k="daily",r={i={{n="Bag of Shiny Things",ic=133645}},mo=280900,xp=9500,rep={{n="Thunder Bluff",v=250}}}}
b[29346]={n="The Ring's the Thing",f="Both",k="daily",r={i={{n="Bag of Shiny Things",ic=133645}},mo=280900,xp=9500,rep={{n="Thunder Bluff",v=250}}}}
b[29347]={n="Live Bait",f="Both",k="daily",r={i={{n="Bag of Shiny Things",ic=133645}},mo=280900,xp=9500,rep={{n="Ironforge",v=250}}},o={"0/1 Catch Cold Water Crayfish","0/1 Take Crayfish to Cook Ghilm"}}
b[29348]={n="The Race to Restock",f="Both",k="daily",r={i={{n="Bag of Shiny Things",ic=133645}},mo=280900,xp=9500,rep={{n="Thunder Bluff",v=250}}}}
b[29349]={n="Craving Crayfish",f="Both",k="daily",r={i={{n="Bag of Shiny Things",ic=133645}},mo=280900,xp=9500,rep={{n="Thunder Bluff",v=250}}}}
b[29350]={n="The Gnomish Bait-o-Matic",f="Both",k="daily",r={i={{n="Bag of Shiny Things",ic=133645}},mo=280900,xp=9500,rep={{n="Ironforge",v=250}}}}
b[29351]={n="A Round for the Guards",f="Both",k="daily",r={cu={{n="Epicurean's Award",ct=1}},mo=280900,xp=9500,rep={{n="Ironforge",v=250}}},o={"0/6 Ironforge Guards Fed"}}
b[29352]={n="A Fowl Shortage",f="Both",k="daily",r={cu={{n="Epicurean's Award",ct=1}},mo=280900,xp=9500,rep={{n="Ironforge",v=250}}}}
b[29353]={n="Keepin' the Haggis Flowin'",f="Both",k="daily",r={cu={{n="Epicurean's Award",ct=2}},mo=280900,xp=9500,rep={{n="Ironforge",v=250}}}}
b[29354]={n="Shiny Baubles",f="Both",k="daily",r={i={{n="Bag of Shiny Things",ic=133645}},mo=280900,xp=9500,rep={{n="Thunder Bluff",v=250}}}}
b[29355]={n="Can't Get Enough Spice Bread",f="Both",k="daily",r={cu={{n="Epicurean's Award",ct=1}},mo=280900,xp=9500,rep={{n="Ironforge",v=250}}}}
b[29356]={n="I Need to Cask a Favor",f="Both",k="daily",r={cu={{n="Epicurean's Award",ct=1}},mo=280900,xp=9500,rep={{n="Ironforge",v=250}}},o={"0/1 Cask of Drugan's IPA","0/1 Deliver Cask of Drugan's IPA"}}
b[29357]={n="Spice Bread Aplenty",f="Both",k="daily",r={cu={{n="Epicurean's Award",ct=1}},mo=280900,xp=9500,rep={{n="Darnassus",v=250}}},o={"0/10 Spice Bread"}}
b[29358]={n="Pining for Nuts",f="Both",k="daily",r={cu={{n="Epicurean's Award",ct=1}},mo=280900,xp=9500,rep={{n="Thunder Bluff",v=250}}}}
b[29359]={n="An Old Favorite",f="Both",k="daily",r={i={{n="Bag of Shiny Things",ic=133645}},mo=280900,xp=9500,rep={{n="Darnassus",v=250}}}}
b[29360]={n="Would You Like Some Flies With That?",f="Both",k="daily",r={cu={{n="Epicurean's Award",ct=1}},mo=280900,xp=9500,rep={{n="Undercity",v=250}}}}
b[29362]={n="\"Magic\" Mushrooms",f="Both",k="daily",r={cu={{n="Epicurean's Award",ct=1}},mo=280900,xp=9500,rep={{n="Thunder Bluff",v=250}}}}
b[29363]={n="Mulgore Spice Bread",f="Both",k="daily",r={cu={{n="Epicurean's Award",ct=1}},mo=280900,xp=9500,rep={{n="Thunder Bluff",v=250}}}}
b[29364]={n="Corn Mash",f="Both",k="daily",r={cu={{n="Epicurean's Award",ct=2}},mo=280900,xp=9500,rep={{n="Thunder Bluff",v=250}}},o={"0/6 Grind Corn Kernels"}}
b[29365]={n="Perfectly Picked Portions",f="Both",k="daily",r={cu={{n="Epicurean's Award",ct=1}},mo=280900,xp=9500,rep={{n="Thunder Bluff",v=250}}}}
b[29438]={n="He Shoots, He Scores!",f="Both",k="daily",r={i={{n="Darkmoon Game Prize",ic=134143}},rep={{n="Darkmoon Faire",v=250}}},o={"0/25 Targets Hit"}}
b[29455]={n="Target: Turtle",f="Both",k="daily",r={i={{n="Darkmoon Game Prize",ic=134143}},rep={{n="Darkmoon Faire",v=250}}},o={"0/3 Rings Landed"}}
b[29463]={n="It's Hammer Time",f="Both",k="daily",r={i={{n="Darkmoon Game Prize",ic=134143}},rep={{n="Darkmoon Faire",v=250}}},o={"0/30 Gnolls Whacked"}}
b[30146]={n="Snack Time",f="Both",k="daily",r={mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=125}}}}
b[30147]={n="Fragments of the Past",f="Both",k="daily",r={mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=125}}}}
b[30148]={n="Just a Flesh Wound",f="Both",k="daily",r={mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=125}}},o={"0/8 Injured Hatchlings bandaged"}}
b[30149]={n="A Feast for the Senses",f="Both",k="daily",r={mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=125}}}}
b[30317]={n="Water, Water Everywhere",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Farmer Fung",v=2000},{n="The Tillers",v=150}}},o={"0/35 Dusty Spots watered"}}
b[30318]={n="Chasing the Chicken",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Old Hillpaw",v=3000},{n="The Tillers",v=150}}}}
b[30319]={n="Pest Problems",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Haohan Mudclaw",v=3300},{n="The Tillers",v=150}}},o={"0/25 Black-Nose Marmot stomped"}}
b[30321]={n="Weed War II",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Jogu the Drunk",v=2000},{n="The Tillers",v=150}}},o={"0/100 Weeds pulled"}}
b[30322]={n="Money Matters",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Gina Mudclaw",v=2600},{n="The Tillers",v=150}}}}
b[30323]={n="They Don't Even Wear Them",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Tina Mudclaw",v=2000},{n="The Tillers",v=150}}}}
b[30324]={n="Not in Chee-Chee's Backyard",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Chee Chee",v=2000},{n="The Tillers",v=150}}},o={"0/8 Kunzen tribe member slain"}}
b[30325]={n="Where It Counts",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Sho",v=2000},{n="The Tillers",v=150}}},o={"0/8 Kunzen Ritual Candle thrown","0/4 Blazing Ember kicked","0/1   slain"}}
b[30326]={n="The Kunzen Legend-Chief",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Fish Fellreed",v=2000},{n="The Tillers",v=150}}}}
b[30327]={n="You Have to Burn the Ropes",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Ella",v=2000},{n="The Tillers",v=150}}},o={"0/6 Rope Burned"}}
b[30333]={n="The Lesser of Two Evils",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="The Tillers",v=275}}},o={"0/1   slain"}}
b[30334]={n="Stealing is Bad... Re-Stealing is OK",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="The Tillers",v=275}}}}
b[30335]={n="Stalling the Ravage",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="The Tillers",v=275}}},o={"0/12 Kunzen hozen slain"}}
b[30336]={n="The Kunzen Hunter-Chief",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="The Tillers",v=275}}},o={"0/1 Kunzen Hunter-Chief slain"}}
b[30337]={n="Simian Sabotage",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="The Tillers",v=275}}},o={"0/1 Stolen weapons exploded","0/1 Stolen tools exploded","0/1 Stolen beer exploded","0/1 Stolen grain exploded"}}
b[30470]={n="A Gift For Tina",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Tina Mudclaw",v=1400},{n="The Tillers",v=150}}}}
b[30471]={n="A Gift For Chee Chee",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Chee Chee",v=1400},{n="The Tillers",v=150}}}}
b[30472]={n="A Gift For Sho",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Sho",v=1400},{n="The Tillers",v=150}}}}
b[30473]={n="A Gift For Fish",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Fish Fellreed",v=1400},{n="The Tillers",v=150}}}}
b[30474]={n="A Gift For Ella",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Ella",v=1400},{n="The Tillers",v=150}}}}
b[30475]={n="A Gift For Fung",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Farmer Fung",v=1400},{n="The Tillers",v=150}}}}
b[30476]={n="A Gift For Old Hillpaw",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Old Hillpaw",v=1400},{n="The Tillers",v=150}}}}
b[30477]={n="A Gift For Haohan",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Haohan Mudclaw",v=1400},{n="The Tillers",v=150}}}}
b[30478]={n="A Gift For Jogu",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Jogu the Drunk",v=1400},{n="The Tillers",v=150}}}}
b[30479]={n="A Gift For Gina",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Gina Mudclaw",v=1400},{n="The Tillers",v=150}}}}
b[31288]={n="Research Project: The Mogu Dynasties",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800},o={"11/20 Mogu Archaeology Fragments obtained"}}
b[31291]={n="Uncovering the Past",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800},o={"0/1 Artifact of Pandaria Solved"}}
b[31443]={n="Flying Tiger Gourami",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,rep={{n="The Anglers",v=350},{n="Nat Pagle",v=600}}}}
b[31444]={n="Spinefish Alpha",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,rep={{n="The Anglers",v=350},{n="Nat Pagle",v=600}}}}
b[31446]={n="Mimic Octopus",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,rep={{n="The Anglers",v=350},{n="Nat Pagle",v=600}}}}
b[31669]={n="The Cabbage Test",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=68700,xp=2400,rep={{n="The Tillers",v=350}}},o={"0/1 Plant Green Cabbage Seeds"}}
b[31670]={n="That Dangling Carrot",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=68700,xp=2400,rep={{n="The Tillers",v=350}}},o={"0/1 Plant Juicycrunch Carrot Seeds"}}
b[31671]={n="Why Not Scallions?",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=68700,xp=2400,rep={{n="The Tillers",v=350}}},o={"0/1 Plant Scallion Seeds"}}
b[31672]={n="A Pumpkin-y Perfume",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=68700,xp=2400,rep={{n="The Tillers",v=350}}},o={"0/1 Plant Mogu Pumpkin Seeds"}}
b[31673]={n="Red Blossom Leeks, You Make the Croc-in' World Go Down",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=68700,xp=2400,rep={{n="The Tillers",v=350}}},o={"0/1 Plant Red Blossom Leek Seeds"}}
b[31675]={n="The White Turnip Treatment",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=68700,xp=2400,rep={{n="The Tillers",v=350}}},o={"0/1 Plant White Turnip Seeds"}}
b[31941]={n="Squash Those Foul Odors",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=68700,xp=2400,rep={{n="The Tillers",v=350}}},o={"0/1 Plant Jade Squash Seeds"}}
b[31942]={n="It's Melon Time",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=68700,xp=2400,rep={{n="The Tillers",v=350}}},o={"0/1 Plant Striped Melon Seeds"}}
b[31943]={n="Which Berries? Witchberries.",f="Both",k="daily",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=68700,xp=2400,rep={{n="The Tillers",v=350}}},o={"0/1 Plant Witchberry Seeds"}}
b[32107]={n="Flying Tiger Gourami",f="Both",k="daily",r={mo=137400},o={"0/1 Flying Tiger Gourami"}}
b[33146]={n="Noodle Time",f="Both",k="daily",r={cu={{n="Ironpaw Token",ct=1}},mo=274800,xp=6000},o={"0/1 Queue for your next shift through Sungshin Ironpaw","0/1 Complete a shift at the Halfhill noodle stand"}}
b[33358]={n="Noodle Time: Bonus",f="Both",k="daily",r={cu={{n="Ironpaw Token",ct=1}},mo=274800,xp=6000},o={"0/1 Queue for your next shift through Sungshin Ironpaw","0/1 Complete the bonus objective during the scenario: Noodle Time"}}
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
-- --- Added by reward audit (Game Data API fill) ---
b[11131]={n="Stop the Fires!",r={i={{n="Tricky Treat"},{n="Weighted Jack-o'-Lantern",ic=133661}},mo=280900,xp=9500}}
b[11293]={n="Bark for the Barleybrews!",r={i={{n="Brewfest Prize Token"}},mo=280900,xp=9500}}
b[11294]={n="Bark for the Thunderbrews!",r={i={{n="Brewfest Prize Token"}},mo=280900,xp=9500}}
b[11391]={n="Steel Gate Patrol",r={i={{n="Super Healing Potion"}},mo=105000,xp=4100,rep={{n="Explorers' League",v=250}}}}
b[11405]={n="Call the Headless Horseman",r={xp=1200}}
b[11407]={n="Bark for Drohn's Distillery!",r={i={{n="Brewfest Prize Token"}},mo=280900,xp=9500}}
b[11408]={n="Bark for T'chali's Voodoo Brewery!",r={i={{n="Brewfest Prize Token"}},mo=280900,xp=9500}}
b[11496]={n="The Sanctum Wards",r={mo=78750,xp=3100,rep={{n="Shattered Sun Offensive",v=150}}}}
b[11513]={n="Intercepting the Mana Cells",r={i={{n="Shattered Sun Supplies",ic=133646}},mo=105000,xp=3100,rep={{n="Shattered Sun Offensive",v=250}}}}
b[11520]={n="Discovering Your Roots",r={i={{n="Shattered Sun Supplies",ic=133646}},mo=78750,xp=3100,rep={{n="Shattered Sun Offensive",v=350}}}}
b[11524]={n="Erratic Behavior",r={mo=78750,xp=3100,rep={{n="Shattered Sun Offensive",v=150}}}}
b[11532]={n="Distraction at the Dead Scar",r={mo=78750,xp=3100,rep={{n="Shattered Sun Offensive",v=150}}}}
b[11535]={n="Making Ready",r={mo=105000,xp=4100,rep={{n="Shattered Sun Offensive",v=250}}}}
b[11538]={n="The Battle for the Sun's Reach Armory",r={mo=105000,xp=3100,rep={{n="Shattered Sun Offensive",v=250}}}}
b[11539]={n="Taking the Harbor",r={mo=105000,xp=4100,rep={{n="Shattered Sun Offensive",v=250}}}}
b[11542]={n="Intercept the Reinforcements",r={xp=4100,rep={{n="Shattered Sun Offensive",v=250}}}}
b[11545]={n="A Charitable Donation",r={rep={{n="Shattered Sun Offensive",v=150}}}}
b[11548]={n="Your Continued Support",r={rep={{n="Shattered Sun Offensive",v=150}}}}
b[11925]={n="More Torch Catching",r={mo=280900,xp=9500}}
b[11926]={n="More Torch Tossing",r={mo=280900,xp=9500}}
b[12020]={n="This One Time, When I Was Drunk...",r={i={{n="Brewfest Prize Token"}},mo=280900,xp=9500}}
b[12062]={n="Insult Coren Direbrew",r={xp=9500}}
b[12135]={n="\\\"Let the Fires Come!\\\"",r={i={{n="Tricky Treat"},{n="Weighted Jack-o'-Lantern",ic=133661}},mo=280900,xp=9500}}
b[12139]={n="\\\"Let the Fires Come!\\\"",r={i={{n="Tricky Treat"},{n="Weighted Jack-o'-Lantern",ic=133661}},mo=280900,xp=9500}}
b[12155]={n="Smash the Pumpkin",r={i={{n="Crudely Wrapped Gift"}},mo=280900,xp=9500}}
b[12192]={n="This One Time, When I Was Drunk...",r={i={{n="Brewfest Prize Token"}},mo=280900,xp=9500}}
b[12317]={n="Keep Them at Bay",r={mo=105000,xp=4100}}
b[12324]={n="Smoke 'Em Out",r={mo=105000,xp=4100}}
b[12564]={n="Troll Patrol: Something for the Pain",r={mo=26250,xp=1050}}
b[12568]={n="Troll Patrol: Done to Death",r={mo=26250,xp=1050}}
b[12585]={n="Troll Patrol: Creature Comforts",r={mo=26250,xp=1050}}
b[12588]={n="Troll Patrol: Can You Dig It?",r={mo=26250,xp=1050}}
b[12591]={n="Troll Patrol: Throwing Down",r={mo=26250,xp=1050}}
b[12594]={n="Troll Patrol: Couldn't Care Less",r={mo=26250,xp=1050}}
b[12604]={n="Congratulations!",r={i={{n="Patroller's Pack"}},mo=315000,xp=6200,rep={{n="Argent Crusade",v=500}}}}
b[12703]={n="Kartak's Rampage",r={mo=210000,xp=5150,rep={{n="Frenzyheart Tribe",v=350}}}}
b[12734]={n="Rejek: First Blood",r={mo=105000,xp=4100,rep={{n="Frenzyheart Tribe",v=250}}}}
b[12741]={n="Strength of the Tempest",r={mo=105000,xp=4100,rep={{n="Frenzyheart Tribe",v=250}}}}
b[12759]={n="Tools of War",r={mo=210000,xp=5150,rep={{n="Frenzyheart Tribe",v=350}}}}
b[13289]={n="That's Abominable!",r={mo=105000,xp=4100}}
b[13331]={n="Keeping the Alliance Blind",r={mo=105000,xp=4100,rep={{n="Warsong Offensive",v=250}}}}
b[13333]={n="Capture More Dispatches",r={mo=105000,xp=4100,rep={{n="Valiance Expedition",v=250}}}}
b[13423]={n="Defending Your Title",r={i={{n="Hyldnir Spoils",ic=133649}},mo=105000,xp=4100}}
b[13479]={n="The Great Egg Hunt",r={i={{n="Blossoming Branch"}},mo=280900,xp=9500}}
b[13480]={n="The Great Egg Hunt",r={i={{n="Blossoming Branch"}},mo=280900,xp=9500}}
b[13627]={n="Jack Me Some Lumber",r={mo=105000,xp=4100}}
b[13681]={n="A Chip Off the Ulduar Block",r={mo=105000,xp=4100}}
b[13836]={n="Disarmed!",r={i={{n="Bag of Fishing Treasures",ic=133630}},xp=4100,rep={{n="Kirin Tor",v=250}}}}
b[14076]={n="Breakfast Of Champions",r={cu={{n="Champion's Seal",ct=1}},mo=105000,xp=4100}}
b[14077]={n="The Light's Mercy",r={cu={{n="Champion's Seal",ct=1}},mo=105000,xp=4100}}
b[14080]={n="Stop The Aggressors",r={cu={{n="Champion's Seal",ct=1}},mo=105000,xp=4100}}
b[14090]={n="Gormok Wants His Snobolds",r={cu={{n="Champion's Seal",ct=1}},mo=105000,xp=4100}}
b[14092]={n="Breakfast Of Champions",r={cu={{n="Champion's Seal",ct=1}},mo=105000,xp=4100}}
b[14095]={n="Identifying the Remains",r={mo=105000,xp=4100}}
b[14096]={n="You've Really Done It This Time, Kul",r={cu={{n="Champion's Seal",ct=1}},mo=105000,xp=4100}}
b[14101]={n="Drottinn Hrothgar",r={cu={{n="Champion's Seal",ct=1}},mo=105000,xp=4100}}
b[14102]={n="Mistcaller Yngvar",r={cu={{n="Champion's Seal",ct=1}},mo=105000,xp=4100}}
b[14104]={n="Ornolf The Scarred",r={cu={{n="Champion's Seal",ct=1}},mo=105000,xp=4100}}
b[14105]={n="Deathspeaker Kharos",r={cu={{n="Champion's Seal",ct=1}},mo=105000,xp=4100}}
b[14107]={n="The Fate Of The fallen",r={cu={{n="Champion's Seal",ct=1}},mo=105000,xp=4100}}
b[14108]={n="Get Kraken!",r={cu={{n="Champion's Seal",ct=1}},mo=105000,xp=4100}}
b[14112]={n="What Do You Feed a Yeti, Anyway?",r={cu={{n="Champion's Seal",ct=1}},mo=105000,xp=4100}}
b[14136]={n="Rescue at Sea",r={cu={{n="Champion's Seal",ct=1}},mo=78750,xp=3100}}
b[14144]={n="The Light's Mercy",r={cu={{n="Champion's Seal",ct=1}},mo=105000,xp=4100}}
b[14145]={n="What Do You Feed a Yeti, Anyway?",r={cu={{n="Champion's Seal",ct=1}},mo=105000,xp=4100}}
b[14152]={n="Rescue at Sea",r={cu={{n="Champion's Seal",ct=1}},mo=78750,xp=3100}}
b[25671]={n="Thinning the Horde",r={mo=210000,xp=5150,rep={{n="Darnassus",v=350}}}}
b[26009]={n="Seek and Destroy",r={mo=210000,xp=6200,rep={{n="Orgrimmar",v=350}}}}
b[26234]={n="Stealing From Our Own",r={cu={{n="Epicurean's Award",ct=1}},mo=280900,xp=9500,rep={{n="Orgrimmar",v=250}}}}
b[27987]={n="Cannonball!",r={cu={{n="Tol Barad Commendation",ct=1}},mo=137400,xp=4800,rep={{n="Baradin's Wardens",v=250}}}}
b[28488]={n="Beneath the Surface",r={mo=137400,xp=4800,rep={{n="Therazane",v=250}}}}
b[28721]={n="Walk A Mile In Their Shoes",r={cu={{n="Tol Barad Commendation",ct=1}},mo=137400,xp=4800,rep={{n="Hellscream's Reach",v=250}}}}
b[28751]={n="Tending the Garden",r={mo=280900,xp=9500}}
b[29035]={n="A Cub's Cravings",r={i={{n="Winterspring Cub Whisker"}},xp=4100,rep={{n="Wintersaber Trainers",v=1500}}}}
b[29037]={n="'Borrowing' From the Winterfall",r={i={{n="Winterspring Cub Whisker"}},xp=4100,rep={{n="Wintersaber Trainers",v=1500}}}}
b[29038]={n="Hunting Practice",r={i={{n="Winterspring Cub Whisker"}},xp=4100,rep={{n="Wintersaber Trainers",v=1500}}}}
b[29040]={n="Cub's First Toy",r={i={{n="Winterspring Cub Whisker"}},xp=4100,rep={{n="Wintersaber Trainers",v=1500}}}}
b[29126]={n="The Power of Malorne",r={cu={{n="Mark of the World Tree",ct=2}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}}}
b[29142]={n="Traitors Return",r={cu={{n="Mark of the World Tree",ct=2}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}}}
b[29148]={n="Wings Aflame",r={cu={{n="Mark of the World Tree",ct=2}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}}}
b[29160]={n="Egg-stinction",r={cu={{n="Mark of the World Tree",ct=2}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}}}
b[29263]={n="A Bitter Pill",r={cu={{n="Mark of the World Tree",ct=2}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}}}
b[29276]={n="The Flame Spider Queen",r={cu={{n="Mark of the World Tree",ct=1}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}}}
b[29287]={n="Peaked Interest",r={cu={{n="Mark of the World Tree",ct=2}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}}}
b[29289]={n="Mother's Malice",r={cu={{n="Mark of the World Tree",ct=2}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}}}
b[29293]={n="Singed Wings",r={cu={{n="Mark of the World Tree",ct=2}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}}}
b[29297]={n="Bye Bye Burdy",r={cu={{n="Mark of the World Tree",ct=2}},mo=137400,xp=4800,rep={{n="Guardians of Hyjal",v=250}}}}
b[29317]={n="Fish Head",r={i={{n="Bag of Shiny Things",ic=133645}},mo=280900,xp=9500,rep={{n="Undercity",v=250}}}}
b[29361]={n="Moat Monster!",r={i={{n="Bag of Shiny Things",ic=133645}},mo=280900,xp=9500,rep={{n="Undercity",v=250}}}}
b[30006]={n="The Darkness Around Us",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The August Celestials",v=250}}}}
b[30063]={n="Behind the Masks",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The August Celestials",v=250}}}}
b[30064]={n="Saving the Sutras",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The August Celestials",v=250}}}}
b[30065]={n="Arrows of Fortune",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The August Celestials",v=250}}}}
b[30066]={n="Hidden Power",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The August Celestials",v=250}}}}
b[30067]={n="The Shadow of Doubt",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The August Celestials",v=350}}}}
b[30068]={n="Flames of the Void",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The August Celestials",v=350}}}}
b[30150]={n="Sweet as Honey",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=450}}}}
b[30151]={n="Catch!",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=450}}}}
b[30152]={n="The Sky Race",r={i={{n="Winner's Reward"}},cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=600}}}}
b[30154]={n="The Easiest Way To A Serpent's Heart",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=450}}}}
b[30155]={n="Restoring the Balance",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=450}}}}
b[30156]={n="Feeding Time",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=450}}}}
b[30157]={n="Emptier Nests",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=450}}}}
b[30158]={n="Disarming the Enemy",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=450}}}}
b[30159]={n="Preservation",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=450}}}}
b[30190]={n="Sprite Plight",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30191]={n="Steer Clear of the Beer Here",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30192]={n="My Town, It's on Fire",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30193]={n="Meating Expectations",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30194]={n="Encroaching Storm",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30195]={n="Blooming Blossoms",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30196]={n="Lushroom Rush",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30200]={n="In Ashen Webs",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30204]={n="That's Not a Rock!",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30205]={n="Runelocked",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30206]={n="Runes in the Ruins",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30225]={n="The Ashweb Matriarch",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="Golden Lotus",v=200}}}}
b[30226]={n="Blood on the Rise",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30227]={n="Wulon, the Granite Sentinel",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="Golden Lotus",v=200}}}}
b[30228]={n="Troubling the Troublemakers",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30231]={n="Pomfruit Pickup",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30232]={n="Ruffling Some Feathers",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30233]={n="Cracklefang",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="Golden Lotus",v=200}}}}
b[30234]={n="Vicejaw",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="Golden Lotus",v=200}}}}
b[30235]={n="Quid Pro Quo",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="Golden Lotus",v=200}}}}
b[30236]={n="Aetha",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="Golden Lotus",v=200}}}}
b[30237]={n="The Pandaren Uprising Relived",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30238]={n="Return to Rest",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30239]={n="Lao-Fe the Slavebinder",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="Golden Lotus",v=200}}}}
b[30240]={n="Survival Ring: Flame",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=300}}}}
b[30242]={n="Survival Ring: Blades",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=300}}}}
b[30243]={n="Mantid Under Fire",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=300}}}}
b[30244]={n="Along the Serpent's Spine",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30245]={n="Lost Scouts",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30246]={n="Upon the Ramparts",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30248]={n="The Butcher",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="Golden Lotus",v=200}}}}
b[30249]={n="Under the Setting Sun",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="Golden Lotus",v=200}}}}
b[30251]={n="Vyraxxis, the Krik'thik Swarm-Lord",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="Golden Lotus",v=200}}}}
b[30261]={n="Roll Club: Serpent's Spine",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="Golden Lotus",v=300}}}}
b[30263]={n="Clearing in the Forest",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30264]={n="Enemy at the Gates",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="Golden Lotus",v=300}}}}
b[30265]={n="Sparkle in the Eye",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30266]={n="Bloodied Skies",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=300}}}}
b[30277]={n="The Crumbling Hall",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=549600,xp=9600,rep={{n="Golden Lotus",v=500}}}}
b[30280]={n="The Thunder Below",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=549600,xp=9600,rep={{n="Golden Lotus",v=500}}}}
b[30281]={n="The Silent Approach",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30282]={n="Burning Away the Filth",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30283]={n="A Smashing Impression",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30284]={n="A Thousand Pointy Teeth",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30285]={n="Wu Kao Scouting Reports",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30286]={n="Backed Into a Corner",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30288]={n="My Town, It's On Fire Again",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30289]={n="Freeing Mind and Body",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30290]={n="Stonebound Killers",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30291]={n="Stunning Display",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30292]={n="Rude Awakenings",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30293]={n="In Enemy Hands",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30296]={n="Gaohun the Soul-Severer",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="Golden Lotus",v=200}}}}
b[30297]={n="Baolai the Immolator",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="Golden Lotus",v=200}}}}
b[30298]={n="Painting the Ruins Red",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30299]={n="No Stone Unturned",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30300]={n="The Key to Success",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30301]={n="Offering a Warm Welcome",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30302]={n="The Imperion Threat",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="Golden Lotus",v=200}}}}
b[30304]={n="Hard as a Rock",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30305]={n="He Knows What He's Doing",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30306]={n="The Battle Ring",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=300}}}}
b[30307]={n="The Eternal Vigil",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30308]={n="Stone Hard Quilen",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30309]={n="Set in Stone",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30310]={n="Thundering Skies",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30312]={n="Given a Second Chance",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30313]={n="The Moving Mists",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30314]={n="The Displaced Paleblade",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30320]={n="Free Spirits",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30328]={n="The Thousand-Year Dumpling",r={cu={{n="Ironpaw Token",ct=1},{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800}}
b[30329]={n="Cindergut Peppers",r={cu={{n="Ironpaw Token",ct=1},{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800}}
b[30330]={n="The Truffle Shuffle",r={cu={{n="Ironpaw Token",ct=1},{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800}}
b[30331]={n="The Mile-High Grub",r={cu={{n="Ironpaw Token",ct=1},{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800}}
b[30332]={n="Fatty Goatsteak",r={cu={{n="Ironpaw Token",ct=1},{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800}}
b[30338]={n="A Weighty Task",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30339]={n="Getting your Hands Dirty",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30340]={n="Stick in the Mud",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30341]={n="Under Watchful Eyes",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30342]={n="Fiery Tongue, Fragile Feet",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30386]={n="A Dish for Ella",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},rep={{n="Ella",v=1800}}}}
b[30390]={n="A Dish for Gina",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},rep={{n="Gina Mudclaw",v=1800}}}}
b[30396]={n="A Dish for Old Hillpaw",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},rep={{n="Old Hillpaw",v=1800}}}}
b[30402]={n="A Dish for Chee Chee",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},rep={{n="Chee Chee",v=1800}}}}
b[30408]={n="A Dish for Sho",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},rep={{n="Sho",v=1800}}}}
b[30414]={n="A Dish for Haohan",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},rep={{n="Haohan Mudclaw",v=1800}}}}
b[30421]={n="A Dish for Farmer Fung",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},rep={{n="Farmer Fung",v=1800}}}}
b[30427]={n="A Dish for Fish",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},rep={{n="Fish Fellreed",v=1800}}}}
b[30433]={n="A Dish for Tina",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},rep={{n="Tina Mudclaw",v=1800}}}}
b[30439]={n="A Dish for Jogu",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},rep={{n="Jogu the Drunk",v=1800}}}}
b[30442]={n="Blanche's Boomer Brew",}
b[30444]={n="No Reprieve",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30481]={n="Carved in Stone",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[30482]={n="The Soul-Gatherer",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="Golden Lotus",v=200}}}}
b[30584]={n="Shocking!",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="The Anglers",v=500}}}}
b[30585]={n="What Lurks Below",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="The Anglers",v=500}}}}
b[30586]={n="Jagged Abalone",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="The Anglers",v=500}}}}
b[30588]={n="Fishing for a Bruising",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="The Anglers",v=500}}}}
b[30598]={n="Who Knew Fish Liked Eggs?",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="The Anglers",v=500}}}}
b[30613]={n="Armored Carp",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="The Anglers",v=500}}}}
b[30658]={n="Huff & Puff",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="The Anglers",v=500}}}}
b[30677]={n="Shuttle Service",}
b[30678]={n="Like Bombing Fish In A Barrel",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="The Anglers",v=500}}}}
b[30698]={n="Scavenger Hunt",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="The Anglers",v=500}}}}
b[30700]={n="Snapclaw",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="The Anglers",v=500}}}}
b[30701]={n="Viseclaw Soup",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="The Anglers",v=500}}}}
b[30716]={n="Chasing Hope",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The August Celestials",v=250}}}}
b[30717]={n="Gifts of the Great Crane",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The August Celestials",v=250}}}}
b[30718]={n="Students of Chi-Ji",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The August Celestials",v=250}}}}
b[30725]={n="Ellia Ravenmane",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="The August Celestials",v=350}}}}
b[30726]={n="Minh Do-Tan",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="The August Celestials",v=350}}}}
b[30727]={n="Ellia Ravenmane: Rematch",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="The August Celestials",v=350}}}}
b[30728]={n="Fat Long-Fat",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="The August Celestials",v=350}}}}
b[30729]={n="Julia Bates",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="The August Celestials",v=350}}}}
b[30730]={n="Dextrous Izissha",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="The August Celestials",v=350}}}}
b[30731]={n="Kuo-Na Quillpaw",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="The August Celestials",v=350}}}}
b[30732]={n="Ellia Ravenmane: Revenge",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="The August Celestials",v=350}}}}
b[30733]={n="Tukka-Tuk",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="The August Celestials",v=350}}}}
b[30734]={n="Huck Wheelbarrow",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="The August Celestials",v=350}}}}
b[30735]={n="Mindel Sunspeaker",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="The August Celestials",v=350}}}}
b[30736]={n="Yan Quillpaw",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="The August Celestials",v=350}}}}
b[30737]={n="Fat Long-Fat: Rematch",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="The August Celestials",v=350}}}}
b[30738]={n="Thelonius",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="The August Celestials",v=350}}}}
b[30739]={n="Ellia Ravenmane: Redemption",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="The August Celestials",v=350}}}}
b[30740]={n="Champion of Chi-Ji",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="The August Celestials",v=350}}}}
b[30753]={n="Jumping the Shark",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="The Anglers",v=500}}}}
b[30754]={n="Bright Bait",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="The Anglers",v=500}}}}
b[30763]={n="Piranha!",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="The Anglers",v=500}}}}
b[30821]={n="The Burlap Grind",r={mo=137400,xp=4800}}
b[30879]={n="Round 1: Brewmaster Chani",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The August Celestials",v=250}}}}
b[30880]={n="Round 1: The Streetfighter",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The August Celestials",v=250}}}}
b[30881]={n="Round 2: Clever Ashyo & Ken-Ken",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The August Celestials",v=250}}}}
b[30882]={n="Round 2: Kang Bramblestaff",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The August Celestials",v=250}}}}
b[30883]={n="Round 3: The Wrestler",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The August Celestials",v=250}}}}
b[30885]={n="Round 3: Master Boom Boom",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The August Celestials",v=250}}}}
b[30902]={n="Round 4: Master Windfur",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The August Celestials",v=250}}}}
b[30907]={n="Round 4: The P.U.G.",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The August Celestials",v=250}}}}
b[30952]={n="The Unending Siege",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="The August Celestials",v=350}}}}
b[30953]={n="Fallen Sentinels",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The August Celestials",v=250}}}}
b[30954]={n="A Blade is a Blade",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The August Celestials",v=250}}}}
b[30955]={n="Paying Tribute",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The August Celestials",v=250}}}}
b[30956]={n="The Siege Swells",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="The August Celestials",v=350}}}}
b[30957]={n="The Overwhelming Swarm",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The August Celestials",v=250}}}}
b[30958]={n="In Battle's Shadow",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The August Celestials",v=250}}}}
b[30959]={n="The Big Guns",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The August Celestials",v=250}}}}
b[31024]={n="Kunchong Treats",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The Klaxxi",v=130}}}}
b[31039]={n="The Mogu Menace",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Shado-Pan",v=250}}}}
b[31040]={n="Spiteful Sprites",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Shado-Pan",v=250}}}}
b[31041]={n="Egg Rescue!",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Shado-Pan",v=250}}}}
b[31042]={n="Onyx Hearts",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Shado-Pan",v=250}}}}
b[31043]={n="Dark Arts",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Shado-Pan",v=250}}}}
b[31044]={n="Bronze Claws",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Shado-Pan",v=250}}}}
b[31045]={n="Illusions Of The Past",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Shado-Pan",v=250}}}}
b[31046]={n="Little Hatchlings",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Shado-Pan",v=250}}}}
b[31047]={n="Born Free",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Shado-Pan",v=250}}}}
b[31048]={n="Grave Consequences",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Shado-Pan",v=250}}}}
b[31049]={n="In Sprite Of Everything",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Shado-Pan",v=250}}}}
b[31061]={n="Riding the Storm",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Shado-Pan",v=250}}}}
b[31062]={n="When The Dead Speak",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Shado-Pan",v=250}}}}
b[31109]={n="Culling the Swarm",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The Klaxxi",v=130}}}}
b[31111]={n="Eradicating the Zan'thik",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The Klaxxi",v=130}}}}
b[31113]={n="Assault Fire Camp Gai-Cho",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Shado-Pan",v=250}}}}
b[31114]={n="Assault Deadtalker's Plateau",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Shado-Pan",v=250}}}}
b[31116]={n="Spirit Dust",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Shado-Pan",v=250}}}}
b[31117]={n="Uruk!",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Shado-Pan",v=250}}}}
b[31118]={n="The Deadtalker Cipher",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Shado-Pan",v=250}}}}
b[31119]={n="The Enemy of My Enemy... Is Still My Enemy!",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Shado-Pan",v=250}}}}
b[31120]={n="Cheng Bo!",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Shado-Pan",v=250}}}}
b[31131]={n="Whitepetal Lake",r={mo=68700,xp=2400}}
b[31136]={n="Behind Our Lines",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="Golden Lotus",v=200}}}}
b[31194]={n="Slitherscale Suppression",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=600}}}}
b[31196]={n="Sra'vess Wetwork",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Shado-Pan",v=250}}}}
b[31197]={n="The Bigger They Come...",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Shado-Pan",v=250}}}}
b[31198]={n="A Morale Victory",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Shado-Pan",v=250}}}}
b[31199]={n="Destroy the Siege Weapons!",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Shado-Pan",v=250}}}}
b[31200]={n="Fumigation",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Shado-Pan",v=250}}}}
b[31201]={n="Friends, Not Food!",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Shado-Pan",v=250}}}}
b[31203]={n="Target of Opportunity: Sra'thik Swarmlord",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Shado-Pan",v=250}}}}
b[31204]={n="Target of Opportunity: Sra'thik Hivelord",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Shado-Pan",v=250}}}}
b[31216]={n="Dark Skies",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The Klaxxi",v=130}}}}
b[31231]={n="Dreadspinner Extermination",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The Klaxxi",v=130}}}}
b[31232]={n="An Ancient Empire",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The Klaxxi",v=130}}}}
b[31233]={n="Sap Tapping",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The Klaxxi",v=130}}}}
b[31234]={n="Putting An Eye Out",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The Klaxxi",v=130}}}}
b[31235]={n="Nope Nope Nope",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The Klaxxi",v=130}}}}
b[31237]={n="Debugging the Terrace",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The Klaxxi",v=130}}}}
b[31238]={n="Brain Food",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The Klaxxi",v=130}}}}
b[31240]={n="Guo-Lai Infestation",r={mo=68700,xp=2400}}
b[31242]={n="Mistfall Village",r={mo=68700,xp=2400}}
b[31243]={n="Attack on Mistfall Village",r={mo=68700,xp=2400}}
b[31244]={n="Guo-Lai Encampment",r={mo=68700,xp=2400}}
b[31245]={n="Mistfall Village",r={mo=68700,xp=2400}}
b[31246]={n="Attack on Mistfall Village",r={mo=68700,xp=2400}}
b[31248]={n="The Ruins of Guo-Lai",r={mo=68700,xp=2400}}
b[31267]={n="Mistblade Destruction",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The Klaxxi",v=130}}}}
b[31268]={n="A Little Brain Work",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The Klaxxi",v=130}}}}
b[31269]={n="The Scale-Lord",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The Klaxxi",v=130}}}}
b[31270]={n="The Fight Against Fear",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The Klaxxi",v=130}}}}
b[31271]={n="Bad Genes",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The Klaxxi",v=130}}}}
b[31272]={n="Infection",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The Klaxxi",v=130}}}}
b[31293]={n="Mogu Make Poor House Guests",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[31295]={n="Mogu within the Ruins of Guo-Lai",r={mo=68700,xp=2400}}
b[31297]={n="Setting Sun Garrison",r={mo=68700,xp=2400}}
b[31376]={n="Attack At The Temple of the Jade Serpent",}
b[31378]={n="Challenge At The Temple of the Red Crane",}
b[31380]={n="Trial At The Temple of the White Tiger",}
b[31382]={n="Defense At Niuzao Temple",}
b[31487]={n="Sonic Disruption",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The Klaxxi",v=130}}}}
b[31492]={n="The Torch of Strength",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The August Celestials",v=250}}}}
b[31494]={n="Free From Her Clutches",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The Klaxxi",v=130}}}}
b[31496]={n="Sampling the Empire's Finest",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The Klaxxi",v=130}}}}
b[31502]={n="Wing Clip",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The Klaxxi",v=130}}}}
b[31503]={n="Shortcut to Ruin",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The Klaxxi",v=130}}}}
b[31504]={n="Ordnance Disposal",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The Klaxxi",v=130}}}}
b[31505]={n="Vess-Guard Duty",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The Klaxxi",v=130}}}}
b[31506]={n="Shackles of Manipulation",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The Klaxxi",v=130}}}}
b[31507]={n="Meltdown",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The Klaxxi",v=130}}}}
b[31508]={n="Specimen Request",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The Klaxxi",v=130}}}}
b[31509]={n="Fear Takes Root",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The Klaxxi",v=130}}}}
b[31510]={n="Quiet Now",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The Klaxxi",v=130}}}}
b[31517]={n="Contending With Bullies",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The August Celestials",v=250}}}}
b[31520]={n="A Worthy Challenge: Sha of Doubt",r={i={{n="Heroic Cache of Treasures"}},mo=549600,xp=9600}}
b[31522]={n="A Worthy Challenge: Sha of Hatred",r={i={{n="Heroic Cache of Treasures"}},mo=549600,xp=9600}}
b[31523]={n="A Worthy Challenge: Xin the Weaponmaster",r={i={{n="Heroic Cache of Treasures"}},mo=549600,xp=9600}}
b[31524]={n="A Worthy Challenge: Raigonn",r={i={{n="Heroic Cache of Treasures"}},mo=549600,xp=9600}}
b[31525]={n="A Worthy Challenge: Wing Leader Ner'onok",r={i={{n="Heroic Cache of Treasures"}},mo=549600,xp=9600}}
b[31527]={n="A Worthy Challenge: Flameweaver Koegler",r={i={{n="Heroic Cache of Treasures"}},mo=549600,xp=9600}}
b[31528]={n="A Worthy Challenge: Darkmaster Gandling",r={i={{n="Heroic Cache of Treasures"}},mo=412200,xp=9600}}
b[31598]={n="Kypa'rak's Core",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="The Klaxxi",v=130}}}}
b[31599]={n="The Matriarch's Maw",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="The Klaxxi",v=130}}}}
b[31674]={n="The Pink Turnip Challenge",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=68700,xp=2400,rep={{n="The Tillers",v=350}}}}
b[31677]={n="The Warlord's Ashes",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=274800,xp=6000,rep={{n="The Klaxxi",v=130}}}}
b[31693]={n="Julia Stevens",r={mo=280900,xp=9500}}
b[31698]={n="Thinning The Pack",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=450}}}}
b[31699]={n="Sprite Fright",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=450}}}}
b[31700]={n="The Shoe Is On The Other Foot",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=450}}}}
b[31701]={n="Dark Huntress",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=600}}}}
b[31702]={n="On The Prowl",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=600}}}}
b[31703]={n="Madcap Mayhem",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=600}}}}
b[31704]={n="Pooped",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=450}}}}
b[31705]={n="Needle Me Not",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=600}}}}
b[31706]={n="Weeping Widows",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=450}}}}
b[31707]={n="A Tangled Web",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=450}}}}
b[31708]={n="Serpent's Scale",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=450}}}}
b[31709]={n="Lingering Doubt",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=450}}}}
b[31710]={n="Tiny Treats",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=450}}}}
b[31711]={n="The Seed of Doubt",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=600}}}}
b[31712]={n="Monkey Mischief",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=450}}}}
b[31713]={n="The Big Brew-haha",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=450}}}}
b[31714]={n="Saving the Serpents",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=450}}}}
b[31715]={n="The Big Kah-Oona",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=600}}}}
b[31717]={n="The Trainer's Challenge: Ace Longpaw",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=450}}}}
b[31718]={n="The Trainer's Challenge: Big Bao",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=450}}}}
b[31719]={n="The Trainer's Challenge: Ningna Darkwheel",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=450}}}}
b[31720]={n="The Trainer's Challenge: Suchi the Sweet",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=450}}}}
b[31721]={n="The Trainer's Challenge: Qua-Ro Whitebrow",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Order of the Cloud Serpent",v=450}}}}
b[31752]={n="Blingtron 4000",r={i={{n="Blingtron 4000 Gift Package"}}}}
b[31754]={n="Cannonfire",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[31755]={n="Acts of Cruelty",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[31756]={n="High Chance of Rain",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[31757]={n="Unleashed Spirits",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[31758]={n="Laosy Scouting",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[31760]={n="Striking First",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[31762]={n="Crumbling Behemoth",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=100}}}}
b[31781]={n="Lindsay",r={mo=280900,xp=9500}}
b[31808]={n="Rampage Against the Machine",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="The Klaxxi",v=130}}}}
b[31840]={n="Practice Makes Perfect: Master Cheng",r={xp=4750}}
b[31842]={n="Practice Makes Perfect: Master Kistane",r={xp=4750}}
b[31843]={n="Practice Makes Perfect: Master Yoon",r={xp=4750}}
b[31844]={n="Practice Makes Perfect: Master Cheng",r={xp=4750}}
b[31845]={n="Practice Makes Perfect: Master Tsang",r={xp=4750}}
b[31846]={n="Practice Makes Perfect: Master Hsu",r={xp=4750}}
b[31850]={n="Eric Davidson",r={mo=280900,xp=9500}}
b[31851]={n="Bill Buckler",r={mo=280900,xp=9500}}
b[31852]={n="Steven Lisbane",r={mo=280900,xp=9500}}
b[31909]={n="Grand Master Trixxy",r={i={{n="Sack of Pet Supplies"}},mo=280900,xp=9500}}
b[31910]={n="David Kosse",r={mo=280900,xp=9500}}
b[31911]={n="Deiza Plaguehorn",r={mo=280900,xp=9500}}
b[31912]={n="Kortas Darkhammer",r={mo=280900,xp=9500}}
b[31913]={n="Everessa",r={mo=280900,xp=9500}}
b[31914]={n="Durin Darkhammer",r={mo=280900,xp=9500}}
b[31916]={n="Grand Master Lydia Accoste",r={i={{n="Sack of Pet Supplies"}},mo=280900,xp=9500}}
b[31922]={n="Nicki Tinytech",r={mo=280900,xp=9500}}
b[31923]={n="Ras'an",r={mo=280900,xp=9500}}
b[31924]={n="Narrok",r={mo=280900,xp=9500}}
b[31925]={n="Morulu The Elder",r={mo=280900,xp=9500}}
b[31926]={n="Grand Master Antari",r={i={{n="Sack of Pet Supplies"}},mo=280900,xp=9500}}
b[31931]={n="Beegle Blastfuse",r={mo=280900,xp=9500}}
b[31932]={n="Nearly Headless Jacob",r={mo=280900,xp=9500}}
b[31933]={n="Okrut Dragonwaste",r={mo=280900,xp=9500}}
b[31934]={n="Gutretch",r={mo=280900,xp=9500}}
b[31935]={n="Grand Master Payne",r={i={{n="Sack of Pet Supplies"}},mo=280900,xp=9500}}
b[31953]={n="Grand Master Hyuna",r={i={{n="Sack of Pet Supplies"}},mo=280900,xp=9500}}
b[31954]={n="Grand Master Mo'ruk",r={i={{n="Sack of Pet Supplies"}},mo=280900,xp=9500}}
b[31955]={n="Grand Master Nishi",r={i={{n="Sack of Pet Supplies"}},mo=280900,xp=9500}}
b[31956]={n="Grand Master Yon",r={i={{n="Sack of Pet Supplies"}},mo=280900,xp=9500}}
b[31957]={n="Grand Master Shu",r={i={{n="Sack of Pet Supplies"}},mo=280900,xp=9500}}
b[31958]={n="Grand Master Aki",r={i={{n="Sack of Pet Supplies"}},mo=280900,xp=9500}}
b[31971]={n="Grand Master Obalis",r={i={{n="Sack of Pet Supplies"}},mo=280900,xp=9500}}
b[31972]={n="Brok",r={mo=280900,xp=9500}}
b[31973]={n="Bordin Steadyfist",r={mo=280900,xp=9500}}
b[31974]={n="Goz Banefury",r={mo=280900,xp=9500}}
b[31991]={n="Grand Master Zusshi",r={i={{n="Sack of Pet Supplies"}},mo=280900,xp=9500}}
b[31998]={n="A Worthy Challenge: Sha of Doubt",r={i={{n="Heroic Cache of Treasures"}},mo=549600,xp=9600}}
b[32001]={n="A Worthy Challenge: Sha of Hatred",r={i={{n="Heroic Cache of Treasures"}},mo=549600,xp=9600}}
b[32002]={n="A Worthy Challenge: Xin the Weaponmaster",r={i={{n="Heroic Cache of Treasures"}},mo=549600,xp=9600}}
b[32003]={n="A Worthy Challenge: Raigonn",r={i={{n="Heroic Cache of Treasures"}},mo=549600,xp=9600}}
b[32004]={n="A Worthy Challenge: Wing Leader Ner'onok",r={i={{n="Heroic Cache of Treasures"}},mo=549600,xp=9600}}
b[32006]={n="A Worthy Challenge: Flameweaver Koegler",r={i={{n="Heroic Cache of Treasures"}},mo=549600,xp=9600}}
b[32007]={n="A Worthy Challenge: Darkmaster Gandling",r={i={{n="Heroic Cache of Treasures"}},mo=412200,xp=9600}}
b[32115]={n="Shackles of the Past",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Operation: Shieldwall",v=150}}}}
b[32116]={n="Priorities, People!",r={mo=13740,xp=600}}
b[32118]={n="Taking Advantage",r={mo=13740,xp=600}}
b[32119]={n="It Is A Mystery",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Operation: Shieldwall",v=150}}}}
b[32120]={n="Legacy of Ogudei",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Dominance Offensive",v=150}}}}
b[32121]={n="The Spirit Trap",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Operation: Shieldwall",v=150}}}}
b[32122]={n="Ogudei's Lieutenants",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Operation: Shieldwall",v=300}}}}
b[32123]={n="Death on Two Legs",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Dominance Offensive",v=150}}}}
b[32126]={n="Tear It Up",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Dominance Offensive",v=150}}}}
b[32127]={n="All Dead, All Dead",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Dominance Offensive",v=300}}}}
b[32128]={n="Another One Bites the Dust",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Dominance Offensive",v=150}}}}
b[32130]={n="Good Luck, Have Fun",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Dominance Offensive",v=150}}}}
b[32131]={n="We Require More Minerals!",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Dominance Offensive",v=150}}}}
b[32132]={n="Worker Harassment",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Dominance Offensive",v=150}}}}
b[32133]={n="Sentry Wards",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Dominance Offensive",v=150}}}}
b[32134]={n="Hard Counter",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Dominance Offensive",v=150}}}}
b[32135]={n="Hero Killer",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Dominance Offensive",v=300}}}}
b[32136]={n="Work Order: Fuel",r={mo=13740,xp=600}}
b[32137]={n="Runnin' On Empty",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Dominance Offensive",v=150}}}}
b[32138]={n="Work Order: Lumber",r={mo=13740,xp=600}}
b[32139]={n="Stacked!",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Dominance Offensive",v=150}}}}
b[32140]={n="Work Order: Iron",r={mo=13740,xp=600}}
b[32141]={n="Power Metal",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Dominance Offensive",v=150}}}}
b[32142]={n="We Will Rock You",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Operation: Shieldwall",v=150}}}}
b[32143]={n="A Kind of Magic",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Operation: Shieldwall",v=150}}}}
b[32144]={n="Under Pressure",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Operation: Shieldwall",v=150}}}}
b[32145]={n="Don't Lose Your Head",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Operation: Shieldwall",v=300}}}}
b[32146]={n="Hammer to Fall",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Operation: Shieldwall",v=150}}}}
b[32148]={n="Attack! Move!",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Operation: Shieldwall",v=150}}}}
b[32149]={n="Resource Gathering",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Operation: Shieldwall",v=150}}}}
b[32150]={n="Supply Block",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Operation: Shieldwall",v=150}}}}
b[32151]={n="Tower Defense",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Operation: Shieldwall",v=150}}}}
b[32152]={n="Siege Damage",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Operation: Shieldwall",v=150}}}}
b[32153]={n="Hero Killer",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Operation: Shieldwall",v=300}}}}
b[32154]={n="Burn Out!",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Operation: Shieldwall",v=150}}}}
b[32156]={n="It's Only Right",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Operation: Shieldwall",v=150}}}}
b[32157]={n="The Only Good Goblin...",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Operation: Shieldwall",v=150}}}}
b[32158]={n="Two Step Program",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Operation: Shieldwall",v=300}}}}
b[32161]={n="Beastmaster's Hunt: The Crane",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800}}
b[32162]={n="Beastmaster's Hunt: The Tiger",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800}}
b[32163]={n="Beastmaster's Hunt: The Crab",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800}}
b[32164]={n="Beastmaster's Hunt: The Crane",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800}}
b[32165]={n="Beastmaster's Hunt: The Tiger",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800}}
b[32166]={n="Beastmaster's Hunt: The Crab",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800}}
b[32197]={n="Mystery Meatloaf",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Dominance Offensive",v=150}}}}
b[32199]={n="Krasarang Steampot",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Dominance Offensive",v=150}}}}
b[32200]={n="Dangers of Za'Tual",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32201]={n="Grave Circumstances",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32204]={n="The Skumblade Threat",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32205]={n="Gather Scout Reports",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32206]={n="This Just Won't Do",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32207]={n="Saur Loser",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32208]={n="Maximum Capacitor",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32209]={n="Save Our Scouts!",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32213]={n="Old Enemies",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32214]={n="Bilgewater Infiltrators",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Dominance Offensive",v=150}}}}
b[32215]={n="Heinous Sacrifice",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32216]={n="Pterrible Ptorment",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32217]={n="Dark Offerings",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32218]={n="Ashes of the Enemy",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32219]={n="Stone Cold",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32220]={n="Soul Surrender",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32221]={n="Storming the Beach",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Dominance Offensive",v=150}}}}
b[32222]={n="WANTED: Chief Engineer Cogwrench",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Dominance Offensive",v=300}}}}
b[32223]={n="WANTED: Lieutenant Ethan Jacobson",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Dominance Offensive",v=300}}}}
b[32224]={n="Rise No More!",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32225]={n="The Call of Thunder",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32226]={n="Into the Crypts",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32227]={n="Preventing a Future Threat",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32228]={n="The Shuddering Moor",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32230]={n="The Zandalari Colossus",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32232]={n="What's Inside Counts",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32233]={n="Very Disarming",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32234]={n="Knowledge Is Power",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32235]={n="Flash! Aaaaaahhhh!",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Dominance Offensive",v=150}}}}
b[32236]={n="Bug Off!",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Dominance Offensive",v=150}}}}
b[32237]={n="Precious Resource",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Dominance Offensive",v=150}}}}
b[32238]={n="Universal Remote-Explode",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Dominance Offensive",v=150}}}}
b[32252]={n="Harbingers of the Loa",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32254]={n="Manipulating the Saurok",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32255]={n="De-Constructed",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32262]={n="Captive Audience",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32264]={n="Spellbound",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32265]={n="Charged Moganite",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32266]={n="Mana Manifestations",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32268]={n="Tactical Mana Bombs",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32269]={n="Breaking Down the Defenses",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32274]={n="The Residents of Ihgaluk",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32275]={n="Surgical Death",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32282]={n="Compy Stomp",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32283]={n="Loa-saur",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32285]={n="The Sleepless Legion",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32287]={n="Enemies Beneath the Tower",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32288]={n="Bolstering the Defenses",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32293]={n="Among the Bones",r={cu={{n="Lesser Charm of Good Fortune",ct=5}},mo=274800,xp=6000,rep={{n="Sunreaver Onslaught",v=200}}}}
b[32294]={n="Raining Bones",r={cu={{n="Lesser Charm of Good Fortune",ct=5}},mo=274800,xp=6000,rep={{n="Sunreaver Onslaught",v=200}}}}
b[32297]={n="Direhorn or Devilsaur",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32298]={n="Dino Might",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32299]={n="Just Some Light Clean-Up Work",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32300]={n="Disarming Irony",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32301]={n="Old Enemies",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32302]={n="Desconstruction",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32303]={n="Made for War",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32304]={n="High Recognition",r={i={{n="Sunreaver Bounty"},{n="Sunreaver Bounty"}},cu={{n="Lesser Charm of Good Fortune",ct=5}},mo=274800,xp=6000,rep={{n="Sunreaver Onslaught",v=200}}}}
b[32305]={n="Overpowered",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32342]={n="The Spirit Trap",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Dominance Offensive",v=150}}}}
b[32343]={n="Ogudei's Lieutenants",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Dominance Offensive",v=300}}}}
b[32344]={n="It Is A Mystery",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Dominance Offensive",v=150}}}}
b[32345]={n="We're Not Monsters!",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Dominance Offensive",v=150}}}}
b[32346]={n="Oi Ain't Afraid o' No Ghosts!",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Operation: Shieldwall",v=150}}}}
b[32347]={n="Eviction Notice",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Operation: Shieldwall",v=150}}}}
b[32348]={n="Kick 'em While They're Down",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Dominance Offensive",v=150}}}}
b[32434]={n="Burning Pandaren Spirit",r={i={{n="Pandaren Spirit Pet Supplies"}},mo=280900,xp=9500}}
b[32439]={n="Flowing Pandaren Spirit",r={i={{n="Pandaren Spirit Pet Supplies"}},mo=280900,xp=9500}}
b[32440]={n="Whispering Pandaren Spirit",r={i={{n="Pandaren Spirit Pet Supplies"}},mo=280900,xp=9500}}
b[32441]={n="Thundering Pandaren Spirit",r={i={{n="Pandaren Spirit Pet Supplies"}},mo=280900,xp=9500}}
b[32446]={n="Dis-Assembly Required",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Operation: Shieldwall",v=150}}}}
b[32449]={n="The Ruins of Ogudei",r={mo=13740,xp=600}}
b[32450]={n="The Time Is Now!",r={mo=13740,xp=600}}
b[32451]={n="Send A Message",r={mo=13740,xp=600}}
b[32452]={n="And Then There Were Goblins",r={mo=13740,xp=600}}
b[32485]={n="Bolstering the Defenses",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32489]={n="The Creeping Carpet of Ihgaluk",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32491]={n="Left To Rot",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32493]={n="They All Fall Down",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32494]={n="Power Play",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32495]={n="The Bloodletter",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32506]={n="A Wing to Fly On",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32517]={n="The Conquest of Stone",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32520]={n="Competing Magic",r={cu={{n="Lesser Charm of Good Fortune",ct=5}},mo=274800,xp=6000,rep={{n="Sunreaver Onslaught",v=200}}}}
b[32521]={n="Encroaching Force",r={cu={{n="Lesser Charm of Good Fortune",ct=5}},mo=274800,xp=6000,rep={{n="Sunreaver Onslaught",v=200}}}}
b[32523]={n="The Beast Pens",r={mo=34350,xp=1200}}
b[32524]={n="The Beating of Troll Drums",r={mo=34350,xp=1200}}
b[32525]={n="Ashes of the Enemy",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32526]={n="Soul Surrender",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32527]={n="Grave Circumstances",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32528]={n="Into the Crypts",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32529]={n="The Call of Thunder",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32530]={n="The Bloodletter",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32531]={n="The Conquest of Stone",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32532]={n="Rise No More!",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32533]={n="Stone Cold",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32535]={n="The Skumblade Threat",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32536]={n="Manipulating the Saurok",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32537]={n="De-Constructed",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32538]={n="Heinous Sacrifice",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32539]={n="Dark Offerings",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32540]={n="Harbingers of the Loa",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32541]={n="Preventing a Future Threat",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32542]={n="Surgical Strike",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32543]={n="Dangers of Za'Tual",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32544]={n="Pterrible Ptorment",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32545]={n="The Residents of Ihgaluk",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32546]={n="Just Some Light Clean-Up Work",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32547]={n="The Creeping Carpet of Ihgaluk",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32548]={n="Left To Rot",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32550]={n="Saur Loser",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32551]={n="Compy Stomp",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32552]={n="Loa-saur",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32553]={n="Direhorn vs Devilsaur",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32554]={n="Dino Might",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32555]={n="Centuries in Sentries",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32556]={n="The More You Know",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32557]={n="Out of Enemy Hands",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32558]={n="All In the Family",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32559]={n="Even Giants Fall",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32560]={n="Keep It Secret",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32562]={n="Imposing Threat",r={cu={{n="Lesser Charm of Good Fortune",ct=5}},mo=274800,xp=6000,rep={{n="Sunreaver Onslaught",v=200}}}}
b[32564]={n="Zandalari on the Rise",r={cu={{n="Lesser Charm of Good Fortune",ct=5}},mo=274800,xp=6000,rep={{n="Sunreaver Onslaught",v=200}}}}
b[32567]={n="The Beast Pens",r={mo=34350,xp=1200}}
b[32568]={n="No Time To Rest",r={mo=34350,xp=1200}}
b[32571]={n="A Wing to Fly On",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32572]={n="The Sleepless Legion",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32573]={n="Enemies Beneath the Tower",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32574]={n="The Shuddering Moor",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32575]={n="The Zandalari Colossus",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32576]={n="Competing Magic",r={cu={{n="Lesser Charm of Good Fortune",ct=5}},mo=274800,xp=6000,rep={{n="Kirin Tor Offensive",v=200}}}}
b[32578]={n="Among the Bones",r={cu={{n="Lesser Charm of Good Fortune",ct=5}},mo=274800,xp=6000,rep={{n="Kirin Tor Offensive",v=200}}}}
b[32580]={n="Encroaching Force",r={cu={{n="Lesser Charm of Good Fortune",ct=5}},mo=274800,xp=6000,rep={{n="Kirin Tor Offensive",v=200}}}}
b[32581]={n="Imposing Threat",r={cu={{n="Lesser Charm of Good Fortune",ct=5}},mo=274800,xp=6000,rep={{n="Kirin Tor Offensive",v=200}}}}
b[32582]={n="Raining Bones",r={cu={{n="Lesser Charm of Good Fortune",ct=5}},mo=274800,xp=6000,rep={{n="Kirin Tor Offensive",v=200}}}}
b[32583]={n="Zandalari on the Rise",r={cu={{n="Lesser Charm of Good Fortune",ct=5}},mo=274800,xp=6000,rep={{n="Kirin Tor Offensive",v=200}}}}
b[32586]={n="Maximum Capacitor",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32587]={n="Forge Ahead!",r={cu={{n="Lesser Charm of Good Fortune",ct=5}},mo=274800,xp=6000,rep={{n="Kirin Tor Offensive",v=200}}}}
b[32588]={n="On Her Magic-ey Secret Service",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32604]={n="Beasts of Fable Book I",r={i={{n="Fabled Pandaren Pet Supplies"}},mo=280900,xp=9500}}
b[32605]={n="Subtle Encouragement",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=150}}}}
b[32606]={n="Subtle Encouragement",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32607]={n="Extended Shore Leave",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=549600,xp=9600,rep={{n="Kirin Tor Offensive",v=400}}}}
b[32608]={n="Raiding the Vault",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=549600,xp=9600,rep={{n="Kirin Tor Offensive",v=400}}}}
b[32613]={n="Giant Dinosaur Bone",r={mo=13740}}
b[32614]={n="More Giant Dinosaur Bones",r={i={{n="Mote of Harmony"}},mo=13740}}
b[32615]={n="Many More Giant Dinosaur Bones",r={i={{n="Spirit of Harmony"}},mo=13740}}
b[32627]={n="Charged Moganite",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32628]={n="Tactical Mana Bombs",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32631]={n="High Recognition",r={i={{n="Arcane Trove"},{n="Arcane Trove"}},cu={{n="Lesser Charm of Good Fortune",ct=5}},mo=274800,xp=6000,rep={{n="Kirin Tor Offensive",v=200}}}}
b[32632]={n="Made for War",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32633]={n="Spellbound",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32634]={n="Breaking Down the Defenses",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32635]={n="Enough with the Bombs!",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32636]={n="Captive Audience",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32637]={n="Overpowered",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32638]={n="Mana Scavengers",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32639]={n="Deconstruction",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=150}}}}
b[32643]={n="Work Order: Dominance Offensive II",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Dominance Offensive",v=400}}}}
b[32646]={n="Work Order: Operation: Shieldwall II",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Operation: Shieldwall",v=400}}}}
b[32648]={n="Work Order: Golden Lotus II",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Golden Lotus",v=400}}}}
b[32650]={n="Work Order: Shado-Pan II",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Shado-Pan",v=400}}}}
b[32657]={n="Work Order: The August Celestials II",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="The August Celestials",v=400}}}}
b[32659]={n="Work Order: The Klaxxi II",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="The Klaxxi",v=400}}}}
b[32676]={n="Extended Shore Leave",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=549600,xp=9600,rep={{n="Sunreaver Onslaught",v=400}}}}
b[32677]={n="Raiding the Vault",r={cu={{n="Lesser Charm of Good Fortune",ct=2}},mo=549600,xp=9600,rep={{n="Sunreaver Onslaught",v=200}}}}
b[32720]={n="Choose Your Assignment",}
b[32722]={n="Forge Ahead!",r={cu={{n="Lesser Charm of Good Fortune",ct=5}},mo=274800,xp=6000,rep={{n="Sunreaver Onslaught",v=200}}}}
b[32728]={n="The Court of Bones",r={mo=34350,xp=1200}}
b[32729]={n="Za'Tual",r={mo=34350,xp=1200}}
b[32730]={n="Ihgaluk Crag",r={mo=34350,xp=1200}}
b[32731]={n="The Court of Bones",r={mo=34350,xp=1200}}
b[32732]={n="Ihgaluk Crag",r={mo=34350,xp=1200}}
b[32733]={n="Za'Tual",r={mo=34350,xp=1200}}
b[32868]={n="Beasts of Fable Book II",r={i={{n="Fabled Pandaren Pet Supplies"}},mo=280900,xp=9500}}
b[32869]={n="Beasts of Fable Book III",r={i={{n="Fabled Pandaren Pet Supplies"}},mo=280900,xp=9500}}
b[32943]={n="Work Order: Sunreaver Onslaught II",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Sunreaver Onslaught",v=400}}}}
b[32945]={n="Work Order: Kirin Tor Offensive II",r={cu={{n="Lesser Charm of Good Fortune",ct=1}},mo=137400,xp=4800,rep={{n="Kirin Tor Offensive",v=400}}}}
b[33211]={n="A Timeless Question",r={cu={{n="Timeless Coin",ct=100}},mo=549600,xp=9600}}
b[33222]={n="Little Tommy Newcomer",r={cu={{n="Timeless Coin",ct=500}},mo=280900,xp=9500}}
b[33334]={n="Strong Enough To Survive",r={cu={{n="Timeless Coin",ct=1000}},mo=274800,xp=6000}}
b[33374]={n="Path of the Mistwalker",r={cu={{n="Timeless Coin",ct=1000}},mo=274800,xp=6000,rep={{n="Emperor Shaohao",v=250}}}}
b[33756]={n="Let's Keep Racing!",}
b[35066]={n="Fire Ammonite",r={i={{n="Pack of Fishing Supplies"}},mo=169800,xp=5450}}
b[35072]={n="Fat Sleeper",r={i={{n="Pack of Fishing Supplies"}},mo=169800,xp=5450}}
b[35073]={n="Blind Lake Sturgeon",r={i={{n="Pack of Fishing Supplies"}},mo=169800,xp=5450}}
b[35074]={n="Blackwater Whiptail",r={i={{n="Pack of Fishing Supplies"}},mo=169800,xp=5450}}
b[35075]={n="Abyssal Gulper Eel",r={i={{n="Pack of Fishing Supplies"}},mo=169800,xp=5450}}
b[36511]={n="Jawless Skulker",r={i={{n="Pack of Fishing Supplies"}},mo=254700,xp=5450}}
b[36513]={n="Fat Sleeper",r={i={{n="Pack of Fishing Supplies"}},mo=169800,xp=5450}}
b[36514]={n="Blind Lake Sturgeon",r={i={{n="Pack of Fishing Supplies"}},mo=169800,xp=5450}}
b[36515]={n="Blackwater Whiptail",r={i={{n="Pack of Fishing Supplies"}},mo=169800,xp=5450}}
b[36517]={n="Abyssal Gulper Eel",r={i={{n="Pack of Fishing Supplies"}},mo=169800,xp=5450}}
b[36648]={n="Assault on Stonefury Cliffs",r={cu={{n="Apexis Crystal",ct=800}},mo=509400,xp=1350}}
b[36649]={n="Assault on Shattrath Harbor",r={cu={{n="Apexis Crystal",ct=800}},mo=509400,xp=1350}}
b[36667]={n="Assault on Shattrath Harbor",r={cu={{n="Apexis Crystal",ct=800}},mo=509400,xp=1350}}
b[36669]={n="Assault on Stonefury Cliffs",r={cu={{n="Apexis Crystal",ct=800}},mo=509400,xp=1350}}
b[36674]={n="Assault on the Iron Siegeworks",r={cu={{n="Apexis Crystal",ct=800}},mo=509400,xp=1350}}
b[36675]={n="Assault on Magnarok",r={cu={{n="Apexis Crystal",ct=800}},mo=509400,xp=1350}}
b[36676]={n="Assault on the Everbloom Wilds",r={cu={{n="Apexis Crystal",ct=800}},mo=509400,xp=1350}}
b[36677]={n="Assault on the Broken Precipice",r={cu={{n="Apexis Crystal",ct=800}},mo=509400,xp=1350}}
b[36678]={n="Assault on Mok'gol Watchpost",r={cu={{n="Apexis Crystal",ct=800}},mo=509400,xp=1350}}
b[36679]={n="Assault on Darktide Roost",r={cu={{n="Apexis Crystal",ct=800}},mo=509400,xp=1350}}
b[36680]={n="Assault on Socrethar's Rise",r={cu={{n="Apexis Crystal",ct=800}},mo=509400,xp=1350}}
b[36681]={n="Assault on Lost Veil Anzu",r={cu={{n="Apexis Crystal",ct=800}},mo=509400,xp=1350}}
b[36682]={n="Assault on Pillars of Fate",r={cu={{n="Apexis Crystal",ct=800}},mo=509400,xp=1350}}
b[36683]={n="Assault on Skettis",r={cu={{n="Apexis Crystal",ct=800}},mo=509400,xp=1350}}
b[36684]={n="Battle in Ashran",r={cu={{n="Apexis Crystal",ct=1000}},mo=679200,xp=1350}}
b[36688]={n="Assault on Skettis",r={cu={{n="Apexis Crystal",ct=800}},mo=509400,xp=1350}}
b[36689]={n="Assault on Pillars of Fate",r={cu={{n="Apexis Crystal",ct=800}},mo=509400,xp=1350}}
b[36691]={n="Assault on Socrethar's Rise",r={cu={{n="Apexis Crystal",ct=800}},mo=509400,xp=1350}}
b[36692]={n="Assault on Darktide Roost",r={cu={{n="Apexis Crystal",ct=800}},mo=509400,xp=1350}}
b[36693]={n="Assault on Mok'gol Watchpost",r={cu={{n="Apexis Crystal",ct=800}},mo=509400,xp=1350}}
b[36694]={n="Assault on the Broken Precipice",r={cu={{n="Apexis Crystal",ct=800}},mo=509400,xp=1350}}
b[36695]={n="Assault on the Everbloom Wilds",r={cu={{n="Apexis Crystal",ct=800}},mo=509400,xp=1350}}
b[36696]={n="Assault on the Iron Siegeworks",r={cu={{n="Apexis Crystal",ct=800}},mo=509400,xp=1350}}
b[36697]={n="Assault on Magnarok",r={cu={{n="Apexis Crystal",ct=800}},mo=509400,xp=1350}}
b[36698]={n="Battle in Ashran",r={cu={{n="Apexis Crystal",ct=1000}},mo=679200,xp=1350}}
b[37125]={n="A Rare Find",r={rep={{n="Steamwheedle Preservation Society",v=350}}}}
b[37145]={n="Budd's Gambit",r={i={{n="Strongbox of Mysterious Treasures"}},mo=679200,xp=10950}}
b[37203]={n="Ashlei",r={i={{n="Polished Pet Charm",ic=2004597}},mo=280900,xp=9500}}
b[37210]={n="Aogexon's Fang",r={mo=339600,rep={{n="Steamwheedle Preservation Society",v=500}}}}
b[37211]={n="Bergruu's Horn",r={mo=339600,rep={{n="Steamwheedle Preservation Society",v=500}}}}
b[37221]={n="Dekorhan's Tusk",r={mo=339600,rep={{n="Steamwheedle Preservation Society",v=500}}}}
b[37222]={n="Direhoof's Hide",r={mo=339600,rep={{n="Steamwheedle Preservation Society",v=500}}}}
b[37223]={n="Gagrog's Skull",r={mo=339600,rep={{n="Steamwheedle Preservation Society",v=500}}}}
b[37224]={n="Mu'gra's Head",r={mo=339600,rep={{n="Steamwheedle Preservation Society",v=500}}}}
b[37225]={n="Thek'talon's Talon",r={mo=339600,rep={{n="Steamwheedle Preservation Society",v=500}}}}
b[37226]={n="Xelganak's Stinger",r={mo=339600,rep={{n="Steamwheedle Preservation Society",v=500}}}}
b[37230]={n="Bloody Expensive",r={i={{n="Supply of Storied Rarities"}},mo=169800,xp=1350}}
b[37231]={n="The Search Continues",r={i={{n="Supply of Storied Rarities"}},mo=169800,xp=1350}}
b[37238]={n="Secrets of Soulbinding",r={i={{n="Supply of Storied Rarities"}},mo=169800,xp=1350}}
b[37239]={n="Fate of the Fallen",r={i={{n="Supply of Storied Rarities"}},mo=169800,xp=1350}}
b[37520]={n="Vileclaw's Claw",r={mo=339600,rep={{n="Steamwheedle Preservation Society",v=500}}}}
b[37523]={n="Assault on the Gorian Proving Grounds",r={cu={{n="Apexis Crystal",ct=800}},mo=509400,xp=1350}}
b[37524]={n="Assault on the Gorian Proving Grounds",r={cu={{n="Apexis Crystal",ct=800}},mo=509400,xp=1350}}
b[37783]={n="Iron Docks",r={cu={{n="Garrison Resources",ct=175}},mo=679200,xp=1350}}
b[37784]={n="Shadowmoon Burial Grounds",r={cu={{n="Garrison Resources",ct=175}},mo=679200,xp=1350}}
b[37788]={n="Treasure Contract: Gutrek's Cleaver",r={mo=42450,xp=1350}}
b[37797]={n="Gutrek's Cleaver: The First Piece",r={mo=42450,xp=1350}}
b[37798]={n="Gutrek's Cleaver: The Second Piece",r={mo=42450,xp=1350}}
b[37799]={n="Gutrek's Cleaver: The Final Piece",r={mo=42450,xp=1350}}
b[37811]={n="Gutrek's Cleaver: The Spirit Forge",r={mo=1653920,xp=1350}}
b[37868]={n="More Big Racing!",}
b[37881]={n="Treasure Contract: Explosive Discoveries",r={mo=42450,xp=1350}}
b[37882]={n="Dark Grimoire: The First Ingredient",r={mo=42450,xp=1350}}
b[37883]={n="Dark Grimoire: The Second Ingredient",r={mo=42450,xp=1350}}
b[37884]={n="Dark Grimoire: The Final Ingredient",r={mo=42450,xp=1350}}
b[37885]={n="Dark Grimoire: Breaching the Barrier",r={mo=1653920,xp=1350}}
b[37910]={n="The Real Race",r={i={{n="Darkmoon Game Prize",ic=134143}},rep={{n="Darkmoon Faire",v=250}}}}
b[37911]={n="The Real Big Race",r={i={{n="Darkmoon Game Prize",ic=134143}},rep={{n="Darkmoon Faire",v=250}}}}
b[37914]={n="Treasure Contract: The Thunderlord Sage",r={mo=42450,xp=1350}}
b[37916]={n="Gronnsbane: The Broken Spear",r={mo=42450,xp=1350}}
b[37917]={n="Gronnsbane: The Blessing of Fire",r={mo=42450,xp=1350}}
b[37918]={n="Gronnsbane: The Blessing of Frost",r={mo=42450,xp=1350}}
b[37919]={n="Gronnsbane: The Blessing of Beasts",r={mo=1653920,xp=1350}}
b[37940]={n="Assault on Ironhold Harbor",r={cu={{n="Oil",ct=600},{n="Apexis Crystal",ct=2000}},mo=509400,xp=1350,rep={{n="Vol'jin's Headhunters",v=500}}}}
b[37968]={n="Assault on the Temple of Sha'naar",r={cu={{n="Oil",ct=600},{n="Apexis Crystal",ct=2000}},mo=509400,xp=1350,rep={{n="Hand of the Prophet",v=500}}}}
b[37973]={n="Treasure Contract: The Artificer",r={mo=42450,xp=1350}}
b[37976]={n="Dream of Argus: The First Fragment",r={mo=42450,xp=1350}}
b[37977]={n="Dream of Argus: The Second Fragment",r={mo=42450,xp=1350}}
b[37978]={n="Dream of Argus: The Final Fragment",r={mo=42450,xp=1350}}
b[37979]={n="Dream of Argus: The Crystal Reborn",r={mo=1653920,xp=1350}}
b[38044]={n="Bleeding the Bleeding Hollow",r={cu={{n="Oil",ct=600},{n="Apexis Crystal",ct=2000}},mo=509400,xp=1350,rep={{n="Vol'jin's Headhunters",v=500}}}}
b[38046]={n="Battle At The Iron Front",r={cu={{n="Oil",ct=600},{n="Apexis Crystal",ct=2000}},mo=509400,xp=1350,rep={{n="Hand of the Prophet",v=500}}}}
b[38175]={n="Scrap Meltdown",r={xp=5450}}
b[38243]={n="A Bit of Ore",r={i={{n="Primal Spirit"}}}}
b[38250]={n="Assault on the Ruins of Kra'nak",r={cu={{n="Oil",ct=600},{n="Apexis Crystal",ct=2000}},mo=509400,xp=1350,rep={{n="Hand of the Prophet",v=500}}}}
b[38287]={n="Raw Beast Hides",r={i={{n="Primal Spirit"}}}}
b[38293]={n="Sumptuous Fur",r={i={{n="Primal Spirit"}}}}
b[38296]={n="Herbs Galore",r={i={{n="Primal Spirit"}}}}
b[38399]={n="Fencing the Rose",r={i={{n="Bag of Gold"}},rep={{n="Booty Bay",v=75}}}}
b[38440]={n="Assault on The Fel Forge",r={cu={{n="Oil",ct=600},{n="Apexis Crystal",ct=2000}},mo=509400,xp=1350,rep={{n="Hand of the Prophet",v=500}}}}
b[38586]={n="Assault on the Throne of Kil'jaeden",r={cu={{n="Oil",ct=750},{n="Apexis Crystal",ct=2500}},mo=509400,xp=1350,rep={{n="Vol'jin's Headhunters",v=500}}}}
b[39433]={n="Unseen Influence",r={cu={{n="Apexis Crystal",ct=1500}},mo=169800,xp=1350,rep={{n="Order of the Awakened",v=1500}}}}
b[39509]={n="Bloodied Blades of Zeth'Gol",r={cu={{n="Apexis Crystal",ct=500}},mo=169800,xp=1350,rep={{n="Vol'jin's Headhunters",v=250}}}}
b[39510]={n="A Little Wetwork",r={cu={{n="Apexis Crystal",ct=500}},mo=169800,xp=1350,rep={{n="Vol'jin's Headhunters",v=250}}}}
b[39511]={n="Blood of Fallen Brothers",r={cu={{n="Apexis Crystal",ct=500}},mo=169800,xp=1350,rep={{n="Vol'jin's Headhunters",v=250}}}}
b[39512]={n="Secrets of the Shadow Council",r={cu={{n="Apexis Crystal",ct=500}},mo=169800,xp=1350,rep={{n="Vol'jin's Headhunters",v=250}}}}
b[39513]={n="Disarming Sha'naar",r={cu={{n="Apexis Crystal",ct=500}},mo=169800,xp=1350,rep={{n="Vol'jin's Headhunters",v=250}}}}
b[39519]={n="Demonslayer of Tanaan",r={cu={{n="Garrison Resources",ct=100}},mo=169800,xp=1350,rep={{n="Vol'jin's Headhunters",v=250}}}}
b[39526]={n="Pressing the Attack",r={cu={{n="Apexis Crystal",ct=1000},{n="Garrison Resources",ct=150}},mo=169800,xp=1350,rep={{n="Vol'jin's Headhunters",v=250}}}}
b[39529]={n="Tooth and Claw",r={i={{n="Blackfang Claw"}},mo=169800,xp=1350,rep={{n="The Saberstalkers",v=1500}}}}
b[39532]={n="Bringing Down the Iron Horde",r={cu={{n="Garrison Resources",ct=100}},mo=169800,xp=1350,rep={{n="Vol'jin's Headhunters",v=250}}}}
b[39569]={n="Breaking Their Fel Bonds",r={cu={{n="Apexis Crystal",ct=500}},mo=169800,xp=1350,rep={{n="Hand of the Prophet",v=250}}}}
b[39573]={n="Harnessing Their Power",r={cu={{n="Apexis Crystal",ct=500}},mo=169800,xp=1350,rep={{n="Hand of the Prophet",v=250}}}}
b[39648]={n="Where Are the Children?",r={i={{n="Merry Supplies"}},mo=280900,xp=2400}}
b[39649]={n="Menacing Grumplings",r={i={{n="Savage Snowball"},{n="Merry Supplies"}},mo=280900,xp=2400}}
b[39651]={n="Grumpus",r={i={{n="Merry Supplies"}},mo=280900,xp=2400}}
b[39668]={n="What Horrible Presents!",r={i={{n="Merry Supplies"}},mo=280900,xp=2400}}
b[39716]={n="Smashing Squashlings",r={i={{n="Spooky Supplies"}},mo=280900,xp=2400}}
b[39719]={n="Mutiny on the Boneship",r={i={{n="Spooky Supplies"}},mo=280900,xp=2400}}
b[39720]={n="Foul Fertilizer",r={i={{n="Spooky Supplies"}},mo=280900,xp=2400}}
b[39721]={n="Culling the Crew",r={i={{n="Spooky Supplies"}},mo=280900,xp=2400}}
b[46049]={n="A Gift From Your Tadpole",r={i={{n="Tadpole Gift"}}}}
b[47895]={n="Bert's Bots",r={i={{n="Leprous Sack of Pet Supplies"}},mo=280900,xp=9500}}
b[50791]={n="Skree...",r={mo=234000,xp=6800}}
b[50796]={n="SKREEEEE!",r={mo=234000,xp=6800}}
b[50798]={n="Out on a Limb",r={mo=234000,xp=6800}}
b[50801]={n="A Nose for Ptrouble",r={mo=234000,xp=6800}}
b[50842]={n="Mast Effect",r={mo=234000,xp=6800}}
b[50930]={n="Falling With Style",r={mo=234000,xp=6800}}
b[51146]={n="Kua'fon's Day Off",r={mo=234000,xp=6800}}
b[52317]={n="No Ptake, Only Throw",r={mo=234000,xp=6800}}
b[54082]={n="More Power",r={i={{n="Energy Cell"}},mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[54090]={n="Toys For Destruction",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=150}}}}
b[55213]={n="Energy Cells for Everyone",r={mo=257400,xp=8150}}
b[55244]={n="Away From the Herd",r={mo=234000,xp=6800}}
b[55245]={n="Eat Like a Direhorn",r={mo=234000,xp=6800}}
b[55246]={n="Even Greener Pastures",r={mo=234000,xp=6800}}
b[55248]={n="Greener Pastures",r={mo=234000,xp=6800}}
b[55250]={n="A Growing Appetite",r={mo=234000,xp=6800}}
b[55251]={n="A Daughter of Torcali",r={mo=234000,xp=6800}}
b[55299]={n="Bottom Feeding Stinkfish",r={mo=257400,rep={{n="Rustbolt Resistance",v=25}}}}
b[55305]={n="Bolted Steelhead",r={mo=257400,rep={{n="Rustbolt Resistance",v=25}}}}
b[55306]={n="Pond Hopping Springfish",r={mo=257400,rep={{n="Rustbolt Resistance",v=25}}}}
b[55307]={n="Shadowy Cave Eel",r={mo=257400,rep={{n="Rustbolt Resistance",v=25}}}}
b[55308]={n="Mechanical Blowfish",r={mo=257400,rep={{n="Rustbolt Resistance",v=25}}}}
b[55309]={n="Spitting Clownfish",r={mo=257400,rep={{n="Rustbolt Resistance",v=25}}}}
b[55310]={n="Sludge-fouled Carp",r={mo=257400,rep={{n="Rustbolt Resistance",v=25}}}}
b[55311]={n="Energized Lightning Cod",r={mo=257400,rep={{n="Rustbolt Resistance",v=25}}}}
b[55312]={n="Solarsprocket Barbel",r={mo=257400,rep={{n="Rustbolt Resistance",v=25}}}}
b[55313]={n="Tasty Steelfin",r={mo=257400,rep={{n="Rustbolt Resistance",v=25}}}}
b[55378]={n="Rustbolt Requisitions: Shimmerscale",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[55379]={n="Rustbolt Requisitions: Star Moss",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[55380]={n="Rustbolt Requisitions: Storm Silver Ore",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[55381]={n="Rustbolt Requisitions: Storm Silver Ore",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[55382]={n="Rustbolt Requisitions: Shimmerscale",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[55383]={n="Rustbolt Requisitions: Star Moss",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[55463]={n="Aid From Nordrassil",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[55528]={n="Playtime's Over",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[55575]={n="One Gnome's Trash",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=150}}}}
b[55658]={n="Clues Abound",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=45}}}}
b[55672]={n="A Historical Mess",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=150}}}}
b[55688]={n="A Growing Mystery",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=150}}}}
b[55695]={n="That New Mount Smell",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[55717]={n="Time for Heroics",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=150}}}}
b[55718]={n="Strange Discovery",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=45}}}}
b[55742]={n="Bundle of Corroded Parts",r={mo=257400,xp=8150}}
b[55743]={n="More Recycling",r={mo=257400,rep={{n="Rustbolt Resistance",v=150}}}}
b[55765]={n="Bugs, Lots of 'Em!",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=150}}}}
b[55813]={n="Aim High",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[55816]={n="The Other Place",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=150}}}}
b[55880]={n="Redistribution of Power",r={i={{n="Energy Cell"}},mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[55885]={n="Rico's Rescue",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[55905]={n="Abduction Reduction",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=150}}}}
b[55994]={n="Do Not Drink",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56042]={n="Blingtron 7000",r={i={{n="Blingtron 7000 Gift Package"}}}}
b[56049]={n="Deck 'Em",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=45}}}}
b[56053]={n="The Final Act",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56082]={n="Bot Rampage",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56083]={n="Unsafe Work Conditions",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56142]={n="Adapt, Improve, Overcome!",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=150}}}}
b[56184]={n="Pirates, Sea Monsters, Robots",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=150}}}}
b[56301]={n="Go For The Gold",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56306]={n="The Family Jewels",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56326]={n="Ravenous Rescue",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56327]={n="Chopped Bots",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56334]={n="Bots Gone Wild",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56341]={n="Direbrew Cog",r={i={{n="Brewfest Prize Token"}},mo=280900,xp=9500}}
b[56355]={n="Battle Tested",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56361]={n="Rustbolt Requisitions: Tidespray Linen",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56362]={n="Rustbolt Requisitions: Tidespray Linen",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56363]={n="Rustbolt Requisitions: Frenzied Fangtooth",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56364]={n="Rustbolt Requisitions: Frenzied Fangtooth",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56365]={n="Be Kind, Rewind",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56372]={n="Hozen Totem",r={i={{n="Brewfest Prize Token"}},mo=280900,xp=9500}}
b[56373]={n="A Gulper Ate The Rolly",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56380]={n="Grounded",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56405]={n="Cogfrenzy's Construction Frenzy",r={i={{n="Cogfrenzy's Construction Toolkit"}},mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=150}}}}
b[56410]={n="Discs of Norgannon",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=150}}}}
b[56434]={n="WANTED: Junkbrat and Roadtrogg",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56469]={n="Pirates? I Hate Those Guys!",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=45}}}}
b[56471]={n="Unprofitable Ventures",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=150}}}}
b[56493]={n="A Direct Approach",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56501]={n="Taking The Air Out",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56508]={n="Waste Not",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56523]={n="My Chickens are Not for Eating!",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=150}}}}
b[56532]={n="Nuke 'Em Norbit",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56552]={n="Off-the-Books Brawlin'",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=150}}}}
b[56557]={n="A Little Side Action",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56558]={n="Off-the-Books Brawlin'",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=150}}}}
b[56559]={n="A Little Side Action",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56572]={n="Toys Like Us",r={i={{n="Azeroth Mini: Starter Pack"}},mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=150}}}}
b[56573]={n="Certified Pre-Owned",r={i={{n="Energy Cell"}},mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56621]={n="Real Ultimate Power",r={i={{n="Energy Cell"}},mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56715]={n="Hozen Totem",r={i={{n="Brewfest Prize Token"}},mo=280900,xp=9500}}
b[56716]={n="Direbrew Cog",r={i={{n="Brewfest Prize Token"}},mo=280900,xp=9500}}
b[56746]={n="Our Direct Line",r={i={{n="Blueprint: Encrypted Black Market Radio"}},mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=25}}}}
b[56747]={n="Rustbolt Requisitions: Akunda's Bite",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56749]={n="Rustbolt Requisitions: Akunda's Bite",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56750]={n="Rustbolt Requisitions: Calcified Bone",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56751]={n="Rustbolt Requisitions: Calcified Bone",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56752]={n="Rustbolt Requisitions: Deep Sea Satin",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56753]={n="Rustbolt Requisitions: Deep Sea Satin",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56754]={n="Rustbolt Requisitions: Monelite Ore",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56755]={n="Rustbolt Requisitions: Monelite Ore",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56757]={n="Rustbolt Requisitions: Winter's Kiss",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56758]={n="Rustbolt Requisitions: Winter's Kiss",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56759]={n="Rustbolt Requisitions: Tempest Hide",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56760]={n="Rustbolt Requisitions: Tempest Hide",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56761]={n="Rustbolt Requisitions: Lane Snapper",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56762]={n="Rustbolt Requisitions: Great Sea Catfish",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56763]={n="Rustbolt Requisitions: Great Sea Catfish",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[56765]={n="Rustbolt Requisitions: Lane Snapper",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=75}}}}
b[57278]={n="Bring Me Their Heads",r={mo=245700,xp=7500}}
b[57326]={n="Prototypes for Profit",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=200}}}}
b[57327]={n="Prototypes for Inspiration",r={mo=257400,xp=8150,rep={{n="Rustbolt Resistance",v=200}}}}
b[57964]={n="Revenge Is Easy",r={cu={{n="Grateful Offering",ct=3}},mo=257400,xp=8150}}
b[58151]={n="Minions of N'Zoth",r={mo=234000,xp=6800}}
b[58155]={n="A Hand in the Dark",r={mo=234000,xp=6800}}
b[58156]={n="Vanquishing the Darkness",r={mo=234000,xp=6800}}
b[58167]={n="Preventative Measures",r={mo=234000,xp=6800}}
b[58168]={n="A Dark, Glaring Reality",r={mo=234000,xp=6800}}
b[58211]={n="Pumped Up",r={cu={{n="Grateful Offering",ct=3}},mo=257400}}
b[58260]={n="Queens And Future Kings",r={cu={{n="Grateful Offering",ct=3}},mo=257400,xp=8150}}
b[58454]={n="Spoiling For A Fight",r={mo=25740,xp=1000}}
b[58801]={n="Enter the Void",r={cu={{n="Corrupted Mementos",ct=66},{n="Conquest",ct=5000}},mo=468000,xp=8500}}
b[58805]={n="Continued Incubation",r={mo=234000,xp=6800}}
b[58831]={n="Honing Instincts",r={mo=23400,xp=850}}
b[58858]={n="More Fetid Filets",}
b[58879]={n="Alpaca It Up",r={xp=1700}}
b[58904]={n="Shards of Corruption",r={mo=234000,xp=6800}}
b[59772]={n="Research Ruination",r={cu={{n="Argent Commendation",ct=3}},mo=257400,xp=8150,rep={{n="Argent Crusade",v=75}}}}
b[59782]={n="The Deathspeaker's Devout",r={cu={{n="Argent Commendation",ct=3}},mo=257400,xp=8150,rep={{n="Argent Crusade",v=75}}}}
b[59783]={n="Cultist Captors",r={cu={{n="Argent Commendation",ct=3}},mo=257400,xp=8150,rep={{n="Argent Crusade",v=75}}}}
b[59828]={n="Bet On Yourself",r={mo=386100,xp=12250,rep={{n="The Undying Army",v=135}}}}
b[59838]={n="Scourge War Machines",r={cu={{n="Argent Commendation",ct=3}},mo=257400,xp=8150,rep={{n="Argent Crusade",v=75}}}}
b[59839]={n="WARNING: This is Only a Test!",r={cu={{n="Argent Commendation",ct=3}},mo=257400,xp=8150,rep={{n="Argent Crusade",v=75}}}}
b[59847]={n="Defending the Rampart",r={cu={{n="Argent Commendation",ct=3}},mo=257400,xp=8150,rep={{n="Argent Crusade",v=75}}}}
b[59851]={n="Frozen Solid",r={cu={{n="Argent Commendation",ct=3}},mo=257400,xp=8150,rep={{n="Argent Crusade",v=75}}}}
b[59863]={n="Combat Nullifier 07-X",r={cu={{n="Argent Commendation",ct=3}},mo=257400,xp=8150,rep={{n="Argent Crusade",v=75}}}}
b[59878]={n="Too Many Whelps",r={cu={{n="Argent Commendation",ct=3}},mo=257400,xp=8150,rep={{n="Argent Crusade",v=75}}}}
b[60153]={n="Into the Unknown",r={mo=257400,xp=8150}}
b[60175]={n="A Taste of Tirna Noch",r={mo=257400,xp=8150}}
b[60482]={n="See With My Eyes",r={cu={{n="Grateful Offering",ct=3}},mo=257400,xp=8150}}
b[60505]={n="Spider's Lair",r={cu={{n="Grateful Offering",ct=3}},mo=257400}}
b[60732]={n="Disrupting the Flow",r={rep={{n="Ve'nari",v=75}}}}
b[60841]={n="Evacuation Effort",r={cu={{n="Argent Commendation",ct=3}},mo=257400,xp=8150,rep={{n="Argent Crusade",v=75}}}}
b[61146]={n="Manifesting Power",r={cu={{n="Grateful Offering",ct=3}}}}
b[61156]={n="Where There's a Quill...",r={cu={{n="Grateful Offering",ct=3}}}}
b[61157]={n="Straight to the Point",r={cu={{n="Grateful Offering",ct=3}}}}
b[61159]={n="Signs of Demise",r={cu={{n="Grateful Offering",ct=3}}}}
b[61166]={n="Reduce, Reuse, Recycle",r={cu={{n="Grateful Offering",ct=3}}}}
b[61182]={n="Pollen Your Weight",r={cu={{n="Grateful Offering",ct=3}}}}
b[61193]={n="A Light Touch",r={cu={{n="Grateful Offering",ct=3}}}}
b[61196]={n="The Secret Ingredient",r={cu={{n="Grateful Offering",ct=3}}}}
b[61199]={n="Arms Day",r={cu={{n="Grateful Offering",ct=3}}}}
b[61209]={n="A Somber Melody",r={cu={{n="Grateful Offering",ct=3}}}}
b[61875]={n="Doing the Dew",r={cu={{n="Grateful Offering",ct=3}},mo=257400,rep={{n="Court of Night",v=750}}}}
b[61950]={n="Hunting the Wilds",r={cu={{n="Grateful Offering",ct=3}},mo=257400,rep={{n="Court of Night",v=750}}}}
b[61968]={n="Just Wing It",r={cu={{n="Grateful Offering",ct=3}},mo=257400,rep={{n="Court of Night",v=750}}}}
b[61985]={n="Wake The Sleepers",r={cu={{n="Grateful Offering",ct=3}},mo=257400,rep={{n="Court of Night",v=750}}}}
b[62057]={n="Those Who Hunger",r={cu={{n="Grateful Offering",ct=3}},mo=257400,rep={{n="Court of Night",v=750}}}}
b[62081]={n="Return Those Animacones!",r={cu={{n="Grateful Offering",ct=3}},mo=257400,rep={{n="Court of Night",v=750}}}}
b[62155]={n="Runestone Roundup",r={cu={{n="Grateful Offering",ct=3}},mo=257400,rep={{n="Court of Night",v=750}}}}
b[62160]={n="A Bundle of Lilies",r={cu={{n="Grateful Offering",ct=3}},mo=257400,rep={{n="Court of Night",v=750}}}}
b[62188]={n="Catch A Star",r={cu={{n="Grateful Offering",ct=3}},mo=257400,rep={{n="Court of Night",v=750}}}}
b[62224]={n="A Thread Of Hope",r={cu={{n="Grateful Offering",ct=3}},mo=257400,rep={{n="Court of Night",v=750}}}}
b[62239]={n="Rodent Removal",r={rep={{n="Ve'nari",v=75}}}}
b[62262]={n="Fungal Feeding",r={cu={{n="Argent Commendation",ct=3}},mo=257400,xp=8150,rep={{n="Argent Crusade",v=75}}}}
b[62295]={n="Cleaning Out the Vault",r={cu={{n="Argent Commendation",ct=3}},mo=257400,xp=8150,rep={{n="Argent Crusade",v=75}}}}
b[62296]={n="Into the Unknown",r={mo=257400,xp=8150}}
b[62362]={n="Volatile Reactions",r={cu={{n="Grateful Offering",ct=3}},mo=257400}}
b[62363]={n="Heavy Lifting",r={cu={{n="Grateful Offering",ct=3}},mo=257400}}
b[62364]={n="Dire Learning",r={cu={{n="Grateful Offering",ct=3}},mo=257400}}
b[62365]={n="Careful Creations",r={cu={{n="Argent Commendation",ct=3}},mo=257400,xp=8150,rep={{n="Argent Crusade",v=75}}}}
b[62382]={n="Into the Unknown",r={mo=257400,xp=8150}}
b[62390]={n="Body Count",r={cu={{n="Grateful Offering",ct=3}},mo=257400}}
b[62401]={n="Strange Scourgestones",r={cu={{n="Argent Commendation",ct=5}},mo=257400,xp=8150,rep={{n="Argent Crusade",v=75}}}}
b[62403]={n="Boared to Death",r={cu={{n="Grateful Offering",ct=3}},mo=257400}}
b[62453]={n="Into the Unknown",r={mo=257400,xp=8150}}
b[62465]={n="Go Beyond!",r={mo=257400,xp=8150}}
b[62473]={n="What's Old is New",r={cu={{n="Argent Commendation",ct=3}},mo=257400,xp=8150,rep={{n="Argent Crusade",v=75}}}}
b[62484]={n="Werk In Progress",r={cu={{n="Argent Commendation",ct=3}},mo=257400,xp=8150,rep={{n="Argent Crusade",v=75}}}}
b[62553]={n="Delaying Their Efforts",r={cu={{n="Argent Commendation",ct=3}},mo=257400,xp=8150,rep={{n="Argent Crusade",v=75}}}}
b[62563]={n="Back Again!",r={cu={{n="Grateful Offering",ct=3}},mo=257400,xp=8150}}
b[62584]={n="Frontline Resupply",r={cu={{n="Argent Commendation",ct=3}},mo=257400,xp=8150,rep={{n="Argent Crusade",v=75}}}}
b[62606]={n="A Blackthorn Blend",r={mo=257400,xp=8150}}
b[62608]={n="A Royal Treat",r={mo=257400,xp=8150}}
b[62610]={n="Hyphae Patrol: The Stalks",r={mo=257400,xp=8150}}
b[62611]={n="Hyphae Patrol: Heartwood Grove",r={mo=257400,xp=8150}}
b[62614]={n="Hyphae Patrol: Eventide Grove",r={mo=257400,xp=8150}}
b[62615]={n="Hyphae Patrol: Gossamer Cliffs",r={mo=257400,xp=8150}}
b[63031]={n="Acquisition: Crystallized Stygia",r={rep={{n="Ve'nari",v=75}}}}
b[63039]={n="A Monument to Vengeance",r={rep={{n="Ve'nari",v=75}}}}
b[63043]={n="Sundered Souls",r={rep={{n="Ve'nari",v=75}}}}
b[63047]={n="Acquisition: Runeforged Shackles",r={rep={{n="Ve'nari",v=75}}}}
b[63050]={n="Acquisition: Blazing Ingots",r={rep={{n="Ve'nari",v=75}}}}
b[63062]={n="Torment for the Taking",r={rep={{n="Ve'nari",v=75}}}}
b[63069]={n="What They Know",r={rep={{n="Ve'nari",v=75}}}}
b[63072]={n="Acquisition: Stygic Ore",r={rep={{n="Ve'nari",v=75}}}}
b[63100]={n="Misery's Company",r={rep={{n="Ve'nari",v=75}}}}
b[63166]={n="A Shadowed Fate",r={rep={{n="Ve'nari",v=75}}}}
b[63179]={n="Drowned and Torn Asunder",r={rep={{n="Ve'nari",v=75}}}}
b[63775]={n="Cryptograms and Keys",r={rep={{n="Death's Advance",v=125}}}}
b[63778]={n="We Move Forward",r={rep={{n="Death's Advance",v=125}}}}
b[63779]={n="A Semblance of Normalcy",r={rep={{n="Death's Advance",v=125}}}}
b[63780]={n="See How THEY Like It!",r={rep={{n="Death's Advance",v=125}}}}
b[63781]={n="Mawsworn Battle Plans",r={rep={{n="Death's Advance",v=125}}}}
b[63782]={n="Mawsworn Rituals",r={rep={{n="Death's Advance",v=125}}}}
b[63783]={n="Anima Reclamation",r={rep={{n="Death's Advance",v=125}}}}
b[63784]={n="Gold's No Object",r={rep={{n="Death's Advance",v=125}}}}
b[63785]={n="Continued Efforts: Seeker's Quorum",r={rep={{n="Death's Advance",v=125}}}}
b[63786]={n="Sweep the Windswept Aerie",r={rep={{n="Death's Advance",v=125}}}}
b[63787]={n="Continued Efforts: Mauler's Outlook",r={rep={{n="Death's Advance",v=125}}}}
b[63788]={n="Continued Efforts: Sanctuary of Guidance",r={rep={{n="Death's Advance",v=125}}}}
b[63789]={n="Continued Efforts: Scholar's Den",r={rep={{n="Death's Advance",v=125}}}}
b[63790]={n="Broker's Bounty: Lord Azzorak",r={rep={{n="Death's Advance",v=200}}}}
b[63791]={n="Broker's Bounty: Valdinar the Curseborn",r={rep={{n="Death's Advance",v=200}}}}
b[63792]={n="Broker's Bounty: Nocturnus the Unraveler",r={rep={{n="Death's Advance",v=200}}}}
b[63793]={n="Broker's Bounty: Ensydius the Defiler",r={rep={{n="Death's Advance",v=200}}}}
b[63794]={n="Broker's Bounty: Hungering Behemoth",r={rep={{n="Death's Advance",v=200}}}}
b[63934]={n="Assail Mail",r={rep={{n="Death's Advance",v=125}}}}
b[63935]={n="Precious Roots",r={rep={{n="Death's Advance",v=125}}}}
b[63936]={n="Devoured Anima",r={rep={{n="Death's Advance",v=125}}}}
b[63937]={n="Nasty, Big, Pointy Teeth",r={rep={{n="Death's Advance",v=125}}}}
b[63950]={n="Razorwing Talons",r={rep={{n="Death's Advance",v=125}}}}
b[63955]={n="Sealed Secrets",r={rep={{n="Death's Advance",v=125}}}}
b[63959]={n="Observational Records",r={rep={{n="Death's Advance",v=125}}}}
b[63963]={n="Broker's Bounty: Ripmaul",r={rep={{n="Death's Advance",v=200}}}}
b[63964]={n="Broker's Bounty: Grimtalon",r={rep={{n="Death's Advance",v=200}}}}
b[63965]={n="Razorwing Egg Rescue",r={rep={{n="Death's Advance",v=125}}}}
b[63989]={n="Oozing with Character",r={rep={{n="Death's Advance",v=125}}}}
b[64015]={n="Into the Meat Grinder",r={rep={{n="Death's Advance",v=125}}}}
b[64018]={n="The Weight of Stone",r={rep={{n="Death's Advance",v=125}}}}
b[64040]={n="Once More, with Healing",r={rep={{n="Death's Advance",v=125}}}}
b[64043]={n="We Need a Healer - You!",r={rep={{n="Death's Advance",v=125}}}}
b[64065]={n="Local Reagents",r={rep={{n="Death's Advance",v=125}}}}
b[64070]={n="Staying Scrappy",r={rep={{n="Death's Advance",v=125}}}}
b[64080]={n="Down to Earth",r={rep={{n="Death's Advance",v=125}}}}
b[64089]={n="Teas and Tinctures",r={rep={{n="Death's Advance",v=125}}}}
b[64101]={n="The Proper Procedures",r={rep={{n="Death's Advance",v=125}}}}
b[64103]={n="Old Tricks Work Best",r={rep={{n="Death's Advance",v=125}}}}
b[64104]={n="Think of the Critters",r={rep={{n="Death's Advance",v=125}}}}
b[64129]={n="Charge of the Wild Hunt",r={rep={{n="Death's Advance",v=125}}}}
b[64166]={n="Random Memory Access",r={rep={{n="Death's Advance",v=125}}}}
b[64194]={n="War Prototype",r={rep={{n="Death's Advance",v=125}}}}
b[64240]={n="Flight of the Kyrian",r={rep={{n="Death's Advance",v=125}}}}
b[64271]={n="A More Civilized Way",r={rep={{n="Death's Advance",v=125}}}}
b[64282]={n="Full of Surprises",r={mo=772200,xp=12250}}
b[64430]={n="Spill the Tea",r={rep={{n="Death's Advance",v=125}}}}
b[64432]={n="Strength to Weakness",r={rep={{n="Death's Advance",v=125}}}}
b[64592]={n="Historic Protection",r={xp=8150}}
b[64783]={n="Dance Dance Darkmoon",r={i={{n="Darkmoon Game Prize",ic=134143}},rep={{n="Darkmoon Faire",v=250}}}}
b[64850]={n="Traversing Torghast",r={mo=772200,xp=12250}}
b[64852]={n="Aeon Matrix",r={mo=257400,xp=8150}}
b[64854]={n="Trappings of Success",r={xp=8150}}
b[64860]={n="Aetheric Lattice",r={mo=257400,xp=8150}}
b[64964]={n="Choose Your Fighter",r={xp=8150}}
b[64977]={n="Step Into the Ring",}
b[65072]={n="Not Safe for Work",r={xp=8150}}
b[65096]={n="Your Death Or Mine",r={xp=8150}}
b[65142]={n="Portal Play",r={xp=8150}}
b[65177]={n="Fruit of the Bloom",}
b[65226]={n="Fleet-Footed and Fastidious",r={xp=8150}}
b[65256]={n="Cluck, Cluck, Boom",}
b[65264]={n="Operation: Relocation",}
b[65265]={n="Buried Remnants",r={xp=8150}}
b[65268]={n="Bzzzzt!",r={xp=8150}}
b[65269]={n="Obvious Plant",}
b[65325]={n="Motes of Knowledge",r={xp=8150}}
b[65326]={n="Circle of Strife",r={xp=8150}}
b[65362]={n="Not of the Body",r={xp=8150}}
b[65363]={n="Dangerous State",r={xp=8150}}
b[65364]={n="Super Jiro",r={xp=8150}}
b[65445]={n="Necessary Resourcing",r={xp=8150}}
b[65784]={n="The Otter Side",r={cu={{n="Dragon Isles Supplies",ct=25}},xp=9500,rep={{n="Maruuk Centaur",v=150}}}}
b[65789]={n="Where Rivers Sleep",r={cu={{n="Dragon Isles Supplies",ct=25}},xp=9500,rep={{n="Maruuk Centaur",v=150}}}}
b[65792]={n="Teeth for a Tooth",r={cu={{n="Dragon Isles Supplies",ct=25}},xp=9500,rep={{n="Maruuk Centaur",v=150}}}}
b[65796]={n="The Best Defense...",r={cu={{n="Dragon Isles Supplies",ct=35}},xp=11900,rep={{n="Maruuk Centaur",v=300}}}}
b[65798]={n="An Opportunistic Approach",r={cu={{n="Dragon Isles Supplies",ct=25}},xp=9500,rep={{n="Maruuk Centaur",v=150}}}}
b[66241]={n="Thaldraszus Rally",}
b[66698]={n="Counting Argali",r={cu={{n="Dragon Isles Supplies",ct=25}},xp=9500,rep={{n="Maruuk Centaur",v=150}}}}
b[66711]={n="Delicacy in the Dark",r={cu={{n="Dragon Isles Supplies",ct=25}},xp=9500,rep={{n="Maruuk Centaur",v=150}}}}
b[66835]={n="Sundapple Copse Circuit",}
b[66836]={n="Sundapple Copse Circuit - Advanced",}
b[66877]={n="Fen Flythrough",}
b[66878]={n="Fen Flythrough - Advanced",}
b[66880]={n="Ravine River Run",}
b[66881]={n="Ravine River Run - Advanced",}
b[66882]={n="Lost Battlepack",r={xp=4750,rep={{n="Wrathion",v=250}}}}
b[66885]={n="Emerald Gardens Ascent",}
b[66886]={n="Emerald Gardens Ascent - Advanced",}
b[66921]={n="Maruukai Dash",}
b[66933]={n="Mirror of Sky Dash",}
b[66946]={n="Azure Span Sprint",}
b[66947]={n="Azure Span Sprint - Advanced",}
b[67004]={n="Good Things in Large Boxes",r={mo=842700,xp=14300,rep={{n="Sabellian",v=150},{n="Wrathion",v=150}}}}
b[67031]={n="Vakthros Ascent",}
b[67032]={n="Vakthros Ascent - Advanced",}
b[67034]={n="Of Wind and Water",r={cu={{n="Dragon Isles Supplies",ct=25}},xp=9500,rep={{n="Maruuk Centaur",v=150}}}}
b[67039]={n="An Amazing Journey",r={cu={{n="Dragon Isles Supplies",ct=25}},xp=9500,rep={{n="Maruuk Centaur",v=150}}}}
b[67095]={n="Flowing Forest Flight",}
b[67096]={n="Flowing Forest Flight - Advanced",}
b[67222]={n="Darkened Clouds",r={cu={{n="Dragon Isles Supplies",ct=25}},xp=9500,rep={{n="Maruuk Centaur",v=150}}}}
b[67296]={n="Iskaara Tour",}
b[67297]={n="Iskaara Tour - Advanced",}
b[67565]={n="Frostland Flyover",}
b[67566]={n="Frostland Flyover - Advanced",}
b[67605]={n="Thundering Plains",r={cu={{n="Dragon Isles Supplies",ct=35}},xp=11900,rep={{n="Maruuk Centaur",v=300}}}}
b[67741]={n="Archive Ambit",}
b[67742]={n="Archive Ambit - Advanced",}
b[69925]={n="Calming the Storms",r={i={{n="Primeval Essence"}},mo=280900,xp=9500}}
b[69937]={n="Sylvan Succor",r={mo=280900,xp=9500}}
b[69957]={n="Tyrhold Trial",}
b[69958]={n="Tyrhold Trial - Advanced",}
b[70049]={n="Calming the Storms",r={i={{n="Primeval Essence"}},mo=280900,xp=9500}}
b[70051]={n="Cliffside Circuit",}
b[70052]={n="Cliffside Circuit - Advanced",}
b[70059]={n="Academy Ascent",}
b[70060]={n="Academy Ascent - Advanced",}
b[70157]={n="Garden Gallivant",}
b[70158]={n="Garden Gallivant - Advanced",}
b[70161]={n="Caverns Criss-Cross",}
b[70163]={n="Caverns Criss-Cross - Advanced",}
b[70210]={n="Tradition Not Forgotten",r={cu={{n="Dragon Isles Supplies",ct=25}},xp=9500,rep={{n="Maruuk Centaur",v=150}}}}
b[70279]={n="Blood of Dragons",r={cu={{n="Dragon Isles Supplies",ct=35}},xp=11900,rep={{n="Maruuk Centaur",v=300}}}}
b[70299]={n="Draconic Defensive",r={cu={{n="Dragon Isles Supplies",ct=25}},xp=9500,rep={{n="Maruuk Centaur",v=150}}}}
b[70352]={n="Scaling Ever Higher",r={cu={{n="Dragon Isles Supplies",ct=25}},xp=9500,rep={{n="Maruuk Centaur",v=150}}}}
b[70438]={n="Flying Fish",r={mo=140450,xp=4750,rep={{n="Iskaara Tuskarr",v=150}}}}
b[70450]={n="Otter Devastation",r={i={{n="Ominous Conch"}},mo=28090,xp=1200,rep={{n="Iskaara Tuskarr",v=100}}}}
b[70526]={n="Ohn'ahran Plains Rally",}
b[70542]={n="Azure Span Rally",}
b[70701]={n="Bakar Dream of Lost Argali",r={cu={{n="Dragon Isles Supplies",ct=25}},xp=9500,rep={{n="Maruuk Centaur",v=150}}}}
b[70710]={n="River Rapids Route",}
b[70711]={n="River Rapids Route - Advanced",}
b[70848]={n="Forgotten Dragon Crest",r={xp=4750,rep={{n="Sabellian",v=200}}}}
b[70990]={n="If There's Wool There's a Way",r={cu={{n="Dragon Isles Supplies",ct=25}},xp=9500,rep={{n="Maruuk Centaur",v=150}}}}
b[71191]={n="Net Worth",r={i={{n="Ominous Conch"}},mo=28090,xp=1200,rep={{n="Iskaara Tuskarr",v=100}}}}
b[71192]={n="Predator Control",r={i={{n="Ominous Conch"}},mo=28090,xp=1200,rep={{n="Iskaara Tuskarr",v=100}}}}
b[71193]={n="Underwater Menace",r={i={{n="Ominous Conch"}},mo=28090,xp=1200,rep={{n="Iskaara Tuskarr",v=100}}}}
b[71194]={n="Frogs of Fire",r={i={{n="Ominous Conch"}},mo=28090,xp=1200,rep={{n="Iskaara Tuskarr",v=100}}}}
b[71241]={n="Duck, Duck, Trap",r={cu={{n="Dragon Isles Supplies",ct=25}},xp=9500,rep={{n="Maruuk Centaur",v=150}}}}
b[72069]={n="Subglacial Refill",r={mo=140450,xp=4750,rep={{n="Iskaara Tuskarr",v=150}}}}
b[72072]={n="Dragonsprings Drop",r={mo=140450,xp=4750,rep={{n="Iskaara Tuskarr",v=150}}}}
b[72074]={n="Highland Habitat",r={mo=140450,xp=4750,rep={{n="Iskaara Tuskarr",v=150}}}}
b[72075]={n="Hot Stock",r={mo=140450,xp=4750,rep={{n="Iskaara Tuskarr",v=150}}}}
b[72384]={n="Valdrakken Tour",}
b[72750]={n="Caverns Criss-Cross - Reverse",}
b[72754]={n="Academy Ascent - Reverse",}
b[72760]={n="Cliffside Circuit - Reverse",}
b[72769]={n="Garden Gallivant - Reverse",}
b[72792]={n="Tyrhold Trial - Reverse",}
b[72793]={n="Flowing Forest Flight - Reverse",}
b[72794]={n="Vakthros Ascent - Reverse",}
b[72795]={n="Frostland Flyover - Reverse",}
b[72796]={n="Azure Span Sprint - Reverse",}
b[72797]={n="Archive Ambit - Reverse",}
b[72799]={n="Azure Span Slalom - Reverse",}
b[72800]={n="Iskaara Tour - Reverse",}
b[72801]={n="Sundapple Copse Circuit - Reverse",}
b[72802]={n="Fen Flythrough - Reverse",}
b[72803]={n="Ravine River Run - Reverse",}
b[72805]={n="Emerald Gardens Ascent - Reverse",}
b[72806]={n="Pleasant Alpha",r={mo=280900,xp=9500}}
b[72807]={n="River Rapids Route - Reverse",}
b[73017]={n="Stormsunder Crater Circuit",}
b[73018]={n="Stormsunder Crater Circuit - Advanced",}
b[73019]={n="Stormsunder Crater Circuit - Reverse",}
b[73020]={n="Morqut Ascent",}
b[73023]={n="Morqut Ascent - Advanced",}
b[73024]={n="Morqut Ascent - Reverse",}
b[73025]={n="Aerie Chasm Cruise",}
b[73027]={n="Aerie Chasm Cruise - Advanced",}
b[73028]={n="Aerie Chasm Cruise - Reverse",}
b[73029]={n="Southern Reach Route",}
b[73030]={n="Southern Reach Route - Advanced",}
b[73032]={n="Southern Reach Route - Reverse",}
b[73033]={n="Caldera Coaster",}
b[73034]={n="Caldera Coaster - Advanced",}
b[73052]={n="Caldera Coaster - Reverse",}
b[73061]={n="Forbidden Reach Rush",}
b[73062]={n="Forbidden Reach Rush - Advanced",}
b[73065]={n="Forbidden Reach Rush - Reverse",}
b[73119]={n="A Wealth of Whelp Snacks",r={cu={{n="Flightstones",ct=5}},mo=140450,xp=4750}}
b[73120]={n="Appetizing Aftermath",r={cu={{n="Flightstones",ct=5}},mo=140450,xp=4750}}
b[73124]={n="Hoard Behavior",r={cu={{n="Flightstones",ct=5}},mo=140450,xp=4750}}
b[73126]={n="Arts and Crafts and Baths",r={cu={{n="Flightstones",ct=5}},mo=140450,xp=4750}}
b[73128]={n="Off the Page",r={cu={{n="Flightstones",ct=5}},mo=140450,xp=4750}}
b[73130]={n="Fowl Runic Scribblings",r={cu={{n="Flightstones",ct=5}},mo=140450,xp=4750}}
b[73131]={n="Dignified Disguises",r={cu={{n="Flightstones",ct=5}},mo=140450,xp=4750}}
b[73132]={n="Scanning the Stacks",r={cu={{n="Flightstones",ct=5}},mo=140450,xp=4750}}
b[73133]={n="Cozy Camouflage",r={cu={{n="Flightstones",ct=5}},mo=140450,xp=4750}}
b[73134]={n="Eternal Escapades",r={cu={{n="Flightstones",ct=5}},mo=140450,xp=4750}}
b[73135]={n="Obsidian Obfuscation",r={cu={{n="Flightstones",ct=5}},mo=140450,xp=4750}}
b[73192]={n="Feathered Fiend",}
b[73226]={n="Dragonskull Shoal",r={mo=140450,xp=4750,rep={{n="Iskaara Tuskarr",v=150}}}}
b[74117]={n="Rare Prey",r={cu={{n="Elemental Overflow",ct=450}},mo=280900,xp=9500,rep={{n="Maruuk Centaur",v=350},{n="Dark Talons",v=350},{n="Obsidian Warders",v=350}}}}
b[74118]={n="Spelunking the Den",r={cu={{n="Elemental Overflow",ct=450}},mo=280900,xp=9500,rep={{n="Dragonscale Expedition",v=350},{n="Dark Talons",v=350},{n="Obsidian Warders",v=350}}}}
b[74119]={n="Angler's Challenge",r={cu={{n="Elemental Overflow",ct=450}},mo=280900,xp=9500,rep={{n="Iskaara Tuskarr",v=350},{n="Dark Talons",v=350},{n="Obsidian Warders",v=350}}}}
b[74389]={n="Filming the Caldera",r={cu={{n="Elemental Overflow",ct=450}},mo=280900,xp=9500,rep={{n="Dragonscale Expedition",v=350},{n="Dark Talons",v=350},{n="Obsidian Warders",v=350}}}}
b[74390]={n="Brutal Prey",r={cu={{n="Elemental Overflow",ct=450}},mo=280900,xp=9500,rep={{n="Maruuk Centaur",v=350},{n="Dark Talons",v=350},{n="Obsidian Warders",v=350}}}}
b[74391]={n="Harpooner's Challenge",r={cu={{n="Elemental Overflow",ct=450}},mo=280900,xp=9500,rep={{n="Iskaara Tuskarr",v=350},{n="Dark Talons",v=350},{n="Obsidian Warders",v=350}}}}
b[74488]={n="Runaway Rusziona",r={cu={{n="Flightstones",ct=5}},mo=140450,xp=4750}}
b[74489]={n="Zhoomsa",r={cu={{n="Flightstones",ct=5}},mo=140450,xp=4750}}
b[74490]={n="Zaleth on the Go",r={cu={{n="Flightstones",ct=5}},mo=140450,xp=4750}}
b[74491]={n="Pole Position Posidriss",r={cu={{n="Flightstones",ct=5}},mo=140450,xp=4750}}
b[74492]={n="Blistering Belastrasza",r={cu={{n="Flightstones",ct=5}},mo=140450,xp=4750}}
b[74514]={n="The Slowest Fan Club",r={mo=280900,xp=9500,rep={{n="Glimmerogg Racer",v=100}}}}
b[74515]={n="Snail Mail",r={mo=280900,xp=9500,rep={{n="Glimmerogg Racer",v=100}}}}
b[74516]={n="A Snail's Pace",r={mo=280900,xp=9500,rep={{n="Glimmerogg Racer",v=100}}}}
b[74517]={n="All Terrain Snail",r={mo=280900,xp=9500,rep={{n="Glimmerogg Racer",v=100}}}}
b[74518]={n="Resistance Training",r={mo=280900,xp=9500,rep={{n="Glimmerogg Racer",v=100}}}}
b[74519]={n="Good for Goo",r={mo=280900,xp=9500,rep={{n="Glimmerogg Racer",v=100}}}}
b[74520]={n="Less Cargo",r={mo=280900,xp=9500,rep={{n="Glimmerogg Racer",v=100}}}}
b[74839]={n="Crystal Circuit",}
b[74842]={n="Crystal Circuit - Advanced",}
b[74882]={n="Crystal Circuit - Reverse",}
b[74889]={n="Caldera Cruise",}
b[74899]={n="Caldera Cruise - Advanced",}
b[74925]={n="Caldera Cruise - Reverse",}
b[74939]={n="Brimstone Scramble",}
b[74943]={n="Brimstone Scramble - Advanced",}
b[74944]={n="Brimstone Scramble - Reverse",}
b[74951]={n="Shimmering Slalom",}
b[74954]={n="Shimmering Slalom - Advanced",}
b[74956]={n="Shimmering Slalom - Reverse",}
b[74972]={n="Loamm Roamm",}
b[74975]={n="Loamm Roamm - Advanced",}
b[74977]={n="Loamm Roamm - Reverse",}
b[75035]={n="Sulfur Sprint",}
b[75042]={n="Sulfur Sprint - Advanced",}
b[75043]={n="Sulfur Sprint - Reverse",}
b[75237]={n="Reach West",r={cu={{n="Elemental Overflow",ct=450}},mo=280900,xp=9500,rep={{n="Valdrakken Accord",v=350},{n="Dark Talons",v=350},{n="Obsidian Warders",v=350}}}}
b[75261]={n="Reach Center",r={cu={{n="Elemental Overflow",ct=450}},mo=280900,xp=9500,rep={{n="Valdrakken Accord",v=350},{n="Dark Talons",v=350},{n="Obsidian Warders",v=350}}}}
b[75263]={n="Reach South",r={cu={{n="Elemental Overflow",ct=450}},mo=280900,xp=9500,rep={{n="Valdrakken Accord",v=350},{n="Dark Talons",v=350},{n="Obsidian Warders",v=350}}}}
b[75310]={n="Winter Wander",}
b[75311]={n="Winter Wander - Advanced",}
b[75312]={n="Winter Wander - Reverse",}
b[75317]={n="Nordrassil Spiral",}
b[75318]={n="Nordrassil Spiral - Advanced",}
b[75319]={n="Nordrassil Spiral - Reverse",}
b[75330]={n="Hyjal Hotfoot",}
b[75331]={n="Hyjal Hotfoot - Advanced",}
b[75332]={n="Hyjal Hotfoot - Reverse",}
b[75385]={n="Durotar Tour",}
b[75386]={n="Durotar Tour - Advanced",}
b[75387]={n="Durotar Tour - Reverse",}
b[75394]={n="Webwinder Weave",}
b[75395]={n="Webwinder Weave - Advanced",}
b[75396]={n="Webwinder Weave - Reverse",}
b[75466]={n="Lost Time-Lost Vikings",r={cu={{n="Soridormi's Recognition",ct=3000},{n="Paracausal Flakes",ct=70}},mo=280900,xp=9500}}
b[75657]={n="Time-Lost Trio",r={cu={{n="Soridormi's Recognition",ct=3000},{n="Paracausal Flakes",ct=70}},mo=561800,xp=11900}}
b[75784]={n="Garden Gallivant - Challenge",}
b[75793]={n="Sundapple Copse Circuit - Challenge",}
b[75794]={n="Sundapple Copse Circuit - Reverse Challenge",}
b[75795]={n="Fen Flythrough - Challenge",}
b[75796]={n="Fen Flythrough - Reverse Challenge",}
b[75797]={n="Ravine River Run - Challenge",}
b[75798]={n="Ravine River Run - Reverse Challenge",}
b[75799]={n="Emerald Garden Ascent - Challenge",}
b[75800]={n="Emerald Garden Ascent - Reverse Challenge",}
b[75801]={n="Maruukai Dash - Challenge",}
b[75802]={n="Mirror of Sky Dash - Challenge",}
b[75803]={n="River Rapids Route - Challenge",}
b[75804]={n="River Rapids Route - Reverse Challenge",}
b[75805]={n="Azure Span Sprint - Challenge",}
b[75806]={n="Azure Span Sprint - Reverse Challenge",}
b[75808]={n="Azure Span Slalom - Reverse Challenge",}
b[75809]={n="Vakthros Ascent - Challenge",}
b[75810]={n="Vakthros Ascent - Reverse Challenge",}
b[75811]={n="Iskaara Tour - Challenge",}
b[75812]={n="Iskaara Tour - Reverse Challenge",}
b[75813]={n="Frostland Flyover - Challenge",}
b[75815]={n="Frostland Flyover - Reverse Challenge",}
b[75816]={n="Archive Ambit - Challenge",}
b[75817]={n="Archive Ambit - Reverse Challenge",}
b[75820]={n="Flowing Forest Flight - Challenge",}
b[75821]={n="Flowing Forest Flight - Reverse Challenge",}
b[75822]={n="Tyrhold Trial - Challenge",}
b[75823]={n="Tyrhold Trial - Reverse Challenge",}
b[75824]={n="Cliffside Circuit - Challenge",}
b[75825]={n="Cliffside Circuit - Reverse Challenge",}
b[75826]={n="Academy Ascent - Challenge",}
b[75827]={n="Academy Ascent - Reverse Challenge",}
b[75828]={n="Garden Gallivant - Reverse Challenge",}
b[75829]={n="Caverns Criss-Cross - Challenge",}
b[75830]={n="Caverns Criss-Cross - Reverse Challenge",}
b[75954]={n="Stormsunder Crater Circuit - Challenge",}
b[75955]={n="Stormsunder Crater Circuit - Reverse Challenge",}
b[75956]={n="Morqut Ascent - Challenge",}
b[75957]={n="Morqut Ascent - Reverse Challenge",}
b[75958]={n="Aerie Chasm Cruise - Challenge",}
b[75959]={n="Aerie Chasm Cruise - Reverse Challenge",}
b[75960]={n="Southern Reach Route - Challenge",}
b[75961]={n="Southern Reach Route - Reverse Challenge",}
b[75962]={n="Caldera Coaster - Challenge",}
b[75963]={n="Caldera Coaster - Reverse Challenge",}
b[75964]={n="Forbidden Reach Rush - Challenge",}
b[75965]={n="Forbidden Reach Rush - Reverse Challenge",}
b[75970]={n="Tracked Through Time",r={cu={{n="Soridormi's Recognition",ct=3000},{n="Paracausal Flakes",ct=70}},mo=280900,xp=9500}}
b[75971]={n="Squeaky Toy of Time and Space",r={cu={{n="Soridormi's Recognition",ct=3000},{n="Paracausal Flakes",ct=70}},mo=280900,xp=9500}}
b[75972]={n="Crystal Circuit - Challenge",}
b[75973]={n="Crystal Circuit - Reverse Challenge",}
b[75974]={n="Caldera Cruise - Challenge",}
b[75975]={n="Caldera Cruise - Reverse Challenge",}
b[75976]={n="Brimstone Scramble - Challenge",}
b[75977]={n="Brimstone Scramble - Reverse Challenge",}
b[75978]={n="Shimmering Slalom - Challenge",}
b[75979]={n="Shimmering Slalom - Reverse Challenge",}
b[75980]={n="Loamm Roamm - Challenge",}
b[75981]={n="Loamm Roamm - Reverse Challenge",}
b[75982]={n="Sulfur Sprint - Challenge",}
b[75983]={n="Sulfur Sprint - Reverse Challenge",}
b[75987]={n="Woolomancer",r={cu={{n="Soridormi's Recognition",ct=3000},{n="Paracausal Flakes",ct=70}},mo=280900,xp=9500}}
b[75988]={n="Lucky Hearthstone Card",r={cu={{n="Soridormi's Recognition",ct=3000},{n="Paracausal Flakes",ct=70}},mo=561800,xp=11900}}
b[75989]={n="The Black Prince Parade",r={cu={{n="Soridormi's Recognition",ct=3000},{n="Paracausal Flakes",ct=70}},mo=280900,xp=9500}}
b[75990]={n="Star-Crossed Lovers",r={cu={{n="Soridormi's Recognition",ct=3000},{n="Paracausal Flakes",ct=70}},mo=280900,xp=9500}}
b[75991]={n="What Could Have Been",r={cu={{n="Soridormi's Recognition",ct=3000},{n="Paracausal Flakes",ct=70}},mo=280900,xp=9500}}
b[76035]={n="Winter Wander - Challenge",}
b[76036]={n="Winter Wander - Reverse Challenge",}
b[76037]={n="Nordrassil Spiral - Challenge",}
b[76040]={n="Nordrassil Spiral - Reverse Challenge",}
b[76041]={n="Hyjal Hotfoot - Challenge",}
b[76042]={n="Hyjal Hotfoot - Reverse Challenge",}
b[76047]={n="Durotar Tour - Challenge",}
b[76048]={n="Durotar Tour - Reverse Challenge",}
b[76049]={n="Webwinder Weave - Challenge",}
b[76050]={n="Webwinder Weave - Reverse Challenge",}
b[76076]={n="Small Things",r={cu={{n="Soridormi's Recognition",ct=3000},{n="Paracausal Flakes",ct=70}},mo=280900,xp=9500}}
b[76162]={n="Missing Mojo",r={cu={{n="Soridormi's Recognition",ct=3000},{n="Paracausal Flakes",ct=70}},mo=280900,xp=9500}}
b[76244]={n="Prince in Peril",r={cu={{n="Soridormi's Recognition",ct=3000},{n="Paracausal Flakes",ct=70}},mo=280900,xp=9500}}
b[76246]={n="Manastorm Mystique",r={cu={{n="Soridormi's Recognition",ct=3000},{n="Paracausal Flakes",ct=70}},mo=280900,xp=9500}}
b[76251]={n="Fowl Beasts",r={cu={{n="Soridormi's Recognition",ct=3000},{n="Paracausal Flakes",ct=70}},mo=280900,xp=9500}}
b[76266]={n="A Multitude of Tasks",r={cu={{n="Soridormi's Recognition",ct=3000},{n="Paracausal Flakes",ct=70}},mo=280900,xp=9500}}
b[76269]={n="A Mislaid Egg",r={cu={{n="Soridormi's Recognition",ct=3000},{n="Paracausal Flakes",ct=70}},mo=280900,xp=9500}}
b[76357]={n="Searing Slalom",}
b[76358]={n="Searing Slalom - Advanced",}
b[76359]={n="Searing Slalom - Reverse",}
b[76364]={n="Twilight Terror",}
b[76365]={n="Twilight Terror - Advanced",}
b[76366]={n="Twilight Terror - Reverse",}
b[76380]={n="Deadwind Derby",}
b[76381]={n="Deadwind Derby - Advanced",}
b[76382]={n="Deadwind Derby - Reverse",}
b[76397]={n="Elwynn Forest Flash",}
b[76399]={n="Elwynn Forest Flash - Advanced",}
b[76400]={n="Elwynn Forest Flash - Reverse",}
b[76445]={n="Ironforge Interceptor",}
b[76446]={n="Ironforge Interceptor - Advanced",}
b[76447]={n="Ironforge Interceptor - Reverse",}
b[76510]={n="Plaguelands Plunge",}
b[76512]={n="Plaguelands Plunge - Advanced",}
b[76513]={n="Plaguelands Plunge - Reverse",}
b[76527]={n="Krazzworks Klash",}
b[76528]={n="Krazzworks Klash - Advanced",}
b[76529]={n="Krazzworks Klash - Reverse",}
b[76536]={n="Redridge Rally",}
b[76537]={n="Redridge Rally - Advanced",}
b[76538]={n="Redridge Rally - Reverse",}
b[76588]={n="Defender of the Flame",r={i={{n="Lamplighter Supply Satchel"}},mo=309800,xp=11750}}
b[76591]={n="Bubbling Brews",r={i={{n="Brewfest Prize Token"}},mo=280900,xp=9500}}
b[77102]={n="Hellfire Hustle",}
b[77103]={n="Hellfire Hustle - Advanced",}
b[77104]={n="Hellfire Hustle - Reverse",}
b[77169]={n="Coilfang Caper",}
b[77170]={n="Coilfang Caper - Advanced",}
b[77171]={n="Coilfang Caper - Reverse",}
b[77205]={n="Blade's Edge Brawl",}
b[77206]={n="Blade's Edge Brawl - Advanced",}
b[77207]={n="Blade's Edge Brawl - Reverse",}
b[77208]={n="Barreling Down",r={i={{n="Brewfest Prize Token"}},mo=280900,xp=9500}}
b[77260]={n="Razorthorn Rise Rush",}
b[77261]={n="Razorthorn Rise Rush - Advanced",}
b[77262]={n="Razorthorn Rise Rush - Reverse",}
b[77264]={n="Auchindoun Coaster",}
b[77265]={n="Auchindoun Coaster - Advanced",}
b[77266]={n="Auchindoun Coaster - Reverse",}
b[77278]={n="Tempest Keep Sweep",}
b[77279]={n="Tempest Keep Sweep - Advanced",}
b[77280]={n="Tempest Keep Sweep - Reverse",}
b[77322]={n="Shattrath City Sashay",}
b[77323]={n="Shattrath City Sashay - Advanced",}
b[77324]={n="Shattrath City Sashay - Reverse",}
b[77398]={n="Eco-Dome Excursion",}
b[77399]={n="Eco-Dome Excursion - Advanced",}
b[77400]={n="Eco-Dome Excursion - Reverse",}
b[77426]={n="Practice Makes Perfect: Rusziona",}
b[77427]={n="Practice Makes Perfect: Zhusadormu",}
b[77428]={n="Practice Makes Perfect: Zalethgos",}
b[77429]={n="Practice Makes Perfect: Posidriss",}
b[77430]={n="Practice Makes Perfect: Belastrasza",}
b[77645]={n="Skettis Scramble",}
b[77646]={n="Skettis Scramble - Advanced",}
b[77647]={n="Skettis Scramble - Reverse",}
b[77784]={n="Tyrhold Trial - Storm Gryphon",}
b[77785]={n="Fen Flythrough - Storm Gryphon",}
b[77786]={n="Vakthros Ascent - Storm Gryphon",}
b[77787]={n="Stormsunder Crater Circuit - Storm Gryphon",}
b[77793]={n="Crystal Circuit - Storm Gryphon",}
b[77841]={n="Ysera Invitational",}
b[77842]={n="Ysera Invitational - Advanced",}
b[77843]={n="Ysera Invitational - Reverse",}
b[77844]={n="Ysera Invitational - Challenge",}
b[77845]={n="Ysera Invitational - Reverse Challenge",}
b[77957]={n="A Treacherous Race",}
b[77983]={n="Smoldering Sprint",}
b[77984]={n="Smoldering Sprint - Advanced",}
b[77985]={n="Smoldering Sprint - Reverse",}
b[77986]={n="Smoldering Sprint - Challenge",}
b[77987]={n="Smoldering Sprint - Reverse Challenge",}
b[77996]={n="Viridescent Venture",}
b[77997]={n="Viridescent Venture - Advanced",}
b[77998]={n="Viridescent Venture - Reverse",}
b[77999]={n="Viridescent Venture - Challenge",}
b[78000]={n="Viridescent Venture - Reverse Challenge",}
b[78016]={n="Shoreline Switchback",}
b[78017]={n="Shoreline Switchback - Advanced",}
b[78018]={n="Shoreline Switchback - Reverse",}
b[78019]={n="Shoreline Switchback - Challenge",}
b[78020]={n="Shoreline Switchback - Reverse Challenge",}
b[78102]={n="Canopy Concours",}
b[78103]={n="Canopy Concours - Advanced",}
b[78104]={n="Canopy Concours - Reverse",}
b[78105]={n="Canopy Concours - Challenge",}
b[78106]={n="Canopy Concours - Reverse Challenge",}
b[78115]={n="Emerald Amble",}
b[78116]={n="Emerald Amble - Advanced",}
b[78117]={n="Emerald Amble - Reverse",}
b[78118]={n="Emerald Amble - Challenge",}
b[78119]={n="Emerald Amble - Reverse Challenge",}
b[78126]={n="Lightbringer's Duty",}
b[78274]={n="Quacking Down",r={i={{n="Brightly Colored Egg"}}}}
b[78301]={n="Scalawag Slither",}
b[78302]={n="Scalawag Slither - Advanced",}
b[78303]={n="Scalawag Slither - Reverse",}
b[78325]={n="Daggercap Dart",}
b[78326]={n="Daggercap Dart - Advanced",}
b[78327]={n="Daggercap Dart - Reverse",}
b[78334]={n="Blackriver Burble",}
b[78335]={n="Blackriver Burble - Advanced",}
b[78336]={n="Blackriver Burble - Reverse",}
b[78346]={n="Zul'Drak Zephyr",}
b[78347]={n="Zul'Drak Zephyr - Advanced",}
b[78349]={n="Zul'Drak Zephyr - Reverse",}
b[78389]={n="The Makers' Marathon",}
b[78390]={n="The Makers' Marathon - Advanced",}
b[78391]={n="The Makers' Marathon - Reverse",}
b[78441]={n="Crystalsong Crisis",}
b[78442]={n="Crystalsong Crisis - Advanced",}
b[78443]={n="Crystalsong Crisis - Reverse",}
b[78454]={n="Dragonblight Dragon Flight",}
b[78455]={n="Dragonblight Dragon Flight - Advanced",}
b[78456]={n="Dragonblight Dragon Flight - Reverse",}
b[78499]={n="Citadel Sortie",}
b[78500]={n="Citadel Sortie - Advanced",}
b[78501]={n="Citadel Sortie - Reverse",}
b[78558]={n="Sholazar Spree",}
b[78559]={n="Sholazar Spree - Advanced",}
b[78560]={n="Sholazar Spree - Reverse",}
b[78565]={n="Getaway to Scenic Grizzly Hills!",r={mo=280900,xp=9500}}
b[78591]={n="Getaway to Scenic Nagrand!",r={mo=280900,xp=9500}}
b[78594]={n="Getaway to Scenic Feralas!",r={mo=280900,xp=9500}}
b[78598]={n="Dream Infusion",r={cu={{n="Dream Infusion",ct=1}}}}
b[78608]={n="Geothermal Jaunt",}
b[78609]={n="Geothermal Jaunt - Advanced",}
b[78610]={n="Geothermal Jaunt - Reverse",}
b[78674]={n="The Gift of Relief",r={mo=280900,xp=9500}}
b[78679]={n="The Gift of Relaxation",r={mo=280900,xp=9500}}
b[78724]={n="Loving Yourself, Your Way",r={mo=280900,xp=9500}}
b[78726]={n="Loving Yourself, Your Way",r={mo=280900,xp=9500}}
b[78938]={n="Champion of the Waterlords",r={mo=561800,xp=11900}}
b[78979]={n="Loving Yourself, Your Way",r={mo=280900,xp=9500}}
b[78986]={n="Getaway to Scenic Grizzly Hills!",r={mo=280900,xp=9500}}
b[78987]={n="Getaway to Scenic Nagrand!",r={mo=280900,xp=9500}}
b[78988]={n="Getaway to Scenic Feralas!",r={mo=280900,xp=9500}}
b[78990]={n="The Gift of Relief",r={mo=280900,xp=9500}}
b[78991]={n="The Gift of Relaxation",r={mo=280900,xp=9500}}
b[79135]={n="Quacking Down",r={i={{n="Brightly Colored Egg"}}}}
b[79268]={n="Gundrak Fast Track",}
b[79269]={n="Gundrak Fast Track - Advanced",}
b[79270]={n="Gundrak Fast Track - Reverse",}
b[79558]={n="Feathered Fiend",}
b[80256]={n="Dunelle's Detour",}
b[80257]={n="Tenir's Traversal",}
b[80258]={n="Light's Redoubt Descent",}
b[80259]={n="Stillstone Slalom",}
b[80260]={n="Mereldar Meander",}
b[80261]={n="Velhan's Venture",}
b[80265]={n="Dunelle's Detour - Advanced",}
b[80266]={n="Tenir's Traversal - Advanced",}
b[80267]={n="Light's Redoubt Descent - Advanced",}
b[80268]={n="Stillstone Slalom - Advanced",}
b[80269]={n="Mereldar Meander - Advanced",}
b[80270]={n="Velhan's Venture - Advanced",}
b[80271]={n="Dunelle's Detour - Reverse",}
b[80272]={n="Tenir's Traversal - Reverse",}
b[80273]={n="Light's Redoubt Descent - Reverse",}
b[80274]={n="Stillstone Slalom - Reverse",}
b[80275]={n="Mereldar Meander - Reverse",}
b[80276]={n="Velhan's Venture - Reverse",}
b[80277]={n="City of Threads Twist",}
b[80278]={n="Maddening Deep Dip",}
b[80279]={n="The Weaver's Wing",}
b[80280]={n="Rak-Ahat Rush",}
b[80281]={n="Pit Plunge",}
b[80282]={n="Siegehold Scuttle",}
b[80283]={n="City of Threads Twist - Advanced",}
b[80284]={n="Maddening Deep Dip - Advanced",}
b[80285]={n="The Weaver's Wing - Advanced",}
b[80286]={n="Rak-Ahat Rush - Advanced",}
b[80287]={n="Pit Plunge - Advanced",}
b[80288]={n="Siegehold Scuttle - Advanced",}
b[80289]={n="City of Threads Twist - Reverse",}
b[80290]={n="Maddening Deep Dip - Reverse",}
b[80291]={n="The Weaver's Wing - Reverse",}
b[80292]={n="Rak-Ahat Rush - Reverse",}
b[80293]={n="Pit Plunge - Reverse",}
b[80294]={n="Siegehold Scuttle - Reverse",}
b[80433]={n="Aid the August Celestials",r={mo=13740,xp=600,rep={{n="The August Celestials",v=250}}}}
b[80438]={n="Aid the Horde",r={mo=13740,xp=600,rep={{n="Dominance Offensive",v=500}}}}
b[80441]={n="Aid the Order of the Cloud Serpent",r={mo=13740,xp=600,rep={{n="Order of the Cloud Serpent",v=250}}}}
b[80442]={n="Aid the Sunreavers Onslaught",r={i={{n="Key to the Palace of Lei Shen"}},mo=13740,xp=600,rep={{n="Sunreaver Onslaught",v=250}}}}
b[80443]={n="Aid the Kirin Tor Offensive",r={i={{n="Key to the Palace of Lei Shen"}},mo=13740,xp=600,rep={{n="Kirin Tor Offensive",v=250}}}}
b[82676]={n="Broken Masquerade",r={mo=561800,xp=11900}}
b[82689]={n="Only Darkness",r={mo=561800,xp=11900}}
b[84222]={n="Secure the Perimeter",r={mo=309800,xp=11750}}
b[84432]={n="Longship Landing",r={mo=309800,xp=11750}}
b[84616]={n="Celebrate Good Fun!",r={mo=28090,xp=1200}}
b[84680]={n="Rock 'n Stone Revival",r={mo=309800,xp=11750}}
b[86486]={n="Hungry, Hungry Snapdragon",r={mo=309800,xp=11750}}
b[87475]={n="Sureki Incursion: Hold the Wall",r={mo=280900,xp=9500}}
b[87477]={n="Sureki Incursion: Southern Swarm",r={mo=280900,xp=9500}}
b[87480]={n="Sureki Incursion: The Eastern Assault",r={mo=280900,xp=9500}}
b[88711]={n="Radiant Incursion: Toxins and Pheromones",r={mo=280900,xp=9500}}
b[88916]={n="Radiant Incursion: Sureki's End",r={mo=280900,xp=9500}}
b[88945]={n="Radiant Incursion: Rak-Zakaz",r={mo=280900,xp=9500}}
b[92554]={n="Addition of Anguish",}
b[92855]={n="Make Haste, Not Waste",}
b[93870]={n="The Ephemeron Masquerade",r={cu={{n="Illusionary Coin",ct=50}}}}
