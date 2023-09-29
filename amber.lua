-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore
    = minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
-----<>----------------------------------------------------------<>-----
local coalstone	= "nc_terrain_stone.png^[colorize:#000000:160"

local amber 	= modname.. "_amber.png^[mask:nc_lux_dot_mask.png"
local amberbug	= "(" ..coalstone.. ")^[mask:nc_woodwork_ladder_mask.png"
--<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>--
--<>-----<> Amber <>-----<>--
minetest.register_craftitem(modname .. ":amber", {
	description = "Amber",
	inventory_image = amber,
	groups = {amber = 1, fossil = 1},
	sounds = nodecore.sounds("nc_optics_glassy")
})
minetest.register_craftitem(modname .. ":amber_bug", {
	description = "Amber",
	inventory_image = amber.. "^(" ..amberbug.. "^[opacity:100)",
	groups = {amber = 1, fossil = 1, bugamber = 1},
	sounds = nodecore.sounds("nc_optics_glassy")
})
-----<>----------------------------------------------------------<>-----
local adzedef
adzedef = {
	description = "Amber-Tipped Adze",
	inventory_image = "nc_woodwork_adze.png^(nc_stonework_tip_adze.png^[colorize:gold:120)",
	groups = {
		firestick = 2,
		flammable = 2
	},
	tool_wears_to = "nc_woodwork:adze",
	tool_capabilities = nodecore.toolcaps({
			uses = 1.25,
			choppy = 2,
			crumbly = 2,
			cracky = 2
		}),
	sounds = nodecore.sounds("nc_optics_glassy"),
}
minetest.register_tool(modname .. ":adze_amber", adzedef)
------------------------------------------------------------------------
nodecore.register_craft({
		label = "assemble amber adze",
		action = "stackapply",
		wield = {name = modname.. ":amber"},
		consumewield = 1,
		indexkeys = {"nc_woodwork:adze"},
		nodes = {
			{
				match = {
					name = "nc_woodwork:adze",
					wear = 0.05
				},
				replace = "air"
			},
		},
		items = {
			{name = modname .. ":adze_amber"}
		}
	})
-- ================================================================== --
-- ================================================================== --
local function tooltip(name, group)
	local tool = modname .. ":tool_" .. name:lower() .. "_amber"
	local wood = "nc_woodwork:tool_" .. name:lower()
	minetest.register_tool(tool, {
			description = "Amber-Tipped " .. name,
			inventory_image = "nc_woodwork_tool_" .. name:lower() .. ".png^(nc_stonework_tip_" .. name:lower() .. ".png^[colorize:gold:120)",
			tool_wears_to = wood,
			groups = {
				flammable = 2
			},
			tool_capabilities = nodecore.toolcaps({
					uses = 1.25,
					[group] = 3
				}),
			on_ignite = modname .. ":amber",
			sounds = nodecore.sounds("nc_optics_glassy")
		})
	local woodmatch = {name = wood, wear = 0.05}
	nodecore.register_craft({
			label = "assemble " .. tool,
			action = "stackapply",
			wield = {name = modname.. ":amber"},
			consumewield = 1,
			indexkeys = {wood},
			nodes = {{match = woodmatch, replace = "air"}},
			items = {tool}
		})
end

tooltip("Mallet", "thumpy")
tooltip("Spade", "crumbly")
tooltip("Hatchet", "choppy")
tooltip("Pick", "cracky")



