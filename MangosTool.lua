local MT = AceLibrary("AceLocale-2.2"):new("MangosTool");

local function MangosTool_Toggle()
    if MangosToolAddItemsFrame and MangosToolAddItemsFrame:IsVisible() then
        MangosToolAddItemsFrame:Hide()
    else
        if MangosToolAddItemsFrame then
            MangosToolAddItemsFrame:Show()
        end
    end
end

-- Slash Commands
SLASH_MANGOSTOOL1 = "/mangostool"
SLASH_MANGOSTOOL2 = "/mt"
SLASH_RELOADUI1 = "/rl";

-- Parse Commands
SlashCmdList.RELOADUI = ReloadUI;
SlashCmdList["MANGOSTOOL"] = MangosTool_Toggle

function Print(text)
	DEFAULT_CHAT_FRAME:AddMessage(text)
end

local function OnAddonLoaded(self, event, addonName)
    if addonName == "MangosTool" then
        if MangosToolAddItemsFrame then
            Print("|cffFF8400MangosTool|r loaded. Use /mangostool or /mt to open.")
        else
            Print("|cffff0000MangosTool Error:|r AddItems Frame failed to load.")
        end
    end
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:SetScript("OnEvent", OnAddonLoaded)