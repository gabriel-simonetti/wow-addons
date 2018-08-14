--[[
Description: This plugin is part of the "Titan Panel [Professions] Multi" addon. It shows your Inscription skill level.
Site: http://www.curse.com/addons/wow/titan-panel-professions-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local ID = "INSM"
local INSM, prevINSM = 0.0, -2
local INSMmax = 0
local INSMIncrease = 0
local startskill
-----------------------------------------------
local function OnClick(self, button)
	if (button == "LeftButton") then
		local prof = L["inscription"]
		CastSpellByName(prof)
	end
end
-----------------------------------------------
local function OnUpdate(self, id)
	local prof1, prof2 = GetProfessions();

	local skillLevel = 0
	local maxSkillLevel = 0

	if prof1 ~= nil then
		local name, _, skillLevel, maxSkillLevel, _, _, _, IncreaseSkillLevel = GetProfessionInfo(prof1)
		if name == L["inscription"] then
			INSM = skillLevel
			INSMmax = maxSkillLevel
			INSMIncrease = IncreaseSkillLevel
			if not startskill then startskill = skillLevel end
		elseif prof2 ~= nil then
			local name, _, skillLevel, maxSkillLevel, _, _, _, IncreaseSkillLevel = GetProfessionInfo(prof2)
			if name == L["inscription"] then
				INSM = skillLevel
				INSMmax = maxSkillLevel
				INSMIncrease = IncreaseSkillLevel
				if not startskill then startskill = skillLevel end
			end
		end
	end

	if INSM == prevINSM and INSMmax == preINSMmax and prevINSMIncrease == INSMIncrease then
		return
	end

	preINSMmax = INSMmax
	prevINSM = INSM
	prevINSMIncrease = INSMIncrease

	TitanPanelButton_UpdateButton(id)
	return true
end
-----------------------------------------------
local function GetButtonText(self, id)
	local INSMtext
	local bonusText = ""
	if INSMIncrease and INSMIncrease > 0 then -- Bônus da profissão
		bonusText = "|r|cFFFFFFFF".." + |r|cFF69FF69"..INSMIncrease.."|r|cFFFFFFFF "..L["bonus"].." =|r|cFF69FF69 "..(INSM+INSMIncrease)
	end
	local HideText = "" -- Texto HideMax
	if not TitanGetVar(ID, "HideMax") then
		HideText = "|r/|cFFFF2e2e"..INSMmax
	end
	local SimpleText = bonusText -- Texto de bônus simples
	if TitanGetVar(ID, "SimpleBonus") and INSMIncrease > 0 then
		SimpleText = "|r|cFFFFFFFF".." (+|r|cFF69FF69"..INSMIncrease.."|r|cFFFFFFFF)"
	end

	local BarBalanceText = ""
	if INSMmax ~= 0 and (INSM - startskill) > 0 and TitanGetVar(ID, "ShowBarBalance") then
		BarBalanceText = " |cFF69FF69["..(INSM - startskill).."]"
	end

	if INSM == 800 then
		INSMtext = "|cFF69FF69"..L["maximum"].."!"..SimpleText
	elseif INSMmax == 0 then
		INSMtext = "|cFFFF2e2e"..L["noprof"]
	elseif INSM == INSMmax then
		INSMtext = "|cFFFFFFFF"..INSM.."|cFFFF2e2e! ["..L["maximum"].."]"..SimpleText..BarBalanceText
	else
		INSMtext = "|cFFFFFFFF"..INSM..HideText..SimpleText..BarBalanceText
	end

	return L["inscription"]..": ", INSMtext
end
-----------------------------------------------
local function GetTooltipText(self, id)
	local BonusTooltip = L["craftsmanship"].."|r|cFFFFFFFF"..INSM.." + |r|cFF69FF69"..INSMIncrease.."|r|cFFFFFFFF "..L["bonus"].." =|r|cFF69FF69 "..(INSM+INSMIncrease) -- Bônus da profissão

	local Goodwith = L["goodwith"]..L["herbalism"] -- Texto de combinação

	local maxtext = L["maxtext"]..TitanUtils_GetHighlightText(INSMmax)

	local ColorValueAccount -- Conta de ganho de perícia
	if not INSM then
		ColorValueAccount = ""
	elseif INSM == 800 then
		ColorValueAccount = "\r"..L["maxskill"]
	elseif not startskill  or (INSM - startskill) == 0 then
		ColorValueAccount = "\r"..L["session"]..TitanUtils_GetHighlightText("0")
	elseif (INSM - startskill) > 0 then
		ColorValueAccount = "\r"..L["session"].."|cFF69FF69"..(INSM - startskill).."|r"
	end

	local warning -- Aviso de que não está mais aprendendo
	if INSMmax == 800 then
		warning = ""
	elseif INSM == INSMmax then
		warning = L["warning"]
	else
		warning = ""
	end

	local ValueText = "" -- Difere com e sem profissão
	if INSM == 0 then
		ValueText = L["noskill"]..Goodwith
	else
		ValueText = L["hint"]..L["info"]..BonusTooltip..maxtext..ColorValueAccount..Goodwith..warning
	end

	return ValueText
end
-----------------------------------------------
L.Elib({
	id = ID,
	name = "Titan|c22fdce08 "..L["inscription"].."|r".." Multi",
	tooltip = L["inscription"],
	icon = "Interface\\Icons\\Inv_inscription_tradeskill01.blp",
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
