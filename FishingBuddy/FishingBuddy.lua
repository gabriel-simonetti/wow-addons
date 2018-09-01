-- FishingBuddy
--
-- Everything you wanted support for in your fishing endeavors

-- 5.0.4 has a problem with a global "_" (see some for loops below)
local _

local FL = LibStub("LibFishing-1.0");
local LO = LibStub("LibOptionsFrame-1.0");
local LEW = LibStub("LibEventWindow-1.0");
local HBD = LibStub("HereBeDragons-2.0")

local CurLoc = GetLocale();

-- Information for the stylin' fisherman
local POLES = {
    ["Fishing Pole"] = "6256:0:0:0",
    ["Strong Fishing Pole"] = "6365:0:0:0",
    ["Darkwood Fishing Pole"] = "6366:0:0:0",
    ["Big Iron Fishing Pole"] = "6367:0:0:0",
    ["Blump Family Fishing Pole"] = "12225:0:0:0",
    ["Nat Pagle's Extreme Angler FC-5000"] = "19022:0:0:0",
    ["Arcanite Fishing Pole"] = "19970:0:0:0",
    ["Seth's Graphite Fishing Pole"] = "25978:0:0:0",
    ["Nat's Lucky Fishing Pole"] = "45858:0:0:0",
    ["Mastercraft Kalu'ak Fishing Pole"] = "44050:0:0:0",
    ["Bone Fishing Pole"] = "45991:0:0:0",
    ["Jeweled Fishing Pole"] = "45992:0:0:0",
    ["Underlight Angler"] = "133755:0:0:0",
-- yeah, so you can't really use these (for now :-)
    ["Dwarven Fishing Pole"] = "3567:0:0:0",
    ["Goblin Fishing Pole"] = "4598:0:0:0",
    ["Nat Pagle's Fish Terminator"] = "19944:0:0:0",
-- one can only hope
    ["Crafty's Pole"] = "43651:0:0:0"
}

local GeneralOptions = {
    ["ShowNewFishies"] = {
        ["text"] = FBConstants.CONFIG_SHOWNEWFISHIES_ONOFF,
        ["tooltip"] = FBConstants.CONFIG_SHOWNEWFISHIES_INFO,
        ["v"] = 1,
        ["default"] = true },
    ["TurnOffPVP"] = {
        ["text"] = FBConstants.CONFIG_TURNOFFPVP_ONOFF,
        ["tooltip"] = FBConstants.CONFIG_TURNOFFPVP_INFO,
        ["v"] = 1,
        ["m"] = 1,
        ["default"] = false },
    ["SortByPercent"] = {
        ["text"] = FBConstants.CONFIG_SORTBYPERCENT_ONOFF,
        ["tooltip"] = FBConstants.CONFIG_SORTBYPERCENT_INFO,
        ["v"] = 1,
        ["default"] = true },
    ["DingQuestFish"] = {
        ["text"] = FBConstants.CONFIG_DINGQUESTFISH_ONOFF,
        ["tooltip"] = FBConstants.CONFIG_DINGQUESTFISH_INFO,
        ["v"] = 1,
        ["default"] = true, },
    ["ShowBanner"] = {
        ["text"] = FBConstants.CONFIG_SHOWBANNER_ONOFF,
        ["tooltip"] = FBConstants.CONFIG_SHOWBANNER_INFO,
        ["v"] = 1,
        ["default"] = true, },
    ["SetupSkills"] = {
        ["text"] = FBConstants.CONFIG_TRADESKILL_ONOFF,
        ["tooltip"] = FBConstants.CONFIG_TRADESKILL_INFO,
        ["v"] = 1,
        ["default"] = true, },
    ["EnhanceFishingSounds"] = {
        ["text"] = FBConstants.CONFIG_ENHANCESOUNDS_ONOFF,
        ["tooltip"] = FBConstants.CONFIG_ENHANCESOUNDS_INFO,
        ["v"] = 1,
        ["m"] = 1,
        ["p"] = 1,
        ["default"] = false },
    ["BackgroundSounds"] = {
        ["text"] = FBConstants.CONFIG_BGSOUNDS_ONOFF,
        ["tooltip"] = FBConstants.CONFIG_BGSOUNDS_INFO,
        ["v"] = 1,
        ["m"] = 1,
        ["default"] = false,
        ["parents"] = { ["EnhanceFishingSounds"] = "d" }, },
    ["TurnOnSound"] = {
        ["text"] = FBConstants.CONFIG_TURNONSOUND_ONOFF,
        ["tooltip"] = FBConstants.CONFIG_TURNONSOUND_INFO,
        ["v"] = 1,
        ["m"] = 1,
        ["default"] = false,
        ["parents"] = { ["EnhanceFishingSounds"] = "d", },
    },
    ["MaxSound"] = {
        ["tooltip"] = FBConstants.CONFIG_MAXSOUND_INFO,
        ["parents"] = { ["EnhanceFishingSounds"] = "d", },
        ["button"] = "FishingBuddyOption_MaxVolumeSlider",
        ["margin"] = { 12, 8 }, },
    ["EnhancePools"] = {
        ["text"] = FBConstants.CONFIG_SPARKLIES_ONOFF,
        ["tooltip"] = FBConstants.CONFIG_SPARKLIES_INFO,
        ["v"] = 1,
        ["default"] = false,
        ["parents"] = { ["EnhanceFishingSounds"] = "d" }, },
--	["CreateMacro"] = {
--		["text"] = FBConstants.CONFIG_CREATEMACRO_ONOFF,
--		["tooltip"] = FBConstants.CONFIG_CREATEMACRO_INFO,
--		["v"] = 1,
--		["global"] = 1,
--		["default"] = false, },
--	["PreventRecast"] = {
--		["text"] = FBConstants.CONFIG_PREVENTRECAST_ONOFF,
--		["tooltip"] = FBConstants.CONFIG_PREVENTRECAST_INFO,
--		["v"] = 1,
--		["global"] = 1,
--		["default"] = false,
--		["parents"] = { ["CreateMacro"] = "d" }, },
--	["ToonMacro"] = {
--		["text"] = FBConstants.CONFIG_TOONMACRO_ONOFF,
--		["tooltip"] = FBConstants.CONFIG_TOONMACRO_INFO,
--		["v"] = 1,
--		["global"] = 1,
--		["default"] = false,
--		["parents"] = { ["CreateMacro"] = "d" }, },
};

-- x87bliss has implemented IsFishWardenEnabled as a public function, so
-- we can retire the GUID based check
local function IsWardenEnabled()
    -- local FishWarden = FishWarden_79a6ca19_6666_4759_9b8f_a67708694e5b;
    local doautoloot = 1;
    if ( FiWaAPI_IsFishWardenEnabled and FiWaAPI_IsFishWardenEnabled() ) then
        doautoloot = 0;
    end
    return "d", doautoloot;
end

local function CustomLooting()
    local _, autoloot = IsWardenEnabled();
    return FishingBuddy.GetSettingBool("AutoLoot") and (autoloot == 1);
end

local function IsFishingAceEnabled()
--	return FishingAce and FishingAce.enabledState;
    if ( FishingAce and FishingAce.enabledState ) then
        return true;
    end
    return false;
end

local EasyCastInit;

local CastingOptions = {
    ["EasyCast"] = {
        ["text"] = FBConstants.CONFIG_EASYCAST_ONOFF,
        ["tooltip"] = FBConstants.CONFIG_EASYCAST_INFO,
        ["tooltipd"] = FBConstants.CONFIG_EASYCAST_INFOD,
        ["enabled"] = function() return (not IsFishingAceEnabled()) and 1 or 0 end,
        ["init"] = function(o, b) EasyCastInit(o, b); end,
        ["v"] = 1,
        ["m"] = 1,
        ["p"] = 1,
        ["default"] = true },
    ["MountedCast"] = {
        ["text"] = FBConstants.CONFIG_MOUNTEDCAST_ONOFF,
        ["tooltip"] = FBConstants.CONFIG_MOUNTEDCAST_INFO,
        ["v"] = 1,
        ["parents"] = { ["EasyCast"] = "d", },
        ["default"] = false },
    ["AutoLoot"] = {
        ["text"] = FBConstants.CONFIG_AUTOLOOT_ONOFF,
        ["tooltip"] = FBConstants.CONFIG_AUTOLOOT_INFO,
        ["tooltipd"] = function()
                        if ( FiWaAPI_IsFishWardenEnabled and not IsFishingAceEnabled() ) then
                            return FBConstants.CONFIG_AUTOLOOT_INFOD;
                        end
                        -- return nil;
                    end,
        ["v"] = 1,
        ["m"] = 1,
        ["p"] = 1,
        ["parents"] = { ["EasyCast"] = "d", ["EasyCast"] = IsWardenEnabled },
        ["default"] = false },
    ["AutoOpen"] = {
        ["text"] = FBConstants.CONFIG_AUTOOPEN_ONOFF,
        ["tooltip"] = FBConstants.CONFIG_AUTOOPEN_INFO,
        ["v"] = 1,
        ["parents"] = { ["EasyCast"] = "d" },
        ["default"] = false },
    ["UseAction"] = {
        ["text"] = FBConstants.CONFIG_USEACTION_ONOFF,
        ["tooltip"] = FBConstants.CONFIG_USEACTION_INFO,
        ["v"] = 1,
        ["parents"] = { ["EasyCast"] = "d" },
        ["default"] = false },
    ["PartialGear"] = {
        ["text"] = FBConstants.CONFIG_PARTIALGEAR_ONOFF,
        ["tooltip"] = FBConstants.CONFIG_PARTIALGEAR_INFO,
        ["v"] = 1,
        ["parents"] = { ["EasyCast"] = "d" },
        ["default"] = false },
    ["WatchBobber"] = {
        ["text"] = FBConstants.CONFIG_WATCHBOBBER_ONOFF,
        ["tooltip"] = FBConstants.CONFIG_WATCHBOBBER_INFO,
        ["v"] = 1,
        ["parents"] = { ["EasyCast"] = "d" },
        ["default"] = true },
    ["ContestSupport"] = {
        ["text"] = FBConstants.CONFIG_CONTESTS_ONOFF,
        ["tooltip"] = FBConstants.CONFIG_CONTESTS_INFO,
        ["v"] = 1,
        ["default"] = false },
    ["STVTimer"] = {
        ["text"] = FBConstants.CONFIG_STVTIMER_ONOFF,
        ["tooltip"] = FBConstants.CONFIG_STVTIMER_INFO,
        ["v"] = 1,
        ["default"] = false,
        ["parents"] = { ["ContestSupport"] = "d" }
    },
    ["STVPoolsOnly"] = {
        ["text"] = FBConstants.CONFIG_STVPOOLSONLY_ONOFF,
        ["tooltip"] = FBConstants.CONFIG_STVPOOLSONLY_INFO,
        ["v"] = 1,
        ["default"] = false,
        ["primary"] = "ContestSupport",
        ["parents"] = { ["ContestSupport"] = "d", ["EasyCast"] = "d" }
    },
    ["EasyCastKeys"] = {
        ["default"] = FBConstants.KEYS_NONE,
        ["button"] = "FBEasyKeys",
        ["tooltipd"] = FBConstants.CONFIG_EASYCASTKEYS_INFO,
        ["parents"] = { ["EasyCast"] = "h" },
        ["init"] = function(o, b) b.InitMappedMenu(o,b); end,
        ["setup"] =
            function(button)
                local gs = FishingBuddy.GetSetting;
                FBEasyKeys.menu:SetMappedValue("EasyCastKeys", gs("EasyCastKeys"));
            end,
    },
    ["MouseEvent"] = {
        ["default"] = "RightButtonUp",
        ["button"] = "FBMouseEvent",
        ["tooltipd"] = FBConstants.CONFIG_MOUSEEVENT_INFO,
        ["parents"] = { ["EasyCast"] = "h" },
        ["alone"] = 1,
        ["init"] = function(o, b) b.InitMappedMenu(o,b); end,
        ["setup"] =
            function(button)
                local gs = FishingBuddy.GetSetting;
                FBMouseEvent.menu:SetMappedValue("MouseEvent", gs("MouseEvent"));
            end,
    },
    ["EasyLures"] = {
        ["text"] = FBConstants.CONFIG_EASYLURES_ONOFF,
        ["tooltip"] = FBConstants.CONFIG_EASYLURES_INFO,
        ["v"] = 1,
        ["m"] = 1,
        ["depends"] = { ["EasyCast"] = "d" },
        ["default"] = false },
    ["AlwaysHat"] = {
        ["text"] = FBConstants.CONFIG_ALWAYSHAT_ONOFF,
        ["tooltip"] = FBConstants.CONFIG_ALWAYSHAT_INFO,
        ["v"] = 1,
        ["m"] = 1,
        ["parents"] = { ["EasyLures"] = "d" },
        ["default"] = true },
    ["AlwaysLure"] = {
        ["text"] = FBConstants.CONFIG_ALWAYSLURE_ONOFF,
        ["tooltip"] = FBConstants.CONFIG_ALWAYSLURE_INFO,
        ["v"] = 1,
        ["m"] = 1,
        ["parents"] = { ["EasyLures"] = "d" },
        ["default"] = false },
    ["BigDraenor"] = {
        ["text"] = FBConstants.CONFIG_BIGDRAENOR_ONOFF,
        ["tooltip"] = FBConstants.CONFIG_BIGDRAENOR_INFO,
        ["v"] = 1,
        ["m"] = 1,
        ["parents"] = { ["EasyLures"] = "d" },
        ["default"] = true },
    ["LastResort"] = {
        ["text"] = FBConstants.CONFIG_LASTRESORT_ONOFF,
        ["tooltip"] = FBConstants.CONFIG_LASTRESORT_INFO,
        ["v"] = 1,
        ["parents"] = { ["EasyLures"] = "d" },
        ["default"] = false },
    ["DraenorBait"] = {
        ["text"] = FBConstants.CONFIG_DRAENORBAIT_ONOFF,
        ["tooltip"] = FBConstants.CONFIG_DRAENORBAIT_INFO,
        ["v"] = 1,
        ["m"] = 1,
        ["primary"] = "EasyLures",
        ["parents"] = { ["EasyLures"] = "d", ["EasyLures"] = "d" },
        ["default"] = true },
    ["DraenorBaitMaintainOnly"] = {
        ["text"] = FBConstants.CONFIG_DRAENORBAITMAINTAIN_ONOFF,
        ["tooltip"] = FBConstants.CONFIG_DRAENORBAITMAINTAIN_INFO,
        ["v"] = 1,
        ["primary"] = "EasyLures",
        ["parents"] = {  ["DraenorBait"] = "d", ["EasyLures"] = "d", },
        ["default"] = true },
    ["DalaranLures"] = {
        ["text"] = FBConstants.CONFIG_DALARANLURES_ONOFF,
        ["tooltip"] = FBConstants.CONFIG_DALARANLURES_INFO,
        ["v"] = 1,
        ["parents"] = { ["EasyLures"] = "d", },
        ["default"] = true },
};

local InvisibleOptions = {
    -- options not directly manipulatable from the UI
    ["TooltipInfo"] = {
        ["text"] = FBConstants.CONFIG_TOOLTIPS_ONOFF,
        ["tooltip"] = FBConstants.CONFIG_TOOLTIPS_INFO,
        ["default"] = false },
    ["GroupByLocation"] = {
        ["default"] = true,
    },
    -- bar switching
    ["ClickToSwitch"] = {
        ["default"] = true,
    },
    -- sound enhancement
    ["EnhanceSound_SFXVolume"] = {
        ["default"] = 1.0,
    },
    ["EnhanceSound_MasterVolume"] = {
        ["scale"] = 1,
        ["default"] = 100,
    },
    ["EnhanceSound_MusicVolume"] = {
        ["default"] = 0.0,
    },
    ["EnhanceSound_AmbienceVolume"] = {
        ["default"] = 0.0,
    },
    ["EnhanceMapWaterSounds"] = {
        ["default"] = false,
    },
    ["EnhanceSound_EnableSoundWhenGameIsInBG"] = {
        ["default"] = 1.0,
    },
    ["EnhanceSound_EnableAllSound"] = {
        ["default"] = 1.0,
    },
    ["EnhanceSound_EnableSFX"] = {
        ["default"] = 1.0,
    },
    ["EnhanceparticleDensity"] = {
        ["default"] = 1.0,
    },
    ["MinimapButtonPosition"] = {
        ["default"] = FBConstants.DEFAULT_MINIMAP_POSITION,
    },
    ["MinimapButtonRadius"] = {
        ["default"] = FBConstants.DEFAULT_MINIMAP_RADIUS,
    },
    ["TotalTimeFishing"] = {
        ["default"] = 1,
    },
    ["FishDebug"] = {
        ["default"] = false,
    },
}

local VolumeSlider =
{
    ["name"] = "FishingBuddyOption_MaxVolumeSlider",
    ["format"] = VOLUME.." - %d%%",
    ["min"] = 0,
    ["max"] = 100,
    ["step"] = 5,
    ["scale"] = 1,
    ["rightextra"] = 32,
    ["setting"] = "EnhanceSound_MasterVolume",
};

EasyCastInit = function(option, button)
    -- prettify drop down?
    local check = FBEasyKeys.menu.label:GetWidth() + FBEasyKeys:GetWidth();
    if (FishingBuddy.FitInOptionFrame(check)) then
        CastingOptions["EasyCast"].layoutright = "EasyCastKeys";
    else
        CastingOptions["EasyCastKeys"].alone = 1;
    end
end

-- default FishingBuddy option handlers
FishingBuddy.BaseGetSetting = function(setting)
    if ( not FishingBuddy_Player or
          not FishingBuddy_Player["Settings"] ) then
        return;
    end
    local val = FishingBuddy_Player["Settings"][setting];
    if ( val == nil and FishingBuddy.GetDefault ) then
        val = FishingBuddy.GetDefault(setting);
    end
    return val;
end

FishingBuddy.BaseSetSetting = function(setting, value)
    if ( FishingBuddy_Player and setting ) then
        local val = nil;
        if ( FishingBuddy.GetDefault ) then
            val = FishingBuddy.GetDefault(setting);
        end
        if ( val == value ) then
            FishingBuddy_Player["Settings"][setting] = nil;
        else
            FishingBuddy_Player["Settings"][setting] = value;
        end
    end
end

FishingBuddy.GlobalGetSetting = function(setting)
    if ( not FishingBuddy_Info or
          not FishingBuddy_Info["Settings"] ) then
        return;
    end
    return FishingBuddy_Info["Settings"][setting];
end

FishingBuddy.GlobalSetSetting = function(setting, value)
    if ( FishingBuddy_Info and setting ) then
        if (not FishingBuddy_Info["Settings"]) then
            FishingBuddy_Info["Settings"] = {};
        end
        FishingBuddy_Info["Settings"][setting] = value;
    end
end

FishingBuddy.ByFishie = nil;
FishingBuddy.SortedFishies = nil;

FishingBuddy.StartedFishing = nil;

local CastingNow = false;

-- Let's wait at least five seconds before we attempt to lure again
local RELURE_DELAY = 8.0;

local AddingLure = false;
local DoEscaped = nil;
local LureState = 0;
local LastLure = nil;
local LastUsed = nil;
local OpenThisFishId = {};
local DoAutoOpenLoot = nil;

FishingBuddy.OpenThisFishId = OpenThisFishId;

-- handle zone markers
local function zmto(zidx, sidx)
    if ( not zidx ) then
        return 0;
    end
    if ( not sidx ) then
        sidx = 0;
    end
    return zidx*1000 + sidx;
end
FishingBuddy.ZoneMarkerTo = zmto;

local function zmex(packed)
    local sidx = math.fmod(packed, 1000);
    return math.floor(packed/1000), sidx;
end
FishingBuddy.ZoneMarkerEx = zmex;

-- event handling
local function IsFakeEvent(evt)
    return (evt == "VARIABLES_LOADED") or FBConstants.FBEvents[evt];
end

-- let's delay bag update when we leave the world
local bagupdateframe = CreateFrame("Frame");
bagupdateframe:Hide();
-- we could watch for UNIT_INVENTORY_CHANGED, if we wanted to check for "player" in the args
local InventoryEvents = {
    ["BAG_UPDATE"] = true,
    ["PLAYER_EQUIPMENT_CHANGED"] = true,
    ["EQUIPMENT_SWAP_FINISHED"] = true,
    ["WEAR_EQUIPMENT_SET"] = true,
}

function bagupdateframe:StartInventory()
    for event,_ in pairs(InventoryEvents) do
        self.fbframe:RegisterEvent(event)
    end
end

function bagupdateframe:StopInventory()
    for event,_ in pairs(InventoryEvents) do
        self.fbframe:UnregisterEvent(event)
    end
end

-- we want to do all the magic stuff even when we didn't equip anything
local autopoleframe = CreateFrame("Frame");
autopoleframe:Hide();

local LastCastTime = nil;
local FISHINGSPAN = 60;

local function SetLastCastTime()
    LastCastTime = GetTime();
end

local function ClearLastCastTime()
    LastCastTime = nil
end

local handlerframe = CreateFrame("Frame");
handlerframe:Hide();

local reg_events = {};
local event_handlers = {};

-- allow other parts of the code to watch for events when not fishing
local isunit = "UNIT_";
local function RegisterEvent(event)
    if ( not reg_events[event] ) then
        if (string.sub(event, 1, string.len(isunit)) == isunit) then
            handlerframe:RegisterUnitEvent(event, "player");
        else
            handlerframe:RegisterEvent(event);
        end
        reg_events[event] = 1;
    end
end

local function AddHandler(event, info)
    local func, fake;
    if ( not event_handlers[event] ) then
        event_handlers[event] = {};
    end
    fake = IsFakeEvent(event);
    if ( type(info) == "function" ) then
        func = info;
    else
        func = info.func;
        fake = fake or info.fake;
    end
    tinsert(event_handlers[event], func);
    if ( not fake ) then
        -- register the event, if we haven't already
        RegisterEvent(event);
    end
end

local function RemoveHandler(event, info)
    if ( event_handlers[event] ) then
        local func;
        if ( type(info) == "function" ) then
            func = info;
        else
            func = info.func;
        end
        local jdx = nil;
        for idx,f in ipairs(event_handlers[event]) do
            if ( f == func ) then
                jdx = idx;
            end
        end
        if ( jdx ) then
            table.remove(event_handlers[event], jdx);
        end
        if ( table.getn(event_handlers[event]) == 0 ) then
            event_handlers[event] = nil;
            if (reg_events[event]) then
                reg_events[event] = nil;
                handlerframe:UnregisterEvent(event);
            end
        end
    end
end

local function RegisterHandlers(handlers)
    if (not handlers) then
        return
    end

    for evt,info in pairs(handlers) do
        AddHandler(evt, info)
    end
end
-- these should be internal use only, FBAPI has "constant" interfaces
FishingBuddy.RegisterHandlers = RegisterHandlers;
FishingBuddy.GetHandlers = function(what) return event_handlers[what]; end;

local function RunHandlers(what, ...)
    local eh = event_handlers[what];
    if ( eh ) then
        for idx,func in pairs(eh) do
            func(...);
        end
    end
end
FishingBuddy.RunHandlers = RunHandlers;

-- we want to make sure we handle our registered events for everyone
handlerframe:SetScript("OnEvent", function(self, event, ...)
    RunHandlers(event, ...);
    RunHandlers("*", ...);
end)

-- look at tooltips
local function LastTooltipText()
    return FL:GetLastTooltipText();
end
FishingBuddy.LastTooltipText = LastTooltipText;

local function ClearTooltipText()
    FL:ClearLastTooltipText();
end
FishingBuddy.ClearTooltipText = ClearTooltipText;

-- build a list of zones where a given fish can be found
local function FishZoneList(fishid)
    if ( FishingBuddy.ByFishie[fishid] ) then
        local slist = {};
        for idx,count in pairs(FishingBuddy.ByFishie[fishid]) do
            local zidx, sidx = zmex(idx);
            if ( sidx > 0 ) then
                slist[idx] = 1;
            end
        end
        local names = {};
        for idx,_ in pairs(slist) do
            tinsert(names, FishingBuddy_Info["SubZones"][idx]);
        end
        table.sort(names);
        return FishingBuddy.EnglishList(names);
    end
    -- return nil;
end

-- handle option keys for enabling casting
local key_actions = {
    [FBConstants.KEYS_NONE] = function(mouse) return mouse ~= "RightButtonUp"; end,
    [FBConstants.KEYS_SHIFT] = function(mouse) return IsShiftKeyDown(); end,
    [FBConstants.KEYS_CTRL] = function(mouse) return IsControlKeyDown(); end,
    [FBConstants.KEYS_ALT] = function(mouse) return IsAltKeyDown(); end,
}
local function CastingKeys()
    local setting = FishingBuddy.GetSetting("EasyCastKeys");
    local mouse = FishingBuddy.GetSetting("MouseEvent");
    if ( setting and key_actions[setting] ) then
        return key_actions[setting](mouse);
    else
        return true;
    end
end

local QuestLures = {};
QuestLures[58788] = {
    ["enUS"] = "Overgrown Earthworm",	-- Diggin' for Worms
    spell = 80534,
};
QuestLures[58949] = {
    ["enUS"] = "Stag Eye",				-- A Staggering Effort
    spell = 80868,
};
QuestLures[45902] = {
    ["enUS"] = "Phantom Ghostfish",
    spell = 45902,
};
QuestLures[69907] = {
    ["enUS"] = "Corpse Worm",
    spell = 99315,
};


-- Get an array of all the lures we have in our inventory, sorted by
-- cost, then bonus
-- We'll want to use the cheapest ones we can until our fish don't get
-- away from us

-- Full combat check function
local function CheckCombat()
    return InCombatLockdown() or UnitAffectingCombat("player") or UnitAffectingCombat("pet")
end
FishingBuddy.CheckCombat = CheckCombat;

local function PostCastUpdate()
    local stop = true;
    if ( not CheckCombat() ) then
        FL:ResetOverride();
        if ( AddingLure ) then
            local sp, sub, txt, tex, st, et, trade, int = UnitChannelInfo("player");
            local _, lure = FL:GetPoleBonus();
            if ( not sp or not LastLure or (lure and lure == LastLure.b) ) then
                AddingLure = false;
                FL:UpdateLureInventory();
            else
                stop = false;
            end
        end
        if ( stop ) then
            FishingBuddy_PostCastUpdateFrame:Hide();
        end
    end
end
FishingBuddy.PostCastUpdate = PostCastUpdate;

local function HideAwayAll(self, button, down)
    FishingBuddy_PostCastUpdateFrame:Show();
end

local function HaveThing(itemid, info)
    if (info.toy) then
        return PlayerHasToy(itemid)
    else
        return GetItemCount(itemid) > 0;
    end
end

local function GetFishingItem(itemtable)
    local GSB = FishingBuddy.GetSettingBool;
    for itemid, info in pairs(itemtable) do
        if ( info.always or (HaveThing(itemid, info) and (not info.setting or GSB(info.setting))) ) then
            if (not info[CurLoc]) then
                info[CurLoc] = GetItemInfo(itemid);
            end
            if ( not info.usable or info.usable(info) ) then
                local buff = info.spell;
                local doit = not FL:HasBuff(buff);
                local it = nil;
                if ( info.check ) then
                    doit, itemid, it = info.check(info, buff, doit, itemid);
                elseif (info.toy) then
                    _, itemid = C_ToyBox.GetToyInfo(itemid);
                end
                if ( doit ) then
                    return doit, itemid, info[CurLoc], it or info.type;
                end
            end
        end
    end
    -- return nil;
end

local function GetFishieRaw(fishid)
    local fi = FishingBuddy_Info["Fishies"][fishid];
    if ( not fi or not fi[CurLoc] ) then
        local _,_,_,_,it,_,_,_,_,_ = FL:GetItemInfo(fishid);
        local color, id, name = FL:SplitFishLink(fishid);

        if (not fi) then
            return fishid, it, color, 1, nil, name, nil;
        else
            fi.texture = it;
            fi.color = color;
            fi.quantity = 1;
            fi[CurLoc] = name;
        end
    end

    return fishid,
            fi.texture,
            fi.color,
            fi.quantity,
            fi.quality,
            fi[CurLoc],
            fi.quest;
end
FishingBuddy.GetFishieRaw = GetFishieRaw;

local function OnNatPagleQuest()
    local i = 1;
    while GetQuestLogTitle(i) do
        local questTitle, level, suggestedGroup, isHeader, isCollapsed, isComplete, isDaily, questID = GetQuestLogTitle(i)
        if ( questID == 36611) then
            return true;
        end
        i = i + 1;
    end
    -- return nil;
end

local function GetUpdateLure()
    local GSB = FishingBuddy.GetSettingBool;
    local lureinventory, _ = FL:GetLureInventory();

    DoAutoOpenLoot = nil;

    local doit, id, name, it = FishingBuddy.GetPlan()
    if ( doit ) then
        return doit, id, name, it;
    end

    -- look for bonus items, like the Ancient Pandaren Fishing Charm
    if ( FishingBuddy.FishingItems ) then
        doit, id, name, it = GetFishingItem(FishingBuddy.FishingItems);
        if ( doit ) then
            return doit, id, name, it;
        end
    end

    if ( GSB("EasyLures") ) then
        -- Is this a quest fish we should open up?
        if ( GSB("AutoOpen") ) then
            while ( table.getn(OpenThisFishId) > 0 ) do
                local id = OpenThisFishId[1];
                local c = GetItemCount(id);
                if (c < 2) then
                    table.remove(OpenThisFishId, 1);
                end
                if ( c > 0 ) then
                    DoAutoOpenLoot = true;
                    local _,_,_,_,_,name,_ = GetFishieRaw(id);
                    return true, id, name;
                end
            end
        end

        -- look for quest lures
        doit, id, name, it = GetFishingItem(QuestLures);
        if ( doit ) then
            return doit, id, name, it;
        end

        -- only apply a lure if we're actually fishing with a "real" pole
        if (FL:IsFishingPole()) then
            -- Let's wait a bit so that the enchant can show up before we lure again
            if ( LastLure and LastLure.time and ((LastLure.time - GetTime()) > 0) ) then
                return false;
            end

            if ( LastLure ) then
                LastLure.time = nil;
            end

            local skill, _, _, _ = FL:GetCurrentSkill();
            if (skill > 0) then
                local NextLure, NextState;
                local pole, tempenchant = FL:GetPoleBonus();
                local continent = FL:GetCurrentMapContinent()
                local bigdraenor = (GSB("BigDraenor") and (continent == FBConstants.DRAENOR));
                local state, bestlure = FL:FindBestLure(tempenchant, LureState, false, bigdraenor);
                -- If we could use a lure based on skill, or we lost a fish.
                if ( DoEscaped or not FL:HasLureBuff() ) then
                    if ( state or bestlure ) then
                        NextState = state or LureState;
                        NextLure = bestlure;
                    else
                        NextLure = nil;
                    end
                elseif ( GSB("AlwaysLure") or bigdraenor) then
                    -- don't put on a lure if we've already got one
                    if ( tempenchant == 0 ) then
                        if ( not state ) then
                            NextState, NextLure = FL:FindNextLure(nil, 0);
                        else
                            NextState = state;
                            NextLure = bestlure;
                        end
                    elseif (state and bestlure) then
                        NextState = state;
                        NextLure = bestlure;
                    else
                        NextLure = nil -- oscarucb
                    end
                elseif ( state and bestlure and tempenchant == 0 and GSB("LastResort") ) then
                    NextState = state;
                    NextLure = bestlure;
                else
                    NextLure = nil;
                end
                if ( GSB("AlwaysHat")) then
                    local _, hat = FL:FindBestHat()
                    if (hat) then
                        return true, hat['id'], hat['n']
                    end
                end
                local DoLure = NextLure;
                if ( DoLure and DoLure.id ) then
                    -- if the pole has an enchantment, we can assume it's got a lure on it (so far, anyway)
                    -- remove the main hand enchantment (since it's a fishing pole, we know what it is)
                    local startTime, duration, enable = GetItemCooldown(DoLure.id);
                    if (startTime == 0) then
                        AddingLure = true;
                        LastLure = DoLure;
                        LureState = NextState;
                        LastLure.time = GetTime() + RELURE_DELAY;
                        local id = DoLure.id;
                        local name = DoLure.n;
                        return true, id, name;
                    elseif ( LastLure and not LastLure.time ) then
                        LastLure = nil;
                        LastState = 0;
                        AddingLure = false;
                    end
                end
            end
        end
    end

    return false;
end

local CaptureEvents = {};
local trackedtime = 0;
local TRACKING_DELAY = 0.75;

CaptureEvents["TRACKED_ACHIEVEMENT_UPDATE"] = function(id, criterion, actualtime, timelimit)
    if ( id == 5036 ) then
        -- Last catch was in a pool
        -- We should add it
        -- Do we know it was our catch?
        trackedtime = GetTime();
    end
end

local function ClearAddingLure()
    AddingLure = false;
end

-- we don't want to interrupt ourselves if we're casting.
local fishing_buff = 131474;
local fishing_spellid = 131490;
local current_spell_id = nil

CaptureEvents["UNIT_SPELLCAST_CHANNEL_START"] = function(unit, lineid, spellid)
    current_spell_id = spellid
    if current_spell_id == fishing_spellid then
        SetLastCastTime();
    end
end

CaptureEvents["UNIT_SPELLCAST_CHANNEL_STOP"] = function(unit, lineid, spellid)
    -- we may want to wait a bit here for any buff to come back...
    if current_spell_id == fishing_spellid then
        SetLastCastTime();
    end
    current_spell_id = nil
    ClearAddingLure()
end

CaptureEvents["UNIT_SPELLCAST_INTERRUPTED"] = function(unit, lineid, spellid)
    if current_spell_id == fishing_spellid then
        SetLastCastTime();
    end
    current_spell_id = nil
    ClearAddingLure()
end

CaptureEvents["UNIT_SPELLCAST_FAILED"] = ClearAddingLure;
CaptureEvents["UNIT_SPELLCAST_FAILED_QUIET"] = ClearAddingLure;

CaptureEvents["ACTIONBAR_SLOT_CHANGED"] = function()
    if ( FishingBuddy.GetSettingBool("UseAction") ) then
        FL:GetFishingActionBarID(true);
    end
end

CaptureEvents["UNIT_AURA"] = function(arg1)
    if ( arg1 == "player" ) then
        local hmhe,_,_,_,_,_ = GetWeaponEnchantInfo();
        if ( not hmhe ) then
            LastLure = nil;
        end
    end
end

local function GetCurrentSpell()
    return current_spell_id
end
FishingBuddy.GetCurrentSpell = GetCurrentSpell

local function ReadyForFishing()
    local GSB = FishingBuddy.GetSettingBool;
    local id = FL:GetMainHandItem(true);
    -- if we're holding the spear, assume we're fishing
    return (GSB("UseTuskarrSpear") and (id == 88535)) or FL:IsFishingReady(GSB("PartialGear"));
end
FishingBuddy.ReadyForFishing = ReadyForFishing;

local function NormalHijackCheck()
    local GSB = FishingBuddy.GetSettingBool;
    if ( not AddingLure and
         not CheckCombat() and (not IsMounted() or GSB("MountedCast")) and
         not IsFishingAceEnabled() and
         GSB("EasyCast") and (CastingKeys() or ReadyForFishing()) ) then
        return true;
    end
end
FishingBuddy.NormalHijackCheck = NormalHijackCheck;

local HijackCheck = NormalHijackCheck;
local function SetHijackCheck(func)
    if ( not func ) then
        func = NormalHijackCheck;
    end
    HijackCheck = func;
end
FishingBuddy.SetHijackCheck = SetHijackCheck;

local function NormalStealClick()
    -- return nil;
end

local StealClick = NormalStealClick;
local function SetStealClick(func)
    if ( not func ) then
        func = NormalStealClick;
    end
    StealClick = func;
end
FishingBuddy.SetStealClick = SetStealClick;

local function CentralCasting()
    -- put on a lure if we need to
    if ( not StealClick() ) then
        local update, id, n, target = GetUpdateLure();
        if (update and id) then
            FL:InvokeLuring(id, target);
        else
            if ( not FL:GetLastTooltipText() or not FL:OnFishingBobber() ) then
                 -- watch for fishing holes
                FL:SaveTooltipText();
            end
            SetLastCastTime();
            autopoleframe:Show();
            local macrotext = FishingBuddy.CastAndThrow()
            if macrotext then
                FL:InvokeMacro(macrotext)
            else
                FL:InvokeFishing(FishingBuddy.GetSettingBool("UseAction"));
            end
        end
    end
    FL:OverrideClick(HideAwayAll);
end

local SavedWFOnMouseDown;

-- handle mouse up and mouse down in the WorldFrame so that we can steal
-- the hardware events to implement 'Easy Cast'
-- Thanks to the Cosmos team for figuring this one out -- I didn't realize
-- that the mouse handler in the WorldFrame got everything first!
local function WF_OnMouseDown(...)
    -- Only steal 'right clicks' (self is arg #1!)
    local button = select(2, ...);

    if ( HijackCheck() ) then
        FishingBuddy.ExecutePlans()
        if ( FL:CheckForDoubleClick(button) ) then
            -- We're stealing the mouse-up event, make sure we exit MouseLook
            if ( IsMouselooking() ) then
                MouselookStop();
            end
            CentralCasting();
        end
        if ( SavedWFOnMouseDown ) then
            SavedWFOnMouseDown(...);
        end
    end
end

local function SafeHookMethod(object, method, newmethod)
    local oldValue = object[method];
    if ( oldValue ~= _G[newmethod] ) then
        object[method] = newmethod;
        return true;
    end
    return false;
end

local function SafeHookScript(frame, handlername, newscript)
    local oldValue = frame:GetScript(handlername);
    frame:SetScript(handlername, newscript);
    return oldValue;
end

local skip = {};
skip["mods"] = 1;
skip["texture"] = 1;
skip["quest"] = 1;
skip["level"] = 1;
skip["skill"] = 1;
skip["quality"] = 1;
skip["color"] = 1;

FishingBuddy.GetFishie = function(fishid)
    local fi = FishingBuddy_Info["Fishies"][fishid];
    if( fi ) then
        local name = fi[CurLoc];
        if ( not name ) then
            -- try a hyperlink
            local link = "item:"..fishid;
            local n,l,_,_,_,_,_,_ = FL:GetItemInfo(link);
            if ( n and l ) then
                name = n;
                fi[CurLoc] = n;
            else
                -- try for anything we might be able to display
                for k,val in pairs(fi) do
                    if ( not skip[k] and not name ) then
                         name = val;
                    end
                end
            end
        end
        if ( not name ) then
            name = UNKNOWN;
        end
        return string.format("%d:0:0:0:0:0:0:0", fishid),
                 fi.texture,
                 fi.color,
                 fi.quantity,
                 fi.quality,
                 name,
                 fi.quest;
    end
end

local function PushOptionChanges()
    FL:WatchBobber(FishingBuddy.GetSettingBool("WatchBobber"));
    FL:SetSAMouseEvent(FishingBuddy.GetSetting("MouseEvent"));
    FishingBuddy.WatchUpdate();

    if (false) then
        if (FishingBuddy.GetSettingBool("CreateMacro")) then
            CreateFishingMacro();
        else
            DeleteMacro(FBConstants.MACRONAME);
        end
    end
end

-- do everything we think is necessary when we start fishing
-- even if we didn't do the switch to a fishing pole
local resetClickToMove = nil;
local function StartFishingMode()
    if ( not FishingBuddy.StartedFishing ) then
        -- Disable Click-to-Move if we're fishing
        if ( GetCVar("autointeract") == "1" ) then
            resetClickToMove = true;
            SetCVar("autointeract", "0");
        end
        FishingBuddy.EnhanceFishingSounds(true);
        handlerframe:Show();
        LureState = 0;	  -- start with the cheapest lure
        local pole, lure = FL:GetPoleBonus();
        if ( not lure or lure == 0 ) then
            LastLure = {};
            LastLure.b = lure;
        end
        FishingBuddy.StartedFishing = GetTime();
        RunHandlers(FBConstants.FISHING_ENABLED_EVT);
    end
    -- we get invoked when items get equipped as well
    FL:UpdateLureInventory();
end

local function StopFishingMode(logout)
    if ( FishingBuddy.StartedFishing ) then
        if ( not logout ) then
            FishingBuddy.WatchUpdate();
        end
        autopoleframe:Hide();
        handlerframe:Hide();
        local started = FishingBuddy.StartedFishing;
        FishingBuddy.StartedFishing = nil;
        RunHandlers(FBConstants.FISHING_DISABLED_EVT, started, logout);
    end

    -- reset everything that we might have set
    FishingBuddy.EnhanceFishingSounds(false, logout);
    if ( resetClickToMove ) then
        -- Re-enable Click-to-Move if we changed it
        SetCVar("autointeract", "1");
        resetClickToMove = nil;
    end

    AddingLure = false;
end

local function FishingMode()
    local ready = ReadyForFishing() or autopoleframe:IsShown();
    if ( ready ) then
        StartFishingMode();
    else
        StopFishingMode();
    end
end
FishingBuddy.FishingMode = FishingMode;

local function AutoPoleCheck(self, ...)
    if (not CheckCombat() ) then
        if ( not LastCastTime or ReadyForFishing() ) then
            self:Hide();
            ClearLastCastTime();
            self.x, self.y, self.instanceID = nil, nil, nil
            return;
        end
        local elapsed = (GetTime() - LastCastTime);
        if ( elapsed > FISHINGSPAN ) then
            ClearLastCastTime();
            self.x, self.y, self.instanceID = nil, nil, nil
            StopFishingMode();
        elseif ( not FishingBuddy.StartedFishing ) then
            StartFishingMode();
            self.x, self.y, self.instanceID = HBD:GetPlayerWorldPosition();
        elseif (self.x) then
            if (self.moving) then
                local x, y, instanceID = HBD:GetPlayerWorldPosition();
                local _, distance = HBD:GetWorldVector(instanceId, self.x, self.y, x, y);
                if instanceID ~= self.instanceID or distance > 10 then
                    LastCastTime = GetTime() - FISHINGSPAN - 1
                end
            elseif (self.stopped) then
                self.x, self.y, self.instanceID = HBD:GetPlayerWorldPosition();
                self.stopped = nil;
            end
        end
    end
end

local function AutoPoleEvent(self, event, ...)
    self.moving = (event == "PLAYER_STARTED_MOVING")
    self.stopped = (event == "PLAYER_STOPPED_MOVING")
end

autopoleframe:SetScript("OnEvent", AutoPoleEvent)
autopoleframe:SetScript("OnUpdate", AutoPoleCheck);
autopoleframe:RegisterEvent("PLAYER_STARTED_MOVING");
autopoleframe:RegisterEvent("PLAYER_STOPPED_MOVING");


local function AreWeFishing()
    return (FishingBuddy.StartedFishing ~= nil or autopoleframe:IsShown());
end
FishingBuddy.AreWeFishing = AreWeFishing

FishingBuddy.IsSwitchClick = function(setting)
    if ( not setting ) then
        setting = "ClickToSwitch";
    end
    local a = IsShiftKeyDown();
    local b = FishingBuddy.GetSettingBool(setting);
    return ( (a and (not b)) or ((not a) and b) );
end

local function TrapWorldMouse()
    if ( WorldFrame.OnMouseDown ) then
        hooksecurefunc(WorldFrame, "OnMouseDown", WF_OnMouseDown)
    else
        SavedWFOnMouseDown = SafeHookScript(WorldFrame, "OnMouseDown", WF_OnMouseDown);
    end
end
FishingBuddy.TrapWorldMouse = TrapWorldMouse;

-- Move a macro from global to perchar, or vice versa
local function GetMacroIndex(macroname)
    for idx = 1, _G.MAX_ACCOUNT_MACROS + _G.MAX_CHARACTER_MACROS do
        local name, icon, body = GetMacroInfo(idx)
        if (name and macroname == name) then
            return idx;
        end
    end
end

local function CreateOrUpdateMacro(name, icon, body, perchar)
    local exists = GetMacroIndex(name);
    if (exists) then
        local isglobal = (exists <= _G.MAX_ACCOUNT_MACROS);
        if ((perchar and isglobal) or (not perchar and not isglobal)) then
            -- switch per char and global
            DeleteMacro(name);
            exists = nil;
        end
    end

    if (exists) then
        EditMacro(name, nil, icon, body, 1, perchar);
    else
        CreateMacro(name, icon, body, perchar);
    end
end

local function CreateFishingMacro()
    local GSB = FishingBuddy.GetSettingBool;
    local _, fishing = FL:GetFishingSkillInfo();
    local update, id, name = GetUpdateLure();
    local bag, slot;
    if (update) then
        bag, slot = FL:FindThisItem(id);
    end

    local action = "";
    if (slot) then
        action = "/stopcasting\n/use "
        if (bag) then
            action = action..bag
        end
        action = action.." "..slot.."\n";
    else
        action = "/cast ";
        if (GSB("PreventRecast")) then
            action = action.." [nochanneling:"..fishing.."] ";
        else
            action = "/stopcasting\n"..action;
        end
        action = action..fishing
    end

    local numglobal,numperchar = GetNumMacros();
    local perchar = nil;
    local fullup;
    if (GSB("ToonMacro")) then
        if (numperchar >= _G.MAX_CHARACTER_MACROS) then
            fullup = FBConstants.NOCREATEMACROPER;
        end
        perchar = 1;
    else
        if (numglobal >= _G.MAX_ACCOUNT_MACROS) then
            fullup = FBConstants.NOCREATEMACROGLOB;
        end
    end

    if (fullup) then
        FishingBuddy.Message(fullup.."\""..FBConstants.MACRONAME.."\"", 1, 0, 0);
        return;
    end

    CreateOrUpdateMacro(FBConstants.MACRONAME, "INV_Fishingpole_02", "#showtooltip Fishing\n/fb fishing start\n"..action, perchar);
end

FishingBuddy.Commands[FBConstants.FISHINGMODE] = {};
FishingBuddy.Commands[FBConstants.FISHINGMODE].help = FBConstants.FISHINGMODE_HELP;
FishingBuddy.Commands[FBConstants.FISHINGMODE].func =
    function(what)
        if(what and what == "stop") then
            StopFishingMode();
        else
            StartFishingMode();
        end

        if (FishingBuddy.GetSettingBool("CreateMacro")) then
            -- CreateFishingMacro();
        end

        return true;
    end;

local function OptionsUpdate(changed, closing)
    PushOptionChanges(changed, closing)
    RunHandlers(FBConstants.OPT_UPDATE_EVT, changed, closing);
end
FishingBuddy.OptionsUpdate = OptionsUpdate;

local function nextarg(msg, pattern)
    if ( not msg or not pattern ) then
        return nil, nil;
    end
    local s,e = string.find(msg, pattern);
    if ( s ) then
        local word = strsub(msg, s, e);
        msg = strsub(msg, e+1);
        return word, msg;
    end
    return nil, msg;
end

FishingBuddy.Command = function(msg)
    if ( not msg ) then
        return;
    end
    if ( FishingBuddy.IsLoaded() ) then
        -- collect arguments (whee, lua string manipulation)
        local cmd;
        cmd, msg = nextarg(msg, "[%w]+");

        -- the empty string gives us no args at all
        if ( not cmd ) then
            -- toggle window
            if ( FishingBuddyFrame:IsVisible() ) then
                HideUIPanel(FishingBuddyFrame);
            else
                ShowUIPanel(FishingBuddyFrame);
            end
        elseif ( cmd == FBConstants.HELP or cmd == "help" ) then
            FishingBuddy.Output(FBConstants.WINDOW_TITLE);
            if ( not FBConstants.HELPMSG ) then
                FBConstants.HELPMSG = { "@PRE_HELP" };
                for cmd,info in pairs(FishingBuddy.Commands) do
                    if ( info.help ) then
                        tinsert(FBConstants.HELPMSG, info.help);
                    end
                end
                tinsert(FBConstants.HELPMSG, "@POST_HELP");
                FL:FixupEntry(FBConstants, "HELPMSG")
            end
            FishingBuddy.PrintHelp(FBConstants.HELPMSG);
        else
            local command = FishingBuddy.Commands[cmd];
            if ( command ) then
                local args = {};
                local goodargs = true;
                if ( command.args ) then
                    for _,pat in pairs(command.args) do
                        local w, msg = nextarg(msg, pat);
                        if ( not w ) then
                            goodargs = false;
                            break;
                        end
                        tinsert(args, w);
                    end
                else
                    local a;
                    while ( msg ) do
                        a, msg = nextarg(msg, "[%w]+");
                        if ( not a ) then
                            break;
                        end
                        tinsert(args, a);
                    end
                end
                if ( not goodargs or not command.func(unpack(args)) ) then
                    if ( command.help ) then
                        FishingBuddy.PrintHelp(command.help);
                    else
                        FishingBuddy.Debug("command failed");
                    end
                end
            else
                FishingBuddy.Command("help");
            end
        end
    else
        FishingBuddy.Error(FBConstants.FAILEDINIT);
    end
end

FishingBuddy.TooltipBody = function(hintcheck)
    local text = FBConstants.DESCRIPTION1.."\n"..FBConstants.DESCRIPTION2;
    if ( hintcheck ) then
        local hint = FBConstants.TOOLTIP_HINT.." ";
        if (FishingBuddy.GetSettingBool(hintcheck)) then
            hint = hint..FBConstants.TOOLTIP_HINTSWITCH;
        else
            hint = hint..FBConstants.TOOLTIP_HINTTOGGLE;
        end
        text = text.."\n"..FL:Green(hint);
    end
    return text;
end

local efsv = nil;
FishingBuddy.EnhanceFishingSounds = function(doit, logout)
    local GSB = FishingBuddy.GetSettingBool;
    local GSO = FishingBuddy.GetSettingOption;
    if ( GSB("EnhanceFishingSounds") ) then
        if ( not efsv and doit ) then
            -- collect the current values
            local mv = GetCVar("Sound_MasterVolume");
            local mu = GetCVar("Sound_MusicVolume");
            local av = GetCVar("Sound_AmbienceVolume");
            local sv = GetCVar("Sound_SFXVolume");
            local sb = GetCVar("Sound_EnableSoundWhenGameIsInBG");
            local pd = GetCVar("particleDensity");
            local eas = GetCVar("Sound_EnableAllSound");
            local esfx = GetCVar("Sound_EnableSFX");

            efsv = {};
            if (GSB("TurnOnSound")) then
                efsv["Sound_EnableAllSound"] = eas;
                efsv["Sound_EnableSFX"] = esfx;
            end

            efsv["Sound_MasterVolume"] = mv;
            efsv["Sound_MusicVolume"] = mu;
            efsv["Sound_AmbienceVolume"] = av;
            efsv["Sound_SFXVolume"] = sv;
            efsv["Sound_EnableSoundWhenGameIsInBG"] = sb;

            if (GSB("EnhancePools")) then
                efsv["particleDensity"] = pd;
            end

            -- if we need to, turn 'em off!
            for setting in pairs(efsv) do
                local optionname = "Enhance"..setting;
                local value = FishingBuddy.GetSetting(optionname);
                value = tonumber(value);
                local info = GSO(optionname);
                if (info and info.scale) then
                    value = value / 100.0;
                end
                SetCVar(setting, value);
            end
            return; -- fall through and reset everything otherwise
        end
    end
    if ( logout ) then
        FishingBuddy_Player["ResetEnhance"] = efsv;
    end

    if ( efsv ) then
        for setting, value in pairs(efsv) do
            SetCVar(setting, tonumber(value));
        end
        efsv = nil;
    end
end

local IsZoning;
local ZoneEvents;
local function TrackZoneEvents(evt)
    if ( IsZoning ) then
        if ( not ZoneEvents ) then
            ZoneEvents = {};
        end
        if ( ZoneEvents[evt] ) then
            ZoneEvents[evt] = ZoneEvents[evt] + 1;
        else
            ZoneEvents[evt] = 1;
        end
    end
end

local function DumpZoneEvents()
    FishingBuddy.Dump(ZoneEvents);
    ZoneEvents = nil;
end

-- Return true if we might be looting from a barrel.
local function LegionBarrel()
    local continent, _ = FL:GetCurrentMapContinent();
    return (continent == 8 and FL:GetMainHandItem(true) == FBConstants.UNDERLIGHT_ANGLER);
end

FishingBuddy.OnEvent = function(self, event, ...)
--	  local line = event;
--	  for idx=1,select("#",...) do
--		  line = line.." '"..select(idx,...).."'";
--	  end
--	  FishingBuddy.Debug(line);
    local arg1 = ...;

-- TrackZoneEvents(event);
    if ( event == "PLAYER_EQUIPMENT_CHANGED" or
          event == "WEAR_EQUIPMENT_SET" or
          event == "EQUIPMENT_SWAP_FINISHED") then
        FishingMode();
        RunHandlers(FBConstants.INVENTORY_EVT)
    elseif (event == "BAG_UPDATE" ) then
        if (lootcheck) then
            if (lootcount > 0) then
                lootcount = lootcount - 1;
            end
            if (lootcount == 0) then
                lootcheck = false;
                FishingBuddy.WatchUpdate();
            end
        end
        FishingMode();
        RunHandlers(FBConstants.INVENTORY_EVT)
    elseif ( event == "LOOT_OPENED" ) then
        if ( IsFishingLoot() or LegionBarrel() ) then
            local autoLoot = ...;
            local doautoloot = false;
            local poolhint = nil;

            -- How long ago did the achievement fire?
            local elapsedtime = GetTime() - trackedtime;
            if ( elapsedtime < TRACKING_DELAY ) then
                poolhint = true;
            end

            if not autoloot and not IsModifiedClick("AUTOLOOTTOGGLE") then
                doautoloot = CustomLooting()
            end

            -- if we want to autoloot, and Blizz isn't, let's grab stuff
            local checkloot = LootSlotIsItem or LootSlotHasItem;
            for index = GetNumLootItems(), 1, -1 do
                local texture, fishie, quantity, currency, quality, locked, qitem, questID, qactive = GetLootSlotInfo(index);
                if (checkloot(index)) then
                    local link = GetLootSlotLink(index);

                    -- should we track "locked" items we couldn't loot?'
                    FishingBuddy.AddLootCache(texture, fishie, quantity, quality, link, poolhit)

                    local _, id, _ = FL:SplitFishLink(link);
                    -- handle things we can't actually count that might be in our fish (e.g. Garrison Resources)
                    if (id and quality == 0 and FL:IsMissedFish(id)) then
                        DoEscaped = 1;
                    end
                end
                if (not locked and doautoloot) then
                    LootSlot(index);
                end
            end

            ClearTooltipText();
            FL:ExtendDoubleClick();
            LureState = 0;
        elseif (DoAutoOpenLoot) then
            DoAutoOpenLoot = nil;
            for index = 1, GetNumLootItems(), 1 do
                if (doautoloot) then
                    LootSlot(index);
                end
            end
        end
    elseif ( event == "LOOT_CLOSED" ) then
        -- nothing to do here at the moment
        DoAutoOpenLoot = nil;
    elseif ( event == "PLAYER_LOGIN" ) then
        FL:CreateSAButton();
        FL:SetSAMouseEvent(FishingBuddy.GetSetting("MouseEvent"));
        RunHandlers(FBConstants.LOGIN_EVT);
    elseif ( event == "PLAYER_LOGOUT" ) then
        -- reset the fishing sounds, if we need to
        StopFishingMode(true);
        FishingBuddy.SavePlayerInfo();
        RunHandlers(FBConstants.LOGOUT_EVT);
    elseif ( event == "VARIABLES_LOADED" ) then
        local _, name = FL:GetFishingSkillInfo();
        FishingBuddy.Initialize();
        LO:CreateSlider(VolumeSlider);
        FishingBuddy.OptionsFrame.HandleOptions(GENERAL, nil, GeneralOptions);
        FishingBuddy.AddSchoolFish();

        FishingBuddy.CreateFBMappedDropDown("FBEasyKeys", "EasyCastKeys", FBConstants.CONFIG_EASYCAST_ONOFF, FBConstants.Keys)
        FishingBuddy.CreateFBMappedDropDown("FBMouseEvent", "MouseEvent", FBConstants.CONFIG_MOUSEEVENT_ONOFF, FBConstants.CastClick)

        FishingBuddy.OptionsFrame.HandleOptions(name, "Interface\\Icons\\INV_Fishingpole_02", CastingOptions);
        FishingBuddy.OptionsFrame.HandleOptions(nil, nil, InvisibleOptions);

        -- make sure we have the Macro globals
        -- if (not IsAddOnLoaded("Blizzard_MacroUI")) then
        --	LoadAddOn("Blizzard_MacroUI");
        -- end

        -- defaults to true
        if (FishingBuddy_Player and FishingBuddy_Player["Settings"] and FishingBuddy_Player["Settings"]["ShowBanner"] == nil) then
            FishingBuddy.Output(FBConstants.WINDOW_TITLE.." loaded");
        end

        self:UnregisterEvent("VARIABLES_LOADED");
        -- tell all the listeners about this one
        RunHandlers(event, ...);
    elseif ( event == "PLAYER_ENTERING_WORLD" ) then
        IsZoning = nil;
--		DumpZoneEvents();
        bagupdateframe:Show();

        if (FishingBuddy.StartedFishing and not handlerframe:IsShown()) then
            handlerframe:Show();
        end

        if (FishingBuddy_Player and FishingBuddy_Player["ResetEnhance"]) then
            efsv = FishingBuddy_Player["ResetEnhance"];
            FishingBuddy.EnhanceFishingSounds(false, false);
            FishingBuddy_Player["ResetEnhance"] = nil;
        end

        -- Default is true, not saved, therefor implicitly nil
        if (FishingBuddy_Player["Settings"]["SetupSkills"] == nil) then
            FL:GetTradeSkillData()
        end
    elseif ( event == "PLAYER_ALIVE" ) then
        FishingMode();
        if (FishingBuddy.GetSettingBool("CreateMacro")) then
            -- CreateFishingMacro();
        end
        self:UnregisterEvent("PLAYER_ALIVE");
    elseif ( event == "PLAYER_LEAVING_WORLD") then
        RunHandlers(FBConstants.LEAVING_EVT);
        IsZoning = 1;

-- Don't reenable BAG_UPDATE until we're back
        bagupdateframe:Hide();
        bagupdateframe:StopInventory()

        if (handlerframe:IsShown()) then
            handlerframe:Hide();
        end
    end
    FishingBuddy.Extravaganza.IsTime(true);
end

FishingBuddy.OnLoad = function(self)
    self:RegisterEvent("PLAYER_ENTERING_WORLD");
    self:RegisterEvent("PLAYER_LEAVING_WORLD");
    self:RegisterEvent("PLAYER_ALIVE");

    self:RegisterEvent("PLAYER_LOGIN");
    self:RegisterEvent("PLAYER_LOGOUT");
    self:RegisterEvent("VARIABLES_LOADED");

    -- we want to deal with fishing loot windows all the time
    self:RegisterEvent("LOOT_OPENED");
    self:RegisterEvent("LOOT_CLOSED");

    -- Handle item lock separately to reduce churn during world load
    -- self:RegisterEvent("ITEM_LOCK_CHANGED");
    -- self:RegisterEvent("PLAYER_EQUIPMENT_CHANGED");
    -- self:RegisterEvent("WEAR_EQUIPMENT_SET");

    self:SetScript("OnEvent", FishingBuddy.OnEvent);

    bagupdateframe.fbframe = self;
    bagupdateframe:SetScript("OnUpdate", function(self, ...)
        if (self.fbframe) then
            self:StartInventory()
            self:Hide();
            if not self.firsttime then
                if C_Calendar.OpenCalendar then
                    C_Calendar.OpenCalendar()
                else
                    OpenCalendar()
                end
                RunHandlers(FBConstants.FIRST_UPDATE_EVT);
                FishingBuddy.WatchUpdate();
                self.firsttime = true
            end
        end
    end);

    RegisterHandlers(CaptureEvents);

    -- Set up command
    SlashCmdList["fishingbuddy"] = FishingBuddy.Command;
    SLASH_fishingbuddy1 = "/fishingbuddy";
    SLASH_fishingbuddy2 = "/fb";

    FL:RegisterAddonMessagePrefix(FBConstants.MSGID)
end

FishingBuddy.PrintHelp = function(tab)
    if ( tab ) then
        if ( type(tab) == "table" ) then
            for _,line in pairs(tab) do
                FishingBuddy.PrintHelp(line);
            end
        else
            -- check for a reference to another help item
            local _,_,w = string.find(tab, "^@([A-Z0-9_]+)$");
            if ( w and FBConstants[w] ) then
                FishingBuddy.PrintHelp(FBConstants[w]);
            else
                FishingBuddy.Output(tab);
            end
        end
    end
end

FishingBuddy.FishSort = function(tab, forcename)
    if ( forcename or not FishingBuddy.GetSettingBool("SortByPercent") ) then
        table.sort(tab, function(a,b) return (a.index and b.index and a.index<b.index) or
                                                         (a.text and b.text and a.text<b.text); end);
    else
        table.sort(tab, function(a,b) return a.count and b.count and b.count<a.count; end);
    end
end

local function nocase (s)
    s = string.gsub(s, "%a", function (c)
                                         return string.format("[%s%s]", string.lower(c),
                                                 string.upper(c))
                                     end)
    return s
end

FishingBuddy.StripRaw = function(fishie)
    if ( fishie ) then
        local raw = nocase(FBConstants.RAW);
        local s,e = string.find(fishie, raw.." ");
        if ( s ) then
            if ( s > 1 ) then
                fishie = string.sub(fishie, 1, s-1)..string.sub(fishie, e+1);
            else
                fishie = string.sub(fishie, e+1);
            end
        else
            s,e = string.find(fishie, " "..raw);
            if ( s ) then
                fishie = string.sub(fishie, 1, s-1)..string.sub(fishie, e+1);
            end
        end
        return fishie;
    end
    -- this means an import failed somewhere
    return UNKNOWN;
end

FishingBuddy.ToggleDropDownMenu = function(level, value, menu, anchor, xOffset, yOffset)
    ToggleDropDownMenu(level, value, menu, anchor, xOffset, yOffset);
    if (not level) then
        level = 1;
    end
    local anchorName;
    if ( type(anchor) == "string" ) then
        anchorName = anchor;
    else
        anchorName = anchor:GetName();
    end
    local frame = _G["DropDownList"..level];
    local uiScale = UIParent:GetScale()
    if ( frame:GetRight() > ( GetScreenWidth()*uiScale ) ) then
        if ( anchorName == "cursor" ) then
            if ( not xOffset ) then
                xOffset = 0;
            end
            if ( not yOffset ) then
                yOffset = 0;
            end
            local cursorX, cursorY = GetCursorPosition();
            xOffset = -cursorX + xOffset;
            yOffset = cursorY + yOffset;
        else
            if ( not xOffset or not yOffset ) then
                xOffset = 8;
                yOffset = 22;
            end
        end
        frame:ClearAllPoints();
        frame:SetPoint("TOPRIGHT", anchorName, "BOTTOMLEFT", -xOffset, yOffset);
    end
    if ( frame:GetBottom() < 0 ) then
        frame:ClearAllPoints();
        frame:SetPoint("BOTTOMRIGHT", anchorName, "BOTTOMLEFT", -xOffset, yOffset);
    end
end

FishingBuddy.EnglishList = function(list, conjunction)
    if ( list ) then
        local n = table.getn(list);
        local str = "";
        for idx=1,n do
            local name = list[idx];
            if ( idx == 1 ) then
                str = name;
            elseif ( idx == n ) then
                str = str .. ", ";
                if ( conjunction ) then
                    str = str .. conjunction;
                else
                    str = str .. "and";
                end
                str = str .. " " .. name;
            else
                str = str .. ", " .. name;
            end
        end
        return str;
    end
end

FishingBuddy.UIError = function(msg)
    -- Okay, this check is probably not necessary...
    if ( UIErrorsFrame ) then
        UIErrorsFrame:AddMessage(msg, 1.0, 0.1, 0.1, 1.0, UIERRORS_HOLD_TIME);
    else
        FishingBuddy.Error(msg);
    end
end

FishingBuddy.Testing = function(line)
    if ( not FishingBuddy_Info["Testing"] ) then
        FishingBuddy_Info["Testing"] = {};
    end
    tinsert(FishingBuddy_Info["Testing"], line);
end

if ( FishingBuddy.Debugging ) then
    FishingBuddy.Commands["poles"] = {};
    FishingBuddy.Commands["poles"].func =
        function()
            local _,_,_,_,fp_itemtype,fp_subtype,_,_,_,_ = FL:GetItemInfo(6256);
            FishingBuddy.Debug("'"..fp_itemtype.."' '"..fp_subtype.."'");
            for name,item in pairs(POLES) do
                local link = "item:"..item;
                if ( not FL:IsLinkableItem(item) ) then
                    FishingBuddy.Debug(link);
                    -- fetch the data (may disconnect)
                    FishingBuddyTooltip:SetHyperlink(link);
                end
                -- now that we have it in our cache, get the name
                local nm,li,ra,ml,it,st,sc,el,tx,il = FL:GetItemInfo(link);
                if ( nm ) then
                    FishingBuddy.Debug("		'"..it.."' '"..st.."'");
                end
            end
            return true;
        end

    FishingBuddy.Commands["showopen"] = {};
    FishingBuddy.Commands["showopen"].func =
        function()
            -- FishingBuddy_Info["Fishies"][id].canopen
            for id,info in pairs(FishingBuddy_Info["Fishies"]) do
                if (FishingBuddy_Info["Fishies"][id].canopen) then
                    FishingBuddy.Debug("Id: %d Name: %s", id, info[CurLoc]);
                end
            end
            return true;
        end

    FishingBuddy.Commands["nowopen"] = {};
    FishingBuddy.Commands["nowopen"].func =
        function()
            -- 58856
            for idx,info in pairs(OpenThisFishId) do
                FishingBuddy.Debug(idx, info);
            end
            return true;
        end

    FishingBuddy.Commands["macrotest"] = {};
    FishingBuddy.Commands["macrotest"].func =
        function()
            CreateFishingMacro();
            return true;
        end
end
