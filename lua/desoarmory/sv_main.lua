--[[-------------------------------------------------
	Net Strings
---------------------------------------------------]]

util.AddNetworkString "deso_notify"
util.AddNetworkString "deso_cparmory_open"
util.AddNetworkString "deso_cparmory_purchase"

--[[-------------------------------------------------
	Net Messages
---------------------------------------------------]]

net.Receive("deso_cparmory_purchase", function(len, ply) deso.armory.Purchase(ply, net.ReadString()) end) -- net.ReadString() is the wep classname