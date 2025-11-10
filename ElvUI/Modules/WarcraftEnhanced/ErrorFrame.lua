local _, _, _, enhancedEnabled = GetAddOnInfo and GetAddOnInfo("ElvUI_Enhanced")
if enhancedEnabled then return end

local E = unpack(ElvUI)
local mod = E:GetModule("Enhanced_Blizzard")
local LSM = LibStub("LibSharedMedia-3.0")
local L = E.Libs.ACL:GetLocale("ElvUI", true)

local defaultSettings = {
	width = 512,
	height = 60,
	font = "PT Sans Narrow",
	fontSize = 15,
	fontOutline = "NONE"
}

function mod:ErrorFrameSize(db)
	E.db.enhanced = E.db.enhanced or {}
	E.db.enhanced.blizzard = E.db.enhanced.blizzard or {}
	E.db.enhanced.blizzard.errorFrame = E.db.enhanced.blizzard.errorFrame or {}

	local stored = E.db.enhanced.blizzard.errorFrame
	if stored.enable == nil then stored.enable = false end
	if stored.width == nil then stored.width = 300 end
	if stored.height == nil then stored.height = 60 end
	if not stored.font then stored.font = "PT Sans Narrow" end
	if stored.fontSize == nil then stored.fontSize = 12 end
	if not stored.fontOutline then stored.fontOutline = "NONE" end

	db = db or E.db.enhanced.blizzard.errorFrame

	UIErrorsFrame:Size(db.width, db.height)
	UIErrorsFrame:SetFont(LSM:Fetch("font", db.font), db.fontSize, db.fontOutline)

	if not UIErrorsFrame.mover then
		E:CreateMover(UIErrorsFrame, "UIErrorsFrameMover", L["Error Frame"], nil, nil, nil, "ALL,GENERAL", nil, "elvuiPlugins,enhanced,miscGroup,errorFrame")
	end
end

function mod:CustomErrorFrameToggle(forceDisable)
	if E.db.enhanced.blizzard.errorFrame.enable and not forceDisable then
		self:ErrorFrameSize()
		if UIErrorsFrame.mover then
			E:EnableMover(UIErrorsFrame.mover:GetName())
		end
	else
		self:ErrorFrameSize(defaultSettings)
		UIErrorsFrame:Point("TOP", 0, -122)

		if UIErrorsFrame.mover then
			E:DisableMover(UIErrorsFrame.mover:GetName())
			UIErrorsFrame.mover:ClearAllPoints()
			UIErrorsFrame.mover:Point("TOP", 0, -122)
		end
	end
end

