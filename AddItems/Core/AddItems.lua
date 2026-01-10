local MT = AceLibrary("AceLocale-2.2"):new("MangosTool");

--Instance required libraries
local AL = AceLibrary("AceLocale-2.2"):new("AtlasLoot");
local BC = AceLibrary("Babble-Class-2.2")
local BZ = AceLibrary("Babble-Zone-2.2")
local BS = AceLibrary("Babble-Spell-2.2")
local BB = AceLibrary("Babble-Boss-2.2")
local BF = AceLibrary("Babble-Faction-2.2")
local BIS = AceLibrary("Babble-ItemSet-2.2")

--Establish version number
local VERSION_MAJOR = "2";
local VERSION_MINOR = "0";
ATLASLOOT_VERSION = "|cffFF8400MangosTool v"..VERSION_MAJOR.."."..VERSION_MINOR.."|r";

--Standard indent to line text up with Atlas text
ATLASLOOT_INDENT = "   ";

--Make the Dewdrop menu in the standalone loot browser accessible here
AtlasLoot_Dewdrop = AceLibrary("Dewdrop-2.0");
AtlasLoot_DewdropSubMenu = AceLibrary("Dewdrop-2.0");
AtlasLoot_ItemContextMenu = AceLibrary("Dewdrop-2.0");

--Variable to cap debug spam
ATLASLOOT_DEBUGSHOWN = false;

--Set the default anchor for the loot frame
AtlasLoot_AnchorFrame = MangosToolAddItemsFrame;

-- Translations
MT:RegisterTranslations("enUS", function() return {
    ["MangosTool"] = "MangosTool",
    ["Add Items"] = "Add Items",
} end )

-- Don't create our own AtlasLoot instance - use the existing one from the AtlasLoot addon
-- Just ensure the variables we need are set up
if not AtlasLoot then
    Print("|cffff0000MangosTool Error:|r AtlasLoot addon is required but not loaded!")
end

function MangosTool_Hide()
    if MangosToolAddItemsFrame then
        MangosToolAddItemsFrame:Hide()
    end
end

-- Item click handlers
function MangosTool_OnItemLeftClick(itemLink, itemID)
    if not itemID then
        Print("|cffff0000MangosTool Error:|r Invalid item ID")
        return
    end
    
    -- Validate itemID is numeric to prevent command injection
    local numericID = tonumber(itemID)
    if not numericID or numericID <= 0 then
        Print("|cffff0000MangosTool Error:|r Invalid item ID format")
        return
    end
    
    -- Generate the item in player's backpack using .additem command
    -- GM commands in Vanilla should be sent to SAY chat
    local command = string.format(".additem %d 1", numericID)
    local success, err = pcall(function()
        SendChatMessage(command, "SAY")
    end)
    
    if success then
        Print("|cff00ff00Item generated:|r " .. (itemLink or "Item " .. numericID))
    else
        Print("|cffff0000MangosTool Error:|r Failed to send command - " .. tostring(err))
    end
end

-- Local storage for context menu item (safer than global)
local MangosToolContextItem = nil

function MangosTool_OnItemRightClick(button, itemLink, itemID)
    if not itemID or not itemLink then
        return
    end
    
    -- Close any existing context menu
    if AtlasLoot_ItemContextMenu:IsOpen() then
        AtlasLoot_ItemContextMenu:Close()
    end
    
    -- Store item info for the menu (local variable, not global)
    MangosToolContextItem = {
        link = itemLink,
        id = itemID
    }
    
    -- Open context menu for item
    AtlasLoot_ItemContextMenu:Register(button,
        'point', function(parent)
            return "TOPLEFT", "BOTTOMLEFT"
        end,
        'children', function(level, value)
            if level == 1 then
                AtlasLoot_ItemContextMenu:AddLine(
                    'text', itemLink,
                    'isTitle', true
                )
                AtlasLoot_ItemContextMenu:AddLine(
                    'text', "Add to my backpack",
                    'icon', "Interface\\Icons\\INV_Misc_Bag_08",
                    'closeWhenClicked', true,
                    'func', function()
                        MangosTool_OnItemLeftClick(itemLink, itemID)
                    end
                )
                AtlasLoot_ItemContextMenu:AddLine(
                    'text', "Give to player",
                    'icon', "Interface\\Icons\\INV_Misc_Gift_01",
                    'hasArrow', true,
                    'value', 'giveToPlayer'
                )
            elseif level == 2 and value == 'giveToPlayer' then
                -- Submenu for entering player name
                AtlasLoot_ItemContextMenu:AddLine(
                    'text', 'Enter player name:',
                    'isTitle', true
                )
                AtlasLoot_ItemContextMenu:AddLine(
                    'text', 'Player Name',
                    'hasEditBox', true,
                    'editBoxText', '',
                    'editBoxFunc', function(text)
                        if text and text ~= "" and MangosToolContextItem then
                            MangosTool_GiveItemToPlayer(MangosToolContextItem.link, MangosToolContextItem.id, text)
                        end
                    end
                )
            end
        end,
        'dontHook', true
    )
    AtlasLoot_ItemContextMenu:Open(button)
end

function MangosTool_GiveItemToPlayer(itemLink, itemID, playerName)
    if not playerName or playerName == "" then
        Print("|cffff0000Error:|r Please enter a player name")
        return
    end
    
    if not itemID then
        Print("|cffff0000Error:|r Invalid item ID")
        return
    end
    
    -- Validate itemID is numeric to prevent command injection
    local numericID = tonumber(itemID)
    if not numericID or numericID <= 0 then
        Print("|cffff0000MangosTool Error:|r Invalid item ID format")
        return
    end
    
    -- Sanitize player name (alphanumeric only)
    local sanitizedName = string.gsub(playerName, "[^%w]", "")
    if sanitizedName ~= playerName then
        Print("|cffff0000Error:|r Invalid player name (alphanumeric only)")
        return
    end
    
    -- Use .additem command with player name
    -- GM commands in Vanilla should be sent to SAY chat
    local command = string.format(".additem %d 1 %s", numericID, sanitizedName)
    local success, err = pcall(function()
        SendChatMessage(command, "SAY")
    end)
    
    if success then
        Print("|cff00ff00Item sent to " .. sanitizedName .. ":|r " .. (itemLink or "Item " .. numericID))
    else
        Print("|cffff0000MangosTool Error:|r Failed to send command - " .. tostring(err))
    end
    
    -- Close the context menu
    if AtlasLoot_ItemContextMenu and AtlasLoot_ItemContextMenu:IsOpen() then
        AtlasLoot_ItemContextMenu:Close()
    end
end

function Print(text)
    DEFAULT_CHAT_FRAME:AddMessage(text)
end
