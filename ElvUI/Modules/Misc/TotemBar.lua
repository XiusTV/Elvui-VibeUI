local E, L, V, P, G = unpack(select(2, ...)) --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local TOTEMS = E:GetModule("Totems")

--Lua functions
local unpack = unpack
--WoW API / Variables
local CooldownFrame_SetTimer = CooldownFrame_SetTimer
local CreateFrame = CreateFrame
local DestroyTotem = DestroyTotem
local GetTotemInfo = GetTotemInfo
local IsSpellInRange = IsSpellInRange
local GetSpellInfo = GetSpellInfo

local MAX_TOTEMS = MAX_TOTEMS
local TOTEM_PRIORITIES = TOTEM_PRIORITIES

local SLOT_BORDER_COLORS = {
	[EARTH_TOTEM_SLOT]	= {r = 0.23, g = 0.45, b = 0.13},	-- [2]
	[FIRE_TOTEM_SLOT]	= {r = 0.58, g = 0.23, b = 0.10},	-- [1]
	[WATER_TOTEM_SLOT]	= {r = 0.19, g = 0.48, b = 0.60},	-- [3]
	[AIR_TOTEM_SLOT]	= {r = 0.42, g = 0.18, b = 0.74}	-- [4]
}

function TOTEMS:UpdateAllTotems()
	for i = 1, MAX_TOTEMS do
		self:UpdateTotem(nil, i)
	end
end

function TOTEMS:UpdateTotem(event, slot)
	local slotID = TOTEM_PRIORITIES[slot]
	local _, _, startTime, duration, icon = GetTotemInfo(slot)
	local button = self.bar[slotID]

	if icon ~= "" then
		local color = SLOT_BORDER_COLORS[slot]
		button.iconTexture:SetTexture(icon)
		button:SetBackdropBorderColor(color.r, color.g, color.b)
		button.baseBorderColor = color

		CooldownFrame_SetTimer(button.cooldown, startTime, duration, 1)

		button:Show()
	else
		button:Hide()
		button.baseBorderColor = nil
	end
end

function TOTEMS:UpdateTotemRange()
	if not self.bar then return end

	for i = 1, MAX_TOTEMS do
		local button = self.bar[i]
		if button:IsShown() and button.baseBorderColor then
			local slot = button.slot
			local _, _, _, _, icon = GetTotemInfo(slot)

			if icon and icon ~= "" and button.spellName then
				local inRange = IsSpellInRange(button.spellName, "player")
				if inRange == 0 then
					button:SetBackdropBorderColor(1, 0, 0)
				else
					local color = button.baseBorderColor
					button:SetBackdropBorderColor(color.r, color.g, color.b)
				end
			end
		end
	end
end

function TOTEMS:ToggleEnable()
	if E.db.general.totems.enable then
		if self.Initialized then
			self.bar:Show()
			self:RegisterEvent("PLAYER_TOTEM_UPDATE", "UpdateTotem")
			self:RegisterEvent("PLAYER_ENTERING_WORLD", "UpdateAllTotems")
			self:UpdateAllTotems()
			E:EnableMover("TotemBarMover")
		else
			self:Initialize()
			self:UpdateAllTotems()
		end
	elseif self.Initialized then
		self.bar:Hide()
		self:UnregisterEvent("PLAYER_TOTEM_UPDATE")
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
		E:DisableMover("TotemBarMover")
	end
end

function TOTEMS:PositionAndSize()
	if not self.Initialized then return end

	for i = 1, MAX_TOTEMS do
		local button = self.bar[i]
		local prevButton = self.bar[i - 1]

		button:Size(self.db.size)
		button:ClearAllPoints()

		if self.db.growthDirection == "HORIZONTAL" and self.db.sortDirection == "ASCENDING" then
			if i == 1 then
				button:Point("LEFT", self.bar, "LEFT", self.db.spacing, 0)
			elseif prevButton then
				button:Point("LEFT", prevButton, "RIGHT", self.db.spacing, 0)
			end
		elseif self.db.growthDirection == "VERTICAL" and self.db.sortDirection == "ASCENDING" then
			if i == 1 then
				button:Point("TOP", self.bar, "TOP", 0, -self.db.spacing)
			elseif prevButton then
				button:Point("TOP", prevButton, "BOTTOM", 0, -self.db.spacing)
			end
		elseif self.db.growthDirection == "HORIZONTAL" and self.db.sortDirection == "DESCENDING" then
			if i == 1 then
				button:Point("RIGHT", self.bar, "RIGHT", -self.db.spacing, 0)
			elseif prevButton then
				button:Point("RIGHT", prevButton, "LEFT", -self.db.spacing, 0)
			end
		else
			if i == 1 then
				button:Point("BOTTOM", self.bar, "BOTTOM", 0, self.db.spacing)
			elseif prevButton then
				button:Point("BOTTOM", prevButton, "TOP", 0, self.db.spacing)
			end
		end
	end

	if self.db.growthDirection == "HORIZONTAL" then
		self.bar:Width(self.db.size*(MAX_TOTEMS) + self.db.spacing*(MAX_TOTEMS) + self.db.spacing)
		self.bar:Height(self.db.size + self.db.spacing * 2)
	else
		self.bar:Height(self.db.size*(MAX_TOTEMS) + self.db.spacing*(MAX_TOTEMS) + self.db.spacing)
		self.bar:Width(self.db.size + self.db.spacing * 2)
	end
end

local function Button_OnClick(self)
	DestroyTotem(self.slot)
end
local function Button_OnEnter(self)
	GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
	self:UpdateTooltip()
end
local function Button_OnLeave(self)
	GameTooltip:Hide()
end
local function UpdateTooltip(self)
	if GameTooltip:IsOwned(self) then
		GameTooltip:SetTotem(self.slot)
	end
end

function TOTEMS:Initialize()
	if not E.db.general.totems.enable then return end

	self.db = E.db.general.totems

	local bar = CreateFrame("Frame", "ElvUI_TotemBar", E.UIParent)
	bar:Point("TOPLEFT", LeftChatPanel, "TOPRIGHT", 14, 0)
	self.bar = bar

	for i = 1, MAX_TOTEMS do
		local frame = CreateFrame("Button", "$parentTotem"..i, bar)
		frame.slot = TOTEM_PRIORITIES[i]
		frame:SetTemplate("Default")
		frame:StyleButton()
		frame.ignoreBorderColors = true
		frame:Hide()
		frame.spellName = GetSpellInfo(TOTEM_PRIORITIES[i])

		frame.UpdateTooltip = UpdateTooltip

		frame:RegisterForClicks("RightButtonUp")
		frame:SetScript("OnClick", Button_OnClick)
		frame:SetScript("OnEnter", Button_OnEnter)
		frame:SetScript("OnLeave", Button_OnLeave)

		frame.holder = CreateFrame("Frame", nil, frame)
		frame.holder:SetAlpha(0)
		frame.holder:SetAllPoints()

		frame.iconTexture = frame:CreateTexture(nil, "ARTWORK")
		frame.iconTexture:SetTexCoord(unpack(E.TexCoords))
		frame.iconTexture:SetInside()

		frame.cooldown = CreateFrame("Cooldown", "$parentCooldown", frame, "CooldownFrameTemplate")
		frame.cooldown:SetReverse(true)
		frame.cooldown:SetInside()
		E:RegisterCooldown(frame.cooldown)

		self.bar[i] = frame
	end

	self.Initialized = true

	self:PositionAndSize()

	E:CreateMover(bar, "TotemBarMover", TUTORIAL_TITLE47, nil, nil, nil, nil, nil, "general,totems")

	self:RegisterEvent("PLAYER_TOTEM_UPDATE", "UpdateTotem")
	self:RegisterEvent("PLAYER_ENTERING_WORLD", "UpdateAllTotems")
	self:RegisterEvent("PLAYER_TARGET_CHANGED", "UpdateTotemRange")
	self:RegisterEvent("PLAYER_UPDATE_RESTING", "UpdateTotemRange")
	self:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED", "UpdateTotemRange")
	self:RegisterEvent("UNIT_AURA", "UpdateTotemRange")
	self:RegisterEvent("PLAYER_MOVING_UPDATE", "UpdateTotemRange")
end

local function InitializeCallback()
	TOTEMS:Initialize()
end

E:RegisterModule(TOTEMS:GetName(), InitializeCallback)