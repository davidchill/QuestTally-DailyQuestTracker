-- WorldQuestData.lua  (HAND-MAINTAINED -- safe to edit directly)
-- World-quest catalog originally mined from Blizzard's retail client DB2
-- (wago.tools): QuestV2CliTask + QuestInfo + ContentTuning + QuestPOIBlob, by the
-- now-retired _generator/ toolchain. That toolchain is no longer run, so edit
-- this file in place. First-party data; live status is resolved at runtime.
-- Covers the world-quest era (Legion+). Build: 12.0.7.67808
--   w[questID] = { n=title, e=expansionKey, m=uiMapID, t=typeName }
local _, DT = ...
DT.WorldQuests = DT.WorldQuests or {}
local w = DT.WorldQuests
w[39424]={n="Everything!",e="LEGION",m=650,t="World Quest"}
w[39462]={n="Primal Payback",e="LEGION",m=650,t="World Quest"}
w[40277]={n="Fight Night: Tiffany Nelson",e="LEGION",m=627,t="Battle Pet World Quest"}
w[40278]={n="My Beasts's Bidding",e="LEGION",m=634,t="Battle Pet World Quest"}
w[40279]={n="Training with Durian",e="LEGION",m=641,t="Battle Pet World Quest"}
w[40280]={n="Training with Bredda",e="LEGION",m=650,t="Battle Pet World Quest"}
w[40282]={n="Tiny Poacher, Tiny Animals",e="LEGION",m=650,t="Battle Pet World Quest"}
w[40298]={n="Fight Night: Sir Galveston",e="LEGION",m=627,t="Battle Pet World Quest"}
w[40299]={n="Fight Night: Bodhi Sunwayver",e="LEGION",m=627,t="Battle Pet World Quest"}
w[40337]={n="Flummoxed",e="LEGION",m=680,t="Battle Pet World Quest"}
w[40390]={n="Hallowed Ground",e="LEGION",m=646,t="Rare World Quest"}
w[40850]={n="Prisoners of Greystone",e="LEGION",m=650,t="World Quest"}
w[40895]={n="The Haunted Mire",e="LEGION",m=650,t="World Quest"}
w[40896]={n="Threnody of Chieftains",e="LEGION",m=650,t="World Quest"}
w[40920]={n="Stonebinder Bounty",e="LEGION",m=650,t="World Quest"}
w[40925]={n="Bitestone Burglary",e="LEGION",m=650,t="World Quest"}
w[40951]={n="Bitestone Bazaar",e="LEGION",m=650,t="World Quest"}
w[40966]={n="Ritualists in Our Midsts",e="LEGION",m=650,t="World Quest"}
w[40978]={n="Bears Behaving Badly",e="LEGION",m=650,t="World Quest"}
w[40980]={n="Boilback Plague",e="LEGION",m=650,t="World Quest"}
w[40984]={n="Murkwater Naga Incursion: Highmountain",e="LEGION",m=650,t="World Quest"}
w[40985]={n="Rimescale Naga Incursion: Highmountain",e="LEGION",m=650,t="World Quest"}
w[41011]={n="Umbralshard Rituals",e="LEGION",m=650,t="World Quest"}
w[41013]={n="Darkbrul Arena",e="LEGION",m=650,t="PvP World Quest"}
w[41014]={n="Fury Road",e="LEGION",m=650,t="World Quest"}
w[41024]={n="Dirge of the Dead",e="LEGION",m=650,t="World Quest"}
w[41025]={n="Rise of the Fallen",e="LEGION",m=650,t="World Quest"}
w[41026]={n="Back to the Shadows",e="LEGION",m=650,t="World Quest"}
w[41055]={n="Primal Payback",e="LEGION",m=650,t="World Quest"}
w[41057]={n="Primal Payback",e="LEGION",m=650,t="World Quest"}
w[41076]={n="Munitions Testing",e="LEGION",m=650,t="World Quest"}
w[41077]={n="Munitions Testing",e="LEGION",m=650,t="World Quest"}
w[41078]={n="Munitions Testing",e="LEGION",m=650,t="World Quest"}
w[41089]={n="Lords of the Hills",e="LEGION",m=650,t="Rare Elite World Quest"}
w[41090]={n="Lords of the Hills",e="LEGION",m=650,t="Rare Elite World Quest"}
w[41091]={n="Lords of the Hills",e="LEGION",m=650,t="Rare Elite World Quest"}
w[41093]={n="DANGER: Durguth",e="LEGION",m=650,t="Rare Elite World Quest"}
w[41095]={n="Critical Crops",e="LEGION",m=650,t="World Quest"}
w[41122]={n="Mists Take You",e="LEGION",m=650,t="World Quest"}
w[41127]={n="Gunksnout Infestation",e="LEGION",m=650,t="World Quest"}
w[41130]={n="Don't Fear the Weeper",e="LEGION",m=650,t="World Quest"}
w[41144]={n="Return to the River",e="LEGION",m=650,t="World Quest"}
w[41145]={n="Water of Life",e="LEGION",m=650,t="World Quest"}
w[41196]={n="Leystone Basilisks",e="LEGION",m=650,t="Mining World Quest"}
w[41198]={n="Leystone Basilisks",e="LEGION",m=650,t="Mining World Quest"}
w[41199]={n="Leystone Rumblers",e="LEGION",m=650,t="Mining World Quest"}
w[41200]={n="Rough Leystone Outcropping",e="LEGION",m=650,t="Mining World Quest"}
w[41201]={n="Coarse Leystone Outcropping",e="LEGION",m=650,t="Mining World Quest"}
w[41202]={n="Crude Leystone Seams",e="LEGION",m=650,t="Mining World Quest"}
w[41203]={n="Bright Leystone Deposits",e="LEGION",m=650,t="Mining World Quest"}
w[41204]={n="Hard Leystone Deposits",e="LEGION",m=650,t="Mining World Quest"}
w[41205]={n="Warm Leystone Deposits",e="LEGION",m=650,t="Mining World Quest"}
w[41206]={n="Work Order: Leystone",e="LEGION",m=650,t="Mining World Quest"}
w[41207]={n="Supplies Needed: Leystone",e="LEGION",m=650,t="World Quest"}
w[41208]={n="Brimstone Destroyer",e="LEGION",m=650,t="Mining World Quest"}
w[41209]={n="Brimstone Destroyer",e="LEGION",m=650,t="Mining World Quest"}
w[41210]={n="Brimstone Destroyer",e="LEGION",m=650,t="Mining World Quest"}
w[41211]={n="Neltharion's Lair: Neltharion's Treasure",e="LEGION",m=650,t="Dungeon World Quest"}
w[41219]={n="Flourishing Foxflower",e="LEGION",m=650,t="Herbalism World Quest"}
w[41223]={n="Work Order: Foxflower",e="LEGION",m=650,t="Herbalism World Quest"}
w[41224]={n="Supplies Needed: Foxflower",e="LEGION",m=650,t="World Quest"}
w[41225]={n="Felwort",e="LEGION",m=650,t="Herbalism World Quest"}
w[41227]={n="Warden Tower Assault: Cordana's Apex",e="LEGION",m=650,t="PvP World Quest"}
w[41228]={n="Foxflower Cluster",e="LEGION",m=650,t="Herbalism World Quest"}
w[41232]={n="Thick Ironhorn Hide",e="LEGION",m=650,t="Skinning World Quest"}
w[41233]={n="Bristled Bear Skin",e="LEGION",m=650,t="Skinning World Quest"}
w[41234]={n="Shaggy Saber Hide",e="LEGION",m=650,t="Skinning World Quest"}
w[41235]={n="Work Order: Stonehide Leather",e="LEGION",m=650,t="Skinning World Quest"}
w[41237]={n="Supplies Needed: Stonehide Leather",e="LEGION",m=650,t="World Quest"}
w[41238]={n="Calcified Wormscales",e="LEGION",m=650,t="Skinning World Quest"}
w[41239]={n="Felhide",e="LEGION",m=650,t="Skinning World Quest"}
w[41240]={n="Work Order: Highmountain Salmon",e="LEGION",m=650,t="Fishing World Quest"}
w[41242]={n="Slab of Bacon",e="LEGION",m=650,t="Cooking World Quest"}
w[41243]={n="Huge Highmountain Salmon",e="LEGION",m=650,t="Fishing World Quest"}
w[41244]={n="Lively Highmountain Salmon",e="LEGION",m=650,t="Fishing World Quest"}
w[41252]={n="Wild Northern Barracuda",e="LEGION",m=650,t="Fishing World Quest"}
w[41253]={n="Migrating Highmountain Salmon",e="LEGION",m=650,t="Fishing World Quest"}
w[41257]={n="Warden Tower Assault: Cordana's Apex",e="LEGION",m=650,t="PvP World Quest"}
w[41259]={n="Slab of Bacon",e="LEGION",m=630,t="Cooking World Quest"}
w[41260]={n="Slab of Bacon",e="LEGION",m=641,t="Cooking World Quest"}
w[41261]={n="Slab of Bacon",e="LEGION",m=634,t="Cooking World Quest"}
w[41262]={n="Slab of Bacon",e="LEGION",m=680,t="Cooking World Quest"}
w[41264]={n="Lively Cursed Queenfish",e="LEGION",m=630,t="Fishing World Quest"}
w[41265]={n="Huge Cursed Queenfish",e="LEGION",m=630,t="Fishing World Quest"}
w[41266]={n="Raft Fishing",e="LEGION",m=630,t="Fishing World Quest"}
w[41267]={n="Work Order: Cursed Queenfish",e="LEGION",m=630,t="Fishing World Quest"}
w[41268]={n="Queen Queenfish",e="LEGION",m=630,t="Fishing World Quest"}
w[41269]={n="Lively Mossgill Perch",e="LEGION",m=641,t="Fishing World Quest"}
w[41270]={n="Huge Mossgill Perch",e="LEGION",m=641,t="Fishing World Quest"}
w[41271]={n="Into the Whirlpool",e="LEGION",m=641,t="Fishing World Quest"}
w[41272]={n="Work Order: Mossgill Perch",e="LEGION",m=641,t="Fishing World Quest"}
w[41273]={n="Buoy Fishing",e="LEGION",m=641,t="Fishing World Quest"}
w[41274]={n="Lively Stormrays",e="LEGION",m=634,t="Fishing World Quest"}
w[41275]={n="Huge Stormrays",e="LEGION",m=634,t="Fishing World Quest"}
w[41276]={n="Rocket Boot Fishing",e="LEGION",m=634,t="Fishing World Quest"}
w[41277]={n="Work Order: Stormrays",e="LEGION",m=634,t="Fishing World Quest"}
w[41278]={n="Slippery Stormrays",e="LEGION",m=634,t="Fishing World Quest"}
w[41279]={n="Lively Runescale Koi",e="LEGION",m=680,t="Fishing World Quest"}
w[41280]={n="Huge Runescale Koi",e="LEGION",m=680,t="Fishing World Quest"}
w[41282]={n="Work Order: Runescale Koi",e="LEGION",m=680,t="Fishing World Quest"}
w[41283]={n="The Angler Mangler",e="LEGION",m=680,t="Fishing World Quest"}
w[41286]={n="Aethril Cluster",e="LEGION",m=630,t="Herbalism World Quest"}
w[41287]={n="Work Order: Aethril",e="LEGION",m=630,t="Herbalism World Quest"}
w[41288]={n="Supplies Needed: Aethril",e="LEGION",m=630,t="World Quest"}
w[41289]={n="Flourishing Aethril",e="LEGION",m=630,t="Herbalism World Quest"}
w[41290]={n="Aqueous Aethril",e="LEGION",m=630,t="Herbalism World Quest"}
w[41291]={n="Dreamleaf Cluster",e="LEGION",m=641,t="Herbalism World Quest"}
w[41292]={n="Work Order: Dreamleaf",e="LEGION",m=641,t="Herbalism World Quest"}
w[41293]={n="Supplies Needed: Dreamleaf",e="LEGION",m=641,t="World Quest"}
w[41294]={n="Flourishing Dreamleaf",e="LEGION",m=641,t="Herbalism World Quest"}
w[41295]={n="Dreamleaf-Covered Ancient",e="LEGION",m=641,t="Herbalism World Quest"}
w[41296]={n="Fjarnskaggl Cluster",e="LEGION",m=634,t="Herbalism World Quest"}
w[41297]={n="Work Order: Fjarnskaggl",e="LEGION",m=634,t="Herbalism World Quest"}
w[41298]={n="Supplies Needed: Fjarnskaggl",e="LEGION",m=634,t="World Quest"}
w[41299]={n="Flourishing Fjarnskaggl",e="LEGION",m=634,t="Herbalism World Quest"}
w[41300]={n="Singed Fjarnskaggl",e="LEGION",m=634,t="Herbalism World Quest"}
w[41301]={n="Starlight Rose Cluster",e="LEGION",m=680,t="Herbalism World Quest"}
w[41302]={n="Work Order: Starlight Roses",e="LEGION",m=680,t="Herbalism World Quest"}
w[41303]={n="Supplies Needed: Starlight Roses",e="LEGION",m=680,t="World Quest"}
w[41304]={n="Flourishing Starlight Roses",e="LEGION",m=680,t="Herbalism World Quest"}
w[41305]={n="Nightborne Herb Trader",e="LEGION",m=680,t="Herbalism World Quest"}
w[41308]={n="Border Reinforcements",e="LEGION",m=650,t="World Quest"}
w[41311]={n="Work Order: Leystone",e="LEGION",m=630,t="Mining World Quest"}
w[41312]={n="Work Order: Leystone",e="LEGION",m=641,t="Mining World Quest"}
w[41313]={n="Work Order: Leystone",e="LEGION",m=634,t="Mining World Quest"}
w[41314]={n="Work Order: Felslate",e="LEGION",m=680,t="Mining World Quest"}
w[41315]={n="Supplies Needed: Leystone",e="LEGION",m=630,t="World Quest"}
w[41316]={n="Supplies Needed: Leystone",e="LEGION",m=641,t="World Quest"}
w[41317]={n="Supplies Needed: Leystone",e="LEGION",m=634,t="World Quest"}
w[41318]={n="Supplies Needed: Felslate",e="LEGION",m=680,t="World Quest"}
w[41322]={n="Unscratched Hippogryph Scale",e="LEGION",m=630,t="Skinning World Quest"}
w[41323]={n="Fatty Lion Seal Skin",e="LEGION",m=630,t="Skinning World Quest"}
w[41324]={n="Silky Prowler Fur",e="LEGION",m=630,t="Skinning World Quest"}
w[41326]={n="Work Order: Stormscales",e="LEGION",m=630,t="Skinning World Quest"}
w[41327]={n="Supplies Needed: Stormscales",e="LEGION",m=630,t="World Quest"}
w[41333]={n="Rugged Wolf Hide",e="LEGION",m=641,t="Skinning World Quest"}
w[41334]={n="Musky Bear Hide",e="LEGION",m=641,t="Skinning World Quest"}
w[41336]={n="Bristly Musken Hide",e="LEGION",m=634,t="Skinning World Quest"}
w[41337]={n="Pristine Stag Hide",e="LEGION",m=641,t="Skinning World Quest"}
w[41338]={n="Work Order: Stonehide Leather",e="LEGION",m=641,t="Skinning World Quest"}
w[41339]={n="Supplies Needed: Stonehide Leather",e="LEGION",m=641,t="World Quest"}
w[41340]={n="Perfect Storm Drake Scale",e="LEGION",m=634,t="Skinning World Quest"}
w[41342]={n="Thick Bear Hide",e="LEGION",m=634,t="Skinning World Quest"}
w[41343]={n="Solid Crabshell Fragment",e="LEGION",m=634,t="Skinning World Quest"}
w[41344]={n="Work Order: Stormscales",e="LEGION",m=634,t="Skinning World Quest"}
w[41345]={n="Supplies Needed: Stormscales",e="LEGION",m=634,t="World Quest"}
w[41346]={n="Velvety Stalker Hide",e="LEGION",m=680,t="Skinning World Quest"}
w[41347]={n="Extra-Rancid Felhound Hide",e="LEGION",m=680,t="Skinning World Quest"}
w[41349]={n="Rock-Hard Crab Chitin",e="LEGION",m=680,t="Skinning World Quest"}
w[41350]={n="Work Order: Stonehide Leather",e="LEGION",m=680,t="Skinning World Quest"}
w[41351]={n="Supplies Needed: Stonehide Leather",e="LEGION",m=680,t="World Quest"}
w[41352]={n="Felslate Basilisks",e="LEGION",m=680,t="Mining World Quest"}
w[41353]={n="Odious Felslate Outcropping",e="LEGION",m=680,t="Mining World Quest"}
w[41354]={n="Shattered Felslate Seams",e="LEGION",m=680,t="Mining World Quest"}
w[41357]={n="Primordial Felslate Deposits",e="LEGION",m=680,t="Mining World Quest"}
w[41414]={n="Weapons of Deathwing",e="LEGION",m=650,t="World Quest"}
w[41416]={n="Retake the Skyhorn",e="LEGION",m=650,t="World Quest"}
w[41420]={n="Warden Tower Assault: Nightwatcher's Perch",e="LEGION",m=650,t="PvP World Quest"}
w[41421]={n="Warden Tower Assault: Nightwatcher's Perch",e="LEGION",m=650,t="PvP World Quest"}
w[41427]={n="Get Vrekt",e="LEGION",m=634,t="World Quest"}
w[41428]={n="Unstable Portal",e="LEGION",m=650,t="World Quest"}
w[41432]={n="Fiery Leystone Deposits",e="LEGION",m=650,t="Mining World Quest"}
w[41433]={n="Massive Leystone Deposits",e="LEGION",m=650,t="Mining World Quest"}
w[41434]={n="Glowing Leystone Deposits",e="LEGION",m=630,t="Mining World Quest"}
w[41435]={n="Smooth Leystone Deposits",e="LEGION",m=630,t="Mining World Quest"}
w[41437]={n="Fine Leystone Deposits",e="LEGION",m=630,t="Mining World Quest"}
w[41438]={n="Charged Leystone Deposits",e="LEGION",m=630,t="Mining World Quest"}
w[41439]={n="Exquisite Leystone Deposits",e="LEGION",m=641,t="Mining World Quest"}
w[41440]={n="Magnificent Leystone Deposits",e="LEGION",m=641,t="Mining World Quest"}
w[41441]={n="Superior Leystone Deposits",e="LEGION",m=641,t="Mining World Quest"}
w[41442]={n="Striking Leystone Deposits",e="LEGION",m=634,t="Mining World Quest"}
w[41443]={n="Ancient Leystone Deposits",e="LEGION",m=634,t="Mining World Quest"}
w[41444]={n="Dark Leystone Deposits",e="LEGION",m=634,t="Mining World Quest"}
w[41445]={n="Stormy Leystone Deposits",e="LEGION",m=634,t="Mining World Quest"}
w[41446]={n="Darkened Felslate Deposits",e="LEGION",m=680,t="Mining World Quest"}
w[41447]={n="Burning Felslate Deposits",e="LEGION",m=680,t="Mining World Quest"}
w[41448]={n="Heavy Felslate Deposits",e="LEGION",m=680,t="Mining World Quest"}
w[41451]={n="Assault on Hrydshal",e="LEGION",m=634,t="World Quest"}
w[41454]={n="Luminous Leystone Outcropping",e="LEGION",m=630,t="Mining World Quest"}
w[41455]={n="Gleaming Leystone Outcropping",e="LEGION",m=630,t="Mining World Quest"}
w[41457]={n="Radiant Leystone Outcropping",e="LEGION",m=641,t="Mining World Quest"}
w[41458]={n="Hardened Leystone Outcropping",e="LEGION",m=641,t="Mining World Quest"}
w[41459]={n="Dense Leystone Outcropping",e="LEGION",m=634,t="Mining World Quest"}
w[41460]={n="Primal Leystone Outcropping",e="LEGION",m=634,t="Mining World Quest"}
w[41461]={n="Malevolent Felslate Outcropping",e="LEGION",m=680,t="Mining World Quest"}
w[41481]={n="Brimstone Destroyer",e="LEGION",m=630,t="Mining World Quest"}
w[41482]={n="Brimstone Destroyer",e="LEGION",m=630,t="Mining World Quest"}
w[41483]={n="Brimstone Destroyer",e="LEGION",m=630,t="Mining World Quest"}
w[41484]={n="Brimstone Destroyer",e="LEGION",m=641,t="Mining World Quest"}
w[41486]={n="Brimstone Destroyer",e="LEGION",m=641,t="Mining World Quest"}
w[41487]={n="Brimstone Destroyer",e="LEGION",m=641,t="Mining World Quest"}
w[41488]={n="Brimstone Destroyer",e="LEGION",m=634,t="Mining World Quest"}
w[41489]={n="Brimstone Destroyer",e="LEGION",m=634,t="Mining World Quest"}
w[41490]={n="Brimstone Destroyer",e="LEGION",m=634,t="Mining World Quest"}
w[41491]={n="Brimstone Destroyer",e="LEGION",m=680,t="Mining World Quest"}
w[41492]={n="Brimstone Destroyer",e="LEGION",m=680,t="Mining World Quest"}
w[41493]={n="Brimstone Destroyer",e="LEGION",m=680,t="Mining World Quest"}
w[41495]={n="Brilliant Leystone Seams",e="LEGION",m=630,t="Mining World Quest"}
w[41496]={n="Raw Leystone Seams",e="LEGION",m=641,t="Mining World Quest"}
w[41497]={n="Wild Leystone Seams",e="LEGION",m=634,t="Mining World Quest"}
w[41498]={n="Leystone Basilisks",e="LEGION",m=630,t="Mining World Quest"}
w[41500]={n="Leyworms",e="LEGION",m=630,t="Mining World Quest"}
w[41501]={n="Leystone Basilisks",e="LEGION",m=630,t="Mining World Quest"}
w[41502]={n="Leystone Basilisks",e="LEGION",m=641,t="Mining World Quest"}
w[41503]={n="Leystone Basilisks",e="LEGION",m=641,t="Mining World Quest"}
w[41504]={n="Leystone Basilisks",e="LEGION",m=641,t="Mining World Quest"}
w[41505]={n="Leystone Basilisks",e="LEGION",m=634,t="Mining World Quest"}
w[41506]={n="Leystone Basilisks",e="LEGION",m=634,t="Mining World Quest"}
w[41507]={n="Leystone Basilisks",e="LEGION",m=634,t="Mining World Quest"}
w[41508]={n="Felslate Basilisks",e="LEGION",m=680,t="Mining World Quest"}
w[41509]={n="Felslate Basilisks",e="LEGION",m=680,t="Mining World Quest"}
w[41511]={n="Felwort",e="LEGION",m=650,t="Herbalism World Quest"}
w[41512]={n="Felwort",e="LEGION",m=650,t="Herbalism World Quest"}
w[41513]={n="Felwort",e="LEGION",m=630,t="Herbalism World Quest"}
w[41514]={n="Felwort",e="LEGION",m=630,t="Herbalism World Quest"}
w[41515]={n="Felwort",e="LEGION",m=630,t="Herbalism World Quest"}
w[41516]={n="Felwort",e="LEGION",m=641,t="Herbalism World Quest"}
w[41517]={n="Felwort",e="LEGION",m=641,t="Herbalism World Quest"}
w[41518]={n="Felwort",e="LEGION",m=641,t="Herbalism World Quest"}
w[41519]={n="Felwort",e="LEGION",m=634,t="Herbalism World Quest"}
w[41520]={n="Felwort",e="LEGION",m=634,t="Herbalism World Quest"}
w[41521]={n="Felwort",e="LEGION",m=634,t="Herbalism World Quest"}
w[41522]={n="Felwort",e="LEGION",m=680,t="Herbalism World Quest"}
w[41523]={n="Felwort",e="LEGION",m=680,t="Herbalism World Quest"}
w[41524]={n="Felwort",e="LEGION",m=680,t="Herbalism World Quest"}
w[41525]={n="Wispy Foxflower",e="LEGION",m=650,t="Herbalism World Quest"}
w[41526]={n="Bushy Foxflower",e="LEGION",m=650,t="Herbalism World Quest"}
w[41527]={n="Lively Aethril",e="LEGION",m=630,t="Herbalism World Quest"}
w[41528]={n="Iridescent Aethril",e="LEGION",m=630,t="Herbalism World Quest"}
w[41529]={n="Bushy Aethril",e="LEGION",m=630,t="Herbalism World Quest"}
w[41530]={n="Lively Dreamleaf",e="LEGION",m=641,t="Herbalism World Quest"}
w[41531]={n="Iridescent Dreamleaf",e="LEGION",m=641,t="Herbalism World Quest"}
w[41532]={n="Bushy Dreamleaf",e="LEGION",m=641,t="Herbalism World Quest"}
w[41533]={n="Fragrant Dreamleaf",e="LEGION",m=641,t="Herbalism World Quest"}
w[41534]={n="Brambly Fjarnskaggl",e="LEGION",m=634,t="Herbalism World Quest"}
w[41535]={n="Prickly Fjarnskaggl",e="LEGION",m=634,t="Herbalism World Quest"}
w[41536]={n="Pungent Fjarnskaggl",e="LEGION",m=634,t="Herbalism World Quest"}
w[41537]={n="Lively Starlight Roses",e="LEGION",m=680,t="Herbalism World Quest"}
w[41538]={n="Iridescent Starlight Roses",e="LEGION",m=680,t="Herbalism World Quest"}
w[41539]={n="Sparkling Starlight Roses",e="LEGION",m=680,t="Herbalism World Quest"}
w[41544]={n="Foxflower Cluster",e="LEGION",m=650,t="Herbalism World Quest"}
w[41545]={n="Aethril Cluster",e="LEGION",m=630,t="Herbalism World Quest"}
w[41546]={n="Dreamleaf Cluster",e="LEGION",m=641,t="Herbalism World Quest"}
w[41547]={n="Fjarnskaggl Cluster",e="LEGION",m=634,t="Herbalism World Quest"}
w[41548]={n="Starlight Rose Cluster",e="LEGION",m=680,t="Herbalism World Quest"}
w[41549]={n="Slab of Bacon",e="LEGION",m=650,t="Cooking World Quest"}
w[41550]={n="Slab of Bacon",e="LEGION",m=650,t="Cooking World Quest"}
w[41551]={n="Slab of Bacon",e="LEGION",m=630,t="Cooking World Quest"}
w[41552]={n="Slab of Bacon",e="LEGION",m=630,t="Cooking World Quest"}
w[41553]={n="Slab of Bacon",e="LEGION",m=641,t="Cooking World Quest"}
w[41554]={n="Slab of Bacon",e="LEGION",m=641,t="Cooking World Quest"}
w[41555]={n="Slab of Bacon",e="LEGION",m=634,t="Cooking World Quest"}
w[41556]={n="Slab of Bacon",e="LEGION",m=634,t="Cooking World Quest"}
w[41557]={n="Slab of Bacon",e="LEGION",m=680,t="Cooking World Quest"}
w[41558]={n="Slab of Bacon",e="LEGION",m=680,t="Cooking World Quest"}
w[41560]={n="Felhide",e="LEGION",m=650,t="Skinning World Quest"}
w[41561]={n="Felhide",e="LEGION",m=650,t="Skinning World Quest"}
w[41562]={n="Felhide",e="LEGION",m=630,t="Skinning World Quest"}
w[41563]={n="Felhide",e="LEGION",m=630,t="Skinning World Quest"}
w[41564]={n="Felhide",e="LEGION",m=630,t="Skinning World Quest"}
w[41565]={n="Felhide",e="LEGION",m=641,t="Skinning World Quest"}
w[41566]={n="Felhide",e="LEGION",m=641,t="Skinning World Quest"}
w[41567]={n="Felhide",e="LEGION",m=641,t="Skinning World Quest"}
w[41568]={n="Felhide",e="LEGION",m=634,t="Skinning World Quest"}
w[41569]={n="Felhide",e="LEGION",m=634,t="Skinning World Quest"}
w[41570]={n="Felhide",e="LEGION",m=634,t="Skinning World Quest"}
w[41571]={n="Felhide",e="LEGION",m=680,t="Skinning World Quest"}
w[41572]={n="Felhide",e="LEGION",m=680,t="Skinning World Quest"}
w[41573]={n="Felhide",e="LEGION",m=680,t="Skinning World Quest"}
w[41582]={n="Smooth Sunrunner Hide",e="LEGION",m=630,t="Skinning World Quest"}
w[41596]={n="Lively Highmountain Salmon",e="LEGION",m=650,t="Fishing World Quest"}
w[41597]={n="Lively Highmountain Salmon",e="LEGION",m=650,t="Fishing World Quest"}
w[41598]={n="Lively Cursed Queenfish",e="LEGION",m=630,t="Fishing World Quest"}
w[41599]={n="Lively Cursed Queenfish",e="LEGION",m=630,t="Fishing World Quest"}
w[41600]={n="Lively Mossgill Perch",e="LEGION",m=641,t="Fishing World Quest"}
w[41601]={n="Lively Mossgill Perch",e="LEGION",m=641,t="Fishing World Quest"}
w[41602]={n="Lively Stormrays",e="LEGION",m=634,t="Fishing World Quest"}
w[41603]={n="Lively Stormrays",e="LEGION",m=634,t="Fishing World Quest"}
w[41604]={n="Lively Runescale Koi",e="LEGION",m=680,t="Fishing World Quest"}
w[41605]={n="Lively Runescale Koi",e="LEGION",m=680,t="Fishing World Quest"}
w[41609]={n="Huge Highmountain Salmon",e="LEGION",m=650,t="Fishing World Quest"}
w[41610]={n="Huge Cursed Queenfish",e="LEGION",m=630,t="Fishing World Quest"}
w[41611]={n="Huge Cursed Queenfish",e="LEGION",m=630,t="Fishing World Quest"}
w[41612]={n="Huge Mossgill Perch",e="LEGION",m=641,t="Fishing World Quest"}
w[41613]={n="Huge Mossgill Perch",e="LEGION",m=641,t="Fishing World Quest"}
w[41614]={n="Huge Stormrays",e="LEGION",m=634,t="Fishing World Quest"}
w[41615]={n="Huge Stormrays",e="LEGION",m=634,t="Fishing World Quest"}
w[41616]={n="Huge Runescale Koi",e="LEGION",m=680,t="Fishing World Quest"}
w[41617]={n="Huge Runescale Koi",e="LEGION",m=680,t="Fishing World Quest"}
w[41622]={n="Crawliac's Legacy",e="LEGION",m=650,t="World Quest"}
w[41623]={n="Champions of Highmountain",e="LEGION",m=750,t="World Quest"}
w[41624]={n="Rocko Needs a Shave",e="LEGION",m=650,t="Battle Pet World Quest"}
w[41633]={n="Work Order: Leystone Greaves",e="LEGION",m=630,t="Blacksmithing World Quest"}
w[41634]={n="Work Order: Leystone Armguards",e="LEGION",m=641,t="Blacksmithing World Quest"}
w[41635]={n="Work Order: Leystone Boots",e="LEGION",m=650,t="Blacksmithing World Quest"}
w[41636]={n="Work Order: Leystone Breastplate",e="LEGION",m=634,t="Blacksmithing World Quest"}
w[41637]={n="Work Order: Leystone Pauldrons",e="LEGION",m=680,t="Blacksmithing World Quest"}
w[41638]={n="Work Order: Leystone Gauntlets",e="LEGION",m=627,t="Blacksmithing World Quest"}
w[41639]={n="Work Order: Battlebound Spaulders",e="LEGION",m=630,t="Leatherworking World Quest"}
w[41640]={n="Work Order: Warhide Mask",e="LEGION",m=641,t="Leatherworking World Quest"}
w[41641]={n="Work Order: Battlebound Armbands",e="LEGION",m=650,t="Leatherworking World Quest"}
w[41642]={n="Work Order: Warhide Footpads",e="LEGION",m=634,t="Leatherworking World Quest"}
w[41643]={n="Work Order: Battlebound Leggings",e="LEGION",m=680,t="Leatherworking World Quest"}
w[41644]={n="Work Order: Warhide Gloves",e="LEGION",m=627,t="Leatherworking World Quest"}
w[41645]={n="Work Order: Silkweave Epaulets",e="LEGION",m=630,t="Tailoring World Quest"}
w[41646]={n="Work Order: Silkweave Gloves",e="LEGION",m=641,t="Tailoring World Quest"}
w[41647]={n="Work Order: Silkweave Robe",e="LEGION",m=650,t="Tailoring World Quest"}
w[41648]={n="Work Order: Silkweave Bracers",e="LEGION",m=634,t="Tailoring World Quest"}
w[41649]={n="Work Order: Silkweave Slippers",e="LEGION",m=680,t="Tailoring World Quest"}
w[41650]={n="Work Order: Silkweave Hood",e="LEGION",m=627,t="Tailoring World Quest"}
w[41651]={n="Work Order: Azsunite Pendant",e="LEGION",m=630,t="Jewelcrafting World Quest"}
w[41652]={n="Work Order: Deep Amber Loop",e="LEGION",m=641,t="Jewelcrafting World Quest"}
w[41653]={n="Work Order: Skystone Pendant",e="LEGION",m=650,t="Jewelcrafting World Quest"}
w[41654]={n="Work Order: Queen's Opal Loop",e="LEGION",m=634,t="Jewelcrafting World Quest"}
w[41655]={n="Work Order: Queen's Opal Pendant",e="LEGION",m=680,t="Jewelcrafting World Quest"}
w[41656]={n="Work Order: Azsunite Loop",e="LEGION",m=627,t="Jewelcrafting World Quest"}
w[41657]={n="Work Order: Draughts of Raw Magic",e="LEGION",m=630,t="Alchemy World Quest"}
w[41658]={n="Work Order: Sylvan Elixirs",e="LEGION",m=641,t="Alchemy World Quest"}
w[41659]={n="Work Order: Avalanche Elixirs",e="LEGION",m=650,t="Alchemy World Quest"}
w[41660]={n="Work Order: Skaggldrynk",e="LEGION",m=634,t="Alchemy World Quest"}
w[41661]={n="Work Order: Skystep Potions",e="LEGION",m=680,t="Alchemy World Quest"}
w[41662]={n="Work Order: Ancient Rejuvenation Potions",e="LEGION",m=627,t="Alchemy World Quest"}
w[41663]={n="Vantus Rune Work Order: Elerethe Renferal",e="LEGION",m=630,t="Inscription World Quest"}
w[41664]={n="Vantus Rune Work Order: Dragons of Nightmare",e="LEGION",m=641,t="Inscription World Quest"}
w[41665]={n="Vantus Rune Work Order: Ursoc",e="LEGION",m=650,t="Inscription World Quest"}
w[41666]={n="Vantus Rune Work Order: Nythendra",e="LEGION",m=634,t="Inscription World Quest"}
w[41667]={n="Vantus Rune Work Order: Xavius",e="LEGION",m=680,t="Inscription World Quest"}
w[41668]={n="Vantus Rune Work Order: Il'gynoth, The Heart of Corruption",e="LEGION",m=627,t="Inscription World Quest"}
w[41669]={n="Work Order: Word of Critical Strike",e="LEGION",m=630,t="Enchanting World Quest"}
w[41670]={n="Work Order: Word of Agility",e="LEGION",m=641,t="Enchanting World Quest"}
w[41671]={n="Work Order: Word of Strength",e="LEGION",m=650,t="Enchanting World Quest"}
w[41672]={n="Work Order: Word of Haste",e="LEGION",m=634,t="Enchanting World Quest"}
w[41673]={n="Work Order: Word of Mastery",e="LEGION",m=680,t="Enchanting World Quest"}
w[41674]={n="Work Order: Word of Intellect",e="LEGION",m=627,t="Enchanting World Quest"}
w[41675]={n="Work Order: Blink-Trigger Headgun",e="LEGION",m=630,t="Engineering World Quest"}
w[41676]={n="Work Order: Pump-Action Bandage Gun",e="LEGION",m=641,t="Engineering World Quest"}
w[41677]={n="Work Order: Auto-Hammer",e="LEGION",m=650,t="Engineering World Quest"}
w[41678]={n="Work Order: Gunpack",e="LEGION",m=634,t="Engineering World Quest"}
w[41679]={n="Work Order: Deployable Bullet Dispenser",e="LEGION",m=680,t="Engineering World Quest"}
w[41680]={n="Work Order: Failure Detection Pylon",e="LEGION",m=627,t="Engineering World Quest"}
w[41685]={n="DANGER: Ala'washte",e="LEGION",m=650,t="Rare Elite World Quest"}
w[41686]={n="DANGER: Olokk the Shipbreaker",e="LEGION",m=650,t="Rare Elite World Quest"}
w[41687]={n="Snail Fight!",e="LEGION",m=650,t="Battle Pet World Quest"}
w[41691]={n="Sea of Feathers",e="LEGION",m=650,t="World Quest"}
w[41692]={n="Shipwreck Scavengers",e="LEGION",m=650,t="World Quest"}
w[41695]={n="DANGER: Defilia",e="LEGION",m=650,t="Rare Elite World Quest"}
w[41696]={n="DANGER: Mawat'aki",e="LEGION",m=650,t="Rare Elite World Quest"}
w[41697]={n="DANGER: Colerian, Alteria, and Selenyi",e="LEGION",m=680,t="Rare Elite World Quest"}
w[41699]={n="Crabby Crunchies",e="LEGION",m=650,t="World Quest"}
w[41700]={n="DANGER: Shalas'aman",e="LEGION",m=641,t="Rare Elite World Quest"}
w[41701]={n="Gettin' Tuffer",e="LEGION",m=650,t="World Quest"}
w[41703]={n="DANGER: Ormagrogg",e="LEGION",m=650,t="Rare Elite World Quest"}
w[41705]={n="Assault on Thunder Totem",e="LEGION",m=650,t="World Quest"}
w[41706]={n="Briny Waters",e="LEGION",m=650,t="World Quest"}
w[41757]={n="Echoes of the Earth-warder",e="LEGION",m=650,t="World Quest"}
w[41758]={n="Obsidian Guardians",e="LEGION",m=650,t="World Quest"}
w[41765]={n="[NYI] Hunting Wager",e="LEGION",m=630,t="World Quest"}
w[41766]={n="Wildlife Protection Force",e="LEGION",m=650,t="Battle Pet World Quest"}
w[41789]={n="Return to the Crag",e="LEGION",m=650,t="World Quest"}
w[41794]={n="Drakestalker",e="LEGION",m=634,t="World Quest"}
w[41816]={n="DANGER: Oubdob da Smasher",e="LEGION",m=650,t="Rare Elite World Quest"}
w[41817]={n="Skull of the Taskmaster",e="LEGION",m=650,t="World Quest"}
w[41818]={n="WANTED: Majestic Elderhorn",e="LEGION",m=650,t="World Quest"}
w[41819]={n="WANTED: Gurbog da Basher",e="LEGION",m=650,t="World Quest"}
w[41820]={n="Walk Without Rhythm",e="LEGION",m=650,t="World Quest"}
w[41821]={n="WANTED: Shara Felbreath",e="LEGION",m=650,t="World Quest"}
w[41822]={n="Following his Hoofsteps",e="LEGION",m=650,t="World Quest"}
w[41823]={n="Ashes to Ashes",e="LEGION",m=650,t="World Quest"}
w[41824]={n="WANTED: Arru",e="LEGION",m=650,t="World Quest"}
w[41825]={n="Winged Menace",e="LEGION",m=650,t="World Quest"}
w[41826]={n="WANTED: Crawshuk the Hungry",e="LEGION",m=650,t="World Quest"}
w[41827]={n="The Cat's Meow",e="LEGION",m=650,t="World Quest"}
w[41828]={n="WANTED: Bristlemaul",e="LEGION",m=650,t="World Quest"}
w[41829]={n="The Darkfeather Scout",e="LEGION",m=650,t="World Quest"}
w[41830]={n="Demon's Bite",e="LEGION",t="World Quest"}
w[41832]={n="White Water Terror",e="LEGION",m=650,t="World Quest"}
w[41833]={n="Grmlrml's Last Ride",e="LEGION",m=650,t="World Quest"}
w[41835]={n="Deworming",e="LEGION",m=650,t="World Quest"}
w[41836]={n="WANTED: Bodash the Hoarder",e="LEGION",m=650,t="World Quest"}
w[41837]={n="Rockaway Bully",e="LEGION",m=650,t="World Quest"}
w[41838]={n="WANTED: Slumber",e="LEGION",m=650,t="World Quest"}
w[41842]={n="Bottom of the Food Chain",e="LEGION",m=650,t="World Quest"}
w[41843]={n="Bad Luck, Puck",e="LEGION",m=650,t="World Quest"}
w[41844]={n="WANTED: Sekhan",e="LEGION",m=650,t="World Quest"}
w[41855]={n="Stand Up to Bullies",e="LEGION",m=641,t="Battle Pet World Quest"}
w[41857]={n="Neltharion's Lair: Stonedark Slaves",e="LEGION",m=650,t="Dungeon World Quest"}
w[41860]={n="Dealing with Satyrs",e="LEGION",m=641,t="Battle Pet World Quest"}
w[41861]={n="Meet The Maw",e="LEGION",m=641,t="Battle Pet World Quest"}
w[41862]={n="Only Pets Can Prevent Forest Fires",e="LEGION",m=641,t="Battle Pet World Quest"}
w[41864]={n="Neltharion's Lair: Crystalline Crusher",e="LEGION",m=650,t="Dungeon World Quest"}
w[41865]={n="Neltharion's Lair: Mother of Stone",e="LEGION",m=650,t="Dungeon World Quest"}
w[41866]={n="Neltharion's Lair: Blighted Bat",e="LEGION",m=650,t="Dungeon World Quest"}
w[41881]={n="Fight Night: Heliosus",e="LEGION",m=627,t="Battle Pet World Quest"}
w[41886]={n="Fight Night: Rats!",e="LEGION",m=627,t="Battle Pet World Quest"}
w[41895]={n="The Master of Pets",e="LEGION",m=680,t="Battle Pet World Quest"}
w[41896]={n="Operation Murloc Freedom",e="LEGION",m=630,t="PvP World Quest"}
w[41914]={n="Clear the Catacombs",e="LEGION",m=680,t="Battle Pet World Quest"}
w[41925]={n="Razing Hel",e="LEGION",m=634,t="World Quest"}
w[41926]={n="Returning Champion",e="LEGION",m=634,t="World Quest"}
w[41927]={n="Ruining the Runewood",e="LEGION",m=634,t="World Quest"}
w[41930]={n="Valor Calls",e="LEGION",m=634,t="World Quest"}
w[41931]={n="Mana Tap",e="LEGION",m=680,t="Battle Pet World Quest"}
w[41935]={n="Beasts of Burden",e="LEGION",m=634,t="Battle Pet World Quest"}
w[41936]={n="You Have Been Challenged",e="LEGION",m=634,t="World Quest"}
w[41938]={n="Brothers of Skovald",e="LEGION",m=634,t="World Quest"}
w[41944]={n="Jarrun's Ladder",e="LEGION",m=634,t="Battle Pet World Quest"}
w[41948]={n="All Pets Go to Heaven",e="LEGION",m=634,t="Battle Pet World Quest"}
w[41949]={n="The Drekirjar Return",e="LEGION",m=634,t="World Quest"}
w[41950]={n="Cry More Thunder!",e="LEGION",m=634,t="World Quest"}
w[41955]={n="Bloodline of Stone",e="LEGION",m=641,t="World Quest"}
w[41956]={n="Petrified Acolytes",e="LEGION",m=641,t="World Quest"}
w[41958]={n="Oh, Ominitron",e="LEGION",m=634,t="Battle Pet World Quest"}
w[41961]={n="Black Rook Holdings",e="LEGION",m=641,t="World Quest"}
w[41962]={n="Black Rook Guard",e="LEGION",m=641,t="World Quest"}
w[41964]={n="Poisoned Waters",e="LEGION",m=641,t="World Quest"}
w[41965]={n="Lunarwing Liberation",e="LEGION",m=641,t="World Quest"}
w[41980]={n="Temple Defense",e="LEGION",m=641,t="World Quest"}
w[41983]={n="[NYI] Bear Necessities",e="LEGION",m=650,t="World Quest"}
w[41984]={n="The Creeping Mists",e="LEGION",m=634,t="World Quest"}
w[41990]={n="Chopped",e="LEGION",m=680,t="Battle Pet World Quest"}
w[41992]={n="Twisted Ash",e="LEGION",m=641,t="World Quest"}
w[41995]={n="Dark Corruption",e="LEGION",m=641,t="World Quest"}
w[41996]={n="Tangled Nightmare",e="LEGION",m=641,t="World Quest"}
w[42004]={n="Ghostship",e="LEGION",m=634,t="World Quest"}
w[42013]={n="The Helmouth",e="LEGION",m=634,t="World Quest"}
w[42014]={n="A Tainted Vintage",e="LEGION",m=630,t="World Quest"}
w[42015]={n="Threads of Fate",e="LEGION",m=680,t="Battle Pet World Quest"}
w[42018]={n="Those Beyond Redemption",e="LEGION",m=630,t="World Quest"}
w[42019]={n="Tip the Scales",e="LEGION",m=630,t="World Quest"}
w[42021]={n="Investigation at Mak'rana",e="LEGION",m=630,t="World Quest"}
w[42022]={n="The Broken Academy",e="LEGION",m=630,t="World Quest"}
w[42023]={n="Black Rook Rumble",e="LEGION",m=641,t="PvP World Quest"}
w[42024]={n="A Friend of My Enemy",e="LEGION",m=630,t="Rare Elite World Quest"}
w[42025]={n="Bareback Brawl",e="LEGION",m=634,t="PvP World Quest"}
w[42026]={n="Faronaar in Ruin",e="LEGION",m=630,t="World Quest"}
w[42027]={n="Faronaar in Chaos",e="LEGION",m=630,t="World Quest"}
w[42028]={n="Into the Nightmare",e="LEGION",m=641,t="World Quest"}
w[42062]={n="Fight Night: Stitches Jr. Jr.",e="LEGION",m=627,t="Battle Pet World Quest"}
w[42063]={n="Size Doesn't Matter",e="LEGION",m=630,t="Battle Pet World Quest"}
w[42064]={n="It's Illid... Wait.",e="LEGION",m=650,t="Battle Pet World Quest"}
w[42067]={n="All Howl, No Bite",e="LEGION",m=634,t="Battle Pet World Quest"}
w[42070]={n="Warden Tower Assault: Starstalker's Point",e="LEGION",m=641,t="PvP World Quest"}
w[42071]={n="Honoring the Past",e="LEGION",m=680,t="World Quest"}
w[42075]={n="Botanical Backlash",e="LEGION",m=641,t="World Quest"}
w[42076]={n="Shadowfen Village",e="LEGION",m=641,t="World Quest"}
w[42077]={n="Waking Nightmares",e="LEGION",m=641,t="World Quest"}
w[42080]={n="Bastion of Bradensbrook",e="LEGION",m=641,t="World Quest"}
w[42082]={n="The Shattered Locus",e="LEGION",m=680,t="World Quest"}
w[42086]={n="The Feltotem",e="LEGION",m=650,t="World Quest"}
w[42087]={n="Green Horror",e="LEGION",m=641,t="World Quest"}
w[42089]={n="The Fallen Ones",e="LEGION",m=680,t="World Quest"}
w[42090]={n="Skittering Subjects",e="LEGION",m=680,t="World Quest"}
w[42094]={n="Keepers of the Dream",e="LEGION",m=641,t="World Quest"}
w[42101]={n="Language of the Lost",e="LEGION",m=630,t="World Quest"}
w[42105]={n="Mixology Mix-up",e="LEGION",m=630,t="World Quest"}
w[42108]={n="Rally the Nightwatchers",e="LEGION",m=630,t="World Quest"}
w[42111]={n="Aggressive Reconnaisance",e="LEGION",m=680,t="World Quest"}
w[42112]={n="The Withered Return",e="LEGION",m=630,t="World Quest"}
w[42119]={n="A Cleansing Cocktail",e="LEGION",m=630,t="World Quest"}
w[42123]={n="Reclaiming Llothien",e="LEGION",m=630,t="World Quest"}
w[42124]={n="Hags and Hexes",e="LEGION",m=641,t="World Quest"}
w[42145]={n="Out of the Woodwork",e="LEGION",m=641,t="World Quest"}
w[42146]={n="Dazed and Confused and Adorable",e="LEGION",m=630,t="Battle Pet World Quest"}
w[42148]={n="The Wine's Gone Bad",e="LEGION",m=630,t="Battle Pet World Quest"}
w[42150]={n="Kal'delar Naga Incursion",e="LEGION",m=641,t="World Quest"}
w[42151]={n="Clear the Skies",e="LEGION",m=680,t="World Quest"}
w[42154]={n="Help a Whelp",e="LEGION",m=630,t="Battle Pet World Quest"}
w[42159]={n="Training with the Nightwatchers",e="LEGION",m=630,t="Battle Pet World Quest"}
w[42160]={n="Unwelcome Visitors",e="LEGION",m=630,t="World Quest"}
w[42165]={n="Azsuna Specimens",e="LEGION",m=630,t="Battle Pet World Quest"}
w[42169]={n="Left for Dead",e="LEGION",m=680,t="World Quest"}
w[42172]={n="Leyhollow Infestation",e="LEGION",m=630,t="World Quest"}
w[42173]={n="Electrosnack",e="LEGION",m=634,t="World Quest"}
w[42174]={n="Champions of Elune",e="LEGION",m=641,t="World Quest"}
w[42176]={n="Rise of Skovald",e="LEGION",m=634,t="World Quest"}
w[42177]={n="Reclaiming Morheim",e="LEGION",m=634,t="World Quest"}
w[42178]={n="Shock Absorber",e="LEGION",m=634,t="World Quest"}
w[42182]={n="To Battle!",e="LEGION",m=634,t="World Quest"}
w[42183]={n="To Battle!",e="LEGION",m=634,t="World Quest"}
w[42190]={n="Wildlife Conservationist",e="LEGION",m=641,t="Battle Pet World Quest"}
w[42209]={n="Freeing the Taken",e="LEGION",m=680,t="Rare World Quest"}
w[42211]={n="Leodrath's Kin",e="LEGION",m=630,t="World Quest"}
w[42239]={n="Halls of Valor: The Bear King",e="LEGION",m=634,t="Dungeon World Quest"}
w[42240]={n="Halls of Valor: Ponderous Poaching",e="LEGION",m=634,t="Dungeon World Quest"}
w[42241]={n="Halls of Valor: A Worthy Challenge",e="LEGION",m=634,t="Dungeon World Quest"}
w[42242]={n="Halls of Valor: A Gift for Vethir",e="LEGION",m=634,t="Dungeon World Quest"}
w[42243]={n="Halls of Valor: Deeds of the Past",e="LEGION",m=634,t="Dungeon World Quest"}
w[42269]={n="The Soultakers",e="LEGION",m=634,t="Epic Elite World Quest"}
w[42270]={n="Scourge of the Skies",e="LEGION",m=634,t="Epic Elite World Quest"}
w[42274]={n="Won't Anyone Think of the Whelps?",e="LEGION",m=630,t="World Quest"}
w[42275]={n="Not On My Watch",e="LEGION",m=630,t="World Quest"}
w[42276]={n="Disgusting, but Useful",e="LEGION",m=630,t="World Quest"}
w[42277]={n="Interlopers!",e="LEGION",m=630,t="World Quest"}
w[42442]={n="Fight Night: Amalia",e="LEGION",m=627,t="Battle Pet World Quest"}
w[42506]={n="Tomes of Yore",e="LEGION",m=630,t="World Quest"}
w[42511]={n="Twisted Souls",e="LEGION",m=630,t="World Quest"}
w[42620]={n="WANTED: Arcavellus",e="LEGION",m=630,t="World Quest"}
w[42623]={n="Piracy Doesn't Pay",e="LEGION",m=630,t="World Quest"}
w[42624]={n="Heads of the Fleet",e="LEGION",m=630,t="World Quest"}
w[42631]={n="WANTED: Inquisitor Tivos",e="LEGION",m=630,t="World Quest"}
w[42633]={n="WANTED: Vorthax",e="LEGION",m=630,t="World Quest"}
w[42636]={n="WANTED: Arcanist Shal'iman",e="LEGION",m=630,t="World Quest"}
w[42652]={n="Ancient Exemplars",e="LEGION",m=630,t="Elite World Quest"}
w[42711]={n="The Eternal Mages",e="LEGION",m=630,t="World Quest"}
w[42712]={n="Eye of Azshara: Termination Claws",e="LEGION",m=630,t="Dungeon World Quest"}
w[42713]={n="Eye of Azshara: Slug It Out",e="LEGION",m=630,t="Dungeon World Quest"}
w[42714]={n="Darkheart Thicket: Mythana",e="LEGION",m=641,t="Dungeon World Quest"}
w[42723]={n="Eye of Azshara: A Tough Shell",e="LEGION",m=630,t="Dungeon World Quest"}
w[42725]={n="Sharing the Wealth",e="LEGION",m=680,t="Rare World Quest"}
w[42742]={n="Darkheart Thicket: Rage Rot",e="LEGION",m=641,t="Dungeon World Quest"}
w[42743]={n="Darkheart Thicket: Kudzilla",e="LEGION",m=641,t="Dungeon World Quest"}
w[42744]={n="Darkheart Thicket: Preserving the Preservers",e="LEGION",m=641,t="Dungeon World Quest"}
w[42745]={n="Darkheart Thicket: A Burden to Bear",e="LEGION",m=641,t="Dungeon World Quest"}
w[42746]={n="Eye of Azshara: Dread End",e="LEGION",m=630,t="Dungeon World Quest"}
w[42755]={n="Eye of Azshara: Azsunian Pearls",e="LEGION",m=630,t="Dungeon World Quest"}
w[42757]={n="Maw of Souls: Menace of the Seas",e="LEGION",m=634,t="Dungeon World Quest"}
w[42764]={n="Court of Stars: Wraith in the Machine",e="LEGION",m=680,t="Dungeon World Quest"}
w[42769]={n="Court of Stars: Bring Me the Eyes",e="LEGION",m=680,t="Dungeon World Quest"}
w[42779]={n="The Sleeping Corruption",e="LEGION",m=641,t="Epic Elite World Quest"}
w[42780]={n="Maw of Souls: From Hell's Mouth",e="LEGION",m=634,t="Dungeon World Quest"}
w[42781]={n="Court of Stars: Disarming the Watch",e="LEGION",m=680,t="Dungeon World Quest"}
w[42783]={n="Court of Stars: They Bloom at Night",e="LEGION",m=680,t="Dungeon World Quest"}
w[42784]={n="Court of Stars: The Deceitful Student",e="LEGION",m=680,t="Dungeon World Quest"}
w[42785]={n="DANGER: Den Mother Ylva",e="LEGION",m=634,t="Rare Elite World Quest"}
w[42788]={n="Maw of Souls: Return of the Beast",e="LEGION",m=634,t="Dungeon World Quest"}
w[42795]={n="WANTED: Sanaar",e="LEGION",m=680,t="World Quest"}
w[42796]={n="WANTED: Broodmother Shu'malis",e="LEGION",m=680,t="World Quest"}
w[42797]={n="DANGER: Scythemaster Cil'raman",e="LEGION",m=680,t="Rare Elite World Quest"}
w[42798]={n="DANGER: Huntress Estrid",e="LEGION",m=634,t="Rare Elite World Quest"}
w[42799]={n="DANGER: Oglok the Furious",e="LEGION",m=680,t="Rare Elite World Quest"}
w[42806]={n="DANGER: Fjorlag, the Grave's Chill",e="LEGION",m=634,t="Rare Elite World Quest"}
w[42819]={n="Pocket Wizard",e="LEGION",m=641,t="Epic Elite World Quest"}
w[42820]={n="DANGER: Aegir Wavecrusher",e="LEGION",m=634,t="Rare Elite World Quest"}
w[42830]={n="Pest Management",e="LEGION",m=680,t="Rare World Quest"}
w[42859]={n="A Draught of Hope",e="LEGION",m=680,t="Rare World Quest"}
w[42861]={n="DANGER: Boulderfall, the Eroded",e="LEGION",m=634,t="Rare Elite World Quest"}
w[42864]={n="DANGER: Captain Dargun",e="LEGION",m=634,t="Rare Elite World Quest"}
w[42870]={n="DANGER: Kathaw the Savage",e="LEGION",m=641,t="Rare Elite World Quest"}
w[42880]={n="Meeting their Quota",e="LEGION",m=680,t="Rare World Quest"}
w[42922]={n="Vault of the Wardens: Startup Sequence",e="LEGION",m=630,t="Dungeon World Quest"}
w[42924]={n="Vault of the Wardens: A Grim Matter",e="LEGION",m=630,t="Dungeon World Quest"}
w[42926]={n="Vault of the Wardens: How'd He Get Up There?",e="LEGION",m=630,t="Dungeon World Quest"}
w[42927]={n="DANGER: Malisandra",e="LEGION",m=641,t="Rare Elite World Quest"}
w[42953]={n="DANGER: Soulbinder Halldora",e="LEGION",m=634,t="Rare Elite World Quest"}
w[42962]={n="Secret Correspondence",e="LEGION",m=680,t="Rare World Quest"}
w[42963]={n="DANGER: Rulf Bonesnapper",e="LEGION",m=634,t="Rare Elite World Quest"}
w[42964]={n="DANGER: Lagertha",e="LEGION",m=634,t="Rare Elite World Quest"}
w[42969]={n="A Spy in Our Midst",e="LEGION",m=680,t="Rare World Quest"}
w[42991]={n="DANGER: Runeseer Sigvid",e="LEGION",m=634,t="Rare Elite World Quest"}
w[43027]={n="DANGER: Mortiferous",e="LEGION",m=630,t="Rare Elite World Quest"}
w[43040]={n="DANGER: Valakar the Thirsty",e="LEGION",m=630,t="Rare Elite World Quest"}
w[43059]={n="DANGER: Fjordun",e="LEGION",m=630,t="Rare Elite World Quest"}
w[43063]={n="DANGER: Stormfeather",e="LEGION",m=630,t="Rare Elite World Quest"}
w[43072]={n="DANGER: The Whisperer",e="LEGION",m=630,t="Rare Elite World Quest"}
w[43079]={n="DANGER: Immolian",e="LEGION",m=630,t="Rare Elite World Quest"}
w[43091]={n="DANGER: Arcanor Prime",e="LEGION",m=630,t="Rare Elite World Quest"}
w[43098]={n="DANGER: Marblub the Massive",e="LEGION",m=630,t="Rare Elite World Quest"}
w[43101]={n="DANGER: Witchdoctor Grgl-Brgl",e="LEGION",m=641,t="Rare Elite World Quest"}
w[43121]={n="DANGER: Chief Treasurer Jabrill",e="LEGION",m=630,t="Rare Elite World Quest"}
w[43152]={n="DANGER: Lytheron",e="LEGION",m=641,t="Rare Elite World Quest"}
w[43175]={n="DANGER: Deepclaw",e="LEGION",m=630,t="Rare Elite World Quest"}
w[43183]={n="Warden Tower Assault: Starstalker's Point",e="LEGION",m=641,t="PvP World Quest"}
w[43192]={n="Terror of the Deep",e="LEGION",m=630,t="Epic Elite World Quest"}
w[43193]={n="Calamitous Intent",e="LEGION",m=630,t="Epic Elite World Quest"}
w[43247]={n="Warden Tower Assault: Darkfollow's Spire",e="LEGION",m=641,t="PvP World Quest"}
w[43248]={n="Warden Tower Assault: Darkfollow's Spire",e="LEGION",m=641,t="PvP World Quest"}
w[43324]={n="Rage of the Owlbeasts",e="LEGION",m=641,t="World Quest"}
w[43325]={n="Ley Race",e="LEGION",m=630,t="World Quest"}
w[43326]={n="Scouting",e="LEGION",m=630,t="World Quest"}
w[43327]={n="The Magic of Flight",e="LEGION",m=630,t="World Quest"}
w[43328]={n="Enigmatic",e="LEGION",m=630,t="World Quest"}
w[43330]={n="Fire for Effect",e="LEGION",m=630,t="World Quest"}
w[43332]={n="Grell in a Handbasket",e="LEGION",m=641,t="World Quest"}
w[43333]={n="DANGER: Nylaathria the Forgotten",e="LEGION",m=641,t="Rare Elite World Quest"}
w[43336]={n="Purge of the Nightmare",e="LEGION",m=641,t="World Quest"}
w[43344]={n="DANGER: Aodh Witherpetal",e="LEGION",m=641,t="Rare Elite World Quest"}
w[43345]={n="DANGER: Harbinger of Screams",e="LEGION",m=641,t="Rare Elite World Quest"}
w[43346]={n="DANGER: Ealdis",e="LEGION",m=641,t="Rare Elite World Quest"}
w[43347]={n="DANGER: Rabxach",e="LEGION",m=641,t="Rare Elite World Quest"}
w[43426]={n="WANTED: Brogozog",e="LEGION",m=630,t="World Quest"}
w[43427]={n="WANTED: Infernal Lord",e="LEGION",m=630,t="World Quest"}
w[43428]={n="WANTED: Doomlord Kazrok",e="LEGION",m=630,t="World Quest"}
w[43429]={n="WANTED: Syphonus",e="LEGION",m=630,t="World Quest"}
w[43430]={n="WANTED: Captain Volo'ren",e="LEGION",m=630,t="World Quest"}
w[43431]={n="WANTED: Warbringer Mox'na",e="LEGION",m=630,t="World Quest"}
w[43432]={n="WANTED: Normantis the Deposed",e="LEGION",m=630,t="World Quest"}
w[43434]={n="WANTED: Fathnyr",e="LEGION",m=634,t="World Quest"}
w[43435]={n="The Battle Rages On",e="LEGION",m=680,t="World Quest"}
w[43436]={n="WANTED: Glimar Ironfist",e="LEGION",m=634,t="World Quest"}
w[43437]={n="WANTED: Thane Irglov",e="LEGION",m=634,t="World Quest"}
w[43438]={n="WANTED: Nameless King",e="LEGION",m=634,t="World Quest"}
w[43445]={n="Air Superiority",e="LEGION",m=680,t="World Quest"}
w[43448]={n="The Frozen King",e="LEGION",m=650,t="Epic Elite World Quest"}
w[43450]={n="WANTED: Tiptog the Lost",e="LEGION",m=634,t="World Quest"}
w[43451]={n="WANTED: Urgev the Flayer",e="LEGION",m=634,t="World Quest"}
w[43452]={n="WANTED: Isel the Hammer",e="LEGION",m=634,t="World Quest"}
w[43453]={n="WANTED: Hannval the Butcher",e="LEGION",m=634,t="World Quest"}
w[43454]={n="WANTED: Egyl the Enduring",e="LEGION",m=634,t="World Quest"}
w[43455]={n="WANTED: Devouring Darkness",e="LEGION",m=650,t="World Quest"}
w[43456]={n="WANTED: Skul'vrax",e="LEGION",m=641,t="World Quest"}
w[43457]={n="WANTED: Theryssia",e="LEGION",m=641,t="World Quest"}
w[43458]={n="WANTED: Perrexx",e="LEGION",m=641,t="World Quest"}
w[43459]={n="WANTED: Thondrax",e="LEGION",m=641,t="World Quest"}
w[43460]={n="WANTED: Kiranys Duskwhisper",e="LEGION",m=641,t="World Quest"}
w[43512]={n="Ana-Mouz",e="LEGION",m=680,t="Epic Elite World Quest"}
w[43513]={n="Na'zak the Fiend",e="LEGION",m=680,t="Epic Elite World Quest"}
w[43583]={n="Life Finds a Way",e="LEGION",m=680,t="World Quest"}
w[43598]={n="Warden Tower Assault: Blackhawk's Bulwark",e="LEGION",m=634,t="PvP World Quest"}
w[43599]={n="Warden Tower Assault: Blackhawk's Bulwark",e="LEGION",m=634,t="PvP World Quest"}
w[43600]={n="Warden Tower Assault: Whisperwind's Citadel",e="LEGION",m=634,t="PvP World Quest"}
w[43601]={n="Warden Tower Assault: Whisperwind's Citadel",e="LEGION",m=634,t="PvP World Quest"}
w[43605]={n="WANTED: Arcanist Shal'iman",e="LEGION",m=630,t="Rare World Quest"}
w[43606]={n="WANTED: Arcavellus",e="LEGION",m=630,t="Rare World Quest"}
w[43607]={n="WANTED: Brogozog",e="LEGION",m=630,t="Rare World Quest"}
w[43608]={n="WANTED: Captain Volo'ren",e="LEGION",m=630,t="Rare World Quest"}
w[43609]={n="WANTED: Doomlord Kazrok",e="LEGION",m=630,t="Rare World Quest"}
w[43610]={n="WANTED: Infernal Lord",e="LEGION",m=630,t="Rare World Quest"}
w[43611]={n="WANTED: Inquisitor Tivos",e="LEGION",m=630,t="Rare World Quest"}
w[43612]={n="WANTED: Normantis the Deposed",e="LEGION",m=630,t="Rare World Quest"}
w[43613]={n="WANTED: Syphonus",e="LEGION",m=630,t="Rare World Quest"}
w[43614]={n="WANTED: Vorthax",e="LEGION",m=630,t="Rare World Quest"}
w[43615]={n="WANTED: Warbringer Mox'na",e="LEGION",m=630,t="Rare World Quest"}
w[43616]={n="WANTED: Bodash the Hoarder",e="LEGION",m=650,t="Rare World Quest"}
w[43617]={n="WANTED: Devouring Darkness",e="LEGION",m=650,t="Rare World Quest"}
w[43618]={n="WANTED: Gurbog da Basher",e="LEGION",m=650,t="Rare World Quest"}
w[43619]={n="WANTED: Shara Felbreath",e="LEGION",m=650,t="Rare World Quest"}
w[43620]={n="WANTED: Egyl the Enduring",e="LEGION",m=634,t="Rare World Quest"}
w[43621]={n="WANTED: Fathnyr",e="LEGION",m=634,t="Rare World Quest"}
w[43622]={n="WANTED: Glimar Ironfist",e="LEGION",m=634,t="Rare World Quest"}
w[43623]={n="WANTED: Hannval the Butcher",e="LEGION",m=634,t="Rare World Quest"}
w[43624]={n="WANTED: Isel the Hammer",e="LEGION",m=634,t="Rare World Quest"}
w[43625]={n="WANTED: Nameless King",e="LEGION",m=634,t="Rare World Quest"}
w[43626]={n="WANTED: Thane Irglov",e="LEGION",m=634,t="Rare World Quest"}
w[43627]={n="WANTED: Tiptog the Lost",e="LEGION",m=634,t="Rare World Quest"}
w[43628]={n="WANTED: Urgev the Flayer",e="LEGION",m=634,t="Rare World Quest"}
w[43629]={n="WANTED: Kiranys Duskwhisper",e="LEGION",m=641,t="Rare World Quest"}
w[43630]={n="WANTED: Perrexx",e="LEGION",m=641,t="Rare World Quest"}
w[43631]={n="WANTED: Skul'vrax",e="LEGION",m=641,t="Rare World Quest"}
w[43632]={n="WANTED: Theryssia",e="LEGION",m=641,t="Rare World Quest"}
w[43633]={n="WANTED: Thondrax",e="LEGION",m=641,t="Rare World Quest"}
w[43637]={n="The Arcway: Clogged Drain",e="LEGION",m=680,t="Dungeon World Quest"}
w[43638]={n="The Arcway: Silver Serpent",e="LEGION",m=680,t="Dungeon World Quest"}
w[43639]={n="The Arcway: Arcanist Down",e="LEGION",m=680,t="Dungeon World Quest"}
w[43640]={n="The Arcway: Creeping Suspicions",e="LEGION",m=680,t="Dungeon World Quest"}
w[43641]={n="The Arcway: Wandering Plague",e="LEGION",m=680,t="Dungeon World Quest"}
w[43642]={n="Black Rook Hold: The Sorrow",e="LEGION",m=641,t="Dungeon World Quest"}
w[43709]={n="Seal Clubbing",e="LEGION",m=641,t="World Quest"}
w[43710]={n="Dark Runes",e="LEGION",m=634,t="World Quest"}
w[43711]={n="Black Rook Hold: ... With Fire!",e="LEGION",m=641,t="Dungeon World Quest"}
w[43712]={n="Black Rook Hold: The Mad Arcanist",e="LEGION",m=641,t="Dungeon World Quest"}
w[43714]={n="Black Rook Hold: Worst of the Worst",e="LEGION",m=641,t="Dungeon World Quest"}
w[43721]={n="The Helarjar Have Surfaced",e="LEGION",m=634,t="Rare Elite World Quest"}
w[43722]={n="Sacred Bones",e="LEGION",m=634,t="Rare Elite World Quest"}
w[43738]={n="Coastal Gloom",e="LEGION",m=641,t="World Quest"}
w[43745]={n="Culling the Storm",e="LEGION",m=634,t="Rare Elite World Quest"}
w[43751]={n="Oh, Ship!",e="LEGION",m=634,t="World Quest"}
w[43752]={n="Oh, Ship!",e="LEGION",m=634,t="World Quest"}
w[43753]={n="Ley Race",e="LEGION",m=641,t="World Quest"}
w[43754]={n="Scouting",e="LEGION",m=630,t="World Quest"}
w[43755]={n="The Magic of Flight",e="LEGION",m=641,t="World Quest"}
w[43756]={n="Enigmatic",e="LEGION",m=641,t="World Quest"}
w[43757]={n="Fire for Effect",e="LEGION",m=630,t="World Quest"}
w[43758]={n="Wherever I May Gloam",e="LEGION",m=641,t="World Quest"}
w[43759]={n="Where's the Reef?",e="LEGION",m=641,t="World Quest"}
w[43762]={n="Black Rook Hold: Traitor's Demise",e="LEGION",m=641,t="Dungeon World Quest"}
w[43764]={n="Ley Race",e="LEGION",m=650,t="World Quest"}
w[43765]={n="Scouting",e="LEGION",m=630,t="World Quest"}
w[43766]={n="The Magic of Flight",e="LEGION",m=650,t="World Quest"}
w[43767]={n="Enigmatic",e="LEGION",m=650,t="World Quest"}
w[43768]={n="Fire for Effect",e="LEGION",m=630,t="World Quest"}
w[43769]={n="Ley Race",e="LEGION",m=634,t="World Quest"}
w[43770]={n="Scouting",e="LEGION",m=630,t="World Quest"}
w[43771]={n="The Magic of Flight",e="LEGION",m=634,t="World Quest"}
w[43772]={n="Enigmatic",e="LEGION",m=634,t="World Quest"}
w[43773]={n="Fire for Effect",e="LEGION",m=630,t="World Quest"}
w[43774]={n="Ley Race",e="LEGION",m=680,t="World Quest"}
w[43776]={n="Scouting",e="LEGION",m=630,t="World Quest"}
w[43777]={n="The Magic of Flight",e="LEGION",m=680,t="World Quest"}
w[43778]={n="Enigmatic",e="LEGION",m=680,t="World Quest"}
w[43784]={n="What a Nightmare",e="LEGION",m=641,t="World Quest"}
w[43786]={n="Pesty Nests",e="LEGION",m=634,t="World Quest"}
w[43798]={n="DANGER: Kosumoth the Hungering",e="LEGION",m=790,t="Rare Elite World Quest"}
w[43801]={n="Shell Out Some Pain",e="LEGION",m=790,t="Rare Elite World Quest"}
w[43802]={n="Watery Graves",e="LEGION",m=790,t="Rare Elite World Quest"}
w[43803]={n="A Giant Murloc Problem",e="LEGION",m=790,t="Rare Elite World Quest"}
w[43804]={n="Hate the Hatecoil",e="LEGION",m=790,t="Rare Elite World Quest"}
w[43805]={n="Aquatic Assassination",e="LEGION",m=790,t="Rare Elite World Quest"}
w[43807]={n="Withered Wrangling: Ambervale",e="LEGION",m=680,t="World Quest"}
w[43814]={n="Unspeakable Collaborators",e="LEGION",m=680,t="Rare Elite World Quest"}
w[43827]={n="Stormwing the Portals",e="LEGION",m=634,t="World Quest"}
w[43930]={n="Fiends of Tel'anor",e="LEGION",m=680,t="World Quest"}
w[43932]={n="Forces of Oppression",e="LEGION",m=680,t="Rare World Quest"}
w[43943]={n="Withered Army Training",e="LEGION",m=680,t="World Quest"}
w[43951]={n="An Overdue Debt",e="LEGION",m=634,t="World Quest"}
w[43959]={n="Stelleris Shakedown",e="LEGION",m=680,t="Rare Elite World Quest"}
w[43963]={n="Vampirates!",e="LEGION",m=634,t="World Quest"}
w[43964]={n="A Jarl's Feast",e="LEGION",m=634,t="World Quest"}
w[43985]={n="A Dark Tide",e="LEGION",m=650,t="Epic Elite World Quest"}
w[44002]={n="Undersea Survey",e="LEGION",m=680,t="World Quest"}
w[44010]={n="WANTED: Oreth the Vile",e="LEGION",m=680,t="World Quest"}
w[44011]={n="Lost Wisp",e="LEGION",m=641,t="World Quest"}
w[44012]={n="WANTED: Siegemaster Aedrin",e="LEGION",m=680,t="World Quest"}
w[44013]={n="WANTED: Guardian Thor'el",e="LEGION",m=680,t="World Quest"}
w[44015]={n="WANTED: Mal'Dreth the Corruptor",e="LEGION",m=680,t="World Quest"}
w[44016]={n="WANTED: Cadraeus",e="LEGION",m=680,t="World Quest"}
w[44017]={n="WANTED: Apothecary Faldren",e="LEGION",m=680,t="World Quest"}
w[44018]={n="WANTED: Magister Phaedris",e="LEGION",m=680,t="World Quest"}
w[44019]={n="WANTED: Lieutenant Strathmar",e="LEGION",m=680,t="World Quest"}
w[44021]={n="WANTED: Hertha Grimdottir",e="LEGION",m=680,t="World Quest"}
w[44022]={n="WANTED: Shal'an",e="LEGION",m=680,t="World Quest"}
w[44023]={n="WANTED: Siegemaster Aedrin",e="LEGION",m=680,t="Rare World Quest"}
w[44024]={n="WANTED: Shal'an",e="LEGION",m=680,t="Rare World Quest"}
w[44025]={n="WANTED: Oreth the Vile",e="LEGION",m=680,t="Rare World Quest"}
w[44026]={n="WANTED: Mal'Dreth the Corruptor",e="LEGION",m=680,t="Rare World Quest"}
w[44027]={n="WANTED: Magister Phaedris",e="LEGION",m=680,t="Rare World Quest"}
w[44028]={n="WANTED: Lieutenant Strathmar",e="LEGION",m=680,t="Rare World Quest"}
w[44029]={n="WANTED: Hertha Grimdottir",e="LEGION",m=680,t="Rare World Quest"}
w[44030]={n="WANTED: Guardian Thor'el",e="LEGION",m=680,t="Rare World Quest"}
w[44031]={n="WANTED: Cadraeus",e="LEGION",m=680,t="Rare World Quest"}
w[44032]={n="WANTED: Apothecary Faldren",e="LEGION",m=680,t="Rare World Quest"}
w[44033]={n="Aw, Nuts!",e="LEGION",m=641,t="World Quest"}
w[44044]={n="Felled Experiment",e="LEGION",m=630,t="Rare Elite World Quest"}
w[44048]={n="Nagana Happen",e="LEGION",m=630,t="Rare Elite World Quest"}
w[44049]={n="Evil Has Many Legs",e="LEGION",m=630,t="Rare Elite World Quest"}
w[44050]={n="The Felsworn Must Fall",e="LEGION",m=630,t="Rare Elite World Quest"}
w[44054]={n="Demonicide",e="LEGION",m=630,t="Rare Elite World Quest"}
w[44067]={n="Consolidating Power",e="LEGION",m=680,t="Rare Elite World Quest"}
w[44113]={n="DANGER: Achronos",e="LEGION",m=680,t="Rare Elite World Quest"}
w[44114]={n="DANGER: Magistrix Vilessa",e="LEGION",m=680,t="Rare Elite World Quest"}
w[44118]={n="DANGER: Auditor Esiel",e="LEGION",m=680,t="Rare Elite World Quest"}
w[44119]={n="DANGER: Volshax, Breaker of Will",e="LEGION",m=680,t="Rare Elite World Quest"}
w[44121]={n="DANGER: Az'jatar",e="LEGION",m=680,t="Rare Elite World Quest"}
w[44122]={n="DANGER: Sorallus",e="LEGION",m=680,t="Rare Elite World Quest"}
w[44157]={n="Withered Wrangling: Tel'anor",e="LEGION",m=680,t="World Quest"}
w[44158]={n="Withered Wrangling: Falanaar",e="LEGION",m=680,t="World Quest"}
w[44185]={n="WANTED: Sanaar",e="LEGION",m=680,t="Rare World Quest"}
w[44186]={n="WANTED: Broodmother Shu'malis",e="LEGION",m=680,t="Rare World Quest"}
w[44187]={n="DANGER: Cinderwing",e="LEGION",m=630,t="Rare Elite World Quest"}
w[44189]={n="DANGER: Bestrix",e="LEGION",m=630,t="Rare Elite World Quest"}
w[44190]={n="DANGER: Jade Darkhaven",e="LEGION",m=630,t="Rare Elite World Quest"}
w[44191]={n="DANGER: Karthax",e="LEGION",m=630,t="Rare Elite World Quest"}
w[44192]={n="DANGER: Lysanis Shadesoul",e="LEGION",m=630,t="Rare Elite World Quest"}
w[44193]={n="DANGER: Sea King Tidross",e="LEGION",m=630,t="Rare Elite World Quest"}
w[44194]={n="DANGER: Torrentius",e="LEGION",m=630,t="Rare Elite World Quest"}
w[44287]={n="DEADLY: Withered J'im",e="LEGION",m=630,t="Epic Elite World Quest"}
w[44289]={n="WANTED: Arru",e="LEGION",m=650,t="Rare World Quest"}
w[44290]={n="WANTED: Bristlemaul",e="LEGION",m=650,t="Rare World Quest"}
w[44291]={n="WANTED: Crawshuk the Hungry",e="LEGION",m=650,t="Rare World Quest"}
w[44292]={n="WANTED: Majestic Elderhorn",e="LEGION",m=650,t="Rare World Quest"}
w[44293]={n="WANTED: Slumber",e="LEGION",m=650,t="Rare World Quest"}
w[44294]={n="WANTED: Sekhan",e="LEGION",m=650,t="Rare World Quest"}
w[44298]={n="WANTED: Dreadbog",e="LEGION",m=641,t="World Quest"}
w[44299]={n="WANTED: Darkshade",e="LEGION",m=641,t="World Quest"}
w[44300]={n="WANTED: Seersei",e="LEGION",m=641,t="World Quest"}
w[44301]={n="WANTED: Bahagar",e="LEGION",m=641,t="World Quest"}
w[44302]={n="WANTED: Seersei",e="LEGION",m=641,t="Rare World Quest"}
w[44303]={n="WANTED: Dreadbog",e="LEGION",m=641,t="Rare World Quest"}
w[44304]={n="WANTED: Darkshade",e="LEGION",m=641,t="Rare World Quest"}
w[44305]={n="WANTED: Bahagar",e="LEGION",m=641,t="Rare World Quest"}
w[44730]={n="Ravaged Dreams",e="LEGION",m=641,t="Legion Invasion World Quest"}
w[44737]={n="Helarjar Landing: Grey Shoals",e="LEGION",m=630,t="Rare World Quest"}
w[44744]={n="Lifelines",e="LEGION",m=680,t="Rare World Quest"}
w[44746]={n="Helarjar Landing: Rockaway Coast",e="LEGION",m=650,t="Rare World Quest"}
w[44748]={n="Winged Terrors",e="LEGION",m=646,t="World Quest"}
w[44751]={n="No Soldier Left Behind",e="LEGION",m=646,t="World Quest"}
w[44759]={n="The Vale of Dread",e="LEGION",m=641,t="Legion Invasion World Quest"}
w[44765]={n="Stranglethorn Fishing Extravaganza",e="LEGION",m=210,t="Fishing World Quest"}
w[44769]={n="Arming the Populace",e="LEGION",m=680,t="Rare World Quest"}
w[44776]={n="Feelin' Floppy",e="LEGION",m=650,t="World Quest"}
w[44780]={n="Backlash",e="LEGION",m=680,t="Rare World Quest"}
w[44784]={n="Advanced Wanding",e="LEGION",m=630,t="World Quest"}
w[44786]={n="Midterm: Rune Aptitude",e="LEGION",m=630,t="World Quest"}
w[44788]={n="Work Study: Bestiaries of Azsuna",e="LEGION",m=630,t="World Quest"}
w[44799]={n="Safe Keeping",e="LEGION",m=680,t="Rare World Quest"}
w[44801]={n="Defending Shal'aran",e="LEGION",m=680,t="Rare World Quest"}
w[44802]={n="Ancient Guidance",e="LEGION",m=680,t="Rare World Quest"}
w[44805]={n="In the Thick of It",e="LEGION",m=680,t="Rare World Quest"}
w[44811]={n="Help on the Way",e="LEGION",m=680,t="Rare World Quest"}
w[44812]={n="Running on Empty",e="LEGION",m=680,t="Rare World Quest"}
w[44813]={n="Ley Line Interference",e="LEGION",m=680,t="Rare World Quest"}
w[44815]={n="Sick of the Sycophants",e="LEGION",m=680,t="Rare Elite World Quest"}
w[44816]={n="Continued Exposure",e="LEGION",m=680,t="Rare World Quest"}
w[44817]={n="Stirring the Swarm",e="LEGION",m=680,t="Rare World Quest"}
w[44823]={n="Thunder Totem Cleanup Detail",e="LEGION",m=650,t="World Quest"}
w[44846]={n="Clearing the Path",e="LEGION",m=646,t="Rare World Quest"}
w[44847]={n="Straight From the Source",e="LEGION",m=630,t="World Quest"}
w[44856]={n="Cut the Cattitude",e="LEGION",m=680,t="World Quest"}
w[44857]={n="Not There, Not Then, Not Forever",e="LEGION",m=680,t="World Quest"}
w[44867]={n="Contain their Advance",e="LEGION",m=680,t="Rare World Quest"}
w[44884]={n="Defense of Emerald Bay",e="LEGION",m=641,t="Legion Invasion World Quest"}
w[44892]={n="Snowfeather Swarm!",e="LEGION",m=650,t="Rare World Quest"}
w[44893]={n="Direbeak Swarm!",e="LEGION",m=634,t="Rare World Quest"}
w[44894]={n="Bloodgazer Swarm!",e="LEGION",m=630,t="Rare World Quest"}
w[44895]={n="Sharptalon Swarm!",e="LEGION",m=641,t="Rare World Quest"}
w[44923]={n="Helarjar Landing: Vrekt",e="LEGION",m=634,t="Rare World Quest"}
w[44932]={n="The Nighthold: Ettin Your Foot In The Door",e="LEGION",m=680,t="Raid World Quest"}
w[44933]={n="The Nighthold: Wailing In The Night",e="LEGION",m=680,t="Raid World Quest"}
w[44934]={n="The Nighthold: Creepy Crawlers",e="LEGION",m=680,t="Raid World Quest"}
w[44935]={n="The Nighthold: Gilded Guardian",e="LEGION",m=680,t="Raid World Quest"}
w[44936]={n="The Nighthold: Supply Routes",e="LEGION",m=680,t="Raid World Quest"}
w[44937]={n="The Nighthold: Focused Power",e="LEGION",m=680,t="Raid World Quest"}
w[44938]={n="The Nighthold: Love Tap",e="LEGION",m=680,t="Raid World Quest"}
w[44939]={n="The Nighthold: Seeds of Destruction",e="LEGION",m=680,t="Raid World Quest"}
w[44942]={n="Wind in Their Feathers",e="LEGION",m=634,t="World Quest"}
w[44943]={n="Now That's Just Clawful!",e="LEGION",m=634,t="World Quest"}
w[45032]={n="Like the Wind",e="LEGION",m=680,t="World Quest"}
w[45035]={n="The Call of Battle",e="LEGION",m=646,t="World Quest"}
w[45046]={n="Like the Wind",e="LEGION",m=630,t="World Quest"}
w[45047]={n="Like the Wind",e="LEGION",m=641,t="World Quest"}
w[45048]={n="Like the Wind",e="LEGION",m=650,t="World Quest"}
w[45049]={n="Like the Wind",e="LEGION",m=634,t="World Quest"}
w[45058]={n="Release the Wardens!",e="LEGION",m=630,t="Legion Invasion World Quest"}
w[45068]={n="Barrels o' Fun",e="LEGION",m=680,t="World Quest"}
w[45069]={n="Barrels o' Fun",e="LEGION",m=630,t="World Quest"}
w[45070]={n="Barrels o' Fun",e="LEGION",m=641,t="World Quest"}
w[45071]={n="Barrels o' Fun",e="LEGION",m=650,t="World Quest"}
w[45072]={n="Barrels o' Fun",e="LEGION",m=634,t="World Quest"}
w[45134]={n="The Soul Harvesters",e="LEGION",m=630,t="Legion Invasion World Quest"}
w[45178]={n="Contagion Containment",e="LEGION",m=646,t="Rare World Quest"}
w[45203]={n="Battle for the Ruins",e="LEGION",m=630,t="Legion Invasion World Quest"}
w[45307]={n="Claws for Alarm!",e="LEGION",m=680,t="World Quest"}
w[45358]={n="Contagion Containment",e="LEGION",m=646,t="Rare World Quest"}
w[45379]={n="Treasure Master Iks'reeged",e="LEGION",m=646,t="Rare World Quest"}
w[45390]={n="Souls of the Vrykul",e="LEGION",m=634,t="Legion Invasion World Quest"}
w[45439]={n="An Invasion of... Murlocs?",e="LEGION",m=634,t="Legion Invasion World Quest"}
w[45472]={n="Kraken Eggs",e="LEGION",m=646,t="World Quest"}
w[45473]={n="A Giant Problem",e="LEGION",m=646,t="World Quest"}
w[45520]={n="Behind Enemy Portals",e="LEGION",m=646,t="World Quest"}
w[45531]={n="Creeping Fel",e="LEGION",m=646,t="Rare World Quest"}
w[45541]={n="How Do YOU Like It?!",e="LEGION",m=646,t="Rare World Quest"}
w[45542]={n="Behind Enemy Portals",e="LEGION",m=646,t="World Quest"}
w[45549]={n="Salving the Corruption",e="LEGION",m=646,t="Rare World Quest"}
w[45550]={n="Salving the Corruption",e="LEGION",m=646,t="Rare World Quest"}
w[45559]={n="Behind Enemy Portals",e="LEGION",m=646,t="World Quest"}
w[45626]={n="Set You Up the Bomb!",e="LEGION",m=646,t="Rare World Quest"}
w[45651]={n="The Ruins of Ahn'Qiraj: Ossirian",e="LEGION",m=81,t="Dungeon World Quest"}
w[45653]={n="Kill it with Fire!",e="LEGION",m=646,t="Rare World Quest"}
w[45654]={n="Ahn'Qiraj: C'Thun",e="LEGION",m=81,t="Dungeon World Quest"}
w[45655]={n="The Colossus of Ashi",e="LEGION",m=81,t="Elite World Quest"}
w[45656]={n="Lesser Wind Stones",e="LEGION",m=81,t="World Quest"}
w[45657]={n="Silithyst",e="LEGION",m=81,t="PvP World Quest"}
w[45674]={n="The Colossus of Regal",e="LEGION",m=81,t="Elite World Quest"}
w[45675]={n="The Colossus of Zora",e="LEGION",m=81,t="Elite World Quest"}
w[45694]={n="Arachnicide",e="LEGION",m=646,t="World Quest"}
w[45736]={n="The Ruins of Ahn'Qiraj: Ossirian",e="LEGION",m=81,t="Dungeon World Quest"}
w[45737]={n="Ahn'Qiraj: C'Thun",e="LEGION",m=81,t="Dungeon World Quest"}
w[45738]={n="The Colossus of Ashi",e="LEGION",m=81,t="Elite World Quest"}
w[45739]={n="Lesser Wind Stones",e="LEGION",m=81,t="World Quest"}
w[45740]={n="Silithyst",e="LEGION",m=81,t="PvP World Quest"}
w[45741]={n="The Colossus of Regal",e="LEGION",m=81,t="Elite World Quest"}
w[45742]={n="The Colossus of Zora",e="LEGION",m=81,t="Elite World Quest"}
w[45743]={n="Judgment of Odyn",e="LEGION",m=646,t="Rare World Quest"}
w[45744]={n="Fall of the Felskorn",e="LEGION",m=646,t="Rare World Quest"}
w[45776]={n="Keys are a Crutch",e="LEGION",m=646,t="Rare World Quest"}
w[45786]={n="Feast of the Hounds",e="LEGION",m=634,t="Legion Invasion World Quest"}
w[45791]={n="War Materiel",e="LEGION",m=646,t="World Quest"}
w[45792]={n="Occultist Onslaught",e="LEGION",m=646,t="Rare World Quest"}
w[45793]={n="Occultist Onslaught",e="LEGION",m=646,t="Rare World Quest"}
w[45797]={n="Playing with Green Fire",e="LEGION",m=646,t="World Quest"}
w[45804]={n="Impvasion!",e="LEGION",m=641,t="Legion Invasion World Quest"}
w[45805]={n="The Burning Keys",e="LEGION",m=646,t="Rare World Quest"}
w[45806]={n="Boat Tour",e="LEGION",m=64,t="World Quest"}
w[45807]={n="Garbage Fishing",e="LEGION",m=64,t="World Quest"}
w[45808]={n="Beach Ball Bash",e="LEGION",m=64,t="World Quest"}
w[45809]={n="Grog, Rum, and Ale",e="LEGION",m=64,t="World Quest"}
w[45810]={n="The Gnomes Stole Our Bombs!",e="LEGION",m=64,t="World Quest"}
w[45811]={n="The Goblins Stole Our Bombs!",e="LEGION",m=64,t="World Quest"}
w[45837]={n="Creeping Fel",e="LEGION",m=646,t="Rare World Quest"}
w[45878]={n="Exterminating with Impunity",e="LEGION",m=646,t="World Quest"}
w[45921]={n="Thal'xur",e="LEGION",m=641,t="Legion Invasion Elite World Quest"}
w[45922]={n="Agmozuul",e="LEGION",m=641,t="Legion Invasion Elite World Quest"}
w[45923]={n="Gloth",e="LEGION",m=641,t="Legion Invasion Elite World Quest"}
w[45924]={n="Abyssal Monstrosity",e="LEGION",m=641,t="Legion Invasion Elite World Quest"}
w[45925]={n="Nez'val",e="LEGION",m=641,t="Legion Invasion Elite World Quest"}
w[45926]={n="Zar'teth",e="LEGION",m=641,t="Legion Invasion Elite World Quest"}
w[45927]={n="Zagmothar",e="LEGION",m=641,t="Legion Invasion Elite World Quest"}
w[45928]={n="Gelthrak",e="LEGION",m=641,t="Legion Invasion Elite World Quest"}
w[45929]={n="Purging the Flames",e="LEGION",m=646,t="Rare World Quest"}
w[45930]={n="We Didn't Start the Fire",e="LEGION",m=646,t="Rare World Quest"}
w[45934]={n="Fowl Play",e="LEGION",m=646,t="World Quest"}
w[45969]={n="Defense of the Ancient",e="LEGION",m=646,t="Rare Elite World Quest"}
w[45970]={n="Duty's End",e="LEGION",m=646,t="Elite World Quest"}
w[45973]={n="Unchecked Power",e="LEGION",m=646,t="Rare World Quest"}
w[45977]={n="Where There is a Whip...",e="LEGION",m=646,t="Rare World Quest"}
w[45985]={n="Hellish Scavengers",e="LEGION",m=646,t="World Quest"}
w[45988]={n="Ancient Bones",e="LEGION",m=646,t="World Quest"}
w[46001]={n="Rules of the Hunt",e="LEGION",m=646,t="Rare Elite World Quest"}
w[46006]={n="Arkuthaz",e="LEGION",m=634,t="Legion Invasion Elite World Quest"}
w[46008]={n="Balnazoth",e="LEGION",m=634,t="Legion Invasion Elite World Quest"}
w[46010]={n="Bonecrusher Korgolath",e="LEGION",m=634,t="Legion Invasion Elite World Quest"}
w[46011]={n="Colossal Infernal",e="LEGION",m=634,t="Legion Invasion Elite World Quest"}
w[46012]={n="Fel Commander Urgoz",e="LEGION",m=634,t="Legion Invasion Elite World Quest"}
w[46013]={n="Firecaller Rok'duun",e="LEGION",m=634,t="Legion Invasion Elite World Quest"}
w[46014]={n="Gelthrog",e="LEGION",m=634,t="Legion Invasion Elite World Quest"}
w[46015]={n="Idra'zuul",e="LEGION",m=634,t="Legion Invasion Elite World Quest"}
w[46016]={n="Magdrezoth",e="LEGION",m=634,t="Legion Invasion Elite World Quest"}
w[46017]={n="Shel'drozul",e="LEGION",m=634,t="Legion Invasion Elite World Quest"}
w[46021]={n="Thel'draz",e="LEGION",m=634,t="Legion Invasion Elite World Quest"}
w[46032]={n="The Tormented Return",e="LEGION",m=646,t="Rare World Quest"}
w[46046]={n="Life's a Lich",e="LEGION",m=646,t="Rare World Quest"}
w[46063]={n="The Wailing Dead",e="LEGION",m=646,t="World Quest"}
w[46066]={n="I Fel Bat For You",e="LEGION",m=646,t="Elite World Quest"}
w[46068]={n="Brute Wrangling",e="LEGION",m=646,t="World Quest"}
w[46072]={n="Full Fel",e="LEGION",m=646,t="Rare Elite World Quest"}
w[46073]={n="Break Their Garrison",e="LEGION",m=646,t="World Quest"}
w[46075]={n="Relic Hunting",e="LEGION",m=646,t="World Quest"}
w[46076]={n="Restless Spirits",e="LEGION",m=646,t="Rare World Quest"}
w[46077]={n="Felbound Spirits",e="LEGION",m=646,t="Rare World Quest"}
w[46104]={n="Arachnid Toxicity",e="LEGION",m=646,t="Rare World Quest"}
w[46105]={n="Arachnid Superiority",e="LEGION",m=646,t="Rare World Quest"}
w[46109]={n="Stand!",e="LEGION",m=646,t="Elite World Quest"}
w[46111]={n="Illidari Masters: Sissix",e="LEGION",m=646,t="Battle Pet World Quest"}
w[46112]={n="Illidari Masters: Madam Viciosa",e="LEGION",m=646,t="Battle Pet World Quest"}
w[46113]={n="Illidari Masters: Nameless Mystic",e="LEGION",m=646,t="Battle Pet World Quest"}
w[46116]={n="On Unhallowed Grounds",e="LEGION",m=630,t="Legion Invasion World Quest"}
w[46126]={n="Fel-Corrupted Feathers",e="LEGION",m=646,t="World Quest"}
w[46134]={n="Gemcutter Needed",e="LEGION",m=627,t="Jewelcrafting World Quest"}
w[46135]={n="Gemcutter Needed",e="LEGION",m=627,t="Jewelcrafting World Quest"}
w[46136]={n="Gemcutter Needed",e="LEGION",m=627,t="Jewelcrafting World Quest"}
w[46137]={n="Gemcutter Needed",e="LEGION",m=627,t="Jewelcrafting World Quest"}
w[46138]={n="Gemcutter Needed",e="LEGION",m=627,t="Jewelcrafting World Quest"}
w[46139]={n="Gemcutter Needed",e="LEGION",m=627,t="Jewelcrafting World Quest"}
w[46146]={n="The Burning Shores",e="LEGION",m=630,t="Legion Invasion World Quest"}
w[46160]={n="The Shackled Void",e="LEGION",m=646,t="World Quest"}
w[46161]={n="Felcaller Thalezra",e="LEGION",m=630,t="Legion Invasion Elite World Quest"}
w[46162]={n="Subjugator Val'rek",e="LEGION",m=630,t="Legion Invasion Elite World Quest"}
w[46163]={n="Thaz'gul",e="LEGION",m=630,t="Legion Invasion Elite World Quest"}
w[46164]={n="Mal'serus",e="LEGION",m=630,t="Legion Invasion Elite World Quest"}
w[46165]={n="Kazruul",e="LEGION",m=630,t="Legion Invasion Elite World Quest"}
w[46166]={n="Garthulak the Crusher",e="LEGION",m=630,t="Legion Invasion Elite World Quest"}
w[46167]={n="Kozrum",e="LEGION",m=630,t="Legion Invasion Elite World Quest"}
w[46168]={n="Commander Vorlax",e="LEGION",m=630,t="Legion Invasion Elite World Quest"}
w[46169]={n="Dro'zek",e="LEGION",m=630,t="Legion Invasion Elite World Quest"}
w[46170]={n="Thar'gokk",e="LEGION",m=630,t="Legion Invasion Elite World Quest"}
w[46175]={n="Rolling Thunder",e="LEGION",m=646,t="World Quest"}
w[46179]={n="Crushing the Legion",e="LEGION",m=634,t="Legion Invasion World Quest"}
w[46180]={n="Power of Our Enemy",e="LEGION",m=646,t="World Quest"}
w[46183]={n="Commander Zarthak",e="LEGION",m=650,t="Legion Invasion Elite World Quest"}
w[46184]={n="Gelgothar",e="LEGION",m=650,t="Legion Invasion Elite World Quest"}
w[46185]={n="Iroxus",e="LEGION",m=650,t="Legion Invasion Elite World Quest"}
w[46186]={n="Ix'dreloth",e="LEGION",m=650,t="Legion Invasion Elite World Quest"}
w[46187]={n="Larthogg",e="LEGION",m=650,t="Legion Invasion Elite World Quest"}
w[46188]={n="Orgrokk",e="LEGION",m=650,t="Legion Invasion Elite World Quest"}
w[46189]={n="Shel'zuul",e="LEGION",m=650,t="Legion Invasion Elite World Quest"}
w[46190]={n="Ulgrom",e="LEGION",m=650,t="Legion Invasion Elite World Quest"}
w[46191]={n="Balinar",e="LEGION",m=650,t="Legion Invasion Elite World Quest"}
w[46192]={n="Zar'vok",e="LEGION",m=650,t="Legion Invasion Elite World Quest"}
w[46193]={n="Borne of Fel",e="LEGION",m=650,t="Legion Invasion World Quest"}
w[46194]={n="Wolves of the Legion",e="LEGION",m=650,t="Legion Invasion World Quest"}
w[46195]={n="Swarming Skies",e="LEGION",m=650,t="Legion Invasion World Quest"}
w[46196]={n="Class Dismissed",e="LEGION",m=650,t="Legion Invasion World Quest"}
w[46197]={n="From the Skies They Fel",e="LEGION",m=650,t="Legion Invasion World Quest"}
w[46198]={n="Gems of Destruction",e="LEGION",m=646,t="World Quest"}
w[46201]={n="By Water Be Purged",e="LEGION",m=646,t="World Quest"}
w[46209]={n="A Flare In The Dark",e="LEGION",m=646,t="Rare World Quest"}
w[46212]={n="Get Them Up",e="LEGION",m=646,t="Rare World Quest"}
w[46216]={n="Congealed Corruption",e="LEGION",m=634,t="Legion Invasion World Quest"}
w[46236]={n="Stonebound Soldiers",e="LEGION",m=646,t="World Quest"}
w[46261]={n="The Taste of Corruption",e="LEGION",m=641,t="Legion Invasion World Quest"}
w[46262]={n="Save the Tadpoles!",e="LEGION",m=650,t="Legion Invasion World Quest"}
w[46263]={n="Weaving Fel Webs",e="LEGION",m=630,t="Legion Invasion World Quest"}
w[46264]={n="Their Eyes Are Upon Us",e="LEGION",m=634,t="Legion Invasion World Quest"}
w[46265]={n="The Fel and the Fawns",e="LEGION",m=641,t="Legion Invasion World Quest"}
w[46279]={n="Zargrom",e="LEGION",m=650,t="Legion Invasion Elite World Quest"}
w[46288]={n="Everyone to the Front",e="LEGION",m=646,t="Rare Elite World Quest"}
w[46308]={n="Leave a Trail",e="LEGION",m=646,t="Rare World Quest"}
w[46325]={n="The United Front",e="LEGION",m=646,t="Elite World Quest"}
w[46360]={n="Simply Stunning",e="LEGION",m=646,t="Rare World Quest"}
w[46500]={n="Tomb of Sargeras: Legend of the Deep",e="LEGION",m=646,t="Raid World Quest"}
w[46502]={n="Tomb of Sargeras: Hand of the Legion",e="LEGION",m=646,t="Raid World Quest"}
w[46503]={n="Tomb of Sargeras: A Lesson in Pain",e="LEGION",m=646,t="Raid World Quest"}
w[46504]={n="Tomb of Sargeras: Crushing Depths",e="LEGION",m=646,t="Raid World Quest"}
w[46505]={n="Tomb of Sargeras: Lost But Not Forgotten",e="LEGION",m=646,t="Raid World Quest"}
w[46506]={n="Tomb of Sargeras: Life After Death",e="LEGION",m=646,t="Raid World Quest"}
w[46507]={n="Tomb of Sargeras: The Dread Stalker",e="LEGION",m=646,t="Raid World Quest"}
w[46508]={n="Tomb of Sargeras: Azshara's Reach",e="LEGION",m=646,t="Raid World Quest"}
w[46707]={n="Minion! Kill That One Too!",e="LEGION",m=646,t="World Quest"}
w[46750]={n="Battery Backup",e="LEGION",m=646,t="Rare World Quest"}
w[46752]={n="On Borrowed Wings",e="LEGION",m=646,t="Rare World Quest"}
w[46754]={n="Magical Beasts",e="LEGION",m=646,t="Rare World Quest"}
w[46755]={n="Mission: Felraging",e="LEGION",m=646,t="Rare World Quest"}
w[46756]={n="Mission: Felrage Destruction",e="LEGION",m=646,t="Rare World Quest"}
w[46761]={n="Brew Bandits",e="LEGION",m=646,t="Rare World Quest"}
w[46762]={n="Storm Brew Hustle",e="LEGION",m=646,t="Rare World Quest"}
w[46763]={n="Drol'maz",e="LEGION",m=641,t="Legion Invasion Elite World Quest"}
w[46766]={n="Ulgthax",e="LEGION",m=641,t="Legion Invasion Elite World Quest"}
w[46811]={n="The Broodmother's Wrath",e="LEGION",m=646,t="Rare World Quest"}
w[46814]={n="Call of the Frostwyrm",e="LEGION",m=646,t="Rare World Quest"}
w[46817]={n="Infernal Downfall",e="LEGION",m=646,t="Rare World Quest"}
w[46821]={n="Creepy Crawlies",e="LEGION",m=646,t="World Quest"}
w[46822]={n="Natural Selection",e="LEGION",m=646,t="Rare World Quest"}
w[46825]={n="Mud Mucking",e="LEGION",m=646,t="World Quest"}
w[46829]={n="Elemental Abuse",e="LEGION",m=646,t="Rare World Quest"}
w[46833]={n="Nature Unshackled",e="LEGION",m=646,t="Rare World Quest"}
w[46844]={n="Cathedral of Eternal Night: Mistress of Blades",e="LEGION",m=646,t="Legionfall Dungeon World Quest"}
w[46865]={n="Cathedral of Eternal Night: Mother of Flame",e="LEGION",m=646,t="Legionfall Dungeon World Quest"}
w[46866]={n="Torture Chamber",e="LEGION",m=646,t="World Quest"}
w[46867]={n="Cathedral of Eternal Night: Fel Beast",e="LEGION",m=646,t="Legionfall Dungeon World Quest"}
w[46868]={n="Cathedral of Eternal Night: Infernal Dead",e="LEGION",m=646,t="Legionfall Dungeon World Quest"}
w[46869]={n="Cathedral of Eternal Night: Temptress of Pain",e="LEGION",m=646,t="Legionfall Dungeon World Quest"}
w[46932]={n="A Tad More Corruption",e="LEGION",m=646,t="World Quest"}
w[46933]={n="Felrglrglrglrgl",e="LEGION",m=646,t="World Quest"}
w[46942]={n="The Cost of Power",e="LEGION",m=646,t="World Quest"}
w[46945]={n="Si'vash",e="LEGION",m=646,t="Legionfall World Quest"}
w[46947]={n="Brutallus",e="LEGION",m=646,t="Legionfall World Quest"}
w[46948]={n="Malificus",e="LEGION",m=646,t="Legionfall World Quest"}
w[47061]={n="Apocron",e="LEGION",m=646,t="Legionfall World Quest"}
w[47132]={n="Fel Fire and Ice",e="LEGION",m=646,t="World Quest"}
w[47135]={n="For Their Own Good",e="LEGION",m=882,t="World Quest"}
w[47456]={n="Calming the Void",e="LEGION",m=882,t="World Quest"}
w[47496]={n="Bunker Buster",e="LEGION",m=830,t="World Quest"}
w[47507]={n="Khazaduum",e="LEGION",m=830,t="Rare Elite World Quest"}
w[47542]={n="Siegemaster Voraan",e="LEGION",m=830,t="Rare Elite World Quest"}
w[47551]={n="Lessons of Fire and Pain",e="LEGION",m=830,t="World Quest"}
w[47552]={n="Mistress Il'thendra",e="LEGION",m=885,t="Rare Elite World Quest"}
w[47561]={n="Blistermaw",e="LEGION",m=885,t="Rare Elite World Quest"}
w[47563]={n="Spirits of the Fallen",e="LEGION",m=830,t="World Quest"}
w[47566]={n="Gar'zoth",e="LEGION",m=885,t="Rare Elite World Quest"}
w[47624]={n="Bury It",e="LEGION",m=830,t="World Quest"}
w[47625]={n="The Ritual We Share",e="LEGION",m=830,t="World Quest"}
w[47646]={n="Rope Around",e="LEGION",m=830,t="World Quest"}
w[47704]={n="Ranishu Feeding Frenzy",e="BFA",m=864,t="World Quest"}
w[47705]={n="Behind Legion Lines",e="LEGION",m=882,t="World Quest"}
w[47707]={n="Melting Down",e="LEGION",m=830,t="World Quest"}
w[47712]={n="The Devastator",e="LEGION",m=830,t="World Quest"}
w[47720]={n="Eternal Vengeance",e="LEGION",m=830,t="World Quest"}
w[47724]={n="Besieged",e="LEGION",m=830,t="World Quest"}
w[47728]={n="Talestra the Vile",e="LEGION",m=830,t="Rare Elite World Quest"}
w[47828]={n="Memories of the Fallen",e="LEGION",m=882,t="World Quest"}
w[47833]={n="Shadowcaster Voruun",e="LEGION",m=882,t="Rare Elite World Quest"}
w[47842]={n="Asheva: Defiled Pools",e="LEGION",t="World Quest"}
w[47844]={n="Recurring Madness",e="LEGION",m=882,t="World Quest"}
w[47858]={n="Security: Engaged",e="LEGION",m=882,t="World Quest"}
w[47875]={n="Irixus: Legion Shipyard",e="LEGION",t="World Quest"}
w[47876]={n="Sholoth: Slave Pits",e="LEGION",t="World Quest"}
w[47953]={n="Tereck the Selector",e="LEGION",m=830,t="Rare Elite World Quest"}
w[48091]={n="Vagath the Betrayed",e="LEGION",m=830,t="Rare Elite World Quest"}
w[48094]={n="Void Clot",e="LEGION",m=882,t="World Quest"}
w[48095]={n="Dark Experimentation",e="LEGION",m=882,t="World Quest"}
w[48096]={n="Core Mechanics",e="LEGION",m=882,t="World Quest"}
w[48097]={n="Gatekeeper's Review: Cunning",e="LEGION",m=882,t="World Quest"}
w[48098]={n="Garden Pests",e="LEGION",m=882,t="World Quest"}
w[48099]={n="Hostile Echology",e="LEGION",m=882,t="World Quest"}
w[48100]={n="The Defense of Eredath",e="LEGION",m=882,t="World Quest"}
w[48101]={n="Bully Pulpit",e="LEGION",m=882,t="World Quest"}
w[48102]={n="Scale Samples",e="LEGION",m=882,t="World Quest"}
w[48103]={n="Gatekeeper's Review: Tenacity",e="LEGION",m=882,t="World Quest"}
w[48105]={n="Peer Review",e="LEGION",m=882,t="World Quest"}
w[48106]={n="No Love Lost",e="LEGION",m=882,t="World Quest"}
w[48175]={n="Hidden in the Hollows",e="LEGION",m=882,t="World Quest"}
w[48192]={n="Tar Spitter",e="LEGION",m=830,t="Rare Elite World Quest"}
w[48282]={n="Imp Mother Laglath",e="LEGION",m=830,t="Rare Elite World Quest"}
w[48284]={n="Reap the Fields",e="LEGION",m=830,t="World Quest"}
w[48285]={n="Aerial Superiority",e="LEGION",m=830,t="World Quest"}
w[48286]={n="Crystal Methods",e="LEGION",m=830,t="World Quest"}
w[48287]={n="Harvesters of Sorrow",e="LEGION",m=830,t="World Quest"}
w[48318]={n="Work Order: Lightblood Elixirs",e="LEGION",m=830,t="Alchemy World Quest"}
w[48323]={n="Work Order: Tears of the Naaru",e="LEGION",m=830,t="Alchemy World Quest"}
w[48337]={n="Work Order: Astral Glory",e="LEGION",m=830,t="Herbalism World Quest"}
w[48338]={n="Supplies Needed: Astral Glory",e="LEGION",m=830,t="World Quest"}
w[48349]={n="Work Order: Empyrium",e="LEGION",m=885,t="Mining World Quest"}
w[48358]={n="Supplies Needed: Empyrium",e="LEGION",m=885,t="World Quest"}
w[48359]={n="Work Order: Fiendish Leather",e="LEGION",m=885,t="Skinning World Quest"}
w[48360]={n="Supplies Needed: Fiendish Leather",e="LEGION",m=885,t="World Quest"}
w[48363]={n="Work Order: Florid Malachite",e="LEGION",m=885,t="Jewelcrafting World Quest"}
w[48364]={n="Work Order: Hesselian",e="LEGION",m=885,t="Jewelcrafting World Quest"}
w[48373]={n="Work Order: Lightweave Cloth",e="LEGION",m=885,t="Tailoring World Quest"}
w[48374]={n="Supplies Needed: Lightweave Cloth",e="LEGION",m=885,t="World Quest"}
w[48386]={n="Jed'hin Tournament",e="LEGION",m=882,t="World Quest"}
w[48465]={n="Vrax'thul",e="LEGION",m=885,t="Rare Elite World Quest"}
w[48466]={n="Ven'orn",e="LEGION",m=885,t="Rare Elite World Quest"}
w[48467]={n="Puscilla",e="LEGION",m=885,t="Rare Elite World Quest"}
w[48502]={n="Naroua, King of the Forest",e="LEGION",m=830,t="Rare Elite World Quest"}
w[48509]={n="Commander Sathrenael",e="LEGION",m=830,t="Rare Elite World Quest"}
w[48510]={n="Commander Vecaya",e="LEGION",m=830,t="Rare Elite World Quest"}
w[48511]={n="Commander Endaxis",e="LEGION",m=830,t="Rare Elite World Quest"}
w[48512]={n="Sister Subversia",e="LEGION",m=830,t="Rare Elite World Quest"}
w[48514]={n="Slumbering Behemoths",e="LEGION",m=885,t="Rare World Quest"}
w[48526]={n="Scuttled",e="LEGION",m=885,t="Rare World Quest"}
w[48592]={n="Holding the Spire",e="LEGION",m=830,t="World Quest"}
w[48614]={n="Woeful Implications",e="LEGION",m=830,t="World Quest"}
w[48615]={n="War Never Changes",e="LEGION",m=830,t="World Quest"}
w[48624]={n="Who Let The Dogs Out?",e="LEGION",m=885,t="Rare World Quest"}
w[48637]={n="Cleansing Fire",e="LEGION",m=885,t="Rare World Quest"}
w[48640]={n="The Immortal Squadron",e="LEGION",m=885,t="Rare World Quest"}
w[48662]={n="Short Fuses",e="LEGION",m=885,t="Rare World Quest"}
w[48691]={n="Soul Chain",e="LEGION",m=885,t="Rare World Quest"}
w[48694]={n="Soultwisted Monstrosity",e="LEGION",m=882,t="Rare Elite World Quest"}
w[48696]={n="Wrangler Kravos",e="LEGION",m=882,t="Rare Elite World Quest"}
w[48698]={n="Kaara the Pale",e="LEGION",m=882,t="Rare Elite World Quest"}
w[48701]={n="Baruut the Bloodthirsty",e="LEGION",m=882,t="Rare Elite World Quest"}
w[48722]={n="Feasel the Muffin Thief",e="LEGION",m=882,t="Rare Elite World Quest"}
w[48723]={n="Vigilant Thanos",e="LEGION",m=882,t="Rare Elite World Quest"}
w[48724]={n="Vigilant Kuro",e="LEGION",m=882,t="Rare Elite World Quest"}
w[48725]={n="Venomtail Skyfin",e="LEGION",m=882,t="Rare Elite World Quest"}
w[48726]={n="Turek the Lucid",e="LEGION",m=882,t="Rare Elite World Quest"}
w[48727]={n="Captain Faruq",e="LEGION",m=882,t="Rare Elite World Quest"}
w[48728]={n="Umbraliss",e="LEGION",m=882,t="Rare Elite World Quest"}
w[48729]={n="Ataxon",e="LEGION",m=882,t="Rare Elite World Quest"}
w[48730]={n="Sorolis the Ill-Fated",e="LEGION",m=882,t="Rare Elite World Quest"}
w[48731]={n="Herald of Chaos",e="LEGION",m=882,t="Rare Elite World Quest"}
w[48732]={n="Sabuul",e="LEGION",m=882,t="Rare Elite World Quest"}
w[48733]={n="Jed'hin Champion Vorusk",e="LEGION",m=882,t="Rare Elite World Quest"}
w[48734]={n="Overseer Y'Beda",e="LEGION",m=882,t="Rare Elite World Quest"}
w[48735]={n="Overseer Y'Sorna",e="LEGION",m=882,t="Rare Elite World Quest"}
w[48736]={n="Overseer Y'Morna",e="LEGION",m=882,t="Rare Elite World Quest"}
w[48737]={n="Instructor Tarahna",e="LEGION",m=882,t="Rare Elite World Quest"}
w[48738]={n="Zul'tan the Numerous",e="LEGION",m=882,t="Rare Elite World Quest"}
w[48739]={n="Commander Xethgar",e="LEGION",m=882,t="Rare Elite World Quest"}
w[48740]={n="Skreeg the Devourer",e="LEGION",m=882,t="Rare Elite World Quest"}
w[48777]={n="Den of Fiends",e="LEGION",m=885,t="Rare World Quest"}
w[48780]={n="Gladius",e="LEGION",m=885,t="Rare World Quest"}
w[48783]={n="Nobody Expects Them",e="LEGION",m=885,t="Rare World Quest"}
w[48827]={n="Varga",e="LEGION",m=885,t="Rare Elite World Quest"}
w[48828]={n="Lieutenant Xakaar",e="LEGION",m=885,t="Rare Elite World Quest"}
w[48829]={n="Wrath-Lord Yarez",e="LEGION",m=885,t="Rare Elite World Quest"}
w[48830]={n="Inquisitor Vethroz",e="LEGION",m=885,t="Rare Elite World Quest"}
w[48831]={n="Commander Texlaz",e="LEGION",m=885,t="Rare Elite World Quest"}
w[48832]={n="Admiral Rel'var",e="LEGION",m=885,t="Rare Elite World Quest"}
w[48833]={n="Ritual Completion",e="LEGION",m=885,t="Elite World Quest"}
w[48834]={n="Worldsplitter Skuul",e="LEGION",m=885,t="Rare Elite World Quest"}
w[48835]={n="Houndmaster Kerrax",e="LEGION",m=885,t="Rare Elite World Quest"}
w[48836]={n="Watcher Aival",e="LEGION",m=885,t="Rare Elite World Quest"}
w[48837]={n="All-Seer Xanarian",e="LEGION",m=885,t="Rare Elite World Quest"}
w[48866]={n="Void Warden Valsuran",e="LEGION",m=885,t="Rare Elite World Quest"}
w[48867]={n="Chief Alchemist Munculus",e="LEGION",m=885,t="Rare Elite World Quest"}
w[48875]={n="Mix It Up",e="LEGION",m=885,t="Rare World Quest"}
w[48931]={n="Behemoths Awakened",e="LEGION",m=885,t="Elite World Quest"}
w[48936]={n="Slithon the Last",e="LEGION",m=882,t="Rare Elite World Quest"}
w[48951]={n="Seat of the Triumvirate: Voidmaw",e="LEGION",m=882,t="Dungeon World Quest"}
w[48952]={n="Throw Them a Bone",e="LEGION",m=885,t="Rare World Quest"}
w[48953]={n="Seat of the Triumvirate: Darkcaller",e="LEGION",m=882,t="Dungeon World Quest"}
w[48957]={n="Seat of the Triumvirate: Void-Blade Zedaat",e="LEGION",m=882,t="Dungeon World Quest"}
w[48958]={n="Ritual Interruption",e="LEGION",m=885,t="Rare World Quest"}
w[48959]={n="Seat of the Triumvirate: Dark Fissures",e="LEGION",m=882,t="Dungeon World Quest"}
w[48983]={n="Mining Regulation",e="LEGION",m=885,t="Rare World Quest"}
w[48985]={n="Seat of the Triumvirate: Twilight-Harbinger Tharuul",e="LEGION",m=882,t="Dungeon World Quest"}
w[49013]={n="A Jolt of Power",e="BFA",m=864,t="World Quest"}
w[49041]={n="Ruinhoof",e="LEGION",m=830,t="Battle Pet World Quest"}
w[49042]={n="Foulclaw",e="LEGION",m=830,t="Battle Pet World Quest"}
w[49043]={n="Baneglow",e="LEGION",m=830,t="Battle Pet World Quest"}
w[49044]={n="Retch",e="LEGION",m=830,t="Battle Pet World Quest"}
w[49045]={n="Deathscreech",e="LEGION",m=830,t="Battle Pet World Quest"}
w[49046]={n="Gnasher",e="LEGION",m=830,t="Battle Pet World Quest"}
w[49047]={n="Bucky",e="LEGION",m=882,t="Battle Pet World Quest"}
w[49048]={n="Snozz",e="LEGION",m=882,t="Battle Pet World Quest"}
w[49049]={n="Gloamwing",e="LEGION",m=882,t="Battle Pet World Quest"}
w[49050]={n="Shadeflicker",e="LEGION",m=882,t="Battle Pet World Quest"}
w[49051]={n="Corrupted Blood of Argus",e="LEGION",m=882,t="Battle Pet World Quest"}
w[49052]={n="Mar'cuus",e="LEGION",m=882,t="Battle Pet World Quest"}
w[49053]={n="Watcher",e="LEGION",m=885,t="Battle Pet World Quest"}
w[49054]={n="Bloat",e="LEGION",m=885,t="Battle Pet World Quest"}
w[49055]={n="Earseeker",e="LEGION",m=885,t="Battle Pet World Quest"}
w[49056]={n="Pilfer",e="LEGION",m=885,t="Battle Pet World Quest"}
w[49057]={n="Minixis",e="LEGION",m=885,t="Battle Pet World Quest"}
w[49058]={n="One-of-Many",e="LEGION",m=885,t="Battle Pet World Quest"}
w[49068]={n="Quelling the Cove",e="BFA",m=862,t="World Quest"}
w[49345]={n="Buried Treasure",e="BFA",m=864,t="World Quest"}
w[49397]={n="Sausage Party",e="BFA",m=896,t="World Quest"}
w[49413]={n="Scamps With Scrolls",e="BFA",m=862,t="World Quest"}
w[49444]={n="Underfoot",e="BFA",m=862,t="World Quest"}
w[49800]={n="Atal'Dazar: Spiders!",e="BFA",m=862,t="Dungeon World Quest"}
w[49809]={n="Atal'Dazar: From the Shadows",e="BFA",m=862,t="Dungeon World Quest"}
w[49888]={n="Atal'Dazar: A Little Mojo",e="BFA",m=862,t="Dungeon World Quest"}
w[49994]={n="Sliding with Style",e="BFA",m=895,t="World Quest"}
w[50000]={n="Beastly Dealings",e="BFA",m=896,t="World Quest"}
w[50164]={n="Polly Want A Cracker?",e="BFA",m=895,t="World Quest"}
w[50234]={n="Crews of Freehold",e="BFA",m=895,t="World Quest"}
w[50287]={n="Unending Gorilla Warfare",e="BFA",m=862,t="World Quest"}
w[50295]={n="Like Pulling Teeth",e="BFA",m=895,t="World Quest"}
w[50296]={n="Billy Goat Barber",e="BFA",m=895,t="World Quest"}
w[50299]={n="Gryphon Wranglin'",e="BFA",m=895,t="World Quest"}
w[50315]={n="Not On the Itinerary",e="BFA",m=895,t="World Quest"}
w[50322]={n="A Feathery Fad",e="BFA",m=895,t="World Quest"}
w[50324]={n="Picturesque Fizzsprings Resort",e="BFA",m=895,t="World Quest"}
w[50369]={n="Bruin Potions",e="BFA",m=896,t="World Quest"}
w[50421]={n="Sparring on the Spar",e="BFA",m=895,t="World Quest"}
w[50443]={n="Down to the Roots",e="BFA",m=863,t="World Quest"}
w[50459]={n="Vugthuth",e="BFA",m=863,t="Rare Elite World Quest"}
w[50461]={n="Zujothgul",e="BFA",m=863,t="Rare Elite World Quest"}
w[50468]={n="Shul-Nagruth",e="BFA",m=863,t="Rare Elite World Quest"}
w[50474]={n="The Other Side",e="BFA",m=863,t="World Quest"}
w[50483]={n="Underlord Xerxiz",e="BFA",m=863,t="Rare Elite World Quest"}
w[50488]={n="Ancient Jawbreaker",e="BFA",m=863,t="Rare World Quest"}
w[50489]={n="Xu'ba",e="BFA",m=863,t="Rare World Quest"}
w[50490]={n="Uroku the Bound",e="BFA",m=863,t="Rare World Quest"}
w[50491]={n="Corpse Bringer Yal'kar",e="BFA",m=863,t="Rare World Quest"}
w[50492]={n="Cursed Chest",e="BFA",m=863,t="Rare World Quest"}
w[50496]={n="Glompmaw",e="BFA",m=863,t="Rare World Quest"}
w[50497]={n="Krag'wa's Favor",e="BFA",m=863,t="World Quest"}
w[50498]={n="Gutrip",e="BFA",m=863,t="Rare World Quest"}
w[50499]={n="Gwugnug",e="BFA",m=863,t="Rare World Quest"}
w[50501]={n="Queen Tzxi'kik",e="BFA",m=863,t="Rare World Quest"}
w[50502]={n="Jax'teb the Reanimated",e="BFA",m=863,t="Rare World Quest"}
w[50503]={n="Juba the Scarred",e="BFA",m=863,t="Rare World Quest"}
w[50505]={n="Kal'draxa",e="BFA",m=863,t="Rare World Quest"}
w[50506]={n="King Kooba",e="BFA",m=863,t="Rare World Quest"}
w[50507]={n="Krubbs",e="BFA",m=863,t="Rare World Quest"}
w[50509]={n="Lo'kuno",e="BFA",m=863,t="Rare World Quest"}
w[50510]={n="Overstuffed Saurolisk",e="BFA",m=863,t="Rare World Quest"}
w[50511]={n="Bajiatha",e="BFA",m=863,t="Rare World Quest"}
w[50512]={n="Scout Skrasniss",e="BFA",m=863,t="Rare World Quest"}
w[50513]={n="Tainted Guardian",e="BFA",m=863,t="Rare World Quest"}
w[50514]={n="Totem Maker Jash'ga",e="BFA",m=863,t="Rare World Quest"}
w[50515]={n="Venomjaw",e="BFA",m=863,t="Rare World Quest"}
w[50516]={n="Wardrummer Zurula",e="BFA",m=863,t="Rare World Quest"}
w[50517]={n="Mala'kili and Rohnkor",e="BFA",m=863,t="Rare World Quest"}
w[50518]={n="Zanxib",e="BFA",m=863,t="Rare World Quest"}
w[50519]={n="Za'amar",e="BFA",m=863,t="Rare World Quest"}
w[50521]={n="Scorched Earth",e="BFA",m=863,t="World Quest"}
w[50524]={n="Purify the Temple",e="BFA",m=862,t="World Quest"}
w[50527]={n="Behind Mogu Lines",e="BFA",m=862,t="World Quest"}
w[50529]={n="The Spirits Within",e="BFA",m=863,t="World Quest"}
w[50540]={n="Rally the Rastari",e="BFA",m=862,t="World Quest"}
w[50545]={n="Forked Lightning",e="BFA",m=863,t="World Quest"}
w[50547]={n="Knives of Zul",e="BFA",m=862,t="World Quest"}
w[50548]={n="Enforcing the Will of the King",e="BFA",m=862,t="World Quest"}
w[50549]={n="Absolutely Barbaric",e="BFA",m=863,t="World Quest"}
w[50559]={n="Getting Out of Hand",e="BFA",m=863,t="World Quest"}
w[50564]={n="Azerite Infused Slag",e="BFA",m=863,t="Rare World Quest"}
w[50566]={n="Lost Scroll",e="BFA",m=863,t="Rare World Quest"}
w[50568]={n="Chag's Challenge",e="BFA",m=863,t="Rare World Quest"}
w[50570]={n="Azerite Infused Elemental",e="BFA",m=863,t="Rare World Quest"}
w[50571]={n="Eggstermination",e="BFA",m=862,t="World Quest"}
w[50572]={n="Bloody Intrusion",e="BFA",m=863,t="World Quest"}
w[50574]={n="Preservation Methods",e="BFA",m=862,t="World Quest"}
w[50577]={n="Unaccounted For",e="BFA",m=863,t="World Quest"}
w[50578]={n="Bring Ruin Again",e="BFA",m=862,t="World Quest"}
w[50581]={n="Scrolls and Scales",e="BFA",m=862,t="World Quest"}
w[50587]={n="Nagative Feedback",e="BFA",m=863,t="World Quest"}
w[50591]={n="Son of a Bee",e="BFA",m=942,t="World Quest"}
w[50592]={n="Tiny Terror",e="BFA",m=862,t="World Quest"}
w[50619]={n="What Goes Up",e="BFA",m=862,t="World Quest"}
w[50633]={n="Pterrible Ingredients",e="BFA",m=862,t="World Quest"}
w[50634]={n="Save Our Scrolls!",e="BFA",m=863,t="World Quest"}
w[50636]={n="Ravoracious",e="BFA",m=862,t="World Quest"}
w[50648]={n="Bubbles and Trouble",e="BFA",m=863,t="World Quest"}
w[50650]={n="Smashing Zalamar",e="BFA",m=863,t="World Quest"}
w[50651]={n="Cut Off Potential",e="BFA",m=862,t="World Quest"}
w[50652]={n="Biting the Hand that Feeds Them",e="BFA",m=862,t="World Quest"}
w[50660]={n="Survival Strategy",e="BFA",m=863,t="World Quest"}
w[50665]={n="Cancel the Blood Troll Apocalypse",e="BFA",m=863,t="World Quest"}
w[50667]={n="Past Due",e="BFA",m=863,t="World Quest"}
w[50676]={n="River Toll",e="BFA",m=863,t="World Quest"}
w[50689]={n="It's the Pits",e="BFA",m=863,t="World Quest"}
w[50695]={n="It's Never Time for Cannibalism",e="BFA",m=863,t="World Quest"}
w[50717]={n="Don't Stalk Me, Troll",e="BFA",m=863,t="World Quest"}
w[50718]={n="Agent of Death",e="BFA",m=863,t="World Quest"}
w[50735]={n="Burial Detail",e="BFA",m=863,t="World Quest"}
w[50737]={n="Silence the Speakers",e="BFA",m=1165,t="World Quest"}
w[50744]={n="Refresh Their Memory",e="BFA",m=1165,t="World Quest"}
w[50747]={n="No Good Amani",e="BFA",m=862,t="World Quest"}
w[50756]={n="Subterranean Evacuation",e="BFA",m=862,t="World Quest"}
w[50765]={n="Herding Children",e="BFA",m=862,t="World Quest"}
w[50767]={n="The Scrimshaw Gang",e="BFA",m=895,t="World Quest"}
w[50776]={n="False Prophets",e="BFA",m=895,t="World Quest"}
w[50782]={n="Word on the Streets",e="BFA",m=862,t="World Quest"}
w[50786]={n="Revenge of Krag'wa",e="BFA",m=863,t="World Quest"}
w[50792]={n="Taking Bribes",e="BFA",m=895,t="World Quest"}
w[50813]={n="Cargo Reclamation",e="BFA",m=863,t="World Quest"}
w[50845]={n="Kul'krazahn",e="BFA",m=1165,t="Rare World Quest"}
w[50846]={n="Headhunter Lee'za",e="BFA",m=862,t="Rare Elite World Quest"}
w[50847]={n="Twisted Child of Rezan",e="BFA",m=862,t="Rare Elite World Quest"}
w[50848]={n="Brgl-Lrgl the Basher",e="BFA",t="Rare Elite World Quest"}
w[50849]={n="Witch Doctor Habra'du",e="BFA",t="Rare Elite World Quest"}
w[50850]={n="Tia'Kawan",e="BFA",m=862,t="Rare Elite World Quest"}
w[50851]={n="Mor'fani the Exile",e="BFA",t="Rare Elite World Quest"}
w[50852]={n="Lady Seirine",e="BFA",t="Rare Elite World Quest"}
w[50853]={n="Umbra'rix",e="BFA",m=862,t="Rare Elite World Quest"}
w[50854]={n="Crimsonclaw",e="BFA",m=862,t="Rare World Quest"}
w[50855]={n="Old R'gal",e="BFA",m=1165,t="Rare Elite World Quest"}
w[50857]={n="Golrakahn",e="BFA",m=862,t="Rare World Quest"}
w[50858]={n="Sky Queen",e="BFA",m=862,t="Rare World Quest"}
w[50859]={n="Kandak",e="BFA",m=862,t="Rare World Quest"}
w[50861]={n="Torraske the Eternal",e="BFA",m=862,t="Rare World Quest"}
w[50862]={n="Bloodbulge",e="BFA",m=862,t="Rare World Quest"}
w[50863]={n="Avatar of Xolotal",e="BFA",m=862,t="Rare World Quest"}
w[50864]={n="Atal'zul Gotaka",e="BFA",m=862,t="Rare World Quest"}
w[50866]={n="Zayoos",e="BFA",m=862,t="Rare World Quest"}
w[50867]={n="Tambano",e="BFA",m=862,t="Rare World Quest"}
w[50868]={n="Bramblewing",e="BFA",m=862,t="Rare World Quest"}
w[50869]={n="Kiboku",e="BFA",m=862,t="Rare World Quest"}
w[50870]={n="G'Naat",e="BFA",m=862,t="Rare World Quest"}
w[50871]={n="Daggerjaw",e="BFA",m=862,t="Rare World Quest"}
w[50872]={n="Warcrawler Karkithiss",e="BFA",m=862,t="Rare World Quest"}
w[50873]={n="Strange Egg",e="BFA",m=862,t="Rare World Quest"}
w[50874]={n="Hakbi the Risen",e="BFA",m=862,t="Rare World Quest"}
w[50875]={n="Darkspeaker Jo'la",e="BFA",m=862,t="Rare World Quest"}
w[50876]={n="Murderbeak",e="BFA",m=862,t="Rare World Quest"}
w[50877]={n="Gahz'ralka",e="BFA",m=862,t="Rare World Quest"}
w[50885]={n="Lei-zhi",e="BFA",m=862,t="Rare World Quest"}
w[50899]={n="Don't Stalk Me, Troll",e="BFA",m=863,t="World Quest"}
w[50936]={n="Survival Strategy",e="BFA",m=863,t="World Quest"}
w[50957]={n="Wrath of Rezan",e="BFA",m=862,t="World Quest"}
w[50958]={n="Watch Your Wallets",e="BFA",m=895,t="World Quest"}
w[50961]={n="Save Our Scrolls!",e="BFA",m=863,t="World Quest"}
w[50962]={n="Cargo Reclamation",e="BFA",m=863,t="World Quest"}
w[50964]={n="Ritual Combat",e="BFA",m=862,t="World Quest"}
w[50966]={n="Cleanup Crew",e="BFA",m=862,t="World Quest"}
w[50969]={n="Emergency Management",e="BFA",m=862,t="World Quest"}
w[50975]={n="Azerite Mining",e="BFA",m=864,t="Magni World Quest - Azerite"}
w[50977]={n="Smuggler Shakedown",e="BFA",m=895,t="World Quest"}
w[50981]={n="Work Order: Riverbud",e="BFA",m=942,t="Herbalism World Quest"}
w[50982]={n="Work Order: Star Moss",e="BFA",m=942,t="Herbalism World Quest"}
w[50983]={n="Work Order: Akunda's Bite",e="BFA",m=895,t="Herbalism World Quest"}
w[50984]={n="Work Order: Winter's Kiss",e="BFA",m=895,t="Herbalism World Quest"}
w[50985]={n="Work Order: Siren's Pollen",e="BFA",m=896,t="Herbalism World Quest"}
w[50986]={n="Work Order: Sea Stalk",e="BFA",m=896,t="Herbalism World Quest"}
w[50987]={n="Work Order: Monelite Ore",e="BFA",m=896,t="Mining World Quest"}
w[50989]={n="Work Order: Storm Silver Ore",e="BFA",m=942,t="Mining World Quest"}
w[50991]={n="Work Order: Blood-Stained Bone",e="BFA",m=896,t="Skinning World Quest"}
w[50992]={n="Work Order: Calcified Bone",e="BFA",m=895,t="Skinning World Quest"}
w[50993]={n="Work Order: Coarse Leather",e="BFA",m=942,t="Skinning World Quest"}
w[50994]={n="Work Order: Tempest Hide",e="BFA",m=896,t="Skinning World Quest"}
w[50995]={n="Work Order: Shimmerscale",e="BFA",m=895,t="Skinning World Quest"}
w[50996]={n="Work Order: Mistscale",e="BFA",m=942,t="Skinning World Quest"}
w[50997]={n="Work Order: Tidespray Linen",e="BFA",m=942,t="Tailoring World Quest"}
w[50998]={n="Work Order: Deep Sea Satin",e="BFA",m=895,t="Tailoring World Quest"}
w[50999]={n="Work Order: Riverbud",e="BFA",m=862,t="Herbalism World Quest"}
w[51000]={n="Work Order: Star Moss",e="BFA",m=862,t="Herbalism World Quest"}
w[51002]={n="Work Order: Akunda's Bite",e="BFA",m=864,t="Herbalism World Quest"}
w[51003]={n="Work Order: Winter's Kiss",e="BFA",m=864,t="Herbalism World Quest"}
w[51004]={n="Work Order: Siren's Pollen",e="BFA",m=863,t="Herbalism World Quest"}
w[51005]={n="Work Order: Sea Stalk",e="BFA",m=863,t="Herbalism World Quest"}
w[51006]={n="Work Order: Monelite Ore",e="BFA",m=863,t="Mining World Quest"}
w[51007]={n="Work Order: Storm Silver Ore",e="BFA",m=864,t="Mining World Quest"}
w[51008]={n="Work Order: Blood-Stained Bone",e="BFA",m=864,t="Skinning World Quest"}
w[51009]={n="Work Order: Calcified Bone",e="BFA",m=863,t="Skinning World Quest"}
w[51010]={n="Work Order: Coarse Leather",e="BFA",m=862,t="Skinning World Quest"}
w[51011]={n="Work Order: Tempest Hide",e="BFA",m=864,t="Skinning World Quest"}
w[51012]={n="Work Order: Shimmerscale",e="BFA",m=863,t="Skinning World Quest"}
w[51013]={n="Work Order: Mistscale",e="BFA",m=862,t="Skinning World Quest"}
w[51014]={n="Work Order: Tidespray Linen",e="BFA",m=862,t="Tailoring World Quest"}
w[51015]={n="Work Order: Deep Sea Satin",e="BFA",m=863,t="Tailoring World Quest"}
w[51017]={n="Supplies Needed: Monelite Ore",e="BFA",m=1161,t="World Quest"}
w[51021]={n="Supplies Needed: Storm Silver Ore",e="BFA",m=1161,t="World Quest"}
w[51022]={n="Supplies Needed: Riverbud",e="BFA",m=1161,t="World Quest"}
w[51023]={n="Supplies Needed: Star Moss",e="BFA",m=1161,t="World Quest"}
w[51024]={n="Supplies Needed: Akunda's Bite",e="BFA",m=1161,t="World Quest"}
w[51025]={n="Supplies Needed: Winter's Kiss",e="BFA",m=1161,t="World Quest"}
w[51026]={n="Supplies Needed: Siren's Pollen",e="BFA",m=1161,t="World Quest"}
w[51027]={n="Supplies Needed: Sea Stalk",e="BFA",m=1161,t="World Quest"}
w[51028]={n="Supplies Needed: Blood-Stained Bone",e="BFA",m=1161,t="World Quest"}
w[51029]={n="Supplies Needed: Calcified Bone",e="BFA",m=1161,t="World Quest"}
w[51030]={n="Supplies Needed: Coarse Leather",e="BFA",m=1161,t="World Quest"}
w[51031]={n="Supplies Needed: Tempest Hide",e="BFA",m=1161,t="World Quest"}
w[51032]={n="Supplies Needed: Shimmerscale",e="BFA",m=1161,t="World Quest"}
w[51033]={n="Supplies Needed: Mistscale",e="BFA",m=1161,t="World Quest"}
w[51034]={n="Supplies Needed: Tidespray Linen",e="BFA",m=1161,t="World Quest"}
w[51035]={n="Supplies Needed: Deep Sea Satin",e="BFA",m=1161,t="World Quest"}
w[51036]={n="Supplies Needed: Riverbud",e="BFA",m=1165,t="World Quest"}
w[51037]={n="Supplies Needed: Star Moss",e="BFA",m=1165,t="World Quest"}
w[51038]={n="Supplies Needed: Akunda's Bite",e="BFA",m=1165,t="World Quest"}
w[51039]={n="Supplies Needed: Winter's Kiss",e="BFA",m=1165,t="World Quest"}
w[51040]={n="Supplies Needed: Siren's Pollen",e="BFA",m=1165,t="World Quest"}
w[51041]={n="Supplies Needed: Sea Stalk",e="BFA",m=1165,t="World Quest"}
w[51042]={n="Supplies Needed: Monelite Ore",e="BFA",m=1165,t="World Quest"}
w[51043]={n="Supplies Needed: Storm Silver Ore",e="BFA",m=1165,t="World Quest"}
w[51044]={n="Supplies Needed: Blood-Stained Bone",e="BFA",m=1165,t="World Quest"}
w[51045]={n="Supplies Needed: Calcified Bone",e="BFA",m=1165,t="World Quest"}
w[51046]={n="Supplies Needed: Coarse Leather",e="BFA",m=1165,t="World Quest"}
w[51047]={n="Supplies Needed: Tempest Hide",e="BFA",m=1165,t="World Quest"}
w[51048]={n="Supplies Needed: Shimmerscale",e="BFA",m=1165,t="World Quest"}
w[51049]={n="Supplies Needed: Mistscale",e="BFA",m=1165,t="World Quest"}
w[51050]={n="Supplies Needed: Tidespray Linen",e="BFA",m=1165,t="World Quest"}
w[51051]={n="Supplies Needed: Deep Sea Satin",e="BFA",m=1165,t="World Quest"}
w[51064]={n="Azerite Wounds",e="BFA",m=863,t="Magni World Quest - Azerite"}
w[51081]={n="Syrawon the Dominus",e="BFA",m=862,t="Rare World Quest"}
w[51084]={n="Dark Chronicler",e="BFA",m=862,t="Rare World Quest"}
w[51090]={n="Picturesque Norwington Estate",e="BFA",m=895,t="World Quest"}
w[51092]={n="Picturesque Boralus",e="BFA",m=1161,t="World Quest"}
w[51095]={n="Ashmane",e="BFA",m=864,t="Rare World Quest"}
w[51096]={n="Azer'tor",e="BFA",m=864,t="Rare World Quest"}
w[51097]={n="Bloated Krolusk",e="BFA",m=864,t="Rare World Quest"}
w[51098]={n="Commodore Calhoun",e="BFA",m=864,t="Rare World Quest"}
w[51099]={n="Gut-Gut the Glutton",e="BFA",m=864,t="Rare World Quest"}
w[51100]={n="Jumbo Sandsnapper",e="BFA",m=864,t="Rare World Quest"}
w[51102]={n="Kamid the Trapper",e="BFA",m=864,t="Rare World Quest"}
w[51103]={n="Nez'ara",e="BFA",m=864,t="Rare World Quest"}
w[51104]={n="Skycaller Teskris",e="BFA",m=864,t="Rare World Quest"}
w[51105]={n="Ak'tar",e="BFA",m=864,t="Rare World Quest"}
w[51106]={n="Songstress Nahjeen",e="BFA",m=864,t="Rare World Quest"}
w[51107]={n="Scaleclaw Broodmother",e="BFA",m=864,t="Rare World Quest"}
w[51108]={n="Hivemother Kraxi",e="BFA",m=864,t="Rare World Quest"}
w[51109]={n="Scorched Earth",e="BFA",m=863,t="World Quest"}
w[51112]={n="Warbringer Hozzik",e="BFA",m=864,t="Rare World Quest"}
w[51113]={n="Warlord Zothix",e="BFA",m=864,t="Rare World Quest"}
w[51114]={n="Warmother Captive",e="BFA",m=864,t="Rare World Quest"}
w[51115]={n="Zunashi the Exile",e="BFA",m=864,t="Rare World Quest"}
w[51116]={n="Skycarver Krakit",e="BFA",m=864,t="Rare World Quest"}
w[51117]={n="Bajiani the Slick",e="BFA",m=864,t="Rare World Quest"}
w[51118]={n="Bloodwing Bonepicker",e="BFA",m=864,t="Rare World Quest"}
w[51119]={n="Vathikur",e="BFA",m=864,t="Rare World Quest"}
w[51120]={n="Stef \"Marrow\" Quin",e="BFA",m=864,t="Rare World Quest"}
w[51121]={n="Enraged Krolusk",e="BFA",m=864,t="Rare World Quest"}
w[51122]={n="Scorpox",e="BFA",m=864,t="Rare World Quest"}
w[51123]={n="Sirokar",e="BFA",m=864,t="Rare World Quest"}
w[51124]={n="Relic Hunter Hazaak",e="BFA",m=864,t="Rare World Quest"}
w[51125]={n="Jungleweb Hunter",e="BFA",m=864,t="Rare World Quest"}
w[51127]={n="Getting Out of Hand",e="BFA",m=863,t="World Quest"}
w[51131]={n="Absolutely Barbaric",e="BFA",m=863,t="World Quest"}
w[51153]={n="Mor'fani the Exile",e="BFA",m=864,t="Rare Elite World Quest"}
w[51154]={n="Past Due",e="BFA",m=863,t="World Quest"}
w[51155]={n="Brgl-Lrgl the Basher",e="BFA",m=864,t="Rare Elite World Quest"}
w[51156]={n="Fangcaller Xorreth",e="BFA",m=864,t="Rare Elite World Quest"}
w[51157]={n="Golanar",e="BFA",m=864,t="Rare Elite World Quest"}
w[51166]={n="Down to the Roots",e="BFA",m=863,t="World Quest"}
w[51172]={n="Forked Lightning",e="BFA",m=863,t="World Quest"}
w[51173]={n="Sandfishing",e="BFA",m=864,t="World Quest"}
w[51174]={n="Instructions Not Included",e="BFA",m=864,t="World Quest"}
w[51175]={n="Azerite Wounds",e="BFA",m=862,t="Magni World Quest - Azerite"}
w[51176]={n="Unaccounted For",e="BFA",m=863,t="World Quest"}
w[51178]={n="Hundred Troll Holdout",e="BFA",m=862,t="World Quest"}
w[51179]={n="Azerite Madness",e="BFA",m=862,t="Magni World Quest - Azerite"}
w[51180]={n="Instructions Not Included",e="BFA",m=864,t="World Quest"}
w[51181]={n="Instructions Not Included",e="BFA",m=864,t="World Quest"}
w[51185]={n="Azerite Empowerment",e="BFA",m=864,t="Magni World Quest - Azerite"}
w[51198]={n="Fertilizer Duty",e="BFA",m=864,t="World Quest"}
w[51210]={n="Blast Back the Siege",e="BFA",m=864,t="World Quest"}
w[51212]={n="Waycrest Manor: Witchy Kitchen",e="BFA",m=896,t="Dungeon World Quest"}
w[51213]={n="Waycrest Manor: No need to Hag-gle",e="BFA",m=896,t="Dungeon World Quest"}
w[51216]={n="Waycrest Manor: Something to Crow About",e="BFA",m=896,t="Dungeon World Quest"}
w[51223]={n="Walking on Broken Glass",e="BFA",m=864,t="World Quest"}
w[51225]={n="Albatrocity",e="BFA",m=895,t="World Quest"}
w[51228]={n="Instant Meat, Ready to Eat",e="BFA",m=864,t="World Quest"}
w[51232]={n="Hundred Troll Holdout",e="BFA",m=862,t="World Quest"}
w[51238]={n="Abandoned in the Burrows",e="BFA",m=864,t="World Quest"}
w[51239]={n="Instructions Not Included",e="BFA",m=864,t="World Quest"}
w[51241]={n="The Bear Witch Project",e="BFA",m=895,t="World Quest"}
w[51245]={n="I'm a Lumberjack and I'm Okay",e="BFA",m=895,t="World Quest"}
w[51250]={n="Buzz Off!",e="BFA",m=864,t="World Quest"}
w[51252]={n="Kiro's Desert Flower",e="BFA",m=864,t="World Quest"}
w[51284]={n="Falcon Hunt",e="BFA",m=895,t="World Quest"}
w[51285]={n="Feeding Frenzy",e="BFA",m=864,t="World Quest"}
w[51287]={n="Tol Dagor: Sealed Supplies",e="BFA",m=1169,t="Dungeon World Quest"}
w[51296]={n="Tol Dagor: The Overseer's Pride",e="BFA",m=1169,t="Dungeon World Quest"}
w[51297]={n="Tol Dagor: Shorefront Property",e="BFA",m=1169,t="Dungeon World Quest"}
w[51311]={n="Energizing Extract",e="BFA",m=895,t="World Quest"}
w[51315]={n="Wild Flutterbies",e="BFA",m=864,t="World Quest"}
w[51316]={n="Walking in a Spiderweb",e="BFA",m=864,t="World Quest"}
w[51317]={n="Grounding the Grimestone",e="BFA",m=895,t="World Quest"}
w[51318]={n="Go for the Boat",e="BFA",m=895,t="World Quest"}
w[51322]={n="Wings and Stingers",e="BFA",m=864,t="World Quest"}
w[51330]={n="Resilient Seeds",e="BFA",m=864,t="World Quest"}
w[51333]={n="Anchors Aweigh!",e="BFA",m=895,t="World Quest"}
w[51373]={n="Ears Everywhere",e="BFA",m=862,t="World Quest"}
w[51374]={n="Unending Gorilla Warfare",e="BFA",m=862,t="World Quest"}
w[51377]={n="Temple of Sethraliss: Ecological Research",e="BFA",m=864,t="Dungeon World Quest"}
w[51378]={n="Temple of Sethraliss: A Bazaar Menagerie",e="BFA",m=864,t="Dungeon World Quest"}
w[51379]={n="Temple of Sethraliss: Navigating Currents",e="BFA",m=864,t="Dungeon World Quest"}
w[51385]={n="A Supply of Stingers",e="BFA",m=895,t="World Quest"}
w[51388]={n="Stopping the Infestation",e="BFA",m=895,t="World Quest"}
w[51397]={n="Up In Your Drill",e="BFA",m=896,t="World Quest"}
w[51405]={n="Corruption in the Bay",e="BFA",m=895,t="World Quest"}
w[51406]={n="The Lord's Hunt",e="BFA",m=895,t="World Quest"}
w[51411]={n="Azerite Mining",e="BFA",m=863,t="Magni World Quest - Azerite"}
w[51412]={n="Azerite Empowerment",e="BFA",m=863,t="Magni World Quest - Azerite"}
w[51415]={n="Azerite Madness",e="BFA",m=863,t="Magni World Quest - Azerite"}
w[51422]={n="Azerite Madness",e="BFA",m=864,t="Magni World Quest - Azerite"}
w[51428]={n="Azerite Wounds",e="BFA",m=864,t="Magni World Quest - Azerite"}
w[51429]={n="King Clickyclack",e="BFA",m=864,t="Rare World Quest"}
w[51431]={n="Soul Goliath",e="BFA",m=896,t="Rare Elite World Quest"}
w[51433]={n="Matron Morana",e="BFA",m=896,t="Rare Elite World Quest"}
w[51434]={n="Stone Golem",e="BFA",m=896,t="Rare Elite World Quest"}
w[51444]={n="Azerite Empowerment",e="BFA",m=862,t="Magni World Quest - Azerite"}
w[51450]={n="Azerite Mining",e="BFA",m=862,t="Magni World Quest - Azerite"}
w[51453]={n="Shrine of the Storm: Behold, Pure Water",e="BFA",m=942,t="Dungeon World Quest"}
w[51454]={n="Once More Into Battle",e="BFA",m=896,t="World Quest"}
w[51455]={n="Shrine of the Storm: Cleansing Fonts",e="BFA",m=942,t="Dungeon World Quest"}
w[51456]={n="Shrine of the Storm: Crawling Corruption",e="BFA",m=942,t="Dungeon World Quest"}
w[51457]={n="Whargarble the Ill-Tempered",e="BFA",m=896,t="Rare World Quest"}
w[51461]={n="Deathcap",e="BFA",m=896,t="Rare World Quest"}
w[51462]={n="Paratroopers",e="BFA",m=895,t="World Quest"}
w[51463]={n="Sky Drop Rescue",e="BFA",m=895,t="World Quest"}
w[51466]={n="Arvon the Betrayed",e="BFA",m=896,t="Rare World Quest"}
w[51467]={n="Hyo'gi",e="BFA",m=896,t="Rare World Quest"}
w[51468]={n="Bonesquall",e="BFA",m=896,t="Rare World Quest"}
w[51469]={n="Betsy",e="BFA",m=896,t="Rare World Quest"}
w[51475]={n="Brutal Escort",e="BFA",m=862,t="World Quest"}
w[51491]={n="Balethorn",e="BFA",m=896,t="Rare World Quest"}
w[51494]={n="The Blood Gate",e="BFA",m=862,t="World Quest"}
w[51495]={n="Old Rotana",e="BFA",m=862,t="World Quest"}
w[51496]={n="Loa Your Standards",e="BFA",m=1165,t="World Quest"}
w[51497]={n="Hex Education",e="BFA",m=862,t="World Quest"}
w[51500]={n="Kings' Rest: The Weaponmaster Walks Again",e="BFA",m=862,t="Dungeon World Quest"}
w[51501]={n="Kings' Rest: Malfunction Junction",e="BFA",m=862,t="Dungeon World Quest"}
w[51502]={n="Kings' Rest: Kingsguard",e="BFA",m=862,t="Dungeon World Quest"}
w[51505]={n="Quillrat Matriarch",e="BFA",m=896,t="Rare World Quest"}
w[51506]={n="Barbthorn Queen",e="BFA",m=896,t="Rare World Quest"}
w[51507]={n="Gorehorn",e="BFA",m=896,t="Rare World Quest"}
w[51508]={n="Vicemaul",e="BFA",m=896,t="Rare World Quest"}
w[51512]={n="Bilefang Mother",e="BFA",m=896,t="Rare World Quest"}
w[51527]={n="Executioner Blackwell",e="BFA",m=896,t="Rare World Quest"}
w[51528]={n="Captain Leadfist",e="BFA",m=896,t="Rare World Quest"}
w[51529]={n="Talon",e="BFA",m=896,t="Rare World Quest"}
w[51530]={n="Wedding Crashers",e="BFA",m=896,t="World Quest"}
w[51541]={n="Arclight",e="BFA",m=896,t="Rare World Quest"}
w[51542]={n="Avalanche",e="BFA",m=896,t="Rare World Quest"}
w[51546]={n="It's the Pits",e="BFA",m=863,t="World Quest"}
w[51548]={n="Nagative Feedback",e="BFA",m=863,t="World Quest"}
w[51550]={n="Bubbles and Trouble",e="BFA",m=863,t="World Quest"}
w[51558]={n="Spider Scorching",e="BFA",m=864,t="World Quest"}
w[51559]={n="Damaged Goods",e="BFA",m=864,t="World Quest"}
w[51561]={n="Spider Scorching",e="BFA",m=864,t="World Quest"}
w[51562]={n="Damaged Goods",e="BFA",m=864,t="World Quest"}
w[51564]={n="Fertilizer Duty",e="BFA",m=864,t="World Quest"}
w[51565]={n="Feeding Frenzy",e="BFA",m=864,t="World Quest"}
w[51566]={n="Resurgence of the Beast",e="BFA",m=895,t="World Quest"}
w[51576]={n="Any Witch Way but Dead",e="BFA",m=896,t="World Quest"}
w[51577]={n="Defending the Academy",e="BFA",m=895,t="World Quest"}
w[51578]={n="The Sea Runs Red",e="BFA",m=1161,t="World Quest"}
w[51579]={n="Dark Ranger Clea",e="BFA",m=895,t="Rare Elite World Quest"}
w[51580]={n="Rear Admiral Hainsworth",e="BFA",m=895,t="Rare Elite World Quest"}
w[51581]={n="Azerite Mining",e="BFA",m=895,t="Magni World Quest - Azerite"}
w[51583]={n="Azerite Wounds",e="BFA",m=895,t="Magni World Quest - Azerite"}
w[51584]={n="Azerite Madness",e="BFA",m=895,t="Magni World Quest - Azerite"}
w[51585]={n="Quit Your Witchin'",e="BFA",m=896,t="World Quest"}
w[51586]={n="Azerite Empowerment",e="BFA",m=895,t="Magni World Quest - Azerite"}
w[51588]={n="Familiar Foes",e="BFA",m=896,t="World Quest"}
w[51604]={n="Hunters Hunted",e="BFA",m=896,t="World Quest"}
w[51608]={n="Azerite Madness",e="BFA",m=896,t="Magni World Quest - Azerite"}
w[51609]={n="Azerite Wounds",e="BFA",m=896,t="Magni World Quest - Azerite"}
w[51610]={n="Adhara White",e="BFA",m=895,t="Rare Elite World Quest"}
w[51611]={n="Ghost of the Deep",e="BFA",m=895,t="Rare Elite World Quest"}
w[51612]={n="Azerite Empowerment",e="BFA",m=896,t="Magni World Quest - Azerite"}
w[51613]={n="Bloodmaw",e="BFA",m=895,t="Rare Elite World Quest"}
w[51615]={n="Azerite Mining",e="BFA",m=896,t="Magni World Quest - Azerite"}
w[51616]={n="A Final Rest",e="BFA",m=896,t="World Quest"}
w[51617]={n="Azerite Empowerment",e="BFA",m=942,t="Magni World Quest - Azerite"}
w[51618]={n="Azerite Madness",e="BFA",m=942,t="Magni World Quest - Azerite"}
w[51619]={n="Trapline",e="BFA",m=896,t="World Quest"}
w[51620]={n="Natural Resources",e="BFA",m=896,t="World Quest"}
w[51621]={n="Tidal Teachings",e="BFA",m=895,t="World Quest"}
w[51622]={n="Tidal Teachings",e="BFA",m=895,t="World Quest"}
w[51623]={n="Azerite Wounds",e="BFA",m=942,t="Magni World Quest - Azerite"}
w[51625]={n="Shell Game",e="BFA",m=896,t="Tortollan World Quest - 8.0"}
w[51626]={n="Shell Game",e="BFA",m=895,t="Tortollan World Quest - 8.0"}
w[51627]={n="Shell Game",e="BFA",m=942,t="Tortollan World Quest - 8.0"}
w[51628]={n="Shell Game",e="BFA",m=863,t="Tortollan World Quest - 8.0"}
w[51629]={n="Shell Game",e="BFA",m=864,t="Tortollan World Quest - 8.0"}
w[51630]={n="Shell Game",e="BFA",m=862,t="Tortollan World Quest - 8.0"}
w[51631]={n="Make Loh Go",e="BFA",m=896,t="Tortollan World Quest - 8.0"}
w[51632]={n="Make Loh Go",e="BFA",m=895,t="Tortollan World Quest - 8.0"}
w[51633]={n="Make Loh Go",e="BFA",m=942,t="Tortollan World Quest - 8.0"}
w[51634]={n="Make Loh Go",e="BFA",m=863,t="Tortollan World Quest - 8.0"}
w[51635]={n="Make Loh Go",e="BFA",m=864,t="Tortollan World Quest - 8.0"}
w[51636]={n="Make Loh Go",e="BFA",m=862,t="Tortollan World Quest - 8.0"}
w[51637]={n="Beachhead",e="BFA",m=896,t="Tortollan World Quest - 8.0"}
w[51638]={n="Beachhead",e="BFA",m=895,t="Tortollan World Quest - 8.0"}
w[51639]={n="Beachhead",e="BFA",m=942,t="Tortollan World Quest - 8.0"}
w[51640]={n="Beachhead",e="BFA",m=863,t="Tortollan World Quest - 8.0"}
w[51641]={n="Beachhead",e="BFA",m=864,t="Tortollan World Quest - 8.0"}
w[51642]={n="Beachhead",e="BFA",m=862,t="Tortollan World Quest - 8.0"}
w[51644]={n="Azerite Mining",e="BFA",m=942,t="Magni World Quest - Azerite"}
w[51646]={n="Polly Want A Cracker?",e="BFA",m=895,t="World Quest"}
w[51647]={n="Crews of Freehold",e="BFA",m=895,t="World Quest"}
w[51651]={n="Squacks",e="BFA",m=895,t="Rare World Quest"}
w[51652]={n="Barman Bill",e="BFA",m=895,t="Rare World Quest"}
w[51653]={n="Auditor Dolp",e="BFA",m=895,t="Rare World Quest"}
w[51654]={n="Fowlmouth",e="BFA",m=895,t="Rare World Quest"}
w[51655]={n="Teres",e="BFA",m=895,t="Rare World Quest"}
w[51656]={n="Saurolisk Tamer Mugg",e="BFA",m=895,t="Rare World Quest"}
w[51657]={n="Twin-Hearted Construct",e="BFA",m=895,t="Rare World Quest"}
w[51658]={n="Fly the Coop!",e="BFA",m=896,t="World Quest"}
w[51659]={n="Merianae",e="BFA",m=895,t="Rare World Quest"}
w[51660]={n="Pack Leader Asenya",e="BFA",m=895,t="Rare World Quest"}
w[51661]={n="Raging Swell",e="BFA",m=895,t="Rare World Quest"}
w[51662]={n="Foxhollow Skyterror",e="BFA",m=895,t="Rare World Quest"}
w[51664]={n="Kulett the Ornery",e="BFA",m=895,t="Rare World Quest"}
w[51665]={n="Broodmother Razora",e="BFA",m=895,t="Rare World Quest"}
w[51666]={n="Bashmu",e="BFA",m=895,t="Rare World Quest"}
w[51667]={n="This Bird You Cannot Change",e="BFA",m=896,t="World Quest"}
w[51669]={n="Black-Eyed Bart",e="BFA",m=895,t="Rare World Quest"}
w[51670]={n="Lumbergrasp Sentinel",e="BFA",m=895,t="Rare World Quest"}
w[51671]={n="Billy Goat Barber",e="BFA",m=895,t="World Quest"}
w[51672]={n="Tangled Webs",e="BFA",m=896,t="World Quest"}
w[51676]={n="What a Gull Wants",e="BFA",m=896,t="World Quest"}
w[51681]={n="Basic Witch",e="BFA",m=896,t="World Quest"}
w[51682]={n="Witches by the Dozen",e="BFA",m=896,t="World Quest"}
w[51683]={n="Slash and Burn Tactics",e="BFA",m=896,t="World Quest"}
w[51686]={n="Where My Witches at?",e="BFA",m=896,t="World Quest"}
w[51687]={n="A Smelly Solution",e="BFA",m=896,t="World Quest"}
w[51690]={n="The Shadows of Corlain",e="BFA",m=896,t="World Quest"}
w[51693]={n="Intercepting the Irontide",e="BFA",m=896,t="World Quest"}
w[51694]={n="Which Witch?",e="BFA",m=896,t="World Quest"}
w[51697]={n="Hunting for Truffle Hunters",e="BFA",m=896,t="World Quest"}
w[51699]={n="Blighted Monstrosity",e="BFA",m=896,t="Rare Elite World Quest"}
w[51706]={n="Deadwood",e="BFA",m=896,t="World Quest"}
w[51707]={n="More Valuable Than Gold",e="BFA",m=896,t="World Quest"}
w[51709]={n="Bombarbment",e="BFA",m=896,t="World Quest"}
w[51710]={n="Rise of the Yetis",e="BFA",m=896,t="World Quest"}
w[51719]={n="A Glaive Mistake",e="BFA",m=896,t="World Quest"}
w[51727]={n="A Shot at the Dark Iron",e="BFA",m=896,t="World Quest"}
w[51737]={n="Bruin Potions",e="BFA",m=896,t="World Quest"}
w[51738]={n="Witches by the Dozen",e="BFA",m=896,t="World Quest"}
w[51739]={n="Rise of the Yetis",e="BFA",m=896,t="World Quest"}
w[51740]={n="Hunting for Truffle Hunters",e="BFA",m=896,t="World Quest"}
w[51741]={n="Bombarbment",e="BFA",m=896,t="World Quest"}
w[51742]={n="Intercepting the Irontide",e="BFA",m=896,t="World Quest"}
w[51743]={n="More Valuable Than Gold",e="BFA",m=896,t="World Quest"}
w[51745]={n="A Smelly Solution",e="BFA",m=896,t="World Quest"}
w[51746]={n="The Shadows of Corlain",e="BFA",m=896,t="World Quest"}
w[51747]={n="Early Warning",e="BFA",m=896,t="World Quest"}
w[51754]={n="Dogged Tenacity",e="BFA",m=896,t="World Quest"}
w[51758]={n="Weapons Shipment",e="BFA",m=1161,t="World Quest"}
w[51759]={n="Seabreaker Skoloth",e="BFA",m=942,t="Rare World Quest"}
w[51760]={n="Ranishu Feeding Frenzy",e="BFA",m=864,t="World Quest"}
w[51761]={n="Familiar Foes",e="BFA",m=896,t="World Quest"}
w[51763]={n="Zem'lan Rescue",e="BFA",m=864,t="World Quest"}
w[51764]={n="Hunters Hunted",e="BFA",m=896,t="World Quest"}
w[51765]={n="Tangled Webs",e="BFA",m=896,t="World Quest"}
w[51767]={n="Trapline",e="BFA",m=896,t="World Quest"}
w[51768]={n="Natural Resources",e="BFA",m=896,t="World Quest"}
w[51769]={n="What a Gull Wants",e="BFA",m=896,t="World Quest"}
w[51774]={n="Ragna",e="BFA",m=942,t="Rare World Quest"}
w[51776]={n="Galestorm",e="BFA",m=942,t="Rare World Quest"}
w[51777]={n="Dagrus the Scorned",e="BFA",m=942,t="Rare World Quest"}
w[51778]={n="Deepfang",e="BFA",m=942,t="Rare World Quest"}
w[51779]={n="Grimscowl the Hairbrained",e="BFA",m=942,t="Rare World Quest"}
w[51780]={n="Dinner for Dolly and Dot",e="BFA",m=864,t="World Quest"}
w[51781]={n="Foreman Scripps",e="BFA",m=942,t="Rare World Quest"}
w[51782]={n="Captain Razorspine",e="BFA",m=942,t="Rare World Quest"}
w[51783]={n="Zem'lan Rescue",e="BFA",m=864,t="World Quest"}
w[51791]={n="Bubbling Totem Testing",e="BFA",m=864,t="World Quest"}
w[51792]={n="Erupting Totem Testing",e="BFA",m=864,t="World Quest"}
w[51793]={n="Bubbling Totem Testing",e="BFA",m=864,t="World Quest"}
w[51794]={n="Erupting Totem Testing",e="BFA",m=864,t="World Quest"}
w[51804]={n="Running Interference",e="BFA",m=864,t="World Quest"}
w[51806]={n="Pest Remover Mk. II",e="BFA",m=942,t="Rare Elite World Quest"}
w[51811]={n="Trapped Tortollans",e="BFA",m=942,t="World Quest"}
w[51814]={n="Ravoracious",e="BFA",m=862,t="World Quest"}
w[51815]={n="Eggstermination",e="BFA",m=862,t="World Quest"}
w[51816]={n="Pterrible Ingredients",e="BFA",m=862,t="World Quest"}
w[51817]={n="Trapped Tortollans",e="BFA",m=942,t="World Quest"}
w[51820]={n="Oily Mess",e="BFA",m=942,t="World Quest"}
w[51821]={n="Quelling the Cove",e="BFA",m=862,t="World Quest"}
w[51822]={n="Scrolls and Scales",e="BFA",m=862,t="World Quest"}
w[51824]={n="You're Grounded",e="BFA",m=862,t="World Quest"}
w[51827]={n="They Came From Behind!",e="BFA",m=942,t="World Quest"}
w[51828]={n="Burning the Legion",e="BFA",m=942,t="World Quest"}
w[51831]={n="Swift Strike",e="BFA",m=864,t="World Quest"}
w[51832]={n="Beat Around The Bush",e="BFA",m=896,t="World Quest"}
w[51834]={n="No Negotiations",e="BFA",m=864,t="World Quest"}
w[51836]={n="Sourcing Resources",e="BFA",m=864,t="World Quest"}
w[51839]={n="Squirgle of the Depths",e="BFA",m=895,t="Rare World Quest"}
w[51840]={n="Oily Mess",e="BFA",m=942,t="World Quest"}
w[51841]={n="Blackthorne",e="BFA",m=895,t="Rare World Quest"}
w[51842]={n="Carla Smirk",e="BFA",m=895,t="Rare World Quest"}
w[51843]={n="P4-N73R4",e="BFA",m=895,t="Rare World Quest"}
w[51844]={n="Gulliver",e="BFA",m=895,t="Rare World Quest"}
w[51847]={n="Tort Jaw",e="BFA",m=895,t="Rare World Quest"}
w[51848]={n="Captain Wintersail",e="BFA",m=895,t="Rare World Quest"}
w[51849]={n="Tempestria",e="BFA",m=895,t="Rare World Quest"}
w[51850]={n="Preserve the Oasis",e="BFA",m=864,t="World Quest"}
w[51853]={n="Preserve the Oasis",e="BFA",m=864,t="World Quest"}
w[51854]={n="I Am the Shark",e="BFA",m=942,t="World Quest"}
w[51855]={n="A Pirate's Life For Me",e="BFA",m=942,t="World Quest"}
w[51856]={n="The Underrot: Rotmaw",e="BFA",m=863,t="Dungeon World Quest"}
w[51874]={n="Gorged Boar",e="BFA",m=896,t="Rare World Quest"}
w[51884]={n="Haywire Golem",e="BFA",m=896,t="Rare World Quest"}
w[51886]={n="Pinku'shon",e="BFA",m=942,t="Rare World Quest"}
w[51887]={n="Fungi Trio",e="BFA",m=896,t="Rare World Quest"}
w[51890]={n="Ranja the Last Chillpaw",e="BFA",m=895,t="Rare World Quest"}
w[51891]={n="Sythian the Swift",e="BFA",m=895,t="Rare World Quest"}
w[51892]={n="Shiverscale the Toxic",e="BFA",m=895,t="Rare World Quest"}
w[51893]={n="Sawtooth",e="BFA",m=895,t="Rare World Quest"}
w[51894]={n="Tentulos the Drifter",e="BFA",m=895,t="Rare World Quest"}
w[51895]={n="Maison the Portable",e="BFA",m=895,t="Rare World Quest"}
w[51897]={n="Rimestone",e="BFA",m=896,t="Rare World Quest"}
w[51900]={n="Faithless Follow-Through",e="BFA",m=864,t="World Quest"}
w[51901]={n="Crushtacean",e="BFA",m=942,t="Rare World Quest"}
w[51905]={n="Reinforced Hullbreaker",e="BFA",m=942,t="Rare Elite World Quest"}
w[51906]={n="Sister Martha",e="BFA",m=896,t="Rare World Quest"}
w[51908]={n="Nevermore",e="BFA",m=896,t="Rare World Quest"}
w[51909]={n="Grozgore",e="BFA",m=896,t="Rare World Quest"}
w[51917]={n="Beshol",e="BFA",m=896,t="Rare World Quest"}
w[51919]={n="Emily Mayville",e="BFA",m=896,t="Rare World Quest"}
w[51920]={n="Cottontail Matron",e="BFA",m=896,t="Rare World Quest"}
w[51921]={n="Slickspill",e="BFA",m=942,t="Rare World Quest"}
w[51924]={n="Faithless Follow-Through",e="BFA",m=864,t="World Quest"}
w[51925]={n="Instructions Not Included",e="BFA",m=864,t="World Quest"}
w[51928]={n="Instructions Not Included",e="BFA",m=864,t="World Quest"}
w[51931]={n="Instructions Not Included",e="BFA",m=864,t="World Quest"}
w[51933]={n="Instructions Not Included",e="BFA",m=864,t="World Quest"}
w[51947]={n="Sabertron",e="BFA",t="Rare World Quest"}
w[51948]={n="Providing Protection",e="BFA",m=864,t="World Quest"}
w[51957]={n="The Wrath of Vorrik",e="BFA",m=864,t="World Quest"}
w[51963]={n="The Wrath of Vorrik",e="BFA",m=864,t="World Quest"}
w[51970]={n="The Caterer",e="BFA",m=896,t="Rare World Quest"}
w[51972]={n="Lost Goat",e="BFA",m=896,t="Rare World Quest"}
w[51974]={n="Sabertron",e="BFA",m=942,t="Rare World Quest"}
w[51976]={n="Sabertron",e="BFA",m=942,t="Rare World Quest"}
w[51977]={n="Sabertron",e="BFA",m=942,t="Rare World Quest"}
w[51978]={n="Sabertron",e="BFA",m=942,t="Rare World Quest"}
w[51981]={n="Earthcaller's Abode",e="BFA",m=942,t="World Quest"}
w[51983]={n="Vorrik's Vengeance",e="BFA",m=864,t="World Quest"}
w[51988]={n="Whitney \"Steelclaw\" Ramsay",e="BFA",m=896,t="Rare World Quest"}
w[51989]={n="Braedan Whitewall",e="BFA",m=896,t="Rare World Quest"}
w[51995]={n="Vorrik's Vengeance",e="BFA",m=864,t="World Quest"}
w[51996]={n="Earthcaller's Abode",e="BFA",m=942,t="World Quest"}
w[51997]={n="Thar She Sinks",e="BFA",m=864,t="World Quest"}
w[52004]={n="Counter Intelligence",e="BFA",m=942,t="World Quest"}
w[52006]={n="Preemptive Assault",e="BFA",m=863,t="World Quest"}
w[52007]={n="Engines of War",e="BFA",m=863,t="World Quest"}
w[52009]={n="Crab People",e="BFA",m=896,t="Battle Pet World Quest"}
w[52010]={n="The Tendrils of Fate",e="BFA",m=895,t="World Quest"}
w[52011]={n="Fiendish Fields",e="BFA",m=942,t="World Quest"}
w[52045]={n="Boarder Patrol",e="BFA",m=942,t="World Quest"}
w[52047]={n="Against the Storm",e="BFA",m=895,t="World Quest"}
w[52054]={n="Too Much To Bear",e="BFA",m=942,t="World Quest"}
w[52056]={n="The Tendrils of Fate",e="BFA",m=895,t="World Quest"}
w[52057]={n="Against the Storm",e="BFA",m=895,t="World Quest"}
w[52059]={n="Thar She Sinks",e="BFA",m=864,t="World Quest"}
w[52063]={n="Boarder Patrol",e="BFA",m=942,t="World Quest"}
w[52064]={n="Fiendish Fields",e="BFA",m=942,t="World Quest"}
w[52071]={n="Briarback Mountain",e="BFA",m=942,t="World Quest"}
w[52115]={n="In the Shadow of the Kraken",e="BFA",m=942,t="World Quest"}
w[52117]={n="Briarback Mountain",e="BFA",m=942,t="World Quest"}
w[52119]={n="Goblin Azerite Extraction",e="BFA",m=895,t="World Quest"}
w[52120]={n="Gnomish Azerite Extraction",e="BFA",m=895,t="World Quest"}
w[52124]={n="Losers Weepers",e="BFA",m=895,t="World Quest"}
w[52126]={n="This Little Piggy Has Sharp Tusks",e="BFA",m=942,t="Battle Pet World Quest"}
w[52133]={n="Good Boy!",e="BFA",m=942,t="World Quest"}
w[52140]={n="A Thorny Problem",e="BFA",m=942,t="World Quest"}
w[52142]={n="Restocking",e="BFA",m=942,t="World Quest"}
w[52143]={n="Smaller Haulers",e="BFA",m=895,t="World Quest"}
w[52144]={n="Foundry Meltdown",e="BFA",m=895,t="World Quest"}
w[52145]={n="Heave-Ho!",e="BFA",m=895,t="World Quest"}
w[52155]={n="Treasure in the Tides",e="BFA",m=895,t="World Quest"}
w[52157]={n="A Chilling Encounter",e="BFA",m=896,t="Epic Elite World Quest"}
w[52159]={n="Swab This!",e="BFA",m=895,t="World Quest"}
w[52160]={n="Restocking",e="BFA",m=942,t="World Quest"}
w[52163]={n="The Winged Typhoon",e="BFA",m=895,t="Epic Elite World Quest"}
w[52164]={n="Rum- Paaaage!",e="BFA",m=942,t="World Quest"}
w[52165]={n="Automated Chaos",e="BFA",m=942,t="Battle Pet World Quest"}
w[52166]={n="The Faceless Herald",e="BFA",m=942,t="Epic Elite World Quest"}
w[52167]={n="Hardcore Raiders",e="BFA",m=895,t="World Quest"}
w[52168]={n="It's Lit",e="BFA",m=942,t="World Quest"}
w[52169]={n="The Matriarch",e="BFA",m=862,t="Epic Elite World Quest"}
w[52174]={n="Snakes in the Shallows",e="BFA",m=942,t="World Quest"}
w[52179]={n="Fortified Resistance",e="BFA",m=942,t="World Quest"}
w[52180]={n="A Brennadam Shame",e="BFA",m=942,t="World Quest"}
w[52181]={n="Smoke and Shadow",e="BFA",m=863,t="Epic Elite World Quest"}
w[52182]={n="The Azerite Stuff",e="BFA",m=62,t="World Quest"}
w[52196]={n="Sandswept Bones",e="BFA",m=864,t="Epic Elite World Quest"}
w[52198]={n="Tank and Spank",e="BFA",m=942,t="World Quest"}
w[52199]={n="Rum- Paaaage!",e="BFA",m=942,t="World Quest"}
w[52200]={n="Turtle Tactics",e="BFA",m=942,t="World Quest"}
w[52207]={n="The Azerite Stuff",e="BFA",m=62,t="World Quest"}
w[52209]={n="Turtle Tactics",e="BFA",m=942,t="World Quest"}
w[52211]={n="Red Sunrise",e="BFA",m=942,t="World Quest"}
w[52218]={n="Night Horrors",e="BFA",m=896,t="Battle Pet World Quest"}
w[52229]={n="Too Much To Bear",e="BFA",m=942,t="World Quest"}
w[52230]={n="Loose Change",e="BFA",m=942,t="World Quest"}
w[52236]={n="A Thorny Problem",e="BFA",m=942,t="World Quest"}
w[52237]={n="The Underrot: Restless Horror",e="BFA",m=863,t="Dungeon World Quest"}
w[52238]={n="The Underrot: Mysterious Spores",e="BFA",m=863,t="Dungeon World Quest"}
w[52239]={n="Loose Change",e="BFA",m=942,t="World Quest"}
w[52243]={n="Fuel for the Demolishers",e="BFA",m=62,t="World Quest"}
w[52244]={n="Stop the Drilling",e="BFA",m=62,t="World Quest"}
w[52248]={n="The Shores of Xibala",e="BFA",m=862,t="World Quest"}
w[52249]={n="The Shores of Xibala",e="BFA",m=862,t="World Quest"}
w[52250]={n="Saving Xibala",e="BFA",m=862,t="World Quest"}
w[52251]={n="Compromised Reconnaissance",e="BFA",m=1165,t="World Quest"}
w[52271]={n="Sea Salt Flavored",e="BFA",m=942,t="World Quest"}
w[52278]={n="Rogue Azerite",e="BFA",m=896,t="Battle Pet World Quest"}
w[52280]={n="Sea Salt Flavored",e="BFA",m=942,t="World Quest"}
w[52295]={n="The MOTHERLODE!!: Elementals on the Payroll",e="BFA",m=862,t="Dungeon World Quest"}
w[52297]={n="What's the Buzz?",e="BFA",m=896,t="Battle Pet World Quest"}
w[52298]={n="The MOTHERLODE!!: The Smarts Are In His Horn!",e="BFA",m=862,t="Dungeon World Quest"}
w[52299]={n="Whiplash",e="BFA",m=942,t="Rare World Quest"}
w[52300]={n="Wagga Snarltusk",e="BFA",m=942,t="Rare World Quest"}
w[52301]={n="Vinespeaker Ratha",e="BFA",m=942,t="Rare World Quest"}
w[52302]={n="The MOTHERLODE!!: He's Got Really Big Bombs",e="BFA",m=862,t="Dungeon World Quest"}
w[52306]={n="Croaker",e="BFA",m=942,t="Rare World Quest"}
w[52307]={n="Spiritual Aid",e="BFA",m=62,t="World Quest"}
w[52309]={n="SandFang",e="BFA",m=942,t="Rare World Quest"}
w[52310]={n="Corrupted Tideskipper",e="BFA",m=942,t="Rare World Quest"}
w[52312]={n="Extinguish the Lights",e="BFA",m=62,t="World Quest"}
w[52315]={n="Severus the Outcast",e="BFA",m=942,t="Rare World Quest"}
w[52316]={n="Sea Creatures Are Weird",e="BFA",m=942,t="Battle Pet World Quest"}
w[52321]={n="Kickers",e="BFA",m=942,t="Rare World Quest"}
w[52322]={n="Taja the Tidehowler",e="BFA",m=942,t="Rare World Quest"}
w[52325]={n="Captured Evil",e="BFA",m=942,t="Battle Pet World Quest"}
w[52328]={n="Ice Sickle",e="BFA",m=942,t="Rare World Quest"}
w[52330]={n="Beehemoth",e="BFA",m=942,t="Rare Elite World Quest"}
w[52331]={n="Work Order: Demitri's Draught of Deception",e="BFA",m=1161,t="Alchemy World Quest"}
w[52332]={n="Work Order: Lightfoot Potion",e="BFA",m=942,t="Alchemy World Quest"}
w[52333]={n="Work Order: Sea Mist Potion",e="BFA",m=895,t="Alchemy World Quest"}
w[52334]={n="Work Order: Potion of Concealment",e="BFA",m=896,t="Alchemy World Quest"}
w[52335]={n="Work Order: Demitri's Draught of Deception",e="BFA",m=1165,t="Alchemy World Quest"}
w[52336]={n="Work Order: Lightfoot Potion",e="BFA",m=862,t="Alchemy World Quest"}
w[52337]={n="Work Order: Sea Mist Potion",e="BFA",m=863,t="Alchemy World Quest"}
w[52338]={n="Work Order: Potion of Concealment",e="BFA",m=864,t="Alchemy World Quest"}
w[52339]={n="Work Order: Monel-Hardened Stirrups",e="BFA",m=1161,t="Blacksmithing World Quest"}
w[52340]={n="Work Order: Monel-Hardened Hoofplates",e="BFA",m=1161,t="Blacksmithing World Quest"}
w[52341]={n="Work Order: Monel-Hardened Stirrups",e="BFA",m=1165,t="Blacksmithing World Quest"}
w[52342]={n="Work Order: Monel-Hardened Hoofplates",e="BFA",m=1165,t="Blacksmithing World Quest"}
w[52343]={n="They Eat Like Orcs",e="BFA",m=62,t="World Quest"}
w[52344]={n="Work Order: Kul Tiramisu",e="BFA",m=942,t="Cooking World Quest"}
w[52345]={n="Work Order: Ravenberry Tarts",e="BFA",m=942,t="Cooking World Quest"}
w[52346]={n="Work Order: Sailor's Pie",e="BFA",m=942,t="Cooking World Quest"}
w[52347]={n="Work Order: Honey-Glazed Haunches",e="BFA",m=942,t="Cooking World Quest"}
w[52348]={n="Work Order: Mon'Dazi",e="BFA",m=862,t="Cooking World Quest"}
w[52349]={n="Work Order: Loa Loaf",e="BFA",m=862,t="Cooking World Quest"}
w[52350]={n="Work Order: Swamp Fish 'n Chips",e="BFA",m=862,t="Cooking World Quest"}
w[52351]={n="Work Order: Spiced Snapper",e="BFA",m=862,t="Cooking World Quest"}
w[52352]={n="Zeritarj",e="BFA",m=942,t="Rare Elite World Quest"}
w[52353]={n="Work Order: Enchant Ring - Seal of Haste",e="BFA",m=942,t="Enchanting World Quest"}
w[52354]={n="Work Order: Enchant Ring - Seal of Mastery",e="BFA",m=942,t="Enchanting World Quest"}
w[52355]={n="Work Order: Enchant Weapon - Coastal Surge",e="BFA",m=1161,t="Enchanting World Quest"}
w[52356]={n="Work Order: Enchant Weapon - Torrent of Elements",e="BFA",m=1161,t="Enchanting World Quest"}
w[52357]={n="Work Order: Enchant Weapon - Quick Navigation",e="BFA",m=896,t="Enchanting World Quest"}
w[52358]={n="Work Order: Enchant Ring - Seal of Haste",e="BFA",m=862,t="Enchanting World Quest"}
w[52359]={n="Work Order: Enchant Ring - Seal of Mastery",e="BFA",m=862,t="Enchanting World Quest"}
w[52360]={n="Work Order: Enchant Weapon - Coastal Surge",e="BFA",m=863,t="Enchanting World Quest"}
w[52361]={n="Work Order: Enchant Weapon - Torrent of Elements",e="BFA",m=863,t="Enchanting World Quest"}
w[52362]={n="Work Order: Enchant Weapon - Quick Navigation",e="BFA",m=864,t="Enchanting World Quest"}
w[52363]={n="Work Order: Incendiary Ammunition",e="BFA",m=1161,t="Engineering World Quest"}
w[52364]={n="Work Order: Thermo-Accelerated Plague Spreader",e="BFA",m=896,t="Engineering World Quest"}
w[52365]={n="Work Order: F.R.I.E.D.",e="BFA",m=896,t="Engineering World Quest"}
w[52366]={n="Work Order: XA-1000 Surface Skimmer",e="BFA",m=895,t="Engineering World Quest"}
w[52367]={n="Work Order: Electroshock Mount Motivator",e="BFA",m=942,t="Engineering World Quest"}
w[52368]={n="Work Order: Crow's Nest Scope",e="BFA",m=1161,t="Engineering World Quest"}
w[52369]={n="Work Order: Incendiary Ammunition",e="BFA",m=1165,t="Engineering World Quest"}
w[52370]={n="Work Order: Thermo-Accelerated Plague Spreader",e="BFA",m=864,t="Engineering World Quest"}
w[52371]={n="Work Order: F.R.I.E.D.",e="BFA",m=864,t="Engineering World Quest"}
w[52372]={n="Work Order: XA-1000 Surface Skimmer",e="BFA",m=863,t="Engineering World Quest"}
w[52373]={n="Work Order: Electroshock Mount Motivator",e="BFA",m=862,t="Engineering World Quest"}
w[52374]={n="Work Order: Crow's Nest Scope",e="BFA",m=1165,t="Engineering World Quest"}
w[52375]={n="Supplies Needed: Great Sea Catfish",e="BFA",m=1161,t="World Quest"}
w[52376]={n="Supplies Needed: Sand Shifter",e="BFA",m=1161,t="World Quest"}
w[52377]={n="Supplies Needed: Tiragarde Perch",e="BFA",m=895,t="World Quest"}
w[52378]={n="Supplies Needed: Slimy Mackerel",e="BFA",m=1161,t="World Quest"}
w[52379]={n="Supplies Needed: Redtail Loach",e="BFA",m=1161,t="World Quest"}
w[52380]={n="Supplies Needed: Frenzied Fangtooth",e="BFA",m=942,t="World Quest"}
w[52381]={n="Supplies Needed: Lane Snapper",e="BFA",m=896,t="World Quest"}
w[52382]={n="Supplies Needed: Great Sea Catfish",e="BFA",m=1165,t="World Quest"}
w[52383]={n="Supplies Needed: Sand Shifter",e="BFA",m=862,t="World Quest"}
w[52384]={n="Supplies Needed: Tiragarde Perch",e="BFA",m=1165,t="World Quest"}
w[52385]={n="Supplies Needed: Slimy Mackerel",e="BFA",m=863,t="World Quest"}
w[52386]={n="Supplies Needed: Redtail Loach",e="BFA",m=864,t="World Quest"}
w[52387]={n="Supplies Needed: Frenzied Fangtooth",e="BFA",m=1165,t="World Quest"}
w[52388]={n="Supplies Needed: Lane Snapper",e="BFA",m=1165,t="World Quest"}
w[52389]={n="Work Order: Contract: Proudmoore Admiralty",e="BFA",m=895,t="Inscription World Quest"}
w[52390]={n="Work Order: Contract: Order of Embers",e="BFA",m=896,t="Inscription World Quest"}
w[52391]={n="Work Order: Contract: Storm's Wake",e="BFA",m=942,t="Inscription World Quest"}
w[52392]={n="Work Order: Ultramarine Pigment",e="BFA",m=1161,t="Inscription World Quest"}
w[52393]={n="Work Order: Contract: Tortollan Seekers",e="BFA",m=862,t="Inscription World Quest"}
w[52394]={n="Work Order: Contract: Champions of Azeroth",e="BFA",m=862,t="Inscription World Quest"}
w[52395]={n="Work Order: Contract: Zandalari Empire",e="BFA",m=862,t="Inscription World Quest"}
w[52396]={n="Work Order: Contract: Talanji's Expedition",e="BFA",m=863,t="Inscription World Quest"}
w[52397]={n="Work Order: Contract: Voldunai",e="BFA",m=864,t="Inscription World Quest"}
w[52398]={n="Work Order: Ultramarine Pigment",e="BFA",m=1165,t="Inscription World Quest"}
w[52400]={n="Work Order: Kyanite",e="BFA",m=942,t="Jewelcrafting World Quest"}
w[52402]={n="Work Order: Viridium",e="BFA",m=942,t="Jewelcrafting World Quest"}
w[52404]={n="Work Order: Solstone",e="BFA",m=895,t="Jewelcrafting World Quest"}
w[52405]={n="Work Order: Kubiline",e="BFA",m=895,t="Jewelcrafting World Quest"}
w[52406]={n="Work Order: Rubellite",e="BFA",m=896,t="Jewelcrafting World Quest"}
w[52407]={n="Work Order: Golden Beryl",e="BFA",m=896,t="Jewelcrafting World Quest"}
w[52408]={n="Work Order: Kyanite",e="BFA",m=862,t="Jewelcrafting World Quest"}
w[52409]={n="Work Order: Viridium",e="BFA",m=862,t="Jewelcrafting World Quest"}
w[52410]={n="Work Order: Solstone",e="BFA",m=863,t="Jewelcrafting World Quest"}
w[52411]={n="Work Order: Kubiline",e="BFA",m=863,t="Jewelcrafting World Quest"}
w[52412]={n="Work Order: Rubellite",e="BFA",m=864,t="Jewelcrafting World Quest"}
w[52413]={n="Work Order: Golden Beryl",e="BFA",m=864,t="Jewelcrafting World Quest"}
w[52414]={n="Work Order: Drums of the Maelstrom",e="BFA",m=896,t="Leatherworking World Quest"}
w[52415]={n="Work Order: Coarse Leather Barding",e="BFA",m=942,t="Leatherworking World Quest"}
w[52416]={n="Work Order: Shimmerscale Diving Suit",e="BFA",m=895,t="Leatherworking World Quest"}
w[52417]={n="Work Order: Shimmerscale Diving Helmet",e="BFA",m=895,t="Leatherworking World Quest"}
w[52418]={n="Work Order: Drums of the Maelstrom",e="BFA",m=863,t="Leatherworking World Quest"}
w[52419]={n="Work Order: Coarse Leather Barding",e="BFA",m=864,t="Leatherworking World Quest"}
w[52420]={n="Work Order: Shimmerscale Diving Suit",e="BFA",m=862,t="Leatherworking World Quest"}
w[52421]={n="Work Order: Shimmerscale Diving Helmet",e="BFA",m=862,t="Leatherworking World Quest"}
w[52422]={n="Work Order: Battle Flag: Spirit of Freedom",e="BFA",m=942,t="Tailoring World Quest"}
w[52423]={n="Work Order: Battle Flag: Phalanx Defense",e="BFA",m=895,t="Tailoring World Quest"}
w[52424]={n="Work Order: Battle Flag: Rallying Swiftness",e="BFA",m=896,t="Tailoring World Quest"}
w[52425]={n="Work Order: Battle Flag: Spirit of Freedom",e="BFA",m=862,t="Tailoring World Quest"}
w[52426]={n="Work Order: Battle Flag: Phalanx Defense",e="BFA",m=863,t="Tailoring World Quest"}
w[52427]={n="Work Order: Battle Flag: Rallying Swiftness",e="BFA",m=864,t="Tailoring World Quest"}
w[52430]={n="Not So Bad Down Here",e="BFA",m=895,t="Battle Pet World Quest"}
w[52432]={n="Squall",e="BFA",m=942,t="Rare World Quest"}
w[52446]={n="Sister Absinthe",e="BFA",m=942,t="Rare World Quest"}
w[52452]={n="Song Mistress Dadalea",e="BFA",m=942,t="Rare World Quest"}
w[52454]={n="Freehold: Dread Captain Vandegrim",e="BFA",m=895,t="Dungeon World Quest"}
w[52455]={n="Unbreakable",e="BFA",m=895,t="Battle Pet World Quest"}
w[52456]={n="Freehold: Veteran Man O' War",e="BFA",m=895,t="Dungeon World Quest"}
w[52458]={n="Freehold: Pieces of Eight",e="BFA",m=895,t="Dungeon World Quest"}
w[52459]={n="Whirlwing",e="BFA",m=942,t="Rare World Quest"}
w[52463]={n="Haegol the Hammer",e="BFA",m=942,t="Rare World Quest"}
w[52464]={n="Osca the Bloodied",e="BFA",m=942,t="Rare World Quest"}
w[52471]={n="That's a Big Carcass",e="BFA",m=895,t="Battle Pet World Quest"}
w[52474]={n="Poacher Zane",e="BFA",m=942,t="Rare World Quest"}
w[52475]={n="Where Eagles Prey",e="BFA",m=895,t="Faction Assault World Quest"}
w[52476]={n="The Lichen King",e="BFA",m=942,t="Rare World Quest"}
w[52504]={n="So We Meat Again",e="BFA",m=62,t="World Quest"}
w[52505]={n="Pruning the Thorns",e="BFA",m=62,t="World Quest"}
w[52506]={n="Blunt the Spikes",e="BFA",m=62,t="World Quest"}
w[52507]={n="Sticky Mess",e="BFA",m=942,t="World Quest"}
w[52751]={n="Strange Looking Dogs",e="BFA",m=895,t="Battle Pet World Quest"}
w[52752]={n="Vigilant Lookouts",e="BFA",m=895,t="World Quest"}
w[52754]={n="Marshdwellers",e="BFA",m=863,t="Battle Pet World Quest"}
w[52755]={n="Bringing the Heat",e="BFA",m=895,t="World Quest"}
w[52756]={n="Snow Way Out",e="BFA",m=895,t="World Quest"}
w[52757]={n="Grimestone Crimes",e="BFA",m=895,t="World Quest"}
w[52760]={n="Like Fish in a Barrel",e="BFA",m=895,t="World Quest"}
w[52761]={n="Siege of Boralus: Blood Money",e="BFA",m=895,t="Dungeon World Quest"}
w[52763]={n="Siege of Boralus: Breaking Their Ranks",e="BFA",m=895,t="Dungeon World Quest"}
w[52771]={n="Siege of Boralus: Breaking Irons",e="BFA",m=895,t="Dungeon World Quest"}
w[52775]={n="Siege of Boralus: What's Yours is Mine",e="BFA",m=895,t="Dungeon World Quest"}
w[52778]={n="Siege of Boralus: Crushing the Horde",e="BFA",m=895,t="Dungeon World Quest"}
w[52779]={n="Crawg in the Bog",e="BFA",m=863,t="Battle Pet World Quest"}
w[52780]={n="Siege of Boralus: Breaking the Alliance",e="BFA",m=895,t="Dungeon World Quest"}
w[52785]={n="Smashing Zalamar",e="BFA",m=863,t="World Quest"}
w[52794]={n="Lizards and Ledgers",e="BFA",m=942,t="World Quest"}
w[52798]={n="A Few More Charges",e="BFA",m=864,t="World Quest"}
w[52799]={n="Pack Leader",e="BFA",m=863,t="Battle Pet World Quest"}
w[52803]={n="Accidental Dread",e="BFA",m=863,t="Battle Pet World Quest"}
w[52804]={n="Something Stirs in the Depths",e="BFA",m=895,t="World Quest"}
w[52805]={n="Like Pulling Teeth",e="BFA",m=895,t="World Quest"}
w[52832]={n="Azerite Empowerment",e="BFA",m=863,t="Magni World Quest - Azerite"}
w[52847]={n="Doom's Howl",e="BFA",m=14,t="Epic Elite World Quest"}
w[52848]={n="The Lion's Roar",e="BFA",m=14,t="Epic Elite World Quest"}
w[52849]={n="Azerite Empowerment",e="BFA",m=864,t="Magni World Quest - Azerite"}
w[52850]={n="Keeyo's Champions of Vol'dun",e="BFA",m=864,t="Battle Pet World Quest"}
w[52856]={n="Snakes on a Terrace",e="BFA",m=864,t="Battle Pet World Quest"}
w[52858]={n="Azerite Empowerment",e="BFA",m=862,t="Magni World Quest - Azerite"}
w[52862]={n="Azerite Empowerment",e="BFA",m=896,t="Magni World Quest - Azerite"}
w[52864]={n="What Do You Mean, Mind Controlling Plants?",e="BFA",m=864,t="Battle Pet World Quest"}
w[52865]={n="Blockade Runner",e="BFA",m=942,t="World Quest"}
w[52869]={n="Azerite Empowerment",e="BFA",m=895,t="Magni World Quest - Azerite"}
w[52871]={n="Azerite Empowerment",e="BFA",m=942,t="Magni World Quest - Azerite"}
w[52872]={n="Azerite Mining",e="BFA",m=896,t="Magni World Quest - Azerite"}
w[52873]={n="Azerite Mining",e="BFA",m=942,t="Magni World Quest - Azerite"}
w[52874]={n="Azerite Mining",e="BFA",m=895,t="Magni World Quest - Azerite"}
w[52875]={n="Azerite Mining",e="BFA",m=864,t="Magni World Quest - Azerite"}
w[52877]={n="Azerite Mining",e="BFA",m=862,t="Magni World Quest - Azerite"}
w[52878]={n="Desert Survivors",e="BFA",m=864,t="Battle Pet World Quest"}
w[52879]={n="Stiff Policy",e="BFA",m=942,t="World Quest"}
w[52880]={n="Milden Mud Snout",e="BFA",m=942,t="Rare World Quest"}
w[52882]={n="Controlled Burn",e="BFA",m=942,t="World Quest"}
w[52883]={n="Breakthru",e="BFA",m=62,t="World Quest"}
w[52884]={n="Azerite Wounds",e="BFA",m=863,t="Magni World Quest - Azerite"}
w[52885]={n="Fey There",e="BFA",m=62,t="World Quest"}
w[52889]={n="Sandscour",e="BFA",m=942,t="Rare World Quest"}
w[52890]={n="It's a Kind of Magic",e="BFA",m=62,t="World Quest"}
w[52891]={n="Wendigo to Sleep",e="BFA",m=942,t="World Quest"}
w[52892]={n="Critters are Friends, Not Food",e="BFA",m=862,t="Battle Pet World Quest"}
w[52893]={n="One Vision",e="BFA",m=62,t="World Quest"}
w[52894]={n="Don't Stop Me Now",e="BFA",m=62,t="World Quest"}
w[52895]={n="Arboria",e="BFA",m=62,t="World Quest"}
w[52896]={n="Under Pressure",e="BFA",m=62,t="World Quest"}
w[52897]={n="We Will \"Rock\" You",e="BFA",m=62,t="World Quest"}
w[52923]={n="Add More to the Collection",e="BFA",m=862,t="Battle Pet World Quest"}
w[52924]={n="Mead Some Help?",e="BFA",m=942,t="World Quest"}
w[52935]={n="A New Era",e="BFA",m=942,t="World Quest"}
w[52936]={n="Plagued Earth Policy",e="BFA",m=942,t="World Quest"}
w[52937]={n="You've Never Seen Jammer Upset",e="BFA",m=862,t="Battle Pet World Quest"}
w[52938]={n="Small Beginnings",e="BFA",m=862,t="Battle Pet World Quest"}
w[52939]={n="Ordnance Orders",e="BFA",m=942,t="World Quest"}
w[52940]={n="Arms Deal",e="BFA",m=942,t="World Quest"}
w[52941]={n="Light in the Darkness",e="BFA",m=942,t="World Quest"}
w[52947]={n="Ettin Outta Here",e="BFA",m=942,t="World Quest"}
w[52964]={n="Pest Problem",e="BFA",m=942,t="World Quest"}
w[52968]={n="Time for a Little Blood",e="BFA",m=942,t="World Quest"}
w[52972]={n="Favored Grandchild",e="BFA",m=942,t="World Quest"}
w[52979]={n="Ritual Cleansing",e="BFA",m=942,t="World Quest"}
w[52982]={n="Mine or Trouble",e="BFA",m=942,t="World Quest"}
w[52983]={n="I Want It All",e="BFA",m=62,t="World Quest"}
w[52984]={n="I Want It All",e="BFA",m=62,t="World Quest"}
w[52986]={n="A Wicked Vessel",e="BFA",m=942,t="World Quest"}
w[52987]={n="Let's Burn!",e="BFA",m=942,t="World Quest"}
w[52988]={n="House Cleaning",e="BFA",m=942,t="World Quest"}
w[53008]={n="Sage Wisdom",e="BFA",m=942,t="World Quest"}
w[53009]={n="Hang On In There",e="BFA",m=62,t="World Quest"}
w[53010]={n="No Turning Back",e="BFA",m=62,t="World Quest"}
w[53012]={n="Put Away Your Toys",e="BFA",m=942,t="World Quest"}
w[53025]={n="The Culling",e="BFA",m=942,t="World Quest"}
w[53027]={n="Edge of Glory",e="BFA",m=942,t="World Quest"}
w[53040]={n="Squall Squelching",e="BFA",m=942,t="World Quest"}
w[53042]={n="Stormcaller",e="BFA",m=942,t="World Quest"}
w[53076]={n="Foundry Meltdown",e="BFA",m=895,t="World Quest"}
w[53078]={n="Treasure in the Tides",e="BFA",m=895,t="World Quest"}
w[53106]={n="Censership",e="BFA",m=942,t="World Quest"}
w[53107]={n="Plunder and Provisions",e="BFA",m=942,t="World Quest"}
w[53108]={n="Iconoclasm",e="BFA",m=942,t="World Quest"}
w[53165]={n="Stopping Antiquities Theft",e="BFA",m=862,t="World Quest"}
w[53188]={n="Frozen Freestyle",e="BFA",m=895,t="World Quest"}
w[53189]={n="Slippery Slopes",e="BFA",m=895,t="World Quest"}
w[53196]={n="Swab This!",e="BFA",m=895,t="World Quest"}
w[53266]={n="Flourishing Sea Stalks",e="BFA",m=896,t="Herbalism World Quest"}
w[53270]={n="Flourishing Riverbud",e="BFA",m=896,t="Herbalism World Quest"}
w[53271]={n="Blooming Star Moss",e="BFA",m=896,t="Herbalism World Quest"}
w[53272]={n="Blooming Siren's Sting",e="BFA",m=896,t="Herbalism World Quest"}
w[53273]={n="Winter's Kiss Cluster",e="BFA",m=896,t="Herbalism World Quest"}
w[53274]={n="Overgrown Anchor Weed",e="BFA",m=896,t="Herbalism World Quest"}
w[53277]={n="Flourishing Sea Stalks",e="BFA",m=895,t="Herbalism World Quest"}
w[53278]={n="Flourishing Riverbud",e="BFA",m=895,t="Herbalism World Quest"}
w[53279]={n="Blooming Star Moss",e="BFA",m=895,t="Herbalism World Quest"}
w[53280]={n="Blooming Siren's Sting",e="BFA",m=895,t="Herbalism World Quest"}
w[53281]={n="Winter's Kiss Cluster",e="BFA",m=895,t="Herbalism World Quest"}
w[53282]={n="Overgrown Anchor Weed",e="BFA",m=895,t="Herbalism World Quest"}
w[53283]={n="Flourishing Sea Stalks",e="BFA",m=942,t="Herbalism World Quest"}
w[53284]={n="Flourishing Riverbud",e="BFA",m=942,t="Herbalism World Quest"}
w[53285]={n="Blooming Star Moss",e="BFA",m=942,t="Herbalism World Quest"}
w[53286]={n="Blooming Siren's Sting",e="BFA",m=942,t="Herbalism World Quest"}
w[53287]={n="Winter's Kiss Cluster",e="BFA",m=942,t="Herbalism World Quest"}
w[53288]={n="Overgrown Anchor Weed",e="BFA",m=942,t="Herbalism World Quest"}
w[53289]={n="Flourishing Sea Stalks",e="BFA",m=863,t="Herbalism World Quest"}
w[53290]={n="Flourishing Riverbud",e="BFA",m=863,t="Herbalism World Quest"}
w[53291]={n="Blooming Star Moss",e="BFA",m=863,t="Herbalism World Quest"}
w[53292]={n="Blooming Siren's Sting",e="BFA",m=863,t="Herbalism World Quest"}
w[53293]={n="Overgrown Anchor Weed",e="BFA",m=863,t="Herbalism World Quest"}
w[53294]={n="Akunda's Bite Cluster",e="BFA",m=864,t="Herbalism World Quest"}
w[53296]={n="Flourishing Sea Stalks",e="BFA",m=864,t="Herbalism World Quest"}
w[53297]={n="Flourishing Riverbud",e="BFA",m=864,t="Herbalism World Quest"}
w[53298]={n="Blooming Star Moss",e="BFA",m=864,t="Herbalism World Quest"}
w[53299]={n="Blooming Siren's Sting",e="BFA",m=864,t="Herbalism World Quest"}
w[53300]={n="Overgrown Anchor Weed",e="BFA",m=864,t="Herbalism World Quest"}
w[53301]={n="Flourishing Sea Stalks",e="BFA",m=862,t="Herbalism World Quest"}
w[53302]={n="Flourishing Riverbud",e="BFA",m=862,t="Herbalism World Quest"}
w[53303]={n="Blooming Star Moss",e="BFA",m=862,t="Herbalism World Quest"}
w[53304]={n="Blooming Siren's Sting",e="BFA",m=862,t="Herbalism World Quest"}
w[53305]={n="Overgrown Anchor Weed",e="BFA",m=862,t="Herbalism World Quest"}
w[53308]={n="Luminous Monelite",e="BFA",m=896,t="Mining World Quest"}
w[53311]={n="Gleaming Storm Silver",e="BFA",m=896,t="Mining World Quest"}
w[53312]={n="Burnished Platinum",e="BFA",m=896,t="Mining World Quest"}
w[53313]={n="Rough Monelite",e="BFA",m=895,t="Mining World Quest"}
w[53314]={n="Coarse Storm Silver",e="BFA",m=895,t="Mining World Quest"}
w[53315]={n="Smooth Platinum",e="BFA",m=895,t="Mining World Quest"}
w[53316]={n="Hardened Monelite",e="BFA",m=942,t="Mining World Quest"}
w[53317]={n="Dense Storm Silver",e="BFA",m=942,t="Mining World Quest"}
w[53318]={n="Ductile Platinum",e="BFA",m=942,t="Mining World Quest"}
w[53319]={n="Our Sacred Forest",e="BFA",m=62,t="World Quest"}
w[53320]={n="Ours For the Taking",e="BFA",m=62,t="World Quest"}
w[53321]={n="Luminous Monelite",e="BFA",m=863,t="Mining World Quest"}
w[53322]={n="Gleaming Storm Silver",e="BFA",m=863,t="Mining World Quest"}
w[53323]={n="Burnished Platinum",e="BFA",m=863,t="Mining World Quest"}
w[53324]={n="Rough Monelite",e="BFA",m=864,t="Mining World Quest"}
w[53325]={n="Coarse Storm Silver",e="BFA",m=864,t="Mining World Quest"}
w[53326]={n="Smooth Platinum",e="BFA",m=864,t="Mining World Quest"}
w[53327]={n="Hardened Monelite",e="BFA",m=862,t="Mining World Quest"}
w[53328]={n="Dense Storm Silver",e="BFA",m=862,t="Mining World Quest"}
w[53329]={n="Ductile Platinum",e="BFA",m=862,t="Mining World Quest"}
w[53331]={n="Show-Off",e="BFA",m=895,t="World Quest"}
w[53343]={n="Censership",e="BFA",m=942,t="World Quest"}
w[53344]={n="Iconoclasm",e="BFA",m=942,t="World Quest"}
w[53345]={n="Plunder and Provisions",e="BFA",m=942,t="World Quest"}
w[53346]={n="Trogg Tromping",e="BFA",m=895,t="World Quest"}
w[53435]={n="Azerite for the Horde",e="BFA",t="Island Weekly Quest"}
w[53436]={n="Azerite for the Alliance",e="BFA",t="Island Weekly Quest"}
w[53497]={n="Break Free",e="BFA",m=62,t="World Quest"}
w[53498]={n="Staying Power",e="BFA",m=62,t="World Quest"}
w[53520]={n="Detonate!",e="BFA",m=62,t="World Quest"}
w[53552]={n="Wicked Kegger",e="BFA",m=62,t="World Quest"}
w[53699]={n="Gate Crashers",e="BFA",m=895,t="Faction Assault World Quest"}
w[53704]={n="Not Too Sober Citizens Brigade",e="BFA",m=1161,t="Faction Assault World Quest"}
w[53706]={n="Salvage the Supplies",e="BFA",m=942,t="Faction Assault World Quest"}
w[53707]={n="Smoke the Supplies",e="BFA",m=942,t="Faction Assault World Quest"}
w[53712]={n="Unfriendly Skies",e="BFA",m=942,t="Faction Assault World Quest"}
w[53713]={n="Wet Work: Bridgeport",e="BFA",m=895,t="Faction Assault World Quest"}
w[53714]={n="Apothecary Jerrod",e="BFA",m=896,t="Faction Assault Elite World Quest"}
w[53715]={n="Firewarden Viton Darkflare",e="BFA",m=942,t="Faction Assault Elite World Quest"}
w[53716]={n="Eastpoint Emergency",e="BFA",m=895,t="Faction Assault World Quest"}
w[53717]={n="Hold the Highland",e="BFA",m=942,t="Faction Assault World Quest"}
w[53724]={n="Shadow Hunter Mutumba",e="BFA",m=942,t="Faction Assault Elite World Quest"}
w[53726]={n="Mechinations",e="BFA",m=1161,t="Faction Assault World Quest"}
w[53752]={n="Shell Outs",e="BFA",m=942,t="Faction Assault World Quest"}
w[53753]={n="Shell Outs",e="BFA",m=942,t="Faction Assault World Quest"}
w[53755]={n="Blight and Sound",e="BFA",m=895,t="Faction Assault World Quest"}
w[53759]={n="Look Out Below!",e="BFA",m=895,t="Faction Assault World Quest"}
w[53768]={n="Furious Fracas",e="BFA",m=942,t="Faction Assault World Quest"}
w[53769]={n="Furious Fracas",e="BFA",m=942,t="Faction Assault World Quest"}
w[53770]={n="TBD - OLD PORTAL QUEST (NOT USED)",e="BFA",m=895,t="PvP World Quest"}
w[53771]={n="Gurin Stonebinder",e="BFA",m=942,t="Faction Assault Elite World Quest"}
w[53772]={n="Zagg Brokeneye",e="BFA",m=895,t="Faction Assault Elite World Quest"}
w[53773]={n="Naga Attack!",e="BFA",m=942,t="Elite World Quest"}
w[53784]={n="Siege Engineer Krackleboom",e="BFA",m=895,t="Faction Assault Elite World Quest"}
w[53803]={n="Fist of Orgrimmar - TBD OLD PORTAL QUEST",e="BFA",m=862,t="PvP World Quest"}
w[53804]={n="Dinomancer Zakuru",e="BFA",m=942,t="Faction Assault Elite World Quest"}
w[53808]={n="Crawl To Victory",e="BFA",m=1161,t="Faction Assault World Quest"}
w[53812]={n="A Carefully Laid Trap",e="BFA",m=895,t="Faction Assault Elite World Quest"}
w[53814]={n="First Sergeant Steelfang",e="BFA",m=895,t="Faction Assault Elite World Quest"}
w[53832]={n="Counter-Sabotage",e="BFA",m=895,t="Faction Assault World Quest"}
w[53857]={n="Cap'n Gorok",e="BFA",m=942,t="Faction Assault Elite World Quest"}
w[53860]={n="Azerite Transport (NOT USED)",e="BFA",m=895,t="PvP World Quest"}
w[53867]={n="Engineer Bolthold",e="BFA",m=896,t="Faction Assault Elite World Quest"}
w[53874]={n="End Their Vigil",e="BFA",m=895,t="World Quest"}
w[53875]={n="Fogsail for a Day",e="BFA",m=895,t="Faction Assault World Quest"}
w[53877]={n="Eastpoint Encounter",e="BFA",m=895,t="Faction Assault World Quest"}
w[53878]={n="Emergency Extrication",e="BFA",m=942,t="Faction Assault World Quest"}
w[53886]={n="Self Guided Tour",e="BFA",m=863,t="Faction Assault World Quest"}
w[53945]={n="Naga Attack!",e="BFA",m=942,t="Elite World Quest"}
w[53950]={n="Explosive Relief",e="BFA",m=895,t="Faction Assault World Quest"}
w[53951]={n="Explosive Relief",e="BFA",m=895,t="Faction Assault World Quest"}
w[53963]={n="Naga Attack!",e="BFA",m=896,t="Elite World Quest"}
w[53979]={n="Naga Attack!",e="BFA",m=896,t="Elite World Quest"}
w[53983]={n="Wet Work: Fort Knight",e="BFA",m=942,t="Faction Assault World Quest"}
w[53994]={n="Naga Attack!",e="BFA",m=895,t="Elite World Quest"}
w[54011]={n="Wet Work: Arom's Stand",e="BFA",m=896,t="Faction Assault World Quest"}
w[54014]={n="Wet Work: Blood in the Sand",e="BFA",m=864,t="Faction Assault World Quest"}
w[54016]={n="Azerite Transport",e="BFA",m=862,t="Faction Assault Elite World Quest"}
w[54017]={n="Wet Work: Warbeast Kraal",e="BFA",m=862,t="Faction Assault World Quest"}
w[54020]={n="Wet Work: Gloomwater Span",e="BFA",m=863,t="Faction Assault World Quest"}
w[54051]={n="Naga Attack!",e="BFA",m=862,t="Elite World Quest"}
w[54060]={n="Naga Attack!",e="BFA",m=862,t="Elite World Quest"}
w[54089]={n="Omgar Doombow",e="BFA",m=896,t="Faction Assault Elite World Quest"}
w[54091]={n="Strong Arm John",e="BFA",m=895,t="Faction Assault Elite World Quest"}
w[54112]={n="Mistweaver Nian",e="BFA",m=895,t="Faction Assault Elite World Quest"}
w[54119]={n="Hartford Sternbach",e="BFA",m=895,t="Faction Assault Elite World Quest"}
w[54127]={n="Rocket Hop",e="BFA",m=864,t="Faction Assault World Quest"}
w[54129]={n="First Mate Malone",e="BFA",m=895,t="Faction Assault Elite World Quest"}
w[54143]={n="Bird's-Eye View",e="BFA",m=896,t="Faction Assault World Quest"}
w[54154]={n="The Hills Have Spies",e="BFA",m=864,t="Faction Assault World Quest"}
w[54162]={n="Hard Landing",e="BFA",m=862,t="Faction Assault World Quest"}
w[54166]={n="Set Sail",e="BFA",m=1165,t="World Quest"}
w[54167]={n="Set Sail",e="BFA",m=1161,t="World Quest"}
w[54170]={n="Ormin Rocketbop",e="BFA",m=864,t="Faction Assault Elite World Quest"}
w[54182]={n="Bilgewater Bash Brothers",e="BFA",m=895,t="Faction Assault Elite World Quest"}
w[54187]={n="Tea for Two",e="BFA",m=896,t="World Quest"}
w[54188]={n="Scrambled Bots",e="BFA",m=864,t="Faction Assault World Quest"}
w[54189]={n="Desert Crawl",e="BFA",m=864,t="Faction Assault World Quest"}
w[54190]={n="Tea for Two",e="BFA",m=896,t="World Quest"}
w[54236]={n="Naga Attack!",e="BFA",m=863,t="Elite World Quest"}
w[54237]={n="Togoth Cruelarm",e="BFA",m=895,t="Faction Assault Elite World Quest"}
w[54243]={n="Gobliteration",e="BFA",m=862,t="World Quest"}
w[54245]={n="Azerite Altercation",e="BFA",m=864,t="Faction Assault World Quest"}
w[54246]={n="Azerite Altercation",e="BFA",m=864,t="Faction Assault World Quest"}
w[54251]={n="The Ambassador",e="BFA",m=895,t="Faction Assault Elite World Quest"}
w[54253]={n="Bombs Away",e="BFA",m=864,t="Faction Assault World Quest"}
w[54254]={n="Bombs Away",e="BFA",m=864,t="Faction Assault World Quest"}
w[54257]={n="Captain Greensails",e="BFA",m=895,t="Faction Assault Elite World Quest"}
w[54266]={n="Mortar Master Zapfritz",e="BFA",m=942,t="Faction Assault Elite World Quest"}
w[54267]={n="Naga Attack!",e="BFA",m=863,t="Elite World Quest"}
w[54268]={n="Impulsive Propulsion",e="BFA",m=895,t="Faction Assault World Quest"}
w[54272]={n="Battle Bots",e="BFA",m=864,t="Faction Assault World Quest"}
w[54273]={n="Battle Bots",e="BFA",m=864,t="Faction Assault World Quest"}
w[54281]={n="Bombing Ballistae",e="BFA",m=895,t="Faction Assault World Quest"}
w[54287]={n="Naga Attack!",e="BFA",m=864,t="Elite World Quest"}
w[54295]={n="Artillery Master Goodwin",e="BFA",m=895,t="Faction Assault Elite World Quest"}
w[54298]={n="Gravity Matters",e="BFA",m=862,t="Faction Assault World Quest"}
w[54308]={n="Mine Your Business",e="BFA",m=942,t="Faction Assault World Quest"}
w[54328]={n="Knight-Captain Joesiph",e="BFA",m=942,t="Faction Assault Elite World Quest"}
w[54403]={n="Tidesage Clarissa",e="BFA",m=942,t="Faction Assault Elite World Quest"}
w[54414]={n="Gale's Unrest",e="BFA",m=942,t="Faction Assault World Quest"}
w[54415]={n="Vulpera for a Day",e="BFA",m=864,t="Faction Assault World Quest"}
w[54434]={n="Voidmaster Evenshade",e="BFA",m=942,t="Faction Assault Elite World Quest"}
w[54437]={n="Owynn Graddock",e="BFA",m=942,t="Faction Assault Elite World Quest"}
w[54442]={n="Beast Tamer Watkins",e="BFA",m=942,t="Faction Assault Elite World Quest"}
w[54448]={n="Elemental Azerite",e="BFA",m=896,t="Faction Assault World Quest"}
w[54449]={n="Elemental Azerite",e="BFA",m=896,t="Faction Assault World Quest"}
w[54467]={n="Legacy in Ruins",e="BFA",m=62,t="World Quest"}
w[54468]={n="Nalaess Featherseeker",e="BFA",m=942,t="Faction Assault Elite World Quest"}
w[54471]={n="Tend the Wounded",e="BFA",m=896,t="Faction Assault World Quest"}
w[54472]={n="Plowing the Field",e="BFA",m=896,t="Faction Assault World Quest"}
w[54488]={n="Zul'aki the Headhunter",e="BFA",m=896,t="Faction Assault Elite World Quest"}
w[54496]={n="Scurvy Dogs!",e="BFA",m=62,t="World Quest"}
w[54497]={n="A Dangerous Combination",e="BFA",m=62,t="World Quest"}
w[54498]={n="Stack On The Tank",e="BFA",m=862,t="Faction Assault World Quest"}
w[54499]={n="Rituals of Twilight",e="BFA",m=62,t="World Quest"}
w[54500]={n="Untapped Potential",e="BFA",m=863,t="Faction Assault World Quest"}
w[54502]={n="It's Raining Mana",e="BFA",m=863,t="Faction Assault World Quest"}
w[54503]={n="This Gang of Mine",e="BFA",m=863,t="Faction Assault World Quest"}
w[54504]={n="Scout Captain Grizzleknob",e="BFA",m=862,t="Faction Assault Elite World Quest"}
w[54505]={n="Get On The Payload",e="BFA",m=862,t="Faction Assault World Quest"}
w[54506]={n="Fungal Infestation",e="BFA",m=896,t="Faction Assault World Quest"}
w[54507]={n="Fungal Infestation",e="BFA",m=896,t="Faction Assault World Quest"}
w[54508]={n="No Bridge Too Dire",e="BFA",m=862,t="Faction Assault Elite World Quest"}
w[54509]={n="Tip of the Trident",e="BFA",m=62,t="World Quest"}
w[54511]={n="Down with the Death Captains!",e="BFA",m=862,t="Faction Assault Elite World Quest"}
w[54512]={n="Cleansing Tide",e="BFA",m=863,t="Faction Assault World Quest"}
w[54513]={n="Dino Time!",e="BFA",m=862,t="Faction Assault Elite World Quest"}
w[54514]={n="Prisoners of the Darkscale",e="BFA",m=62,t="World Quest"}
w[54515]={n="Tidebinder Maka",e="BFA",m=862,t="Faction Assault Elite World Quest"}
w[54516]={n="Crate n' Barrel",e="BFA",m=862,t="Faction Assault World Quest"}
w[54520]={n="Singed Saplings",e="BFA",m=62,t="World Quest"}
w[54521]={n="Stolen Sorcery",e="BFA",m=62,t="World Quest"}
w[54522]={n="Short for an Orc",e="BFA",m=862,t="Faction Assault Elite World Quest"}
w[54523]={n="Blinky Gizmospark",e="BFA",m=862,t="Faction Assault Elite World Quest"}
w[54524]={n="Crate n' Barrel",e="BFA",m=862,t="Faction Assault World Quest"}
w[54525]={n="Tracking Quest",e="BFA",t="Faction Assault World Quest"}
w[54526]={n="Tracking Quest",e="BFA",t="Faction Assault World Quest"}
w[54527]={n="Dinohunter Wildbeard",e="BFA",m=862,t="Faction Assault Elite World Quest"}
w[54528]={n="Back to the Depths",e="BFA",m=62,t="World Quest"}
w[54531]={n="Anything We Can Salvage",e="BFA",m=62,t="World Quest"}
w[54532]={n="Receding Treeline",e="BFA",m=862,t="Faction Assault Elite World Quest"}
w[54533]={n="Barreling Through",e="BFA",m=863,t="Faction Assault World Quest"}
w[54534]={n="The Blightest Touch",e="BFA",m=863,t="Faction Assault World Quest"}
w[54535]={n="Portal Keeper Romiir",e="BFA",m=862,t="Faction Assault Elite World Quest"}
w[54536]={n="Fueling the Flames",e="BFA",m=62,t="World Quest"}
w[54537]={n="Bilestomper",e="BFA",m=862,t="Faction Assault Elite World Quest"}
w[54538]={n="Skirmish at the Span",e="BFA",m=863,t="Faction Assault World Quest"}
w[54539]={n="Skirmish at the Span",e="BFA",m=863,t="Faction Assault World Quest"}
w[54540]={n="Doomrider Helgrim",e="BFA",m=14,t="Rare World Quest"}
w[54541]={n="Knight-Captain Aldrin",e="BFA",m=14,t="Rare World Quest"}
w[54542]={n="Horrific Apparition",e="BFA",m=14,t="Rare World Quest"}
w[54543]={n="Man-Hunter Rog",e="BFA",m=14,t="Rare World Quest"}
w[54544]={n="Beastrider Kama",e="BFA",m=14,t="Rare World Quest"}
w[54545]={n="Nimar the Slayer",e="BFA",m=14,t="Rare World Quest"}
w[54546]={n="Singer",e="BFA",m=14,t="Rare World Quest"}
w[54547]={n="Darbel Montrose",e="BFA",m=14,t="Rare World Quest"}
w[54548]={n="Foulbelly",e="BFA",m=14,t="Rare World Quest"}
w[54549]={n="Kovork",e="BFA",m=14,t="Rare World Quest"}
w[54550]={n="Ruul Onestone",e="BFA",m=14,t="Rare World Quest"}
w[54551]={n="Zalas Witherbark",e="BFA",m=14,t="Rare World Quest"}
w[54552]={n="Geomancer Flintdagger",e="BFA",m=14,t="Rare World Quest"}
w[54553]={n="Kor'gresh Coldrage",e="BFA",m=14,t="Rare World Quest"}
w[54554]={n="Wolfleader Skraug",e="BFA",m=864,t="Faction Assault Elite World Quest"}
w[54555]={n="Siege O' Matic 9000",e="BFA",m=864,t="Faction Assault Elite World Quest"}
w[54561]={n="Zalas Witherbark",e="BFA",m=14,t="Rare World Quest"}
w[54562]={n="Singer",e="BFA",m=14,t="Rare World Quest"}
w[54563]={n="Ruul Onestone",e="BFA",m=14,t="Rare World Quest"}
w[54564]={n="Nimar the Slayer",e="BFA",m=14,t="Rare World Quest"}
w[54565]={n="Man-Hunter Rog",e="BFA",m=14,t="Rare World Quest"}
w[54566]={n="Kovork",e="BFA",m=14,t="Rare World Quest"}
w[54567]={n="Kor'gresh Coldrage",e="BFA",m=14,t="Rare World Quest"}
w[54568]={n="Branchlord Aldrus",e="BFA",m=14,t="Rare Elite World Quest"}
w[54569]={n="Horrific Apparition",e="BFA",m=14,t="Rare World Quest"}
w[54570]={n="Geomancer Flintdagger",e="BFA",m=14,t="Rare World Quest"}
w[54571]={n="Foulbelly",e="BFA",m=14,t="Rare World Quest"}
w[54572]={n="Darbel Montrose",e="BFA",m=14,t="Rare World Quest"}
w[54573]={n="Beastrider Kama",e="BFA",m=14,t="Rare World Quest"}
w[54574]={n="Jin'tago",e="BFA",m=864,t="Faction Assault Elite World Quest"}
w[54578]={n="Branchlord Aldrus",e="BFA",m=14,t="Rare Elite World Quest"}
w[54583]={n="Burning Goliath",e="BFA",m=14,t="Rare Elite World Quest"}
w[54584]={n="Cresting Goliath",e="BFA",m=14,t="Rare Elite World Quest"}
w[54585]={n="Echo of Myzrael",e="BFA",m=14,t="Rare Elite World Quest"}
w[54586]={n="Fozruk",e="BFA",m=14,t="Rare Elite World Quest"}
w[54587]={n="Molok the Crusher",e="BFA",m=14,t="Rare Elite World Quest"}
w[54588]={n="Overseer Krix",e="BFA",m=14,t="Rare Elite World Quest"}
w[54589]={n="Plaguefeather",e="BFA",m=14,t="Rare Elite World Quest"}
w[54590]={n="Ragebeak",e="BFA",m=14,t="Rare Elite World Quest"}
w[54591]={n="Rumbling Goliath",e="BFA",m=14,t="Rare Elite World Quest"}
w[54592]={n="Skullripper",e="BFA",m=14,t="Rare Elite World Quest"}
w[54593]={n="Thundering Goliath",e="BFA",m=14,t="Rare Elite World Quest"}
w[54594]={n="Venomarus",e="BFA",m=14,t="Rare Elite World Quest"}
w[54595]={n="Yogursa",e="BFA",m=14,t="Rare Elite World Quest"}
w[54596]={n="Yogursa",e="BFA",m=14,t="Rare Elite World Quest"}
w[54597]={n="Venomarus",e="BFA",m=14,t="Rare Elite World Quest"}
w[54598]={n="Thundering Goliath",e="BFA",m=14,t="Rare Elite World Quest"}
w[54599]={n="Skullripper",e="BFA",m=14,t="Rare Elite World Quest"}
w[54600]={n="Rumbling Goliath",e="BFA",m=14,t="Rare Elite World Quest"}
w[54601]={n="Ragebeak",e="BFA",m=14,t="Rare Elite World Quest"}
w[54602]={n="Plaguefeather",e="BFA",m=14,t="Rare Elite World Quest"}
w[54603]={n="Overseer Krix",e="BFA",m=14,t="Rare Elite World Quest"}
w[54604]={n="Molok the Crusher",e="BFA",m=14,t="Rare Elite World Quest"}
w[54605]={n="Fozruk",e="BFA",m=14,t="Rare Elite World Quest"}
w[54606]={n="Echo of Myzrael",e="BFA",m=14,t="Rare Elite World Quest"}
w[54607]={n="Cresting Goliath",e="BFA",m=14,t="Rare Elite World Quest"}
w[54608]={n="Burning Goliath",e="BFA",m=14,t="Rare Elite World Quest"}
w[54609]={n="Beastlord Drakara",e="BFA",m=864,t="Faction Assault Elite World Quest"}
w[54612]={n="Blood and Ashes",e="BFA",m=62,t="World Quest"}
w[54613]={n="Twice-Exiled",e="BFA",m=14,t="World Quest"}
w[54614]={n="Executing Exorcisms",e="BFA",m=14,t="World Quest"}
w[54615]={n="The League Will Lose",e="BFA",m=14,t="World Quest"}
w[54616]={n="Boulderfist Beatdown",e="BFA",m=14,t="World Quest"}
w[54617]={n="Sins of the Syndicate",e="BFA",m=14,t="World Quest"}
w[54619]={n="Wiping Out the Witherbark",e="BFA",m=14,t="World Quest"}
w[54620]={n="Death to The Defilers",e="BFA",m=14,t="World Quest"}
w[54621]={n="Twice-Exiled",e="BFA",m=14,t="World Quest"}
w[54622]={n="Executing Exorcisms",e="BFA",m=14,t="World Quest"}
w[54623]={n="Boulderfist Beatdown",e="BFA",m=14,t="World Quest"}
w[54624]={n="Sins of the Syndicate",e="BFA",m=14,t="World Quest"}
w[54625]={n="Wiping Out the Witherbark",e="BFA",m=14,t="World Quest"}
w[54636]={n="Sandbinder Sodir",e="BFA",m=864,t="Faction Assault Elite World Quest"}
w[54638]={n="Beat Up the Drums",e="BFA",m=864,t="Faction Assault Elite World Quest"}
w[54643]={n="Evezon the Eternal",e="BFA",m=864,t="Faction Assault Elite World Quest"}
w[54644]={n="Azerite Transport",e="BFA",m=864,t="Faction Assault Elite World Quest"}
w[54645]={n="Fury of the Earth",e="BFA",m=864,t="Faction Assault Elite World Quest"}
w[54646]={n="Grand Marshal Fury",e="BFA",m=864,t="Faction Assault Elite World Quest"}
w[54647]={n="Ale Intent",e="BFA",m=942,t="Faction Assault World Quest"}
w[54648]={n="Kaldorei Resurgence",e="BFA",m=62,t="World Quest"}
w[54649]={n="Flames of War",e="BFA",m=864,t="Faction Assault Elite World Quest"}
w[54650]={n="Muk'luk",e="BFA",m=896,t="Faction Assault Elite World Quest"}
w[54662]={n="Brought to Light",e="BFA",m=896,t="Faction Assault World Quest"}
w[54663]={n="Shadow Hunter Vol'tris",e="BFA",m=863,t="Faction Assault Elite World Quest"}
w[54664]={n="Azerite Transport",e="BFA",m=863,t="Faction Assault Elite World Quest"}
w[54665]={n="Duchess Fallensong",e="BFA",m=896,t="Faction Assault Elite World Quest"}
w[54666]={n="Packmaster Swiftarrow",e="BFA",m=896,t="Faction Assault Elite World Quest"}
w[54667]={n="Legacy in Ruins",e="BFA",m=62,t="World Quest"}
w[54668]={n="Out of Their Mine",e="BFA",m=62,t="World Quest"}
w[54669]={n="A Dangerous Combination",e="BFA",m=62,t="World Quest"}
w[54671]={n="Overgrown Ancient",e="BFA",m=863,t="Faction Assault Elite World Quest"}
w[54672]={n="Rituals of Twilight",e="BFA",m=62,t="World Quest"}
w[54673]={n="Tip of the Trident",e="BFA",m=62,t="World Quest"}
w[54674]={n="Prisoners of the Darkscale",e="BFA",m=62,t="World Quest"}
w[54675]={n="Hunting Season",e="BFA",m=62,t="World Quest"}
w[54676]={n="Shards of Narassin",e="BFA",m=62,t="World Quest"}
w[54677]={n="Back to the Depths",e="BFA",m=62,t="World Quest"}
w[54678]={n="Anything We Can Salvage",e="BFA",m=62,t="World Quest"}
w[54679]={n="Fueling the Flames",e="BFA",m=62,t="World Quest"}
w[54680]={n="Plague Master Herbert",e="BFA",m=863,t="Faction Assault Elite World Quest"}
w[54681]={n="Azerite Caravan",e="BFA",m=896,t="Faction Assault Elite World Quest"}
w[54684]={n="Arcanist Quintril",e="BFA",m=863,t="Faction Assault Elite World Quest"}
w[54685]={n="They Love Iron",e="BFA",m=862,t="Faction Assault World Quest"}
w[54686]={n="Medical Emergency",e="BFA",m=896,t="Faction Assault Elite World Quest"}
w[54688]={n="Inquisitor Erik",e="BFA",m=896,t="Faction Assault Elite World Quest"}
w[54689]={n="Lights Out",e="BFA",m=896,t="Faction Assault World Quest"}
w[54690]={n="Maddok the Sniper",e="BFA",m=896,t="Faction Assault Elite World Quest"}
w[54691]={n="Brewmaster Lin",e="BFA",m=863,t="Faction Assault Elite World Quest"}
w[54692]={n="Magister Crystalynn",e="BFA",m=896,t="Faction Assault Elite World Quest"}
w[54693]={n="Pterror of the Horde",e="BFA",m=863,t="Faction Assault Elite World Quest"}
w[54694]={n="Stormcaller Morka",e="BFA",m=863,t="Faction Assault Elite World Quest"}
w[54697]={n="Lightforged Warframe",e="BFA",m=863,t="Faction Assault Elite World Quest"}
w[54698]={n="Shattering Spears",e="BFA",m=62,t="World Quest"}
w[54699]={n="Classic Gnomish Engineering",e="BFA",m=863,t="Faction Assault Elite World Quest"}
w[54700]={n="Thomas Vandergrief",e="BFA",m=863,t="Faction Assault Elite World Quest"}
w[54701]={n="Wrath of the Ravasaur",e="BFA",m=862,t="Faction Assault World Quest"}
w[54707]={n="Siegeotron",e="BFA",m=863,t="Faction Assault Elite World Quest"}
w[54711]={n="Zillie Wunderwrench and Grizzwald",e="BFA",m=896,t="Faction Assault Elite World Quest"}
w[54712]={n="Spell Components",e="BFA",m=862,t="Faction Assault World Quest"}
w[54719]={n="Worgen in the Ore Mine",e="BFA",m=62,t="World Quest"}
w[54722]={n="Turning the Tides",e="BFA",m=62,t="World Quest"}
w[54724]={n="Ending the Blackwood",e="BFA",m=62,t="World Quest"}
w[54784]={n="Blackwood Liberation",e="BFA",m=62,t="World Quest"}
w[54786]={n="Stop the Shipments",e="BFA",m=864,t="Faction Assault World Quest"}
w[54788]={n="Hydrath",e="BFA",m=62,t="Rare Elite World Quest"}
w[54789]={n="Cyclarus",e="BFA",m=62,t="Rare Elite World Quest"}
w[54790]={n="Conflagros",e="BFA",m=62,t="Rare Elite World Quest"}
w[54791]={n="Granokk",e="BFA",m=62,t="Rare Elite World Quest"}
w[54792]={n="Onu",e="BFA",m=62,t="Rare Elite World Quest"}
w[54793]={n="Athrikus Narassin",e="BFA",m=62,t="Rare Elite World Quest"}
w[54794]={n="Soggoth the Slitherer",e="BFA",m=62,t="Rare Elite World Quest"}
w[54795]={n="Aman",e="BFA",m=62,t="Rare Elite World Quest"}
w[54796]={n="Shattershard",e="BFA",m=62,t="Rare Elite World Quest"}
w[54797]={n="Alash'anir",e="BFA",m=62,t="Rare Elite World Quest"}
w[54798]={n="Madfeather",e="BFA",m=62,t="Rare World Quest"}
w[54799]={n="Gren Tornfur",e="BFA",m=62,t="Rare World Quest"}
w[54800]={n="Twilight Prophet Graeme",e="BFA",m=62,t="Rare World Quest"}
w[54801]={n="Stonebinder Ssra'vess",e="BFA",m=62,t="Rare World Quest"}
w[54802]={n="Mrggr'marr",e="BFA",m=62,t="Rare World Quest"}
w[54803]={n="Glimmerspine",e="BFA",m=62,t="Rare World Quest"}
w[54804]={n="Glrglrr",e="BFA",m=62,t="Rare World Quest"}
w[54805]={n="Scalefiend",e="BFA",m=62,t="Rare World Quest"}
w[54806]={n="Commander Ral'esh",e="BFA",m=62,t="Rare World Quest"}
w[54807]={n="Sapper Odette",e="BFA",m=62,t="Rare World Quest"}
w[54808]={n="Thelar Moonstrike",e="BFA",m=62,t="Rare World Quest"}
w[54809]={n="Athil Dewfire",e="BFA",m=62,t="Rare World Quest"}
w[54810]={n="Grimhorn",e="BFA",m=62,t="Rare World Quest"}
w[54811]={n="Blackpaw",e="BFA",m=62,t="Rare World Quest"}
w[54812]={n="Shadowclaw",e="BFA",m=62,t="Rare World Quest"}
w[54816]={n="Hydrath",e="BFA",m=62,t="Rare Elite World Quest"}
w[54817]={n="Cyclarus",e="BFA",m=62,t="Rare Elite World Quest"}
w[54818]={n="Conflagros",e="BFA",m=62,t="Rare Elite World Quest"}
w[54819]={n="Granokk",e="BFA",m=62,t="Rare Elite World Quest"}
w[54820]={n="Zim'kaga",e="BFA",m=62,t="Rare Elite World Quest"}
w[54821]={n="Athrikus Narassin",e="BFA",m=62,t="Rare Elite World Quest"}
w[54822]={n="Soggoth the Slitherer",e="BFA",m=62,t="Rare Elite World Quest"}
w[54823]={n="Aman",e="BFA",m=62,t="Rare Elite World Quest"}
w[54824]={n="Shattershard",e="BFA",m=62,t="Rare Elite World Quest"}
w[54825]={n="Alash'anir",e="BFA",m=62,t="Rare Elite World Quest"}
w[54826]={n="Madfeather",e="BFA",m=62,t="Rare World Quest"}
w[54827]={n="Gren Tornfur",e="BFA",m=62,t="Rare World Quest"}
w[54828]={n="Twilight Prophet Graeme",e="BFA",m=62,t="Rare World Quest"}
w[54829]={n="Stonebinder Ssra'vess",e="BFA",m=62,t="Rare World Quest"}
w[54830]={n="Mrggr'marr",e="BFA",m=62,t="Rare World Quest"}
w[54831]={n="Glimmerspine",e="BFA",m=62,t="Rare World Quest"}
w[54832]={n="Glrglrr",e="BFA",m=62,t="Rare World Quest"}
w[54833]={n="Scalefiend",e="BFA",m=62,t="Rare World Quest"}
w[54834]={n="Commander Ral'esh",e="BFA",m=62,t="Rare World Quest"}
w[54835]={n="Moxo the Beheader",e="BFA",m=62,t="Rare World Quest"}
w[54836]={n="Commander Drald",e="BFA",m=62,t="Rare World Quest"}
w[54837]={n="Burninator Mark V",e="BFA",m=62,t="Rare World Quest"}
w[54838]={n="Croz Bloodrage",e="BFA",m=62,t="Rare World Quest"}
w[54839]={n="Rightfully Ours",e="BFA",m=863,t="Faction Assault Elite World Quest"}
w[54840]={n="Agathe Wyrmwood",e="BFA",m=62,t="Rare World Quest"}
w[54841]={n="Orwell Stevenson",e="BFA",m=62,t="Rare World Quest"}
w[54856]={n="Bilgewater Bandits",e="BFA",m=62,t="World Quest"}
w[54857]={n="Turning the Tides",e="BFA",m=62,t="World Quest"}
w[54858]={n="Glaive Consequences",e="BFA",m=62,t="World Quest"}
w[54895]={n="Ivus the Decayed",e="BFA",m=62,t="Epic Elite World Quest"}
w[54896]={n="Ivus the Forest Lord",e="BFA",m=62,t="Epic Elite World Quest"}
w[54949]={n="More Mouths To Feed",e="BFA",m=1355,t="Combat Ally Quest"}
w[55032]={n="Unchained Resistance",e="BFA",m=1355,t="Combat Ally Quest"}
w[55215]={n="The Cycle of Life",e="BFA",m=896,t="Tortollan World Quest - 8.0"}
w[55264]={n="Calligraphy",e="BFA",m=896,t="Tortollan World Quest - 8.0"}
w[55300]={n="The Cycle of Life",e="BFA",m=895,t="Tortollan World Quest - 8.0"}
w[55301]={n="The Cycle of Life",e="BFA",m=942,t="Tortollan World Quest - 8.0"}
w[55302]={n="The Cycle of Life",e="BFA",m=863,t="Tortollan World Quest - 8.0"}
w[55303]={n="The Cycle of Life",e="BFA",m=864,t="Tortollan World Quest - 8.0"}
w[55304]={n="The Cycle of Life",e="BFA",m=862,t="Tortollan World Quest - 8.0"}
w[55340]={n="Calligraphy",e="BFA",m=895,t="Tortollan World Quest - 8.0"}
w[55341]={n="Calligraphy",e="BFA",m=942,t="Tortollan World Quest - 8.0"}
w[55342]={n="Calligraphy",e="BFA",m=863,t="Tortollan World Quest - 8.0"}
w[55343]={n="Calligraphy",e="BFA",m=864,t="Tortollan World Quest - 8.0"}
w[55344]={n="Calligraphy",e="BFA",m=862,t="Tortollan World Quest - 8.0"}
w[55354]={n="The Vir'nall Front",e="BFA",t="World Quest"}
w[55355]={n="Lightblade Training Grounds",e="BFA",t="World Quest"}
w[55356]={n="Beacon of the Sun King",e="BFA",t="World Quest"}
w[55357]={n="Beacon of the Sun King",e="BFA",t="World Quest"}
w[55358]={n="Beacon of the Sun King",e="BFA",t="World Quest"}
w[55359]={n="Ritual of Ascendancy",e="BFA",t="World Quest"}
w[55360]={n="The Unsealed Tomb",e="BFA",t="World Quest"}
w[55466]={n="Vuk'laz the Earthbreaker",e="BFA",m=1527,t="Epic Elite World Quest"}
w[55625]={n="Pearls of Unimaginable Power",e="BFA",m=1355,t="Combat Ally Quest"}
w[55633]={n="The Sunken Chest",e="BFA",m=1355,t="Combat Ally Quest"}
w[55636]={n="A Life's Work",e="BFA",m=1355,t="Combat Ally Quest"}
w[55637]={n="Poor, Unfortunate Souls",e="BFA",m=1355,t="Combat Ally Quest"}
w[55638]={n="Making Kelpberry Wine",e="BFA",m=1355,t="Combat Ally Quest"}
w[55640]={n="Vision of Stormwind",e="BFA",m=37,t="Rare World Quest"}
w[55659]={n="Relics of the Sundering",e="BFA",m=1355,t="Combat Ally Quest"}
w[55661]={n="Fighting Venomous With Venom",e="BFA",m=1355,t="Combat Ally Quest"}
w[55662]={n="Arcane Cache",e="BFA",m=1355,t="Combat Ally Quest"}
w[55663]={n="Broken Controller",e="BFA",m=1355,t="Combat Ally Quest"}
w[55664]={n="A Blow to Morale",e="BFA",m=1355,t="Combat Ally Quest"}
w[55665]={n="The Dark Garden",e="BFA",m=1355,t="Combat Ally Quest"}
w[55670]={n="Amathet Raiding Fleet",e="BFA",t="World Quest"}
w[55681]={n="Crab Marks The Spot",e="BFA",m=1355,t="Combat Ally Quest"}
w[55683]={n="Forgotten Memories",e="BFA",m=1355,t="Combat Ally Quest"}
w[55701]={n="Snapdragon Claws",e="BFA",m=1355,t="Combat Ally Quest"}
w[55714]={n="Void Cache",e="BFA",m=1355,t="Combat Ally Quest"}
w[55715]={n="Feed Them All",e="BFA",m=1355,t="Combat Ally Quest"}
w[55728]={n="Reinforced Cache",e="BFA",m=1355,t="Combat Ally Quest"}
w[55750]={n="WANTED: Lady Naz'jess",e="BFA",m=1355,t="Combat Ally Quest"}
w[55751]={n="The Heart of the Water",e="BFA",m=1355,t="Combat Ally Quest"}
w[55766]={n="She Sells These Shells",e="BFA",m=1355,t="Combat Ally Quest"}
w[55767]={n="Misdirection",e="BFA",m=1355,t="Combat Ally Quest"}
w[55768]={n="Emergent Sea Weeds",e="BFA",m=1355,t="Combat Ally Quest"}
w[55770]={n="WANTED: Commander Sarj'eth",e="BFA",m=1355,t="Combat Ally Quest"}
w[55771]={n="WANTED: Lord Ha'kass",e="BFA",m=1355,t="Combat Ally Quest"}
w[55772]={n="WANTED: Lady Narjiss",e="BFA",m=1355,t="Combat Ally Quest"}
w[55773]={n="WANTED: Gler'thogg",e="BFA",m=1355,t="Combat Ally Quest"}
w[55774]={n="WANTED: Inquisitor Ithriza",e="BFA",m=1355,t="Combat Ally Quest"}
w[55775]={n="WANTED: Haggronar",e="BFA",m=1355,t="Combat Ally Quest"}
w[55776]={n="WANTED: Emorneth",e="BFA",m=1355,t="Combat Ally Quest"}
w[55777]={n="WANTED: Braxicus",e="BFA",m=1355,t="Combat Ally Quest"}
w[55845]={n="Plans of Attack",e="BFA",m=1355,t="Combat Ally Quest"}
w[55846]={n="Forbidden Rituals",e="BFA",m=1355,t="Combat Ally Quest"}
w[55871]={n="Gather Friends",e="BFA",m=1355,t="Combat Ally Quest"}
w[55872]={n="Where They Hide",e="BFA",m=1355,t="Combat Ally Quest"}
w[55873]={n="Kill the Kritch",e="BFA",m=1355,t="Combat Ally Quest"}
w[55874]={n="Plug the Geysers",e="BFA",m=1355,t="Combat Ally Quest"}
w[55875]={n="Plug the Geysers",e="BFA",m=1355,t="Combat Ally Quest"}
w[55876]={n="Plug the Geysers",e="BFA",m=1355,t="Combat Ally Quest"}
w[55877]={n="Plug the Geysers",e="BFA",m=1355,t="Combat Ally Quest"}
w[55878]={n="Plug the Geysers",e="BFA",m=1355,t="Combat Ally Quest"}
w[55883]={n="To Soar Like a Ray",e="BFA",m=1355,t="Combat Ally Quest"}
w[55884]={n="Infestation of Madness",e="BFA",m=1355,t="World Quest"}
w[55886]={n="The Zanj'ir Brutalizer",e="BFA",m=1355,t="Rare World Quest"}
w[55887]={n="Champion Alzana, Arrow of Thunder",e="BFA",m=1355,t="Rare Elite World Quest"}
w[55888]={n="Champion Qalina, Spear of Ice",e="BFA",m=1355,t="Rare Elite World Quest"}
w[55889]={n="Champion Kyx'zhul the Deepspeaker",e="BFA",m=1355,t="Rare Elite World Quest"}
w[55890]={n="Champion Vyz'olgo the Mind-Taker",e="BFA",m=1355,t="Rare Elite World Quest"}
w[55891]={n="Champion Aldrantiss, Defender of Her Kingdom",e="BFA",m=1355,t="Rare Elite World Quest"}
w[55892]={n="Champion Eldanar, Shield of Her Glory",e="BFA",m=1355,t="Rare Elite World Quest"}
w[55893]={n="Azanz, the Slitherblade",e="BFA",m=1355,t="Rare World Quest"}
w[55894]={n="Zoko, Her Iron Defender",e="BFA",m=1355,t="Rare World Quest"}
w[55895]={n="Frozen Winds of Zhiela",e="BFA",m=1355,t="Rare World Quest"}
w[55896]={n="Undana, Chilling Assassin",e="BFA",m=1355,t="Rare World Quest"}
w[55897]={n="Szun, Breaker of Slaves",e="BFA",m=1355,t="Rare World Quest"}
w[55898]={n="Tempest-Speaker Shalan'ali",e="BFA",m=1355,t="Rare World Quest"}
w[55899]={n="Starseeker of the Shirakess",e="BFA",m=1355,t="Rare World Quest"}
w[55900]={n="Kassar, Wielder of Dark Blades",e="BFA",m=1355,t="Rare World Quest"}
w[55901]={n="Rustbolt Rebellion",e="BFA",m=1462,t="World Quest"}
w[55970]={n="Attrition",e="BFA",m=1355,t="World Quest"}
w[55973]={n="Deepcoil Experiments",e="BFA",m=1355,t="World Quest"}
w[55980]={n="Turn the Scale",e="BFA",m=1355,t="Combat Ally Quest"}
w[55982]={n="The Lords of Water",e="BFA",m=1355,t="World Quest"}
w[55984]={n="A Good Offense",e="BFA",m=1355,t="Combat Ally Quest"}
w[55985]={n="Extra Shiny",e="BFA",m=1355,t="Combat Ally Quest"}
w[55986]={n="Break a Few Eggs",e="BFA",m=1355,t="Combat Ally Quest"}
w[55993]={n="A Little Edge",e="BFA",m=1355,t="Combat Ally Quest"}
w[55997]={n="Hungry Hungry Hydras",e="BFA",m=1355,t="World Quest"}
w[56000]={n="We've Got Crabs!",e="BFA",m=1355,t="Combat Ally Quest"}
w[56001]={n="Drunk Angry Murlocs",e="BFA",m=1355,t="Combat Ally Quest"}
w[56002]={n="Mgglurky's Mugglrgl",e="BFA",m=1355,t="Combat Ally Quest"}
w[56003]={n="Runelocked Chest",e="BFA",m=1355,t="World Quest"}
w[56006]={n="Runelocked Chest",e="BFA",m=1355,t="World Quest"}
w[56007]={n="Runelocked Chest",e="BFA",m=1355,t="World Quest"}
w[56008]={n="Runelocked Chest",e="BFA",m=1355,t="World Quest"}
w[56009]={n="Runelocked Chest",e="BFA",m=1355,t="World Quest"}
w[56010]={n="Runelocked Chest",e="BFA",m=1355,t="World Quest"}
w[56011]={n="Runelocked Chest",e="BFA",m=1355,t="World Quest"}
w[56012]={n="Runelocked Chest",e="BFA",m=1355,t="World Quest"}
w[56013]={n="Runelocked Chest",e="BFA",m=1355,t="World Quest"}
w[56014]={n="Runelocked Chest",e="BFA",m=1355,t="World Quest"}
w[56015]={n="Runelocked Chest",e="BFA",m=1355,t="World Quest"}
w[56016]={n="Runelocked Chest",e="BFA",m=1355,t="World Quest"}
w[56017]={n="Runelocked Chest",e="BFA",m=1355,t="World Quest"}
w[56018]={n="Runelocked Chest",e="BFA",m=1355,t="World Quest"}
w[56019]={n="Runelocked Chest",e="BFA",m=1355,t="World Quest"}
w[56020]={n="Runelocked Chest",e="BFA",m=1355,t="World Quest"}
w[56021]={n="Runelocked Chest",e="BFA",m=1355,t="World Quest"}
w[56022]={n="Runelocked Chest",e="BFA",m=1355,t="World Quest"}
w[56023]={n="Leylocked Chest",e="BFA",m=1355,t="World Quest"}
w[56024]={n="Leylocked Chest",e="BFA",m=1355,t="World Quest"}
w[56025]={n="Leylocked Chest",e="BFA",m=1355,t="World Quest"}
w[56032]={n="Dirty Dozen",e="BFA",m=1355,t="World Quest"}
w[56035]={n="Most Delicious Clams",e="BFA",m=1355,t="Combat Ally Quest"}
w[56036]={n="A Steamy Situation",e="BFA",m=1355,t="World Quest"}
w[56041]={n="Give 'Em Shell",e="BFA",m=1355,t="World Quest"}
w[56048]={n="The Drowned Oracles",e="BFA",m=1355,t="World Quest"}
w[56050]={n="PvP Event: Battle for Nazjatar",e="BFA",t="PvP World Quest"}
w[56056]={n="Terror of the Depths",e="BFA",m=1355,t="Epic Elite World Quest"}
w[56057]={n="The Soulbinder",e="BFA",m=1355,t="Epic Elite World Quest"}
w[56074]={n="Void Conduit",e="BFA",m=1530,t="World Quest"}
w[56075]={n="Stolen Power",e="BFA",m=1355,t="Combat Ally Quest"}
w[56076]={n="Abyssal Ritual",e="BFA",m=1530,t="World Quest"}
w[56078]={n="Time to Krill",e="BFA",m=1355,t="World Quest"}
w[56090]={n="Stormstout Holdout",e="BFA",m=1530,t="World Quest"}
w[56099]={n="Font of Corruption",e="BFA",m=1530,t="World Quest"}
w[56121]={n="Jumping Jellies",e="BFA",m=1355,t="World Quest"}
w[56131]={n="Security First",e="BFA",m=1462,t="World Quest"}
w[56139]={n="Junkyard Treasures",e="BFA",m=1462,t="World Quest"}
w[56141]={n="Security First",e="BFA",m=1462,t="World Quest"}
w[56146]={n="Making Kelpberry Wine",e="BFA",m=1355,t="Combat Ally Quest"}
w[56149]={n="Feed Them All",e="BFA",m=1355,t="Combat Ally Quest"}
w[56150]={n="Kill the Kritch",e="BFA",m=1355,t="Combat Ally Quest"}
w[56151]={n="Poen's Favorite Dish",e="BFA",m=1355,t="Combat Ally Quest"}
w[56152]={n="Turn the Scale",e="BFA",m=1355,t="Combat Ally Quest"}
w[56153]={n="Most Delicious Clams",e="BFA",m=1355,t="Combat Ally Quest"}
w[56154]={n="Where They Hide",e="BFA",m=1355,t="Combat Ally Quest"}
w[56155]={n="Plug the Geysers",e="BFA",m=1355,t="Combat Ally Quest"}
w[56157]={n="Plug the Geysers",e="BFA",m=1355,t="Combat Ally Quest"}
w[56158]={n="Plug the Geysers",e="BFA",m=1355,t="Combat Ally Quest"}
w[56159]={n="Plug the Geysers",e="BFA",m=1355,t="Combat Ally Quest"}
w[56160]={n="Plug the Geysers",e="BFA",m=1355,t="Combat Ally Quest"}
w[56163]={n="Bound Elemental",e="BFA",m=1530,t="World Quest"}
w[56177]={n="Void Conduit",e="BFA",m=1530,t="World Quest"}
w[56178]={n="Void Conduit",e="BFA",m=1530,t="World Quest"}
w[56180]={n="Bound Elemental",e="BFA",m=1530,t="World Quest"}
w[56222]={n="WANTED: Lady Naz'jess",e="BFA",m=1355,t="Combat Ally Quest"}
w[56223]={n="WANTED: Commander Sarj'eth",e="BFA",m=1355,t="Combat Ally Quest"}
w[56224]={n="WANTED: Lord Ha'kass",e="BFA",m=1355,t="Combat Ally Quest"}
w[56225]={n="WANTED: Lady Narjiss",e="BFA",m=1355,t="Combat Ally Quest"}
w[56226]={n="WANTED: Gler'thogg",e="BFA",m=1355,t="Combat Ally Quest"}
w[56227]={n="WANTED: Inquisitor Ithriza",e="BFA",m=1355,t="Combat Ally Quest"}
w[56231]={n="Reinforced Cache",e="BFA",m=1355,t="Combat Ally Quest"}
w[56232]={n="Void Cache",e="BFA",m=1355,t="Combat Ally Quest"}
w[56233]={n="Arcane Cache",e="BFA",m=1355,t="Combat Ally Quest"}
w[56264]={n="We've Got Crabs!",e="BFA",m=1355,t="Combat Ally Quest"}
w[56265]={n="Drunk Angry Murlocs",e="BFA",m=1355,t="Combat Ally Quest"}
w[56266]={n="Mgglurky's Mugglrgl",e="BFA",m=1355,t="Combat Ally Quest"}
w[56370]={n="Break a Few Eggs",e="BFA",m=1355,t="Combat Ally Quest"}
w[56381]={n="Prince Wiggletail",e="BFA",m=1355,t="Battle Pet World Quest"}
w[56382]={n="Chomp",e="BFA",m=1355,t="Battle Pet World Quest"}
w[56383]={n="Silence",e="BFA",m=1355,t="Battle Pet World Quest"}
w[56384]={n="Shadowspike Lurker",e="BFA",m=1355,t="Battle Pet World Quest"}
w[56385]={n="Pearlhusk Crawler",e="BFA",m=1355,t="Battle Pet World Quest"}
w[56386]={n="Elderspawn of Nalaada",e="BFA",m=1355,t="Battle Pet World Quest"}
w[56387]={n="Ravenous Scalespawn",e="BFA",m=1355,t="Battle Pet World Quest"}
w[56388]={n="Mindshackle",e="BFA",m=1355,t="Battle Pet World Quest"}
w[56389]={n="Kelpstone",e="BFA",m=1355,t="Battle Pet World Quest"}
w[56390]={n="Voltgorger",e="BFA",m=1355,t="Battle Pet World Quest"}
w[56391]={n="Frenzied Knifefang",e="BFA",m=1355,t="Battle Pet World Quest"}
w[56392]={n="Giant Opaline Conch",e="BFA",m=1355,t="Battle Pet World Quest"}
w[56393]={n="Gnomefeaster",e="BFA",m=1462,t="Battle Pet World Quest"}
w[56394]={n="Sputtertube",e="BFA",m=1462,t="Battle Pet World Quest"}
w[56395]={n="Goldenbot XD",e="BFA",m=1462,t="Battle Pet World Quest"}
w[56396]={n="Creakclank",e="BFA",m=1462,t="Battle Pet World Quest"}
w[56397]={n="CK-9 Micro-Oppression Unit",e="BFA",m=1462,t="Battle Pet World Quest"}
w[56398]={n="Unit 35",e="BFA",m=1462,t="Battle Pet World Quest"}
w[56399]={n="Unit 6",e="BFA",m=1462,t="Battle Pet World Quest"}
w[56400]={n="Unit 17",e="BFA",m=1462,t="Battle Pet World Quest"}
w[56570]={n="Work Order: Greater Flask of the Currents",e="BFA",m=1355,t="Alchemy World Quest"}
w[56767]={n="Work Order: Greater Flask of Endless Fathoms",e="BFA",m=1355,t="Alchemy World Quest"}
w[56768]={n="Work Order: Greater Flask of the Undertow",e="BFA",m=1355,t="Alchemy World Quest"}
w[56769]={n="Work Order: Greater Flask of the Vast Horizon",e="BFA",m=1355,t="Alchemy World Quest"}
w[56770]={n="Work Order: Greater Flask of the Currents",e="BFA",m=1355,t="Alchemy World Quest"}
w[56772]={n="Work Order: Greater Flask of Endless Fathoms",e="BFA",m=1355,t="Alchemy World Quest"}
w[56773]={n="Work Order: Greater Flask of the Vast Horizon",e="BFA",m=1355,t="Alchemy World Quest"}
w[56774]={n="Work Order: Greater Flask of the Undertow",e="BFA",m=1355,t="Alchemy World Quest"}
w[56793]={n="Work Order: Mech-Dowel's \"Big Mech\"",e="BFA",m=1355,t="Cooking World Quest"}
w[56794]={n="Work Order: Baked Port Tato",e="BFA",m=1355,t="Cooking World Quest"}
w[56795]={n="Work Order: Abyssal-Fried Rissole",e="BFA",m=1355,t="Cooking World Quest"}
w[56796]={n="Work Order: Fragrant Kakavia",e="BFA",m=1355,t="Cooking World Quest"}
w[56797]={n="Work Order: Bil'Tong",e="BFA",m=1355,t="Cooking World Quest"}
w[56798]={n="Work Order: Bil'Tong",e="BFA",m=1355,t="Cooking World Quest"}
w[56799]={n="Work Order: Fragrant Kakavia",e="BFA",m=1355,t="Cooking World Quest"}
w[56800]={n="Work Order: Abyssal-Fried Rissole",e="BFA",m=1355,t="Cooking World Quest"}
w[56801]={n="Work Order: Baked Port Tato",e="BFA",m=1355,t="Cooking World Quest"}
w[56802]={n="Work Order: Mech-Dowel's \"Big Mech\"",e="BFA",m=1355,t="Cooking World Quest"}
w[56818]={n="Work Order: Enchant Weapon - Naga Hide",e="BFA",m=1355,t="Enchanting World Quest"}
w[56819]={n="Work Order: Enchant Weapon - Oceanic Restoration",e="BFA",m=1355,t="Enchanting World Quest"}
w[56820]={n="Work Order: Enchant Weapon - Force Multiplier",e="BFA",m=1355,t="Enchanting World Quest"}
w[56821]={n="Work Order: Enchant Weapon - Machinist's Brilliance",e="BFA",m=1355,t="Enchanting World Quest"}
w[56824]={n="Work Order: Enchant Weapon - Machinist's Brilliance",e="BFA",m=1355,t="Enchanting World Quest"}
w[56825]={n="Work Order: Enchant Weapon - Oceanic Restoration",e="BFA",m=1355,t="Enchanting World Quest"}
w[56826]={n="Work Order: Enchant Weapon - Force Multiplier",e="BFA",m=1355,t="Enchanting World Quest"}
w[56827]={n="Work Order: Enchant Weapon - Naga Hide",e="BFA",m=1355,t="Enchanting World Quest"}
w[56914]={n="Angry Residents",e="BFA",t="Battle Pet World Quest"}
w[56934]={n="Obsidian Destroyer",e="BFA",t="World Quest"}
w[57023]={n="Weighted Mogu Artifact",e="BFA",m=1530,t="World Quest"}
w[57049]={n="Vault of Souls",e="BFA",t="World Quest"}
w[57085]={n="Empowered War Wagon",e="BFA",m=1530,t="World Quest"}
w[57087]={n="Baruk Obliterator",e="BFA",m=1530,t="World Quest"}
w[57089]={n="Vil'thik Hatchery",e="BFA",m=1530,t="World Quest"}
w[57101]={n="Zan-Tien Serpent Cage",e="BFA",m=1530,t="World Quest"}
w[57146]={n="Corruption Tear",e="BFA",m=1530,t="World Quest"}
w[57158]={n="Electric Empowerment",e="BFA",m=1530,t="World Quest"}
w[57171]={n="Goldbough Guardian",e="BFA",m=1530,t="World Quest"}
w[57205]={n="A Few Bumps Along the Way",e="SHADOWLANDS",m=1536,t="World Quest"}
w[57215]={n="Engine of Ascension",e="BFA",t="World Quest"}
w[57217]={n="Unearthed Keeper",e="BFA",t="World Quest"}
w[57218]={n="Unearthed Keeper",e="BFA",t="World Quest"}
w[57219]={n="Unearthed Keeper",e="BFA",t="World Quest"}
w[57223]={n="Unearthed Keeper",e="BFA",t="World Quest"}
w[57234]={n="Solar Collector",e="BFA",t="World Quest"}
w[57235]={n="Solar Collector",e="BFA",t="World Quest"}
w[57243]={n="Amathet Slave Camp",e="BFA",t="World Quest"}
w[57256]={n="Stormchosen Arena",e="BFA",m=1530,t="World Quest"}
w[57272]={n="Bloodbound Effigy",e="BFA",m=1530,t="World Quest"}
w[57287]={n="Void Tears",e="BFA",m=1527,t="World Quest"}
w[57299]={n="Mysterious Sarcophagus",e="BFA",m=1530,t="World Quest"}
w[57323]={n="Serpent Binding",e="BFA",m=1530,t="World Quest"}
w[57328]={n="Trashin' the Camp",e="SHADOWLANDS",m=1525,t="World Quest"}
w[57330]={n="Time for Revenge",e="BFA",m=1355,t="World Quest"}
w[57331]={n="Salvage Operations",e="BFA",m=1355,t="World Quest"}
w[57333]={n="Terrace Terrors",e="BFA",m=1355,t="World Quest"}
w[57334]={n="Cave of Murlocs",e="BFA",m=1355,t="World Quest"}
w[57335]={n="Murloc Mayhem",e="BFA",m=1355,t="World Quest"}
w[57336]={n="Putting the Past to Rest",e="BFA",m=1355,t="World Quest"}
w[57338]={n="Depopulation Effort",e="BFA",m=1355,t="World Quest"}
w[57339]={n="Construction Ritual",e="BFA",m=1530,t="World Quest"}
w[57340]={n="Fathom Ray Feast",e="BFA",m=1355,t="World Quest"}
w[57353]={n="Deepcoil Cleansing",e="BFA",m=1355,t="World Quest"}
w[57354]={n="Overdue",e="BFA",m=1355,t="World Quest"}
w[57359]={n="Summoning Ritual",e="BFA",m=1527,t="World Quest"}
w[57375]={n="Pulsating Mound",e="BFA",m=1530,t="World Quest"}
w[57379]={n="Infested Jade Statue",e="BFA",m=1530,t="World Quest"}
w[57384]={n="Mending Monstrosity",e="BFA",m=1530,t="World Quest"}
w[57404]={n="Ravager Hive",e="BFA",t="World Quest"}
w[57429]={n="Pyre of the Amalgamated One",e="BFA",m=1527,t="World Quest"}
w[57443]={n="Dirty Job: Demolition Detail",e="SHADOWLANDS",m=1525,t="World Quest"}
w[57445]={n="Chin's Noodle Cart",e="BFA",m=1530,t="World Quest"}
w[57449]={n="Executor of N'Zoth",e="BFA",m=1527,t="World Quest"}
w[57453]={n="Swarm Caller",e="BFA",m=1530,t="World Quest"}
w[57456]={n="Spirit Drinker",e="BFA",m=1527,t="World Quest"}
w[57465]={n="Dirty Job: Wood Work",e="SHADOWLANDS",m=1525,t="World Quest"}
w[57476]={n="Vil'thik Feeding Grounds",e="BFA",m=1530,t="World Quest"}
w[57484]={n="Ritual of Wakening",e="BFA",m=1530,t="World Quest"}
w[57508]={n="Zara'thik War Banner",e="BFA",m=1530,t="World Quest"}
w[57517]={n="Swarm Caller",e="BFA",m=1530,t="World Quest"}
w[57519]={n="Swarm Caller",e="BFA",m=1530,t="World Quest"}
w[57521]={n="Empowered War Wagon",e="BFA",m=1530,t="World Quest"}
w[57522]={n="Call of the Void",e="BFA",m=1527,t="World Quest"}
w[57540]={n="Kunchong Incubator",e="BFA",m=1530,t="World Quest"}
w[57541]={n="Call of the Void",e="BFA",m=1527,t="World Quest"}
w[57542]={n="Swarm Caller",e="BFA",m=1530,t="World Quest"}
w[57543]={n="Executor of N'Zoth",e="BFA",m=1527,t="World Quest"}
w[57556]={n="The Maw - Weekly Treasures",e="SHADOWLANDS",t="World Quest"}
w[57558]={n="Vil'thik Hatchery",e="BFA",m=1530,t="World Quest"}
w[57580]={n="Executor of N'Zoth",e="BFA",t="World Quest"}
w[57582]={n="Executor of N'Zoth",e="BFA",t="World Quest"}
w[57585]={n="Call of the Void",e="BFA",m=1527,t="World Quest"}
w[57586]={n="Spirit Drinker",e="BFA",m=1527,t="World Quest"}
w[57587]={n="Spirit Drinker",e="BFA",m=1527,t="World Quest"}
w[57588]={n="Spirit Drinker",e="BFA",m=1527,t="World Quest"}
w[57589]={n="Spirit Drinker",e="BFA",m=1527,t="World Quest"}
w[57590]={n="Spirit Drinker",e="BFA",m=1527,t="World Quest"}
w[57591]={n="Spirit Drinker",e="BFA",m=1527,t="World Quest"}
w[57592]={n="Executor of N'Zoth",e="BFA",t="World Quest"}
w[57620]={n="Summoning Ritual",e="BFA",m=1527,t="World Quest"}
w[57621]={n="Summoning Ritual",e="BFA",m=1527,t="World Quest"}
w[57650]={n="Better Off Dead",e="SHADOWLANDS",m=1536,t="World Quest"}
w[58084]={n="Soul Snares",e="SHADOWLANDS",m=1525,t="World Quest"}
w[58123]={n="Fai Quest [internal only]",e="SHADOWLANDS",t="World Quest"}
w[58144]={n="Battered and Bruised",e="SHADOWLANDS",m=1525,t="World Quest"}
w[58207]={n="Buggin' Out",e="SHADOWLANDS",m=1536,t="World Quest"}
w[58216]={n="Consuming Maw",e="BFA",m=1530,t="World Quest"}
w[58221]={n="Gettin' Even",e="SHADOWLANDS",m=1536,t="World Quest"}
w[58256]={n="Consuming Maw",e="BFA",m=1530,t="World Quest"}
w[58257]={n="Consuming Maw",e="BFA",m=1530,t="World Quest"}
w[58258]={n="Consuming Maw",e="BFA",m=1530,t="World Quest"}
w[58271]={n="Voidflame Ritual",e="BFA",m=1530,t="World Quest"}
w[58275]={n="Monstrous Summoning",e="BFA",m=1530,t="World Quest"}
w[58276]={n="Mar'at In Flames",e="BFA",m=1530,t="World Quest"}
w[58334]={n="Mistfall In Flames",e="BFA",m=1530,t="World Quest"}
w[58367]={n="Empowered Demolisher",e="BFA",m=1530,t="World Quest"}
w[58370]={n="Empowered Demolisher",e="BFA",m=1530,t="World Quest"}
w[58437]={n="Parts to a Whole",e="SHADOWLANDS",m=1536,t="World Quest"}
w[58438]={n="Consuming Maw",e="BFA",m=390,t="World Quest"}
w[58439]={n="Consuming Maw",e="BFA",m=390,t="World Quest"}
w[58442]={n="Consuming Maw",e="BFA",m=390,t="World Quest"}
w[58490]={n="Deadly Reminder",e="SHADOWLANDS",m=1536,t="World Quest"}
w[58505]={n="Planned Demise",e="SHADOWLANDS",m=1536,t="World Quest"}
w[58601]={n="Web of Information",e="SHADOWLANDS",m=1536,t="World Quest"}
w[58605]={n="Amateur Night",e="SHADOWLANDS",m=1536,t="Elite World Quest"}
w[58660]={n="Burrowing Terrors",e="BFA",m=1530,t="World Quest"}
w[58661]={n="Burrowing Terrors",e="BFA",m=1530,t="World Quest"}
w[58662]={n="Burrowing Terrors",e="BFA",m=1530,t="World Quest"}
w[58667]={n="Obsidian Extraction",e="BFA",m=1530,t="World Quest"}
w[58676]={n="Dormant Destroyer",e="BFA",m=1530,t="World Quest"}
w[58679]={n="Dormant Destroyer",e="BFA",m=1530,t="World Quest"}
w[58705]={n="Grand Empress Shek'zara",e="BFA",m=1530,t="Epic Elite World Quest"}
w[58742]={n="Retinus the Seeker",e="BFA",m=1527,t="Battle Pet World Quest"}
w[58743]={n="Dune Buggy",e="BFA",m=1527,t="Battle Pet World Quest"}
w[58744]={n="I Am The One Who Whispers",e="BFA",m=1527,t="Battle Pet World Quest"}
w[58745]={n="Watch Where You Step",e="BFA",m=1527,t="Battle Pet World Quest"}
w[58746]={n="Tiny Madness",e="BFA",m=1530,t="Battle Pet World Quest"}
w[58747]={n="Brain Tickling",e="BFA",m=1530,t="Battle Pet World Quest"}
w[58748]={n="Living Statues Are Tough",e="BFA",m=1530,t="Battle Pet World Quest"}
w[58749]={n="Flight of the Vil'thik",e="BFA",m=1530,t="Battle Pet World Quest"}
w[58952]={n="Purging Flames",e="BFA",m=1530,t="World Quest"}
w[58961]={n="Ambushed Settlers",e="BFA",m=1530,t="World Quest"}
w[58974]={n="Ambushed Settlers",e="BFA",m=1530,t="World Quest"}
w[58975]={n="Pest Removal",e="SHADOWLANDS",m=1565,t="World Quest"}
w[58981]={n="Hardened Hive",e="BFA",m=1530,t="World Quest"}
w[58990]={n="Titanus Egg",e="BFA",m=1530,t="World Quest"}
w[58993]={n="Swarm Defense",e="SHADOWLANDS",m=1565,t="World Quest"}
w[59003]={n="Combustible Cocoons",e="BFA",m=1530,t="World Quest"}
w[59234]={n="Mixing A Mess",e="SHADOWLANDS",m=1536,t="World Quest"}
w[59578]={n="Let's Get Ready to Humble",e="SHADOWLANDS",m=1533,t="World Quest"}
w[59581]={n="The Strength of Sinfall",e="SHADOWLANDS",m=1525,t="World Quest"}
w[59585]={n="We'll Make an Aspirant Out of You",e="SHADOWLANDS",m=1533,t="World Quest"}
w[59599]={n="Retaining the Court",e="SHADOWLANDS",m=1525,t="World Quest"}
w[59600]={n="Rotbriar Trouble",e="SHADOWLANDS",m=1565,t="World Quest"}
w[59601]={n="Assault on the Vestibule",e="SHADOWLANDS",m=1533,t="World Quest"}
w[59617]={n="Stone Fiend Saboteurs",e="SHADOWLANDS",m=1525,t="World Quest"}
w[59642]={n="Pulling Hairs",e="SHADOWLANDS",m=1536,t="World Quest"}
w[59643]={n="It's Race Day in the Ramparts!",e="SHADOWLANDS",m=1525,t="World Quest"}
w[59658]={n="Express Dominance",e="SHADOWLANDS",m=1533,t="PvP World Quest"}
w[59680]={n="Vesiphone's Vicious Vesper",e="SHADOWLANDS",m=1533,t="World Quest"}
w[59703]={n="Abombing Run",e="SHADOWLANDS",m=1536,t="World Quest"}
w[59705]={n="Things Remembered",e="SHADOWLANDS",m=1533,t="World Quest"}
w[59717]={n="Things Remembered",e="SHADOWLANDS",m=1533,t="World Quest"}
w[59718]={n="Parasol Peril",e="SHADOWLANDS",m=1525,t="World Quest"}
w[59743]={n="The Spider on the Wall",e="SHADOWLANDS",m=1536,t="World Quest"}
w[59771]={n="History of Corruption",e="SHADOWLANDS",m=1533,t="World Quest"}
w[59789]={n="Tithe and Taxes",e="SHADOWLANDS",m=1525,t="World Quest"}
w[59803]={n="For Honor",e="SHADOWLANDS",m=1525,t="PvP World Quest"}
w[59804]={n="Gateways of Horror",e="SHADOWLANDS",m=1533,t="World Quest"}
w[59808]={n="Muck It Up",e="SHADOWLANDS",m=1525,t="World Quest"}
w[59825]={n="Seed Hunting",e="SHADOWLANDS",m=1565,t="PvP World Quest"}
w[59836]={n="Battles Won Long Ago",e="SHADOWLANDS",m=1536,t="World Quest"}
w[59848]={n="Tea Tales: Theotar",e="SHADOWLANDS",m=1525,t="World Quest"}
w[59850]={n="Tea Tales: Vulca",e="SHADOWLANDS",m=1525,t="World Quest"}
w[59852]={n="Tea Tales: Gubbins and Tubbins",e="SHADOWLANDS",m=1525,t="World Quest"}
w[59853]={n="Tea Tales: Lost Sybille",e="SHADOWLANDS",m=1525,t="World Quest"}
w[59855]={n="Major Mirror Disruptions",e="SHADOWLANDS",m=1525,t="World Quest"}
w[59902]={n="A Curious Cache",e="SHADOWLANDS",m=1525,t="World Quest"}
w[59904]={n="A Curious Cache",e="SHADOWLANDS",m=1525,t="World Quest"}
w[59905]={n="A Curious Cache",e="SHADOWLANDS",m=1525,t="World Quest"}
w[60010]={n="Tremaculum: Liberated Souls",e="SHADOWLANDS",m=1543,t="World Quest"}
w[60011]={n="Calcis: Decryption",e="SHADOWLANDS",m=1543,t="Rare Elite World Quest"}
w[60012]={n="Zovaal's Cauldron: Stygia Overflow",e="SHADOWLANDS",m=1543,t="Rare Elite World Quest"}
w[60231]={n="State of Decay",e="SHADOWLANDS",m=1536,t="PvP World Quest"}
w[60337]={n="Pupa Trooper",e="SHADOWLANDS",m=1565,t="World Quest"}
w[60358]={n="Gildenite Grab",e="SHADOWLANDS",m=1707,t="Calling Quest"}
w[60363]={n="Gildenite Grab",e="SHADOWLANDS",m=1698,t="Calling Quest"}
w[60364]={n="Gildenite Grab",e="SHADOWLANDS",m=1565,t="Calling Quest"}
w[60365]={n="Gildenite Grab",e="SHADOWLANDS",m=1700,t="Calling Quest"}
w[60369]={n="A Wealth of Wealdwood",e="SHADOWLANDS",m=1565,t="Calling Quest"}
w[60370]={n="A Wealth of Wealdwood",e="SHADOWLANDS",m=1700,t="Calling Quest"}
w[60371]={n="A Wealth of Wealdwood",e="SHADOWLANDS",m=1698,t="Calling Quest"}
w[60372]={n="A Wealth of Wealdwood",e="SHADOWLANDS",m=1707,t="Calling Quest"}
w[60373]={n="A Source of Sorrowvine",e="SHADOWLANDS",m=1565,t="Calling Quest"}
w[60374]={n="Bonemetal Bonanza",e="SHADOWLANDS",m=1565,t="Calling Quest"}
w[60375]={n="Bonemetal Bonanza",e="SHADOWLANDS",m=1700,t="Calling Quest"}
w[60376]={n="Bonemetal Bonanza",e="SHADOWLANDS",m=1698,t="Calling Quest"}
w[60377]={n="Bonemetal Bonanza",e="SHADOWLANDS",m=1707,t="Calling Quest"}
w[60378]={n="A Source of Sorrowvine",e="SHADOWLANDS",m=1700,t="Calling Quest"}
w[60379]={n="A Source of Sorrowvine",e="SHADOWLANDS",m=1698,t="Calling Quest"}
w[60380]={n="A Source of Sorrowvine",e="SHADOWLANDS",m=1707,t="Calling Quest"}
w[60381]={n="Aiding Ardenweald",e="SHADOWLANDS",m=1701,t="Calling Quest"}
w[60382]={n="Aiding Revendreth",e="SHADOWLANDS",m=1701,t="Calling Quest"}
w[60383]={n="Aiding Maldraxxus",e="SHADOWLANDS",m=1701,t="Calling Quest"}
w[60384]={n="Aiding Bastion",e="SHADOWLANDS",m=1701,t="Calling Quest"}
w[60385]={n="Training in Revendreth",e="SHADOWLANDS",m=1701,t="Calling Quest"}
w[60386]={n="Training in Maldraxxus",e="SHADOWLANDS",m=1701,t="Calling Quest"}
w[60387]={n="Training in Bastion",e="SHADOWLANDS",m=1701,t="Calling Quest"}
w[60388]={n="Training Our Forces",e="SHADOWLANDS",m=1701,t="Calling Quest"}
w[60389]={n="Aiding Ardenweald",e="SHADOWLANDS",m=1700,t="Calling Quest"}
w[60390]={n="Aiding Ardenweald",e="SHADOWLANDS",m=1698,t="Calling Quest"}
w[60391]={n="Aiding Ardenweald",e="SHADOWLANDS",m=1707,t="Calling Quest"}
w[60392]={n="Aiding Bastion",e="SHADOWLANDS",m=1707,t="Calling Quest"}
w[60393]={n="Aiding Bastion",e="SHADOWLANDS",m=1698,t="Calling Quest"}
w[60394]={n="Aiding Bastion",e="SHADOWLANDS",m=1700,t="Calling Quest"}
w[60395]={n="Aiding Maldraxxus",e="SHADOWLANDS",m=1707,t="Calling Quest"}
w[60396]={n="Aiding Maldraxxus",e="SHADOWLANDS",m=1698,t="Calling Quest"}
w[60397]={n="Aiding Maldraxxus",e="SHADOWLANDS",m=1700,t="Calling Quest"}
w[60398]={n="Aiding Revendreth",e="SHADOWLANDS",m=1698,t="Calling Quest"}
w[60399]={n="Aiding Revendreth",e="SHADOWLANDS",m=1700,t="Calling Quest"}
w[60400]={n="Aiding Revendreth",e="SHADOWLANDS",m=1707,t="Calling Quest"}
w[60401]={n="Training in Ardenweald",e="SHADOWLANDS",m=1699,t="Calling Quest"}
w[60402]={n="Training in Ardenweald",e="SHADOWLANDS",m=1698,t="Calling Quest"}
w[60403]={n="Training in Ardenweald",e="SHADOWLANDS",m=1707,t="Calling Quest"}
w[60404]={n="Training Our Forces",e="SHADOWLANDS",m=1707,t="Calling Quest"}
w[60405]={n="Training in Bastion",e="SHADOWLANDS",m=1698,t="Calling Quest"}
w[60406]={n="Training in Bastion",e="SHADOWLANDS",m=1699,t="Calling Quest"}
w[60407]={n="Training in Maldraxxus",e="SHADOWLANDS",m=1707,t="Calling Quest"}
w[60408]={n="Training Our Forces",e="SHADOWLANDS",m=1698,t="Calling Quest"}
w[60409]={n="Training in Maldraxxus",e="SHADOWLANDS",m=1699,t="Calling Quest"}
w[60410]={n="Training Our Forces",e="SHADOWLANDS",m=1699,t="Calling Quest"}
w[60411]={n="Training in Revendreth",e="SHADOWLANDS",m=1698,t="Calling Quest"}
w[60412]={n="Training in Revendreth",e="SHADOWLANDS",m=1707,t="Calling Quest"}
w[60414]={n="Rare Resources",e="SHADOWLANDS",m=1701,t="Calling Quest"}
w[60415]={n="Rare Resources",e="SHADOWLANDS",m=1707,t="Calling Quest"}
w[60416]={n="Rare Resources",e="SHADOWLANDS",m=1698,t="Calling Quest"}
w[60417]={n="Rare Resources",e="SHADOWLANDS",m=1700,t="Calling Quest"}
w[60418]={n="A Call to Bastion",e="SHADOWLANDS",m=1701,t="Calling Quest"}
w[60419]={n="Troubles at Home",e="SHADOWLANDS",m=1701,t="Calling Quest"}
w[60420]={n="A Call to Maldraxxus",e="SHADOWLANDS",m=1701,t="Calling Quest"}
w[60421]={n="A Call to Revendreth",e="SHADOWLANDS",m=1701,t="Calling Quest"}
w[60422]={n="A Call to Ardenweald",e="SHADOWLANDS",m=1699,t="Calling Quest"}
w[60423]={n="A Call to Ardenweald",e="SHADOWLANDS",m=1698,t="Calling Quest"}
w[60424]={n="A Call to Ardenweald",e="SHADOWLANDS",m=1707,t="Calling Quest"}
w[60425]={n="Troubles at Home",e="SHADOWLANDS",m=1707,t="Calling Quest"}
w[60426]={n="A Call to Bastion",e="SHADOWLANDS",m=1698,t="Calling Quest"}
w[60427]={n="A Call to Bastion",e="SHADOWLANDS",m=1699,t="Calling Quest"}
w[60429]={n="Troubles at Home",e="SHADOWLANDS",m=1698,t="Calling Quest"}
w[60430]={n="A Call to Maldraxxus",e="SHADOWLANDS",m=1707,t="Calling Quest"}
w[60431]={n="A Call to Maldraxxus",e="SHADOWLANDS",m=1699,t="Calling Quest"}
w[60432]={n="Troubles at Home",e="SHADOWLANDS",m=1699,t="Calling Quest"}
w[60433]={n="A Call to Revendreth",e="SHADOWLANDS",m=1698,t="Calling Quest"}
w[60434]={n="A Call to Revendreth",e="SHADOWLANDS",m=1707,t="Calling Quest"}
w[60435]={n="Challenges in Revendreth",e="SHADOWLANDS",m=1701,t="Calling Quest"}
w[60436]={n="Challenges in Maldraxxus",e="SHADOWLANDS",m=1701,t="Calling Quest"}
w[60437]={n="Challenges in Bastion",e="SHADOWLANDS",m=1701,t="Calling Quest"}
w[60438]={n="Challenges in Ardenweald",e="SHADOWLANDS",m=1701,t="Calling Quest"}
w[60439]={n="Challenges in Ardenweald",e="SHADOWLANDS",m=1707,t="Calling Quest"}
w[60440]={n="Challenges in Ardenweald",e="SHADOWLANDS",m=1698,t="Calling Quest"}
w[60441]={n="Challenges in Ardenweald",e="SHADOWLANDS",m=1700,t="Calling Quest"}
w[60442]={n="Challenges in Bastion",e="SHADOWLANDS",m=1707,t="Calling Quest"}
w[60443]={n="Challenges in Bastion",e="SHADOWLANDS",m=1698,t="Calling Quest"}
w[60444]={n="Challenges in Bastion",e="SHADOWLANDS",m=1700,t="Calling Quest"}
w[60445]={n="Challenges in Maldraxxus",e="SHADOWLANDS",m=1698,t="Calling Quest"}
w[60446]={n="Challenges in Maldraxxus",e="SHADOWLANDS",m=1700,t="Calling Quest"}
w[60447]={n="Challenges in Maldraxxus",e="SHADOWLANDS",m=1707,t="Calling Quest"}
w[60448]={n="Challenges in Revendreth",e="SHADOWLANDS",m=1700,t="Calling Quest"}
w[60449]={n="Challenges in Revendreth",e="SHADOWLANDS",m=1698,t="Calling Quest"}
w[60450]={n="Challenges in Revendreth",e="SHADOWLANDS",m=1707,t="Calling Quest"}
w[60452]={n="Storm the Maw",e="SHADOWLANDS",m=1701,t="Calling Quest"}
w[60454]={n="Storm the Maw",e="SHADOWLANDS",m=1707,t="Calling Quest"}
w[60455]={n="Storm the Maw",e="SHADOWLANDS",m=1698,t="Calling Quest"}
w[60456]={n="Storm the Maw",e="SHADOWLANDS",m=1699,t="Calling Quest"}
w[60457]={n="Anima Salvage",e="SHADOWLANDS",m=1701,t="Calling Quest"}
w[60458]={n="Anima Salvage",e="SHADOWLANDS",m=1707,t="Calling Quest"}
w[60459]={n="Anima Salvage",e="SHADOWLANDS",m=1698,t="Calling Quest"}
w[60460]={n="Anima Salvage",e="SHADOWLANDS",m=1699,t="Calling Quest"}
w[60462]={n="Anima Appeal",e="SHADOWLANDS",m=1702,t="Calling Quest"}
w[60463]={n="Anima Appeal",e="SHADOWLANDS",m=1700,t="Calling Quest"}
w[60464]={n="Anima Appeal",e="SHADOWLANDS",m=1698,t="Calling Quest"}
w[60465]={n="Anima Appeal",e="SHADOWLANDS",m=1707,t="Calling Quest"}
w[60475]={n="We'll Workshop It",e="SHADOWLANDS",m=1565,t="World Quest"}
w[60476]={n="Spriggan Size Me!",e="SHADOWLANDS",m=1565,t="World Quest"}
w[60531]={n="Chosen Champions",e="SHADOWLANDS",m=1536,t="Rare Elite World Quest"}
w[60532]={n="Destroy the Dominant",e="SHADOWLANDS",m=1525,t="Rare Elite World Quest"}
w[60533]={n="Terrors in Tirna Scithe",e="SHADOWLANDS",m=1565,t="Rare Elite World Quest"}
w[60534]={n="Disloyal Denizens",e="SHADOWLANDS",m=1533,t="Rare Elite World Quest"}
w[60542]={n="Nathanos Blightcaller",e="BFA",m=23,t="Epic Elite World Quest"}
w[60564]={n="Three Gorm Enter, No One Leaves",e="SHADOWLANDS",m=1565,t="World Quest"}
w[60565]={n="A Steward for Every Occasion",e="SHADOWLANDS",m=1533,t="World Quest"}
w[60574]={n="Shaking 'Shrooms",e="SHADOWLANDS",m=1565,t="World Quest"}
w[60585]={n="Spriggan Riot",e="SHADOWLANDS",m=1565,t="World Quest"}
w[60597]={n="Trouble at the Gormling Corral",e="SHADOWLANDS",m=1565,t="World Quest"}
w[60601]={n="Darkwing Drills",e="SHADOWLANDS",m=1525,t="World Quest"}
w[60602]={n="Secret Service",e="SHADOWLANDS",m=1525,t="World Quest"}
w[60609]={n="Who Devours the Devourers?",e="SHADOWLANDS",m=1565,t="Elite World Quest"}
w[60623]={n="AHHH! Real Monsters!",e="SHADOWLANDS",m=1533,t="World Quest"}
w[60649]={n="A Thorn In Their Side",e="SHADOWLANDS",m=1565,t="World Quest"}
w[60653]={n="Mirror Restoration",e="SHADOWLANDS",m=1525,t="World Quest"}
w[60654]={n="Swarming Souls",e="SHADOWLANDS",m=1525,t="World Quest"}
w[60655]={n="A Stolen Stone Fiend",e="SHADOWLANDS",m=1525,t="World Quest"}
w[60656]={n="Summon Your Sins",e="SHADOWLANDS",m=1525,t="World Quest"}
w[60657]={n="Aid From Above",e="SHADOWLANDS",m=1525,t="World Quest"}
w[60658]={n="An Endless Appetite",e="SHADOWLANDS",m=1525,t="World Quest"}
w[60659]={n="Light Defense",e="SHADOWLANDS",m=1525,t="World Quest"}
w[60739]={n="Tough Crowd",e="SHADOWLANDS",m=1565,t="World Quest"}
w[60770]={n="Squish and Burn",e="SHADOWLANDS",m=1565,t="World Quest"}
w[60786]={n="Swarm Defense",e="SHADOWLANDS",m=1565,t="World Quest"}
w[60837]={n="Wrath of Aliothe",e="SHADOWLANDS",m=1565,t="World Quest"}
w[60842]={n="To Serve Spriggan",e="SHADOWLANDS",m=1565,t="World Quest"}
w[60844]={n="Flight School: Falling With Style",e="SHADOWLANDS",m=1533,t="World Quest"}
w[60855]={n="Gormageddon",e="SHADOWLANDS",m=1565,t="World Quest"}
w[60858]={n="Flight School: Up and Away!",e="SHADOWLANDS",m=1533,t="World Quest"}
w[60872]={n="A Dangerous Harvest",e="SHADOWLANDS",m=1565,t="World Quest"}
w[60899]={n="A Night in the Woods",e="SHADOWLANDS",m=1565,t="World Quest"}
w[60911]={n="Flight School: Flapping Frenzy",e="SHADOWLANDS",m=1533,t="World Quest"}
w[60929]={n="Air Supremacy",e="SHADOWLANDS",m=1533,t="World Quest"}
w[60950]={n="A Matter of Stealth",e="SHADOWLANDS",m=1565,t="World Quest"}
w[60958]={n="We Send Only You",e="SHADOWLANDS",m=1533,t="World Quest"}
w[61060]={n="Spore Losers",e="SHADOWLANDS",m=1536,t="World Quest"}
w[61141]={n="Deathfang's Favorite Toy",e="SHADOWLANDS",m=1536,t="World Quest"}
w[61148]={n="AHHH! Real Monsters!",e="SHADOWLANDS",m=1533,t="World Quest"}
w[61189]={n="Further Gelatinous Research",e="SHADOWLANDS",m=1536,t="World Quest"}
w[61220]={n="AHHH! Real Monsters!",e="SHADOWLANDS",m=1533,t="World Quest"}
w[61303]={n="It's Raining Sparkles",e="SHADOWLANDS",m=1565,t="World Quest"}
w[61337]={n="March of the Eternal Protector",e="SHADOWLANDS",m=1533,t="World Quest"}
w[61342]={n="Battles Won Long Ago",e="SHADOWLANDS",m=1536,t="World Quest"}
w[61343]={n="Battles Won Long Ago",e="SHADOWLANDS",m=1536,t="World Quest"}
w[61352]={n="All Will Be Consumed",e="SHADOWLANDS",m=1536,t="World Quest"}
w[61353]={n="All Will Be Consumed",e="SHADOWLANDS",m=1536,t="World Quest"}
w[61394]={n="Gormling Toss: Tranquil Pools",e="SHADOWLANDS",m=1565,t="World Quest"}
w[61411]={n="Our Heart Will Go On",e="SHADOWLANDS",m=1565,t="World Quest"}
w[61434]={n="Alchemy: Flask of Measured Discipline",e="SHADOWLANDS",m=1533,t="Alchemy World Quest"}
w[61435]={n="Blacksmithing: Stalker Arrowheads",e="SHADOWLANDS",m=1565,t="Blacksmithing World Quest"}
w[61439]={n="Cooking: Steward Stew",e="SHADOWLANDS",m=1533,t="Cooking World Quest"}
w[61440]={n="Enchanting: Boundless Basket",e="SHADOWLANDS",m=1565,t="Enchanting World Quest"}
w[61441]={n="Engineering: Power Hammer",e="SHADOWLANDS",m=1533,t="Engineering World Quest"}
w[61442]={n="Fishing: Glorious Shimmerfin",e="SHADOWLANDS",m=1533,t="Fishing World Quest"}
w[61443]={n="Herbalism: Windswept Rising Glory",e="SHADOWLANDS",m=1533,t="Herbalism World Quest"}
w[61446]={n="Inscription: Invocation of Duty",e="SHADOWLANDS",m=1533,t="Inscription World Quest"}
w[61447]={n="Jewelcrafting: Gleaming Kyranite Necklace",e="SHADOWLANDS",m=1533,t="Jewelcrafting World Quest"}
w[61449]={n="Leatherworking: Steelhide Leather Harness",e="SHADOWLANDS",m=1533,t="Leatherworking World Quest"}
w[61467]={n="Mining: Luminous Solenium Cluster",e="SHADOWLANDS",m=1533,t="Mining World Quest"}
w[61468]={n="Skinning: Plush Copperfur Pelts",e="SHADOWLANDS",m=1533,t="Skinning World Quest"}
w[61469]={n="Tailoring: Woven Gossamer Tunic",e="SHADOWLANDS",m=1533,t="Tailoring World Quest"}
w[61477]={n="Calling the Champions",e="SHADOWLANDS",m=1536,t="World Quest"}
w[61517]={n="zz",e="SHADOWLANDS",t="World Quest"}
w[61520]={n="Enemy of My Mnemis",e="SHADOWLANDS",m=1533,t="World Quest"}
w[61530]={n="Mining: Ligneous Phaedrum Cluster",e="SHADOWLANDS",m=1565,t="Mining World Quest"}
w[61537]={n="Mining: Monolithic Oxxein Cluster",e="SHADOWLANDS",m=1536,t="Mining World Quest"}
w[61538]={n="Mining: Menacing Sinvyr Cluster",e="SHADOWLANDS",m=1525,t="Mining World Quest"}
w[61539]={n="Liches Get Stitches",e="SHADOWLANDS",m=1536,t="World Quest"}
w[61540]={n="Just Winging It",e="SHADOWLANDS",m=1536,t="World Quest"}
w[61543]={n="Herbalism: Lambent Vigil's Torch",e="SHADOWLANDS",m=1565,t="Herbalism World Quest"}
w[61544]={n="Herbalism: Lush Widowbloom",e="SHADOWLANDS",m=1525,t="Herbalism World Quest"}
w[61545]={n="Herbalism: Engorged Marrowroot",e="SHADOWLANDS",m=1536,t="Herbalism World Quest"}
w[61549]={n="Drought Conditions",e="SHADOWLANDS",m=1533,t="World Quest"}
w[61564]={n="Blacksmithing: Polished Kyrian Shield",e="SHADOWLANDS",m=1533,t="Blacksmithing World Quest"}
w[61593]={n="A Crisis of Memory",e="SHADOWLANDS",m=1533,t="World Quest"}
w[61595]={n="Alchemy: Potion of Hibernal Rest",e="SHADOWLANDS",m=1565,t="Alchemy World Quest"}
w[61596]={n="Cooking: Arden Apple Pie",e="SHADOWLANDS",m=1565,t="Cooking World Quest"}
w[61597]={n="Engineering: Bug Zapifier",e="SHADOWLANDS",m=1565,t="Engineering World Quest"}
w[61598]={n="Fishing: Speckled Flametail",e="SHADOWLANDS",m=1565,t="Fishing World Quest"}
w[61599]={n="Inscription: Hymnal of Reprise",e="SHADOWLANDS",m=1565,t="Inscription World Quest"}
w[61601]={n="Jewelcrafting: Gem Studded Bangle",e="SHADOWLANDS",m=1565,t="Jewelcrafting World Quest"}
w[61602]={n="Leatherworking: Stalker's Leather Quiver",e="SHADOWLANDS",m=1565,t="Leatherworking World Quest"}
w[61603]={n="Skinning: Thick Gormhide",e="SHADOWLANDS",m=1565,t="Skinning World Quest"}
w[61604]={n="Tailoring: Cloak of Camouflage",e="SHADOWLANDS",m=1565,t="Tailoring World Quest"}
w[61605]={n="Alchemy: Draught of Grotesque Strength",e="SHADOWLANDS",m=1536,t="Alchemy World Quest"}
w[61606]={n="Blacksmithing: Soul Razor",e="SHADOWLANDS",m=1536,t="Blacksmithing World Quest"}
w[61607]={n="Cooking: Spider Jerky",e="SHADOWLANDS",m=1536,t="Cooking World Quest"}
w[61608]={n="Enchanting: Unbreakable Crystal",e="SHADOWLANDS",m=1536,t="Enchanting World Quest"}
w[61609]={n="Engineering: Boneclad Stake Launcher",e="SHADOWLANDS",m=1536,t="Engineering World Quest"}
w[61610]={n="Fishing: Skeletal Mudskipper",e="SHADOWLANDS",m=1536,t="Fishing World Quest"}
w[61611]={n="Inscription: Litany of Might",e="SHADOWLANDS",m=1536,t="Inscription World Quest"}
w[61612]={n="Jewelcrafting: Carved Crystal Ring",e="SHADOWLANDS",m=1536,t="Jewelcrafting World Quest"}
w[61613]={n="Leatherworking: Bonestudded Fists",e="SHADOWLANDS",m=1536,t="Leatherworking World Quest"}
w[61614]={n="Skinning: Rugged Carapace",e="SHADOWLANDS",m=1536,t="Skinning World Quest"}
w[61615]={n="Tailoring: Haunting Hood",e="SHADOWLANDS",m=1536,t="Tailoring World Quest"}
w[61619]={n="Alchemy: Elixir of Humility",e="SHADOWLANDS",m=1525,t="Alchemy World Quest"}
w[61620]={n="Blacksmithing: Prideful Manacles",e="SHADOWLANDS",m=1525,t="Blacksmithing World Quest"}
w[61621]={n="Cooking: Skewered Meats",e="SHADOWLANDS",m=1525,t="Cooking World Quest"}
w[61622]={n="Engineering: Duelist's Pistol",e="SHADOWLANDS",m=1525,t="Engineering World Quest"}
w[61623]={n="Fishing: Bloodthroated Grouper",e="SHADOWLANDS",m=1525,t="Fishing World Quest"}
w[61624]={n="Inscription: Catalog of Sins",e="SHADOWLANDS",m=1525,t="Inscription World Quest"}
w[61625]={n="Jewelcrafting: Sinister Choker",e="SHADOWLANDS",m=1525,t="Jewelcrafting World Quest"}
w[61626]={n="Leatherworking: Courtly Leather Boots",e="SHADOWLANDS",m=1525,t="Leatherworking World Quest"}
w[61627]={n="Skinning: Horrific Leather Hide",e="SHADOWLANDS",m=1525,t="Skinning World Quest"}
w[61628]={n="Tailoring: Looming Tapestry",e="SHADOWLANDS",m=1525,t="Tailoring World Quest"}
w[61629]={n="Enchanting: True Aim",e="SHADOWLANDS",m=1533,t="Enchanting World Quest"}
w[61630]={n="Enchanting: Everburning Brand",e="SHADOWLANDS",m=1525,t="Enchanting World Quest"}
w[61631]={n="Drust Between You and Me",e="SHADOWLANDS",m=1565,t="World Quest"}
w[61667]={n="Forged in Secret",e="SHADOWLANDS",m=1536,t="World Quest"}
w[61689]={n="A Crisis of Memory",e="SHADOWLANDS",m=1533,t="World Quest"}
w[61699]={n="Not Much to Goo On",e="SHADOWLANDS",m=1536,t="World Quest"}
w[61708]={n="Drawing Out the Poison",e="SHADOWLANDS",m=1536,t="World Quest"}
w[61717]={n="Gormling Piper: Tranquil Pools",e="SHADOWLANDS",m=1565,t="World Quest"}
w[61783]={n="Mega Bite",e="SHADOWLANDS",m=1533,t="Battle Pet World Quest"}
w[61784]={n="Cliffs of Bastion",e="SHADOWLANDS",m=1533,t="Battle Pet World Quest"}
w[61787]={n="Micro Defense Force",e="SHADOWLANDS",m=1533,t="Battle Pet World Quest"}
w[61791]={n="Thenia's Loyal Companions",e="SHADOWLANDS",m=1533,t="Battle Pet World Quest"}
w[61813]={n="Valinor, the Light of Eons",e="SHADOWLANDS",m=1533,t="Epic Elite World Quest"}
w[61814]={n="Nurgash Muckformed",e="SHADOWLANDS",m=1525,t="Epic Elite World Quest"}
w[61815]={n="Oranomonos the Everbranching",e="SHADOWLANDS",m=1565,t="Epic Elite World Quest"}
w[61816]={n="Mortanis",e="SHADOWLANDS",m=1536,t="Epic Elite World Quest"}
w[61841]={n="Not Much to Goo On",e="SHADOWLANDS",m=1536,t="World Quest"}
w[61866]={n="Mighty Minions of Maldraxxus",e="SHADOWLANDS",m=1536,t="Battle Pet World Quest"}
w[61867]={n="Extra Pieces",e="SHADOWLANDS",m=1536,t="Battle Pet World Quest"}
w[61868]={n="Uncomfortably Undercover",e="SHADOWLANDS",m=1536,t="Battle Pet World Quest"}
w[61870]={n="Failed Experiment",e="SHADOWLANDS",m=1536,t="Battle Pet World Quest"}
w[61879]={n="Ashes Will Fall",e="SHADOWLANDS",m=1525,t="Battle Pet World Quest"}
w[61883]={n="Resilient Survivors",e="SHADOWLANDS",m=1525,t="Battle Pet World Quest"}
w[61885]={n="Eyegor's Special Friends",e="SHADOWLANDS",m=1525,t="Battle Pet World Quest"}
w[61886]={n="The Mind Games of Addius",e="SHADOWLANDS",m=1525,t="Battle Pet World Quest"}
w[61946]={n="Natural Defenders",e="SHADOWLANDS",m=1565,t="Battle Pet World Quest"}
w[61947]={n="Lurking In The Shadows",e="SHADOWLANDS",m=1565,t="Battle Pet World Quest"}
w[61948]={n="Airborne Defense Force",e="SHADOWLANDS",m=1565,t="Battle Pet World Quest"}
w[61949]={n="Ardenweald's Tricksters",e="SHADOWLANDS",m=1565,t="Battle Pet World Quest"}
w[61967]={n="Remedial Lessons",e="SHADOWLANDS",m=1533,t="World Quest"}
w[62051]={n="Gormling Toss: Spirit Glen",e="SHADOWLANDS",m=1565,t="World Quest"}
w[62058]={n="Centurions, Assemble!",e="SHADOWLANDS",m=1533,t="World Quest"}
w[62068]={n="Gormling Piper: Crumbled Ridge",e="SHADOWLANDS",m=1565,t="World Quest"}
w[62203]={n="Major Mirror Disruptions",e="SHADOWLANDS",m=1525,t="World Quest"}
w[62204]={n="Major Mirror Disruptions",e="SHADOWLANDS",m=1525,t="World Quest"}
w[62235]={n="Allay Their Fears",e="SHADOWLANDS",m=1533,t="World Quest"}
w[62241]={n="Training Regimen",e="SHADOWLANDS",m=1533,t="World Quest"}
w[62258]={n="Soaring Over Bastion",e="SHADOWLANDS",m=1533,t="World Quest"}
w[62280]={n="Limbo",e="SHADOWLANDS",m=1533,t="World Quest"}
w[62451]={n="Assault on the Vestibule",e="SHADOWLANDS",m=1533,t="World Quest"}
w[64273]={n="Containing the Helsworn",e="SHADOWLANDS",m=1543,t="Rare Elite World Quest"}
w[64531]={n="Mor'geth",e="SHADOWLANDS",m=1543,t="Epic Elite World Quest"}
w[64768]={n="Lightsprocket's Artifact Hunt",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[64960]={n="Feed the Annelids",e="SHADOWLANDS",m=1970,t="World Quest"}
w[64974]={n="Clean Up, Automa Aisle",e="SHADOWLANDS",m=1970,t="World Quest"}
w[65081]={n="An Apple A Day",e="SHADOWLANDS",m=1970,t="World Quest"}
w[65089]={n="Frog'it",e="SHADOWLANDS",m=1970,t="World Quest"}
w[65102]={n="Fish Eyes",e="SHADOWLANDS",m=1970,t="World Quest"}
w[65115]={n="Researching the Solution",e="SHADOWLANDS",m=1970,t="World Quest"}
w[65117]={n="Bad Samples",e="SHADOWLANDS",m=1970,t="World Quest"}
w[65119]={n="Automa Ops",e="SHADOWLANDS",m=1970,t="World Quest"}
w[65143]={n="Antros",e="SHADOWLANDS",m=1970,t="Epic Elite World Quest"}
w[65230]={n="Bot-any",e="SHADOWLANDS",m=1970,t="World Quest"}
w[65231]={n="Plundered Knowledge",e="SHADOWLANDS",m=1970,t="Elite World Quest"}
w[65232]={n="Annelid-ilation",e="SHADOWLANDS",m=1970,t="World Quest"}
w[65234]={n="Sweet On Them",e="SHADOWLANDS",m=1970,t="World Quest"}
w[65244]={n="Devourable",e="SHADOWLANDS",m=1970,t="World Quest"}
w[65252]={n="Stomp It Now",e="SHADOWLANDS",m=1970,t="World Quest"}
w[65262]={n="Save the Vombata",e="SHADOWLANDS",m=1970,t="World Quest"}
w[65402]={n="Pattern Recognition",e="SHADOWLANDS",m=1970,t="World Quest"}
w[65403]={n="Puzzling Situation",e="SHADOWLANDS",m=1970,t="World Quest"}
w[65404]={n="Puzzling It Out",e="SHADOWLANDS",m=1970,t="World Quest"}
w[65405]={n="Perplexing Problem",e="SHADOWLANDS",m=1970,t="World Quest"}
w[65406]={n="Connecting It All",e="SHADOWLANDS",m=1970,t="World Quest"}
w[65407]={n="Pattern Recognition",e="SHADOWLANDS",m=1970,t="World Quest"}
w[65408]={n="Pattern Recognition",e="SHADOWLANDS",m=1970,t="World Quest"}
w[65410]={n="Puzzling Situation",e="SHADOWLANDS",m=1970,t="World Quest"}
w[65411]={n="Puzzling Situation",e="SHADOWLANDS",m=1970,t="World Quest"}
w[65412]={n="Puzzling It Out",e="SHADOWLANDS",m=1970,t="World Quest"}
w[65413]={n="Puzzling It Out",e="SHADOWLANDS",m=1970,t="World Quest"}
w[65414]={n="Perplexing Problem",e="SHADOWLANDS",m=1970,t="World Quest"}
w[65415]={n="Perplexing Problem",e="SHADOWLANDS",m=1970,t="World Quest"}
w[65416]={n="Connecting It All",e="SHADOWLANDS",m=1970,t="World Quest"}
w[65417]={n="Connecting It All",e="SHADOWLANDS",m=1970,t="World Quest"}
w[65889]={n="Lost Relics",e="DRAGONFLIGHT",m=2023,t="World Quest"}
w[66070]={n="Brightblade's Bones",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[66133]={n="Keys of Loyalty",e="DRAGONFLIGHT",m=2022,t="Elite World Quest"}
w[66194]={n="Research 103 - Decaying Conditions",e="DRAGONFLIGHT",m=2024,t="World Quest"}
w[66200]={n="Walking Digsites",e="DRAGONFLIGHT",m=2024,t="Rare Elite World Quest"}
w[66203]={n="Wash Over Them",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[66220]={n="Lost Relics 2",e="DRAGONFLIGHT",m=2023,t="World Quest"}
w[66419]={n="Allegiance to One",e="DRAGONFLIGHT",m=2022,t="Elite World Quest"}
w[66551]={n="The Terrible Three",e="DRAGONFLIGHT",m=2022,t="Battle Pet World Quest"}
w[66588]={n="Swog the Elder",e="DRAGONFLIGHT",m=2022,t="Battle Pet World Quest"}
w[66614]={n="Valinor, the Light of Eons",e="SHADOWLANDS",m=1533,t="Elite World Quest"}
w[66615]={n="Nurgash Muckformed",e="SHADOWLANDS",m=1525,t="Elite World Quest"}
w[66616]={n="Oranomonos the Everbranching",e="SHADOWLANDS",m=1565,t="Elite World Quest"}
w[66617]={n="Mortanis",e="SHADOWLANDS",m=1536,t="Elite World Quest"}
w[66618]={n="Mor'geth",e="SHADOWLANDS",m=1543,t="Elite World Quest"}
w[66619]={n="Antros",e="SHADOWLANDS",m=1970,t="Elite World Quest"}
w[66693]={n="Tempting Fate: Castle Nathria",e="SHADOWLANDS",m=1525,t="Elite World Quest"}
w[66694]={n="Tempting Fate: Sanctum of Domination",e="SHADOWLANDS",m=1543,t="Elite World Quest"}
w[66695]={n="Tempting Fate: Sepulcher of the First Ones",e="SHADOWLANDS",m=1970,t="Elite World Quest"}
w[66696]={n="Tempting Fate: Fate of the Shadowlands",e="SHADOWLANDS",m=1525,t="Elite World Quest"}
w[66805]={n="Keys of Loyalty",e="DRAGONFLIGHT",m=2022,t="Elite World Quest"}
w[66833]={n="Marmoni in Distress",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[66896]={n="Net Income",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[66902]={n="Bee-Gone",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[66934]={n="Break the Breaker",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[66989]={n="Helpful Harvest",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[67005]={n="How to Train a Proto-Drake",e="DRAGONFLIGHT",m=2022,t="PvP World Quest"}
w[67006]={n="Quenching the Flame",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[67009]={n="Hornswog Hogwash",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[67010]={n="Boiling Over",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[67012]={n="When Riverbeasts Fly",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[67014]={n="Gorlocs No More-locs",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[67024]={n="Smoldering Reinforcement",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[67026]={n="Hold the Shrine",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[67062]={n="Cascading Conflict",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[67113]={n="Excavation Emergency",e="DRAGONFLIGHT",t="World Quest"}
w[69913]={n="Towers of Earthen Power",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[69916]={n="Famous Frogs",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[69924]={n="Towers of Flaming Power",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[69927]={n="Bazual",e="DRAGONFLIGHT",m=2024,t="Epic Elite World Quest"}
w[69928]={n="Liskanoth",e="DRAGONFLIGHT",m=2025,t="Epic Elite World Quest"}
w[69929]={n="Strunraan",e="DRAGONFLIGHT",m=2023,t="Epic Elite World Quest"}
w[69930]={n="Basrikron",e="DRAGONFLIGHT",m=2022,t="Epic Elite World Quest"}
w[69931]={n="Swoop And Grab",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[69938]={n="Fishing Frenzy!",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[69941]={n="Frozen Victims",e="DRAGONFLIGHT",m=2024,t="World Quest"}
w[69942]={n="Brackenhide Mysteries",e="DRAGONFLIGHT",m=2024,t="World Quest"}
w[69949]={n="Extermination",e="DRAGONFLIGHT",m=2025,t="PvP World Quest"}
w[69987]={n="The Field of Ferocity Redux: Terror of the Swamp!",e="DRAGONFLIGHT",m=2023,t="Elite World Quest"}
w[69988]={n="Flashy Rocks",e="DRAGONFLIGHT",m=2023,t="World Quest"}
w[69990]={n="The Field of Ferocity Redux: Lord of Decay!",e="DRAGONFLIGHT",m=2023,t="Elite World Quest"}
w[69991]={n="The Field of Ferocity Redux: Foe from the Volcano!",e="DRAGONFLIGHT",m=2023,t="Elite World Quest"}
w[69993]={n="The Field of Ferocity Redux: Lost in the Dream!",e="DRAGONFLIGHT",m=2023,t="Elite World Quest"}
w[69994]={n="The Field of Ferocity Redux: Elemental Revenge Round!",e="DRAGONFLIGHT",m=2023,t="Elite World Quest"}
w[69995]={n="The Field of Ferocity Redux: Master of the Hunt!",e="DRAGONFLIGHT",m=2023,t="Elite World Quest"}
w[70011]={n="Furry Friends",e="DRAGONFLIGHT",m=2024,t="World Quest"}
w[70012]={n="Protect the Nets!",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[70015]={n="Decay Cleanup",e="DRAGONFLIGHT",m=2024,t="World Quest"}
w[70016]={n="Calming the Land",e="DRAGONFLIGHT",m=2024,t="World Quest"}
w[70021]={n="Tale of Tapionnuq",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[70035]={n="Ruriq's River Rapids Ride",e="DRAGONFLIGHT",m=2024,t="World Quest"}
w[70037]={n="Unpowered Tools",e="DRAGONFLIGHT",m=2024,t="Elite World Quest"}
w[70047]={n="Icy Prisons",e="DRAGONFLIGHT",m=2024,t="World Quest"}
w[70057]={n="Thieving Tarasek",e="DRAGONFLIGHT",m=2025,t="World Quest"}
w[70064]={n="For Imbu!",e="DRAGONFLIGHT",m=2024,t="Rare Elite World Quest"}
w[70066]={n="Reclaiming the Hold",e="DRAGONFLIGHT",m=2025,t="Rare Elite World Quest"}
w[70067]={n="A Message to the Nokhud",e="DRAGONFLIGHT",m=2023,t="Rare Elite World Quest"}
w[70068]={n="Cobalt Catastrophe",e="DRAGONFLIGHT",m=2024,t="Rare Elite World Quest"}
w[70071]={n="Gathering the Magic",e="DRAGONFLIGHT",m=2024,t="World Quest"}
w[70072]={n="Time-Lost and Found",e="DRAGONFLIGHT",m=2025,t="World Quest"}
w[70073]={n="Bluefeather Banners",e="DRAGONFLIGHT",m=2025,t="World Quest"}
w[70074]={n="Plunder the Sundered",e="DRAGONFLIGHT",m=2023,t="World Quest"}
w[70075]={n="Cataloging the Waking Shores",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[70079]={n="Cataloging the Ohn'ahran Plains",e="DRAGONFLIGHT",m=2023,t="World Quest"}
w[70100]={n="Cataloging the Azure Span",e="DRAGONFLIGHT",m=2024,t="World Quest"}
w[70110]={n="Cataloging Thaldraszus",e="DRAGONFLIGHT",m=2025,t="World Quest"}
w[70111]={n="Temple Treasures",e="DRAGONFLIGHT",m=2025,t="World Quest"}
w[70112]={n="Furbolg Threat",e="DRAGONFLIGHT",m=2024,t="World Quest"}
w[70146]={n="Highlands Rebuttal",e="DRAGONFLIGHT",m=2023,t="World Quest"}
w[70149]={n="Hope for the Highlands",e="DRAGONFLIGHT",m=2023,t="World Quest"}
w[70150]={n="Many Whelps, Handle It",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[70152]={n="Fishing Frenzy!",e="DRAGONFLIGHT",m=2024,t="World Quest"}
w[70160]={n="Alchemical Thesis Defense",e="DRAGONFLIGHT",m=2025,t="World Quest"}
w[70172]={n="Mountain Mysteries",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[70176]={n="Web Victims",e="DRAGONFLIGHT",m=2023,t="World Quest"}
w[70209]={n="Quacks and Attacks",e="DRAGONFLIGHT",m=2023,t="PvP World Quest"}
w[70224]={n="Fetid Threat",e="DRAGONFLIGHT",m=2025,t="World Quest"}
w[70369]={n="Blasting the Past",e="DRAGONFLIGHT",m=2025,t="World Quest"}
w[70439]={n="Wild Arcana",e="DRAGONFLIGHT",m=2024,t="PvP World Quest"}
w[70440]={n="Dead Eyes",e="DRAGONFLIGHT",m=2024,t="World Quest"}
w[70442]={n="Banquet Battle",e="DRAGONFLIGHT",m=2025,t="World Quest"}
w[70502]={n="Clearing the Skies",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[70529]={n="Bring Them Home",e="DRAGONFLIGHT",m=2024,t="World Quest"}
w[70549]={n="Low Hanging Fruit",e="DRAGONFLIGHT",m=2023,t="World Quest"}
w[70602]={n="History Lesson: War of the Shifting Sands",e="DRAGONFLIGHT",m=2025,t="World Quest"}
w[70612]={n="Feed Three-Falls",e="DRAGONFLIGHT",m=2024,t="World Quest"}
w[70622]={n="Resupply Three-Falls",e="DRAGONFLIGHT",m=2024,t="World Quest"}
w[70623]={n="Clearing the Skies",e="DRAGONFLIGHT",m=2023,t="World Quest"}
w[70625]={n="Spellforged Creations",e="DRAGONFLIGHT",m=2024,t="Elite World Quest"}
w[70629]={n="Assaulting the Shore",e="DRAGONFLIGHT",m=2024,t="World Quest"}
w[70631]={n="Clearing the Skies",e="DRAGONFLIGHT",m=2024,t="World Quest"}
w[70632]={n="Cataloging the Waking Shores",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[70634]={n="Lashed Out",e="DRAGONFLIGHT",m=2023,t="World Quest"}
w[70636]={n="Ancient Proto-Dragons",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[70638]={n="Wind Breaker",e="DRAGONFLIGHT",m=2023,t="World Quest"}
w[70639]={n="Azure Banners",e="DRAGONFLIGHT",m=2024,t="World Quest"}
w[70646]={n="Pressure Valve",e="DRAGONFLIGHT",m=2023,t="World Quest"}
w[70649]={n="Swab Swog",e="DRAGONFLIGHT",m=2023,t="World Quest"}
w[70651]={n="Stolen Luggage",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[70652]={n="Take One Down, Pass It Around",e="DRAGONFLIGHT",m=2023,t="World Quest"}
w[70653]={n="Cold Hard Science",e="DRAGONFLIGHT",m=2024,t="World Quest"}
w[70654]={n="Are You Kitten Me?",e="DRAGONFLIGHT",m=2025,t="World Quest"}
w[70655]={n="Leaves from the Vine",e="DRAGONFLIGHT",m=2023,t="World Quest"}
w[70656]={n="Not Mushroom For Error",e="DRAGONFLIGHT",m=2025,t="World Quest"}
w[70658]={n="Artifact or Fiction",e="DRAGONFLIGHT",m=2024,t="World Quest"}
w[70659]={n="Cataloging the Ohn'ahran Plains",e="DRAGONFLIGHT",m=2023,t="World Quest"}
w[70660]={n="High-Grade Minerals",e="DRAGONFLIGHT",m=2023,t="World Quest"}
w[70661]={n="Supplies on High",e="DRAGONFLIGHT",m=2025,t="World Quest"}
w[70662]={n="A Bone to Pickaxe",e="DRAGONFLIGHT",m=2024,t="World Quest"}
w[70699]={n="Cataloging Thaldraszus",e="DRAGONFLIGHT",m=2025,t="World Quest"}
w[70720]={n="Can't Have These",e="DRAGONFLIGHT",m=2024,t="World Quest"}
w[70780]={n="Ohn'ahran Banners",e="DRAGONFLIGHT",m=2023,t="World Quest"}
w[70782]={n="Canopy Banners",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[70934]={n="Salamanther's Embrace",e="DRAGONFLIGHT",m=2025,t="World Quest"}
w[70984]={n="Surge Breaker",e="DRAGONFLIGHT",m=2022,t="Rare Elite World Quest"}
w[71140]={n="Two and Two Together",e="DRAGONFLIGHT",m=2023,t="Battle Pet World Quest"}
w[71145]={n="The Grand Master",e="DRAGONFLIGHT",m=2024,t="Battle Pet World Quest"}
w[71154]={n="Talon Toss: Shooting 101",e="DRAGONFLIGHT",m=2025,t="World Quest"}
w[71156]={n="Rebel Concerns",e="DRAGONFLIGHT",m=2025,t="World Quest"}
w[71160]={n="Depth Charge",e="DRAGONFLIGHT",m=2025,t="World Quest"}
w[71164]={n="Stolen Bandages",e="DRAGONFLIGHT",m=2025,t="World Quest"}
w[71166]={n="The Oldest Dragonfly",e="DRAGONFLIGHT",m=2025,t="Battle Pet World Quest"}
w[71180]={n="You Have to Start Somewhere",e="DRAGONFLIGHT",m=2025,t="Battle Pet World Quest"}
w[71181]={n="Forgotten Grotto Relics",e="DRAGONFLIGHT",m=2025,t="World Quest"}
w[71201]={n="Hide and Sneak",e="DRAGONFLIGHT",m=2025,t="World Quest"}
w[71202]={n="Mini Manafiend Melee",e="DRAGONFLIGHT",m=2024,t="Battle Pet World Quest"}
w[71205]={n="Hydro Tuskarr",e="DRAGONFLIGHT",m=2025,t="World Quest"}
w[71206]={n="Eye of the Stormling",e="DRAGONFLIGHT",m=2023,t="Battle Pet World Quest"}
w[71212]={n="Attackin' the Brackenhide",e="DRAGONFLIGHT",m=2024,t="Rare Elite World Quest"}
w[71214]={n="Reclaiming The Cascades",e="DRAGONFLIGHT",m=2025,t="World Quest"}
w[71225]={n="Blown Through Wind: Rhuzast",e="DRAGONFLIGHT",m=2025,t="PvP Elite World Quest"}
w[72008]={n="Overcoming A Mountain: Krolkoth",e="DRAGONFLIGHT",m=2022,t="PvP Elite World Quest"}
w[72019]={n="Seeing through the Enemy: Nezascar",e="DRAGONFLIGHT",m=2024,t="PvP Elite World Quest"}
w[72022]={n="Fishing Frenzy!",e="DRAGONFLIGHT",m=2024,t="World Quest"}
w[72028]={n="Fishing Frenzy!",e="DRAGONFLIGHT",m=2023,t="World Quest"}
w[72029]={n="Fishing Frenzy!",e="DRAGONFLIGHT",m=2025,t="World Quest"}
w[72030]={n="Fishing Frenzy!",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[72058]={n="What Hoof We Here: Tarolekk",e="DRAGONFLIGHT",m=2023,t="PvP Elite World Quest"}
w[72090]={n="Disrupting the Primalist Plan",e="DRAGONFLIGHT",m=2085,t="Rare Elite World Quest"}
w[73146]={n="Cutting Wind",e="DRAGONFLIGHT",m=2151,t="Battle Pet World Quest"}
w[73147]={n="Shifting Ground",e="DRAGONFLIGHT",m=2151,t="Battle Pet World Quest"}
w[73148]={n="Combustible Vegetation",e="DRAGONFLIGHT",m=2151,t="Battle Pet World Quest"}
w[73149]={n="Flood Warning",e="DRAGONFLIGHT",m=2151,t="Battle Pet World Quest"}
w[73221]={n="A Clear State of Mind",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[73408]={n="Sniffen 'em Out!",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[73698]={n="Rolie Polie Molie",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[74292]={n="Deephollow Mysteries",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[74378]={n="The Storm's Fury",e="DRAGONFLIGHT",m=2025,t="Epic Elite World Quest"}
w[74501]={n="Suffusion Camp: Cinderwind",e="DRAGONFLIGHT",m=2023,t="Elite World Quest"}
w[74792]={n="They're Full of Stars!",e="DRAGONFLIGHT",m=2025,t="Battle Pet World Quest"}
w[74794]={n="Right Twice a Day",e="DRAGONFLIGHT",m=2025,t="Battle Pet World Quest"}
w[74835]={n="Enok the Stinky",e="DRAGONFLIGHT",m=2024,t="Battle Pet World Quest"}
w[74836]={n="A New Vocation",e="DRAGONFLIGHT",m=2024,t="Battle Pet World Quest"}
w[74837]={n="Paws of Thunder",e="DRAGONFLIGHT",m=2023,t="Battle Pet World Quest"}
w[74838]={n="Lyver",e="DRAGONFLIGHT",m=2023,t="Battle Pet World Quest"}
w[74840]={n="Sharp as Flint",e="DRAGONFLIGHT",m=2022,t="Battle Pet World Quest"}
w[74841]={n="Adinakon",e="DRAGONFLIGHT",m=2022,t="Battle Pet World Quest"}
w[74879]={n="Corrosive Counterbalance",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[74892]={n="Zaqali Elders",e="DRAGONFLIGHT",m=2133,t="Epic Elite World Quest"}
w[74945]={n="Guanite Gambit",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[74985]={n="Like Moths to a Flame",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[74988]={n="If You Can't Take the Heat",e="DRAGONFLIGHT",m=2133,t="Elite World Quest"}
w[74989]={n="Zealous Defenses",e="DRAGONFLIGHT",m=2133,t="Elite World Quest"}
w[74990]={n="Roiling Shadow",e="DRAGONFLIGHT",m=2133,t="Elite World Quest"}
w[74991]={n="We Have Returned",e="DRAGONFLIGHT",m=2133,t="Elite World Quest"}
w[74992]={n="Fire Resistance Gear",e="DRAGONFLIGHT",m=2133,t="Elite World Quest"}
w[75030]={n="Crystal Catastrophe!",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[75058]={n="Spearheading Acquisition",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[75060]={n="A Veritable Dumping Ground",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[75061]={n="No Mushroom For Ever",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[75062]={n="Crystalline Conundrum",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[75063]={n="Ambergrease",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[75064]={n="Shrooming for a Living",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[75067]={n="Rock Viper Roundup",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[75071]={n="Sniffing Mice are Nice",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[75126]={n="Cataloging Zaralek Cavern",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[75128]={n="Slime Ranching",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[75151]={n="Redistributing the Remnants",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[75155]={n="Shadowflame Snuffer",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[75162]={n="Conjuring Elements",e="DRAGONFLIGHT",m=2133,t="PvP World Quest"}
w[75200]={n="Deepflayer Slayer",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[75257]={n="The War Creche",e="DRAGONFLIGHT",m=2151,t="Rare Elite World Quest"}
w[75267]={n="Kob'rok",e="DRAGONFLIGHT",t="Elite World Quest"}
w[75269]={n="Kapraku",e="DRAGONFLIGHT",t="Elite World Quest"}
w[75271]={n="Aquifon",e="DRAGONFLIGHT",t="Elite World Quest"}
w[75274]={n="Goopal",e="DRAGONFLIGHT",t="Elite World Quest"}
w[75276]={n="Spinmarrow",e="DRAGONFLIGHT",t="Elite World Quest"}
w[75280]={n="Suffusion Camp: Frostburn",e="DRAGONFLIGHT",m=2024,t="Elite World Quest"}
w[75285]={n="Alcanon",e="DRAGONFLIGHT",t="Elite World Quest"}
w[75292]={n="Professor Gastrinax",e="DRAGONFLIGHT",t="Elite World Quest"}
w[75296]={n="General Zskorro",e="DRAGONFLIGHT",t="Elite World Quest"}
w[75298]={n="Underlight Queen",e="DRAGONFLIGHT",t="Elite World Quest"}
w[75322]={n="Klakatak",e="DRAGONFLIGHT",t="Elite World Quest"}
w[75326]={n="Brullo the Strong",e="DRAGONFLIGHT",t="Elite World Quest"}
w[75334]={n="Karokta",e="DRAGONFLIGHT",t="Elite World Quest"}
w[75336]={n="Invoq",e="DRAGONFLIGHT",t="Elite World Quest"}
w[75340]={n="Magtembo",e="DRAGONFLIGHT",t="Elite World Quest"}
w[75343]={n="All That Glitter",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[75344]={n="Crystal Cracker",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[75345]={n="Shell Corporation",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[75346]={n="Data Gathering",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[75349]={n="Skornak",e="DRAGONFLIGHT",t="Elite World Quest"}
w[75350]={n="Niffen Nabber",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[75353]={n="Dinn",e="DRAGONFLIGHT",t="Elite World Quest"}
w[75358]={n="Flowfy",e="DRAGONFLIGHT",t="Elite World Quest"}
w[75360]={n="Subterrax",e="DRAGONFLIGHT",t="Elite World Quest"}
w[75364]={n="Emberdusk",e="DRAGONFLIGHT",t="Elite World Quest"}
w[75366]={n="Viridian King",e="DRAGONFLIGHT",t="Elite World Quest"}
w[75459]={n="Brand New Digs",e="DRAGONFLIGHT",t="World Quest"}
w[75476]={n="Colossian",e="DRAGONFLIGHT",t="Elite World Quest"}
w[75660]={n="Ending Their Watch",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[75661]={n="Curative Crystalline Collection",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[75663]={n="Restless Torment",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[75680]={n="To a Land Down Under",e="DRAGONFLIGHT",m=2133,t="Battle Pet World Quest"}
w[75750]={n="Are They Not Beautiful?",e="DRAGONFLIGHT",m=2133,t="Battle Pet World Quest"}
w[75834]={n="Delver Mardei",e="DRAGONFLIGHT",m=2133,t="Battle Pet World Quest"}
w[75835]={n="Do You Even Train?",e="DRAGONFLIGHT",m=2133,t="Battle Pet World Quest"}
w[76367]={n="Hibernation Heroes",e="DRAGONFLIGHT",m=2200,t="Epic Elite World Quest"}
w[76506]={n="Dryad Fire Drill",e="DRAGONFLIGHT",m=2200,t="World Quest"}
w[76518]={n="Root Security",e="DRAGONFLIGHT",m=2200,t="World Quest"}
w[76519]={n="All The Children",e="DRAGONFLIGHT",m=2200,t="World Quest"}
w[76520]={n="A Shared Dream",e="DRAGONFLIGHT",m=2200,t="World Quest"}
w[76522]={n="Reverie Of Battle",e="DRAGONFLIGHT",m=2200,t="World Quest"}
w[76526]={n="In the Trees",e="DRAGONFLIGHT",m=2200,t="World Quest"}
w[76549]={n="Dreaming in the Dream",e="DRAGONFLIGHT",m=2200,t="World Quest"}
w[76550]={n="True Sight",e="DRAGONFLIGHT",m=2200,t="World Quest"}
w[76551]={n="Treasure Diving",e="DRAGONFLIGHT",m=2200,t="World Quest"}
w[76558]={n="Base Control",e="DRAGONFLIGHT",m=2200,t="Elite World Quest"}
w[76559]={n="Our Owllies",e="DRAGONFLIGHT",m=2200,t="World Quest"}
w[76562]={n="Moat Maintenance",e="DRAGONFLIGHT",m=2200,t="World Quest"}
w[76586]={n="Spreading the Light",e="TWW",m=2215,t="Elite World Quest"}
w[76587]={n="Research: Centaur of Ohn'ahran Plains",e="DRAGONFLIGHT",m=2023,t="World Quest"}
w[76734]={n="Research: Djaradin of Zaralek Cavern",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[76739]={n="Research: Niffen of Zaralek Cavern",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[76911]={n="Research: Drakonid of Waking Shores",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[76988]={n="Sylvan Slalom",e="DRAGONFLIGHT",m=2200,t="World Quest"}
w[76989]={n="Trashing the Camp",e="DRAGONFLIGHT",m=2200,t="World Quest"}
w[76990]={n="Portal Panic",e="DRAGONFLIGHT",m=2200,t="World Quest"}
w[76991]={n="Carpe Diem",e="DRAGONFLIGHT",m=2200,t="World Quest"}
w[76992]={n="Fickle Judgment",e="DRAGONFLIGHT",m=2200,t="World Quest"}
w[76993]={n="Turtle Power",e="DRAGONFLIGHT",m=2200,t="World Quest"}
w[77156]={n="Botanical Redistribution",e="DRAGONFLIGHT",m=2200,t="World Quest"}
w[77159]={n="No Mushroom for Error",e="DRAGONFLIGHT",m=2200,t="World Quest"}
w[77362]={n="Research: Drakonid of Forbidden Reach",e="DRAGONFLIGHT",m=2151,t="World Quest"}
w[77424]={n="Research: Dracthyr of Forbidden Reach",e="DRAGONFLIGHT",m=2151,t="World Quest"}
w[77714]={n="Nature Sealed",e="DRAGONFLIGHT",m=2200,t="World Quest"}
w[77715]={n="Bubble Rescue",e="DRAGONFLIGHT",m=2200,t="World Quest"}
w[77754]={n="Pyromania Problems",e="DRAGONFLIGHT",m=2200,t="World Quest"}
w[77755]={n="Breaking Down the Camp",e="DRAGONFLIGHT",m=2200,t="World Quest"}
w[77756]={n="Flight of the Dragons",e="DRAGONFLIGHT",m=2200,t="World Quest"}
w[77757]={n="Terror in Haven",e="DRAGONFLIGHT",m=2200,t="World Quest"}
w[77761]={n="Documenting a Dream",e="DRAGONFLIGHT",m=2200,t="World Quest"}
w[77765]={n="Documenting a Dream",e="DRAGONFLIGHT",m=2200,t="World Quest"}
w[78215]={n="Rooted in Danger",e="DRAGONFLIGHT",m=2200,t="PvP World Quest"}
w[78370]={n="Claws for Concern",e="DRAGONFLIGHT",m=2200,t="World Quest"}
w[78616]={n="Technoscrying: The Mysteries of the Concord Observatory",e="DRAGONFLIGHT",m=2022,t="World Quest"}
w[78645]={n="Excavation: Buried in the Riverbed",e="DRAGONFLIGHT",m=2023,t="World Quest"}
w[78649]={n="Excavation: Something Big Beneath the Riverbed",e="DRAGONFLIGHT",m=2023,t="World Quest"}
w[78661]={n="Excavation: Treasures in the Cliffside",e="DRAGONFLIGHT",m=2151,t="World Quest"}
w[78662]={n="Excavation: A Cliffside Full of Caches",e="DRAGONFLIGHT",m=2151,t="World Quest"}
w[78663]={n="Excavation: Scattered Around the Tower",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[78739]={n="Excavation: The Trove in the Tower",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[78820]={n="Technoscrying: The Mysteries of Igira's Watch",e="DRAGONFLIGHT",m=2133,t="World Quest"}
w[78931]={n="Technoscrying: The Mysteries of Dragonskull Island",e="DRAGONFLIGHT",m=2151,t="World Quest"}
w[78974]={n="Beetle-Minded",e="TWW",m=2255,t="World Quest"}
w[78995]={n="Truffle Shuffle",e="TWW",m=2255,t="World Quest"}
w[79116]={n="Spider Optics",e="TWW",m=2255,t="World Quest"}
w[79246]={n="Captain's Orders: Coffer Collector",e="TWW",t="World Quest"}
w[79249]={n="Captain's Orders: Kill Haul",e="TWW",t="World Quest"}
w[79379]={n="Captain's Orders: No Prey, No Pay",e="TWW",t="World Quest"}
w[79381]={n="Captain's Orders: X Marks the Spot",e="TWW",t="World Quest"}
w[79382]={n="Captain's Orders: Plunderstudy",e="TWW",t="World Quest"}
w[79722]={n="Gutter Work",e="TWW",m=2255,t="World Quest"}
w[79958]={n="Worm Sign, Sealed, Delivered",e="TWW",m=2255,t="World Quest"}
w[79959]={n="Wormcraft Rumble",e="TWW",m=2255,t="World Quest"}
w[79960]={n="Taking it To Go",e="TWW",m=2255,t="World Quest"}
w[79965]={n="Learn the Ropes or Walk the Plank",e="TWW",t="World Quest"}
w[80081]={n="Captain's Orders: Flood and Plunder",e="TWW",t="World Quest"}
w[80110]={n="Daily Doubloons",e="TWW",t="World Quest"}
w[80208]={n="Digging into Trouble",e="TWW",m=2214,t="PvP World Quest"}
w[80295]={n="Rocks, Water and Elemental Fodder",e="TWW",m=2248,t="World Quest"}
w[80323]={n="Foggy Faceoff",e="TWW",m=2214,t="PvP Elite World Quest"}
w[80394]={n="Along for the Ride",e="TWW",m=2248,t="PvP World Quest"}
w[80395]={n="Elemental Excavation",e="TWW",m=2248,t="PvP World Quest"}
w[80409]={n="Polarized",e="TWW",m=2255,t="PvP World Quest"}
w[80412]={n="Fending off Darkness",e="TWW",m=2215,t="PvP World Quest"}
w[80457]={n="Serving the Queen",e="TWW",m=2213,t="PvP World Quest"}
w[81465]={n="Artifacts Galore",e="TWW",m=2248,t="World Quest"}
w[81512]={n="Props and Incense",e="TWW",m=2248,t="World Quest"}
w[81615]={n="Wick Points",e="TWW",m=2248,t="World Quest"}
w[81620]={n="Recovery Job",e="TWW",m=2215,t="World Quest"}
w[81621]={n="Tunnels Be Gone!",e="TWW",m=2248,t="World Quest"}
w[81622]={n="Bells of the Light",e="TWW",m=2215,t="PvP World Quest"}
w[81639]={n="Honey Thieving Nerubians",e="TWW",m=2248,t="World Quest"}
w[81647]={n="Special Assignment: Titanic Resurgence",e="TWW",m=2248,t="Capstone World Quest"}
w[81649]={n="Special Assignment: Titanic Resurgence",e="TWW",m=2248,t="Capstone World Quest"}
w[81650]={n="Special Assignment: Titanic Resurgence",e="TWW",m=2248,t="Capstone World Quest"}
w[81656]={n="Nothing to Waste",e="TWW",m=2214,t="World Quest"}
w[81675]={n="Water the Sheep",e="TWW",m=2339,t="World Quest"}
w[81691]={n="Special Assignment: Shadows Below",e="TWW",m=2214,t="Capstone World Quest"}
w[81710]={n="Mead for the Catalog",e="TWW",m=2248,t="World Quest"}
w[81750]={n="Cloud Farming",e="TWW",m=2214,t="World Quest"}
w[81767]={n="Scrounge that Scrap!",e="TWW",m=2214,t="World Quest"}
w[81854]={n="Coreway Maintenance Request",e="TWW",m=2248,t="World Quest"}
w[81862]={n="Feline Frenzy",e="TWW",m=2215,t="World Quest"}
w[82041]={n="Beledar's Blessing",e="TWW",m=2215,t="World Quest"}
w[82088]={n="Kobyss Kibosh",e="TWW",m=2215,t="World Quest"}
w[82120]={n="Pool Cleaner",e="TWW",m=2215,t="World Quest"}
w[82133]={n="Documenting: Field Manual Edition",e="TWW",m=2215,t="World Quest"}
w[82197]={n="Reserve Rumpus",e="TWW",m=2215,t="World Quest"}
w[82206]={n="Into Shadows",e="TWW",m=2215,t="World Quest"}
w[82225]={n="Excavation Extravaganza",e="TWW",m=2248,t="World Quest"}
w[82234]={n="A Floral Flair for Every Ram",e="TWW",m=2248,t="World Quest"}
w[82237]={n="Rising the Falls",e="TWW",m=2248,t="World Quest"}
w[82238]={n="Lava Glob Lobbin'",e="TWW",m=2214,t="World Quest"}
w[82244]={n="Lava Pearls",e="TWW",m=2214,t="World Quest"}
w[82254]={n="Aquacalypse",e="TWW",m=2215,t="World Quest"}
w[82256]={n="Capturing the Cataract's Creatures",e="TWW",m=2214,t="World Quest"}
w[82257]={n="Burrow Burial",e="TWW",m=2215,t="World Quest"}
w[82258]={n="Sieging Siege Weapons",e="TWW",m=2215,t="World Quest"}
w[82259]={n="Honoring Our Fallen",e="TWW",m=2215,t="World Quest"}
w[82266]={n="Tower Washing Simulator",e="TWW",m=2213,t="World Quest"}
w[82288]={n="Work Hard, Play Hard",e="TWW",m=2215,t="World Quest"}
w[82291]={n="Robot Rumble",e="TWW",m=2248,t="Battle Pet World Quest"}
w[82292]={n="Rock Collector",e="TWW",m=2248,t="Battle Pet World Quest"}
w[82293]={n="The Power of Friendship",e="TWW",m=2214,t="Battle Pet World Quest"}
w[82294]={n="Miniature Army",e="TWW",m=2215,t="Battle Pet World Quest"}
w[82295]={n="Ziriak",e="TWW",m=2216,t="Battle Pet World Quest"}
w[82297]={n="One Hungry Worm",e="TWW",m=2255,t="Battle Pet World Quest"}
w[82298]={n="The Thing from the Swamp",e="TWW",m=2215,t="Battle Pet World Quest"}
w[82300]={n="Major Malfunction",e="TWW",m=2214,t="Battle Pet World Quest"}
w[82324]={n="Grub Run",e="TWW",m=2255,t="World Quest"}
w[82332]={n="Unassuming Delivery Spider",e="TWW",m=2255,t="World Quest"}
w[82355]={n="Special Assignment: Cinderbee Surge",e="TWW",m=2248,t="Capstone World Quest"}
w[82363]={n="Opposing Forces",e="TWW",m=2255,t="World Quest"}
w[82364]={n="Documenting Discordance",e="TWW",m=2256,t="World Quest"}
w[82387]={n="Slay the Goo, Save the World",e="TWW",m=2255,t="Elite World Quest"}
w[82414]={n="Special Assignment: A Pound of Cure",e="TWW",m=2255,t="Capstone World Quest"}
w[82448]={n="Book It to the Library",e="TWW",m=2248,t="World Quest"}
w[82451]={n="Preserving Plush Pals",e="TWW",m=2248,t="World Quest"}
w[82454]={n="Firebath Tuning",e="TWW",m=2248,t="World Quest"}
w[82455]={n="No More Bread",e="TWW",m=2248,t="World Quest"}
w[82456]={n="Chew On This",e="TWW",m=2248,t="World Quest"}
w[82468]={n="Let Them Win",e="TWW",m=2255,t="World Quest"}
w[82470]={n="Arcane Riddles",e="TWW",m=2248,t="World Quest"}
w[82481]={n="Enforcer Extermination",e="TWW",m=2255,t="World Quest"}
w[82518]={n="Pipe Patcher",e="TWW",m=2214,t="World Quest"}
w[82519]={n="You Go Take Candle",e="TWW",m=2214,t="World Quest"}
w[82521]={n="Pawns of Dark Masters",e="TWW",m=2256,t="World Quest"}
w[82523]={n="Candle Kingbreaker",e="TWW",m=2214,t="World Quest"}
w[82524]={n="Exterminate",e="TWW",m=2255,t="World Quest"}
w[82526]={n="Bug Them",e="TWW",m=2213,t="World Quest"}
w[82531]={n="Special Assignment: Bombs from Behind",e="TWW",m=2255,t="Capstone World Quest"}
w[82533]={n="Dye! Dye Dye!",e="TWW",m=2255,t="World Quest"}
w[82535]={n="[REUSE THIS RECORD]",e="TWW",t="World Quest"}
w[82536]={n="Exfiltration Operation",e="TWW",m=2213,t="World Quest"}
w[82537]={n="[REUSE THIS RECORD]",e="TWW",t="World Quest"}
w[82552]={n="All Worked Up",e="TWW",m=2214,t="World Quest"}
w[82580]={n="Courier Mission: Ore Recovery",e="TWW",m=2214,t="World Quest"}
w[82582]={n="Mired in Shadow",e="TWW",m=2215,t="World Quest"}
w[82583]={n="Igniting the Fire Within",e="TWW",m=2215,t="World Quest"}
w[82584]={n="Light's Gambit",e="TWW",m=2215,t="World Quest"}
w[82585]={n="With Great Pyre",e="TWW",m=2215,t="World Quest"}
w[82586]={n="Spore Ender",e="TWW",m=2215,t="World Quest"}
w[82650]={n="A Pinch of Salt",e="TWW",m=2248,t="World Quest"}
w[82658]={n="Drop and Go",e="TWW",m=2248,t="World Quest"}
w[82787]={n="Special Assignment: Rise of the Colossals",e="TWW",m=2215,t="Capstone World Quest"}
w[82852]={n="Special Assignment: Lynx Rescue",e="TWW",m=2215,t="Capstone World Quest"}
w[83028]={n="Thieving Snufflers",e="TWW",m=2214,t="World Quest"}
w[83048]={n="Wayward Walkers",e="TWW",m=2214,t="World Quest"}
w[83079]={n="Mineral Buildup",e="TWW",m=2214,t="World Quest"}
w[83080]={n="Taelloch Cleanup",e="TWW",m=2214,t="World Quest"}
w[83101]={n="Reaching for Resources",e="TWW",m=2214,t="World Quest"}
w[83229]={n="Special Assignment: When the Deeps Stir",e="TWW",m=2214,t="Capstone World Quest"}
w[83536]={n="Undertide Undertaker",e="TWW",m=2255,t="World Quest"}
w[83537]={n="Geothermal Gem Treatment",e="TWW",m=2214,t="World Quest"}
w[83538]={n="Excavation Liberation",e="TWW",m=2214,t="World Quest"}
w[83562]={n="Calling Quest (DNT)",e="TWW",t="Calling Quest"}
w[83715]={n="Claimed Salvage",e="TWW",m=2214,t="World Quest"}
w[83718]={n="Eggstraction",e="TWW",m=2255,t="World Quest"}
w[83930]={n="Deworming Solution",e="TWW",m=2214,t="World Quest"}
w[84429]={n="Construct Containment",e="TWW",m=2214,t="World Quest"}
w[84850]={n="Serpent's Wrath",e="TWW",m=2369,t="Elite World Quest"}
w[84851]={n="Tides of Greed",e="TWW",m=2369,t="Elite World Quest"}
w[84852]={n="Legacy of the Vrykul",e="TWW",m=2369,t="Elite World Quest"}
w[84929]={n="Lifeguard On Duty",e="TWW",m=2346,t="World Quest"}
w[84948]={n="Contract Work",e="TWW",m=2346,t="World Quest"}
w[84955]={n="Contraband Banned",e="TWW",m=2346,t="World Quest"}
w[84962]={n="Exigent Extermination",e="TWW",m=2371,t="World Quest"}
w[84971]={n="For Love of Grog",e="TWW",m=2346,t="World Quest"}
w[84994]={n="Evidence of Effect",e="TWW",m=2346,t="World Quest"}
w[84995]={n="Pictures! Pictures of Undermine!",e="TWW",m=2346,t="World Quest"}
w[85113]={n="Special Assignment: Storm's a Brewin",e="TWW",m=2369,t="Capstone World Quest"}
w[85263]={n="Boomball",e="TWW",m=2346,t="World Quest"}
w[85268]={n="Pow-Arr Wash Simulator",e="TWW",m=2346,t="World Quest"}
w[85269]={n="Boom Balloon",e="TWW",m=2346,t="World Quest"}
w[85270]={n="Cold as Ice",e="TWW",m=2346,t="World Quest"}
w[85390]={n="Sunrise Sudser",e="TWW",m=2346,t="World Quest"}
w[85396]={n="Heaps o' Scrap",e="TWW",m=2346,t="World Quest"}
w[85397]={n="What Plants Crave",e="TWW",m=2346,t="World Quest"}
w[85398]={n="Bomb Voyage!",e="TWW",m=2346,t="World Quest"}
w[85399]={n="Caddyshock",e="TWW",m=2346,t="World Quest"}
w[85400]={n="Reduce, Re-ooze, Recycle",e="TWW",m=2346,t="World Quest"}
w[85402]={n="In The Heights",e="TWW",m=2346,t="World Quest"}
w[85427]={n="Explosive Expiration",e="TWW",m=2346,t="World Quest"}
w[85428]={n="Code Violations",e="TWW",m=2346,t="World Quest"}
w[85460]={n="Ecological Succession",e="TWW",t="World Quest"}
w[85466]={n="Hob or Cold",e="TWW",m=2346,t="World Quest"}
w[85467]={n="Dumpster Fire",e="TWW",m=2346,t="World Quest"}
w[85472]={n="It's Free Reagents!",e="TWW",m=2346,t="World Quest"}
w[85473]={n="Extra! Extra!",e="TWW",m=2346,t="World Quest"}
w[85474]={n="Rat Pack Attack",e="TWW",m=2346,t="World Quest"}
w[85479]={n="Rock 'Em, Explode 'Em",e="TWW",m=2346,t="PvP World Quest"}
w[85487]={n="Special Assignment: Boom! Headshot!",e="TWW",m=2346,t="Capstone World Quest"}
w[85488]={n="Special Assignment: Security Detail",e="TWW",m=2346,t="Capstone World Quest"}
w[85497]={n="Blown a Gasket",e="TWW",m=2346,t="World Quest"}
w[85498]={n="Firework It",e="TWW",m=2346,t="World Quest"}
w[85499]={n="One Goblin's Trash",e="TWW",m=2346,t="World Quest"}
w[85500]={n="Hazardous Waste",e="TWW",m=2346,t="World Quest"}
w[85512]={n="Rooting Out Counterfeits",e="TWW",m=2346,t="World Quest"}
w[85513]={n="Underrider Grease",e="TWW",m=2346,t="World Quest"}
w[85514]={n="If They're Not Using It...",e="TWW",m=2346,t="World Quest"}
w[85515]={n="Free Samples!",e="TWW",m=2346,t="World Quest"}
w[85518]={n="Scalper Scum",e="TWW",m=2346,t="World Quest"}
w[85519]={n="Boom and Burst",e="TWW",m=2346,t="World Quest"}
w[85524]={n="Disarming the Darkfuse",e="TWW",m=2346,t="World Quest"}
w[85526]={n="Scum Bag",e="TWW",m=2346,t="World Quest"}
w[85527]={n="Buccaneer Bonzai",e="TWW",m=2346,t="World Quest"}
w[85528]={n="Recrewtment",e="TWW",m=2346,t="World Quest"}
w[85812]={n="Raid the Raiders",e="TWW",m=2371,t="World Quest"}
w[85822]={n="Making a Market",e="TWW",m=2371,t="World Quest"}
w[85834]={n="Endangered Specimens",e="TWW",m=2371,t="World Quest"}
w[85855]={n="Anything to Declare?",e="TWW",m=2371,t="World Quest"}
w[85863]={n="Phase Diving: Strange Storms",e="TWW",m=2371,t="World Quest"}
w[85864]={n="Phase Diving: Fractured Laacunite",e="TWW",m=2371,t="World Quest"}
w[86197]={n="Learn the Ropes or Walk the Plank",e="TWW",t="World Quest"}
w[86305]={n="Watch me Make these Bugs Expire",e="TWW",m=2371,t="World Quest"}
w[86367]={n="Grub Stompin'",e="TWW",m=2371,t="World Quest"}
w[86372]={n="Wasting the Wastelanders",e="TWW",m=2371,t="World Quest"}
w[86391]={n="Taking Back our Power",e="TWW",m=2371,t="World Quest"}
w[86395]={n="Stealing the Stolen",e="TWW",m=2371,t="World Quest"}
w[86409]={n="Stalking the Crags",e="TWW",m=2371,t="World Quest"}
w[86429]={n="Phase Diving: The Bound Unbound",e="TWW",m=2371,t="World Quest"}
w[86584]={n="Overwhelm Them with Mandatory Time Off",e="TWW",m=2371,t="World Quest"}
w[86610]={n="Nor Void of Night",e="TWW",m=2472,t="World Quest"}
w[86696]={n="Shadow Re-Disruption",e="TWW",m=2371,t="World Quest"}
w[86707]={n="The Shadowguard Resurgence",e="TWW",m=2371,t="World Quest"}
w[86709]={n="Mana Falling from the Skies",e="TWW",m=2371,t="World Quest"}
w[86800]={n="Swipe 'Em",e="TWW",m=2371,t="World Quest"}
w[86821]={n="Phase Diving: Unmoored and Unwell",e="TWW",m=2371,t="World Quest"}
w[86869]={n="Phase Diving: Shan'dorah Saboteurs",e="TWW",m=2371,t="World Quest"}
w[86872]={n="Phase Diving: Experimental Extermination",e="TWW",m=2371,t="World Quest"}
w[86938]={n="Void Perforations",e="TWW",m=241,t="World Quest"}
w[86939]={n="Twilight's Wedge",e="TWW",m=241,t="World Quest"}
w[86941]={n="Elemental Infusion",e="TWW",m=241,t="World Quest"}
w[86943]={n="Drilling Down",e="TWW",m=2346,t="Battle Pet World Quest"}
w[86945]={n="Shadowed Supplies",e="TWW",m=241,t="World Quest"}
w[86947]={n="Tiny, Expensive, and Deadly",e="TWW",m=2346,t="Battle Pet World Quest"}
w[86948]={n="Twilight Bonds",e="TWW",m=241,t="World Quest"}
w[86949]={n="Loyal Crewmates",e="TWW",m=2346,t="Battle Pet World Quest"}
w[86951]={n="Ascended, Descending",e="TWW",m=241,t="World Quest"}
w[86952]={n="Approach the Croach",e="TWW",m=2346,t="Battle Pet World Quest"}
w[86957]={n="Drakgor's Revenge",e="TWW",m=241,t="World Quest"}
w[86959]={n="Bloodeye Prisoners",e="TWW",m=241,t="World Quest"}
w[87759]={n="Encapsulated Void",e="MIDNIGHT",m=2444,t="PvP World Quest"}
w[88679]={n="Encountering the Unexpected",e="MIDNIGHT",m=2444,t="PvP World Quest"}
w[88774]={n="Out of Energy",e="TWW",m=2371,t="World Quest"}
w[88818]={n="Void Sweeper",e="TWW",m=2371,t="World Quest"}
w[88902]={n="Phase Diving: Restless Souls",e="TWW",m=2371,t="World Quest"}
w[88904]={n="Phase Diving: It Could Be Anything",e="TWW",m=2371,t="World Quest"}
w[88992]={n="Envisioned Mastery",e="MIDNIGHT",m=2444,t="PvP World Quest"}
w[89241]={n="Up and Up",e="TWW",m=2371,t="PvP World Quest"}
w[89267]={n="Mysterious Entity",e="MIDNIGHT",m=2444,t="PvP World Quest"}
w[89274]={n="The Ugly Mirror",e="TWW",m=2371,t="World Quest"}
w[89288]={n="Phase Diving: Riftbreaker Tza'akir",e="TWW",m=2371,t="World Quest"}
w[89291]={n="Phase Diving: Oath-Breaker Desamirah",e="TWW",m=2371,t="World Quest"}
w[89293]={n="Special Assignment: Overshadowed",e="TWW",m=2371,t="Capstone World Quest"}
w[89294]={n="Special Assignment: Aligned Views",e="TWW",m=2371,t="Capstone World Quest"}
w[89347]={n="Overcoming the Unknown: Rage-Riddled Drifter",e="MIDNIGHT",m=2444,t="PvP Elite World Quest"}
w[89377]={n="Undercover Hunt",e="MIDNIGHT",m=2444,t="PvP World Quest"}
w[90962]={n="Stormarion Assault",e="MIDNIGHT",m=2405,t="Rare Elite World Quest"}
w[91207]={n="Prey: Apex Predator",e="MIDNIGHT",m=2405,t="Prey World Quest"}
w[91390]={n="Special Assignment: What Remains of a Temple Broken",e="MIDNIGHT",m=2437,t="Capstone World Quest"}
w[91419]={n="Elemental Dominance",e="MIDNIGHT",m=2444,t="PvP World Quest"}
w[91458]={n="Prey: Endurance Hunter",e="MIDNIGHT",m=2405,t="Prey World Quest"}
w[91490]={n="Dousing Teldrassil",e="MIDNIGHT",m=2413,t="World Quest"}
w[91523]={n="Prey: Concealed Threat",e="MIDNIGHT",m=2405,t="Prey World Quest"}
w[91555]={n="Defenders of the Vale",e="MIDNIGHT",m=2413,t="World Quest"}
w[91582]={n="Pruning the Lattice",e="MIDNIGHT",m=2413,t="World Quest"}
w[91590]={n="Prey: Concealed Threat",e="MIDNIGHT",m=2395,t="Prey World Quest"}
w[91591]={n="Prey: Concealed Threat",e="MIDNIGHT",m=2437,t="Prey World Quest"}
w[91592]={n="Prey: Concealed Threat",e="MIDNIGHT",m=2413,t="Prey World Quest"}
w[91594]={n="Prey: Endurance Hunter",e="MIDNIGHT",m=2395,t="Prey World Quest"}
w[91595]={n="Prey: Endurance Hunter",e="MIDNIGHT",m=2437,t="Prey World Quest"}
w[91596]={n="Prey: Endurance Hunter",e="MIDNIGHT",m=2413,t="Prey World Quest"}
w[91601]={n="Prey: Apex Predator",e="MIDNIGHT",m=2395,t="Prey World Quest"}
w[91602]={n="Prey: Apex Predator",e="MIDNIGHT",m=2437,t="Prey World Quest"}
w[91604]={n="Prey: Apex Predator",e="MIDNIGHT",m=2413,t="Prey World Quest"}
w[91759]={n="Don't Bring That Here",e="TWW",m=241,t="World Quest"}
w[91776]={n="Wildhammer and Free",e="TWW",m=241,t="World Quest"}
w[91778]={n="Too Deep and Too Dark",e="TWW",m=241,t="World Quest"}
w[91779]={n="Combat Training for Cultists",e="TWW",m=241,t="World Quest"}
w[91785]={n="Ensporcelled",e="MIDNIGHT",m=2413,t="World Quest"}
w[91789]={n="Apocron",e="LEGION",m=646,t="Legionfall World Quest"}
w[91790]={n="Brutallus",e="LEGION",m=646,t="Legionfall World Quest"}
w[91791]={n="Malificus",e="LEGION",m=646,t="Legionfall World Quest"}
w[91792]={n="Si'vash",e="LEGION",m=646,t="Legionfall World Quest"}
w[91796]={n="Special Assignment: Ours Once More!",e="MIDNIGHT",m=2536,t="Capstone World Quest"}
w[91798]={n="Fish Of The Day",e="MIDNIGHT",m=2437,t="World Quest"}
w[91799]={n="Trial of Flight",e="MIDNIGHT",m=2437,t="World Quest"}
w[91800]={n="Heirlooming Danger",e="MIDNIGHT",m=2437,t="World Quest"}
w[91801]={n="Twilight's Bane",e="MIDNIGHT",m=2437,t="World Quest"}
w[91802]={n="The Best Bites are Bog Bugs",e="MIDNIGHT",m=2437,t="World Quest"}
w[91803]={n="Marsh Menace",e="MIDNIGHT",m=2437,t="World Quest"}
w[91804]={n="Fish for the Fire",e="MIDNIGHT",m=2437,t="World Quest"}
w[91805]={n="Boughs in the Burrows",e="MIDNIGHT",m=2437,t="World Quest"}
w[91806]={n="Big Game Hunting",e="MIDNIGHT",m=2437,t="World Quest"}
w[91807]={n="Breaking Branches",e="MIDNIGHT",m=2437,t="World Quest"}
w[91808]={n="Resource Recovery",e="MIDNIGHT",m=2437,t="World Quest"}
w[91809]={n="Sea Speed",e="MIDNIGHT",m=2437,t="World Quest"}
w[91810]={n="Blistereel Boar Buffet",e="MIDNIGHT",m=2437,t="World Quest"}
w[91811]={n="A Scorched Mirror",e="MIDNIGHT",m=2437,t="World Quest"}
w[91927]={n="Ooze Booting",e="MIDNIGHT",m=2413,t="World Quest"}
w[91937]={n="Portraits in the Vale",e="MIDNIGHT",m=2413,t="World Quest"}
w[91981]={n="To Poison and to Heal",e="MIDNIGHT",m=2413,t="World Quest"}
w[92018]={n="x.x Testing (YGR)",e="TWW",t="Capstone World Quest"}
w[92062]={n="Tending the Roots",e="MIDNIGHT",m=2413,t="World Quest"}
w[92063]={n="Special Assignment: A Hunter's Regret",e="MIDNIGHT",m=2413,t="Capstone World Quest"}
w[92085]={n="Claw Enforcement",e="MIDNIGHT",m=2413,t="World Quest"}
w[92086]={n="A Taste of Accord",e="MIDNIGHT",m=2413,t="World Quest"}
w[92105]={n="Papers, Please!",e="MIDNIGHT",m=2393,t="World Quest"}
w[92119]={n="Bitterbloom Burn Down",e="MIDNIGHT",m=2413,t="World Quest"}
w[92120]={n="To Understand Magic",e="MIDNIGHT",m=2393,t="World Quest"}
w[92121]={n="The Great Outdoors",e="MIDNIGHT",m=2395,t="World Quest"}
w[92122]={n="Beneath the Sunsails",e="MIDNIGHT",m=2395,t="World Quest"}
w[92138]={n="Mobilize! Enlist! Recruit!",e="MIDNIGHT",m=2395,t="World Quest"}
w[92139]={n="Special Assignment: Shade and Claw",e="MIDNIGHT",m=2395,t="Capstone World Quest"}
w[92140]={n="Uprooting Efforts",e="MIDNIGHT",m=2395,t="World Quest"}
w[92141]={n="Classic Threats",e="MIDNIGHT",m=2395,t="World Quest"}
w[92143]={n="Arcane Reallocation",e="MIDNIGHT",m=2395,t="World Quest"}
w[92144]={n="No Squatters",e="MIDNIGHT",m=2395,t="World Quest"}
w[92145]={n="Special Assignment: The Grand Magister's Drink",e="MIDNIGHT",m=2395,t="Capstone World Quest"}
w[92146]={n="Containment Zone",e="MIDNIGHT",m=2395,t="World Quest"}
w[92149]={n="Death to Twilight",e="MIDNIGHT",m=2395,t="Elite World Quest"}
w[92150]={n="A Breeze Through Fairbreeze",e="MIDNIGHT",m=2395,t="World Quest"}
w[92152]={n="Battling the Bloom",e="MIDNIGHT",m=2395,t="World Quest"}
w[92153]={n="The Moon at Twilight",e="MIDNIGHT",m=2395,t="World Quest"}
w[92160]={n="Hatchling Havoc",e="MIDNIGHT",m=2395,t="World Quest"}
w[92162]={n="A Refined Potadpalate",e="MIDNIGHT",m=2413,t="World Quest"}
w[92184]={n="Potadpole Wrangling",e="MIDNIGHT",m=2413,t="World Quest"}
w[92195]={n="Come On Down",e="MIDNIGHT",m=2395,t="World Quest"}
w[92364]={n="Sun Support",e="MIDNIGHT",m=2395,t="World Quest"}
w[92546]={n="Encroaching Predators",e="MIDNIGHT",m=2405,t="World Quest"}
w[92549]={n="Void From Above",e="MIDNIGHT",m=2405,t="World Quest"}
w[92566]={n="Armies of Darkness",e="MIDNIGHT",m=2444,t="World Quest"}
w[92571]={n="Armies of Darkness",e="MIDNIGHT",m=2444,t="World Quest"}
w[92576]={n="Dominating The Domanaar",e="MIDNIGHT",m=2444,t="World Quest"}
w[92582]={n="Apply to Roots",e="MIDNIGHT",m=2413,t="World Quest"}
w[92583]={n="Fungicide",e="MIDNIGHT",m=2413,t="World Quest"}
w[92731]={n="Artificing Aggression",e="MIDNIGHT",m=2405,t="World Quest"}
w[92746]={n="The Twist of the Stormfields",e="MIDNIGHT",m=2405,t="World Quest"}
w[93013]={n="Special Assignment: Push Back the Light",e="MIDNIGHT",m=2413,t="Capstone World Quest"}
w[93046]={n="Nestled Belongings",e="MIDNIGHT",m=2413,t="World Quest"}
w[93053]={n="Cleaning the Den",e="MIDNIGHT",m=2413,t="World Quest"}
w[93071]={n="Rotten to the Core",e="MIDNIGHT",m=2413,t="World Quest"}
w[93244]={n="Special Assignment: Agents of the Shield",e="MIDNIGHT",m=2405,t="Capstone World Quest"}
w[93397]={n="Gnawing Hunger",e="MIDNIGHT",m=2405,t="World Quest"}
w[93438]={n="Special Assignment: Precision Excision",e="MIDNIGHT",m=2405,t="Capstone World Quest"}
w[93507]={n="Disrupting the Void",e="MIDNIGHT",m=2405,t="World Quest"}
w[93517]={n="Otherworldly Intelligence",e="MIDNIGHT",m=2405,t="World Quest"}
w[93524]={n="Trench Run",e="MIDNIGHT",m=2405,t="World Quest"}
w[93571]={n="Dispersing Shadows",e="MIDNIGHT",m=2405,t="World Quest"}
w[93573]={n="Deciphering Darkness",e="MIDNIGHT",m=2405,t="World Quest"}
w[93577]={n="Captured Instinct",e="MIDNIGHT",m=2405,t="World Quest"}
w[93578]={n="Where Shadows Gather",e="MIDNIGHT",m=2444,t="World Quest"}
w[93579]={n="Path of Purgation",e="MIDNIGHT",m=2405,t="World Quest"}
w[93904]={n="Defying Gravity",e="MIDNIGHT",m=2527,t="World Quest"}
w[93905]={n="Ongoing Stoppage",e="MIDNIGHT",m=2405,t="World Quest"}
w[94425]={n="Bleed the Spire",e="MIDNIGHT",m=2405,t="Elite World Quest"}
w[94581]={n="Stand Your Ground",e="MIDNIGHT",m=2405,t="World Quest"}
w[95392]={n="One Friend is Plenty",e="MIDNIGHT",m=2599,t="World Quest"}
w[95393]={n="Caver Saviour",e="MIDNIGHT",m=2599,t="World Quest"}
w[95394]={n="Aberration Liberation",e="MIDNIGHT",m=2599,t="World Quest"}
w[95395]={n="Until it is Done",e="MIDNIGHT",m=2599,t="World Quest"}
w[95396]={n="Tainted Ritual",e="MIDNIGHT",m=2599,t="World Quest"}
w[95397]={n="Cold Reception",e="MIDNIGHT",m=2599,t="World Quest"}
w[95398]={n="Dissent and Divide",e="MIDNIGHT",m=2599,t="World Quest"}
w[95399]={n="Shadowy Strategies",e="MIDNIGHT",m=2599,t="World Quest"}
w[95400]={n="Solid Cold",e="MIDNIGHT",m=2599,t="World Quest"}
w[95401]={n="Junction Dysfunction",e="MIDNIGHT",m=2599,t="World Quest"}
w[95402]={n="Ignoble Gas Collector",e="MIDNIGHT",m=2599,t="World Quest"}
w[95403]={n="A Lingering Echo",e="MIDNIGHT",m=2599,t="World Quest"}
w[95404]={n="Freeze Range Eggs",e="MIDNIGHT",m=2599,t="World Quest"}
w[95575]={n="Forest Mana Spores",e="MIDNIGHT",m=2600,t="World Quest"}
w[96000]={n="Skiff Joyride",e="MIDNIGHT",m=2600,t="World Quest"}
w[96210]={n="Scrubbing Troubles",e="MIDNIGHT",m=2600,t="World Quest"}
w[96217]={n="Sporadic Power Drain",e="MIDNIGHT",m=2600,t="World Quest"}
w[96268]={n="Marsh Mana Spores",e="MIDNIGHT",m=2600,t="World Quest"}
w[96272]={n="Mashing Mushroom Mana Machines",e="MIDNIGHT",m=2600,t="World Quest"}
w[96293]={n="Mush-Vroom!",e="MIDNIGHT",m=2600,t="World Quest"}
w[96400]={n="Lingering Corruption",e="MIDNIGHT",m=2599,t="World Quest"}
w[96432]={n="Power Overload",e="MIDNIGHT",m=2600,t="World Quest"}
w[96547]={n="Weaken Their Forces",e="MIDNIGHT",m=2600,t="World Quest"}
w[96557]={n="Flying Debris",e="MIDNIGHT",m=2600,t="World Quest"}
w[96600]={n="Crypt Culling",e="MIDNIGHT",m=2600,t="World Quest"}
w[96623]={n="Capsized Compost",e="MIDNIGHT",m=2600,t="World Quest"}
