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
	toolgroups = {brushy = 1, crumbly = 1}, --crumbly for the time being until i solve 'brushy' issue
	indexkeys = {modname .. ":fossil_" ..node},
	nodes = {
		{match = modname .. ":fossil_" ..node, replace = remain}
	},
	items = {
		{name = modname.. ":" ..item},
	}
})
end

local function strata(substrata, eroded)
	brush_fossil("amber_" ..substrata.. "_loose",		"amber",		eroded)
	brush_fossil("bug_amber_" ..substrata.. "_loose",		"amber_bug",	eroded)
--	brush_fossil("leaf_" ..substrata.. "_loose",			"leaf",		eroded)
--	brush_fossil("sponge_" ..substrata.. "_loose",		"sponge",		eroded)
--	brush_fossil("shell_" ..substrata.. "_loose",		"shell",		eroded)
end

strata("sandy",	"nc_terrain:sand")
strata("muddy",	"nc_terrain:dirt")
strata("tarry",	"nc_terrain:gravel")
strata("limey",	"nc_optics:glass_crude")

if minetest.get_modpath("wc_naturae") then
	local shellstone = "wc_naturae_shellstone.png"
	strata("shelly",	"wc_naturae:coquina")
end
