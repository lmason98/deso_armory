include "shared.lua"

local scrW, scrH = ScrW(), ScrH()
local white, text, outline = Color(255, 255, 255), deso.col.text, deso.col.outline


function ENT:Draw()
	self:DrawModel()

	local trace = LocalPlayer():GetEyeTrace()
	local distance = LocalPlayer():GetPos():Distance(self:GetPos())
	local pos = self:GetPos()
	local ang = self:GetAngles()

	ang:RotateAroundAxis(ang:Right(), 90)
	ang:RotateAroundAxis(ang:Up(), 90)
	ang:RotateAroundAxis(ang:Forward(), 180)

	text.a = deso.CalcOpacity(distance)
	white.a = deso.CalcOpacity(distance)
	outline.a = deso.CalcOpacity(distance)

	if (distance < 275) then
		cam.Start3D2D(pos + ang:Up() * 10, ang, 0.1)
			draw.SimpleTextOutlined("CP Armory", "deso_hud_clip", 0, -230, text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 3, outline)
			draw.SimpleTextOutlined("[E]", "deso_hud_clip", 0, -100, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 3, outline)
		cam.End3D2D()
	end
end