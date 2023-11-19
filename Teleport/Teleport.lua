

local function TeleportHandler(locKey)
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

-- Slash Commands
SLASH_TELEPORT1 = '/teleport'
SLASH_TOGGLETPUI1 = "/mangostool"
-- Parse Commands
SlashCmdList["TELEPORT"] = TeleportHandler
SlashCmdList["TOGGLETPUI"] = MangosTool_Toggle

-- Function to filter location buttons
function Teleport:Search(filterText)
    filterText = filterText:lower()
    local index = 1
    local yOffset = -10
    for name, _ in pairs(locations) do
        local button = _G["LocationButton" .. index]
        if button then
            if name:lower():find(filterText) then
                button:SetPoint("TOPLEFT", scrollChild, "TOPLEFT", 10, yOffset)
                button:Show()
                yOffset = yOffset - 25
            else
                button:Hide()
            end
            index = index + 1
        end
    end
    scrollChild:SetHeight(math.abs(yOffset))
end

-- Function to create a button for each location
local function CreateLocationButton(name, index)
    local button = CreateFrame("Button", "LocationButton" .. index, scrollChild, "UIPanelButtonTemplate")
    button:SetWidth(240)
    button:SetHeight(20)
    button:SetText(name)

    -- Simple positioning for diagnostic purposes
    button:SetPoint("TOPLEFT", scrollChild, "TOPLEFT", 10, -10 - (index - 1) * 25)

    button:SetScript("OnClick", function()
        SendChatMessage(TeleportHandler(name), "SAY")
    end)

    return button
end

-- Populate buttons
local index = 1
for name, _ in pairs(locations) do
    CreateLocationButton(name, index)
    index = index + 1
end

-- Set the scrollChild's height based on the number of buttons
scrollChild:SetHeight(index * 25)
FilterLocationButtons("")  -- Passing an empty string will show all locations

-- Make sure scrollChild is properly sized and attached to scrollFrame
scrollFrame:SetScrollChild(scrollChild)