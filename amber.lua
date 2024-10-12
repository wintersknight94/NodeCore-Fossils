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
	groups = {amber = 1, fossil = 1, lux_absorb = 8},
	sounds = nodecore.sounds("nc_optics_glassy")
})
minetest.register_craftitem(modname .. ":amber_bug", {
	description = "Amber",
	inventory_image = amber.. "^(" ..amberbug.. "^[opacity:100)",
	groups = {amber = 1, fossil = 1, bugamber = 1, lux_absorb = 8},
	sounds = nodecore.sounds("nc_optics_glassy")
})
-----<>----------------------------------------------------------<>-----
minetest.register_node(modname .. ":amber_fused", {
	description = "Fused Amber",	
	drawtype = "glasslike_framed",
	tiles = {
		modname .. "_fused.png^" .. modname .. "_amber_edges.png",
		modname.. "_fused.png"
	},
	use_texture_alpha = "blend",
	paramtype = "light",
	groups = {
		cracky = 1,
		lux_absorb = 32,
		fossil = 1,
		amber_node = 1,
		scaling_time = 240
	},
	sounds = nodecore.sounds("nc_optics_glassy"),
	visinv_bulk_optimize = true,
	no_repack = true,
	alternate_loose = {
		description = "Packed Amber",
		tiles = {modname.. "_fused.png^nc_api_loose.png"},
		use_texture_alpha = "clip",
		groups = {
			cracky = 0,
			crumbly = 2,
			lux_absorb = 24,
			scaling_time = 120,
			falling_repose = 1,
			amber_node = 1,
		},
		sounds = nodecore.sounds("nc_terrain_crunchy"),
	}
})
-----<>----------------------------------------------------------<>-----
nodecore.register_craft({
	label = "pack amber",
	action = "pummel",
	toolgroups = {thumpy = 3},
	indexkeys = {modname.. ":amber"},
	nodes = {
		{
			match = {name = modname .. ":amber", count = 8},
			replace = modname.. ":amber_fused_loose"
		}
	}
})
local function brkambr(suff, cracky, umph)
	return nodecore.register_craft({
		label = "break amber nodes apart",
		action = "pummel",
		toolgroups = {cracky = cracky},
		indexkeys = {modname .. ":amber_fused" .. suff},
		nodes = {
			{
				match = {name = modname .. ":amber_fused" .. suff},
				replace = "air"
			}
		},
		items = {
			{name = modname.. ":amber", count = 8, scatter = umph}
		},
		itemscatter = umph,
	})
end
brkambr("_loose", 2, 3)
brkambr("", 3, 6)
-----<>----------------------------------------------------------<>-----
nodecore.register_craft({
	label = "fuse amber",
	action = "cook",
	touchgroups = {flame = 3},
	neargroups = {coolant = 0},
	duration = 30,
	cookfx = true,
	indexkeys = {modname.. ":amber_fused_loose"},
	nodes = {
		{
			match = {name = modname.. ":amber_fused_loose"},
			replace = modname .. ":amber_fused"
		}
	}
})
--nodecore.register_cook_abm({nodenames = {modname.. ":amber_fused_loose"}, neighbors = {"group:flame"}})
--nodecore.register_cook_abm({nodenames = {modname .. ":amber_fused"}})
-----<>----------------------------------------------------------<>-----
local adzedef
adzedef = {
	description = "Amber-Tipped Adze",
	inventory_image = "nc_woodwork_adze.png^(nc_stonework_tip_adze.png^[colorize:gold:120)",
	groups = {
		firestick = 2,
		flammable = 2,
		lux_absorb = 8
	},
	tool_wears_to = "nc_woodwork:adze",
	tool_capabilities = nodecore.toolcaps({
			uses = 1.25,
			choppy = 2,
			crumbly = 3,
			cracky = 1,
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
				flammable = 2,
				lux_absorb = 8
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



