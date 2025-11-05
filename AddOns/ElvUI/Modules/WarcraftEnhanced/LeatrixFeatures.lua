-- WarcraftEnhanced Leatrix Features Module
-- Integrated features from Leatrix Plus

local QH = WarcraftEnhanced or QuestHelper
if not QH then return end

local LF = {}
QH.LeatrixFeatures = LF

-- Event frame
local LFEvt = CreateFrame("Frame")

----------------------------------------------------------------------
-- Helper: Friend Check (including guild members if enabled)
----------------------------------------------------------------------

function LF:FriendCheck(name, guid)
	-- Do nothing if name is empty
	if not name then return false end
	
	-- Update friends list
	ShowFriends()
	
	-- Remove realm if it exists
	if name ~= nil then
		name = strsplit("-", name, 2)
	end
	
	-- Check character friends
	for i = 1, GetNumFriends() do
		local friendName, _, _, _, friendConnected = GetFriendInfo(i)
		if friendName ~= nil then
			friendName = strsplit("-", friendName, 2)
			if (name == friendName) and friendConnected then
				return true
			end
		end
	end
	
	-- Check guild members if enabled
	if QH.db.friendlyGuild then
		if IsInGuild() then
			local gCount = GetNumGuildMembers()
			for i = 1, gCount do
				local gName, _, _, _, _, _, _, _, gOnline = GetGuildRosterInfo(i)
				if gOnline then
					gName = strsplit("-", gName, 2)
					if (name == gName) then
						return true
					end
				end
			end
		end
	end
	
	return false
end

----------------------------------------------------------------------
-- SOCIAL FEATURES
----------------------------------------------------------------------

-- Block Duels
function LF:SetupBlockDuels()
	if QH.db.blockDuels then
		LFEvt:RegisterEvent("DUEL_REQUESTED")
	else
		LFEvt:UnregisterEvent("DUEL_REQUESTED")
	end
end

-- Block Guild Invites
function LF:SetupBlockGuildInvites()
	if QH.db.blockGuildInvites then
		LFEvt:RegisterEvent("GUILD_INVITE_REQUEST")
	else
		LFEvt:UnregisterEvent("GUILD_INVITE_REQUEST")
	end
end


----------------------------------------------------------------------
-- GROUP FEATURES
----------------------------------------------------------------------

-- Party from Friends
function LF:SetupPartyFromFriends()
	if QH.db.acceptPartyFriends or QH.db.blockPartyInvites then
		LFEvt:RegisterEvent("PARTY_INVITE_REQUEST")
	else
		LFEvt:UnregisterEvent("PARTY_INVITE_REQUEST")
	end
end

----------------------------------------------------------------------
-- AUTOMATION FEATURES
----------------------------------------------------------------------

-- Release in PvP
function LF:SetupAutoReleasePvP()
	if QH.db.autoReleasePvP then
		LFEvt:RegisterEvent("PLAYER_DEAD")
	else
		LFEvt:UnregisterEvent("PLAYER_DEAD")
	end
end

-- Auto Spirit Res
function LF:SetupAutoSpiritRes()
	if QH.db.autoSpiritRes then
		LFEvt:RegisterEvent("RESURRECT_REQUEST")
	else
		LFEvt:UnregisterEvent("RESURRECT_REQUEST")
	end
end

-- Auto Sell Junk
function LF:SetupAutoSellJunk()
	if QH.db.autoSellJunk then
		LFEvt:RegisterEvent("MERCHANT_SHOW")
		LFEvt:RegisterEvent("MERCHANT_CLOSED")
	else
		LFEvt:UnregisterEvent("MERCHANT_SHOW")
		LFEvt:UnregisterEvent("MERCHANT_CLOSED")
	end
end

-- Auto Repair
function LF:SetupAutoRepair()
	if QH.db.autoRepair then
		LFEvt:RegisterEvent("MERCHANT_SHOW")
	else
		LFEvt:UnregisterEvent("MERCHANT_SHOW")
	end
end

----------------------------------------------------------------------
-- SYSTEM FEATURES
----------------------------------------------------------------------

-- Max Camera Zoom
function LF:SetupMaxCameraZoom()
	-- Try different CVar names for different client versions
	local cvarName = nil
	if GetCVar("cameraDistanceMaxZoomFactor") ~= nil then
		cvarName = "cameraDistanceMaxZoomFactor"
	elseif GetCVar("cameraDistanceMaxFactor") ~= nil then
		cvarName = "cameraDistanceMaxFactor"
	elseif GetCVar("cameraDistanceMax") ~= nil then
		cvarName = "cameraDistanceMax"
	end
	
	if cvarName then
		if QH.db.maxCameraZoom then
			SetCVar(cvarName, 2.6)
		else
			SetCVar(cvarName, 1.9)
		end
	else
		-- No compatible CVar found, disable feature
		if QH.db.maxCameraZoom then
			QH:Print("Max camera zoom not supported on this client version")
			QH.db.maxCameraZoom = false
		end
	end
end


----------------------------------------------------------------------
-- EVENT HANDLER
----------------------------------------------------------------------

LFEvt:SetScript("OnEvent", function(self, event, ...)
	local arg1, arg2, arg3, arg4, guid = ...
	
	----------------------------------------------------------------------
	-- Block Duels
	----------------------------------------------------------------------
	if event == "DUEL_REQUESTED" and not LF:FriendCheck(arg1) then
		CancelDuel()
		StaticPopup_Hide("DUEL_REQUESTED")
		return
	end
	
	----------------------------------------------------------------------
	-- Block Guild Invites
	----------------------------------------------------------------------
	if event == "GUILD_INVITE_REQUEST" then
		if not LF:FriendCheck(arg1, guid) then
			DeclineGuild()
			StaticPopup_Hide("GUILD_INVITE")
		end
		return
	end
	
	----------------------------------------------------------------------
	-- Party Invites from Friends/Whispers
	----------------------------------------------------------------------
	if event == "PARTY_INVITE_REQUEST" then
		-- If a friend, accept if you're accepting friends
		if QH.db.acceptPartyFriends and LF:FriendCheck(arg1, guid) then
			AcceptGroup()
			for i = 1, STATICPOPUP_NUMDIALOGS do
				if _G["StaticPopup" .. i].which == "PARTY_INVITE" then
					_G["StaticPopup" .. i].inviteAccepted = 1
					StaticPopup_Hide("PARTY_INVITE")
					break
				elseif _G["StaticPopup" .. i].which == "PARTY_INVITE_XREALM" then
					_G["StaticPopup" .. i].inviteAccepted = 1
					StaticPopup_Hide("PARTY_INVITE_XREALM")
					break
				end
			end
			return
		end
		
		-- If not a friend and you're blocking invites, decline
		if QH.db.blockPartyInvites then
			if not LF:FriendCheck(arg1, guid) then
				DeclineGroup()
				StaticPopup_Hide("PARTY_INVITE")
				StaticPopup_Hide("PARTY_INVITE_XREALM")
			end
		end
		return
	end
	
	----------------------------------------------------------------------
	-- Auto Release in PvP
	----------------------------------------------------------------------
	if event == "PLAYER_DEAD" then
		local sType = select(2, IsActiveBattlefieldArena())
		if sType and sType == "DEATH" and QH.db.autoReleasePvP then
			C_Timer.After(0.5, function()
				RepopMe()
			end)
		end
		return
	end
	
	----------------------------------------------------------------------
	-- Auto Spirit Res
	----------------------------------------------------------------------
	if event == "RESURRECT_REQUEST" then
		if QH.db.autoSpiritRes then
			AcceptResurrect()
			StaticPopup_Hide("RESURRECT")
			StaticPopup_Hide("RESURRECT_NO_SICKNESS")
			StaticPopup_Hide("RESURRECT_NO_TIMER")
		end
		return
	end
	
	----------------------------------------------------------------------
	-- Auto Sell Junk
	----------------------------------------------------------------------
	if event == "MERCHANT_SHOW" then
		if QH.db.autoSellJunk and not IsShiftKeyDown() then
			C_Timer.After(0.2, function()
				local totalPrice = 0
				local itemsSold = 0
				
				for bag = 0, 4 do
					for slot = 1, GetContainerNumSlots(bag) do
						local itemLink = GetContainerItemLink(bag, slot)
						if itemLink then
							local _, _, quality, _, _, _, _, _, _, _, vendorPrice = GetItemInfo(itemLink)
							if quality == 0 and vendorPrice and vendorPrice > 0 then
								local _, count = GetContainerItemInfo(bag, slot)
								totalPrice = totalPrice + (vendorPrice * count)
								itemsSold = itemsSold + count
								UseContainerItem(bag, slot)
							end
						end
					end
				end
				
				if itemsSold > 0 and QH.db.autoSellJunkSummary then
					local gold, silver, copper = floor(totalPrice / 10000), floor((totalPrice % 10000) / 100), totalPrice % 100
					QH:Print(string.format("Sold %d items for |cffffffff%dg %ds %dc|r", itemsSold, gold, silver, copper))
				end
			end)
		end
		
		-- Auto Repair
		if QH.db.autoRepair and not IsShiftKeyDown() and CanMerchantRepair() then
			local repairCost, canRepair = GetRepairAllCost()
			if canRepair and repairCost > 0 then
				local useGuildFunds = QH.db.autoRepairGuildFunds and CanGuildBankRepair() and repairCost <= GetGuildBankWithdrawMoney()
				RepairAllItems(useGuildFunds)
				
				if QH.db.autoRepairSummary then
					local gold, silver, copper = floor(repairCost / 10000), floor((repairCost % 10000) / 100), repairCost % 100
					local source = useGuildFunds and " (Guild)" or ""
					QH:Print(string.format("Repaired for |cffffffff%dg %ds %dc|r%s", gold, silver, copper, source))
				end
			end
		end
		return
	end
	
	if event == "MERCHANT_CLOSED" then
		-- Cleanup if needed
		return
	end
end)

----------------------------------------------------------------------
-- Initialize Module
----------------------------------------------------------------------

function LF:Initialize()
	-- Social
	self:SetupBlockDuels()
	self:SetupBlockGuildInvites()
	
	-- Groups
	self:SetupPartyFromFriends()
	
	-- Automation
	self:SetupAutoReleasePvP()
	self:SetupAutoSpiritRes()
	self:SetupAutoSellJunk()
	self:SetupAutoRepair()
	
	-- System
	self:SetupMaxCameraZoom()
-- Silent load
end

-- Register this module
QH:RegisterModule("LeatrixFeatures", LF)

