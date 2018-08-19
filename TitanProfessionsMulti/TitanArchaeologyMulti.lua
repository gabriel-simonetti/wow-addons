--[[
Description: This plugin is part of the "Titan Panel [Professions] Multi" addon. It shows your Archaeology skill level.
Site: http://www.curse.com/addons/wow/titan-panel-professions-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local ID = "ARCM"
local ARCM, prevARCM = 0.0, -2
local ARCMmax = 0
local ARCMIncrease = 0
local startskill
-----------------------------------------------
local function OnClick(self, button)
	if (button == "LeftButton") then
		local prof = L["archaeology"]
		CastSpellByName(prof)
	end
end
-----------------------------------------------
local function OnUpdate(self, id)
	local prof1, prof2, archaeology, fishing, cooking, firstAid = GetProfessions();

	if archaeology ~= nil then
		local name, _, skillLevel, maxSkillLevel, _, _, _, IncreaseSkillLevel = GetProfessionInfo(archaeology)
		ARCM = skillLevel
		ARCMmax = maxSkillLevel
		ARCMIncrease = IncreaseSkillLevel
		if not startskill then startskill = skillLevel end

		if ARCM == prevARCM and prevARCMmax == ARCMmax and prevARCMIncrease == ARCMIncrease then
			return
		end

		prevARCMmax = ARCMmax
		prevARCM  = ARCM
		prevARCMIncrease = ARCMIncrease

		TitanPanelButton_UpdateButton(id)
		return true
	end
end
-----------------------------------------------
local function GetButtonText(self, id)
	local ARCMtext
	local bonusText = ""
	if ARCMIncrease and ARCMIncrease > 0 then -- Bônus da profissão
		bonusText = "|r|cFFFFFFFF".." + |r|cFF69FF69"..ARCMIncrease.."|r|cFFFFFFFF "..L["bonus"].." =|r|cFF69FF69 "..(ARCM+ARCMIncrease)
	end
	local HideText = "" -- Texto HideMax
	if not TitanGetVar(ID, "HideMax") then
		HideText = "|r/|cFFFF2e2e"..ARCMmax
	end
	local SimpleText = bonusText -- Texto de bônus simples
	if TitanGetVar(ID, "SimpleBonus") and ARCMIncrease > 0 then
		SimpleText = "|r|cFFFFFFFF".." (+|r|cFF69FF69"..ARCMIncrease.."|r|cFFFFFFFF)"
	end

	local BarBalanceText = ""
	if ARCMmax ~= 0 and (ARCM - startskill) > 0 and TitanGetVar(ID, "ShowBarBalance") then
		BarBalanceText = " |cFF69FF69["..(ARCM - startskill).."]"
	end

	if ARCM == 950 then
		ARCMtext = "|cFF69FF69"..L["maximum"].."!"..SimpleText
	elseif ARCMmax == 0 then
		ARCMtext = "|cFFFF2e2e"..L["noprof"]
	elseif ARCM == ARCMmax then
		ARCMtext = "|cFFFFFFFF"..ARCM.."|cFFFF2e2e! ["..L["maximum"].."]"..SimpleText..BarBalanceText
	else
		ARCMtext = "|cFFFFFFFF"..ARCM..HideText..SimpleText..BarBalanceText
	end

	return L["archaeology"]..": ", ARCMtext
end
-----------------------------------------------
local function GetTooltipText(self, id)
		local BonusTooltip = L["craftsmanship"].."|r|cFFFFFFFF"..ARCM.." + |r|cFF69FF69"..ARCMIncrease.."|r|cFFFFFFFF "..L["bonus"].." =|r|cFF69FF69 "..(ARCM+ARCMIncrease) -- Bônus da profissão

		local maxtext = L["maxtext"]..TitanUtils_GetHighlightText(ARCMmax)

		local ColorValueAccount -- Conta de ganho de perícia
		if ARCMmax == 0 then
			ColorValueAccount = ""
		elseif ARCM == 800 then
			ColorValueAccount = "\r"..L["maxskill"]
		elseif not startskill  or (ARCM - startskill) == 0 then
			ColorValueAccount = "\r"..L["session"]..TitanUtils_GetHighlightText("0")
		elseif (ARCM - startskill) > 0 then
			ColorValueAccount = "\r"..L["session"].."|cFF69FF69"..(ARCM - startskill).."|r"
		end

		local warning -- Aviso de que não está mais aprendendo
		if ARCMmax == 800 then
			warning = ""
		elseif ARCM == ARCMmax then
			warning = L["warning"]
		else
			warning = ""
		end

		local ValueText = "" -- Difere com e sem profissão
		if ARCM == 0 then
			ValueText = L["nosecskill"]
		else
			ValueText = L["hint"]..L["info"]..BonusTooltip..maxtext..ColorValueAccount..warning
		end

		return ValueText
	end
-----------------------------------------------
L.Elib({
	id = ID,
	name = "Titan|c113bafe3 "..L["archaeology"].."|r".." Multi",
	tooltip = L["archaeology"],
	icon = "Interface\\Icons\\Trade_archaeology.blp",
	category = "Profession",
	version = version,
	onUpdate = OnUpdate,
	onClick = OnClick,
	getButtonText = GetButtonText,
	getTooltipText = GetTooltipText,
	prepareMenu = L.PrepareProfessionsMenu,
	savedVariables = {
		ShowIcon = 1,
		DisplayOnRightSide = false,
		HideMax = false,
		SimpleBonus = true,
		ShowBarBalance = false,
		ShowLabelText = false,
	}
})
