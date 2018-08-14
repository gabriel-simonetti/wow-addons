--[[
Description: This plugin is part of the "Titan Panel [Professions] Multi" addon. It shows Mining Reagents.
Site: http://www.curse.com/addons/wow/titan-panel-professions-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local ACE = LibStub("AceLocale-3.0"):GetLocale("Titan", true)
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local ID = "TITAN_RESMINIM"
local leystoneOre = 0
local startLeystone = 0

local felslate = 0
local startFelslate = 0

local infernalBrimstone = 0
local startBrimstone = 0

local bloodSargeras = 0
local startBlood = 0
-----------------------------------------------
local function getLeystoneOre()
	return GetItemCount(123918, true) or 0
end
-----------------------------------------------
local function getFelslate()
	return GetItemCount(123919, true) or 0
end
-----------------------------------------------
local function getInfernalBrimstone()
	return GetItemCount(124444, true) or 0
end
-----------------------------------------------
local function getBlood()
	return GetItemCount(124124, true) or 0
end
-----------------------------------------------
local function GetButtonText(self, id)
	local leystoneText
	if not leystoneOre then
		leystoneText = "  |TInterface\\Icons\\inv_leystone:0|t "..TitanUtils_GetHighlightText("0")
	else
		leystoneText = "  |TInterface\\Icons\\inv_leystone:0|t "..TitanUtils_GetHighlightText(leystoneOre)
	end

	local felslateText
	if not felslate then
		felslateText = "  |TInterface\\Icons\\inv_felslate:0|t "..TitanUtils_GetHighlightText("0")
	else
		felslateText = "  |TInterface\\Icons\\inv_felslate:0|t "..TitanUtils_GetHighlightText(felslate)
	end

	local brimstoneText
	if not infernalBrimstone then
		brimstoneText = "  |TInterface\\Icons\\inv_infernalbrimstone:0|t "..TitanUtils_GetHighlightText("0")
	else
		brimstoneText = "  |TInterface\\Icons\\inv_infernalbrimstone:0|t "..TitanUtils_GetHighlightText(infernalBrimstone)
	end

	local bloodText
	if not bloodSargeras then
		bloodText = "  |T1417744:0|t "..TitanUtils_GetHighlightText("0")
	else
		bloodText = "  |T1417744:0|t "..TitanUtils_GetHighlightText(bloodSargeras)
	end

	local barBalanceLeystone = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (leystoneOre - startLeystone) > 0 then
			barBalanceLeystone = " |cFF69FF69["..(leystoneOre - startLeystone).."]"
		elseif (leystoneOre - startLeystone) < 0 then
			barBalanceLeystone = " |cFFFF2e2e["..(leystoneOre - startLeystone).."]"
		end
	end

	local barBalanceFelslate = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (felslate - startFelslate) > 0 then
			barBalanceFelslate = " |cFF69FF69["..(felslate - startFelslate).."]"
		elseif (felslate - startFelslate) < 0 then
			barBalanceFelslate = " |cFFFF2e2e["..(felslate - startFelslate).."]"
		end
	end

	local barBalanceBrimstone = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (infernalBrimstone - startBrimstone) > 0 then
			barBalanceBrimstone = " |cFF69FF69["..(infernalBrimstone - startBrimstone).."]"
		elseif (infernalBrimstone - startBrimstone) < 0 then
			barBalanceBrimstone = " |cFFFF2e2e["..(infernalBrimstone - startBrimstone).."]"
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

	local leystoneBar = leystoneText..barBalanceLeystone.." "
	if TitanGetVar(id, "HideLeyStone") then
		leystoneBar = ""
	end

	local felslateBar = felslateText..barBalanceFelslate.." "
	if TitanGetVar(id, "HideFelslate") then
		felslateBar = ""
	end

	local brimstoneBar = brimstoneText..barBalanceBrimstone.." "
	if TitanGetVar(id, "HideBrimstone") then
		brimstoneBar = ""
	end

	local bloodBar = bloodText..barBalanceBlood
	if TitanGetVar(id, "HideBlood") then
		bloodBar = ""
	end

	return leystoneBar..felslateBar..brimstoneBar..bloodBar
end
-----------------------------------------------
local function GetTooltipText(self, id)

	local leystoneBag = "\r"..L["leystone"].."\r"..L["totalbag"]..TitanUtils_GetHighlightText(GetItemCount(123918)).."\r"
	local leystoneBank = L["totalbank"]..TitanUtils_GetHighlightText(GetItemCount(123918, true) - GetItemCount(123918))

	local felslateBag = L["felslate"].."\r"..L["totalbag"]..TitanUtils_GetHighlightText(GetItemCount(123919)).."\r"
	local felslateBank = L["totalbank"]..TitanUtils_GetHighlightText(GetItemCount(123919, true) - GetItemCount(123919))

	local brimstoneBag = L["brimstone"].."\r"..L["totalbag"]..TitanUtils_GetHighlightText(GetItemCount(124444)).."\r"
	local brimstoneBank = L["totalbank"]..TitanUtils_GetHighlightText(GetItemCount(124444, true) - GetItemCount(124444))

	local bloodBag = L["blood"].."\r"..L["totalbag"]..TitanUtils_GetHighlightText(GetItemCount(124124)).."\r"
	local bloodBank = L["totalbank"]..TitanUtils_GetHighlightText(GetItemCount(124124, true) - GetItemCount(124124))

	local valueText = "" -- Difere com e sem reagente
	if leystoneOre == 0 and infernalBrimstone == 0 and infernalBrimstone == 0 and bloodSargeras == 0 then
		valueText = "\r"..L["info"].."\r|cFFFF2e2e"..L["noreagent"]
	else
		valueText = "\r"..L["info"]..leystoneBag..leystoneBank.."\r\r"..felslateBag..felslateBank.."\r\r"..brimstoneBag..brimstoneBank.."\r\r"..bloodBag..bloodBank
	end

	return valueText
end
-----------------------------------------------
local eventsTable = {
	PLAYER_ENTERING_WORLD = function(self)
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
		self.PLAYER_ENTERING_WORLD = nil

		startLeystone = getLeystoneOre()
		leystoneOre = startLeystone

		startFelslate = getFelslate()
		felslate = startFelslate

		startBrimstone = getInfernalBrimstone()
		infernalBrimstone = startBrimstone

		startBlood = getBlood()
		bloodSargeras = startBlood

		TitanPanelButton_UpdateButton(self.registry.id)

		self.BAG_UPDATE = function(self, bagID)
			local lStone = getLeystoneOre()
			local fels = getFelslate()
			local brims = getInfernalBrimstone()
			local blood = getBlood()
			if leystoneOre == lStone and felslate == fels and infernalBrimstone == brims and bloodSargeras == blood then return end

			felslate = fels
			leystoneOre = lStone
			infernalBrimstone = brims
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
	info.text = L["hide"].." "..L["leystone"];
	info.func = function() TitanToggleVar(id, "HideLeyStone"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideLeyStone");
	L_UIDropDownMenu_AddButton(info);

	local info = UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["felslate"];
	info.func = function() TitanToggleVar(id, "HideFelslate"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideFelslate");
	L_UIDropDownMenu_AddButton(info);

	local info = UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["brimstone"];
	info.func = function() TitanToggleVar(id, "HideBrimstone"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideBrimstone");
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
	name = "Titan|cFFEC7A37 "..L["mining"].."|r [|cFFEC7A37"..L["reagents"].."|r] Multi",
	tooltip = L["mining"].."|r [|cFFEC7A37"..L["reagents"].."|r]",
	icon = "Interface\\Icons\\Trade_mining",
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
		HideLeyStone = false,
		HideFelslate = false,
		HideBrimstone = false,
		HideBlood = false,
	},
	eventsTable = eventsTable
})
