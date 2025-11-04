-- ElvUI WarcraftEnhanced Options Integration
-- Adds WarcraftEnhanced to ElvUI config menu

local E, L, V, P, G = unpack(ElvUI)
local WE = E.WarcraftEnhanced

local ACH = E.Libs.ACH

-- Helper function for options
local function GetOptions()
	local options = ACH:Group("WarcraftEnhanced", nil, nil, "tab", function(info) 
		if E.db and E.db.warcraftenhanced then 
			return E.db.warcraftenhanced[info[#info]] 
		end 
	end, function(info, value) 
		if E.db and E.db.warcraftenhanced then 
			E.db.warcraftenhanced[info[#info]] = value 
		end 
	end)
	
	options.args.header = ACH:Header("WarcraftEnhanced - All-in-One Features", 0)
	options.args.description = ACH:Description("Quest Automation (AutoQuest) and Omen Threat Meter integrated into ElvUI.\n\n|cffffcc00Note:|r UI settings (error filtering, auto-delete, camera zoom) are in ElvUI → General → BlizzUI Improvements\nTomTom navigation is now in ElvUI → TomTom", 1)
	
	-- Tab 1: AutoQuest
	options.args.autoQuest = ACH:Group("AutoQuest", nil, 10)
	options.args.autoQuest.args = {
		header = ACH:Header("Automatic Quest Handling", 1),
		autoAccept = ACH:Toggle("Auto Accept All Quests", "Automatically accept all available quests", 2, nil, nil, nil, function(info) return E.db and E.db.warcraftenhanced and E.db.warcraftenhanced.autoAccept or false end, function(info, value)
			if E.db and E.db.warcraftenhanced then
				E.db.warcraftenhanced.autoAccept = value
				if AutoQuestSave then AutoQuestSave.autoAccept = value end
				WE:Print("Auto accept all quests " .. (value and "enabled" or "disabled"))
			end
		end),
		autoDaily = ACH:Toggle("Auto Accept Daily Quests", "Automatically accept daily quests", 3, nil, nil, nil, function(info) return E.db and E.db.warcraftenhanced and E.db.warcraftenhanced.autoDaily or false end, function(info, value)
			if E.db and E.db.warcraftenhanced then
				E.db.warcraftenhanced.autoDaily = value
				if AutoQuestSave then AutoQuestSave.autoDaily = value end
				WE:Print("Auto accept dailies " .. (value and "enabled" or "disabled"))
			end
		end),
		autoFate = ACH:Toggle("Auto Accept Fate Quests", "Automatically accept Hand of Fate leveling quests", 4, nil, nil, nil, function(info) return E.db and E.db.warcraftenhanced and E.db.warcraftenhanced.autoFate or false end, function(info, value)
			if E.db and E.db.warcraftenhanced then
				E.db.warcraftenhanced.autoFate = value
				if AutoQuestSave then AutoQuestSave.autoFate = value end
				WE:Print("Auto accept fate quests " .. (value and "enabled" or "disabled"))
			end
		end),
		autoRepeat = ACH:Toggle("Auto Accept Repeatable Quests", "Automatically accept repeatable quests if you have the required items", 5, nil, nil, nil, function(info) return E.db and E.db.warcraftenhanced and E.db.warcraftenhanced.autoRepeat or false end, function(info, value)
			if E.db and E.db.warcraftenhanced then
				E.db.warcraftenhanced.autoRepeat = value
				if AutoQuestSave then AutoQuestSave.autoRepeat = value end
				WE:Print("Auto accept repeatables " .. (value and "enabled" or "disabled"))
			end
		end),
		autoComplete = ACH:Toggle("Auto Complete Quests", "Automatically complete and turn in quests", 6, nil, nil, nil, function(info) return E.db and E.db.warcraftenhanced and E.db.warcraftenhanced.autoComplete or false end, function(info, value)
			if E.db and E.db.warcraftenhanced then
				E.db.warcraftenhanced.autoComplete = value
				if AutoQuestSave then AutoQuestSave.autoComplete = value end
				WE:Print("Auto complete quests " .. (value and "enabled" or "disabled"))
			end
		end),
		autoHighRisk = ACH:Toggle("Auto Accept High-Risk Quests", "Automatically accept high-risk quests (Bloody Expedition, etc.)", 7, nil, nil, nil, function(info) return E.db and E.db.warcraftenhanced and E.db.warcraftenhanced.autoHighRisk or false end, function(info, value)
			if E.db and E.db.warcraftenhanced then
				E.db.warcraftenhanced.autoHighRisk = value
				if AutoQuestSave then AutoQuestSave.autoHR = value end
				WE:Print("Auto accept high-risk quests " .. (value and "enabled" or "disabled"))
			end
		end),
		spacer1 = ACH:Description("\n|cffFFFF00Note:|r Hold any modifier key (Shift/Ctrl/Alt) when talking to NPCs to temporarily disable AutoQuest.", 8),
		spacer2 = ACH:Description("\n|cffffcc00Advanced:|r Use |cffffcc00/aq toggle <quest name>|r to enable/disable specific quests.", 9),
	}
	
	-- Tab 2: Omen Threat Meter
	options.args.omen = ACH:Group("Omen Threat Meter", nil, 20)
	options.args.omen.args = {
		header = ACH:Header("Threat Meter Window", 1),
		description = ACH:Description("Omen provides a customizable threat window to track threat levels. ElvUI's threat display is nameplate-based, but Omen gives you a dedicated window with full customization options.", 2),
		showOmen = ACH:Toggle("Show Omen", "Show or hide the Omen threat meter window", 3, nil, nil, nil, function(info)
			if Omen and Omen.Anchor then
				return Omen.Anchor:IsShown()
			end
			return false
		end, function(info, value)
			if Omen then
				if value then
					if Omen.Show then Omen:Show() end
				else
					if Omen.Hide then Omen:Hide() end
				end
				WE:Print("Omen " .. (value and "shown" or "hidden"))
			end
		end),
		lockOmen = ACH:Toggle("Lock Omen", "Lock/unlock the Omen window position", 4, nil, nil, nil, function(info)
			if Omen and Omen.db and Omen.db.profile then
				return Omen.db.profile.Locked
			end
			return false
		end, function(info, value)
			if Omen and Omen.db and Omen.db.profile then
				Omen.db.profile.Locked = value
				if Omen.UpdateGrips then Omen:UpdateGrips() end
				WE:Print("Omen " .. (value and "locked" or "unlocked"))
			end
		end),
		resetPosition = ACH:Execute("Reset Position", "Reset Omen's window position to center of screen", 5, function()
			if Omen and Omen.ResetAnchor then
				Omen:ResetAnchor()
				WE:Print("Omen position reset")
			end
		end),
		spacer = ACH:Description("\n|cffffcc00Omen Commands:|r\n/omen - Configuration\n/omen toggle - Show/hide", 6),
		openFullOptions = ACH:Execute("Open Full Omen Options", "Opens Omen's complete configuration panel with all customization options", 7, function()
			if Omen and Omen.ShowConfig then 
				Omen:ShowConfig()
			elseif Omen and InterfaceOptionsFrame_OpenToCategory then
				InterfaceOptionsFrame_OpenToCategory("Omen")
				InterfaceOptionsFrame_OpenToCategory("Omen")
			end
		end),
		quickSettings = ACH:Group("Quick Settings", nil, 8),
	}
	
	options.args.omen.args.quickSettings.args = {
		header = ACH:Header("Quick Customization", 1),
		description = ACH:Description("Common Omen settings. Use 'Open Full Omen Options' for complete customization.", 2),
		Autocollapse = ACH:Toggle("Auto-Collapse", "Automatically collapse Omen when not in combat", 3, nil, nil, nil, function(info)
			if Omen and Omen.db and Omen.db.profile then
				return Omen.db.profile.Autocollapse
			end
			return false
		end, function(info, value)
			if Omen and Omen.db and Omen.db.profile then
				Omen.db.profile.Autocollapse = value
				if Omen.Update then Omen:Update() end
				WE:Print("Auto-Collapse " .. (value and "enabled" or "disabled"))
			end
		end),
		CollapseHide = ACH:Toggle("Hide When Collapsed", "Hide Omen completely when collapsed", 4, nil, nil, nil, function(info)
			if Omen and Omen.db and Omen.db.profile then
				return Omen.db.profile.CollapseHide
			end
			return false
		end, function(info, value)
			if Omen and Omen.db and Omen.db.profile then
				Omen.db.profile.CollapseHide = value
				if Omen.Update then Omen:Update() end
				WE:Print("Hide When Collapsed " .. (value and "enabled" or "disabled"))
			end
		end),
		UseFocus = ACH:Toggle("Use Focus Target", "Track threat on focus target instead of current target", 5, nil, nil, nil, function(info)
			if Omen and Omen.db and Omen.db.profile then
				return Omen.db.profile.UseFocus
			end
			return false
		end, function(info, value)
			if Omen and Omen.db and Omen.db.profile then
				Omen.db.profile.UseFocus = value
				if Omen.Update then Omen:Update() end
				WE:Print("Use Focus Target " .. (value and "enabled" or "disabled"))
			end
		end),
		IgnorePlayerPets = ACH:Toggle("Ignore Player Pets", "Don't show player pets in threat list", 6, nil, nil, nil, function(info)
			if Omen and Omen.db and Omen.db.profile then
				return Omen.db.profile.IgnorePlayerPets
			end
			return false
		end, function(info, value)
			if Omen and Omen.db and Omen.db.profile then
				Omen.db.profile.IgnorePlayerPets = value
				if Omen.Update then Omen:Update() end
				WE:Print("Ignore Player Pets " .. (value and "enabled" or "disabled"))
			end
		end),
	}
	
	-- Tab 3: PortalBox
	options.args.portalbox = ACH:Group("PortalBox", nil, 30)
	options.args.portalbox.args = {
		header = ACH:Header("Teleport and Portal Spell Manager", 1),
		description = ACH:Description("PortalBox provides quick access to all your teleport and portal spells.\n\nUse |cffffcc00/port|r or |cffffcc00/portalbox|r to toggle the spell selection window.", 2),
		openPortalBox = ACH:Execute("Open PortalBox Window", "Open the PortalBox spell selection window", 3, function()
			if portalbox_toggle then portalbox_toggle() end
		end),
		hideMMIcon = ACH:Toggle("Hide Minimap Button", "Hide the PortalBox minimap button", 4, nil, nil, nil, function(info)
			return HideMMIcon == "1"
		end, function(info, value)
			HideMMIcon = value and "1" or "0"
			if value then
				if PortalBox_MinimapButton then PortalBox_MinimapButton:Hide() end
				if PortalBox_MinimapButtonUnbound then PortalBox_MinimapButtonUnbound:Hide() end
			else
				if MinimapButtonUnbind == "0" and PortalBox_MinimapButton then
					PortalBox_MinimapButton:Show()
				elseif PortalBox_MinimapButtonUnbound then
					PortalBox_MinimapButtonUnbound:Show()
				end
			end
		end),
	}
	
	-- Tab 4: Commands Reference
	options.args.commands = ACH:Group("Commands", nil, 40)
	options.args.commands.args = {
		header = ACH:Header("Available Commands", 1),
		commandsList = ACH:Description(
			"|cff1784d1WarcraftEnhanced Commands:|r\n" ..
			"  |cffffcc00/we|r - Open ElvUI options to this section\n\n" ..
			"|cff1784d1AutoQuest Commands:|r\n" ..
			"  |cffffcc00/aq accept <on|off>|r - Toggle auto-accepting\n" ..
			"  |cffffcc00/aq daily <on|off>|r - Toggle dailies\n" ..
			"  |cffffcc00/aq complete <on|off>|r - Toggle auto-complete\n\n" ..
			"|cff1784d1PortalBox Commands:|r\n" ..
			"  |cffffcc00/port|r - Toggle window\n\n" ..
			"|cff1784d1Omen Commands:|r\n" ..
			"  |cffffcc00/omen|r - Open configuration\n" ..
			"  |cffffcc00/omen toggle|r - Show/hide window\n\n" ..
			"|cffffcc00Note:|r Automation settings (auto-repair, auto-sell junk, etc.) are in ElvUI → General → Automation\nTomTom navigation is now in ElvUI → TomTom", 2
		),
	}
	
	return options
end

-- Insert options into ElvUI
function WE:InsertOptions()
	E.Options.args.warcraftenhanced = GetOptions()
end

-- Insert options when ElvUI_OptionsUI loads
local function InsertOptions()
	WE:InsertOptions()
end

-- Use the proper ElvUI initialization hook
if IsAddOnLoaded("ElvUI_OptionsUI") then
	InsertOptions()
else
	local frame = CreateFrame("Frame")
	frame:RegisterEvent("ADDON_LOADED")
	frame:SetScript("OnEvent", function(self, event, addon)
		if addon == "ElvUI_OptionsUI" then
			InsertOptions()
			self:UnregisterEvent("ADDON_LOADED")
		end
	end)
end

