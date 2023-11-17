local function Print(text)
	DEFAULT_CHAT_FRAME:AddMessage(text)
end

local function TeleportHandler(locKey)
    local loc = locations[locKey]
    if loc then
        local command = string.format(".go %f %f %f %d %s", loc.x, loc.y, loc.z, loc.map, locKey)
        Print("Teleport Command: " .. command)
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
TeleportFrame:SetWidth(300)
TeleportFrame:SetHeight(300)
TeleportFrame:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", 
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border", 
    tile = true, tileSize = 32, edgeSize = 32, 
    insets = { left = 8, right = 8, top = 8, bottom = 8 }
})
TeleportFrame:SetBackdropColor(0,0,0,1)
TeleportFrame:Show()

-- Create the StormwindButton
local StormwindButton = CreateFrame("Button", "StormwindButton", TeleportFrame)
-- Button setup code
StormwindButton:SetScript("OnClick", function()
    TeleportHandler("stormwind")
end)

-- Create a FontString for the Stormwind button
local buttonText = StormwindButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
buttonText:SetFont("Fonts\\FRIZQT__.TTF", 12)
buttonText:SetPoint("CENTER", StormwindButton, "CENTER")
buttonText:SetJustifyH("CENTER")
buttonText:SetJustifyV("MIDDLE")
buttonText:SetText("Stormwind")

StormwindButton:SetFontString(buttonText)

StormwindButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-Button-Up")
StormwindButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-Button-Down")
StormwindButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")

StormwindButton:SetScript("OnClick", function()
    TeleportHandler("stormwind")
end)

-- Create the TPButton
local TPButton = CreateFrame("Button", "TPButton", TeleportFrame)
TPButton:SetWidth(100)
TPButton:SetHeight(40)
TPButton:SetPoint("TOPRIGHT", TeleportFrame, "TOPRIGHT", -10, -10)

-- Create a FontString for the TP button
local tpButtonText = TPButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
tpButtonText:SetFont("Fonts\\FRIZQT__.TTF", 12)
tpButtonText:SetPoint("CENTER", TPButton, "CENTER")
tpButtonText:SetJustifyH("CENTER")
tpButtonText:SetJustifyV("MIDDLE")
tpButtonText:SetText("Teleport")

TPButton:SetFontString(tpButtonText)

TPButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-Button-Up")
TPButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-Button-Down")
TPButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")

TPButton:SetScript("OnClick", function()
    -- Add the functionality for the TP button here
end)


-- Create a Scroll Frame
local scrollFrame = CreateFrame("ScrollFrame", "TeleportScrollFrame", TeleportFrame, "UIPanelScrollFrameTemplate")
scrollFrame:SetPoint("TOPLEFT", TeleportFrame, "TOPLEFT", 10, -60)
scrollFrame:SetPoint("BOTTOMRIGHT", TeleportFrame, "BOTTOMRIGHT", -30, 10)

-- Create a Scroll Child Frame
local scrollChild = CreateFrame("Frame", "TeleportScrollChild", scrollFrame)
scrollFrame:SetScrollChild(scrollChild)
scrollChild:SetWidth(260)
scrollChild:SetHeight(400)

-- Function to create a button for each location
local function CreateLocationButton(name, index)
    local button = CreateFrame("Button", "LocationButton" .. index, scrollChild, "UIPanelButtonTemplate")
    -- Button setup code
    button:SetScript("OnClick", function()
        TeleportHandler(name)
    end)
    return button
end

-- Initialize index
local index = 1

-- Populate the scrollable area with buttons
local yOffset = -10  -- Start offset
for name, _ in pairs(locations) do
    local button = CreateLocationButton(name, index)
    button:SetPoint("TOPLEFT", scrollChild, "TOPLEFT", 10, yOffset)
    yOffset = yOffset - 25  -- Adjust the Y offset for each new button
    index = index + 1  -- Increment index for each location
end

-- Adjust the size of the scroll child to accommodate the content
scrollChild:SetHeight(math.abs(yOffset))