-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore
    = minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
--<>----------------------------------------------------------------<>--

local function brush_fossil(node, item, remain)
nodecore.register_craft({
	label = "brush fossil",
	action = "pummel",
	priority = 1,
--	duration = 10,
	toolgroups = {brushy = 1}, --crumbly for the time being until i solve 'brushy' issue
	indexkeys = {modname .. ":fossil_" ..node},
	nodes = {
		{match = modname .. ":fossil_" ..node, replace = remain}
	},
	items = {
		{name = item},
	}
})
end

local function strata(substrata, eroded)
	brush_fossil("amber_" ..substrata.. "_loose",		modname.. ":amber",		eroded)
	brush_fossil("bug_amber_" ..substrata.. "_loose",	modname.. ":amber_bug",	eroded)
	brush_fossil("sponge_" ..substrata.. "_loose",		modname.. ":cast_sponge",		eroded)
	brush_fossil("shell_" ..substrata.. "_loose",		modname.. ":cast_shell",		eroded)
	
	if minetest.get_modpath("wc_naturae") then
		brush_fossil("leaf_" ..substrata.. "_loose",		modname.. ":cast_leaf",		eroded)
		brush_fossil("fungus_" ..substrata.. "_loose",		modname.. ":cast_fungus",		eroded)
	end
	
	if minetest.get_modpath("ncshark") then
		brush_fossil("shark_" ..substrata.. "_loose",		modname.. ":cast_shark",		eroded)
	end
	
	if minetest.get_modpath("wc_crystals") then
		brush_fossil("geode_" ..substrata.. "_loose",		"wc_crystals:geode",		eroded)
	end
end

strata("sandy",	"nc_terrain:sand")
strata("muddy",	"nc_terrain:dirt")
strata("tarry",	"nc_terrain:gravel")
strata("limey",	"nc_optics:glass_crude")

if minetest.get_modpath("wc_naturae") then
	strata("shelly",	"wc_naturae:coquina")
end

if minetest.get_modpath("wc_pottery") then
	strata("smecy",		"wc_pottery:clay")
end

if minetest.get_modpath("wc_coal") then
	strata("dusty",		"wc_coal:lignite_loose", 1)
	strata("bitty",		"wc_coal:bituminite_loose", 1)
	strata("anthy",		"wc_coal:anthracite_loose", 1)
end