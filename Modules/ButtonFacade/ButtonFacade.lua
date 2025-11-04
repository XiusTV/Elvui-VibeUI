local E, L, V, P, G = unpack(select(2, ...)); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local BF = E:GetModule("ButtonFacade")
local LBF = E.Libs.LBF

if not LBF then
	E:Print("|cffFF0000Error: LibButtonFacade library not found!|r")
	return
end

--Lua functions
local pairs, ipairs, unpack = pairs, ipairs, unpack

-- Module Variables
BF.SkinGroups = {}

function BF:Initialize()
	if not E.db then return end
	if not E.db.buttonFacade then return end
	if not E.private or not E.private.actionbar or not E.private.actionbar.lbf then return end
	
	self.db = E.db.buttonFacade
	
	-- Ensure all sub-tables exist
	if not self.db.global then
		self.db.global = {
			SkinID = "ElvUI",
			Gloss = 0,
			Backdrop = false,
			Colors = {},
		}
	end
	
	if not self.db.actionbars then
		self.db.actionbars = {
			SkinID = "ElvUI",
			Gloss = 0,
			Backdrop = false,
			Colors = {},
		}
	end
	
	if not self.db.auras then
		self.db.auras = {
			SkinID = "ElvUI",
			Gloss = 0,
			Backdrop = false,
			Colors = {},
		}
	end
	
	-- Register root group
	self.RootGroup = LBF:Group("ElvUI")
	
	-- Sync ButtonFacade skin with LBF settings
	if E.private.actionbar.lbf.enable then
		self.db.actionbars.SkinID = E.private.actionbar.lbf.skin or "ElvUI"
	end
	
	-- Apply initial skins if LBF is enabled
	if E.private.actionbar.lbf.enable then
		self:UpdateSkins()
	end
	
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "UpdateSkins")
end

function BF:UpdateSkins()
	if not self.db then return end
	if not E.private or not E.private.actionbar or not E.private.actionbar.lbf then return end
	
	-- Sync skin selection with LBF settings
	if E.private.actionbar.lbf.enable and E.private.actionbar.lbf.skin then
		self.db.actionbars.SkinID = E.private.actionbar.lbf.skin
	end
	
	-- Handle Action Bars - use LBF enable setting
	if E.private.actionbar.lbf.enable then
		self:SkinActionBars()
	else
		self:RemoveActionBarsFromLBF()
		-- Force action bars to update their styling
		local AB = E:GetModule("ActionBars", true)
		if AB then
			for barName, bar in pairs(AB.handledBars) do
				if bar then
					AB:PositionAndSizeBar(barName)
				end
			end
		end
	end
	
	-- Handle Auras separately if needed
	if self.db.auras and self.db.auras.enabled then
		self:SkinAuras()
	else
		self:RemoveAurasFromLBF()
	end
end

function BF:SkinActionBars()
	if not self.db or not self.db.actionbars then return end
	if not E.private or not E.private.actionbar or not E.private.actionbar.lbf then return end
	if not E.private.actionbar.lbf.enable then return end
	
	if not E:GetModule("ActionBars", true) then return end
	
	local AB = E:GetModule("ActionBars")
	if not AB then return end
	
	-- Skin each action bar
	for i = 1, 6 do
		local barName = "bar"..i
		local bar = AB.handledBars[barName]
		if bar then
			self:RegisterAndSkinBar(barName, bar, i)
			-- Force re-style the buttons to apply ButtonFacade
			AB:PositionAndSizeBar(barName)
		end
	end
	
	-- Skin pet bar
	if AB.handledBars.petbar then
		self:RegisterAndSkinBar("petbar", AB.handledBars.petbar, nil)
		AB:PositionAndSizeBarPet()
	end
	
	-- Skin stance bar
	if AB.handledBars.stancebar then
		self:RegisterAndSkinBar("stancebar", AB.handledBars.stancebar, nil)
		AB:PositionAndSizeBarShapeShift()
	end
	
	-- Skin micro bar (if it exists)
	if AB.handledBars.microbar then
		self:RegisterAndSkinBar("microbar", AB.handledBars.microbar, nil)
	end
end

function BF:RegisterAndSkinBar(barName, bar, barId)
	if not self.db or not self.db.actionbars then return end
	
	-- Get or create the group
	local group = LBF:Group("ElvUI", barName)
	if not group then return end
	
	-- Register buttons if not already registered
	if bar.buttons then
		for i, button in ipairs(bar.buttons) do
			if button then
				local ButtonData = {
					Icon = button.icon,
					Flash = button.flash,
					Cooldown = button.cooldown,
					HotKey = button.hotkey,
					Count = button.count,
					Name = button.Name or button.actionName,
					Border = _G[button:GetName().."Border"] or button.border,
				}
				
				-- AddButton will only add if not already in group
				group:AddButton(button, ButtonData)
			end
		end
	end
	
	-- Apply skin
	local cfg = self.db.actionbars
	group:Skin(cfg.SkinID, cfg.Gloss, cfg.Backdrop, cfg.Colors)
	
	-- Store group reference
	self.SkinGroups[barName] = group
end

function BF:RemoveActionBarsFromLBF()
	if not E:GetModule("ActionBars", true) then return end
	
	local AB = E:GetModule("ActionBars")
	if not AB then return end
	
	-- Remove buttons from all action bar groups
	for i = 1, 6 do
		local barName = "bar"..i
		local bar = AB.handledBars[barName]
		if bar and bar.buttons then
			local group = LBF:Group("ElvUI", barName)
			if group then
				for _, button in ipairs(bar.buttons) do
					if button then
						-- Remove from ButtonFacade and restore to ElvUI style
						group:RemoveButton(button, true) -- true = reset to default
						AB:StyleButton(button, nil, nil) -- Re-apply ElvUI styling
					end
				end
			end
		end
		-- Clear the group reference
		self.SkinGroups[barName] = nil
	end
	
	-- Remove from special bars
	for _, barName in ipairs({"petbar", "stancebar", "microbar"}) do
		local bar = AB.handledBars[barName]
		if bar and bar.buttons then
			local group = LBF:Group("ElvUI", barName)
			if group then
				for _, button in ipairs(bar.buttons) do
					if button then
						group:RemoveButton(button, true)
						AB:StyleButton(button, nil, nil)
					end
				end
			end
		end
		self.SkinGroups[barName] = nil
	end
end

function BF:RemoveAurasFromLBF()
	if not E:GetModule("Auras", true) then return end
	
	local group = LBF:Group("ElvUI", "Auras")
	if group then
		-- Note: We can't easily iterate all aura buttons, but removing from group
		-- should be handled by LibButtonFacade when buttons are recreated
		-- For now, just clear the group reference
		self.SkinGroups.auras = nil
	end
end

function BF:SkinAuras()
	if not self.db or not self.db.auras then return end
	if not self.db.auras.enabled then return end
	
	if not E:GetModule("Auras", true) then return end
	
	local A = E:GetModule("Auras")
	if not A then return end
	
	-- Get the aura group (if it exists)
	local group = LBF:Group("ElvUI", "Auras")
	if not group then return end
	
	-- Apply custom skin
	local cfg = self.db.auras
	group:Skin(cfg.SkinID, cfg.Gloss, cfg.Backdrop, cfg.Colors)
	
	-- Store group reference
	self.SkinGroups.auras = group
end

function BF:ConfigureGroup(groupName, skinID, gloss, backdrop, colors)
	local group = self.SkinGroups[groupName]
	if not group then return end
	
	group:Skin(skinID, gloss, backdrop, colors)
end

function BF:GetSkinList()
	return LBF:ListSkins()
end

function BF:GetGroupSkin(groupName)
	local group = self.SkinGroups[groupName]
	if group then
		return group.SkinID, group.Gloss, group.Backdrop, group.Colors
	end
	return nil
end

function BF:ResetActionBarSkins()
	if not self.db or not self.db.actionbars then return end
	
	for i = 1, 6 do
		local barName = "bar"..i
		local group = self.SkinGroups[barName]
		if group then
			group:Skin("ElvUI", 0, false, {})
		end
	end
	
	-- Reset special bars
	for _, barName in ipairs({"petbar", "stancebar", "microbar"}) do
		local group = self.SkinGroups[barName]
		if group then
			group:Skin("ElvUI", 0, false, {})
		end
	end
	
	self.db.actionbars.SkinID = "ElvUI"
	self.db.actionbars.Gloss = 0
	self.db.actionbars.Backdrop = false
	self.db.actionbars.Colors = {}
end

function BF:ResetAuraSkins()
	if not self.db or not self.db.auras then return end
	
	local group = self.SkinGroups.auras
	if group then
		group:Skin("ElvUI", 0, false, {})
	end
	
	self.db.auras.SkinID = "ElvUI"
	self.db.auras.Gloss = 0
	self.db.auras.Backdrop = false
	self.db.auras.Colors = {}
end

local function InitializeCallback()
	BF:Initialize()
end

E:RegisterModule(BF:GetName(), InitializeCallback)

