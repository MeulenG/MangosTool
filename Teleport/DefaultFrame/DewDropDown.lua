--[[
DewDropDown.lua
Defines the table listings for the dropdown lists.
]]

--Invoke all libraries
local BabbleZone = LibStub("LibBabble-Zone-3.0"):GetLookupTable();
local AL = AceLibrary("AceLocale-2.2"):new("AtlasLoot");

--This is a multi-layer table defining the main loot listing.
--Entries have the text to display, loot table or sub table to link to and if the link is to a loot table or sub table
AtlasLoot_DewDropDown = {
	[1] = {
		[AL["Eastern Kingdoms"]] = {
			[1] = { 
				[BabbleZone["Alterac Mountains"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[2] = { 
				[BabbleZone["Arathi Highlands"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[3] = { 
				[BabbleZone["Badlands"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[4] = { 
				[BabbleZone["Blasted Lands"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[5] = { 
				[BabbleZone["Burning Steppes"]] = {
					{ BabbleZone["Altar Of Storms A"], "Altar Of Storms A"},
					{ BabbleZone["Altar Of Storms B"], "Altar Of Storms B"},
				},
			},
			[6] = { 
				[BabbleZone["Deadwind Pass"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[7] = { 
				[BabbleZone["Dun Morogh"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[8] = { 
				[BabbleZone["Duskwood"]] = {
					{ BabbleZone["Addles Stead"], "Addles Stead"},
				},
			},
			[9] = { 
				[BabbleZone["Eastern Plaguelands"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[10] = { 
				[BabbleZone["Elwynn Forest"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[11] = { 
				[BabbleZone["Eversong Woods"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[12] = { 
				[BabbleZone["Ghostlands"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[13] = { 
				[BabbleZone["Hillsbrad Foothills"]] = {
					{ BabbleZone["Alterac Valley"], "Alterac Valley"},
				},
			},
			[14] = { 
				[BabbleZone["Ironforge"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[15] = { 
				[BabbleZone["Isle of Quel'Danas"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[16] = { 
				[BabbleZone["Loch Modan"]] = {
					{ BabbleZone["Algaz Station"], "Algaz Station"},
				},
			},
			[17] = { 
				[BabbleZone["Redridge Mountains"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[18] = { 
				[BabbleZone["Searing Gorge"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[19] = { 
				[BabbleZone["Silvermoon City"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[20] = { 
				[BabbleZone["Silverpine Forest"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[21] = { 
				[BabbleZone["Stormwind City"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[22] = { 
				[BabbleZone["Stranglethorn Vale"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[23] = { 
				[BabbleZone["Swamp of Sorrows"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[24] = { 
				[BabbleZone["The Hinterlands"]] = {
					{ BabbleZone["Aerie Peak"], "Aerie Peak"},
					{ BabbleZone["Agol'Watha"], "Agol'Watha"},
					{ BabbleZone["The Altar Of Zul"], "The Altar Of Zul"},
				},
			},
			[25] = { 
				[BabbleZone["Tirisfal Glades"]] = {
					{ BabbleZone["Agamand Mills"], "Agamand Mills"},
				},
			},
			[26] = { 
				[BabbleZone["Undercity"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[27] = { 
				[BabbleZone["Western Plaguelands"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[28] = {
				[BabbleZone["Westfall"]] = {
					{ BabbleZone["Alexston Farmstead"], "Alexston Farmstead"},
				},
			},
			[29] = {
				[BabbleZone["Wetlands"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
		},
	},
	[2] = {
		[AL["Kalimdor"]] = {
			[1] = { 
				[BabbleZone["Ashenvale"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[2] = { 
				[BabbleZone["Azshara"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[3] = {
				[BabbleZone["Azuremyst Isle"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[4] = { 
				[BabbleZone["Bloodmyst Isle"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[5] = { 
				[BabbleZone["Darkshore"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[6] = { 
				[BabbleZone["Darnassus"]] = {
					{ BabbleZone["Aldrassil"], "Aldrassil"},
				},
			},
			[7] = { 
				[BabbleZone["Desolace"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[8] = { 
				[BabbleZone["Durotar"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[9] = { 
				[BabbleZone["Dustwallow Marsh"]] = {
					{ BabbleZone["Alcaz Island"], "Alcaz Island"},
				},
			},
			[10] = { 
				[BabbleZone["Felwood"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[11] = { 
				[BabbleZone["Feralas"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[12] = { 
				[BabbleZone["Moonglade"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[13] = { 
				[BabbleZone["Mulgore"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[14] = { 
				[BabbleZone["Orgrimmar"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[15] = { 
				[BabbleZone["Silithus"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[16] = { 
				[BabbleZone["Stonetalon Mountains"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[17] = { 
				[BabbleZone["Tanaris"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[18] = { 
				[BabbleZone["Teldrassil"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[19] = { 
				[BabbleZone["The Barrens"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[20] = { 
				[BabbleZone["The Exodar"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[21] = { 
				[BabbleZone["Thousand Needles"]] = {
					{ BabbleZone["Freewind Post"], "Freewind Post"},
				},
			},
			[22] = { 
				[BabbleZone["Thunder Bluff"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[23] = { 
				[BabbleZone["Un'Goro Crater"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[24] = { 
				[BabbleZone["Winterspring"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
		},
	},
	[3] = {
		[AL["Outland"]] = {
			[1] = { 
				[BabbleZone["Hellfire Peninsula"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[2] = { 
				[BabbleZone["Zangarmarsh"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[3] = { 
				[BabbleZone["Blades Edge Mountains"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[4] = { 
				[BabbleZone["Area 52"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
			[5] = { 
				[BabbleZone["Terokkar Forest"]] = {
					{ BabbleZone["Aldor Rise"], "Aldor Rise"},
					{ BabbleZone["Allerian Stronghold"], "Allerian Stronghold"},
				},
			},
			[6] = { 
				[BabbleZone["Shadowmoon Valley"]] = {
					{ BabbleZone["Altar Of Damnation"], "Altar Of Damnation"},
				},
			},
			[7] = { 
				[BabbleZone["Nagrand"]] = {
					{ BabbleZone["Abyssal Sands"], "Abyssal Sands"},
				},
			},
		},
	},
};