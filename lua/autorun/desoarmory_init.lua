if (SERVER) then
	deso = deso || {}
	deso.armory = deso.armory || {}

	AddCSLuaFile "desoarmory/client/cl_fonts.lua"
	AddCSLuaFile "desoarmory/client/cl_vgui.lua"
	AddCSLuaFile "desoarmory/client/cl_desoarmory.lua"
	AddCSLuaFile "desoarmory/cl_main.lua"
	
	include "desoarmory/sv_main.lua"
end

if (CLIENT) then
	deso = deso || {}
	deso.armory = deso.armory || {}

	include "desoarmory/client/cl_fonts.lua"
	include "desoarmory/client/cl_vgui.lua"
	include "desoarmory/client/cl_desoarmory.lua"
	include "desoarmory/cl_main.lua"
end