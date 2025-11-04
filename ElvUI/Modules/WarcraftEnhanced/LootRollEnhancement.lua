-- LootRollEnhancement - Skip loot roll confirmation dialogs
local QH = WarcraftEnhanced or QuestHelper

local LootRollEnhancement = CreateFrame("Frame")
LootRollEnhancement.isHooked = false

function LootRollEnhancement:Initialize()
	if QH.db.skipLootRollConfirmation then
		self:Enable()
	end
end

function LootRollEnhancement:Enable()
	if self.isHooked then return end
	
	-- Hook the StaticPopup_Show function to auto-confirm loot rolls
	hooksecurefunc("StaticPopup_Show", function(which, ...)
		if which == "CONFIRM_LOOT_ROLL" and QH.db.skipLootRollConfirmation then
			-- Wait a tiny bit for the dialog to fully show
			C_Timer.After(0.01, function()
				local dialog = StaticPopup_FindVisible("CONFIRM_LOOT_ROLL")
				if dialog and dialog.button1 and dialog.button1:IsEnabled() then
					dialog.button1:Click()
				end
			end)
		end
	end)
	
	self.isHooked = true
	
	if QH.db and QH.db.skipLootRollConfirmation then
		QH:Print("Loot roll confirmation skip enabled")
	end
end

function LootRollEnhancement:Disable()
	-- Can't unhook, but the setting check will prevent the auto-confirm
	if QH.db and not QH.db.skipLootRollConfirmation then
		QH:Print("Loot roll confirmation skip disabled")
	end
end

function LootRollEnhancement:Toggle(enabled)
	if enabled then
		self:Enable()
	else
		self:Disable()
	end
end

-- Register the module
QH:RegisterModule("LootRollEnhancement", LootRollEnhancement)
QH.LootRollEnhancement = LootRollEnhancement

