local E, _, V, P, G = unpack(ElvUI); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local C, L = unpack(select(2, ...))
-- local WM = E:GetModule("WorldMap") -- Removed - Using Mapster instead
local MM = E:GetModule("Minimap")
local AB = E:GetModule("ActionBars")
-- local MMk = E:GetModule("MapMarkers") -- Removed - Using Mapster instead
local function EnsureButtonGrabberDB()
	E.db.general = E.db.general or {}
	E.db.general.minimap = E.db.general.minimap or {}
	E.db.general.minimap.buttonGrabber = E.db.general.minimap.buttonGrabber or {}

	local db = E.db.general.minimap.buttonGrabber
	if db.enable == nil then db.enable = false end
	if db.backdrop == nil then db.backdrop = false end
	if db.backdropSpacing == nil then db.backdropSpacing = 1 end
	if db.mouseover == nil then db.mouseover = false end
	if db.alpha == nil then db.alpha = 1 end
	if db.buttonSize == nil then db.buttonSize = 22 end
	if db.buttonSpacing == nil then db.buttonSpacing = 0 end
	if db.buttonsPerRow == nil then db.buttonsPerRow = 1 end
	if not db.growFrom then db.growFrom = "TOPLEFT" end

	db.insideMinimap = db.insideMinimap or {}
	local inside = db.insideMinimap
	if inside.enable == nil then inside.enable = true end
	if not inside.position then inside.position = "TOPLEFT" end
	if inside.xOffset == nil then inside.xOffset = -1 end
	if inside.yOffset == nil then inside.yOffset = 1 end

	return db
end


local Mapster = E:GetModule("Mapster", true)

-- Build Mapster options group with all modules
local function BuildMapsterOptions()
	if not (Mapster and Mapster.GetOptions) then
		return {
			order = 1,
			type = "group",
			name = L["WORLD_MAP"],
			args = {
				header = {
					order = 1,
					type = "header",
					name = L["WORLD_MAP"] .. " - Mapster (Loading...)"
				},
		buttonGrabber = {
			order = 6,
			type = "group",
			name = L["Minimap Button Grabber"],
			get = function(info)
				local db = EnsureButtonGrabberDB()
				return db[info[#info]]
			end,
			set = function(info, value)
				local db = EnsureButtonGrabberDB()
				db[info[#info]] = value
				local module = E:GetModule("WarcraftEnhanced_MinimapButtonGrabber", true)
				if module then
					module.db = EnsureButtonGrabberDB()
					module:UpdateLayout()
				end
			end,
			args = {
				enable = {
					order = 1,
					type = "toggle",
					name = L["Enable"],
					get = function()
						local db = EnsureButtonGrabberDB()
						return db.enable
					end,
					set = function(_, value)
						local db = EnsureButtonGrabberDB()
						db.enable = value
						local module = E:GetModule("WarcraftEnhanced_MinimapButtonGrabber", true)
						if module then
							module:HandleEnableState()
						end
						if not value then
							E:StaticPopup_Show("CONFIG_RL")
						end
					end,
					disabled = false
				},
				spacer1 = {
					order = 2,
					type = "description",
					name = " ",
					width = "full"
				},
				growFrom = {
					order = 3,
					type = "select",
					name = L["Grow direction"],
					values = {
						["TOPLEFT"] = "DOWN -> RIGHT",
						["TOPRIGHT"] = "DOWN -> LEFT",
						["BOTTOMLEFT"] = "UP -> RIGHT",
						["BOTTOMRIGHT"] = "UP -> LEFT"
					},
							disabled = function()
								local db = EnsureButtonGrabberDB()
								return not db.enable
							end
				},
				buttonsPerRow = {
					order = 4,
					type = "range",
					name = L["Buttons Per Row"],
					min = 1, max = 12, step = 1,
							disabled = function()
								local db = EnsureButtonGrabberDB()
								return not db.enable
							end
				},
				buttonSize = {
					order = 5,
					type = "range",
					name = L["Button Size"],
					min = 10, max = 60, step = 1,
							disabled = function()
								local db = EnsureButtonGrabberDB()
								return not db.enable
							end
				},
				buttonSpacing = {
					order = 6,
					type = "range",
					name = L["Button Spacing"],
					min = -1, max = 24, step = 1,
							disabled = function()
								local db = EnsureButtonGrabberDB()
								return not db.enable
							end
				},
				backdrop = {
					order = 7,
					type = "toggle",
					name = L["Backdrop"],
					set = function(info, value)
								local db = EnsureButtonGrabberDB()
								db[info[#info]] = value
						local module = E:GetModule("WarcraftEnhanced_MinimapButtonGrabber", true)
						if module then
									module.db = EnsureButtonGrabberDB()
							module:UpdateLayout()
						end
					end,
					disabled = function() return not E.db.general.minimap.buttonGrabber.enable end
				},
				backdropSpacing = {
					order = 8,
					type = "range",
					name = L["Backdrop Spacing"],
					min = -1, max = 15, step = 1,
							disabled = function()
								local db = EnsureButtonGrabberDB()
								return not db.enable or not db.backdrop
							end,
				},
				mouseover = {
					order = 9,
					type = "toggle",
					name = L["Mouse Over"],
					set = function(info, value)
								local db = EnsureButtonGrabberDB()
								db[info[#info]] = value
						local module = E:GetModule("WarcraftEnhanced_MinimapButtonGrabber", true)
						if module then
									module.db = EnsureButtonGrabberDB()
							module:ToggleMouseover()
						end
					end,
							disabled = function()
								local db = EnsureButtonGrabberDB()
								return not db.enable
							end
				},
				alpha = {
					order = 10,
					type = "range",
					name = L["Alpha"],
					min = 0, max = 1, step = 0.01,
					set = function(info, value)
								local db = EnsureButtonGrabberDB()
								db[info[#info]] = value
						local module = E:GetModule("WarcraftEnhanced_MinimapButtonGrabber", true)
						if module then
									module.db = EnsureButtonGrabberDB()
							module:UpdateAlpha()
						end
					end,
							disabled = function()
								local db = EnsureButtonGrabberDB()
								return not db.enable
							end
				},
				insideMinimap = {
					order = 11,
					type = "group",
					name = L["Inside Minimap"],
					guiInline = true,
					get = function(info)
						local db = EnsureButtonGrabberDB()
						return db.insideMinimap[info[#info]]
					end,
					set = function(info, value)
						local db = EnsureButtonGrabberDB()
						db.insideMinimap[info[#info]] = value
						local module = E:GetModule("WarcraftEnhanced_MinimapButtonGrabber", true)
						if module then
							module.db = EnsureButtonGrabberDB()
							module:UpdatePosition()
							module:UpdateLayout()
						end
					end,
					disabled = function()
						local db = EnsureButtonGrabberDB()
						return not db.enable
					end,
					args = {
						enable = {
							order = 1,
							type = "toggle",
							name = L["Enable"],
							set = function(info, value)
								local db = EnsureButtonGrabberDB()
								db.insideMinimap[info[#info]] = value
								local module = E:GetModule("WarcraftEnhanced_MinimapButtonGrabber", true)
								if module then
									module.db = EnsureButtonGrabberDB()
									module:UpdatePosition()
								end
							end
						},
						position = {
							order = 2,
							type = "select",
							name = L["Position"],
							values = {
								["TOPLEFT"] = L["Top Left"],
								["TOPRIGHT"] = L["Top Right"],
								["BOTTOMLEFT"] = L["Bottom Left"],
								["BOTTOMRIGHT"] = L["Bottom Right"]
							},
									disabled = function()
										local db = EnsureButtonGrabberDB()
										return not db.insideMinimap.enable
									end
						},
						xOffset = {
							order = 3,
							type = "range",
							name = L["X-Offset"],
							min = -100, max = 100, step = 1,
											disabled = function()
												local db = EnsureButtonGrabberDB()
												return not db.insideMinimap.enable
											end
						},
						yOffset = {
							order = 4,
							type = "range",
							name = L["Y-Offset"],
							min = -100, max = 100, step = 1,
											disabled = function()
												local db = EnsureButtonGrabberDB()
												return not db.insideMinimap.enable
											end
						}
					}
				}
			}
		},
				info = {
					order = 2,
					type = "description",
					name = "Mapster world map module is loading. Please reload your UI if this message persists.",
					fontSize = "medium",
				}
			}
		}
	end
	
	local mapsterOpts = Mapster:GetOptions()
	if mapsterOpts and mapsterOpts.args then
		if Mapster.GetModuleOptions then
			local zoneOptions = Mapster:GetModuleOptions("ZoneLevels")
			if zoneOptions then
				mapsterOpts.args.zoneInfo = zoneOptions
			end
		end

		-- Return the full Mapster options with all modules
		return {
			order = 1,
			type = "group",
			name = L["WORLD_MAP"],
			childGroups = "tab",
			args = mapsterOpts.args
		}
	end
	
	-- Fallback
	return {
		order = 1,
		type = "group",
		name = L["WORLD_MAP"],
		args = {
			header = {
				order = 1,
				type = "header",
				name = L["WORLD_MAP"] .. " - Mapster"
			}
		}
	}
end

E.Options.args.maps = {
	order = 90, -- Alphabetical: M
	type = "group",
	name = L["Maps"],
	childGroups = "tab",
	args = {
		worldMap = BuildMapsterOptions(),
		minimap = {
			order = 2,
			type = "group",
			name = L["MINIMAP_LABEL"],
			get = function(info) return E.db.general.minimap[info[#info]] end,
			childGroups = "tab",
			args = {
				minimapHeader = {
					order = 1,
					type = "header",
					name = L["MINIMAP_LABEL"]
				},
				generalGroup = {
					order = 2,
					type = "group",
					name = L["General"],
					guiInline = true,
					args = {
						enable = {
							order = 1,
							type = "toggle",
							name = L["Enable"],
							desc = L["Enable/Disable the minimap. |cffFF0000Warning: This will prevent you from seeing the consolidated buffs bar, and prevent you from seeing the minimap datatexts.|r"],
							get = function(info) return E.private.general.minimap[info[#info]] end,
							set = function(info, value) E.private.general.minimap[info[#info]] = value E:StaticPopup_Show("PRIVATE_RL") end
						},
					size = {
						order = 2,
						type = "range",
						name = L["Size"],
						desc = L["Adjust the size of the minimap."],
						min = 120, max = 250, step = 1,
						get = function(info) return E.db.general.minimap[info[#info]] end,
						set = function(info, value) E.db.general.minimap[info[#info]] = value MM:UpdateSettings() end,
						disabled = function() return not E.private.general.minimap.enable end
					},
					configButton = {
						order = 3,
						type = "toggle",
						name = L["Config Button"],
						desc = "Show/hide the ElvUI configuration button next to the minimap.",
						get = function(info) return E.db.general.minimap.configButton end,
						set = function(info, value) E.db.general.minimap.configButton = value MM:UpdateSettings() end,
						disabled = function() return not E.private.general.minimap.enable or not E.db.general.reminder.enable or not E.db.datatexts.minimapPanels end
					}
				}
			},
				locationTextGroup = {
					order = 3,
					type = "group",
					name = L["Location Text"],
					args = {
						locationHeader = {
							order = 1,
							type = "header",
							name = L["Location Text"]
						},
						locationText = {
							order = 2,
							type = "select",
							name = L["Location Text"],
							desc = L["Change settings for the display of the location text that is on the minimap."],
							get = function(info) return E.db.general.minimap.locationText end,
							set = function(info, value) E.db.general.minimap.locationText = value MM:UpdateSettings() MM:Update_ZoneText() end,
							values = {
								["MOUSEOVER"] = L["Minimap Mouseover"],
								["SHOW"] = L["Always Display"],
								["HIDE"] = L["HIDE"]
							},
							disabled = function() return not E.private.general.minimap.enable end
						},
						spacer = {
							order = 3,
							type = "description",
							name = "\n"
						},
						locationFont = {
							order = 4,
							type = "select",
							dialogControl = "LSM30_Font",
							name = L["Font"],
							values = AceGUIWidgetLSMlists.font,
							set = function(info, value) E.db.general.minimap.locationFont = value MM:Update_ZoneText() end,
							disabled = function() return not E.private.general.minimap.enable end
						},
						locationFontSize = {
							order = 5,
							type = "range",
							name = L["FONT_SIZE"],
							min = 6, max = 36, step = 1,
							set = function(info, value) E.db.general.minimap.locationFontSize = value MM:Update_ZoneText() end,
							disabled = function() return not E.private.general.minimap.enable end
						},
						locationFontOutline = {
							order = 6,
							type = "select",
							name = L["Font Outline"],
							set = function(info, value) E.db.general.minimap.locationFontOutline = value MM:Update_ZoneText() end,
							disabled = function() return not E.private.general.minimap.enable end,
							values = C.Values.FontFlags
						}
					}
				},
				zoomResetGroup = {
					order = 4,
					type = "group",
					name = L["Reset Zoom"],
					args = {
						zoomResetHeader = {
							order = 1,
							type = "header",
							name = L["Reset Zoom"]
						},
						enableZoomReset = {
							order = 2,
							type = "toggle",
							name = L["Reset Zoom"],
							get = function(info) return E.db.general.minimap.resetZoom.enable end,
							set = function(info, value) E.db.general.minimap.resetZoom.enable = value MM:UpdateSettings() end,
							disabled = function() return not E.private.general.minimap.enable end
						},
						zoomResetTime = {
							order = 3,
							type = "range",
							name = L["Seconds"],
							min = 1, max = 15, step = 1,
							get = function(info) return E.db.general.minimap.resetZoom.time end,
							set = function(info, value) E.db.general.minimap.resetZoom.time = value MM:UpdateSettings() end,
							disabled = function() return (not E.db.general.minimap.resetZoom.enable or not E.private.general.minimap.enable) end
						}
					}
				},
				icons = {
					order = 5,
					type = "group",
					name = L["Buttons"],
					args = {
						header = {
							order = 0,
							type = "header",
							name = L["Buttons"]
						},
						calendar = {
							order = 1,
							type = "group",
							name = L["Calendar"],
							get = function(info) return E.db.general.minimap.icons.calendar[info[#info]] end,
							set = function(info, value) E.db.general.minimap.icons.calendar[info[#info]] = value MM:UpdateSettings() end,
							disabled = function() return not E.private.general.minimap.enable end,
							args = {
								calendarHeader = {
									order = 1,
									type = "header",
									name = L["Calendar"]
								},
								hideCalendar = {
									order = 2,
									type = "toggle",
									name = L["HIDE"],
									get = function(info) return E.private.general.minimap.hideCalendar end,
									set = function(info, value) E.private.general.minimap.hideCalendar = value MM:UpdateSettings() end,
									width = "full"
								},
								spacer = {
									order = 3,
									type = "description",
									name = "",
									width = "full"
								},
								position = {
									order = 4,
									type = "select",
									name = L["Position"],
									disabled = function() return E.private.general.minimap.hideCalendar end,
									values = {
										["LEFT"] = L["Left"],
										["RIGHT"] = L["Right"],
										["TOP"] = L["Top"],
										["BOTTOM"] = L["Bottom"],
										["TOPLEFT"] = L["Top Left"],
										["TOPRIGHT"] = L["Top Right"],
										["BOTTOMLEFT"] = L["Bottom Left"],
										["BOTTOMRIGHT"] = L["Bottom Right"]
									}
								},
								scale = {
									order = 5,
									type = "range",
									name = L["Scale"],
									min = 0.5, max = 2, step = 0.05,
									disabled = function() return E.private.general.minimap.hideCalendar end
								},
								xOffset = {
									order = 6,
									type = "range",
									name = L["X-Offset"],
									min = -50, max = 50, step = 1,
									disabled = function() return E.private.general.minimap.hideCalendar end
								},
								yOffset = {
									order = 7,
									type = "range",
									name = L["Y-Offset"],
									min = -50, max = 50, step = 1,
									disabled = function() return E.private.general.minimap.hideCalendar end
								}
							}
						},
						mail = {
							order = 3,
							type = "group",
							name = L["MAIL_LABEL"],
							get = function(info) return E.db.general.minimap.icons.mail[info[#info]] end,
							set = function(info, value) E.db.general.minimap.icons.mail[info[#info]] = value MM:UpdateSettings() end,
							disabled = function() return not E.private.general.minimap.enable end,
							args = {
								mailHeader = {
									order = 1,
									type = "header",
									name = L["MAIL_LABEL"]
								},
								position = {
									order = 2,
									type = "select",
									name = L["Position"],
									values = {
										["LEFT"] = L["Left"],
										["RIGHT"] = L["Right"],
										["TOP"] = L["Top"],
										["BOTTOM"] = L["Bottom"],
										["TOPLEFT"] = L["Top Left"],
										["TOPRIGHT"] = L["Top Right"],
										["BOTTOMLEFT"] = L["Bottom Left"],
										["BOTTOMRIGHT"] = L["Bottom Right"]
									}
								},
								scale = {
									order = 3,
									type = "range",
									name = L["Scale"],
									min = 0.5, max = 2, step = 0.05
								},
								xOffset = {
									order = 4,
									type = "range",
									name = L["X-Offset"],
									min = -50, max = 50, step = 1
								},
								yOffset = {
									order = 5,
									type = "range",
									name = L["Y-Offset"],
									min = -50, max = 50, step = 1
								}
							}
						},
						lfgEye = {
							order = 4,
							type = "group",
							name = L["LFG Queue"],
							get = function(info) return E.db.general.minimap.icons.lfgEye[info[#info]] end,
							set = function(info, value) E.db.general.minimap.icons.lfgEye[info[#info]] = value MM:UpdateSettings() end,
							disabled = function() return not E.private.general.minimap.enable end,
							args = {
								lfgEyeHeader = {
									order = 1,
									type = "header",
									name = L["LFG Queue"]
								},
								position = {
									order = 2,
									type = "select",
									name = L["Position"],
									values = {
										["LEFT"] = L["Left"],
										["RIGHT"] = L["Right"],
										["TOP"] = L["Top"],
										["BOTTOM"] = L["Bottom"],
										["TOPLEFT"] = L["Top Left"],
										["TOPRIGHT"] = L["Top Right"],
										["BOTTOMLEFT"] = L["Bottom Left"],
										["BOTTOMRIGHT"] = L["Bottom Right"]
									}
								},
								scale = {
									order = 3,
									type = "range",
									name = L["Scale"],
									min = 0.5, max = 2, step = 0.05
								},
								xOffset = {
									order = 4,
									type = "range",
									name = L["X-Offset"],
									min = -50, max = 50, step = 1
								},
								yOffset = {
									order = 5,
									type = "range",
									name = L["Y-Offset"],
									min = -50, max = 50, step = 1
								}
							}
						},
						battlefield = {
							order = 5,
							type = "group",
							name = L["PvP Queue"],
							get = function(info) return E.db.general.minimap.icons.battlefield[info[#info]] end,
							set = function(info, value) E.db.general.minimap.icons.battlefield[info[#info]] = value MM:UpdateSettings() end,
							disabled = function() return not E.private.general.minimap.enable end,
							args = {
								battlefieldHeader = {
									order = 1,
									type = "header",
									name = L["PvP Queue"]
								},
								position = {
									order = 2,
									type = "select",
									name = L["Position"],
									values = {
										["LEFT"] = L["Left"],
										["RIGHT"] = L["Right"],
										["TOP"] = L["Top"],
										["BOTTOM"] = L["Bottom"],
										["TOPLEFT"] = L["Top Left"],
										["TOPRIGHT"] = L["Top Right"],
										["BOTTOMLEFT"] = L["Bottom Left"],
										["BOTTOMRIGHT"] = L["Bottom Right"]
									}
								},
								scale = {
									order = 3,
									type = "range",
									name = L["Scale"],
									min = 0.5, max = 2, step = 0.05
								},
								xOffset = {
									order = 4,
									type = "range",
									name = L["X-Offset"],
									min = -50, max = 50, step = 1
								},
								yOffset = {
									order = 5,
									type = "range",
									name = L["Y-Offset"],
									min = -50, max = 50, step = 1
								}
							}
						},
						difficulty = {
							order = 6,
							type = "group",
							name = L["Instance Difficulty"],
							get = function(info) return E.db.general.minimap.icons.difficulty[info[#info]] end,
							set = function(info, value) E.db.general.minimap.icons.difficulty[info[#info]] = value MM:UpdateSettings() end,
							disabled = function() return not E.private.general.minimap.enable end,
							args = {
								difficultyHeader = {
									order = 1,
									type = "header",
									name = L["Instance Difficulty"]
								},
								position = {
									order = 2,
									type = "select",
									name = L["Position"],
									values = {
										["LEFT"] = L["Left"],
										["RIGHT"] = L["Right"],
										["TOP"] = L["Top"],
										["BOTTOM"] = L["Bottom"],
										["TOPLEFT"] = L["Top Left"],
										["TOPRIGHT"] = L["Top Right"],
										["BOTTOMLEFT"] = L["Bottom Left"],
										["BOTTOMRIGHT"] = L["Bottom Right"]
									}
								},
								scale = {
									order = 3,
									type = "range",
									name = L["Scale"],
									min = 0.5, max = 2, step = 0.05
								},
								xOffset = {
									order = 4,
									type = "range",
									name = L["X-Offset"],
									min = -50, max = 50, step = 1
								},
								yOffset = {
									order = 5,
									type = "range",
									name = L["Y-Offset"],
									min = -50, max = 50, step = 1
								}
							}
						},
						vehicleLeave = {
							order = 7,
							type = "group",
							name = L["LEAVE_VEHICLE"],
							get = function(info) return E.db.general.minimap.icons.vehicleLeave[info[#info]] end,
							set = function(info, value) E.db.general.minimap.icons.vehicleLeave[info[#info]] = value AB:UpdateVehicleLeave() end,
							disabled = function() return not E.private.general.minimap.enable end,
							args = {
								vehicleLeaveHeader = {
									order = 1,
									type = "header",
									name = L["LEAVE_VEHICLE"]
								},
								hide = {
									order = 2,
									type = "toggle",
									name = L["HIDE"]
								},
								spacer = {
									order = 3,
									type = "description",
									name = "",
									width = "full"
								},
								position = {
									order = 4,
									type = "select",
									name = L["Position"],
									values = {
										["LEFT"] = L["Left"],
										["RIGHT"] = L["Right"],
										["TOP"] = L["Top"],
										["BOTTOM"] = L["Bottom"],
										["TOPLEFT"] = L["Top Left"],
										["TOPRIGHT"] = L["Top Right"],
										["BOTTOMLEFT"] = L["Bottom Left"],
										["BOTTOMRIGHT"] = L["Bottom Right"]
									}
								},
								scale = {
									order = 5,
									type = "range",
									name = L["Scale"],
									min = 0.5, max = 2, step = 0.05,
								},
								xOffset = {
									order = 6,
									type = "range",
									name = L["X-Offset"],
									min = -50, max = 50, step = 1
								},
								yOffset = {
									order = 7,
									type = "range",
									name = L["Y-Offset"],
									min = -50, max = 50, step = 1
								}
							}
						}
					}
				}
			}
		}
		-- Removed magnify options - Mapster includes similar zoom functionality
	}
}
