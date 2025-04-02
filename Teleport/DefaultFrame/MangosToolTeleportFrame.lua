AtlasLoot = AceLibrary("AceAddon-2.0"):new("AceDB-2.0")

--Instance required libraries
local AL = AceLibrary("AceLocale-2.2"):new("AtlasLoot");
local BC = AceLibrary("Babble-Class-2.2")
local BZ = AceLibrary("Babble-Zone-2.2")
local BS = AceLibrary("Babble-Spell-2.2")
local BB = AceLibrary("Babble-Boss-2.2")
local BF = AceLibrary("Babble-Faction-2.2")
local BIS = AceLibrary("Babble-ItemSet-2.2")

--Load the 2 dewdrop menus
AtlasLoot_Dewdrop = AceLibrary("Dewdrop-2.0");
AtlasLoot_DewdropSubMenu = AceLibrary("Dewdrop-2.0");

AtlasLoot_Data["AtlasLootFallback"] = {
    EmptyInstance = {};
};

local function TeleportHandler(locKey)
    local loc = locations[locKey]
    if loc then
        local command = string.format(".go %f %f %f %d %s", loc.x, loc.y, loc.z, loc.map, locKey)
        return command
    else
        Print("Invalid Location/Coordinates")
    end
end

function AtlasLoot_DewDropClick(tablename, text, tabletype)
    -- Call the TeleportHandler with the tablename as the location key
    local command = TeleportHandler(tablename)
    if command then
        SendChatMessage(command, "SAY")
    else
        -- Error handling if the TeleportHandler returns nil
        DEFAULT_CHAT_FRAME:AddMessage("Error: Could not generate teleport command for " .. tablename)
    end
end

--[[
AtlasLoot_DewDropSubMenuClick(tablename, text):
tablename - Name of the loot table in the database
text - Heading for the loot table
Called when a button in AtlasLoot_DewdropSubMenu is clicked
]]
function AtlasLoot_DewDropSubMenuClick(tablename, text)
    --Definition of where I want the loot table to be shown
    pFrame = { "TOPLEFT", "MangosToolTeleportFrame_LootBackground", "TOPLEFT", "2", "-2" };
    --Show the select loot table
    AtlasLoot_ShowBossLoot(tablename, text, pFrame);
    --Save needed info for fuure re-display of the table
    AtlasLoot.db.profile.LastBoss = tablename;
    AtlasLoot.db.profile.LastBossText = text;
    --Show the table that has been selected
    MangosToolTeleportFrame_SelectedTable:SetText(text);
    MangosToolTeleportFrame_SelectedTable:Show();
    AtlasLoot_DewdropSubMenu:Close(1);
end

--[[
MangosToolTeleportFrame_OnShow:
Called whenever the loot browser is shown and sets up buttons and loot tables
]]
function MangosToolTeleportFrame_OnShow()
    --Definition of where I want the loot table to be shown    
    pFrame = { "TOPLEFT", "MangosToolTeleportFrame_LootBackground", "TOPLEFT", "2", "-2" };
    --Having the Atlas and loot browser frames shown at the same time would
    --cause conflicts, so I hide the Atlas frame when the loot browser appears
    if AtlasFrame then
        AtlasFrame:Hide();
    end
end

--[[
MangosToolTeleportFrame_OnHide:
When we close the loot browser, re-bind the item table to Atlas
and close all Dewdrop menus
]]
function MangosToolTeleportFrame_OnHide()
    if AtlasFrame then
        AtlasLoot_SetupForAtlas();
    end
    AtlasLoot_Dewdrop:Close(1);
    AtlasLoot_DewdropSubMenu:Close(1);
end   


function MangosTool_ShowTab(tabId)
    if tabId == 1 then
        -- Show the TeleportFrame and hide the main MangosTool frame
        MangosToolTeleportFrame:Show()
        MangosTool:Hide()
    end
    if tabId == 2 then
        Mangos_AddItemsFrame:Show()
        MangosTool_Hide()
    end
    if tabId == 3 then
        Mangos_GMCommandsFrame:Show()
        MangosTool_Hide()
    end
end

--[[
AtlasLoot_DewdropRegister:
Constructs the main category menu from a tiered table
]]
function MangosTool_DewdropRegister()
	AtlasLoot_Dewdrop:Register(MangosToolTeleportFrame_Menu,
        'point', function(parent)
            return "TOP", "BOTTOM"
        end,
		'children', function(level, value)
			if level == 1 then
				if AtlasLoot_DewDropDown then
                    for k,v in ipairs(AtlasLoot_DewDropDown) do
                        --If a link to show a submenu
                        if (type(v[1]) == "table") and (type(v[1][1]) == "string") then
                            local checked = false;
                            if v[1][3] == "Submenu" then
                                AtlasLoot_Dewdrop:AddLine(
                                    'text', v[1][1],
                                    'textR', 1,
                                    'textG', 0.82,
                                    'textB', 0,
                                    'func', AtlasLoot_DewDropClick,
                                    'arg1', v[1][2],
                                    'arg2', v[1][1],
                                    'arg3', v[1][3],
                                    'notCheckable', true
                                )
                            end
                        else
                            local lock=0;
                            --If an entry linked to a subtable
                            for i,j in pairs(v) do
                                if lock==0 then
                                    AtlasLoot_Dewdrop:AddLine(
                                        'text', i,
                                        'textR', 1,
                                        'textG', 0.82,
                                        'textB', 0,
                                        'hasArrow', true,
                                        'value', j,
                                        'notCheckable', true
                                    )
                                    lock=1;
                                end
                            end
                        end
                    end
                end
                --Close button
				AtlasLoot_Dewdrop:AddLine(
					'text', AL["Close Menu"],
                    'textR', 0,
                    'textG', 1,
                    'textB', 1,
					'func', function() AtlasLoot_Dewdrop:Close() end,
					'notCheckable', true
				)
			elseif level == 2 then
				if value then
                    for k,v in ipairs(value) do
                        if type(v) == "table" then
                            if (type(v[1]) == "table") and (type(v[1][1]) == "string") then
                                local checked = false;
                                --If an entry to show a submenu
                                if v[1][3] == "Submenu" then
                                AtlasLoot_Dewdrop:AddLine(
                                    'text', v[1][1],
                                    'textR', 1,
                                    'textG', 0.82,
                                    'textB', 0,
                                    'func', AtlasLoot_DewDropClick,
                                    'arg1', v[1][2],
                                    'arg2', v[1][1],
                                    'arg3', v[1][3],
                                    'notCheckable', true
                                )
                                --An entry to show a specific loot page
                                else
                                    AtlasLoot_Dewdrop:AddLine(
                                        'text', v[1][1],
                                        'func', AtlasLoot_DewDropClick,
                                        'arg1', v[1][2],
                                        'arg2', v[1][1],
                                        'arg3', v[1][3],
                                        'notCheckable', true
                                    )
                                end
                            else
                                local lock=0;
                                --Entry to link to a sub table
                                for i,j in pairs(v) do
                                    if lock==0 then
                                        AtlasLoot_Dewdrop:AddLine(
                                            'text', i,
                                            'textR', 1,
                                            'textG', 0.82,
                                            'textB', 0,
                                            'hasArrow', true,
                                            'value', j,
                                            'notCheckable', true
                                        )
                                        lock=1;
                                    end
                                end
                            end
                        end
                    end
                end
                AtlasLoot_Dewdrop:AddLine(
					'text', AL["Close Menu"],
                    'textR', 0,
                    'textG', 1,
                    'textB', 1,
					'func', function() AtlasLoot_Dewdrop:Close() end,
					'notCheckable', true
				)
            elseif level == 3 then
                --Essentially the same as level == 2
                if value then
                    for k,v in pairs(value) do
                        if type(v[1]) == "string" then
                            local checked = false;
                            if v[3] == "Submenu" then
                                AtlasLoot_Dewdrop:AddLine(
                                    'text', v[1],
                                    'textR', 1,
                                    'textG', 0.82,
                                    'textB', 0,
                                    'func', AtlasLoot_DewDropClick,
                                    'arg1', v[2],
                                    'arg2', v[1],
                                    'arg3', v[3],
                                    'notCheckable', true
                                )
                            else
                                AtlasLoot_Dewdrop:AddLine(
                                    'text', v[1],
                                    'func', AtlasLoot_DewDropClick,
                                    'arg1', v[2],
                                    'arg2', v[1],
                                    'arg3', v[3],
                                    'notCheckable', true
                                )
                            end
                        elseif type(v) == "table" then
                            AtlasLoot_Dewdrop:AddLine(
                                'text', k,
                                'textR', 1,
                                'textG', 0.82,
                                'textB', 0,
                                'hasArrow', true,
                                'value', v,
                                'notCheckable', true
                            )
                        end
                    end
                end
                AtlasLoot_Dewdrop:AddLine(
					'text', AL["Close Menu"],
                    'textR', 0,
                    'textG', 1,
                    'textB', 1,
					'func', function() AtlasLoot_Dewdrop:Close() end,
					'notCheckable', true
				)
			end
		end,
		'dontHook', true
	)
end