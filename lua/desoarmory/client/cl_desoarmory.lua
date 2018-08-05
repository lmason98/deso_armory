function deso.Notify(enum, length, message)
	if (canNotify) then

		surface.PlaySound("buttons/button15.wav")
		notification.AddLegacy(message, enum, length)
	end
end