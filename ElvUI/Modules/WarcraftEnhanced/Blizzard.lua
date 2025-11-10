local _, _, _, enhancedEnabled = GetAddOnInfo and GetAddOnInfo("ElvUI_Enhanced")
if enhancedEnabled then return end

local E = unpack(ElvUI)
local mod = E:NewModule("Enhanced_Blizzard", "AceEvent-3.0")

function mod:PLAYER_ENTERING_WORLD()
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	self:CustomErrorFrameToggle()
end

local function EnsureBlizzardDB()
	E.db.enhanced = E.db.enhanced or {}
	E.db.enhanced.blizzard = E.db.enhanced.blizzard or {}

	local db = E.db.enhanced.blizzard
	db.errorFrame = db.errorFrame or {}
	local ef = db.errorFrame
	if ef.enable == nil then ef.enable = false end
	if ef.width == nil then ef.width = 300 end
	if ef.height == nil then ef.height = 60 end
	if not ef.font then ef.font = "PT Sans Narrow" end
	if ef.fontSize == nil then ef.fontSize = 12 end
	if not ef.fontOutline then ef.fontOutline = "NONE" end

	if db.takeAllMail == nil then db.takeAllMail = false end

	return db
end

function mod:Initialize()
	EnsureBlizzardDB()
	self:RegisterEvent("PLAYER_ENTERING_WORLD")

	if E.db.enhanced.blizzard.takeAllMail then
		local TAM = E:GetModule("Enhanced_TakeAllMail", true)
		if TAM and not TAM.initialized then
			TAM:Initialize()
		end
	end

	self.initialized = true
end

local function InitializeCallback()
	mod:Initialize()
end

E:RegisterModule(mod:GetName(), InitializeCallback)

