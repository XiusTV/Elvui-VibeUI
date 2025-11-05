-- UIEnhancements Module - Error filtering and auto-delete
local QH = WarcraftEnhanced or QuestHelper
local UIE = {}

function UIE:Initialize()
	if not QH or not QH.db then
		-- DB not ready yet
		return
	end
	self:SetupErrorFiltering()
	self:SetupAutoDelete()
end

function UIE:SetupErrorFiltering()
	if not ScriptErrorsFrame.QH_originalAddMessage then
		ScriptErrorsFrame.QH_originalAddMessage = ScriptErrorsFrame.AddMessage
		ScriptErrorsFrame.AddMessage = function(self, msg, ...)
			if not UIE:ShouldFilterError(msg) then
				ScriptErrorsFrame.QH_originalAddMessage(self, msg, ...)
			end
		end
	end
end

function UIE:ShouldFilterError(msg)
	if not QH or not QH.db then return false end
	if not QH.db.errorFiltering then return false end
	if not msg then return false end
	if not QH.db.errorFilters then return false end
	for filter, _ in pairs(QH.db.errorFilters) do
		if msg:find(filter) then
			return true
		end
	end
	return false
end

function UIE:SetupAutoDelete()
	if not QH or not QH.db or not QH.db.autoDelete then return end
	
	local oldOnShow = StaticPopupDialogs["DELETE_GOOD_ITEM"].OnShow
	StaticPopupDialogs["DELETE_GOOD_ITEM"].OnShow = function(frame)
		if oldOnShow then oldOnShow(frame) end
		if QH and QH.db and QH.db.autoDelete then
			frame.editBox:SetText("Delete")
		end
	end
end

function UIE:ToggleErrorFiltering(enabled)
	QH.db.errorFiltering = enabled
end

function UIE:ToggleAutoDelete(enabled)
	QH.db.autoDelete = enabled
	self:SetupAutoDelete()
end

-- Register module
QH:RegisterModule("UIEnhancements", UIE)

