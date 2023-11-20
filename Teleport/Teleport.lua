local AL = AceLibrary("AceLocale-2.2"):new("MangosTool");

local function TeleportHandler(locKey)
    -- Assuming 'locations' is a table defined elsewhere with location data
    local loc = locations[locKey]
    if loc then
        local command = string.format(".go %f %f %f %d %s", loc.x, loc.y, loc.z, loc.map, locKey)
        return command
    else
        Print("Invalid Location/Coordinates")
    end
end

local function MangosTool_Toggle()
    if (TeleportFrame:IsVisible()) then
        TeleportFrame:Hide()
    else
        TeleportFrame:Show()
    end
end

-- Function to filter location buttons
function FilterText(filterText)
    filterText = filterText:lower()
    local index = 1
    local yOffset = -10
    for name, _ in pairs(locations) do
        local button = _G["LocationButton" .. index]
        if button then
            if name:lower():find(filterText) then
                button:SetPoint("TOP", TeleportScrollChildFrame, "TOP", 20, -50 - (index - 1) * 20)
                button:Show()
                yOffset = yOffset - 25
            else
                button:Hide()
            end
            index = index + 1
        end
    end
    TeleportScrollChildFrame:SetHeight(math.abs(yOffset))
end


-- Function to create a button for each location
function CreateLocationButton(name, index)
    local button = CreateFrame("Button", "LocationButton" .. index, TeleportScrollChildFrame, "UIPanelButtonTemplate")
    button:SetWidth(240)
    button:SetHeight(20)
    button:SetText(name)

    button:SetPoint("TOP", TeleportScrollChildFrame, "TOP", 20, -50 - (index - 1) * 20)

    button:SetScript("OnClick", function()
        SendChatMessage(TeleportHandler(name), "SAY")
    end)

    return button
end


function MangosTool_OnCloseButton()
	--Hide the item frame
	MangosTool:Hide();
end

SLASH_TELEPORT1 = '/teleport'
SLASH_RELOADUI1 = "/rl";
SLASH_TOGGLETPUI1 = "/mangostool"

SlashCmdList.RELOADUI = ReloadUI;
SlashCmdList["TELEPORT"] = TeleportHandler
SlashCmdList["TOGGLETPUI"] = MangosTool_Toggle

local function OnAddonLoaded(self, event, addonName)
    if addonName == "MangosTool" then
        local index = 1
        for name, _ in pairs(locations) do
            CreateLocationButton(name, index)
            index = index + 1
        end
        local totalHeight = index * 20
        TeleportScrollChildFrame:SetHeight(totalHeight)

        TeleportScrollFrame:SetScrollChild(TeleportScrollChildFrame)
    end
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:SetScript("OnEvent", OnAddonLoaded)