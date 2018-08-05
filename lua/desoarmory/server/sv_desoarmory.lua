function deso.Notify(ply, enum, length, message)
	if (ply:IsValid()) then
		net.Start("deso_notify")
			net.WriteInt(enum, 4)
			net.WriteInt(length, 4)
			net.WriteString(message)
		net.Send(ply)
	end
end

local weps = 
{
	[1] = {["name"] = "M4", ["classname"] = "weapon_mad_m4", ["cost"] = 4000, ["image"] = "weapons/weapon_mad_m4.vtf"},
	[2] = {["name"] = "M3 SUPER", ["classname"] = "weapon_mad_m3", ["cost"] = 4000, ["image"] = "weapons/weapon_mad_m3.vtf"},
	[3] = {["name"] = "MP-5", ["classname"] = "weapon_mad_mp5", ["cost"] = 2500, ["image"] = "weapons/weapon_mad_mp5.vtf"},
	[4] = {["name"] = "Glock", ["classname"] = "weapon_mad_glock", ["cost"] = 1500, ["image"] = "weapons/weapon_mad_glock.vtf"},
	[5] = {["name"] = "Magnum Dong", ["classname"] = "weapon_mad_357", ["cost"] = 1500, ["image"] = "weapons/weapon_mad_357.vtf"},
	[6] = {["name"] = "Flash Grenade", ["classname"] = "weapon_mad_flash", ["cost"] = 3000, ["image"] = "weapons/weapon_mad_flash.vtf"}
}

function deso.armory.Purchase(ply, class)
	if (ply:IsValid() && ply:isCP()) then
		local wep
		local plyWeps = ply:GetWeapons()

		for k, v in ipairs(weps) do
			if (class == v.classname) then
				wep = v
				break
			end
		end

		for k, v in pairs(plyWeps) do
			if (v:GetClass() == class) then
				deso.Notify(ply, 1, 4, "You already have that weapon!")
				return
			end
		end

		if (ply:canAfford(wep.cost)) then
			ply:Give(class)
			ply:addMoney(-wep.cost)
			deso.Notify(ply, 0, 4, wep.name .. " successfully purchased!")
		else
			deso.Notify(ply, 1, 4, "You can't afford that!")
		end
	end
end