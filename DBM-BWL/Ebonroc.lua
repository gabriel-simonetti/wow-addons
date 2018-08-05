local mod	= DBM:NewMod("Ebonroc", "DBM-BWL", 1)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 645 $"):sub(12, -3))
mod:SetCreatureID(14601)
mod:SetEncounterID(614)
mod:SetModelID(6377)
mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 23339 22539",
	"SPELL_AURA_APPLIED 23340",
	"SPELL_AURA_REMOVED 23340"
)

local warnWingBuffet	= mod:NewCastAnnounce(23339, 2)
local warnShadowFlame	= mod:NewCastAnnounce(22539, 2)
local warnShadow		= mod:NewTargetAnnounce(23340, 4)

local specWarnShadowYou	= mod:NewSpecialWarningYou(23340, nil, nil, nil, 1, 2)
local specWarnShadow	= mod:NewSpecialWarningTaunt(23340, nil, nil, nil, 1, 2)

local timerWingBuffet	= mod:NewNextTimer(31, 23339, nil, nil, nil, 2)
local timerShadow		= mod:NewTargetTimer(8, 23340, nil, "Tank", 2, 5, nil, DBM_CORE_TANK_ICON)

function mod:OnCombatStart(delay)
	timerWingBuffet:Start(-delay)
end

function mod:SPELL_CAST_START(args)--did not see ebon use any of these abilities
	if args.spellId == 23339 then
		warnWingBuffet:Show()
		timerWingBuffet:Start()
	elseif args.spellId == 22539 then
		warnShadowFlame:Show()
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 23340 then
		if args:IsPlayer() then
			specWarnShadowYou:Show()
			specWarnShadowYou:Play("targetyou")
		else
			if self.Options.SpecWarn23340taunt then
				specWarnShadow:Show(args.destName)
				specWarnShadow:Play("tauntboss")
			else
				warnShadow:Show(args.destName)
			end
		end
		timerShadow:Start(args.destName)
	end
end

function mod:SPELL_AURA_REMOVED(args)
	if args.spellId == 23340 then
		timerShadow:Stop(args.destName)
	end
end