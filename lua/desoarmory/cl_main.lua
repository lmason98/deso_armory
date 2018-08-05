--[[-------------------------------------------------
	Net Strings
---------------------------------------------------]]

net.Receive("deso_notify", function()
	local enum, length, message = net.ReadInt(4), net.ReadInt(4), net.ReadString()
	deso.Notify(enum, length, message)	
end)

net.Receive("deso_cparmory_open", function() deso.armory.Vgui() end)