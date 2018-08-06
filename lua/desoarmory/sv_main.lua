--[[-------------------------------------------------
	Net Strings
---------------------------------------------------]]

util.AddNetworkString "deso_notify"
util.AddNetworkString "deso_cparmory_open"
util.AddNetworkString "deso_cparmory_purchase_wep"
util.AddNetworkString "deso_cparmory_purchase_ammo"

--[[-------------------------------------------------
	Net Messages
---------------------------------------------------]]

net.Receive("deso_cparmory_purchase_wep", function(len, ply) deso.armory.PurchaseWep(ply, net.ReadString()) end) -- net.ReadString() is the wep classname
net.Receive("deso_cparmory_purchase_ammo", function(len, ply) deso.armory.PurchaseAmmo(ply, net.ReadString()) end) -- net.ReadString() is the ammo classname

--[[-------------------------------------------------
	Hooks
---------------------------------------------------]]

hook.Add("InitPostEntity", "deso_armory_spawn", deso.armory.SpawnArmory)