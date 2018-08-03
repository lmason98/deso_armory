local weps = 
{
	[1] = {["name"] = "M4", ["classname"] = "weapon_mad_m4", ["cost"] = 2000, ["image"] = "weapons/weapon_mad_m4.vtf"},
	[2] = {["name"] = "MP-5", ["classname"] = "weapon_mad_mp5", ["cost"] = 1500, ["image"] = "weapons/weapon_mad_mp5.vtf"},
	[3] = {["name"] = "M3 SUPER", ["classname"] = "weapon_mad_m3", ["cost"] = 2500, ["image"] = "weapons/weapon_mad_m3.vtf"},
	[4] = {["name"] = "Glock", ["classname"] = "weapon_mad_glock", ["cost"] = 1000, ["image"] = "weapons/weapon_mad_glock.vtf"},
	[5] = {["name"] = "UMP-45", ["classname"] = "weapon_mad_ump", ["cost"] = 1500, ["image"] = "weapons/weapon_mad_ump.vtf"},
	[6] = {["name"] = "Riot Shield", ["classname"] = "weapon_mad_shield", ["cost"] = 5000, ["image"] = "weapons/weapon_mad_shield.vtf"},
	[7] = {["name"] = "Flash Grenade", ["classname"] = "weapon_mad_flash", ["cost"] = 1500, ["image"] = "weapons/weapon_mad_flash.vtf"},
	[8] = {["name"] = "Smoke Grenade", ["classname"] = "weapon_mad_smoke", ["cost"] = 1500, ["image"] = "weapons/weapon_mad_smoke.vtf"},
	[9] = {["name"] = "USP", ["classname"] = "weapon_mad_usp", ["cost"] = 1500, ["image"] = "weapons/weapon_mad_usp.vtf"},
	[10] = {["name"] = "Desert Eagle", ["classname"] = "weapon_mad_deagle", ["cost"] = 1500, ["image"] = "weapons/weapon_mad_deagle.vtf"},
	[11] = {["name"] = "Magnum Dong", ["classname"] = "weapon_mad_357", ["cost"] = 1500, ["image"] = "weapons/weapon_mad_357.vtf"}
}

function deso.armory.Vgui()
	local frame = vgui.Create("DFrame")
	frame:SetSize(400, 500)
	frame:Center()
	frame:MakePopup()
	frame:SetDraggable(false)
	frame:SetTitle('')
	frame:ShowCloseButton(false)

	local closeBtn = vgui.Create("DButton", frame)
	closeBtn:SetSize(20, 20)
	closeBtn:SetPos(375, 5)
	closeBtn:SetFont("marlett")
	closeBtn:SetTextColor(deso.col.text)
	closeBtn:SetText('r')

	function closeBtn:DoClick()
		self:GetParent():Close()
	end

	local wepFrame = vgui.Create("DScrollPanel", frame)
	wepFrame:SetSize(380, 430)
	wepFrame:SetPos(10, 60)

	local scroll = wepFrame:GetVBar()

	function frame:Paint(w, h)
		surface.SetDrawColor(deso.col.dark)
		surface.DrawRect(0, 0, w, h)

		surface.SetDrawColor(deso.col.outline)
		surface.DrawOutlinedRect(0, 0, w, h)
		surface.DrawOutlinedRect(9, 59, 382, 432)

		draw.SimpleTextOutlined("CP Armory", "deso_vgui_title", 20, 7, deso.col.text, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 2, deso.col.outline)
	end

	function closeBtn:Paint(w, h) end

	function wepFrame:Paint(w, h)
		surface.SetDrawColor(deso.col.light)
		surface.DrawRect(0, 0, w, h)
	end

	function scroll:Paint(w, h) end
	function scroll.btnUp:Paint(w, h) end	
	function scroll.btnDown:Paint(w, h) end

	function scroll.btnGrip:Paint(w, h) 
		surface.SetDrawColor(deso.col.light)
		surface.DrawRect(0, 0, w, h)

		draw.RoundedBox(4, 0, 4, w - 8, h - 8, deso.col.dark)
	end

	for _, wep in ipairs(weps) do
		local purchaseFrame = vgui.Create("DPanel", wepFrame)
		purchaseFrame:SetSize(0, 45)
		purchaseFrame:DockMargin(10, 10, 10, 0)
		purchaseFrame:Dock(TOP)

		local icon = vgui.Create("DImage", purchaseFrame)
		icon:SetSize(35, 35)
		icon:SetPos(5, 5)
		icon:SetImage(wep.image)

		local purchaseBtn = vgui.Create("DButton", purchaseFrame)
		purchaseBtn:SetSize(100, 30)
		purchaseBtn:SetPos(238, 7)
		purchaseBtn:SetText('')

		function purchaseBtn:Paint(w, h)
			if (self:IsDown()) then
				surface.SetDrawColor(deso.col.text)
				surface.DrawRect(0, 0, w, h)

				surface.SetDrawColor(deso.col.outline)
				surface.DrawOutlinedRect(0, 0, w, h)

				draw.SimpleTextOutlined("PURCHASE", "deso_vgui_button", w / 2, h / 2, deso.col.light, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, deso.col.outline)
			elseif (self:IsHovered()) then
				surface.SetDrawColor(deso.col.text)
				surface.DrawRect(0, 0, w, h)

				surface.SetDrawColor(deso.col.outline)
				surface.DrawOutlinedRect(0, 0, w, h)

				draw.SimpleTextOutlined("PURCHASE", "deso_vgui_button", w / 2, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, deso.col.outline)
			else
				surface.SetDrawColor(deso.col.light)
				surface.DrawRect(0, 0, w, h)

				surface.SetDrawColor(deso.col.outline)
				surface.DrawOutlinedRect(0, 0, w, h)

				draw.SimpleTextOutlined("PURCHASE", "deso_vgui_button", w / 2, h / 2, deso.col.text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, deso.col.outline)
			end
		end

		function purchaseFrame:Paint(w, h)
			surface.SetDrawColor(deso.col.dark)
			surface.DrawRect(0, 0, w, h)

			surface.SetDrawColor(deso.col.outline)
			surface.DrawOutlinedRect(0, 0, w, h)

			draw.SimpleText(wep.name, "deso_vgui_text", 45, 4)
			draw.SimpleText("COST: " .. DarkRP.formatMoney(wep.cost), "deso_vgui_text", 45, 22)
		end
	end

	local bottomFix = vgui.Create("DPanel", wepFrame)
	bottomFix:SetSize(0, 10)
	bottomFix:Dock(TOP)
	
	function bottomFix:Paint() end
end