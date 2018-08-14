--[[
Description: This plugin is part of the "Titan Panel [Professions] Multi" addon. It shows Enchanting Reagents.
Site: http://www.curse.com/addons/wow/titan-panel-professions-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local ACE = LibStub("AceLocale-3.0"):GetLocale("Titan", true)
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local ID = "TITAN_RESENCHM"
local arkhana = 0
local startArkhana = 0

local leylightShard = 0
local startLeylight = 0

local chaosCrystal = 0
local startChaos = 0

local bloodSargeras = 0
local startBlood = 0
-----------------------------------------------
local function getArkhana()
	return GetItemCount(124440, true) or 0
end
-----------------------------------------------
local function getLeylight()
	return GetItemCount(124441, true) or 0
end
-----------------------------------------------
local function getChaos()
	return GetItemCount(124442, true) or 0
end
-----------------------------------------------
local function getBlood()
	return GetItemCount(124124, true) or 0
end
-----------------------------------------------
local function GetButtonText(self, id)
	local arkhanaText
	if not arkhana then
		arkhanaText = "  |TInterface\\Icons\\inv_enchanting_70_arkhana:0|t "..TitanUtils_GetHighlightText("0")
	else
		arkhanaText = "  |TInterface\\Icons\\inv_enchanting_70_arkhana:0|t "..TitanUtils_GetHighlightText(arkhana)
	end

	local leylightText
	if not leylightShard then
		leylightText = "  |TInterface\\Icons\\inv_enchanting_70_leylightcrystal:0|t "..TitanUtils_GetHighlightText("0")
	else
		leylightText = "  |TInterface\\Icons\\inv_enchanting_70_leylightcrystal:0|t "..TitanUtils_GetHighlightText(leylightShard)
	end

	local chaosText
	if not chaosCrystal then
		chaosText = "  |TInterface\\Icons\\inv_enchanting_70_chaosshard:0|t "..TitanUtils_GetHighlightText("0")
	else
		chaosText = "  |TInterface\\Icons\\inv_enchanting_70_chaosshard:0|t "..TitanUtils_GetHighlightText(chaosCrystal)
	end

	local bloodText
	if not bloodSargeras then
		bloodText = "  |T1417744:0|t "..TitanUtils_GetHighlightText("0")
	else
		bloodText = "  |T1417744:0|t "..TitanUtils_GetHighlightText(bloodSargeras)
	end

	local barBalanceArkhana = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (arkhana - startArkhana) > 0 then
			barBalanceArkhana = " |cFF69FF69["..(arkhana - startArkhana).."]"
		elseif (arkhana - startArkhana) < 0 then
			barBalanceArkhana = " |cFFFF2e2e["..(arkhana - startArkhana).."]"
		end
	end

	local barBalanceLeylight = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (leylightShard - startLeylight) > 0 then
			barBalanceLeylight = " |cFF69FF69["..(leylightShard - startLeylight).."]"
		elseif (leylightShard - startLeylight) < 0 then
			barBalanceLeylight = " |cFFFF2e2e["..(leylightShard - startLeylight).."]"
		end
	end

	local barBalanceChaos = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (chaosCrystal - startChaos) > 0 then
			barBalanceChaos = " |cFF69FF69["..(chaosCrystal - startChaos).."]"
		elseif (chaosCrystal - startChaos) < 0 then
			barBalanceChaos = " |cFFFF2e2e["..(chaosCrystal - startChaos).."]"
		end
	end

	local barBalanceBlood = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (bloodSargeras - startBlood) > 0 then
			barBalanceBlood = " |cFF69FF69["..(bloodSargeras - startBlood).."]"
		elseif (bloodSargeras - startBlood) < 0 then
			barBalanceBlood = " |cFFFF2e2e["..(bloodSargeras - startBlood).."]"
		end
	end

	local arkhanaBar = arkhanaText..barBalanceArkhana.." "
	if TitanGetVar(id, "HideArkhana") then
		arkhanaBar = ""
	end

	local leylightBar = leylightText..barBalanceLeylight.." "
	if TitanGetVar(id, "HideLeylight") then
		leylightBar = ""
	end

	local chaosBar = chaosText..barBalanceChaos
	if TitanGetVar(id, "HideChaos") then
		chaosBar = ""
	end

	local bloodBar = bloodText..barBalanceBlood
	if TitanGetVar(id, "HideBlood") then
		bloodBar = ""
	end

	return arkhanaBar..leylightBar..chaosBar..bloodBar
end
-----------------------------------------------
local function GetTooltipText(self, id)

	local arkhanaBag = "\r"..L["arkhana"].."\r"..L["totalbag"]..TitanUtils_GetHighlightText(GetItemCount(124440)).."\r"
	local arkhanaBank = L["totalbank"]..TitanUtils_GetHighlightText(GetItemCount(124440, true) - GetItemCount(124440))

	local leylightBag = L["leylight"].."\r"..L["totalbag"]..TitanUtils_GetHighlightText(GetItemCount(124441)).."\r"
	local leylightBank = L["totalbank"]..TitanUtils_GetHighlightText(GetItemCount(124441, true) - GetItemCount(124441))

	local chaosBag = L["chaosCrystal"].."\r"..L["totalbag"]..TitanUtils_GetHighlightText(GetItemCount(124442)).."\r"
	local chaosBank = L["totalbank"]..TitanUtils_GetHighlightText(GetItemCount(124442, true) - GetItemCount(124442))

	local bloodBag = L["blood"].."\r"..L["totalbag"]..TitanUtils_GetHighlightText(GetItemCount(124124)).."\r"
	local bloodBank = L["totalbank"]..TitanUtils_GetHighlightText(GetItemCount(124124, true) - GetItemCount(124124))

	local valueText = "" -- Difere com e sem reagente
	if arkhana == 0 and chaosCrystal == 0 and chaosCrystal == 0 and bloodSargeras == 0 then
		valueText = "\r"..L["info"].."\r|cFFFF2e2e"..L["noreagent"]
	else
		valueText = "\r"..L["info"]..arkhanaBag..arkhanaBank.."\r\r"..leylightBag..leylightBank.."\r\r"..chaosBag..chaosBank.."\r\r"..bloodBag..bloodBank
	end

	return valueText
end
-----------------------------------------------
local eventsTable = {
	PLAYER_ENTERING_WORLD = function(self)
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
		self.PLAYER_ENTERING_WORLD = nil

		startArkhana = getArkhana()
		arkhana = startArkhana

		startLeylight = getLeylight()
		leylightShard = startLeylight

		startChaos = getChaos()
		chaosCrystal = startChaos

		startBlood = getBlood()
		bloodSargeras = startBlood

		TitanPanelButton_UpdateButton(self.registry.id)

		self.BAG_UPDATE = function(self, bagID)
			local arkh = getArkhana()
			local leyl = getLeylight()
			local chao = getChaos()
			local blood = getBlood()
			if arkhana == arkh and leylightShard == leyl and chaosCrystal == chao and bloodSargeras == blood then return end

			leylightShard = leyl
			arkhana = arkh
			chaosCrystal = chao
			bloodSargeras = blood
			TitanPanelButton_UpdateButton(self.registry.id)
		end
		self:RegisterEvent("BAG_UPDATE")
	end
}
-----------------------------------------------
local function PrepareMenu(self, id)
	TitanPanelRightClickMenu_AddTitle(TitanPlugins[id].menuText)
	TitanPanelRightClickMenu_AddToggleIcon(id)

	local info = UIDropDownMenu_CreateInfo();
	info.text = L["showbb"];
	info.func = function() TitanToggleVar(id, "ShowBarBalance"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "ShowBarBalance");
	L_UIDropDownMenu_AddButton(info);

	TitanPanelRightClickMenu_AddSpacer()

	local info = UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["arkhana"];
	info.func = function() TitanToggleVar(id, "HideArkhana"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideArkhana");
	L_UIDropDownMenu_AddButton(info);

	local info = UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["leylight"];
	info.func = function() TitanToggleVar(id, "HideLeylight"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideLeylight");
	L_UIDropDownMenu_AddButton(info);

	local info = UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["chaosCrystal"];
	info.func = function() TitanToggleVar(id, "HideChaos"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideChaos");
	L_UIDropDownMenu_AddButton(info);

	local info = UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["blood"];
	info.func = function() TitanToggleVar(id, "HideBlood"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideBlood");
	L_UIDropDownMenu_AddButton(info);

	TitanPanelRightClickMenu_AddSpacer()
	TitanPanelRightClickMenu_AddCommand(ACE["TITAN_PANEL_MENU_HIDE"], id, TITAN_PANEL_MENU_FUNC_HIDE);
end
-----------------------------------------------
L.Elib({
	id = ID,
	name = "Titan|cFFEC7A37 "..L["enchanting"].."|r [|cFFEC7A37"..L["reagents"].."|r] Multi",
	tooltip = L["enchanting"].."|r [|cFFEC7A37"..L["reagents"].."|r]",
	icon = "Interface\\Icons\\Trade_engraving",
	category = "Profession",
	version = version,
	getButtonText = GetButtonText,
	getTooltipText = GetTooltipText,
	prepareMenu = PrepareMenu,
	savedVariables = {
		ShowIcon = 1,
		DisplayOnRightSide = false,
		ShowBarBalance = false,
		ShowLabelText = false,
		HideArkhana = false,
		HideLeylight = false,
		HideChaos = false,
		HideBlood = false,
	},
	eventsTable = eventsTable
})
