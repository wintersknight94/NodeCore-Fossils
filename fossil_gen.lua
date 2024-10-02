-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore
    = minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
--<>----------------------------------------------------------------<>--
local function fossil_gen(id, where, seed)
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
			seed = seed,
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
--<>----------------------------------------------------------------<>--
local function strata(sediment, substrate)
	fossil_gen("amber_" ..sediment, 		substrate,	190473)
	fossil_gen("bug_amber_" ..sediment, 	substrate,	982291)
	fossil_gen("sponge_" ..sediment, 		substrate,	293424)
	fossil_gen("shell_" ..sediment, 		substrate,	023291)
	fossil_gen("tooth_" ..sediment, 		substrate,	610938)
	
	if minetest.get_modpath("wc_naturae") then
		fossil_gen("leaf_" ..sediment, 		substrate,	578485)
		fossil_gen("fungus_" ..sediment, 	substrate,	376819)
	end
	
	if minetest.get_modpath("ncshark") then
		fossil_gen("shark_" ..sediment, 	substrate,	731642)
	end

	if minetest.get_modpath("wc_crystals") then
		fossil_gen("geode_" ..sediment, 	substrate,	472156)
	end
end
--<>----------------------------------------------------------------<>--
strata("sandy",		"nc_concrete:sandstone")
strata("muddy", 	"nc_concrete:adobe")
strata("tarry", 	"nc_concrete:coalstone")
strata("limey", 	"nc_concrete:cloudstone")

if minetest.get_modpath("wc_naturae") then
	strata("shelly",	 "wc_naturae:shellstone")
end

if minetest.get_modpath("wc_pottery") then
	strata("smecy",	 "wc_pottery:clay")
end

if minetest.get_modpath("wc_coal") then
	strata("dusty",		"wc_coal:lignite", 1)
	strata("bitty",		"wc_coal:bituminite", 1)
	strata("anthy",		"wc_coal:anthracite", 1)
end
--<>----------------------------------------------------------------<>--