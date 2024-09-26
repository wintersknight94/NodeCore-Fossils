-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore
    = minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()

local cast		= "wc_lib_resources_mask_nodulette.png"
--local cast		= modname.. "_cast_mask.png"
local sponge	= "(nc_sponge.png^[colorize:GRAY:164)^[mask:" ..cast
local shell 	= "(" ..modname.. "_shell.png^[colorize:GRAY:164)^[mask:" ..cast
local leaf		= "(wc_naturae_fern.png^[colorize:GRAY:132)^[mask:" ..cast
local fungus	= "(wc_naturae_mushroom.png^[colorize:GRAY:164)^[mask:" ..cast
local shark		= "(nc_terrain_gravel.png^[mask:ncshark_mask.png)^[mask:" ..cast

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