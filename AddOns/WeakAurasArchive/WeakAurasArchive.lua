-- WeakAurasArchive
-- This addon provides archive storage for WeakAuras history and migration data
-- It is loaded on demand by WeakAuras when needed

-- Initialize the saved variable if it doesn't exist
if not WeakAurasArchive then
  WeakAurasArchive = {}
end

-- Ensure the archive table structure exists
if not WeakAurasArchive.Repository then
  WeakAurasArchive.Repository = {}
end

if not WeakAurasArchive.Repository.history then
  WeakAurasArchive.Repository.history = {
    stores = {}
  }
end

if not WeakAurasArchive.Repository.migration then
  WeakAurasArchive.Repository.migration = {
    stores = {}
  }
end

-- Simple initialization function
local function Initialize()
  -- Nothing special needed, just ensure the table exists
  return true
end

-- Register the addon
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, addon)
  if addon == "WeakAurasArchive" then
    Initialize()
    self:UnregisterEvent("ADDON_LOADED")
  end
end)

