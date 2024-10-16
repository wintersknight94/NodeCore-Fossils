-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore
    = minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
--<>----------------------------------------------------------------<>--
minetest.register_tool(modname.. ":brush", {
	description = "Brush",
	tool_wears_to = "nc_tree:stick",
	inventory_image = modname .. "_tool_brush.png",
	groups = {flammable = 1},
	tool_capabilities = {
        groupcaps = {
            brushy = {times = {1.20, 0.80, 0.40}, uses = 1, maxlevel = 1},
        },
        punch_attack_uses = nil,
    },
	on_ignite = "nc_fire:lump_ash",
	sounds = nodecore.sounds("nc_terrain_grassy")
})
--<>----------------------------------------------------------------<>--
nodecore.register_craft({
	label = "assemble brush",
	normal = {y = 1},
	indexkeys = {"group:flora_sedges"},
	nodes = {
		{match = {groups = {flora_sedges = true}}, replace = "air"},
		{y = -1, match = "nc_tree:stick", replace = "air"}
	},
	items = {
			{name = modname .. ":brush"}
		}
})
--<>----------------------------------------------------------------<>--
