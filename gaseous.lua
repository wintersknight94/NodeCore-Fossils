-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore
    = minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
-- ================================================================== --
	
minetest.register_node(modname ..":methane", {
	description = "Natural Gas",
	tiles = {"nc_concrete_etched.png^[opacity:20"},
	use_texture_alpha = "blend",
	drawtype = "glasslike_framed",		--"allfaces_optional",
	drowning = 3,
	paramtype = "light",
	sunlight_propagates = true,
	floodable = false,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	touchthru = true,
	groups = {
		gaseous = 1,
		methane = 1,
		flammable = 1,
		fossil_fuel = 1
	},
--	sounds = nodecore.sounds("nc_api_craft_hiss")
	post_effect_color = {a=20, r=200, g=200, b=200},
	
})
