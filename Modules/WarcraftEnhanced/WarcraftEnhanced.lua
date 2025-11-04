-- ElvUI WarcraftEnhanced Module
-- Integrates WarcraftEnhanced features into ElvUI

local E, L, V, P, G = unpack(ElvUI)
local WE = E:NewModule("WarcraftEnhanced", "AceHook-3.0", "AceEvent-3.0", "AceTimer-3.0")

-- Make module globally accessible
E.WarcraftEnhanced = WE
_G.WarcraftEnhanced = WE
_G.QuestHelper = WE -- Backwards compatibility

-- Version
WE.version = "2.0.0-ElvUI"
WE.modules = {}

-- Initialize defaults in ElvUI database
P.warcraftenhanced = {
	-- UI Enhancements
	errorFiltering = true,
	autoDelete = true,
	
	-- AutoQuest
	autoAccept = false,
	autoDaily = true,
	autoFate = true,
	autoRepeat = true,
	autoComplete = true,
	autoHighRisk = false,
	
	-- Leatrix Features - Social (now in ElvUI General > Miscellaneous)
	blockDuels = false,
	blockGuildInvites = false,
	blockPartyInvites = false,
	-- friendlyGuild removed - not needed
	-- acceptPartyFriends removed - use ElvUI's autoAcceptInvite instead
	
	-- Leatrix Features - Automation (now in ElvUI General > Automation)
	autoReleasePvP = false,
	autoSpiritRes = false,
	autoSellJunk = false,
	autoSellJunkSummary = true,
	autoRepair = false,
	autoRepairGuildFunds = true,
	autoRepairSummary = true,
	-- skipLootRollConfirmation removed - already in ElvUI General > BlizzUI Improvements
	
	-- Leatrix Features - System
	maxCameraZoom = false,
}

function WE:Initialize()
	-- Database shortcut
	if not E.db or not E.db.warcraftenhanced then
		self:ScheduleTimer("Initialize", 1)
		return
	end
	self.db = E.db.warcraftenhanced
	
	-- Initialize sub-modules
	self:InitializeUIEnhancements()
	self:InitializeAutoQuest()
	self:InitializeLeatrixFeatures()
	self:InitializeLootRoll()
	self:InitializeMacroButton()
	self:InitializePortalBox()
	
	-- TomTom and Omen load separately (they're full addons)
	-- We just integrate their settings into our options
	
	-- Silent load - no chat spam
end

-- Print function
function WE:Print(msg)
	E:Print("|cff00ff00[WarcraftEnhanced]|r " .. msg)
end

-- Module registration (for sub-features)
function WE:RegisterModule(name, module)
	self.modules[name] = module
end

-- Placeholder init functions (actual implementations in their respective files)
function WE:InitializeUIEnhancements()
	if self.modules.UIEnhancements and self.modules.UIEnhancements.Initialize then
		self.modules.UIEnhancements:Initialize()
	end
end

function WE:InitializeAutoQuest()
	-- AutoQuest initializes itself, we just sync settings
	if AutoQuestSave then
		C_Timer.After(1, function()
			if WE.db then
				AutoQuestSave.autoAccept = WE.db.autoAccept
				AutoQuestSave.autoDaily = WE.db.autoDaily
				AutoQuestSave.autoFate = WE.db.autoFate
				AutoQuestSave.autoRepeat = WE.db.autoRepeat
				AutoQuestSave.autoComplete = WE.db.autoComplete
				AutoQuestSave.autoHR = WE.db.autoHighRisk
			end
		end)
	end
end

function WE:InitializeLeatrixFeatures()
	if self.modules.LeatrixFeatures and self.modules.LeatrixFeatures.Initialize then
		self.modules.LeatrixFeatures:Initialize()
	end
end

function WE:InitializeLootRoll()
	if self.modules.LootRollEnhancement and self.modules.LootRollEnhancement.Initialize then
		self.modules.LootRollEnhancement:Initialize()
	end
end

function WE:InitializeMacroButton()
	-- MacroButton auto-initializes
end

function WE:InitializePortalBox()
	-- PortalBox auto-initializes
end

-- Slash commands
SLASH_WARCRAFTENHANCED1 = "/warcraftenhanced"
SLASH_WARCRAFTENHANCED2 = "/we"
SLASH_WARCRAFTENHANCED3 = "/wce"
SlashCmdList["WARCRAFTENHANCED"] = function(msg)
	msg = msg:lower():trim()
	
	if msg == "" or msg == "options" or msg == "config" then
		E:ToggleOptionsUI("warcraftenhanced")
	elseif msg == "help" then
		WE:Print("Commands:")
		WE:Print("/we - Open ElvUI options to WarcraftEnhanced section")
		WE:Print("/we help - Show this help")
	else
		E:ToggleOptionsUI("warcraftenhanced")
	end
end

E:RegisterModule(WE:GetName())

