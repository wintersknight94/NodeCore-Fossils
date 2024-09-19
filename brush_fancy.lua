-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore
    = minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
--<>----------------------------------------------------------------<>--
minetest.register_tool(modname.. ":brush_fancy", {
	description = "Archeologist's Brush",
	tool_wears_to = modname.. ":amber_bug",
	inventory_image = modname .. "_tool_brush_fancy.png",
	groups = {flammable = 1},
	tool_capabilities = {
        groupcaps = {
            brushy = {times = {1.20, 0.80, 0.40}, uses = 2, maxlevel = 2},
        },
        punch_attack_uses = nil,
    },
	on_ignite = modname.. ":amber_bug",
	sounds = nodecore.sounds("nc_terrain_grassy")
})
--<>----------------------------------------------------------------<>--
nodecore.register_craft({
	label = "assemble fancy brush",
	normal = {y = 1},
	indexkeys = {"group:flora_sedges"},
	nodes = {
		{match = {groups = {flora_sedges = true}}, replace = "air"},
		{y = -1, match = "nc_tree:stick", replace = "air"},
		{y = -2, match = {groups = {bugamber = true}}, replace = "air"},
	},
	items = {
			{name = modname .. ":brush_fancy"}
		}
})
--<>----------------------------------------------------------------<>--
