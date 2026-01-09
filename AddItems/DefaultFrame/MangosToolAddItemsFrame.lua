-- MangosToolAddItemsFrame event handlers and hooks

function MangosToolAddItemsFrame_OnShow()
    -- Hook into AtlasLoot item buttons when frame is shown
    MangosTool_HookAtlasLootButtons()
end

function MangosToolAddItemsFrame_OnHide()
    -- Clean up when frame is hidden
    if AtlasLoot_Dewdrop and AtlasLoot_Dewdrop:IsOpen() then
        AtlasLoot_Dewdrop:Close()
    end
    if AtlasLoot_DewdropSubMenu and AtlasLoot_DewdropSubMenu:IsOpen() then
        AtlasLoot_DewdropSubMenu:Close()
    end
    if AtlasLoot_ItemContextMenu and AtlasLoot_ItemContextMenu:IsOpen() then
        AtlasLoot_ItemContextMenu:Close()
    end
end

-- Hook into AtlasLoot item buttons to add our click handlers
function MangosTool_HookAtlasLootButtons()
    -- AtlasLoot creates item buttons with names like "AtlasLootMenuItem_1", "AtlasLootMenuItem_2", etc.
    -- We need to hook into their OnClick scripts
    for i = 1, 30 do
        local buttonName = "AtlasLootMenuItem_" .. i
        local button = getglobal(buttonName)
        
        if button and not button.mangosToolHooked then
            -- Store original script
            local originalOnEnter = button:GetScript("OnEnter")
            local originalOnLeave = button:GetScript("OnLeave")
            
            -- Add click handlers
            button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
            
            button:SetScript("OnClick", function()
                local itemLink = getglobal(buttonName .. "_Name"):GetText()
                local itemID = this.itemID or MangosTool_ExtractItemID(itemLink)
                
                if arg1 == "LeftButton" then
                    -- Left click - add item to backpack
                    MangosTool_OnItemLeftClick(itemLink, itemID)
                elseif arg1 == "RightButton" then
                    -- Right click - show context menu
                    MangosTool_OnItemRightClick(this, itemLink, itemID)
                end
            end)
            
            -- Enhanced OnEnter for visual feedback
            button:SetScript("OnEnter", function()
                if originalOnEnter then
                    originalOnEnter()
                end
                -- Add highlight
                if getglobal(buttonName .. "_Texture") then
                    getglobal(buttonName .. "_Texture"):SetAlpha(0.8)
                end
            end)
            
            button:SetScript("OnLeave", function()
                if originalOnLeave then
                    originalOnLeave()
                end
                -- Remove highlight
                if getglobal(buttonName .. "_Texture") then
                    getglobal(buttonName .. "_Texture"):SetAlpha(1.0)
                end
                -- Close context menu if open
                if AtlasLoot_ItemContextMenu and AtlasLoot_ItemContextMenu:IsOpen() then
                    AtlasLoot_ItemContextMenu:Close()
                end
            end)
            
            button.mangosToolHooked = true
        end
    end
end

-- Extract item ID from item link
function MangosTool_ExtractItemID(itemLink)
    if not itemLink then return nil end
    
    -- Item links have format: |cffffffff|Hitem:12345:0:0:0|h[Item Name]|h|r
    local _, _, itemID = string.find(itemLink, "item:(%d+)")
    return itemID
end

-- Hook into AtlasLoot's ShowItemsFrame function to ensure our hooks are applied
local originalShowItemsFrame = AtlasLoot_ShowItemsFrame
if originalShowItemsFrame then
    AtlasLoot_ShowItemsFrame = function(...)
        originalShowItemsFrame(unpack(arg))
        -- Re-hook buttons after items are shown
        MangosTool_HookAtlasLootButtons()
    end
end
