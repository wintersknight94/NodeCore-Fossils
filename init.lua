-- LUALOCALS < ---------------------------------------------------------
local include, nodecore
    = include, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
------------------------------------------------------------------------

if minetest.settings:get_bool(modname .. ".oilwater", true) then
	include("contaminated")
  else include("crude")
end

include("gaseous")	

include("brush")

include("amber")
include("casts")

--include("geode")

include("deposits")

include("fossils")
include("fossil_gen")

include("archaeology")

