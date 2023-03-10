-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore
    = minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
--<>----------------------------------------------------------------<>--
local function fossil(id, where)
	minetest.register_ore({
		name = modname .. ":fossil_" ..id,
		ore_type = "scatter",
		ore = modname .. ":fossil_" ..id,
		wherein = where,
		random_factor = 0,
		noise_params = {
			offset = 0,
			scale = 4,
			spread = {x = 20, y = 5, z = 20},
			seed = 61782,
			octaves = 3,
			persist = 0.5,
			flags = "eased",
		},
		noise_threshold = -1,
		y_max = 31000,
		y_min = -31000,
		clust_num_ores = 1,
		clust_size = 1,
		clust_scarcity = 8 * 8 * 8 * 4
	})
end
