include "shared.lua"

local scrW, scrH = ScrW(), ScrH()

function ENT:Draw()
	self:DrawModel()

	local trace = LocalPlayer():GetEyeTrace()
	local distance = LocalPlayer():GetPos():Distance(self:GetPos())
	local pos = self:GetPos()
	local ang = self:GetAngles()

	ang:RotateAroundAxis(ang:Right(), 90)
	ang:RotateAroundAxis(ang:Up(), 90)
	ang:RotateAroundAxis(ang:Forward(), 180)

	if (distance < 150) then
		cam.Start3D2D(pos + ang:Up() * 10 + ang:Forward() * -96 + ang:Right() * -75, ang, 0.1)
			draw.SimpleTextOutlined("[E]", "deso_hud_clip", scrW / 2, (scrH / 2) + 100, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 3, deso.col.outline)
		cam.End3D2D()
	end
end