local E, _, V, P, G = unpack(ElvUI)
local C, L = unpack(select(2, ...))
local LSM = E.Libs.LSM

local function EnsureEnhancedDB()
	E.db.enhanced = E.db.enhanced or {}
	E.db.enhanced.actionbar = E.db.enhanced.actionbar or {}
	E.db.enhanced.actionbar.keyPressAnimation = E.db.enhanced.actionbar.keyPressAnimation or {}
	local kpa = E.db.enhanced.actionbar.keyPressAnimation
	if not kpa.color then kpa.color = {r = 1, g = 1, b = 1} end
	if kpa.scale == nil then kpa.scale = 1.5 end
	if kpa.rotation == nil then kpa.rotation = 90 end

	E.db.enhanced.blizzard = E.db.enhanced.blizzard or {}
	local blizz = E.db.enhanced.blizzard
	if blizz.takeAllMail == nil then blizz.takeAllMail = false end
	blizz.errorFrame = blizz.errorFrame or {}
	local ef = blizz.errorFrame
	if ef.enable == nil then ef.enable = false end
	if ef.width == nil then ef.width = 300 end
	if ef.height == nil then ef.height = 60 end
	if not ef.font then ef.font = "PT Sans Narrow" end
	if ef.fontSize == nil then ef.fontSize = 12 end
	if not ef.fontOutline then ef.fontOutline = "NONE" end

	E.db.enhanced.tooltip = E.db.enhanced.tooltip or {}
	local tooltip = E.db.enhanced.tooltip
	if tooltip.itemQualityBorderColor == nil then tooltip.itemQualityBorderColor = false end
	tooltip.tooltipIcon = tooltip.tooltipIcon or {}
	local icon = tooltip.tooltipIcon
	if icon.enable == nil then icon.enable = false end
	if icon.tooltipIconItems == nil then icon.tooltipIconItems = true end
	if icon.tooltipIconSpells == nil then icon.tooltipIconSpells = true end
	if icon.tooltipIconAchievements == nil then icon.tooltipIconAchievements = true end

	tooltip.progressInfo = tooltip.progressInfo or {}
	local progress = tooltip.progressInfo
	if progress.enable == nil then progress.enable = false end
	if progress.checkAchievements == nil then progress.checkAchievements = false end
	if progress.checkPlayer == nil then progress.checkPlayer = false end
	if not progress.modifier then progress.modifier = "SHIFT" end
	progress.tiers = progress.tiers or {}
	local tiers = progress.tiers
	if tiers.RS == nil then tiers.RS = true end
	if tiers.ICC == nil then tiers.ICC = true end
	if tiers.ToC == nil then tiers.ToC = true end
	if tiers.ToGC == nil then tiers.ToGC = true end
	if tiers.Ulduar == nil then tiers.Ulduar = true end

	return {
		keyPress = kpa,
		blizzard = blizz,
		tooltip = tooltip,
		progress = progress,
		icon = icon
	}
end

local function GetKeyPressModule()
	return E:GetModule("Enhanced_KeyPressAnimation", true)
end

local function GetBlizzardModule()
	return E:GetModule("Enhanced_Blizzard", true)
end

local function GetTakeAllMailModule()
	return E:GetModule("Enhanced_TakeAllMail", true)
end

local function GetTooltipIconModule()
	return E:GetModule("Enhanced_TooltipIcon", true)
end

local function GetItemBorderModule()
	return E:GetModule("Enhanced_ItemBorderColor", true)
end

local function GetProgressionModule()
	return E:GetModule("Enhanced_ProgressionInfo", true)
end

local function EnhancedConfig()
	if E.Options.args.enhanced then return end

	E.Options.args.enhanced = {
		order = 75,
		type = "group",
		name = L["Enhanced"],
		childGroups = "tab",
		args = {
			actionbar = {
				order = 1,
				type = "group",
				name = L["ActionBars"],
				args = {
					header = {
						order = 0,
						type = "header",
						name = L["ActionBars"]
					},
					keyPress = {
						order = 1,
						type = "group",
						name = L["Key Press Animation"],
						guiInline = true,
						args = {
							enable = {
								order = 1,
								type = "toggle",
								name = L["Enable"],
								get = function()
									E.private.enhanced = E.private.enhanced or {}
									E.private.enhanced.actionbar = E.private.enhanced.actionbar or {}
									return E.private.enhanced.actionbar.keyPressAnimation
								end,
								set = function(_, value)
									E.private.enhanced.actionbar.keyPressAnimation = value
									E:StaticPopup_Show("PRIVATE_RL")
								end
							},
							color = {
								order = 2,
								type = "color",
								name = L["COLOR"],
								get = function()
									local data = EnsureEnhancedDB()
									local t = data.keyPress.color
									return t.r, t.g, t.b
								end,
								set = function(_, r, g, b)
									local data = EnsureEnhancedDB()
									local keyPress = data.keyPress
									keyPress.color.r, keyPress.color.g, keyPress.color.b = r, g, b

									local module = GetKeyPressModule()
									if module and module.initialized then
										module:UpdateSetting()
									end
								end,
								disabled = function() return not E.private.enhanced.actionbar.keyPressAnimation end
							},
							scale = {
								order = 3,
								type = "range",
								name = L["Scale"],
								min = 1, max = 3, step = 0.1,
								get = function()
									local data = EnsureEnhancedDB()
									return data.keyPress.scale
								end,
								set = function(_, value)
									local data = EnsureEnhancedDB()
									data.keyPress.scale = value
									local module = GetKeyPressModule()
									if module and module.initialized then
										module:UpdateSetting()
									end
								end,
								disabled = function() return not E.private.enhanced.actionbar.keyPressAnimation end
							},
							rotation = {
								order = 4,
								type = "range",
								name = L["Rotation"],
								min = 0, max = 360, step = 1,
								get = function()
									local data = EnsureEnhancedDB()
									return data.keyPress.rotation
								end,
								set = function(_, value)
									local data = EnsureEnhancedDB()
									data.keyPress.rotation = value
									local module = GetKeyPressModule()
									if module and module.initialized then
										module:UpdateSetting()
									end
								end,
								disabled = function() return not E.private.enhanced.actionbar.keyPressAnimation end
							}
						}
					}
				}
			},
			blizzard = {
				order = 2,
				type = "group",
				name = L["BlizzUI Improvements"],
				args = {
					header = {
						order = 0,
						type = "header",
						name = L["BlizzUI Improvements"]
					},
					animatedAchievementBars = {
						order = 1,
						type = "toggle",
						name = L["Animated Achievement Bars"],
						get = function()
							E.private.enhanced = E.private.enhanced or {}
							return E.private.enhanced.animatedAchievementBars
						end,
						set = function(_, value)
							E.private.enhanced.animatedAchievementBars = value
							E:StaticPopup_Show("PRIVATE_RL")
						end
					},
					takeAllMail = {
						order = 2,
						type = "toggle",
						name = L["Take All Mail"],
						get = function()
							local data = EnsureEnhancedDB()
							return data.blizzard.takeAllMail
						end,
						set = function(_, value)
							local data = EnsureEnhancedDB()
							data.blizzard.takeAllMail = value
							if value then
								local module = GetTakeAllMailModule()
								if module and not module.initialized then
									module:Initialize()
								end
							else
								E:StaticPopup_Show("CONFIG_RL")
							end
						end
					},
					errorFrame = {
						order = 3,
						type = "group",
						name = L["Error Frame"],
						guiInline = true,
						get = function(info)
							local data = EnsureEnhancedDB()
							return data.blizzard.errorFrame[info[#info]]
						end,
						set = function(info, value)
							local data = EnsureEnhancedDB()
							data.blizzard.errorFrame[info[#info]] = value
							local module = GetBlizzardModule()
							if module and module.initialized then
								module:ErrorFrameSize()
							end
						end,
						args = {
							enable = {
								order = 1,
								type = "toggle",
								name = L["Enable"],
								get = function()
									local data = EnsureEnhancedDB()
									return data.blizzard.errorFrame.enable
								end,
								set = function(_, value)
									local data = EnsureEnhancedDB()
									data.blizzard.errorFrame.enable = value
									local module = GetBlizzardModule()
									if module and module.initialized then
										module:CustomErrorFrameToggle()
									end
								end
							},
							width = {
								order = 2,
								type = "range",
								name = L["Width"],
								min = 200, max = 1024, step = 1,
								disabled = function() return not E.db.enhanced.blizzard.errorFrame.enable end
							},
							height = {
								order = 3,
								type = "range",
								name = L["Height"],
								min = 32, max = 256, step = 1,
								disabled = function() return not E.db.enhanced.blizzard.errorFrame.enable end
							},
							font = {
								order = 4,
								type = "select",
								dialogControl = "LSM30_Font",
								name = L["Font"],
								values = LSM:HashTable("font"),
								disabled = function() return not E.db.enhanced.blizzard.errorFrame.enable end
							},
							fontSize = {
								order = 5,
								type = "range",
								name = L["Font Size"],
								min = 8, max = 32, step = 1,
								disabled = function() return not E.db.enhanced.blizzard.errorFrame.enable end
							},
							fontOutline = {
								order = 6,
								type = "select",
								name = L["Font Outline"],
								values = C.Values.FontFlags,
								disabled = function() return not E.db.enhanced.blizzard.errorFrame.enable end
							}
						}
					}
				}
			},
			tooltip = {
				order = 3,
				type = "group",
				name = L["Tooltip"],
				args = {
					header = {
						order = 0,
						type = "header",
						name = L["Tooltip"]
					},
					itemQualityBorderColor = {
						order = 1,
						type = "toggle",
						name = L["Item Border Color"],
						get = function()
							local data = EnsureEnhancedDB()
							return data.tooltip.itemQualityBorderColor
						end,
						set = function(_, value)
							local data = EnsureEnhancedDB()
							data.tooltip.itemQualityBorderColor = value
							local module = GetItemBorderModule()
							if module then
								if value and not module.initialized then
									module:Initialize()
								else
									module:ToggleState()
								end
							end
						end
					},
					tooltipIcon = {
						order = 2,
						type = "group",
						name = L["Tooltip Icon"],
						guiInline = true,
						args = {
							enable = {
								order = 1,
								type = "toggle",
								name = L["Enable"],
								get = function()
									local data = EnsureEnhancedDB()
									return data.icon.enable
								end,
								set = function(_, value)
									local data = EnsureEnhancedDB()
									data.icon.enable = value
									local module = GetTooltipIconModule()
									if module then
										if value and not module.initialized then
											module:Initialize()
										else
											module:ToggleItemsState()
											module:ToggleSpellsState()
											module:ToggleAchievementsState()
										end
									end
								end
							},
							tooltipIconItems = {
								order = 2,
								type = "toggle",
								name = L["ITEMS"],
								get = function()
									local data = EnsureEnhancedDB()
									return data.icon.tooltipIconItems
								end,
								set = function(_, value)
									local data = EnsureEnhancedDB()
									data.icon.tooltipIconItems = value
									local module = GetTooltipIconModule()
									if module and module.initialized then
										module:ToggleItemsState()
									end
								end,
								disabled = function() return not E.db.enhanced.tooltip.tooltipIcon.enable end
							},
							tooltipIconSpells = {
								order = 3,
								type = "toggle",
								name = L["Spells"],
								get = function()
									local data = EnsureEnhancedDB()
									return data.icon.tooltipIconSpells
								end,
								set = function(_, value)
									local data = EnsureEnhancedDB()
									data.icon.tooltipIconSpells = value
									local module = GetTooltipIconModule()
									if module and module.initialized then
										module:ToggleSpellsState()
									end
								end,
								disabled = function() return not E.db.enhanced.tooltip.tooltipIcon.enable end
							},
							tooltipIconAchievements = {
								order = 4,
								type = "toggle",
								name = L["Achievements"],
								get = function()
									local data = EnsureEnhancedDB()
									return data.icon.tooltipIconAchievements
								end,
								set = function(_, value)
									local data = EnsureEnhancedDB()
									data.icon.tooltipIconAchievements = value
									local module = GetTooltipIconModule()
									if module and module.initialized then
										module:ToggleAchievementsState()
									end
								end,
								disabled = function() return not E.db.enhanced.tooltip.tooltipIcon.enable end
							}
						}
					},
					progressInfo = {
						order = 3,
						type = "group",
						name = L["Progress Info"],
						guiInline = true,
						get = function(info)
							local data = EnsureEnhancedDB()
							return data.progress[info[#info]]
						end,
						set = function(info, value)
							local data = EnsureEnhancedDB()
							data.progress[info[#info]] = value
							local module = GetProgressionModule()
							if module then
								if not module.initialized and E.db.enhanced.tooltip.progressInfo.enable then
									module:Initialize()
								else
									module:ToggleState()
								end
							end
						end,
						args = {
							enable = {
								order = 1,
								type = "toggle",
								name = L["Enable"]
							},
							checkAchievements = {
								order = 2,
								type = "toggle",
								name = L["Check Achievements"],
								disabled = function() return not E.db.enhanced.tooltip.progressInfo.enable end
							},
							checkPlayer = {
								order = 3,
								type = "toggle",
								name = L["Check Player"],
								disabled = function() return not E.db.enhanced.tooltip.progressInfo.enable end
							},
							modifier = {
								order = 4,
								type = "select",
								name = L["Modifier"],
								values = {
									ALL = L["ALL"],
									SHIFT = L["SHIFT_KEY"],
									CTRL = L["CTRL_KEY"],
									ALT = L["ALT_KEY"]
								},
								get = function() return E.db.enhanced.tooltip.progressInfo.modifier end,
								set = function(_, value)
									E.db.enhanced.tooltip.progressInfo.modifier = value
									local module = GetProgressionModule()
									if module then
										if not module.initialized and E.db.enhanced.tooltip.progressInfo.enable then
											module:Initialize()
										else
											module:UpdateModifier()
										end
									end
								end,
								disabled = function() return not E.db.enhanced.tooltip.progressInfo.enable end
							},
							groups = {
								order = 5,
								type = "group",
								name = L["Tiers"],
								guiInline = true,
								get = function(info)
									local data = EnsureEnhancedDB()
									return data.progress.tiers[info[#info]]
								end,
								set = function(info, value)
									local data = EnsureEnhancedDB()
									data.progress.tiers[info[#info]] = value
									local module = GetProgressionModule()
									if module then
										if not module.initialized and E.db.enhanced.tooltip.progressInfo.enable then
											module:Initialize()
										else
											module:UpdateSettings()
										end
									end
								end,
								disabled = function() return not E.db.enhanced.tooltip.progressInfo.enable end,
								args = {
									RS = {
										order = 1,
										type = "toggle",
										name = L["Ruby Sanctum"]
									},
									ICC = {
										order = 2,
										type = "toggle",
										name = L["Icecrown Citadel"]
									},
									ToC = {
										order = 3,
										type = "toggle",
										name = L["Trial of the Crusader"]
									},
									ToGC = {
										order = 4,
										type = "toggle",
										name = L["Trial of the Grand Crusader"]
									},
									Ulduar = {
										order = 5,
										type = "toggle",
										name = L["Ulduar"]
									}
								}
							}
						}
					}
				}
			}
		}
	}
end

E.ConfigFuncs = E.ConfigFuncs or {}
tinsert(E.ConfigFuncs, EnhancedConfig)
EnhancedConfig()

