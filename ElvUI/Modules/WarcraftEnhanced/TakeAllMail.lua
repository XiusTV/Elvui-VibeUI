local E, L = unpack(ElvUI)
local TAM = E:NewModule("Enhanced_TakeAllMail", "AceEvent-3.0")

local select = select
local format = string.format

local StartSpinnerFrame = E.StartSpinnerFrame
local StopSpinnerFrame = E.StopSpinnerFrame
	if spinnerAvailable then
		StartSpinnerFrame(InboxFrame, 11, 12, 32, 76)
	end
local CheckInbox = CheckInbox
local DeleteInboxItem = DeleteInboxItem
local GetInboxHeaderInfo = GetInboxHeaderInfo
local GetInboxNumItems = GetInboxNumItems
local InboxItemCanDelete = InboxItemCanDelete
local IsShiftKeyDown = IsShiftKeyDown
local TakeInboxMoney = TakeInboxMoney

local ERR_INV_FULL = ERR_INV_FULL
local MAIL_MIN_DELAY = 0.15

function TAM:GetTotalCash()
	if GetInboxNumItems() == 0 then return 0 end

	local totalCash = 0

	for i = 1, GetInboxNumItems() do
		totalCash = totalCash + select(5, GetInboxHeaderInfo(i))
	end

	return totalCash
end

function TAM:UpdateButtons()
	if not self:EnsureButtons() then return end
	if self.processing then return end

	if GetInboxNumItems() == 0 then
		self.takeAll:Disable()
		self.takeCash:Disable()
	else
		self.takeAll:Enable()

		if self:GetTotalCash() > 0 then
			self.takeCash:Enable()
		else
			self.takeCash:Disable()
		end
	end
end

function TAM:Reset()
	self.mailIndex = 1
	self.timeUntilNextRetrieval = nil
	self.commandPending = nil

	self.collectCashOnly = nil
	self.collectedCash = 0
	self.collectedTotal = 0
	self.removeEmpty = nil
end

function TAM:EnsureButtons()
	if self.takeAll and self.takeCash then return true end

	if not InboxFrame then
		if MailFrame_LoadUI then
			MailFrame_LoadUI()
		end
	end

	if not InboxFrame then
		return false
	end

	self:CreateButtons()
	return self.takeAll ~= nil and self.takeCash ~= nil
end

function TAM:StartOpening(mode)
	if GetInboxNumItems() == 0 then return end
	if not self:EnsureButtons() then return end

	self:Reset()

	self.takeAll:Disable()
	self.takeCash:Disable()

	self:RegisterEvent("MAIL_INBOX_UPDATE", "OnEvent")
	self:RegisterEvent("UI_ERROR_MESSAGE", "OnEvent")

	if mode == 1 then
		self.collectCashOnly = true
	elseif mode == 2 then
		self.removeEmpty = true
	end

	self.processing = true

	self.numToOpen = GetInboxNumItems()
	self.takeAll:SetScript("OnUpdate", function(_, elapsed) self:OnUpdate(elapsed) end)

	if mode == 2 then
		self:RemoveNextMail()
	else
		self:AdvanceAndProcessNextMail()
	end

	if spinnerAvailable then
		StartSpinnerFrame(InboxFrame, 11, 12, 32, 76)
	end
end

function TAM:StopOpening(err)
	if self.collectedCash > 0 then
		E:Print(L["Collected "]..E:FormatMoney(self.collectedCash))
	end
	if self.collectedTotal > 0 and not err then
		E:Print(L["Collection completed."])
	end

	self:Reset()

	if self.takeAll and self.takeCash then
		self.takeAll:Enable()
		self.takeCash:Enable()
	end

	self:UnregisterEvent("MAIL_INBOX_UPDATE")
	self:UnregisterEvent("UI_ERROR_MESSAGE")

	self.processing = nil
	if self.takeAll then
		self.takeAll:SetScript("OnUpdate", nil)
	end
	self:UpdateButtons()

	if spinnerAvailable then
		StopSpinnerFrame(InboxFrame)
	end
end

function TAM:AdvanceToNextMail()
	local _, _, _, _, money, _, _, itemCount = GetInboxHeaderInfo(self.mailIndex)

	if money > 0 or (not self.collectCashOnly and (itemCount and itemCount > 0)) then
		return true
	else
		self.mailIndex = self.mailIndex + 1

		if self.mailIndex > GetInboxNumItems() then
			return false
		end

		return self:AdvanceToNextMail()
	end
end

function TAM:AdvanceAndProcessNextMail()
	if self:AdvanceToNextMail() then
		self:ProcessNextMail()
	else
		self:StopOpening()
	end
end

function TAM:ProcessNextMail()
	local _, _, _, _, money, CODAmount, _, itemCount, _, _, _, _, isGM = GetInboxHeaderInfo(self.mailIndex)
	if isGM or (CODAmount and CODAmount > 0) then
		self.mailIndex = self.mailIndex + 1
		self:AdvanceAndProcessNextMail()
		return
	end

	if money > 0 then
		TakeInboxMoney(self.mailIndex)

		self.collectedCash = self.collectedCash + money
		self.collectedTotal = self.collectedTotal + 1
		self.timeUntilNextRetrieval = MAIL_MIN_DELAY
	elseif not self.collectCashOnly and (itemCount and itemCount > 0) then
		AutoLootMailItem(self.mailIndex)

		self.collectedTotal = self.collectedTotal + 1
		self.timeUntilNextRetrieval = MAIL_MIN_DELAY
	else
		self:AdvanceAndProcessNextMail()
	end
end

function TAM:RemoveNextMail()
	local numItems = GetInboxNumItems()

	if numItems > 0 then
		local money, CODAmount, itemCount, isGM

		for i = 1, numItems do
			_, _, _, _, money, CODAmount, _, itemCount, _, _, _, _, isGM = GetInboxHeaderInfo(i)

			if not isGM and (not CODAmount or CODAmount == 0) and money == 0 and (not itemCount or itemCount == 0) then
				if InboxItemCanDelete(i) then
					DeleteInboxItem(i)
					self.timeUntilNextRetrieval = MAIL_MIN_DELAY
					break
				end
			end
		end
	else
		return self:StopOpening()
	end

	if not self.timeUntilNextRetrieval then
		self:StopOpening()
	end
end

function TAM:OnUpdate(dt)
	if not self.timeUntilNextRetrieval then return end

	self.timeUntilNextRetrieval = self.timeUntilNextRetrieval - dt

	if self.timeUntilNextRetrieval <= 0 then
		if not self.commandPending then
			self.timeUntilNextRetrieval = nil
			if not self.removeEmpty then
				self:AdvanceAndProcessNextMail()
			else
				self:RemoveNextMail()
			end
		end
	end
end

function TAM:MAIL_INBOX_UPDATE()
	if self.processing then
		self:AdvanceAndProcessNextMail()
	else
		self:UpdateButtons()
	end
end

function TAM:UI_ERROR_MESSAGE(_, errorText)
	if errorText == ERR_INV_FULL then
		self:StopOpening(true)
	end
end

function TAM:OnEvent(event, ...)
	if self[event] then
		self[event](self, ...)
	end
end

function TAM:MAIL_SHOW()
	if self:EnsureButtons() then
		self.takeAll:Show()
		self.takeCash:Show()
		self:UpdateButtons()
	end
end

function TAM:CreateButtons()
	if self.takeAll and self.takeCash then return end
	if not InboxFrame then return end

	local skins = E:GetModule('Skins', true)
	local useSkins = skins and E.private.skins.blizzard.enable and E.private.skins.blizzard.mail
	local closeButton = InboxFrameCloseButton or (InboxFrame and InboxFrame.CloseButton)
	local inboxTitle = InboxFrameTitleText or (InboxFrame and InboxFrame.TitleText)

	local takeAll = CreateFrame('Button', nil, InboxFrame, 'UIPanelButtonTemplate')
	takeAll:Size(120, 22)
	takeAll:SetText(L['Take All'])
	takeAll:ClearAllPoints()
	takeAll:Point('TOPLEFT', InboxFrame, 'TOPLEFT', 30, -40)

	if useSkins and skins then
		skins:HandleButton(takeAll)
	end

	takeAll:SetScript('OnClick', function()
		if IsShiftKeyDown() then
			self:StartOpening(2)
		else
			self:StartOpening()
		end
	end)

	local takeCash = CreateFrame('Button', nil, InboxFrame, 'UIPanelButtonTemplate')
	takeCash:Size(120, 22)
	takeCash:SetText(L['Take Cash'])
	takeCash:ClearAllPoints()

	if closeButton then
		takeCash:Point('TOPRIGHT', closeButton, 'BOTTOMRIGHT', 0, -10)
	elseif useSkins and skins then
		takeCash:Point('TOPRIGHT', InboxFrame, 'TOPRIGHT', -60, -40)
	else
		takeCash:Point('TOPRIGHT', InboxFrame, 'TOPRIGHT', -110, -40)
	end

	if useSkins and skins then
		skins:HandleButton(takeCash)
	end

	takeCash:SetScript('OnClick', function()
		self:StartOpening(1)
	end)

	self.takeAll = takeAll
	self.takeCash = takeCash

	takeAll:Hide()
	takeCash:Hide()
end

function TAM:Initialize()
	if self.initialized then return end

	self:RegisterEvent("MAIL_SHOW")
	self:RegisterEvent("MAIL_INBOX_UPDATE", "OnEvent")
	self:RegisterEvent("MAIL_CLOSED", function()
		if self.processing then
			self:StopOpening(true)
		end
	end)

	if InboxFrame and not InboxFrame.TAMHooked then
		local module = self
		InboxFrame:HookScript("OnShow", function()
			module:MAIL_SHOW()
		end)
		InboxFrame.TAMHooked = true
	end

	if MailFrame and MailFrame:IsShown() then
		if self:EnsureButtons() then
			self.takeAll:Show()
			self.takeCash:Show()
			self:UpdateButtons()
		end
	end

	self.initialized = true
end

local function InitializeCallback()
	TAM:Initialize()
end

E:RegisterModule(TAM:GetName(), InitializeCallback)








