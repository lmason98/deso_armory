function deso.Notify(enum, length, message)
	surface.PlaySound("buttons/button15.wav")
	notification.AddLegacy(message, enum, length)
end