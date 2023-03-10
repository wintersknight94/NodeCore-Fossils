-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore
    = minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
-- ================================================================== --
-- I do not add this to the game lightly. Human caused climate change is an
-- extremely serious issue. There are so many things we are doing that are
-- causing irreparable damage to the environment, and mining fossil fuels 
-- is only the tip of the iceberg. If you care about future generations,
-- or animal rights, or your own health, please take notice and due anything
-- and everthing you can to reduce your carbon footprint, and help protect
-- the planet and the various organisms that we share it with. Thank You.
-- ================================================================== --
local function anim(name)
	return {
		name = name,
		animation = {
			["type"] = "vertical_frames",
			aspect_w = 16,
			aspect_h = 16,
			length = 8
		}
	}
end

local srctxr = anim("nc_terrain_water_gray.png^[colorize:black:200")
local flwtxr = anim("nc_terrain_water_gray_flow.png^[colorize:black:200")
------------------------------------------------------------------------
local oildef = {
	description = "Crude Oil",
	drawtype = "liquid",
	tiles = {srctxr},
	special_tiles = {flwtxr, flwtxr},
--	use_texture_alpha = "blend",
	paramtype = "light",
	liquid_viscosity = 16,
	liquid_renewable = false,
	liquid_range = 6,
	pointable = false,
	walkable = false,
	buildable_to = true,
	drowning = 6,
	drop = "",
	groups = {
		oil = 1,
		fluid = 1,
		liquid = 1,
		coolant = 1,
		lubricant = 1,
		fossil_fuel = 1,
		flammable = 3
	},
	post_effect_color = {a = 240, r = 10, g = 10, b = 10},
	liquid_alternative_flowing = modname .. ":oil_flowing",
	liquid_alternative_source = modname .. ":oil_source",
	sounds = nodecore.sounds("nc_terrain_bubbly")
}
minetest.register_node(modname.. ":oil_source",
	nodecore.underride({
		liquidtype = "source"
	}, oildef))
minetest.register_node(modname.. ":oil_flowing",
	nodecore.underride({
		liquidtype = "flowing",
		drawtype = "flowingliquid",
		paramtype2 = "flowingliquid"
	}, oildef))
-- ================================================================== --
-- ================================================================== --
minetest.register_node(modname.. ":dirt_dead",{
	description = "Dirt",
	tiles = {"(nc_terrain_dirt.png^[colorize:gray:20)^(nc_fire_coal_1.png^[opacity:20)"},
	soil_degrades_to = modname .. ":sand",
	alternate_loose = {
		soil_degrades_to = modname .. ":sand_loose",
		groups = {
			deaddirt_loose = 1,
			falling_repose = 2,
		}
	},
	groups = {
		falling_node = 1,
		deaddirt = 1,
		crumbly = 1,
	},
	crush_damage = 1,
	sounds = nodecore.sounds("nc_terrain_crunchy"),
	visinv_bulk_optimize = true
})
-- ================================================================== --
-- Our species is making this planet less habitable every day.
-- ================================================================== --
local poison_table = { -- alive, dead
	{"group:grass",					modname.. ":dirt_dead"},
	{"nc_terrain:dirt",				modname.. ":dirt_dead"},
	{"nc_terrain:dirt_loose",			modname.. ":dirt_dead_loose"},
	{"nc_tree:root",				modname.. ":dirt_dead"},
	{"nc_tree:humus",				modname.. ":dirt_dead"},
	{"nc_tree:humus_loose",			modname.. ":dirt_dead_loose"},
	{"nc_tree:tree",				"nc_tree:log"},
	{"nc_tree:tree_bud",				"nc_tree:log"},
	{"nc_tree:eggcorn_planted",		modname.. ":dirt_dead"},
	{"nc_tree:leaves",				"nc_tree:leaves_loose"},
	{"nc_tree:leaves_bud",			"nc_tree:leaves_loose"},
	{"nc_tree:peat",				modname.. ":dirt_dead"},
	{"group:flora_sedge",				"air"},
	{"nc_flora:flower_1_1",			"nc_flora:flower_1_0"},
	{"nc_flora:flower_1_2",			"nc_flora:flower_1_0"},
	{"nc_flora:flower_1_3",			"nc_flora:flower_1_0"},
	{"nc_flora:flower_1_4",			"nc_flora:flower_1_0"},
	{"nc_flora:flower_1_5",			"nc_flora:flower_1_0"},
	{"nc_flora:flower_1_6",			"nc_flora:flower_1_0"},
	{"nc_flora:flower_1_7",			"nc_flora:flower_1_0"},
	{"nc_flora:flower_1_8",			"nc_flora:flower_1_0"},
	{"nc_flora:flower_1_9",			"nc_flora:flower_1_0"},
	{"nc_flora:flower_2_1",			"nc_flora:flower_2_0"},
	{"nc_flora:flower_2_2",			"nc_flora:flower_2_0"},
	{"nc_flora:flower_2_3",			"nc_flora:flower_2_0"},
	{"nc_flora:flower_2_4",			"nc_flora:flower_2_0"},
	{"nc_flora:flower_2_5",			"nc_flora:flower_2_0"},
	{"nc_flora:flower_2_6",			"nc_flora:flower_2_0"},
	{"nc_flora:flower_2_7",			"nc_flora:flower_2_0"},
	{"nc_flora:flower_2_8",			"nc_flora:flower_2_0"},
	{"nc_flora:flower_2_9",			"nc_flora:flower_2_0"},
	{"nc_flora:flower_3_1",			"nc_flora:flower_3_0"},
	{"nc_flora:flower_3_2",			"nc_flora:flower_3_0"},
	{"nc_flora:flower_3_3",			"nc_flora:flower_3_0"},
	{"nc_flora:flower_3_4",			"nc_flora:flower_3_0"},
	{"nc_flora:flower_3_5",			"nc_flora:flower_3_0"},
	{"nc_flora:flower_3_6",			"nc_flora:flower_3_0"},
	{"nc_flora:flower_3_7",			"nc_flora:flower_3_0"},
	{"nc_flora:flower_3_8",			"nc_flora:flower_3_0"},
	{"nc_flora:flower_3_9",			"nc_flora:flower_3_0"},
	{"nc_flora:flower_4_1",			"nc_flora:flower_4_0"},
	{"nc_flora:flower_4_2",			"nc_flora:flower_4_0"},
	{"nc_flora:flower_4_3",			"nc_flora:flower_4_0"},
	{"nc_flora:flower_4_4",			"nc_flora:flower_4_0"},
	{"nc_flora:flower_4_5",			"nc_flora:flower_4_0"},
	{"nc_flora:flower_4_6",			"nc_flora:flower_4_0"},
	{"nc_flora:flower_4_7",			"nc_flora:flower_4_0"},
	{"nc_flora:flower_4_8",			"nc_flora:flower_4_0"},
	{"nc_flora:flower_4_9",			"nc_flora:flower_4_0"},
	{"nc_flora:flower_5_1",			"nc_flora:flower_5_0"},
	{"nc_flora:flower_5_2",			"nc_flora:flower_5_0"},
	{"nc_flora:flower_5_3",			"nc_flora:flower_5_0"},
	{"nc_flora:flower_5_4",			"nc_flora:flower_5_0"},
	{"nc_flora:flower_5_5",			"nc_flora:flower_5_0"},
	{"nc_flora:flower_5_6",			"nc_flora:flower_5_0"},
	{"nc_flora:flower_5_7",			"nc_flora:flower_5_0"},
	{"nc_flora:flower_5_8",			"nc_flora:flower_5_0"},
	{"nc_flora:flower_5_9",			"nc_flora:flower_5_0"},
	{"nc_sponge:sponge_living",		"nc_sponge:sponge"},
}

for i in ipairs (poison_table) do
	local alive	= poison_table[i][1]
	local dead		= poison_table[i][2]
	
nodecore.register_abm({
		label = "Poisoning the Earth",
		nodenames = {alive},
		neighbors = {"group:oil"},
		neighbors_invert = true,
		interval = 20,
		chance = 4,
		action = function(pos)
			nodecore.set_loud(pos, {name = dead})
			minetest.check_for_falling(pos)
		end
	})
end

