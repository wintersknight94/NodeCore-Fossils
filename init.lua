-- LUALOCALS < ---------------------------------------------------------
local include, minetest, nodecore
    = include, minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
------------------------------------------------------------------------

if minetest.settings:get_bool(modname .. ".oilwater", true) then
	include("contaminated")
  else include("crude")
end

include("gaseous")	

include("brush")
include("brush_fancy")

include("amber")
include("casts")
include("tooth")

include("deposits")

include("fossils")
include("fossil_gen")

include("archaeology")

