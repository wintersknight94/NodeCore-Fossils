-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore
    = minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
-- ================================================================== --
if minetest.settings:get_bool(modname .. ".hydrocarbon_gas", true) then
minetest.register_ore({
	ore_type = "blob",
	ore  = modname.. ":methane",
	wherein = {"group:stone", "group:sandstone", "group:coalstone", "group:adobe", "group:coal"},
	clust_scarcity = 128 * 64 * 128,
	clust_num_ores = 16,
	clust_size = 16,
	y_max = -128,
	y_min = -1024,
	noise_threshold = 0,
	noise_params = {
		offset = 0.2,
		scale = 0.2,
		spread = {x = 64, y = 16, z = 64},
		seed = 84654,
		octaves = 1,
		persist = 0.0,
		flags = "eased",
	},
})
end
-- ================================================================== --
if minetest.settings:get_bool(modname .. ".hydrocarbon_oil", true) then
minetest.register_ore({
	ore_type = "blob",
	ore  = modname.. ":oil_source",
	wherein = {"group:stone", "group:sandstone", "group:coalstone", "group:adobe", "group:coal", "group:shellstone"},
	clust_scarcity = 128 * 64 * 128,
	clust_num_ores = 16,
	clust_size = 32,
	y_max = -128,
	y_min = -1024,
	noise_threshold = 0,
	noise_params = {
		offset = 0.2,
		scale = 0.2,
		spread = {x = 16, y = 8, z = 16},
		seed = 19874,
		octaves = 1,
		persist = 0.0,
		flags = "eased",
	},
})
end
-- ================================================================== --
