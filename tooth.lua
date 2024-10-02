-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore
    = minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
-----<>----------------------------------------------------------<>-----
local tooth 	= modname.. "_tooth.png"
--<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>--
minetest.register_craftitem(modname .. ":tooth", {
	description = "Wurmfang",
	inventory_image = tooth,
	groups = {tooth = 1, fossil = 1},
	sounds = nodecore.sounds("nc_terrain_stony")
})
-----<>----------------------------------------------------------<>-----
local adzedef
adzedef = {
	description = "Wurmfang-Tipped Adze",
	inventory_image = "nc_woodwork_adze.png^(nc_stonework_tip_adze.png^[colorize:WHITE:128)",
	groups = {
		firestick = 2,
		flammable = 2
	},
	tool_wears_to = "nc_woodwork:adze",
	tool_capabilities = nodecore.toolcaps({
			uses = 1.45,
			choppy = 2,
			crumbly = 3,
			cracky = 1
		}),
	sounds = nodecore.sounds("nc_optics_glassy"),
}
minetest.register_tool(modname .. ":adze_tooth", adzedef)
------------------------------------------------------------------------
nodecore.register_craft({
		label = "assemble tooth adze",
		action = "stackapply",
		wield = {name = modname.. ":tooth"},
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
			{name = modname .. ":adze_tooth"}
		}
	})
-- ================================================================== --
-- ================================================================== --
local function tooltip(name, group)
	local tool = modname .. ":tool_" .. name:lower() .. "_tooth"
	local wood = "nc_woodwork:tool_" .. name:lower()
	minetest.register_tool(tool, {
			description = "Wurmfang-Tipped " .. name,
			inventory_image = "nc_woodwork_tool_" .. name:lower() .. ".png^(nc_stonework_tip_" .. name:lower() .. ".png^[colorize:WHITE:128)",
			tool_wears_to = wood,
			groups = {
				flammable = 2
			},
			tool_capabilities = nodecore.toolcaps({
					uses = 1.45,
					[group] = 3
				}),
			on_ignite = modname .. ":tooth",
			sounds = nodecore.sounds("nc_optics_glassy")
		})
	local woodmatch = {name = wood, wear = 0.05}
	nodecore.register_craft({
			label = "assemble " .. tool,
			action = "stackapply",
			wield = {name = modname.. ":tooth"},
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



