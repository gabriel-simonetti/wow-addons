--[[
Description: This plugin is part of the "Titan Panel [Professions] Multi" addon. It shows Fishing Reagents.
Site: http://www.curse.com/addons/wow/titan-panel-professions-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local ACE = LibStub("AceLocale-3.0"):GetLocale("Titan", true)
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local ID = "TITAN_RESFISHM"
local silverMackerel = 0
local startSilverM = 0

local cursedQueenfish = 0
local startQueenfish = 0

local hSalmon = 0
local startHSalmon = 0

local mossgillPerch = 0
local startMossgill = 0

local stormray = 0
local startStormray = 0

local runescaleKoi = 0
local startKoi = 0

local blackBarracuda = 0
local startBarracuda = 0
-----------------------------------------------
local function getMackerel()
	return GetItemCount(133607, true) or 0
end
-----------------------------------------------
local function getQueenfish()
	return GetItemCount(124107, true) or 0
end
-----------------------------------------------
local function getSalmon()
	return GetItemCount(124109, true) or 0
end
-----------------------------------------------
local function getMossgill()
	return GetItemCount(124108, true) or 0
end
-----------------------------------------------
local function getStormray()
	return GetItemCount(124110, true) or 0
end
-----------------------------------------------
local function getKoi()
	return GetItemCount(124111, true) or 0
end
-----------------------------------------------
local function getBarracuda()
	return GetItemCount(124112, true) or 0
end
-----------------------------------------------
local function GetButtonText(self, id)
	local mackerelText
	if not silverMackerel then
		mackerelText = "  |TInterface\\Icons\\inv_misc_fish_48:0|t "..TitanUtils_GetHighlightText("0")
	else
		mackerelText = "  |TInterface\\Icons\\inv_misc_fish_48:0|t "..TitanUtils_GetHighlightText(silverMackerel)
	end

	local queenfishText
	if not cursedQueenfish then
		queenfishText = "  |TInterface\\Icons\\inv_fish_cursedqueenfishgreen:0|t "..TitanUtils_GetHighlightText("0")
	else
		queenfishText = "  |TInterface\\Icons\\inv_fish_cursedqueenfishgreen:0|t "..TitanUtils_GetHighlightText(cursedQueenfish)
	end

	local salmonText
	if not hSalmon then
		salmonText = "  |TInterface\\Icons\\inv_fish_highmountainsalmonred:0|t "..TitanUtils_GetHighlightText("0")
	else
		salmonText = "  |TInterface\\Icons\\inv_fish_highmountainsalmonred:0|t "..TitanUtils_GetHighlightText(hSalmon)
	end

	local mossgillText
	if not mossgillPerch then
		mossgillText = "  |TInterface\\Icons\\inv_fish_mossgillperchgreen:0|t "..TitanUtils_GetHighlightText("0")
	else
		mossgillText = "  |TInterface\\Icons\\inv_fish_mossgillperchgreen:0|t "..TitanUtils_GetHighlightText(mossgillPerch)
	end

	local stormrayText
	if not stormray then
		stormrayText = "  |TInterface\\Icons\\inv_fish_stormraygreen:0|t "..TitanUtils_GetHighlightText("0")
	else
		stormrayText = "  |TInterface\\Icons\\inv_fish_stormraygreen:0|t "..TitanUtils_GetHighlightText(stormray)
	end

	local koiText
	if not runescaleKoi then
		koiText = "  |TInterface\\Icons\\inv_fish_runescalekoigold:0|t "..TitanUtils_GetHighlightText("0")
	else
		koiText = "  |TInterface\\Icons\\inv_fish_runescalekoigold:0|t "..TitanUtils_GetHighlightText(runescaleKoi)
	end

	local barracudaText
	if not blackBarracuda then
		barracudaText = "  |TInterface\\Icons\\inv_fish_blackbarracudablue:0|t "..TitanUtils_GetHighlightText("0")
	else
		barracudaText = "  |TInterface\\Icons\\inv_fish_blackbarracudablue:0|t "..TitanUtils_GetHighlightText(blackBarracuda)
	end

	local barBalanceMackerel = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (silverMackerel - startSilverM) > 0 then
			barBalanceMackerel = " |cFF69FF69["..(silverMackerel - startSilverM).."]"
		elseif (silverMackerel - startSilverM) < 0 then
			barBalanceMackerel = " |cFFFF2e2e["..(silverMackerel - startSilverM).."]"
		end
	end

	local barBalanceQueen = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (cursedQueenfish - startQueenfish) > 0 then
			barBalanceQueen = " |cFF69FF69["..(cursedQueenfish - startQueenfish).."]"
		elseif (cursedQueenfish - startQueenfish) < 0 then
			barBalanceQueen = " |cFFFF2e2e["..(cursedQueenfish - startQueenfish).."]"
		end
	end

	local barBalanceSalmon = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (hSalmon - startHSalmon) > 0 then
			barBalanceSalmon = " |cFF69FF69["..(hSalmon - startHSalmon).."]"
		elseif (hSalmon - startHSalmon) < 0 then
			barBalanceSalmon = " |cFFFF2e2e["..(hSalmon - startHSalmon).."]"
		end
	end

	local barBalanceMossgill = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (mossgillPerch - startMossgill) > 0 then
			barBalanceMossgill = " |cFF69FF69["..(mossgillPerch - startMossgill).."]"
		elseif (mossgillPerch - startMossgill) < 0 then
			barBalanceMossgill = " |cFFFF2e2e["..(mossgillPerch - startMossgill).."]"
		end
	end

	local barBalanceStormray = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (stormray - startStormray) > 0 then
			barBalanceStormray = " |cFF69FF69["..(stormray - startStormray).."]"
		elseif (stormray - startStormray) < 0 then
			barBalanceStormray = " |cFFFF2e2e["..(stormray - startStormray).."]"
		end
	end

	local barBalanceKoi = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (runescaleKoi - startKoi) > 0 then
			barBalanceKoi = " |cFF69FF69["..(runescaleKoi - startKoi).."]"
		elseif (runescaleKoi - startKoi) < 0 then
			barBalanceKoi = " |cFFFF2e2e["..(runescaleKoi - startKoi).."]"
		end
	end

	local barBalanceBarracuda = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (blackBarracuda - startBarracuda) > 0 then
			barBalanceBarracuda = " |cFF69FF69["..(blackBarracuda - startBarracuda).."]"
		elseif (blackBarracuda - startBarracuda) < 0 then
			barBalanceBarracuda = " |cFFFF2e2e["..(blackBarracuda - startBarracuda).."]"
		end
	end

	local silverMackerelBar = mackerelText..barBalanceMackerel.." "
	if TitanGetVar(id, "HideMackerel") then
		silverMackerelBar = ""
	end

	local cursedQueenBar = queenfishText..barBalanceQueen.." "
	if TitanGetVar(id, "HideQueen") then
		cursedQueenBar = ""
	end

	local hSalmonBar = salmonText..barBalanceSalmon.." "
	if TitanGetVar(id, "HideSalmon") then
		hSalmonBar = ""
	end

	local mossgillBar = mossgillText..barBalanceMossgill.." "
	if TitanGetVar(id, "HideMossgill") then
		mossgillBar = ""
	end

	local stormrayBar = stormrayText..barBalanceStormray.." "
	if TitanGetVar(id, "HideStormray") then
		stormrayBar = ""
	end

	local runescaleKoiBar = koiText..barBalanceKoi.." "
	if TitanGetVar(id, "HideKoi") then
		runescaleKoiBar = ""
	end

	local blackBarracudaBar = barracudaText..barBalanceBarracuda
	if TitanGetVar(id, "HideBarracuda") then
		blackBarracudaBar = ""
	end

	return silverMackerelBar..cursedQueenBar..hSalmonBar..mossgillBar..stormrayBar..runescaleKoiBar..blackBarracudaBar
end
-----------------------------------------------
local function GetTooltipText(self, id)

	local mackerelBag = "\r"..L["mackerel"].."\r"..L["totalbag"]..TitanUtils_GetHighlightText(GetItemCount(133607)).."\r"
	local mackerelBank = L["totalbank"]..TitanUtils_GetHighlightText(GetItemCount(133607, true) - GetItemCount(133607))

	local queenfishBag = L["queenfish"].."\r"..L["totalbag"]..TitanUtils_GetHighlightText(GetItemCount(124107)).."\r"
	local queenfishBank = L["totalbank"]..TitanUtils_GetHighlightText(GetItemCount(124107, true) - GetItemCount(124107))

	local salmonBag = L["salmon"].."\r"..L["totalbag"]..TitanUtils_GetHighlightText(GetItemCount(124109)).."\r"
	local salmonBank = L["totalbank"]..TitanUtils_GetHighlightText(GetItemCount(124109, true) - GetItemCount(124109))

	local mossgillBag = L["mossgill"].."\r"..L["totalbag"]..TitanUtils_GetHighlightText(GetItemCount(124108)).."\r"
	local mossgillBank = L["totalbank"]..TitanUtils_GetHighlightText(GetItemCount(124108, true) - GetItemCount(124108))

	local stormrayBag = L["stormray"].."\r"..L["totalbag"]..TitanUtils_GetHighlightText(GetItemCount(124110)).."\r"
	local stormrayBank = L["totalbank"]..TitanUtils_GetHighlightText(GetItemCount(124110, true) - GetItemCount(124110))

	local koiBag = L["koi"].."\r"..L["totalbag"]..TitanUtils_GetHighlightText(GetItemCount(124111)).."\r"
	local koiBank = L["totalbank"]..TitanUtils_GetHighlightText(GetItemCount(124111, true) - GetItemCount(124111))

	local barracudaBag = L["barracuda"].."\r"..L["totalbag"]..TitanUtils_GetHighlightText(GetItemCount(124112)).."\r"
	local barracudaBank = L["totalbank"]..TitanUtils_GetHighlightText(GetItemCount(124112, true) - GetItemCount(124112))

	local valueText = "" -- Difere com e sem reagente
	if silverMackerel == 0 and cursedQueenfish == 0 and hSalmon == 0 and mossgillPerch == 0 and stormray == 0 and runescaleKoi == 0 and blackBarracuda == 0 then
		valueText = "\r"..L["info"].."\r|cFFFF2e2e"..L["noreagent"]
	else
		valueText = "\r"..L["info"]..mackerelBag..mackerelBank.."\r\r"..queenfishBag..queenfishBank.."\r\r"..salmonBag..salmonBank.."\r\r"..mossgillBag..mossgillBank.."\r\r"..stormrayBag..stormrayBank.."\r\r"..koiBag..koiBank.."\r\r"..barracudaBag..barracudaBank
	end

	return valueText
end
-----------------------------------------------
local eventsTable = {
	PLAYER_ENTERING_WORLD = function(self)
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
		self.PLAYER_ENTERING_WORLD = nil

		startSilverM = getMackerel()
		silverMackerel = startSilverM

		startQueenfish = getQueenfish()
		cursedQueenfish = startQueenfish

		startHSalmon = getSalmon()
		hSalmon = startHSalmon

		startMossgill = getMossgill()
		mossgillPerch = startMossgill

		startStormray = getStormray()
		stormray = startStormray

		startKoi = getKoi()
		runescaleKoi = startKoi

		startBarracuda = getBarracuda()
		blackBarracuda = startBarracuda

		TitanPanelButton_UpdateButton(self.registry.id)

		self.BAG_UPDATE = function(self, bagID)
			local macker = getMackerel()
			local qfish = getQueenfish()
			local slmon = getSalmon()
			local ssll = getMossgill()
			local sray = getStormray()
			local ki = getKoi()
			local bcuda = getBarracuda()
			if silverMackerel == macker and cursedQueenfish == qfish and hSalmon == slmon and mossgillPerch == ssll and stormray == sray and runescaleKoi == ki and blackBarracuda == bcuda then return end

			silverMackerel = macker
			cursedQueenfish = qfish
			hSalmon = slmon
			mossgillPerch = ssll
			stormray = sray
			runescaleKoi = ki
			blackBarracuda = bcuda
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
	info.text = L["hide"].." "..L["mackerel"];
	info.func = function() TitanToggleVar(id, "HideMackerel"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideMackerel");
	L_UIDropDownMenu_AddButton(info);

	local info = UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["queenfish"];
	info.func = function() TitanToggleVar(id, "HideQueen"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideQueen");
	L_UIDropDownMenu_AddButton(info);

	local info = UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["salmon"];
	info.func = function() TitanToggleVar(id, "HideSalmon"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideSalmon");
	L_UIDropDownMenu_AddButton(info);

	local info = UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["mossgill"];
	info.func = function() TitanToggleVar(id, "HideMossgill"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideMossgill");
	L_UIDropDownMenu_AddButton(info);

	local info = UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["stormray"];
	info.func = function() TitanToggleVar(id, "HideStormray"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideStormray");
	L_UIDropDownMenu_AddButton(info);

	local info = UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["koi"];
	info.func = function() TitanToggleVar(id, "HideKoi"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideKoi");
	L_UIDropDownMenu_AddButton(info);

	local info = UIDropDownMenu_CreateInfo();
	info.text = L["hide"].." "..L["barracuda"];
	info.func = function() TitanToggleVar(id, "HideBarracuda"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "HideBarracuda");
	L_UIDropDownMenu_AddButton(info);

	TitanPanelRightClickMenu_AddSpacer()
	TitanPanelRightClickMenu_AddCommand(ACE["TITAN_PANEL_MENU_HIDE"], id, TITAN_PANEL_MENU_FUNC_HIDE);
end
-----------------------------------------------
L.Elib({
	id = ID,
	name = "Titan|cFFEC7A37 "..L["fishing"].."|r [|cFFEC7A37"..L["reagents"].."|r] Multi",
	tooltip = L["fishing"].."|r [|cFFEC7A37"..L["reagents"].."|r]",
	icon = "Interface\\Icons\\Trade_fishing",
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
		HideMackerel = false,
		HideQueen = false,
		HideSalmon = false,
		HideMossgill = false,
		HideStormray = false,
		HideKoi = false,
		HideBarracuda = false,
	},
	eventsTable = eventsTable
})
