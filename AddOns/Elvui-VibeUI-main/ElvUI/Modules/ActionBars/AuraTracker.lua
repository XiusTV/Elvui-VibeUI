-- ElvUI AuraTracker Module
-- Displays buff/debuff duration remaining on action bar buttons
-- Shows time left for your buffs/DoTs on the current target

local E, L, V, P, G = unpack(select(2, ...))
local AB = E:GetModule('ActionBars')
local LSM = E.Libs.LSM

local _G = _G
local pairs, ipairs = pairs, ipairs
local select, type = select, type
local UnitExists, UnitIsUnit = UnitExists, UnitIsUnit
local UnitAura, GetSpellInfo = UnitAura, GetSpellInfo
local GetActionInfo, GetActionText = GetActionInfo, GetActionText
local GetPetActionInfo = GetPetActionInfo
local format, floor = string.format, math.floor

-- Module
local AT = E:NewModule('AuraTracker', 'AceEvent-3.0', 'AceTimer-3.0')
AT.Buttons = {} -- Store references to all action buttons
AT.Initialized = false
AT.enabled = false

-- Helper function to get spell name from action slot
local function GetActionSpellName(actionSlot)
	if not actionSlot then return nil end
	local actionType, id = GetActionInfo(actionSlot)
	if actionType == "spell" then
		local spellName = GetSpellInfo(id)
		return spellName
	end
	return nil
end

-- Helper function to get pet action spell name
local function GetPetActionSpellName(petSlot)
	if not petSlot then return nil end
	local name, _, _, isToken = GetPetActionInfo(petSlot)
	if not isToken then
		return name
	end
	return nil
end

-- Helper function to get spell name from button (handles LibActionButton)
local function GetButtonSpellName(button)
	if not button then return nil end
	
	-- Try to get action slot from button
	local actionSlot = nil
	
	-- Try LibActionButton GetActionID method
	if button.GetActionID then
		actionSlot = button:GetActionID()
	end
	
	-- Try action property
	if not actionSlot and button.action then
		actionSlot = button.action
	end
	
	-- Try getting action from button state
	if not actionSlot and button:GetAttribute and button:GetAttribute("action") then
		actionSlot = button:GetAttribute("action")
	end
	
	-- If we have an action slot, get the spell name
	if actionSlot then
		return GetActionSpellName(actionSlot)
	end
	
	-- Try GetID for pet/stance bars
	local buttonID = button:GetID()
	if buttonID then
		local parent = button:GetParent()
		if parent then
			local parentName = parent:GetName() or ""
			if parentName:match("PetBar") then
				return GetPetActionSpellName(buttonID)
			end
		end
	end
	
	-- Last resort: try GetSpell method if it exists
	if button.GetSpell then
		local spell = button:GetSpell()
		if spell then
			return spell
		end
	end
	
	return nil
end

-- Format time remaining
local function FormatTime(seconds)
	if not seconds or seconds <= 0 then return "" end
	
	if seconds < 60 then
		return format("%d", seconds) -- Just seconds
	elseif seconds < 3600 then
		return format("%dm", floor(seconds / 60)) -- Minutes
	else
		return format("%dh", floor(seconds / 3600)) -- Hours
	end
end

-- Update duration text on a button
function AT:UpdateButtonDuration(button)
	if not button or not button:IsVisible() then return end
	if not E.db.actionbar.auraTracker or not E.db.actionbar.auraTracker.enable then return end
	
	-- Get spell name from this button
	local spellName = GetButtonSpellName(button)
	
	if not spellName then
		if button.auraText then
			button.auraText:SetText("")
		end
		return
	end
	
	-- Check target for this buff/debuff
	local timeLeft = nil
	local unit = "target"
	
	if UnitExists(unit) then
		-- Check buffs
		for i = 1, 40 do
			local name, _, _, _, _, expirationTime, caster = UnitAura(unit, i, "HELPFUL")
			if not name then break end
			
			if name == spellName then
				-- Filter by caster if enabled
				if not E.db.actionbar.auraTracker.onlyPlayer or UnitIsUnit(caster or "", "player") then
					if expirationTime and expirationTime > 0 then
						timeLeft = expirationTime - GetTime()
						break
					end
				end
			end
		end
		
		-- Check debuffs if no buff found
		if not timeLeft then
			for i = 1, 40 do
				local name, _, _, _, _, expirationTime, caster = UnitAura(unit, i, "HARMFUL")
				if not name then break end
				
				if name == spellName then
					-- Filter by caster if enabled
					if not E.db.actionbar.auraTracker.onlyPlayer or UnitIsUnit(caster or "", "player") then
						if expirationTime and expirationTime > 0 then
							timeLeft = expirationTime - GetTime()
							break
						end
					end
				end
			end
		end
	end
	
	-- Update or create duration text
	if not button.auraText then
		button.auraText = button:CreateFontString(nil, "OVERLAY")
		button.auraText:Point("TOP", button, "TOP", 0, -2)
	end
	
	-- Set font
	local font = LSM:Fetch("font", E.db.actionbar.auraTracker.font)
	local fontSize = E.db.actionbar.auraTracker.fontSize
	local fontOutline = E.db.actionbar.auraTracker.fontOutline
	button.auraText:FontTemplate(font, fontSize, fontOutline)
	
	-- Update text
	if timeLeft and timeLeft > 0 then
		button.auraText:SetText(FormatTime(timeLeft))
		
		-- Color based on time remaining
		if E.db.actionbar.auraTracker.colorByTime then
			if timeLeft < 5 then
				button.auraText:SetTextColor(1, 0, 0) -- Red < 5s
			elseif timeLeft < 10 then
				button.auraText:SetTextColor(1, 1, 0) -- Yellow < 10s
			else
				button.auraText:SetTextColor(0, 1, 0) -- Green
			end
		else
			button.auraText:SetTextColor(1, 1, 1) -- White
		end
	else
		button.auraText:SetText("")
	end
end

-- Update all registered buttons
function AT:UpdateAllButtons()
	for _, button in pairs(self.Buttons) do
		self:UpdateButtonDuration(button)
	end
end

-- Register a button for aura tracking
function AT:RegisterButton(button)
	if not button then return end
	self.Buttons[button] = button
end

-- Unregister a button
function AT:UnregisterButton(button)
	if not button then return end
	self.Buttons[button] = nil
	if button.auraText then
		button.auraText:SetText("")
	end
end

-- Event handler for target aura changes
function AT:UNIT_AURA(event, unit)
	if unit == "target" then
		self:UpdateAllButtons()
	end
end

-- Event handler for target change
function AT:PLAYER_TARGET_CHANGED()
	self:UpdateAllButtons()
end

-- Update timer (fallback for smooth countdown)
function AT:OnUpdate()
	if self.throttle and self.throttle > GetTime() then return end
	self.throttle = GetTime() + 0.1 -- Update 10 times per second
	
	if E.db.actionbar.auraTracker and E.db.actionbar.auraTracker.enable then
		self:UpdateAllButtons()
	end
end

-- Enable the module
function AT:Enable()
	if self.enabled then return end
	
	self:RegisterEvent("UNIT_AURA")
	self:RegisterEvent("PLAYER_TARGET_CHANGED")
	
	-- Start update ticker
	if not self.ticker then
		self.ticker = self:ScheduleRepeatingTimer("OnUpdate", 0.1)
	end
	
	self.enabled = true
	self:UpdateAllButtons()
end

-- Disable the module
function AT:Disable()
	if not self.enabled then return end
	
	self:UnregisterEvent("UNIT_AURA")
	self:UnregisterEvent("PLAYER_TARGET_CHANGED")
	
	-- Stop update ticker
	if self.ticker then
		self:CancelTimer(self.ticker)
		self.ticker = nil
	end
	
	-- Clear all button text
	for _, button in pairs(self.Buttons) do
		if button.auraText then
			button.auraText:SetText("")
		end
	end
	
	self.enabled = false
end

-- Toggle based on settings
function AT:Toggle()
	if E.db.actionbar.auraTracker and E.db.actionbar.auraTracker.enable then
		self:Enable()
	else
		self:Disable()
	end
end

-- Register all action bar buttons
function AT:RegisterAllButtons()
	-- Register main action bar buttons (Bars 1-6)
	for bar = 1, 6 do
		for i = 1, 12 do
			local button = _G["ElvUI_Bar"..bar.."Button"..i]
			if button then
				self:RegisterButton(button)
			end
		end
	end
	
	-- Register pet bar buttons
	for i = 1, 10 do
		local button = _G["ElvUI_PetBarButton"..i]
		if button then
			self:RegisterButton(button)
		end
	end
	
	-- Register stance bar buttons
	for i = 1, 10 do
		local button = _G["ElvUI_StanceBarButton"..i]
		if button then
			self:RegisterButton(button)
		end
	end
end

-- Initialize
function AT:Initialize()
	-- Make sure we're not already initialized
	if self.Initialized then return end
	
	-- Wait for ActionBars module to be ready
	if not AB or not AB.Initialized then
		self:ScheduleTimer("Initialize", 1)
		return
	end
	
	-- Mark as initialized first to prevent double initialization
	self.Initialized = true
	
	-- Register all buttons after a short delay to ensure all bars are created
	-- ActionBars.lua already registers buttons in StyleButton, but we'll also scan for any existing ones
	self:ScheduleTimer(function()
		self:RegisterAllButtons()
		self:Toggle()
	end, 0.5)
end

-- Register module
if E.RegisterModule then
	E:RegisterModule(AT:GetName())
end

