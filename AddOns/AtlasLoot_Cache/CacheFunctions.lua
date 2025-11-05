local function CheckIfEmptyTable(table)
	if next(table) then
		return false
	else
		return true
	end
end

local databaseUpdated
--Updates the ItemIDsDatabase with any missing or incorrect items
function LoadItemIDsDatabase()
	AtlasLootItemCache = AtlasLootItemCache or {}
    if databaseUpdated then return end
	--loads any items in the saved varriables cache
    if AtlasLootItemCache and not CheckIfEmptyTable(AtlasLootItemCache) then
		for normalID, item in pairs(AtlasLootItemCache) do
			for itemDif, itemID in pairs(item) do
				ItemIDsDatabase[normalID] = ItemIDsDatabase[normalID] or {}
				ItemIDsDatabase[normalID][itemDif] = itemID
			end
		end
	end

    collectgarbage("collect")
    databaseUpdated = true
end

--[[
GetItemDifficultyID(id, difficulty)
Finds the Ids of other difficulties based on the normal id of the item and the difficulty parameter given.
]]
function GetItemDifficultyID(id, difficulty)
	if not difficulty or difficulty == 3 then return id end
	local correctID = ItemIDsDatabaseCorrectedIDs[id] or ItemIDsDatabase[id]
	if correctID and correctID[difficulty] then
		return correctID[difficulty]
	end
	return id
end