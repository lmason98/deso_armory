function deso.armory.CalcOpacity(distance)
	local max, opac, mult = 255, 1, 4

	if (distance > 100) then
		opac = (210 - distance) * mult
	else
		opac = 255
	end

	return opac
end