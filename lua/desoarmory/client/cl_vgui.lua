function deso.vgui.BtnPaint(btn, w, h, text, font)
	local col = deso.col.light
	local textCol = deso.col.text
	
	if (btn:IsDown()) then
		col = deso.col.text
		textCol = deso.col.light
	elseif (btn:IsHovered()) then
		col = deso.col.text
		textCol = Color(255, 255, 255)
	end

	surface.SetDrawColor(col)
	surface.DrawRect(0, 0, w, h)

	surface.SetDrawColor(deso.col.outline)
	surface.DrawOutlinedRect(0, 0, w, h)

	draw.SimpleTextOutlined(text, font, w / 2, h / 2, textCol, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, deso.col.outline)
end

function deso.vgui.TabPaint(tab, w, h, text, font)
	local col = deso.col.light
	local textCol = deso.col.text
	
	if (btn:IsDown()) then
		col = deso.col.text
		textCol = deso.col.light
	elseif (btn:IsHovered()) then
		col = deso.col.text
		textCol = Color(255, 255, 255)
	elseif (btn.selected) then
		col = deso.col.text
		textCol = Color(255, 255, 255)
	end

	surface.SetDrawColor(col)
	surface.DrawRect(0, 0, w, h)

	surface.SetDrawColor(deso.col.outline)
	surface.DrawOutlinedRect(0, 0, w, h)

	draw.SimpleTextOutlined(text, font, w / 2, h / 2, textCol, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, deso.col.outline)
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

local ammo =
{
	[1] = {["ammo"] = "ammo_556x45", ["ammoamount"] = 30, ["ammocost"] = 200, ["image"] = "weapons/weapon_mad_m4.vtf"},
	[2] = {["ammo"] = "buckshot", ["ammoamount"] = 8, ["ammocost"] = 200, ["image"] = "weapons/weapon_mad_m3.vtf"},
	[3] = {["ammo"] = "battery", ["ammoamount"] = 30, ["ammocost"] = 200, ["image"] = "weapons/weapon_mad_mp5.vtf"},
	[4] = {["ammo"] = "ammo_45", ["ammoamount"] = 30, ["ammocost"] = 200, ["image"] = "weapons/weapon_mad_ump.vtf"},
}


function deso.armory.Vgui()
	local frame = vgui.Create("DFrame")
	frame:SetSize(400, 450)
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

	local tab = vgui.Create("DPanel", frame)
	tab:SetSize(380, 30)
	tab:SetPos(10, 60)

	local wepFrame = vgui.Create("DPanel", frame)
	wepFrame:SetSize(380, 340)
	wepFrame:SetPos(10, 100)

	function frame:Paint(w, h)
		surface.SetDrawColor(deso.col.dark)
		surface.DrawRect(0, 0, w, h)

		surface.SetDrawColor(deso.col.outline)
		surface.DrawOutlinedRect(0, 0, w, h)
		surface.DrawOutlinedRect(9, 99, 382, 342)

		draw.SimpleTextOutlined("CP Armory", "deso_vgui_title", 20, 7, deso.col.text, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 2, deso.col.outline)
	end

	function closeBtn:Paint(w, h) end

	function wepFrame:Paint(w, h)
		surface.SetDrawColor(deso.col.light)
		surface.DrawRect(0, 0, w, h)
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
		purchaseBtn:SetSize(110, 30)
		purchaseBtn:SetPos(243, 7)
		purchaseBtn:SetText('')

		function purchaseBtn:Paint(w, h) deso.vgui.BtnPaint(self, w, h, "PURCHSASE", "deso_vgui_button") end

		function purchaseBtn:DoClick()
			local class = wep.classname

			net.Start("deso_cparmory_purchase")
				net.WriteString(class)
			net.SendToServer()
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