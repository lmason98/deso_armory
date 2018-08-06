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

local ammos =
{
	[1] = {["classname"] = "ammo_556x45", ["amount"] = 30, ["cost"] = 200, ["image"] = "weapons/weapon_mad_m4.vtf"},
	[2] = {["classname"] = "buckshot", ["amount"] = 8, ["cost"] = 200, ["image"] = "weapons/weapon_mad_m3.vtf"},
	[3] = {["classname"] = "battery", ["amount"] = 30, ["cost"] = 200, ["image"] = "weapons/weapon_mad_mp5.vtf"},
	[4] = {["classname"] = "battery", ["amount"] = 20, ["cost"] = 150, ["image"] = "weapons/weapon_mad_glock.vtf"},
	[5] = {["classname"] = "357", ["amount"] = 6, ["cost"] = 200, ["image"] = "weapons/weapon_mad_357.vtf"},
	[6] = {["classname"] = "grenade", ["amount"] = 1, ["cost"] = 1000, ["image"] = "weapons/weapon_mad_flash.vtf"}
}

function deso.armory.SpawnArmory()
	local pos = Vector(-1699.765503, 33.053696, -124.024139)
	local ang = Angle(0, 90, 0)

	local ent = ents.Create("deso_armory")
	ent:SetPos(pos)
	ent:SetAngles(ang)
	ent:Spawn()
end

function deso.armory.PurchaseWep(ply, class)
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

function deso.armory.PurchaseAmmo(ply, class)
	if (ply:IsValid() && ply:isCP()) then
		local ammo

		for k, v in ipairs(ammos) do
			if (class == v.classname) then
				ammo = v
				break
			end
		end

		if (ply:canAfford(ammo.cost)) then
			ply:GiveAmmo(ammo.amount, ammo.classname)
			ply:addMoney(-ammo.cost)
		else
			deso.Notify(ply, 1, 4, "You can't afford that!")
		end
	end
end