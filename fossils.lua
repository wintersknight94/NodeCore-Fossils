-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore
    = minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
-- ================================================================== --
local sandstone	= "nc_concrete_sandstone.png"
local dirtstone	= "nc_concrete_adobe.png"
local coalstone	= "nc_terrain_stone.png^[colorize:#000000:160"
local limestone	= "nc_concrete_cloudstone.png"

local shell 	= modname.. "_shell.png^[mask:nc_lux_dot_mask.png"
local amber 	= modname.. "_amber.png^[mask:nc_lux_dot_mask.png"
local amberbug	= "(" ..coalstone.. ")^[mask:nc_woodwork_ladder_mask.png" 
local bugfossil	= amber.. "^(" ..amberbug.. "^[opacity:100)"
local sponge	= "nc_sponge.png^[mask:nc_lux_dot_mask.png"
local leaves	= "nc_tree_leaves.png^[mask:nc_lux_dot_mask.png"
-- ================================================================== --
------------------------------------------------------------------------
local function register_fossil(id, desc, txr, hardness, inplace)
	minetest.register_node(modname.. ":fossil_" ..id,{
		description = desc.. " Fossil",
		tiles = {txr},
		groups = {
			fossil = 1,
			rock = 1,
			cracky = hardness,
		},
		silktouch = false,
		crush_damage = 2,
		sounds = nodecore.sounds("nc_terrain_stony"),
		visinv_bulk_optimize = true,
		no_repack = true,
		alternate_loose = {
			tiles = {txr.. "^nc_api_loose.png"},
			groups = {
				cracky = 0,
				crumbly = 2,
				brushy = 1,
					falling_repose = 2,
			},
			sounds = nodecore.sounds("nc_terrain_chompy"),
			drop_in_place = inplace
		}
	})
end
-- ================================================================== --
local function strata(substrate, within, degrade, level)
	register_fossil("amber_" ..substrate,		"Amber",		"(" ..within.. ")^(" ..amber.. "^[opacity:100)",		level,	degrade)
	register_fossil("bug_amber_" ..substrate,	"Amber",		"(" ..within.. ")^(" ..bugfossil.. "^[opacity:100)",		level,	degrade)
	register_fossil("sponge_" ..substrate,	"Sponge",		"(" ..within.. ")^(" ..sponge.. "^[opacity:100)",		level,	degrade)
	register_fossil("leaf_" ..substrate,		"Leaf",		"(" ..within.. ")^(" ..leaves.. "^[opacity:100)",		level,	degrade)
	register_fossil("shell_" ..substrate,		"Shell",		"(" ..within.. ")^(" ..shell.. "^[opacity:100)",		level,	degrade)
end
-- ================================================================== --
strata("sandy",		sandstone,		"nc_terrain:sand",		1)
strata("muddy",		dirtstone,		"nc_terrain:dirt",		1)
strata("tarry",		coalstone,		"nc_terrain:gravel",		2)
strata("limey",		limestone,		"nc_optics:glass_crude",	1)

if minetest.get_modpath("wc_naturae") then
	local shellstone = "wc_naturae_shellstone.png"
	strata("shelly", shellstone, "wc_naturae:coquina", 1)
end
-- ================================================================== --
