local MD = AceLibrary("AceLocale-2.2"):new("MangosTool");


local function OnAddonLoaded(self, event, addonName)
    if addonName == "MangosTool" then
        if MangosTool_TeleportFrame then
            Print("Teleport Frame is loaded and shown.")
        else
            Print("Teleport Frame is nil.")
        end
    end
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:SetScript("OnEvent", OnAddonLoaded)

local function MangosTool_Toggle()
    if (MangosTool:IsVisible()) then
        MangosTool:Hide()
    else
        MangosTool:Show()
    end
end

-- Slash Commands
SLASH_TOGGLETPUI1 = "/mangostool"
SLASH_RELOADUI1 = "/rl";
-- Parse Commands
SlashCmdList.RELOADUI = ReloadUI;
SlashCmdList["TOGGLETPUI"] = MangosTool_Toggle

function Print(text)
	DEFAULT_CHAT_FRAME:AddMessage(text)
end

function MangosTool_OnCloseButton()
	--Hide the item frame
	MangosTool:Hide();
end

function MangosTool_ShowTab(tabId)
    if tabId == 1 then
        -- Show the TeleportFrame and hide the main MangosTool frame
        MangosTool_TeleportFrame:Show()
        MangosTool:Hide()
    end
end

MD:RegisterTranslations("enUS", function() return {
    Tab1 = "Teleport",
    Tab2 = "Add Items",
    Tab3 = "GM Commands",
    Search = "Search",
} end)