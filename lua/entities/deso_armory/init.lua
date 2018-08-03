AddCSLuaFile "shared.lua"
AddCSLuaFile "cl_init.lua"

include "shared.lua"

function ENT:Initialize()
	self:SetModel("models/props_c17/lockers001a.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)

	local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then phys:Wake() end
end

function ENT:Use(activator, caller)
	if (caller:IsPlayer() && caller:isCP()) then
		net.Start("deso_cparmory_open")
		net.Send(caller)
	end
end