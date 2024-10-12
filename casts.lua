-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore
    = minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()

local cast		=	"wc_lib_resources_mask_nodulette.png"
local sponge	=	"(nc_sponge.png^[colorize:DARKGREY:200)^[mask:" ..cast
local shell 	=	"(" ..modname.. "_shell.png^[colorize:DARKGREY:200)^[mask:" ..cast
local leaf		=	"(wc_naturae_fern.png^[colorize:DARKGREY:200)^[mask:" ..cast
local fungus	=	"(wc_naturae_mushroom.png^[colorize:DARKGREY:200)^[mask:" ..cast
local shark		=	"(nc_terrain_gravel.png^[mask:ncshark_mask.png)^[mask:" ..cast
local scales	=	"(nc_lode_ore.png^nc_terrain_cobble.png^[colorize:DARKGREY:100)^[mask:" ..cast

--<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>--

minetest.register_craftitem(modname .. ":cast_shell", {
	description = "Shell Fossil",
	inventory_image = shell,
	groups = {fossil = 1},
	sounds = nodecore.sounds("nc_terrain_stony")
})

-----<>----------------------------------------------------------<>-----

minetest.register_craftitem(modname .. ":cast_sponge", {
	description = "Sponge Fossil",
	inventory_image = sponge,
	groups = {fossil = 1},
	sounds = nodecore.sounds("nc_terrain_stony")
})

-----<>----------------------------------------------------------<>-----

minetest.register_craftitem(modname .. ":cast_scale", {
	description = "Scale Fossil",
	inventory_image = scales,
	groups = {fossil = 1, metallic = 1, lux_scatter = 32},
	sounds = nodecore.sounds("nc_terrain_stony")
})

--<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>--
if minetest.get_modpath("wc_naturae") then
	minetest.register_craftitem(modname .. ":cast_leaf", {
		description = "Leaf Fossil",
		inventory_image = leaf,
		groups = {fossil = 1},
		sounds = nodecore.sounds("nc_terrain_stony")
	})
	minetest.register_craftitem(modname .. ":cast_fungus", {
		description = "Fungus Fossil",
		inventory_image = fungus,
		groups = {fossil = 1},
		sounds = nodecore.sounds("nc_terrain_stony")
	})
end
--<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>--
if minetest.get_modpath("ncshark") then
	minetest.register_craftitem(modname .. ":cast_shark", {
		description = "Shark Fossil",
		inventory_image = shark,
		groups = {fossil = 1},
		sounds = nodecore.sounds("nc_terrain_stony")
	})
end
--<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>--

--<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>=====<>--