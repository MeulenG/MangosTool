--[[
DewDropDown.lua
Defines the table listings for the dropdown lists.
]]
local AL = AceLibrary("AceLocale-2.2"):new("AtlasLoot");

local BabbleZone = AceLibrary("Babble-Zone-2.2")

--This is a multi-layer table defining the main loot listing.
--Entries have the text to display, loot table or sub table to link to and if the link is to a loot table or sub table
AtlasLoot_DewDropDown = {
	[1] = {
		[AL["Eastern Kingdoms"]] = {
			[1] = { 
				[BabbleZone["Alterac Mountains"]] = {
					{ BabbleZone["Blackrock Camp"] },
					{ BabbleZone["Chillwind Point"] },
					{ BabbleZone["Dalaran"] },
					{ BabbleZone["Dalaran Ruins"] },
					{ BabbleZone["Dandred's Fold"] },
					{ BabbleZone["Dun Baldar"] },
					{ BabbleZone["Dun Baldar Pass"] },
					{ BabbleZone["Lordamere Internment Camp"] },
				},
			},
			[2] = { 
				[BabbleZone["Arathi Highlands"]] = {
					{ BabbleZone["Abyssal Sands"] },
					{ BabbleZone["Arathi Basin"] },
					{ BabbleZone["Arathi Highlands"] },
					{ BabbleZone["Boulderfist Hall"] },
					{ BabbleZone["Circle of East Binding"] },
					{ BabbleZone["Circle of Inner Binding"] },
					{ BabbleZone["Circle of Outer Binding"] },
					{ BabbleZone["Circle of West Binding"] },
					{ BabbleZone["Dabyrie's Farmstead"] },
					{ BabbleZone["Drowned Reef"] },
					{ BabbleZone["Faldir's Cove"] },
					{ BabbleZone["Go'Shek Farm"] },
					{ BabbleZone["Hammerfall"] },
				},
			},
			[3] = { 
				[BabbleZone["Badlands"]] = {
					{ BabbleZone["Angor Fortress"] },
					{ BabbleZone["Apocrypthan's Rest"] },
					{ BabbleZone["Camp Boff"] },
					{ BabbleZone["Camp Cagg"] },
					{ BabbleZone["Camp Kosh"] },
					{ BabbleZone["Dreadmaul Hold"] },
					{ BabbleZone["Hammertoe's Digsite"] },
					{ BabbleZone["Kargath"] },
					{ BabbleZone["Lethlor Ravine"] },
					{ BabbleZone["Maker's Terrance"] },
				},
			},
			[4] = { 
				[BabbleZone["Blasted Lands"]] = {
					{ BabbleZone["Blasted Lands"] },
					{ BabbleZone["Dark Portal"] },
					{ BabbleZone["Dreadmaul Post"] },
					{ BabbleZone["Nethergarde Keep"] },
				},
			},
			[5] = { 
				[BabbleZone["Burning Steppes"]] = {
					{ BabbleZone["Altar Of Storms A"] },
					{ BabbleZone["Altar Of Storms B"] },
					{ BabbleZone["Blackrock Depths"] },
					{ BabbleZone["Blackwing Lair"] },
					{ BabbleZone["Dragonmaw Garrison"] },
					{ BabbleZone["Draco'dar"] },
					{ BabbleZone["Dreadmaul Rock"] },
					{ BabbleZone["Molten Core"] },
					{ BabbleZone["Morgan's Vigil"] },
				},
			},
			[6] = { 
				[BabbleZone["Deadwind Pass"]] = {
					{ BabbleZone["Ariden's Camp"] },
					{ BabbleZone["Deadwind Pass"] },
					{ BabbleZone["Morgan's Plot"] },
				},
			},
			[7] = { 
				[BabbleZone["Dun Morogh"]] = {
					{ BabbleZone["Anvilmar"] },
					{ BabbleZone["Brewnall Village"] },
					{ BabbleZone["Coldridge Valley"] },
					{ BabbleZone["Dun Morogh"] },
					{ BabbleZone["Frostmane Hold"] },
					{ BabbleZone["Gnomeregan"] },
					{ BabbleZone["Gnomeregan Train Depot"] },
					{ BabbleZone["Gol'Bolar Quarry"] },
					{ BabbleZone["Helm's Bed Lake"] },
					{ BabbleZone["Kharanos"] },
					{ BabbleZone["Misty Pine Refuge"] },
				},
			},
			[8] = { 
				[BabbleZone["Duskwood"]] = {
					{ BabbleZone["Addles Stead"] },
					{ BabbleZone["Beggar's Haunt"] },
					{ BabbleZone["Brightwood Grove"] },
					{ BabbleZone["Darkened Bank"] },
					{ BabbleZone["Darkshire"] },
					{ BabbleZone["Deadman's Crossing"] },
					{ BabbleZone["Duskwood"] },
				},
			},
			[9] = { 
				[BabbleZone["Eastern Plaguelands"]] = {
					{ BabbleZone["Blackwood Lake"] },
					{ BabbleZone["Corin's Crossing"] },
					{ BabbleZone["Crown Guard Tower"] },
					{ BabbleZone["Darrowmere Lake"] },
					{ BabbleZone["Eastwall Tower"] },
					{ BabbleZone["Light's Hope Chapel"] },
					{ BabbleZone["Naxxramas"] },
				},
			},
			[10] = { 
				[BabbleZone["Elwynn Forest"]] = {
					{ BabbleZone["Brackwell Pumpkin Patch"] },
					{ BabbleZone["Crystal Lake"] },
					{ BabbleZone["Eastvale Logging Camp"] },
					{ BabbleZone["Elwynn Forest"] },
					{ BabbleZone["Fargo Deepmine"] },
					{ BabbleZone["Goldshire"] },
					{ BabbleZone["Heroe's Vigil"] },
					{ BabbleZone["Jasperlode Mine"]  },
					{ BabbleZone["Maclure Vineyards"] },
					{ BabbleZone["Mirror Lake"] },
					{ BabbleZone["Mirror Lake Orchard"] },
				},
			},
			[11] = { 
				[BabbleZone["Eversong Woods"]] = {
					{ BabbleZone["Fairbreeze Village"] },
					{ BabbleZone["Farstrider Retreat"] },
				},
			},
			[12] = { 
				[BabbleZone["Ghostlands"]] = {
					{ BabbleZone["Amani Pass"] },
					{ BabbleZone["Deatholme"] },
					{ BabbleZone["Ghostlands"] },
				},
			},
			[13] = { 
				[BabbleZone["Hillsbrad Foothills"]] = {
					{ BabbleZone["Alterac Valley"] },
					{ BabbleZone["Darrow Hill"] },
					{ BabbleZone["Dun Garok"] },
					{ BabbleZone["Durnholde Keep"] },
					{ BabbleZone["Eastern Strand"] },
					{ BabbleZone["Headland"] },
					{ BabbleZone["Hillsbrad Fields"] },
				},
			},
			[14] = { 
				[BabbleZone["Ironforge"]] = {
					{ BabbleZone["Ironforge"] },
					{ BabbleZone["Commons"] },
					{ BabbleZone["Forlorn Cavern"] },
					{ BabbleZone["Great Forge"] },
					{ BabbleZone["Hall of Explorers"] },
					{ BabbleZone["Hall of Legends"] },
					{ BabbleZone["Military Ward"] },
					{ BabbleZone["Mystic Ward"] },
				},
			},
			[15] = { 
				[BabbleZone["Loch Modan"]] = {
					{ BabbleZone["Algaz Station"] },
					{ BabbleZone["Dun Algaz"] },
					{ BabbleZone["Farstrider Lodge"] },
					{ BabbleZone["Ironband's Excavation Site"]},
					{ BabbleZone["Loch Lake"] },
					{ BabbleZone["Mo'grosh Stronghold"] },
				},
			},
			[16] = { 
				[BabbleZone["Redridge Mountains"]] = {
					{ BabbleZone["Althers Mill"] },
					{ BabbleZone["Lake Everstill"] },
					{ BabbleZone["Lakeshire"] },
					{ BabbleZone["Murloc Camp"] },
				},
			},
			[17] = { 
				[BabbleZone["Searing Gorge"]] = {
					{ BabbleZone["Dustfire Valley"] },
					{ BabbleZone["Firewatch Ridge"] },
					{ BabbleZone["Grimeslit Dig Site"] },
				},
			},
			[18] = { 
				[BabbleZone["Silverpine Forest"]] = {
					{ BabbleZone["Amber Mill"] },
					{ BabbleZone["Dawning Isles"] },
					{ BabbleZone["Dead Field"] },
					{ BabbleZone["Deathknell"] },
					{ BabbleZone["Fenris Isle"] },
					{ BabbleZone["Fenris Keep"] },
					{ BabbleZone["Greymane Wall"] },
					{ BabbleZone["Ivar Patch"] },
					{ BabbleZone["Lordamere Lake"] },
					{ BabbleZone["Malden's Orchard"] },
				},
			},
			[19] = { 
				[BabbleZone["Stormwind City"]] = {
					{ BabbleZone["Champion's Hall"] },
					{ BabbleZone["Deeprun Tram"] },
					{ BabbleZone["Mage Quarter"] },
				},
			},
			[20] = { 
				[BabbleZone["Stranglethorn Vale"]] = {
					{ BabbleZone["Bloodsail Compound"] },
					{ BabbleZone["Booty Bay"] },
					{ BabbleZone["Gilijim's Isle"] },
					{ BabbleZone["Grom'Gol Base Camp"] },
					{ BabbleZone["Gurubashi Arena"] },
					{ BabbleZone["Jaguero Isle"] },
					{ BabbleZone["Janeiro's Point"] },
					{ BabbleZone["Kurzen's Compound"] },
				},
			},
			[21] = { 
				[BabbleZone["Swamp of Sorrows"]] = {
					{ BabbleZone["Fallow Sanctuary"] },
					{ BabbleZone["Misty Reed Post"] },
					{ BabbleZone["Misty Reed Strand"] },
					{ BabbleZone["Misty Valley"] },
				},
			},
			[22] = { 
				[BabbleZone["The Hinterlands"]] = {
					{ BabbleZone["Aerie Peak"] },
					{ BabbleZone["Agol'Watha"] },
					{ BabbleZone["The Altar Of Zul"] },
					{ BabbleZone["Jintha'Alor"] },
				},
			},
			[23] = { 
				[BabbleZone["Tirisfal Glades"]] = {
					{ BabbleZone["Agamand Mills"] },
					{ BabbleZone["Bulwark"] },
					{ BabbleZone["Brightwater Lake"] },
					{ BabbleZone["Brill"] },
					{ BabbleZone["Cold Hearth Manor"] },
					{ BabbleZone["Garren's Haunt"] },
					{ BabbleZone["Gunther's Retreat"] },
				},
			},
			[24] = { 
				[BabbleZone["Undercity"]] = {
					{ BabbleZone["Magic Quarter"] },
				},
			},
			[25] = { 
				[BabbleZone["Western Plaguelands"]] = {
					{ BabbleZone["Caer Darrow"] },
					{ BabbleZone["Caer Darrow The Dark Portal"] },
					{ BabbleZone["Dalson's Tears"] },
					{ BabbleZone["Felstone Field"] },
					{ BabbleZone["Fungal Vale"] },
					{ BabbleZone["Gahrron's Withering"] },
					{ BabbleZone["Mardenholde Keep"] },
					{ BabbleZone["Marris Stead"] },
					{ BabbleZone["Moonbrook"] },
				},
			},
			[26] = {
				[BabbleZone["Westfall"]] = {
					{ BabbleZone["Alexston Farmstead"] },
					{ BabbleZone["Dagger Hills"] },
					{ BabbleZone["Dead Acre"] },
					{ BabbleZone["Deadmines"] },
					{ BabbleZone["Dust Plains"] },
					{ BabbleZone["Furlbrow's Pumpkin Patch"] },
					{ BabbleZone["Jangolode Mine"] },
					{ BabbleZone["Longshore"] },
				},
			},
			[27] = {
				[BabbleZone["Wetlands"]] = {
					{ BabbleZone["Baradin Bay"] },
					{ BabbleZone["Direforge Hill"] },
					{ BabbleZone["Dragonmaw Gates"] },
					{ BabbleZone["Dun Modr"] },
					{ BabbleZone["Green Belt"] },
					{ BabbleZone["Grim Batol"] },
					{ BabbleZone["Ironbeard's Tomb"] },
					{ BabbleZone["Menethil Bay"] },
					{ BabbleZone["Menethil Harbor"] },
				},
			},
		},
	},
	[2] = {
		[AL["Kalimdor"]] = {
			[1] = { 
				[BabbleZone["Ashenvale"]] = {
					{ BabbleZone["Ashenvale"] },
					{ BabbleZone["Astranaar"] },
					{ BabbleZone["Blackfathom Deeps"] },
					{ BabbleZone["Bough Shadow"] },
					{ BabbleZone["Demon Fall Canyon"] },
					{ BabbleZone["Dor'Danil Barrow Den"] },
					{ BabbleZone["Falfarren River"] },
					{ BabbleZone["Felfire Hill"] },
					{ BabbleZone["Forest Song"] },
					{ BabbleZone["Greenpaw Village"] },
					{ BabbleZone["Kargathia Keep"] },
					{ BabbleZone["Maestra's Post"] },
					{ BabbleZone["Mystral Lake"] },
				},
			},
			[2] = { 
				[BabbleZone["Azshara"]] = {
					{ BabbleZone["Azshara"] },
				},
			},
			[3] = { 
				[BabbleZone["Darkshore"]] = {
					{ BabbleZone["Ameth'Aran"] },
					{ BabbleZone["Auberdine"] },
					{ BabbleZone["Bashal'Aran"] },
					{ BabbleZone["Blackwood Den"] },
					{ BabbleZone["The Clifspring River"] },
					{ BabbleZone["Darkshore"] },
					{ BabbleZone["Grove of the Ancients"] },
					{ BabbleZone["Long Wash"] },
					{ BabbleZone["Master's Glaive"] },
					{ BabbleZone["Mist's Edge"] },
				},
			},
			[4] = { 
				[BabbleZone["Darnassus"]] = {
					{ BabbleZone["Aldrassil"]},
					{ BabbleZone["The Cenarion Enclave"] },
					{ BabbleZone["Craftsmen's Terrance"] },
					{ BabbleZone["Darnassus"] },
				},
			},
			[5] = { 
				[BabbleZone["Desolace"]] = {
					{ BabbleZone["Desolace"] },
					{ BabbleZone["Gelkis Village"] },
					{ BabbleZone["Ghost Walker Post"] },
					{ BabbleZone["Kodo Graveyard"] },
					{ BabbleZone["Kolkar Village"] },
					{ BabbleZone["Magram Village"] },
					{ BabbleZone["Mannoroc Coven"] },
					{ BabbleZone["Maraudon"] },
				},
			},
			[6] = { 
				[BabbleZone["Durotar"]] = {
					{ BabbleZone["Bladefist Bay"] },
					{ BabbleZone["Deadeye Shore"] },
					{ BabbleZone["Durotar"] },
					{ BabbleZone["Echo Isles"] },
					{ BabbleZone["Goblin Observatory"] },
					{ BabbleZone["Kolkar Crag"] },
				},
			},
			[7] = { 
				[BabbleZone["Dustwallow Marsh"]] = {
					{ BabbleZone["Alcaz Island"] },
					{ BabbleZone["Beezil's Wreck"] },
					{ BabbleZone["Brackenwall Village"] },
					{ BabbleZone["Deadmire"] },
					{ BabbleZone["Den of Flame"] },
					{ BabbleZone["Dreadmurk Shore"] },
					{ BabbleZone["Dustwallow Marsh"] },
					{ BabbleZone["Lost Point"] },
				},
			},
			[8] = { 
				[BabbleZone["Felwood"]] = {
					{ BabbleZone["Bloodvenom Falls"] },
					{ BabbleZone["Emerald Sanctuary"] },
					{ BabbleZone["Felwood"] },
					{ BabbleZone["Jaedenar"] },
				},
			},
			[9] = { 
				[BabbleZone["Feralas"]] = {
					{ BabbleZone["Camp Mojache"] },
					{ BabbleZone["Dire Maul"] },
					{ BabbleZone["Dream Bough"] },
					{ BabbleZone["Feathermoon Stronghold"] },
					{ BabbleZone["Feralas"] },
					{ BabbleZone["Forgotten Coast"] },
					{ BabbleZone["Isle of Dread"] },
				},
			},
			[10] = { 
				[BabbleZone["Moonglade"]] = {
					{ BabbleZone["Moonglade"] },
				},
			},
			[11] = { 
				[BabbleZone["Mulgore"]] = {
					{ BabbleZone["Mulgore"] },
					{ BabbleZone["Mulgore Mine"] },
					{ BabbleZone["The Bael'Dun Digsite"] },
					{ BabbleZone["Bloodhoof Village"] },
					{ BabbleZone["Brambleblade Ravine"] },
					{ BabbleZone["Camp Narache"] },
					{ BabbleZone["Elder Rise"] },
					{ BabbleZone["Hunter Rise"] },
				},
			},
			[12] = { 
				[BabbleZone["Orgrimmar"]] = {
					{ BabbleZone["Cleft of Shadow"] },
					{ BabbleZone["Drag"] },
					{ BabbleZone["Grommash Hold"] },
					{ BabbleZone["Hidden Path"] },
				},
			},
			[13] = { 
				[BabbleZone["Silithus"]] = {
					{ BabbleZone["Cenarion Hold"] },
					{ BabbleZone["Hive'Ashi"] },
					{ BabbleZone["Hive'Regal"] },
					{ BabbleZone["Hive'Zora"] },
				},
			},
			[14] = { 
				[BabbleZone["Stonetalon Mountains"]] = {
					{ BabbleZone["Blackwolf River"] },
					{ BabbleZone["Boulderslide Ravine"] },
					{ BabbleZone["Charred Vale"] },
					{ BabbleZone["Cragpool Lake"] },
					{ BabbleZone["The Den"] },
					{ BabbleZone["Greatwood Vale"] },
					{ BabbleZone["Malaka'jin"] },
					{ BabbleZone["Mirkfallon Lake"] },
				},
			},
			[15] = { 
				[BabbleZone["Tanaris"]] = {
					{ BabbleZone["Abyssal Sands"] },
					{ BabbleZone["Caverns of Time"] },
					{ BabbleZone["The Black Morass"] },
					{ BabbleZone["The Black Morass Portal"] },
					{ BabbleZone["Dunemaul Compound"] },
					{ BabbleZone["Eastmoon Ruins"] },
					{ BabbleZone["Gadgetzan"] },
					{ BabbleZone["Gaping Chasm"] },
				},
			},
			[16] = { 
				[BabbleZone["Teldrassil"]] = {
					{ BabbleZone["Dolanaar"] },
					{ BabbleZone["Gm Island"] },
					{ BabbleZone["Gnarlpine Hold"] },
					{ BabbleZone["Lake Al'Ameth"] },
				},
			},
			[17] = { 
				[BabbleZone["The Barrens"]] = {
					{ BabbleZone["Bael Modan"] },
					{ BabbleZone["Barrens"] },
					{ BabbleZone["Camp Taurajo"] },
					{ BabbleZone["Crossroads"] },
					{ BabbleZone["Field of Giants"] },
					{ BabbleZone["Forgotten Pools"] },
					{ BabbleZone["Fray Island"] },
					{ BabbleZone["Great Lift"] },
					{ BabbleZone["Lushwater Oasis"] },
					{ BabbleZone["Merchant Coast"] },
				},
			},
			[18] = { 
				[BabbleZone["Thousand Needles"]] = {
					{ BabbleZone["Freewind Post"] },
					{ BabbleZone["Darkcloud Pinnacle"] },
					{ BabbleZone["Highperch"] },
					{ BabbleZone["Mirage Raceway"] },

				},
			},
			[19] = { 
				[BabbleZone["Thunder Bluff"]] = {
					{ BabbleZone["Abyssal Sands"] },
				},
			},
			[20] = { 
				[BabbleZone["Un'Goro Crater"]] = {
					{ BabbleZone["Fire Plume Ridge"] },
					{ BabbleZone["Fungal Rock"] },
					{ BabbleZone["Golakka Hot Springs"] },
					{ BabbleZone["Lakkari Tar Pits"] },
					{ BabbleZone["Marshal's Refuge"] },
					{ BabbleZone["Marshlands"] },
				},
			},
			[21] = { 
				[BabbleZone["Winterspring"]] = {
					{ BabbleZone["Darkwhisper Gorge"] },
					{ BabbleZone["Everlook"] },
					{ BabbleZone["Frostfire Hot Springs"] },
					{ BabbleZone["Frostsaber Rock"] },
					{ BabbleZone["Frostwhisper Gorge"] },
					{ BabbleZone["Hidden Grove"] },
					{ BabbleZone["Mazthoril"] },
				},
			},
		},
	},
};