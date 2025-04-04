local MT = AceLibrary("AceLocale-2.2"):new("MangosTool");

--Instance required libraries
local AL = AceLibrary("AceLocale-2.2"):new("AtlasLoot");
local BC = AceLibrary("Babble-Class-2.2")
local BZ = AceLibrary("Babble-Zone-2.2")
local BS = AceLibrary("Babble-Spell-2.2")
local BB = AceLibrary("Babble-Boss-2.2")
local BF = AceLibrary("Babble-Faction-2.2")
local BIS = AceLibrary("Babble-ItemSet-2.2")

--Establish version number and compatible version of Atlas
local VERSION_MAJOR = "0";
local VERSION_MINOR = "8";
ATLASLOOT_VERSION = "|cffFF8400MangosTool v"..VERSION_MAJOR.."."..VERSION_MINOR.."|r";

--Standard indent to line text up with Atlas text
ATLASLOOT_INDENT = "   ";

--Make the Dewdrop menu in the standalone loot browser accessible here
AtlasLoot_Dewdrop = AceLibrary("Dewdrop-2.0");
AtlasLoot_DewdropSubMenu = AceLibrary("Dewdrop-2.0");

--Variable to cap debug spam
ATLASLOOT_DEBUGSHOWN = false;

--Set the default anchor for the loot frame to the Atlas frame
AtlasLoot_AnchorFrame = AtlasFrame;


function MangosTool_ShowTab(tabId)
    if tabId == 1 then
        -- Show the TeleportFrame and hide the main MangosTool frame
        MangosToolTeleportFrame:Show()
        MangosTool:Hide()
    end
    if tabId == 2 then
        MangosToolAddItemsFrame:Show()
        MangosTool_Hide()
    end
    if tabId == 3 then
        MangosToolGMCommandsFrame:Show()
        MangosTool_Hide()
    end
end

MT:RegisterTranslations("enUS", function() return {
    Tab1 = "Teleport",
    Tab2 = "Add Items",
    Tab3 = "GM Commands",
    Search = "Search",
} end)

--[[
MangosToolTeleport_OnEvent(event):
event - Name of the event, passed from the API
Invoked whenever a relevant event is detected by the engine.  The function then
decides what action to take depending on the event.
]]
function MangosToolTeleport_OnEvent(event)
	--Addons all loaded
	if(event == "VARIABLES_LOADED") then
		MangosToolTeleport_OnVariablesLoaded();
	--Taint errors
	elseif(arg1 == "MangosTool") then
		--Junk command to suppress taint message
		local i=3;
	end
end

--[[
AtlasLoot_ShowMenu:
Legacy function used in Cosmos integration to open the loot browser
]]
function AtlasLoot_ShowMenu()
	MangosToolTeleportFrame:Show();
end

--[[
MangosToolTeleport_OnVariablesLoaded:
Invoked by the VARIABLES_LOADED event.  Now that we are sure all the assets
the addon needs are in place, we can properly set up the mod
]]
function MangosToolTeleport_OnVariablesLoaded()
	--Set up the menu in the loot browser
	MangosTool_DewdropRegister();
end

--[[
AtlasLoot_SlashCommand(msg):
msg - takes the argument for the /atlasloot command so that the appropriate action can be performed
If someone types /atlasloot, bring up the options box
]]
function MangosToolTeleport_SlashCommand(msg)
	MangosToolTeleportFrame:Show();
end

--[[
MangosToolTeleport_OnLoad:
Performs inital setup of the mod and registers it for further setup when
the required resources are in place
]]
function MangosToolTeleport_OnLoad()
	this:RegisterEvent("VARIABLES_LOADED");
	this:RegisterEvent("ADDON_ACTION_FORBIDDEN");
	this:RegisterEvent("ADDON_ACTION_BLOCKED");
	--Enable the use of /al or /atlasloot to open the loot browser
	SLASH_MANGOSTOOL1 = "/mangostool";
	SLASH_MANGOSTOOL2 = "/mt";
	SlashCmdList["MANGOSTOOL"] = function(msg)
		MangosToolTeleport_SlashCommand(msg);
	end
end