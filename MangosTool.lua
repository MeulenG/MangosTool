local MD = AceLibrary("AceLocale-2.2"):new("MyAddon");

SLASH_RELOADUI1 = "/rl";
SlashCmdList.RELOADUI = ReloadUI;

function Print(text)
	DEFAULT_CHAT_FRAME:AddMessage(text)
end

function MyMod_ShowMessage()
    message("Hello World!");
end

function MyAddon_OnCloseButton()
	--Hide the item frame
	MyAddon:Hide();
end

function MyAddon_ShowTab(tabId)
    local teleportFrame = _G["MyAddon_TeleportFrame"]
    local addItemsFrame = _G["MyAddon_AddItemsFrame"]
    local gmCommandsFrame = _G["MyAddon_GMCommandsFrame"]

    if teleportFrame and addItemsFrame and gmCommandsFrame then
        teleportFrame:SetShown(tabId == 1)
        addItemsFrame:SetShown(tabId == 2)
        gmCommandsFrame:SetShown(tabId == 3)
    else
        Print("One or more frames are nil.")
    end
end

MD:RegisterTranslations("enUS", function() return {
    Tab1 = "Teleport",
    Tab2 = "Add Items",
    Tab3 = "GM Commands",
} end)

local function OnAddonLoaded(self, event, addonName)
    if addonName == "MyAddon" then
        local teleportFrame = _G["MyAddon_TeleportFrame"]
        local addItemsFrame = _G["MyAddon_AddItemsFrame"]
        local gmCommandsFrame = _G["MyAddon_GMCommandsFrame"]

        if teleportFrame and addItemsFrame and gmCommandsFrame then
            Print("All frames loaded successfully.")
        else
            Print("One or more frames are nil.")
        end
    end
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:SetScript("OnEvent", OnAddonLoaded)