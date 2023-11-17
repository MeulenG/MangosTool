local function Print(text)
	DEFAULT_CHAT_FRAME:AddMessage(text)
end

local function TeleportHandler(locKey)
    local loc = locations[locKey]
    if loc then
        local command = string.format(".go %f %f %f %d %s", loc.x, loc.y, loc.z, loc.map, locKey)
        return command
    else
        Print("Invalid Location/Coordinates")
    end
end

local function ToggleTeleportFrame()
    if TeleportFrame:IsVisible() then
        TeleportFrame:Hide()
    else
        TeleportFrame:Show()
    end
end

-- Slash Commands
SLASH_TELEPORT1 = '/teleport'
SLASH_RELOADUI1 = "/rl";
SLASH_TOGGLETPUI1 = "/tptoggle"
-- Parse Commands
SlashCmdList.RELOADUI = ReloadUI;
SlashCmdList["TELEPORT"] = TeleportHandler
SlashCmdList["TOGGLETPUI"] = ToggleTeleportFrame


-- Create the TeleportFrame
local TeleportFrame = CreateFrame("Frame", "TeleportFrame", UIParent)
TeleportFrame:SetPoint("CENTER", UIParent, "CENTER")
TeleportFrame:SetWidth(500)
TeleportFrame:SetHeight(500)
TeleportFrame:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", 
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border", 
    tile = true, tileSize = 32, edgeSize = 32, 
    insets = { left = 8, right = 8, top = 8, bottom = 8 }
})
TeleportFrame:SetBackdropColor(0,0,0,1)
TeleportFrame:Show()

-- Create a Scroll Frame
local scrollFrame = CreateFrame("ScrollFrame", "TeleportScrollFrame", TeleportFrame, "UIPanelScrollFrameTemplate")
scrollFrame:SetPoint("TOPLEFT", TeleportFrame, "TOPLEFT", 10, -60)
scrollFrame:SetPoint("BOTTOMRIGHT", TeleportFrame, "BOTTOMRIGHT", -30, 10)

-- Create a Scroll Child Frame
local scrollChild = CreateFrame("Frame", "TeleportScrollChild", scrollFrame)
scrollFrame:SetScrollChild(scrollChild)
scrollChild:SetWidth(260)
scrollChild:SetHeight(400)

-- Function to filter location buttons
local function FilterLocationButtons(filterText)
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

-- Create a search bar (EditBox)
local searchBar = CreateFrame("EditBox", "LocationSearchBar", TeleportFrame, "InputBoxTemplate")
searchBar:SetWidth(200)
searchBar:SetHeight(20)
searchBar:SetPoint("TOP", TeleportFrame, "TOP", 0, -30)  -- Position at the top of the frame
searchBar:SetAutoFocus(false)  -- Prevent the box from automatically focusing
searchBar:SetScript("OnTextChanged", function(self)
    FilterLocationButtons(self:GetText())  -- Function to filter buttons based on search
end)

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