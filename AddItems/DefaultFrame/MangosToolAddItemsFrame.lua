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
    local hooked = 0
    for i = 1, 30 do
        local buttonName = "AtlasLootMenuItem_" .. i
        local button = getglobal(buttonName)
        
        if button and not button.mangosToolHooked then
            local success, err = pcall(function()
                -- Store original script
                local originalOnEnter = button:GetScript("OnEnter")
                local originalOnLeave = button:GetScript("OnLeave")
                
                -- Add click handlers
                button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
                
                button:SetScript("OnClick", function()
                    local nameFrame = getglobal(buttonName .. "_Name")
                    local itemLink = nameFrame and nameFrame:GetText() or nil
                    local itemID = this.itemID or MangosTool_ExtractItemID(itemLink)
                    
                    if not itemLink or not itemID then
                        Print("|cffff0000MangosTool Error:|r Unable to identify item")
                        return
                    end
                    
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
                hooked = hooked + 1
            end)
            
            if not success then
                Print("|cffff0000MangosTool Error:|r Failed to hook button " .. buttonName .. " - " .. tostring(err))
            end
        end
    end
    
    if hooked > 0 then
        -- Only print debug message if we actually hooked buttons
        -- Print("|cff00ff00MangosTool:|r Hooked " .. hooked .. " item buttons")
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
-- This ensures our click handlers are reapplied when AtlasLoot shows new items
if AtlasLoot_ShowItemsFrame then
    local originalShowItemsFrame = AtlasLoot_ShowItemsFrame
    AtlasLoot_ShowItemsFrame = function(...)
        local success, err = pcall(function()
            originalShowItemsFrame(unpack(arg))
        end)
        if not success then
            Print("|cffff0000MangosTool Error:|r Failed to show items - " .. tostring(err))
        end
        -- Re-hook buttons after items are shown
        MangosTool_HookAtlasLootButtons()
    end
else
    -- If AtlasLoot_ShowItemsFrame doesn't exist, try to hook it on frame show
    Print("|cffFF8400MangosTool:|r AtlasLoot_ShowItemsFrame not found. Will attempt to hook on frame show.")
end

