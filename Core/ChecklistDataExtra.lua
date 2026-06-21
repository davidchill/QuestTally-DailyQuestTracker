-- ChecklistDataExtra.lua  (HAND-MAINTAINED -- safe to edit directly)
-- Dailies the wiki master list was missing, originally found via a Blizzard Game
-- Data API completeness sweep run by the now-retired _generator/ toolchain. The
-- toolchain is no longer run, so edit this file in place; new fills/fixes are
-- verified against the in-game Blizzard API and cross-referenced on Wowhead.
-- Appends to DT.ChecklistData.entries (loads AFTER ChecklistData.lua).
-- expansion is ZONE-derived (authoritative; quest-ID bands lie for reissued content).
-- type="Race" + category="Skyriding Race" marks dragonriding race courses.
local _, DT = ...
DT.ChecklistData = DT.ChecklistData or {}
DT.ChecklistData.entries = DT.ChecklistData.entries or {}
local e = DT.ChecklistData.entries
e[#e+1]={id=55742,rawTitle="Bundle of Corroded Parts",expansion="BFA",type="Faction",side="Both",category="Mechagon",zoneName="Mechagon",src="api"}
e[#e+1]={id=55213,rawTitle="Energy Cells for Everyone",expansion="BFA",type="Faction",side="Both",category="Mechagon",zoneName="Mechagon",src="api"}
e[#e+1]={id=56746,rawTitle="Our Direct Line",expansion="BFA",type="Faction",side="Both",category="Mechagon",zoneName="Mechagon",src="api"}
e[#e+1]={id=50801,rawTitle="A Nose for Ptrouble",expansion="BFA",type="Faction",side="Horde",category="Zuldazar",zoneName="Zuldazar",src="api"}
e[#e+1]={id=50930,rawTitle="Falling With Style",expansion="BFA",type="Faction",side="Horde",category="Zuldazar",zoneName="Zuldazar",src="api"}
e[#e+1]={id=51146,rawTitle="Kua'fon's Day Off",expansion="BFA",type="Faction",side="Horde",category="Zuldazar",zoneName="Zuldazar",src="api"}
e[#e+1]={id=50842,rawTitle="Mast Effect",expansion="BFA",type="Faction",side="Horde",category="Zuldazar",zoneName="Zuldazar",src="api"}
e[#e+1]={id=52317,rawTitle="No Ptake, Only Throw",expansion="BFA",type="Faction",side="Horde",category="Zuldazar",zoneName="Zuldazar",src="api"}
e[#e+1]={id=50798,rawTitle="Out on a Limb",expansion="BFA",type="Faction",side="Horde",category="Zuldazar",zoneName="Zuldazar",src="api"}
e[#e+1]={id=50791,rawTitle="Skree...",expansion="BFA",type="Faction",side="Horde",category="Zuldazar",zoneName="Zuldazar",src="api"}
e[#e+1]={id=50796,rawTitle="SKREEEEE!",expansion="BFA",type="Faction",side="Horde",category="Zuldazar",zoneName="Zuldazar",src="api"}
e[#e+1]={id=25671,rawTitle="Thinning the Horde",expansion="CATA",type="Faction",side="Both",category="Stonetalon Mountains",zoneName="Stonetalon Mountains",src="api"}
e[#e+1]={id=27970,rawTitle="Captain P. Harris",expansion="CATA",type="Faction",side="Both",category="Tol Barad Peninsula",zoneName="Tol Barad Peninsula",src="api"}
e[#e+1]={id=28046,rawTitle="Finish The Job",expansion="CATA",type="Faction",side="Both",category="Tol Barad Peninsula",zoneName="Tol Barad Peninsula",src="api"}
e[#e+1]={id=28063,rawTitle="Leave No Weapon Behind",expansion="CATA",type="Faction",side="Both",category="Tol Barad Peninsula",zoneName="Tol Barad Peninsula",src="api"}
e[#e+1]={id=28130,rawTitle="Not The Friendliest Town",expansion="CATA",type="Faction",side="Both",category="Tol Barad Peninsula",zoneName="Tol Barad Peninsula",src="api"}
e[#e+1]={id=27966,rawTitle="Salvaging the Remains",expansion="CATA",type="Faction",side="Both",category="Tol Barad Peninsula",zoneName="Tol Barad Peninsula",src="api"}
e[#e+1]={id=28137,rawTitle="Teach A Man To Fish.... Or Steal",expansion="CATA",type="Faction",side="Both",category="Tol Barad Peninsula",zoneName="Tol Barad Peninsula",src="api"}
e[#e+1]={id=27944,rawTitle="Thinning the Brood",expansion="CATA",type="Faction",side="Both",category="Tol Barad Peninsula",zoneName="Tol Barad Peninsula",src="api"}
e[#e+1]={id=27973,rawTitle="Watch Out For Splinters!",expansion="CATA",type="Faction",side="Both",category="Tol Barad Peninsula",zoneName="Tol Barad Peninsula",src="api"}
e[#e+1]={id=28122,rawTitle="A Huge Problem",expansion="CATA",type="Faction",side="Both",category="Tol Barad",zoneName="Tol Barad",src="api"}
e[#e+1]={id=28117,rawTitle="Clearing the Depths",expansion="CATA",type="Faction",side="Both",category="Tol Barad",zoneName="Tol Barad",src="api"}
e[#e+1]={id=28186,rawTitle="Cursed Shackles",expansion="CATA",type="Faction",side="Both",category="Tol Barad",zoneName="Tol Barad",src="api"}
e[#e+1]={id=28165,rawTitle="D-Block",expansion="CATA",type="Faction",side="Both",category="Tol Barad",zoneName="Tol Barad",src="api"}
e[#e+1]={id=28232,rawTitle="Food From Below",expansion="CATA",type="Faction",side="Both",category="Tol Barad",zoneName="Tol Barad",src="api"}
e[#e+1]={id=28120,rawTitle="Learning From The Past",expansion="CATA",type="Faction",side="Both",category="Tol Barad",zoneName="Tol Barad",src="api"}
e[#e+1]={id=28188,rawTitle="Prison Revolt",expansion="CATA",type="Faction",side="Both",category="Tol Barad",zoneName="Tol Barad",src="api"}
e[#e+1]={id=28185,rawTitle="Svarnos",expansion="CATA",type="Faction",side="Both",category="Tol Barad",zoneName="Tol Barad",src="api"}
e[#e+1]={id=28162,rawTitle="Swamp Bait",expansion="CATA",type="Faction",side="Both",category="Tol Barad",zoneName="Tol Barad",src="api"}
e[#e+1]={id=28118,rawTitle="The Imprisoned Archmage",expansion="CATA",type="Faction",side="Both",category="Tol Barad",zoneName="Tol Barad",src="api"}
e[#e+1]={id=28223,rawTitle="The Warden",expansion="CATA",type="Faction",side="Both",category="Tol Barad",zoneName="Tol Barad",src="api"}
e[#e+1]={id=28873,rawTitle="Another Maw to Feed",expansion="CATA",type="Faction",side="Horde",category="Twilight Highlands",zoneName="Twilight Highlands",src="api"}
e[#e+1]={id=28864,rawTitle="Beer Run",expansion="CATA",type="Faction",side="Alliance",category="Twilight Highlands",zoneName="Twilight Highlands",src="api"}
e[#e+1]={id=28875,rawTitle="Bring Down the High Shaman",expansion="CATA",type="Faction",side="Horde",category="Twilight Highlands",zoneName="Twilight Highlands",src="api"}
e[#e+1]={id=28871,rawTitle="Crushing the Wildhammer",expansion="CATA",type="Faction",side="Horde",category="Twilight Highlands",zoneName="Twilight Highlands",src="api"}
e[#e+1]={id=28861,rawTitle="Fight Like a Wildhammer",expansion="CATA",type="Faction",side="Alliance",category="Twilight Highlands",zoneName="Twilight Highlands",src="api"}
e[#e+1]={id=28874,rawTitle="Hook 'em High",expansion="CATA",type="Faction",side="Horde",category="Twilight Highlands",zoneName="Twilight Highlands",src="api"}
e[#e+1]={id=28860,rawTitle="Keeping the Dragonmaw at Bay",expansion="CATA",type="Faction",side="Alliance",category="Twilight Highlands",zoneName="Twilight Highlands",src="api"}
e[#e+1]={id=28862,rawTitle="Never Leave a Dinner Behind",expansion="CATA",type="Faction",side="Alliance",category="Twilight Highlands",zoneName="Twilight Highlands",src="api"}
e[#e+1]={id=28872,rawTitle="Total War",expansion="CATA",type="Faction",side="Horde",category="Twilight Highlands",zoneName="Twilight Highlands",src="api"}
e[#e+1]={id=28863,rawTitle="Warlord Halthar is Back",expansion="CATA",type="Faction",side="Alliance",category="Twilight Highlands",zoneName="Twilight Highlands",src="api"}
e[#e+1]={id=77205,rawTitle="Blade's Edge Brawl",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Blade's Edge Mountains",src="api"}
e[#e+1]={id=77206,rawTitle="Blade's Edge Brawl - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Blade's Edge Mountains",src="api"}
e[#e+1]={id=77207,rawTitle="Blade's Edge Brawl - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Blade's Edge Mountains",src="api"}
e[#e+1]={id=76380,rawTitle="Deadwind Derby",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Deadwind Pass",src="api"}
e[#e+1]={id=76381,rawTitle="Deadwind Derby - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Deadwind Pass",src="api"}
e[#e+1]={id=76382,rawTitle="Deadwind Derby - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Deadwind Pass",src="api"}
e[#e+1]={id=76445,rawTitle="Ironforge Interceptor",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Dun Morogh",src="api"}
e[#e+1]={id=76446,rawTitle="Ironforge Interceptor - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Dun Morogh",src="api"}
e[#e+1]={id=76447,rawTitle="Ironforge Interceptor - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Dun Morogh",src="api"}
e[#e+1]={id=75385,rawTitle="Durotar Tour",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Durotar",src="api"}
e[#e+1]={id=75386,rawTitle="Durotar Tour - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Durotar",src="api"}
e[#e+1]={id=76047,rawTitle="Durotar Tour - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Durotar",src="api"}
e[#e+1]={id=75387,rawTitle="Durotar Tour - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Durotar",src="api"}
e[#e+1]={id=76048,rawTitle="Durotar Tour - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Durotar",src="api"}
e[#e+1]={id=76510,rawTitle="Plaguelands Plunge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Eastern Plaguelands",src="api"}
e[#e+1]={id=76512,rawTitle="Plaguelands Plunge - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Eastern Plaguelands",src="api"}
e[#e+1]={id=76513,rawTitle="Plaguelands Plunge - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Eastern Plaguelands",src="api"}
e[#e+1]={id=76397,rawTitle="Elwynn Forest Flash",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Elwynn Forest",src="api"}
e[#e+1]={id=76399,rawTitle="Elwynn Forest Flash - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Elwynn Forest",src="api"}
e[#e+1]={id=76400,rawTitle="Elwynn Forest Flash - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Elwynn Forest",src="api"}
e[#e+1]={id=77983,rawTitle="Smoldering Sprint",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Emerald Dream",src="api"}
e[#e+1]={id=77984,rawTitle="Smoldering Sprint - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Emerald Dream",src="api"}
e[#e+1]={id=77986,rawTitle="Smoldering Sprint - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Emerald Dream",src="api"}
e[#e+1]={id=77985,rawTitle="Smoldering Sprint - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Emerald Dream",src="api"}
e[#e+1]={id=77987,rawTitle="Smoldering Sprint - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Emerald Dream",src="api"}
e[#e+1]={id=77996,rawTitle="Viridescent Venture",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Emerald Dream",src="api"}
e[#e+1]={id=77997,rawTitle="Viridescent Venture - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Emerald Dream",src="api"}
e[#e+1]={id=77999,rawTitle="Viridescent Venture - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Emerald Dream",src="api"}
e[#e+1]={id=77998,rawTitle="Viridescent Venture - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Emerald Dream",src="api"}
e[#e+1]={id=77841,rawTitle="Ysera Invitational",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Emerald Dream",src="api"}
e[#e+1]={id=77842,rawTitle="Ysera Invitational - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Emerald Dream",src="api"}
e[#e+1]={id=77844,rawTitle="Ysera Invitational - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Emerald Dream",src="api"}
e[#e+1]={id=77843,rawTitle="Ysera Invitational - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Emerald Dream",src="api"}
e[#e+1]={id=77845,rawTitle="Ysera Invitational - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Emerald Dream",src="api"}
e[#e+1]={id=77102,rawTitle="Hellfire Hustle",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Hellfire Peninsula",src="api"}
e[#e+1]={id=77103,rawTitle="Hellfire Hustle - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Hellfire Peninsula",src="api"}
e[#e+1]={id=77104,rawTitle="Hellfire Hustle - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Hellfire Peninsula",src="api"}
e[#e+1]={id=77260,rawTitle="Razorthorn Rise Rush",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Hellfire Peninsula",src="api"}
e[#e+1]={id=77261,rawTitle="Razorthorn Rise Rush - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Hellfire Peninsula",src="api"}
e[#e+1]={id=77262,rawTitle="Razorthorn Rise Rush - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Hellfire Peninsula",src="api"}
e[#e+1]={id=75330,rawTitle="Hyjal Hotfoot",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Mount Hyjal",src="api"}
e[#e+1]={id=75331,rawTitle="Hyjal Hotfoot - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Mount Hyjal",src="api"}
e[#e+1]={id=76041,rawTitle="Hyjal Hotfoot - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Mount Hyjal",src="api"}
e[#e+1]={id=75332,rawTitle="Hyjal Hotfoot - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Mount Hyjal",src="api"}
e[#e+1]={id=76042,rawTitle="Hyjal Hotfoot - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Mount Hyjal",src="api"}
e[#e+1]={id=75317,rawTitle="Nordrassil Spiral",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Mount Hyjal",src="api"}
e[#e+1]={id=75318,rawTitle="Nordrassil Spiral - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Mount Hyjal",src="api"}
e[#e+1]={id=76037,rawTitle="Nordrassil Spiral - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Mount Hyjal",src="api"}
e[#e+1]={id=75319,rawTitle="Nordrassil Spiral - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Mount Hyjal",src="api"}
e[#e+1]={id=76040,rawTitle="Nordrassil Spiral - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Mount Hyjal",src="api"}
e[#e+1]={id=77398,rawTitle="Eco-Dome Excursion",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Netherstorm",src="api"}
e[#e+1]={id=77399,rawTitle="Eco-Dome Excursion - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Netherstorm",src="api"}
e[#e+1]={id=77400,rawTitle="Eco-Dome Excursion - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Netherstorm",src="api"}
e[#e+1]={id=77278,rawTitle="Tempest Keep Sweep",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Netherstorm",src="api"}
e[#e+1]={id=77279,rawTitle="Tempest Keep Sweep - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Netherstorm",src="api"}
e[#e+1]={id=77280,rawTitle="Tempest Keep Sweep - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Netherstorm",src="api"}
e[#e+1]={id=67039,rawTitle="An Amazing Journey",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Ohn'ahran Plains",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=65798,rawTitle="An Opportunistic Approach",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Ohn'ahran Plains",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=70701,rawTitle="Bakar Dream of Lost Argali",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Ohn'ahran Plains",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=70279,rawTitle="Blood of Dragons",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Ohn'ahran Plains",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=66698,rawTitle="Counting Argali",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Ohn'ahran Plains",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=67222,rawTitle="Darkened Clouds",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Ohn'ahran Plains",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=66711,rawTitle="Delicacy in the Dark",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Ohn'ahran Plains",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=70299,rawTitle="Draconic Defensive",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Ohn'ahran Plains",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=71241,rawTitle="Duck, Duck, Trap",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Ohn'ahran Plains",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=75799,rawTitle="Emerald Garden Ascent - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=75800,rawTitle="Emerald Garden Ascent - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=66885,rawTitle="Emerald Gardens Ascent",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=66886,rawTitle="Emerald Gardens Ascent - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=72805,rawTitle="Emerald Gardens Ascent - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=66877,rawTitle="Fen Flythrough",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=66878,rawTitle="Fen Flythrough - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=75795,rawTitle="Fen Flythrough - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=72802,rawTitle="Fen Flythrough - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=75796,rawTitle="Fen Flythrough - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=77785,rawTitle="Fen Flythrough - Storm Gryphon",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Ohn'ahran Plains",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=70990,rawTitle="If There's Wool There's a Way",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Ohn'ahran Plains",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=66921,rawTitle="Maruukai Dash",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=75801,rawTitle="Maruukai Dash - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=66933,rawTitle="Mirror of Sky Dash",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=75802,rawTitle="Mirror of Sky Dash - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=67034,rawTitle="Of Wind and Water",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Ohn'ahran Plains",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=70526,rawTitle="Ohn'ahran Plains Rally",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Ohn'ahran Plains",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=66880,rawTitle="Ravine River Run",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=66881,rawTitle="Ravine River Run - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=75797,rawTitle="Ravine River Run - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=72803,rawTitle="Ravine River Run - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=75798,rawTitle="Ravine River Run - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=70710,rawTitle="River Rapids Route",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=70711,rawTitle="River Rapids Route - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=75803,rawTitle="River Rapids Route - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=72807,rawTitle="River Rapids Route - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=75804,rawTitle="River Rapids Route - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=70352,rawTitle="Scaling Ever Higher",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Ohn'ahran Plains",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=66835,rawTitle="Sundapple Copse Circuit",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=66836,rawTitle="Sundapple Copse Circuit - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=75793,rawTitle="Sundapple Copse Circuit - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=72801,rawTitle="Sundapple Copse Circuit - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=75794,rawTitle="Sundapple Copse Circuit - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=65792,rawTitle="Teeth for a Tooth",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Ohn'ahran Plains",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=65796,rawTitle="The Best Defense...",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Ohn'ahran Plains",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=65784,rawTitle="The Otter Side",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Ohn'ahran Plains",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=67605,rawTitle="Thundering Plains",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Ohn'ahran Plains",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=70210,rawTitle="Tradition Not Forgotten",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Ohn'ahran Plains",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=65789,rawTitle="Where Rivers Sleep",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Ohn'ahran Plains",zoneName="Ohn'ahran Plains",src="api"}
e[#e+1]={id=76536,rawTitle="Redridge Rally",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Redridge Mountains",src="api"}
e[#e+1]={id=76537,rawTitle="Redridge Rally - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Redridge Mountains",src="api"}
e[#e+1]={id=76538,rawTitle="Redridge Rally - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Redridge Mountains",src="api"}
e[#e+1]={id=76357,rawTitle="Searing Slalom",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Searing Gorge",src="api"}
e[#e+1]={id=76358,rawTitle="Searing Slalom - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Searing Gorge",src="api"}
e[#e+1]={id=76359,rawTitle="Searing Slalom - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Searing Gorge",src="api"}
e[#e+1]={id=77322,rawTitle="Shattrath City Sashay",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Shattrath City",src="api"}
e[#e+1]={id=77323,rawTitle="Shattrath City Sashay - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Shattrath City",src="api"}
e[#e+1]={id=77324,rawTitle="Shattrath City Sashay - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Shattrath City",src="api"}
e[#e+1]={id=75394,rawTitle="Webwinder Weave",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Stonetalon Mountains",src="api"}
e[#e+1]={id=75395,rawTitle="Webwinder Weave - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Stonetalon Mountains",src="api"}
e[#e+1]={id=76049,rawTitle="Webwinder Weave - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Stonetalon Mountains",src="api"}
e[#e+1]={id=75396,rawTitle="Webwinder Weave - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Stonetalon Mountains",src="api"}
e[#e+1]={id=76050,rawTitle="Webwinder Weave - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Stonetalon Mountains",src="api"}
e[#e+1]={id=77264,rawTitle="Auchindoun Coaster",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Terokkar Forest",src="api"}
e[#e+1]={id=77265,rawTitle="Auchindoun Coaster - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Terokkar Forest",src="api"}
e[#e+1]={id=77266,rawTitle="Auchindoun Coaster - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Terokkar Forest",src="api"}
e[#e+1]={id=77645,rawTitle="Skettis Scramble",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Terokkar Forest",src="api"}
e[#e+1]={id=77646,rawTitle="Skettis Scramble - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Terokkar Forest",src="api"}
e[#e+1]={id=77647,rawTitle="Skettis Scramble - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Terokkar Forest",src="api"}
e[#e+1]={id=70059,rawTitle="Academy Ascent",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=70060,rawTitle="Academy Ascent - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=75826,rawTitle="Academy Ascent - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=72754,rawTitle="Academy Ascent - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=75827,rawTitle="Academy Ascent - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=70161,rawTitle="Caverns Criss-Cross",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=70163,rawTitle="Caverns Criss-Cross - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=75829,rawTitle="Caverns Criss-Cross - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=72750,rawTitle="Caverns Criss-Cross - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=75830,rawTitle="Caverns Criss-Cross - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=70051,rawTitle="Cliffside Circuit",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=70052,rawTitle="Cliffside Circuit - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=75824,rawTitle="Cliffside Circuit - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=72760,rawTitle="Cliffside Circuit - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=75825,rawTitle="Cliffside Circuit - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=67095,rawTitle="Flowing Forest Flight",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=67096,rawTitle="Flowing Forest Flight - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=75820,rawTitle="Flowing Forest Flight - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=72793,rawTitle="Flowing Forest Flight - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=75821,rawTitle="Flowing Forest Flight - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=70157,rawTitle="Garden Gallivant",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=70158,rawTitle="Garden Gallivant - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=75784,rawTitle="Garden Gallivant - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=72769,rawTitle="Garden Gallivant - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=75828,rawTitle="Garden Gallivant - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=72806,rawTitle="Pleasant Alpha",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Thaldraszus",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=73030,rawTitle="Southern Reach Route - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=66241,rawTitle="Thaldraszus Rally",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Thaldraszus",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=69957,rawTitle="Tyrhold Trial",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=69958,rawTitle="Tyrhold Trial - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=75822,rawTitle="Tyrhold Trial - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=72792,rawTitle="Tyrhold Trial - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=75823,rawTitle="Tyrhold Trial - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=77784,rawTitle="Tyrhold Trial - Storm Gryphon",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Thaldraszus",zoneName="Thaldraszus",src="api"}
e[#e+1]={id=67741,rawTitle="Archive Ambit",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Azure Span",src="api"}
e[#e+1]={id=67742,rawTitle="Archive Ambit - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Azure Span",src="api"}
e[#e+1]={id=75816,rawTitle="Archive Ambit - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Azure Span",src="api"}
e[#e+1]={id=72797,rawTitle="Archive Ambit - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Azure Span",src="api"}
e[#e+1]={id=75817,rawTitle="Archive Ambit - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Azure Span",src="api"}
e[#e+1]={id=70542,rawTitle="Azure Span Rally",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="The Azure Span",zoneName="The Azure Span",src="api"}
e[#e+1]={id=72799,rawTitle="Azure Span Slalom - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Azure Span",src="api"}
e[#e+1]={id=75808,rawTitle="Azure Span Slalom - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Azure Span",src="api"}
e[#e+1]={id=66946,rawTitle="Azure Span Sprint",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Azure Span",src="api"}
e[#e+1]={id=66947,rawTitle="Azure Span Sprint - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Azure Span",src="api"}
e[#e+1]={id=75805,rawTitle="Azure Span Sprint - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Azure Span",src="api"}
e[#e+1]={id=72796,rawTitle="Azure Span Sprint - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Azure Span",src="api"}
e[#e+1]={id=75806,rawTitle="Azure Span Sprint - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Azure Span",src="api"}
e[#e+1]={id=67565,rawTitle="Frostland Flyover",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Azure Span",src="api"}
e[#e+1]={id=67566,rawTitle="Frostland Flyover - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Azure Span",src="api"}
e[#e+1]={id=75813,rawTitle="Frostland Flyover - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Azure Span",src="api"}
e[#e+1]={id=72795,rawTitle="Frostland Flyover - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Azure Span",src="api"}
e[#e+1]={id=75815,rawTitle="Frostland Flyover - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Azure Span",src="api"}
e[#e+1]={id=67296,rawTitle="Iskaara Tour",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Azure Span",src="api"}
e[#e+1]={id=67297,rawTitle="Iskaara Tour - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Azure Span",src="api"}
e[#e+1]={id=75811,rawTitle="Iskaara Tour - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Azure Span",src="api"}
e[#e+1]={id=72800,rawTitle="Iskaara Tour - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Azure Span",src="api"}
e[#e+1]={id=75812,rawTitle="Iskaara Tour - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Azure Span",src="api"}
e[#e+1]={id=67031,rawTitle="Vakthros Ascent",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Azure Span",src="api"}
e[#e+1]={id=67032,rawTitle="Vakthros Ascent - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Azure Span",src="api"}
e[#e+1]={id=75809,rawTitle="Vakthros Ascent - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Azure Span",src="api"}
e[#e+1]={id=72794,rawTitle="Vakthros Ascent - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Azure Span",src="api"}
e[#e+1]={id=75810,rawTitle="Vakthros Ascent - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Azure Span",src="api"}
e[#e+1]={id=77786,rawTitle="Vakthros Ascent - Storm Gryphon",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="The Azure Span",zoneName="The Azure Span",src="api"}
e[#e+1]={id=73025,rawTitle="Aerie Chasm Cruise",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Forbidden Reach",src="api"}
e[#e+1]={id=73027,rawTitle="Aerie Chasm Cruise - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Forbidden Reach",src="api"}
e[#e+1]={id=75958,rawTitle="Aerie Chasm Cruise - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Forbidden Reach",src="api"}
e[#e+1]={id=73028,rawTitle="Aerie Chasm Cruise - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Forbidden Reach",src="api"}
e[#e+1]={id=75959,rawTitle="Aerie Chasm Cruise - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Forbidden Reach",src="api"}
e[#e+1]={id=73033,rawTitle="Caldera Coaster",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Forbidden Reach",src="api"}
e[#e+1]={id=73034,rawTitle="Caldera Coaster - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Forbidden Reach",src="api"}
e[#e+1]={id=75962,rawTitle="Caldera Coaster - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Forbidden Reach",src="api"}
e[#e+1]={id=73052,rawTitle="Caldera Coaster - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Forbidden Reach",src="api"}
e[#e+1]={id=75963,rawTitle="Caldera Coaster - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Forbidden Reach",src="api"}
e[#e+1]={id=73226,rawTitle="Dragonskull Shoal",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="The Forbidden Reach",zoneName="The Forbidden Reach",src="api"}
e[#e+1]={id=73061,rawTitle="Forbidden Reach Rush",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Forbidden Reach",src="api"}
e[#e+1]={id=73062,rawTitle="Forbidden Reach Rush - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Forbidden Reach",src="api"}
e[#e+1]={id=75964,rawTitle="Forbidden Reach Rush - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Forbidden Reach",src="api"}
e[#e+1]={id=73065,rawTitle="Forbidden Reach Rush - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Forbidden Reach",src="api"}
e[#e+1]={id=75965,rawTitle="Forbidden Reach Rush - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Forbidden Reach",src="api"}
e[#e+1]={id=73020,rawTitle="Morqut Ascent",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Forbidden Reach",src="api"}
e[#e+1]={id=73023,rawTitle="Morqut Ascent - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Forbidden Reach",src="api"}
e[#e+1]={id=75956,rawTitle="Morqut Ascent - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Forbidden Reach",src="api"}
e[#e+1]={id=73024,rawTitle="Morqut Ascent - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Forbidden Reach",src="api"}
e[#e+1]={id=75957,rawTitle="Morqut Ascent - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Forbidden Reach",src="api"}
e[#e+1]={id=73029,rawTitle="Southern Reach Route",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Forbidden Reach",src="api"}
e[#e+1]={id=75960,rawTitle="Southern Reach Route - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Forbidden Reach",src="api"}
e[#e+1]={id=73032,rawTitle="Southern Reach Route - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Forbidden Reach",src="api"}
e[#e+1]={id=75961,rawTitle="Southern Reach Route - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Forbidden Reach",src="api"}
e[#e+1]={id=73017,rawTitle="Stormsunder Crater Circuit",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Forbidden Reach",src="api"}
e[#e+1]={id=73018,rawTitle="Stormsunder Crater Circuit - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Forbidden Reach",src="api"}
e[#e+1]={id=75954,rawTitle="Stormsunder Crater Circuit - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Forbidden Reach",src="api"}
e[#e+1]={id=73019,rawTitle="Stormsunder Crater Circuit - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Forbidden Reach",src="api"}
e[#e+1]={id=75955,rawTitle="Stormsunder Crater Circuit - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="The Forbidden Reach",src="api"}
e[#e+1]={id=77787,rawTitle="Stormsunder Crater Circuit - Storm Gryphon",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="The Forbidden Reach",zoneName="The Forbidden Reach",src="api"}
e[#e+1]={id=76527,rawTitle="Krazzworks Klash",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Twilight Highlands",src="api"}
e[#e+1]={id=76528,rawTitle="Krazzworks Klash - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Twilight Highlands",src="api"}
e[#e+1]={id=76529,rawTitle="Krazzworks Klash - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Twilight Highlands",src="api"}
e[#e+1]={id=76364,rawTitle="Twilight Terror",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Twilight Highlands",src="api"}
e[#e+1]={id=76365,rawTitle="Twilight Terror - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Twilight Highlands",src="api"}
e[#e+1]={id=76366,rawTitle="Twilight Terror - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Twilight Highlands",src="api"}
e[#e+1]={id=77897,rawTitle="A Special Book",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Valdrakken",zoneName="Valdrakken",src="api"}
e[#e+1]={id=77957,rawTitle="A Treacherous Race",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Valdrakken",src="api"}
e[#e+1]={id=69937,rawTitle="Sylvan Succor",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Valdrakken",zoneName="Valdrakken",src="api"}
e[#e+1]={id=72384,rawTitle="Valdrakken Tour",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Valdrakken",src="api"}
e[#e+1]={id=75310,rawTitle="Winter Wander",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Winterspring",src="api"}
e[#e+1]={id=75311,rawTitle="Winter Wander - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Winterspring",src="api"}
e[#e+1]={id=76035,rawTitle="Winter Wander - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Winterspring",src="api"}
e[#e+1]={id=75312,rawTitle="Winter Wander - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Winterspring",src="api"}
e[#e+1]={id=76036,rawTitle="Winter Wander - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Winterspring",src="api"}
e[#e+1]={id=77169,rawTitle="Coilfang Caper",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zangarmarsh",src="api"}
e[#e+1]={id=77170,rawTitle="Coilfang Caper - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zangarmarsh",src="api"}
e[#e+1]={id=77171,rawTitle="Coilfang Caper - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zangarmarsh",src="api"}
e[#e+1]={id=74939,rawTitle="Brimstone Scramble",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zaralek Cavern",src="api"}
e[#e+1]={id=74943,rawTitle="Brimstone Scramble - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zaralek Cavern",src="api"}
e[#e+1]={id=75976,rawTitle="Brimstone Scramble - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zaralek Cavern",src="api"}
e[#e+1]={id=74944,rawTitle="Brimstone Scramble - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zaralek Cavern",src="api"}
e[#e+1]={id=75977,rawTitle="Brimstone Scramble - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zaralek Cavern",src="api"}
e[#e+1]={id=74889,rawTitle="Caldera Cruise",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zaralek Cavern",src="api"}
e[#e+1]={id=74899,rawTitle="Caldera Cruise - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zaralek Cavern",src="api"}
e[#e+1]={id=75974,rawTitle="Caldera Cruise - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zaralek Cavern",src="api"}
e[#e+1]={id=74925,rawTitle="Caldera Cruise - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zaralek Cavern",src="api"}
e[#e+1]={id=75975,rawTitle="Caldera Cruise - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zaralek Cavern",src="api"}
e[#e+1]={id=74839,rawTitle="Crystal Circuit",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zaralek Cavern",src="api"}
e[#e+1]={id=74842,rawTitle="Crystal Circuit - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zaralek Cavern",src="api"}
e[#e+1]={id=75972,rawTitle="Crystal Circuit - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zaralek Cavern",src="api"}
e[#e+1]={id=74882,rawTitle="Crystal Circuit - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zaralek Cavern",src="api"}
e[#e+1]={id=75973,rawTitle="Crystal Circuit - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zaralek Cavern",src="api"}
e[#e+1]={id=77793,rawTitle="Crystal Circuit - Storm Gryphon",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Zaralek Cavern",zoneName="Zaralek Cavern",src="api"}
e[#e+1]={id=74972,rawTitle="Loamm Roamm",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zaralek Cavern",src="api"}
e[#e+1]={id=74975,rawTitle="Loamm Roamm - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zaralek Cavern",src="api"}
e[#e+1]={id=75980,rawTitle="Loamm Roamm - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zaralek Cavern",src="api"}
e[#e+1]={id=74977,rawTitle="Loamm Roamm - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zaralek Cavern",src="api"}
e[#e+1]={id=75981,rawTitle="Loamm Roamm - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zaralek Cavern",src="api"}
e[#e+1]={id=74951,rawTitle="Shimmering Slalom",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zaralek Cavern",src="api"}
e[#e+1]={id=74954,rawTitle="Shimmering Slalom - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zaralek Cavern",src="api"}
e[#e+1]={id=75978,rawTitle="Shimmering Slalom - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zaralek Cavern",src="api"}
e[#e+1]={id=74956,rawTitle="Shimmering Slalom - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zaralek Cavern",src="api"}
e[#e+1]={id=75979,rawTitle="Shimmering Slalom - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zaralek Cavern",src="api"}
e[#e+1]={id=75035,rawTitle="Sulfur Sprint",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zaralek Cavern",src="api"}
e[#e+1]={id=75042,rawTitle="Sulfur Sprint - Advanced",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zaralek Cavern",src="api"}
e[#e+1]={id=75982,rawTitle="Sulfur Sprint - Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zaralek Cavern",src="api"}
e[#e+1]={id=75043,rawTitle="Sulfur Sprint - Reverse",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zaralek Cavern",src="api"}
e[#e+1]={id=75983,rawTitle="Sulfur Sprint - Reverse Challenge",expansion="DRAGONFLIGHT",type="Race",side="Both",category="Skyriding Race",zoneName="Zaralek Cavern",src="api"}
e[#e+1]={id=64852,rawTitle="Aeon Matrix",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Zereth Mortis",zoneName="Zereth Mortis",src="api"}
e[#e+1]={id=64860,rawTitle="Aetheric Lattice",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Zereth Mortis",zoneName="Zereth Mortis",src="api"}
e[#e+1]={id=65326,rawTitle="Circle of Strife",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Zereth Mortis",zoneName="Zereth Mortis",src="api"}
e[#e+1]={id=64592,rawTitle="Historic Protection",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Zereth Mortis",zoneName="Zereth Mortis",src="api"}
e[#e+1]={id=65325,rawTitle="Motes of Knowledge",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Zereth Mortis",zoneName="Zereth Mortis",src="api"}
e[#e+1]={id=65362,rawTitle="Not of the Body",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Zereth Mortis",zoneName="Zereth Mortis",src="api"}
e[#e+1]={id=65096,rawTitle="Your Death Or Mine",expansion="DRAGONFLIGHT",type="Faction",side="Both",category="Zereth Mortis",zoneName="Zereth Mortis",src="api"}
e[#e+1]={id=39651,rawTitle="Grumpus",expansion="LEGION",type="Faction",side="Both",category="Frostfire Ridge",zoneName="Frostfire Ridge",src="api"}
e[#e+1]={id=39649,rawTitle="Menacing Grumplings",expansion="LEGION",type="Faction",side="Both",category="Frostfire Ridge",zoneName="Frostfire Ridge",src="api"}
e[#e+1]={id=39668,rawTitle="What Horrible Presents!",expansion="LEGION",type="Faction",side="Both",category="Frostfire Ridge",zoneName="Frostfire Ridge",src="api"}
e[#e+1]={id=39648,rawTitle="Where Are the Children?",expansion="LEGION",type="Faction",side="Both",category="Frostfire Ridge",zoneName="Frostfire Ridge",src="api"}
e[#e+1]={id=39569,rawTitle="Breaking Their Fel Bonds",expansion="LEGION",type="Faction",side="Alliance",category="Tanaan Jungle",zoneName="Tanaan Jungle",src="api"}
e[#e+1]={id=39532,rawTitle="Bringing Down the Iron Horde",expansion="LEGION",type="Faction",side="Horde",category="Tanaan Jungle",zoneName="Tanaan Jungle",src="api"}
e[#e+1]={id=39519,rawTitle="Demonslayer of Tanaan",expansion="LEGION",type="Faction",side="Horde",category="Tanaan Jungle",zoneName="Tanaan Jungle",src="api"}
e[#e+1]={id=39529,rawTitle="Tooth and Claw",expansion="LEGION",type="Faction",side="Horde",category="Tanaan Jungle",zoneName="Tanaan Jungle",src="api"}
e[#e+1]={id=39433,rawTitle="Unseen Influence",expansion="LEGION",type="Faction",side="Both",category="Tanaan Jungle",zoneName="Tanaan Jungle",src="api"}
e[#e+1]={id=33756,rawTitle="Let's Keep Racing!",expansion="MOP",type="Race",side="Both",category="Skyriding Race",zoneName="Darkmoon Island",src="api"}
e[#e+1]={id=80443,rawTitle="Aid the Kirin Tor Offensive",expansion="MOP",type="Faction",side="Alliance",category="Isle of Thunder",zoneName="Isle of Thunder",src="api"}
e[#e+1]={id=80442,rawTitle="Aid the Sunreavers Onslaught",expansion="MOP",type="Faction",side="Horde",category="Isle of Thunder",zoneName="Isle of Thunder",src="api"}
e[#e+1]={id=32720,rawTitle="Choose Your Assignment",expansion="MOP",type="Faction",side="Horde",category="Isle of Thunder",zoneName="Isle of Thunder",src="api"}
e[#e+1]={id=32205,rawTitle="Gather Scout Reports",expansion="MOP",type="Faction",side="Horde",category="Isle of Thunder",zoneName="Isle of Thunder",src="api"}
e[#e+1]={id=80433,rawTitle="Aid the August Celestials",expansion="MOP",type="Faction",side="Both",category="Krasarang Wilds",zoneName="Krasarang Wilds",src="api"}
e[#e+1]={id=80438,rawTitle="Aid the Horde",expansion="MOP",type="Faction",side="Horde",category="Krasarang Wilds",zoneName="Krasarang Wilds",src="api"}
e[#e+1]={id=31378,rawTitle="Challenge At The Temple of the Red Crane",expansion="MOP",type="Faction",side="Alliance",category="Krasarang Wilds",zoneName="Krasarang Wilds",src="api"}
e[#e+1]={id=30677,rawTitle="Shuttle Service",expansion="MOP",type="Faction",side="Both",category="Krasarang Wilds",zoneName="Krasarang Wilds",src="api"}
e[#e+1]={id=31380,rawTitle="Trial At The Temple of the White Tiger",expansion="MOP",type="Faction",side="Alliance",category="Kun-Lai Summit",zoneName="Kun-Lai Summit",src="api"}
e[#e+1]={id=80441,rawTitle="Aid the Order of the Cloud Serpent",expansion="MOP",type="Faction",side="Both",category="The Jade Forest",zoneName="The Jade Forest",src="api"}
e[#e+1]={id=31376,rawTitle="Attack At The Temple of the Jade Serpent",expansion="MOP",type="Faction",side="Alliance",category="The Jade Forest",zoneName="The Jade Forest",src="api"}
e[#e+1]={id=30442,rawTitle="Blanche's Boomer Brew",expansion="MOP",type="Faction",side="Both",category="The Jade Forest",zoneName="The Jade Forest",src="api"}
e[#e+1]={id=33374,rawTitle="Path of the Mistwalker",expansion="MOP",type="Faction",side="Both",category="Timeless Isle",zoneName="Timeless Isle",src="api"}
e[#e+1]={id=33334,rawTitle="Strong Enough To Survive",expansion="MOP",type="Faction",side="Both",category="Timeless Isle",zoneName="Timeless Isle",src="api",freq="weekly"}
e[#e+1]={id=31044,rawTitle="Bronze Claws",expansion="MOP",type="Faction",side="Both",category="Townlong Steppes",zoneName="Townlong Steppes",src="api"}
e[#e+1]={id=31382,rawTitle="Defense At Niuzao Temple",expansion="MOP",type="Faction",side="Alliance",category="Townlong Steppes",zoneName="Townlong Steppes",src="api"}
e[#e+1]={id=31048,rawTitle="Grave Consequences",expansion="MOP",type="Faction",side="Both",category="Townlong Steppes",zoneName="Townlong Steppes",src="api"}
e[#e+1]={id=31045,rawTitle="Illusions Of The Past",expansion="MOP",type="Faction",side="Both",category="Townlong Steppes",zoneName="Townlong Steppes",src="api"}
e[#e+1]={id=31062,rawTitle="When The Dead Speak",expansion="MOP",type="Faction",side="Both",category="Townlong Steppes",zoneName="Townlong Steppes",src="api"}
e[#e+1]={id=30427,rawTitle="A Dish for Fish",expansion="MOP",type="Faction",side="Both",category="Valley of the Four Winds",zoneName="Valley of the Four Winds",src="api"}
e[#e+1]={id=30390,rawTitle="A Dish for Gina",expansion="MOP",type="Faction",side="Both",category="Valley of the Four Winds",zoneName="Valley of the Four Winds",src="api"}
e[#e+1]={id=30414,rawTitle="A Dish for Haohan",expansion="MOP",type="Faction",side="Both",category="Valley of the Four Winds",zoneName="Valley of the Four Winds",src="api"}
e[#e+1]={id=30439,rawTitle="A Dish for Jogu",expansion="MOP",type="Faction",side="Both",category="Valley of the Four Winds",zoneName="Valley of the Four Winds",src="api"}
e[#e+1]={id=30396,rawTitle="A Dish for Old Hillpaw",expansion="MOP",type="Faction",side="Both",category="Valley of the Four Winds",zoneName="Valley of the Four Winds",src="api"}
e[#e+1]={id=30408,rawTitle="A Dish for Sho",expansion="MOP",type="Faction",side="Both",category="Valley of the Four Winds",zoneName="Valley of the Four Winds",src="api"}
e[#e+1]={id=62606,rawTitle="A Blackthorn Blend",expansion="SHADOWLANDS",type="Faction",side="Both",category="Ardenweald",zoneName="Ardenweald",src="api"}
e[#e+1]={id=63964,rawTitle="Broker's Bounty: Grimtalon",expansion="SHADOWLANDS",type="Faction",side="Both",category="Korthia",zoneName="Korthia",src="api"}
e[#e+1]={id=63792,rawTitle="Broker's Bounty: Nocturnus the Unraveler",expansion="SHADOWLANDS",type="Faction",side="Both",category="Korthia",zoneName="Korthia",src="api"}
e[#e+1]={id=63791,rawTitle="Broker's Bounty: Valdinar the Curseborn",expansion="SHADOWLANDS",type="Faction",side="Both",category="Korthia",zoneName="Korthia",src="api"}
e[#e+1]={id=63787,rawTitle="Continued Efforts: Mauler's Outlook",expansion="SHADOWLANDS",type="Faction",side="Both",category="Korthia",zoneName="Korthia",src="api"}
e[#e+1]={id=63785,rawTitle="Continued Efforts: Seeker's Quorum",expansion="SHADOWLANDS",type="Faction",side="Both",category="Korthia",zoneName="Korthia",src="api"}
e[#e+1]={id=64080,rawTitle="Down to Earth",expansion="SHADOWLANDS",type="Faction",side="Both",category="Korthia",zoneName="Korthia",src="api"}
e[#e+1]={id=63784,rawTitle="Gold's No Object",expansion="SHADOWLANDS",type="Faction",side="Both",category="Korthia",zoneName="Korthia",src="api"}
e[#e+1]={id=63782,rawTitle="Mawsworn Rituals",expansion="SHADOWLANDS",type="Faction",side="Both",category="Korthia",zoneName="Korthia",src="api"}
e[#e+1]={id=63989,rawTitle="Oozing with Character",expansion="SHADOWLANDS",type="Faction",side="Both",category="Korthia",zoneName="Korthia",src="api"}
e[#e+1]={id=64194,rawTitle="War Prototype",expansion="SHADOWLANDS",type="Faction",side="Both",category="Korthia",zoneName="Korthia",src="api"}
e[#e+1]={id=60283,rawTitle="Specter Of War: Visectus",expansion="SHADOWLANDS",type="Faction",side="Both",category="Maldraxxus",zoneName="Maldraxxus",src="api"}
e[#e+1]={id=11513,rawTitle="Intercepting the Mana Cells",expansion="TBC",type="Faction",side="Both",category="Shattered Sun Offensive",giver="Exarch Nasuun",zoneName="Shattrath City",src="api"}
e[#e+1]={id=11875,rawTitle="Gaining the Advantage",expansion="TBC",type="Faction",side="Both",category="Shattered Sun Offensive",giver="Emissary Mordin",zoneName="Shattrath City",src="api"}
e[#e+1]={id=11520,rawTitle="Discovering Your Roots",expansion="TBC",type="Faction",side="Both",category="Terokkar Forest",giver="Mar'nah",zoneName="Isle of Quel'Danas",src="api"}
e[#e+1]={id=11521,rawTitle="Rediscovering Your Roots",expansion="TBC",type="Faction",side="Both",category="Terokkar Forest",giver="Mar'nah",zoneName="Isle of Quel'Danas",src="api"}
e[#e+1]={id=80277,rawTitle="City of Threads Twist",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Azj-Kahet",src="api"}
e[#e+1]={id=80283,rawTitle="City of Threads Twist - Advanced",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Azj-Kahet",src="api"}
e[#e+1]={id=80289,rawTitle="City of Threads Twist - Reverse",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Azj-Kahet",src="api"}
e[#e+1]={id=80278,rawTitle="Maddening Deep Dip",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Azj-Kahet",src="api"}
e[#e+1]={id=80284,rawTitle="Maddening Deep Dip - Advanced",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Azj-Kahet",src="api"}
e[#e+1]={id=80290,rawTitle="Maddening Deep Dip - Reverse",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Azj-Kahet",src="api"}
e[#e+1]={id=80281,rawTitle="Pit Plunge",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Azj-Kahet",src="api"}
e[#e+1]={id=80287,rawTitle="Pit Plunge - Advanced",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Azj-Kahet",src="api"}
e[#e+1]={id=80293,rawTitle="Pit Plunge - Reverse",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Azj-Kahet",src="api"}
e[#e+1]={id=80280,rawTitle="Rak-Ahat Rush",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Azj-Kahet",src="api"}
e[#e+1]={id=80286,rawTitle="Rak-Ahat Rush - Advanced",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Azj-Kahet",src="api"}
e[#e+1]={id=80292,rawTitle="Rak-Ahat Rush - Reverse",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Azj-Kahet",src="api"}
e[#e+1]={id=80282,rawTitle="Siegehold Scuttle",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Azj-Kahet",src="api"}
e[#e+1]={id=80288,rawTitle="Siegehold Scuttle - Advanced",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Azj-Kahet",src="api"}
e[#e+1]={id=80294,rawTitle="Siegehold Scuttle - Reverse",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Azj-Kahet",src="api"}
e[#e+1]={id=80279,rawTitle="The Weaver's Wing",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Azj-Kahet",src="api"}
e[#e+1]={id=80285,rawTitle="The Weaver's Wing - Advanced",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Azj-Kahet",src="api"}
e[#e+1]={id=80291,rawTitle="The Weaver's Wing - Reverse",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Azj-Kahet",src="api"}
e[#e+1]={id=78608,rawTitle="Geothermal Jaunt",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Borean Tundra",src="api"}
e[#e+1]={id=78609,rawTitle="Geothermal Jaunt - Advanced",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Borean Tundra",src="api"}
e[#e+1]={id=78610,rawTitle="Geothermal Jaunt - Reverse",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Borean Tundra",src="api"}
e[#e+1]={id=78441,rawTitle="Crystalsong Crisis",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Crystalsong Forest",src="api"}
e[#e+1]={id=78442,rawTitle="Crystalsong Crisis - Advanced",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Crystalsong Forest",src="api"}
e[#e+1]={id=78443,rawTitle="Crystalsong Crisis - Reverse",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Crystalsong Forest",src="api"}
e[#e+1]={id=78454,rawTitle="Dragonblight Dragon Flight",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Dragonblight",src="api"}
e[#e+1]={id=78455,rawTitle="Dragonblight Dragon Flight - Advanced",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Dragonblight",src="api"}
e[#e+1]={id=78456,rawTitle="Dragonblight Dragon Flight - Reverse",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Dragonblight",src="api"}
e[#e+1]={id=78102,rawTitle="Canopy Concours",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Emerald Dream",src="api"}
e[#e+1]={id=78103,rawTitle="Canopy Concours - Advanced",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Emerald Dream",src="api"}
e[#e+1]={id=78105,rawTitle="Canopy Concours - Challenge",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Emerald Dream",src="api"}
e[#e+1]={id=78104,rawTitle="Canopy Concours - Reverse",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Emerald Dream",src="api"}
e[#e+1]={id=78106,rawTitle="Canopy Concours - Reverse Challenge",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Emerald Dream",src="api"}
e[#e+1]={id=78115,rawTitle="Emerald Amble",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Emerald Dream",src="api"}
e[#e+1]={id=78116,rawTitle="Emerald Amble - Advanced",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Emerald Dream",src="api"}
e[#e+1]={id=78118,rawTitle="Emerald Amble - Challenge",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Emerald Dream",src="api"}
e[#e+1]={id=78117,rawTitle="Emerald Amble - Reverse",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Emerald Dream",src="api"}
e[#e+1]={id=78119,rawTitle="Emerald Amble - Reverse Challenge",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Emerald Dream",src="api"}
e[#e+1]={id=78016,rawTitle="Shoreline Switchback",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Emerald Dream",src="api"}
e[#e+1]={id=78017,rawTitle="Shoreline Switchback - Advanced",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Emerald Dream",src="api"}
e[#e+1]={id=78019,rawTitle="Shoreline Switchback - Challenge",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Emerald Dream",src="api"}
e[#e+1]={id=78018,rawTitle="Shoreline Switchback - Reverse",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Emerald Dream",src="api"}
e[#e+1]={id=78020,rawTitle="Shoreline Switchback - Reverse Challenge",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Emerald Dream",src="api"}
e[#e+1]={id=78000,rawTitle="Viridescent Venture - Reverse Challenge",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Emerald Dream",src="api"}
e[#e+1]={id=78334,rawTitle="Blackriver Burble",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Grizzly Hills",src="api"}
e[#e+1]={id=78335,rawTitle="Blackriver Burble - Advanced",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Grizzly Hills",src="api"}
e[#e+1]={id=78336,rawTitle="Blackriver Burble - Reverse",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Grizzly Hills",src="api"}
e[#e+1]={id=76588,rawTitle="Defender of the Flame",expansion="TWW",type="Faction",side="Both",category="Hallowfall",zoneName="Hallowfall",src="api",freq="weekly"}
e[#e+1]={id=80256,rawTitle="Dunelle's Detour",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Hallowfall",src="api"}
e[#e+1]={id=80265,rawTitle="Dunelle's Detour - Advanced",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Hallowfall",src="api"}
e[#e+1]={id=80271,rawTitle="Dunelle's Detour - Reverse",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Hallowfall",src="api"}
e[#e+1]={id=80258,rawTitle="Light's Redoubt Descent",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Hallowfall",src="api"}
e[#e+1]={id=80267,rawTitle="Light's Redoubt Descent - Advanced",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Hallowfall",src="api"}
e[#e+1]={id=80273,rawTitle="Light's Redoubt Descent - Reverse",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Hallowfall",src="api"}
e[#e+1]={id=78126,rawTitle="Lightbringer's Duty",expansion="TWW",type="Faction",side="Both",category="Hallowfall",zoneName="Hallowfall",src="api"}
e[#e+1]={id=80260,rawTitle="Mereldar Meander",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Hallowfall",src="api"}
e[#e+1]={id=80269,rawTitle="Mereldar Meander - Advanced",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Hallowfall",src="api"}
e[#e+1]={id=80275,rawTitle="Mereldar Meander - Reverse",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Hallowfall",src="api"}
e[#e+1]={id=80259,rawTitle="Stillstone Slalom",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Hallowfall",src="api"}
e[#e+1]={id=80268,rawTitle="Stillstone Slalom - Advanced",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Hallowfall",src="api"}
e[#e+1]={id=80274,rawTitle="Stillstone Slalom - Reverse",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Hallowfall",src="api"}
e[#e+1]={id=80257,rawTitle="Tenir's Traversal",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Hallowfall",src="api"}
e[#e+1]={id=80266,rawTitle="Tenir's Traversal - Advanced",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Hallowfall",src="api"}
e[#e+1]={id=80272,rawTitle="Tenir's Traversal - Reverse",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Hallowfall",src="api"}
e[#e+1]={id=80261,rawTitle="Velhan's Venture",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Hallowfall",src="api"}
e[#e+1]={id=80270,rawTitle="Velhan's Venture - Advanced",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Hallowfall",src="api"}
e[#e+1]={id=80276,rawTitle="Velhan's Venture - Reverse",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Hallowfall",src="api"}
e[#e+1]={id=78325,rawTitle="Daggercap Dart",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Howling Fjord",src="api"}
e[#e+1]={id=78326,rawTitle="Daggercap Dart - Advanced",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Howling Fjord",src="api"}
e[#e+1]={id=78327,rawTitle="Daggercap Dart - Reverse",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Howling Fjord",src="api"}
e[#e+1]={id=78301,rawTitle="Scalawag Slither",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Howling Fjord",src="api"}
e[#e+1]={id=78302,rawTitle="Scalawag Slither - Advanced",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Howling Fjord",src="api"}
e[#e+1]={id=78303,rawTitle="Scalawag Slither - Reverse",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Howling Fjord",src="api"}
e[#e+1]={id=78499,rawTitle="Citadel Sortie",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Icecrown",src="api"}
e[#e+1]={id=78500,rawTitle="Citadel Sortie - Advanced",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Icecrown",src="api"}
e[#e+1]={id=78501,rawTitle="Citadel Sortie - Reverse",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Icecrown",src="api"}
e[#e+1]={id=78558,rawTitle="Sholazar Spree",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Sholazar Basin",src="api"}
e[#e+1]={id=78559,rawTitle="Sholazar Spree - Advanced",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Sholazar Basin",src="api"}
e[#e+1]={id=78560,rawTitle="Sholazar Spree - Reverse",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Sholazar Basin",src="api"}
e[#e+1]={id=84432,rawTitle="Longship Landing",expansion="TWW",type="Faction",side="Both",category="Siren Isle",zoneName="Siren Isle",src="api",freq="weekly"}
e[#e+1]={id=84680,rawTitle="Rock 'n Stone Revival",expansion="TWW",type="Faction",side="Both",category="Siren Isle",zoneName="Siren Isle",src="api",freq="weekly"}
e[#e+1]={id=84222,rawTitle="Secure the Perimeter",expansion="TWW",type="Faction",side="Both",category="Siren Isle",zoneName="Siren Isle",src="api",freq="weekly"}
e[#e+1]={id=78389,rawTitle="The Makers' Marathon",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="The Storm Peaks",src="api"}
e[#e+1]={id=78390,rawTitle="The Makers' Marathon - Advanced",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="The Storm Peaks",src="api"}
e[#e+1]={id=78391,rawTitle="The Makers' Marathon - Reverse",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="The Storm Peaks",src="api"}
e[#e+1]={id=79268,rawTitle="Gundrak Fast Track",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Zul'Drak",src="api"}
e[#e+1]={id=79269,rawTitle="Gundrak Fast Track - Advanced",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Zul'Drak",src="api"}
e[#e+1]={id=79270,rawTitle="Gundrak Fast Track - Reverse",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Zul'Drak",src="api"}
e[#e+1]={id=78346,rawTitle="Zul'Drak Zephyr",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Zul'Drak",src="api"}
e[#e+1]={id=78347,rawTitle="Zul'Drak Zephyr - Advanced",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Zul'Drak",src="api"}
e[#e+1]={id=78349,rawTitle="Zul'Drak Zephyr - Reverse",expansion="TWW",type="Race",side="Both",category="Skyriding Race",zoneName="Zul'Drak",src="api"}
e[#e+1]={id=37868,rawTitle="More Big Racing!",expansion="WOD",type="Race",side="Both",category="Skyriding Race",zoneName="Darkmoon Island",src="api"}
e[#e+1]={id=37911,rawTitle="The Real Big Race",expansion="WOD",type="Race",side="Both",category="Skyriding Race",zoneName="Darkmoon Island",src="api"}
e[#e+1]={id=37910,rawTitle="The Real Race",expansion="WOD",type="Race",side="Both",category="Skyriding Race",zoneName="Darkmoon Island",src="api"}
e[#e+1]={id=37919,rawTitle="Gronnsbane: The Blessing of Beasts",expansion="WOD",type="Faction",side="Alliance",category="Frostfire Ridge",zoneName="Frostfire Ridge",src="api"}
e[#e+1]={id=37917,rawTitle="Gronnsbane: The Blessing of Fire",expansion="WOD",type="Faction",side="Both",category="Frostfire Ridge",zoneName="Frostfire Ridge",src="api"}
e[#e+1]={id=37918,rawTitle="Gronnsbane: The Blessing of Frost",expansion="WOD",type="Faction",side="Both",category="Frostfire Ridge",zoneName="Frostfire Ridge",src="api"}
e[#e+1]={id=37916,rawTitle="Gronnsbane: The Broken Spear",expansion="WOD",type="Faction",side="Both",category="Frostfire Ridge",zoneName="Frostfire Ridge",src="api"}
e[#e+1]={id=37914,rawTitle="Treasure Contract: The Thunderlord Sage",expansion="WOD",type="Faction",side="Both",category="Frostfire Ridge",zoneName="Frostfire Ridge",src="api"}
e[#e+1]={id=37230,rawTitle="Bloody Expensive",expansion="WOD",type="Faction",side="Both",category="Iron Docks",zoneName="Iron Docks",src="api"}
e[#e+1]={id=37145,rawTitle="Budd's Gambit",expansion="WOD",type="Faction",side="Both",category="Iron Docks",zoneName="Iron Docks",src="api"}
e[#e+1]={id=37783,rawTitle="Iron Docks",expansion="WOD",type="Faction",side="Horde",category="Iron Docks",zoneName="Iron Docks",src="api"}
e[#e+1]={id=37125,rawTitle="A Rare Find",expansion="WOD",type="Faction",side="Both",category="Nagrand",zoneName="Nagrand",src="api"}
e[#e+1]={id=37210,rawTitle="Aogexon's Fang",expansion="WOD",type="Faction",side="Both",category="Nagrand",zoneName="Nagrand",src="api"}
e[#e+1]={id=37211,rawTitle="Bergruu's Horn",expansion="WOD",type="Faction",side="Both",category="Nagrand",zoneName="Nagrand",src="api"}
e[#e+1]={id=37221,rawTitle="Dekorhan's Tusk",expansion="WOD",type="Faction",side="Both",category="Nagrand",zoneName="Nagrand",src="api"}
e[#e+1]={id=37222,rawTitle="Direhoof's Hide",expansion="WOD",type="Faction",side="Both",category="Nagrand",zoneName="Nagrand",src="api"}
e[#e+1]={id=37223,rawTitle="Gagrog's Skull",expansion="WOD",type="Faction",side="Both",category="Nagrand",zoneName="Nagrand",src="api"}
e[#e+1]={id=37799,rawTitle="Gutrek's Cleaver: The Final Piece",expansion="WOD",type="Faction",side="Both",category="Nagrand",zoneName="Nagrand",src="api"}
e[#e+1]={id=37797,rawTitle="Gutrek's Cleaver: The First Piece",expansion="WOD",type="Faction",side="Both",category="Nagrand",zoneName="Nagrand",src="api"}
e[#e+1]={id=37798,rawTitle="Gutrek's Cleaver: The Second Piece",expansion="WOD",type="Faction",side="Both",category="Nagrand",zoneName="Nagrand",src="api"}
e[#e+1]={id=37811,rawTitle="Gutrek's Cleaver: The Spirit Forge",expansion="WOD",type="Faction",side="Alliance",category="Nagrand",zoneName="Nagrand",src="api"}
e[#e+1]={id=37224,rawTitle="Mu'gra's Head",expansion="WOD",type="Faction",side="Both",category="Nagrand",zoneName="Nagrand",src="api"}
e[#e+1]={id=37225,rawTitle="Thek'talon's Talon",expansion="WOD",type="Faction",side="Both",category="Nagrand",zoneName="Nagrand",src="api"}
e[#e+1]={id=37788,rawTitle="Treasure Contract: Gutrek's Cleaver",expansion="WOD",type="Faction",side="Both",category="Nagrand",zoneName="Nagrand",src="api"}
e[#e+1]={id=37520,rawTitle="Vileclaw's Claw",expansion="WOD",type="Faction",side="Both",category="Nagrand",zoneName="Nagrand",src="api"}
e[#e+1]={id=37226,rawTitle="Xelganak's Stinger",expansion="WOD",type="Faction",side="Both",category="Nagrand",zoneName="Nagrand",src="api"}
e[#e+1]={id=37239,rawTitle="Fate of the Fallen",expansion="WOD",type="Faction",side="Both",category="Shadowmoon Burial Grounds",zoneName="Shadowmoon Burial Grounds",src="api"}
e[#e+1]={id=37784,rawTitle="Shadowmoon Burial Grounds",expansion="WOD",type="Faction",side="Horde",category="Shadowmoon Burial Grounds",zoneName="Shadowmoon Burial Grounds",src="api"}
e[#e+1]={id=37885,rawTitle="Dark Grimoire: Breaching the Barrier",expansion="WOD",type="Faction",side="Alliance",category="Shadowmoon Valley",zoneName="Shadowmoon Valley",src="api"}
e[#e+1]={id=37884,rawTitle="Dark Grimoire: The Final Ingredient",expansion="WOD",type="Faction",side="Both",category="Shadowmoon Valley",zoneName="Shadowmoon Valley",src="api"}
e[#e+1]={id=37882,rawTitle="Dark Grimoire: The First Ingredient",expansion="WOD",type="Faction",side="Both",category="Shadowmoon Valley",zoneName="Shadowmoon Valley",src="api"}
e[#e+1]={id=37883,rawTitle="Dark Grimoire: The Second Ingredient",expansion="WOD",type="Faction",side="Both",category="Shadowmoon Valley",zoneName="Shadowmoon Valley",src="api"}
e[#e+1]={id=37979,rawTitle="Dream of Argus: The Crystal Reborn",expansion="WOD",type="Faction",side="Alliance",category="Shadowmoon Valley",zoneName="Shadowmoon Valley",src="api"}
e[#e+1]={id=37978,rawTitle="Dream of Argus: The Final Fragment",expansion="WOD",type="Faction",side="Both",category="Shadowmoon Valley",zoneName="Shadowmoon Valley",src="api"}
e[#e+1]={id=37976,rawTitle="Dream of Argus: The First Fragment",expansion="WOD",type="Faction",side="Both",category="Shadowmoon Valley",zoneName="Shadowmoon Valley",src="api"}
e[#e+1]={id=37977,rawTitle="Dream of Argus: The Second Fragment",expansion="WOD",type="Faction",side="Both",category="Shadowmoon Valley",zoneName="Shadowmoon Valley",src="api"}
e[#e+1]={id=37881,rawTitle="Treasure Contract: Explosive Discoveries",expansion="WOD",type="Faction",side="Both",category="Shadowmoon Valley",zoneName="Shadowmoon Valley",src="api"}
e[#e+1]={id=37973,rawTitle="Treasure Contract: The Artificer",expansion="WOD",type="Faction",side="Both",category="Shadowmoon Valley",zoneName="Shadowmoon Valley",src="api"}
e[#e+1]={id=38440,rawTitle="Assault on The Fel Forge",expansion="WOD",type="Faction",side="Both",category="Tanaan Jungle",zoneName="Tanaan Jungle",src="api"}
e[#e+1]={id=38250,rawTitle="Assault on the Ruins of Kra'nak",expansion="WOD",type="Faction",side="Alliance",category="Tanaan Jungle",zoneName="Tanaan Jungle",src="api"}
e[#e+1]={id=37968,rawTitle="Assault on the Temple of Sha'naar",expansion="WOD",type="Faction",side="Both",category="Tanaan Jungle",zoneName="Tanaan Jungle",src="api"}
e[#e+1]={id=38046,rawTitle="Battle At The Iron Front",expansion="WOD",type="Faction",side="Alliance",category="Tanaan Jungle",zoneName="Tanaan Jungle",src="api"}
e[#e+1]={id=38044,rawTitle="Bleeding the Bleeding Hollow",expansion="WOD",type="Faction",side="Both",category="Tanaan Jungle",zoneName="Tanaan Jungle",src="api"}
e[#e+1]={id=46049,rawTitle="A Gift From Your Tadpole",expansion="WRATH",type="Faction",side="Both",category="Borean Tundra",zoneName="Borean Tundra",src="api",freq="weekly"}
e[#e+1]={id=13333,rawTitle="Capture More Dispatches",expansion="WRATH",type="Faction",side="Alliance",category="Icecrown",zoneName="Icecrown",src="api"}
e[#e+1]={id=13281,rawTitle="Neutralizing the Plague",expansion="WRATH",type="Faction",side="Horde",category="Icecrown",zoneName="Icecrown",src="api"}
e[#e+1]={id=12582,rawTitle="Frenzyheart Champion",expansion="WRATH",type="Faction",side="Both",category="Sholazar Basin",zoneName="Sholazar Basin",src="api"}
e[#e+1]={id=12761,rawTitle="Mastery of the Crystals",expansion="WRATH",type="Faction",side="Both",category="Sholazar Basin",zoneName="Sholazar Basin",src="api"}
e[#e+1]={id=12762,rawTitle="Power of the Great Ones",expansion="WRATH",type="Faction",side="Both",category="Sholazar Basin",zoneName="Sholazar Basin",src="api"}
e[#e+1]={id=12705,rawTitle="Will of the Titans",expansion="WRATH",type="Faction",side="Both",category="Sholazar Basin",zoneName="Sholazar Basin",src="api"}
e[#e+1]={id=12604,rawTitle="Congratulations!",expansion="WRATH",type="Faction",side="Both",category="Zul'Drak",zoneName="Zul'Drak",src="api"}
e[#e+1]={id=12501,rawTitle="Troll Patrol",expansion="WRATH",type="Faction",side="Both",category="Zul'Drak",zoneName="Zul'Drak",src="api"}

-- Baked-only dailies promoted to the master list so they sort by real zone
-- (were falling into Browse's "Other / Unknown" bucket). Zone/giver/category
-- cross-referenced via Wowhead; coords deferred to the coordinate sweep.
e[#e+1]={id=11354,rawTitle="WANTED: Nazan's Riding Crop",expansion="TBC",type="Faction",side="Both",category="Wanted",giver="Wind Trader Zhareem",zoneName="Shattrath City",src="api"}
e[#e+1]={id=11362,rawTitle="WANTED: Keli'dan's Feathered Stave",expansion="TBC",type="Faction",side="Both",category="Wanted",giver="Wind Trader Zhareem",zoneName="Shattrath City",src="api"}
e[#e+1]={id=11363,rawTitle="WANTED: Bladefist's Seal",expansion="TBC",type="Faction",side="Both",category="Wanted",giver="Wind Trader Zhareem",zoneName="Shattrath City",src="api"}
e[#e+1]={id=11364,rawTitle="WANTED: Shattered Hand Centurions",expansion="TBC",type="Faction",side="Both",category="Wanted",giver="Nether-Stalker Mah'duun",zoneName="Shattrath City",src="api"}
e[#e+1]={id=11368,rawTitle="WANTED: The Heart of Quagmirran",expansion="TBC",type="Faction",side="Both",category="Wanted",giver="Wind Trader Zhareem",zoneName="Shattrath City",src="api"}
e[#e+1]={id=11370,rawTitle="WANTED: The Warlord's Treatise",expansion="TBC",type="Faction",side="Both",category="Wanted",giver="Wind Trader Zhareem",zoneName="Shattrath City",src="api"}
e[#e+1]={id=11371,rawTitle="WANTED: Coilfang Myrmidons",expansion="TBC",type="Faction",side="Both",category="Wanted",giver="Nether-Stalker Mah'duun",zoneName="Shattrath City",src="api"}
e[#e+1]={id=11372,rawTitle="WANTED: The Headfeathers of Ikiss",expansion="TBC",type="Faction",side="Both",category="Wanted",giver="Wind Trader Zhareem",zoneName="Shattrath City",src="api"}
e[#e+1]={id=11373,rawTitle="WANTED: Shaffar's Wondrous Pendant",expansion="TBC",type="Faction",side="Both",category="Wanted",giver="Wind Trader Zhareem",zoneName="Shattrath City",src="api"}
e[#e+1]={id=11374,rawTitle="WANTED: The Exarch's Soul Gem",expansion="TBC",type="Faction",side="Both",category="Wanted",giver="Wind Trader Zhareem",zoneName="Shattrath City",src="api"}
e[#e+1]={id=11375,rawTitle="WANTED: Murmur's Whisper",expansion="TBC",type="Faction",side="Both",category="Wanted",giver="Wind Trader Zhareem",zoneName="Shattrath City",src="api"}
e[#e+1]={id=11376,rawTitle="WANTED: Malicious Instructors",expansion="TBC",type="Faction",side="Both",category="Wanted",giver="Nether-Stalker Mah'duun",zoneName="Shattrath City",src="api"}
e[#e+1]={id=11378,rawTitle="WANTED: The Epoch Hunter's Head",expansion="TBC",type="Faction",side="Both",category="Wanted",giver="Wind Trader Zhareem",zoneName="Shattrath City",src="api"}
e[#e+1]={id=11382,rawTitle="WANTED: Aeonus's Hourglass",expansion="TBC",type="Faction",side="Both",category="Wanted",giver="Wind Trader Zhareem",zoneName="Shattrath City",src="api"}
e[#e+1]={id=11383,rawTitle="WANTED: Rift Lords",expansion="TBC",type="Faction",side="Both",category="Wanted",giver="Nether-Stalker Mah'duun",zoneName="Shattrath City",src="api"}
e[#e+1]={id=11384,rawTitle="WANTED: A Warp Splinter Clipping",expansion="TBC",type="Faction",side="Both",category="Wanted",giver="Wind Trader Zhareem",zoneName="Shattrath City",src="api"}
e[#e+1]={id=11385,rawTitle="WANTED: Sunseeker Channelers",expansion="TBC",type="Faction",side="Both",category="Wanted",giver="Nether-Stalker Mah'duun",zoneName="Shattrath City",src="api"}
e[#e+1]={id=11386,rawTitle="WANTED: Pathaleon's Projector",expansion="TBC",type="Faction",side="Both",category="Wanted",giver="Wind Trader Zhareem",zoneName="Shattrath City",src="api"}
e[#e+1]={id=11387,rawTitle="WANTED: Tempest-Forge Destroyers",expansion="TBC",type="Faction",side="Both",category="Wanted",giver="Nether-Stalker Mah'duun",zoneName="Shattrath City",src="api"}
e[#e+1]={id=11388,rawTitle="WANTED: The Scroll of Skyriss",expansion="TBC",type="Faction",side="Both",category="Wanted",giver="Wind Trader Zhareem",zoneName="Shattrath City",src="api"}
e[#e+1]={id=11389,rawTitle="WANTED: Arcatraz Sentinels",expansion="TBC",type="Faction",side="Both",category="Wanted",giver="Nether-Stalker Mah'duun",zoneName="Shattrath City",src="api"}
e[#e+1]={id=11499,rawTitle="WANTED: The Signet Ring of Prince Kael'thas",expansion="TBC",type="Faction",side="Both",category="Wanted",giver="Wind Trader Zhareem",zoneName="Shattrath City",src="api"}
e[#e+1]={id=11500,rawTitle="WANTED: Sisters of Torment",expansion="TBC",type="Faction",side="Both",category="Wanted",giver="Nether-Stalker Mah'duun",zoneName="Shattrath City",src="api"}
e[#e+1]={id=11525,rawTitle="Further Conversions",expansion="TBC",type="Faction",side="Both",category="Shattered Sun Offensive",giver="Vindicator Xayann",zoneName="Isle of Quel'Danas",src="api"}
e[#e+1]={id=11533,rawTitle="The Air Strikes Must Continue",expansion="TBC",type="Faction",side="Both",category="Shattered Sun Offensive",giver="Battlemage Arynna",zoneName="Isle of Quel'Danas",src="api"}
e[#e+1]={id=11536,rawTitle="Don't Stop Now....",expansion="TBC",type="Faction",side="Both",category="Shattered Sun Offensive",giver="Smith Hauthaa",zoneName="Isle of Quel'Danas",src="api"}
e[#e+1]={id=11540,rawTitle="Crush the Dawnblade",expansion="TBC",type="Faction",side="Both",category="Shattered Sun Offensive",giver="Magister Ilastar",zoneName="Isle of Quel'Danas",src="api"}
e[#e+1]={id=11541,rawTitle="Disrupt the Greengill Coast",expansion="TBC",type="Faction",side="Both",category="Shattered Sun Offensive",zoneName="Isle of Quel'Danas",src="api"}
e[#e+1]={id=11543,rawTitle="Keeping the Enemy at Bay",expansion="TBC",type="Faction",side="Both",category="Shattered Sun Offensive",giver="Vindicator Kaalan",zoneName="Isle of Quel'Danas",src="api"}
e[#e+1]={id=11544,rawTitle="Ata'mal Armaments",expansion="TBC",type="Faction",side="Both",category="Shattered Sun Offensive",giver="Smith Hauthaa",zoneName="Isle of Quel'Danas",src="api"}
e[#e+1]={id=11546,rawTitle="Open for Business",expansion="TBC",type="Faction",side="Both",category="Shattered Sun Offensive",giver="Mar'nah",zoneName="Isle of Quel'Danas",src="api"}
e[#e+1]={id=11547,rawTitle="Know Your Ley Lines",expansion="TBC",type="Faction",side="Both",category="Shattered Sun Offensive",giver="Astromancer Darnarian",zoneName="Isle of Quel'Danas",src="api"}
e[#e+1]={id=11665,rawTitle="Crocolisks in the City",expansion="TBC",type="Profession",side="Both",category="Fishing",giver="Old Man Barlo",zoneName="Terokkar Forest",src="api"}
e[#e+1]={id=11669,rawTitle="Felblood Fillet",expansion="TBC",type="Profession",side="Both",category="Fishing",giver="Old Man Barlo",zoneName="Terokkar Forest",src="api"}
e[#e+1]={id=11668,rawTitle="Shrimpin' Ain't Easy",expansion="TBC",type="Profession",side="Both",category="Fishing",giver="Old Man Barlo",zoneName="Terokkar Forest",src="api"}
e[#e+1]={id=11880,rawTitle="The Multiphase Survey",expansion="TBC",type="Faction",side="Both",category="Shattered Sun Offensive",zoneName="Shattrath City",src="api"}
e[#e+1]={id=13592,rawTitle="A Valiant's Field Training",expansion="WRATH",type="Faction",side="Alliance",category="Argent Tournament",giver="Sir Marcus Barlowe",zoneName="Icecrown",src="api",subZone="Argent Tournament Grounds"}
e[#e+1]={id=13665,rawTitle="The Grand Melee",expansion="WRATH",type="Faction",side="Alliance",category="Argent Tournament",giver="Captain Joseph Holley",zoneName="Icecrown",src="api",subZone="Argent Tournament Grounds"}
e[#e+1]={id=13682,rawTitle="Threat From Above",expansion="WRATH",type="Faction",side="Both",category="Argent Tournament",giver="Eadric the Pure",zoneName="Icecrown",src="api",subZone="Argent Tournament Grounds"}
e[#e+1]={id=13789,rawTitle="Taking Battle To The Enemy",expansion="WRATH",type="Faction",side="Both",category="Argent Tournament",giver="Cellian Daybreak",zoneName="Icecrown",src="api",subZone="Argent Tournament Grounds"}
e[#e+1]={id=13790,rawTitle="Among the Champions",expansion="WRATH",type="Faction",side="Alliance",category="Argent Tournament",giver="Luuri",zoneName="Icecrown",src="api",subZone="Argent Tournament Grounds"}
e[#e+1]={id=13847,rawTitle="At The Enemy's Gates",expansion="WRATH",type="Faction",side="Both",category="Argent Tournament",giver="Captain Joseph Holley",zoneName="Icecrown",src="api",subZone="Argent Tournament Grounds"}
e[#e+1]={id=13861,rawTitle="Battle Before The Citadel",expansion="WRATH",type="Faction",side="Both",category="Argent Tournament",giver="Eadric the Pure",zoneName="Icecrown",src="api",subZone="Argent Tournament Grounds"}
e[#e+1]={id=14048,rawTitle="Can't Get Enough Turkey",expansion="WRATH",type="Event",side="Both",category="Pilgrim's Bounty",zoneName="Pilgrim's Bounty",src="api"}
e[#e+1]={id=14051,rawTitle="Don't Forget The Stuffing!",expansion="WRATH",type="Event",side="Both",category="Pilgrim's Bounty",zoneName="Pilgrim's Bounty",src="api"}
e[#e+1]={id=14053,rawTitle="We're Out of Cranberry Chutney Again?",expansion="WRATH",type="Event",side="Both",category="Pilgrim's Bounty",zoneName="Pilgrim's Bounty",src="api"}
e[#e+1]={id=14054,rawTitle="Easy As Pie",expansion="WRATH",type="Event",side="Both",category="Pilgrim's Bounty",zoneName="Pilgrim's Bounty",src="api"}
e[#e+1]={id=14055,rawTitle="She Says Potato",expansion="WRATH",type="Event",side="Both",category="Pilgrim's Bounty",zoneName="Pilgrim's Bounty",src="api"}
e[#e+1]={id=26153,rawTitle="Penny's Pumpkin Pancakes",expansion="CATA",type="Event",side="Both",category="Hallow's End",zoneName="Hallow's End",src="api"}
e[#e+1]={id=26414,rawTitle="Hitting a Walleye",expansion="CATA",type="Profession",side="Alliance",category="Fishing",giver="Catherine Leland",zoneName="Stormwind City",src="api"}
e[#e+1]={id=26420,rawTitle="Diggin' For Worms",expansion="CATA",type="Profession",side="Alliance",category="Fishing",giver="Catherine Leland",zoneName="Stormwind City",src="api"}
e[#e+1]={id=26442,rawTitle="Rock Lobster",expansion="CATA",type="Profession",side="Alliance",category="Fishing",giver="Catherine Leland",zoneName="Stormwind City",src="api"}
e[#e+1]={id=26488,rawTitle="Big Gulp",expansion="CATA",type="Profession",side="Alliance",category="Fishing",giver="Catherine Leland",zoneName="Stormwind City",src="api"}
e[#e+1]={id=26536,rawTitle="Thunder Falls",expansion="CATA",type="Profession",side="Alliance",category="Fishing",giver="Catherine Leland",zoneName="Stormwind City",src="api"}
e[#e+1]={id=29192,rawTitle="The Wardens are Watching",expansion="CATA",type="Faction",side="Both",category="Molten Front",zoneName="Mount Hyjal",src="api",subZone="Molten Front"}
e[#e+1]={id=29255,rawTitle="Embergris",expansion="CATA",type="Faction",side="Both",category="Molten Front",zoneName="Mount Hyjal",src="api",subZone="Molten Front"}
e[#e+1]={id=29257,rawTitle="Steal Magmolias",expansion="CATA",type="Faction",side="Both",category="Molten Front",zoneName="Mount Hyjal",src="api",subZone="Molten Front"}
e[#e+1]={id=29290,rawTitle="Fire in the Skies",expansion="CATA",type="Faction",side="Both",category="Molten Front",zoneName="Mount Hyjal",src="api",subZone="Molten Front"}
e[#e+1]={id=29296,rawTitle="Territorial Birds",expansion="CATA",type="Faction",side="Both",category="Molten Front",zoneName="Mount Hyjal",src="api",subZone="Molten Front"}
e[#e+1]={id=29364,rawTitle="Corn Mash",expansion="CATA",type="Profession",side="Horde",category="Cooking",zoneName="Thunder Bluff",src="api"}
e[#e+1]={id=29455,rawTitle="Target: Turtle",expansion="CATA",type="Faction",side="Both",category="Darkmoon Faire",zoneName="Darkmoon Island",src="api"}
e[#e+1]={id=29463,rawTitle="It's Hammer Time",expansion="CATA",type="Faction",side="Both",category="Darkmoon Faire",zoneName="Darkmoon Island",src="api"}
e[#e+1]={id=29438,rawTitle="He Shoots, He Scores!",expansion="CATA",type="Faction",side="Both",category="Darkmoon Faire",zoneName="Darkmoon Island",src="api"}
e[#e+1]={id=33146,rawTitle="Noodle Time",expansion="MOP",type="Profession",side="Both",category="Cooking",giver="Sungshin Ironpaw",zoneName="Valley of the Four Winds",src="api"}
e[#e+1]={id=33358,rawTitle="Noodle Time: Bonus",expansion="MOP",type="Profession",side="Both",category="Cooking",giver="Sungshin Ironpaw",zoneName="Valley of the Four Winds",src="api"}
