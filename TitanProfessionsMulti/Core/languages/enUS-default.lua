--[[
	Do you want help us translating to your language?
	Access the translation project: https://wow.curseforge.com/projects/titan-panel-professions-multi/localization
	Author: Canettieri
--]]

local _, L = ...;
------ Professions pack
--- Profissions (default)
L["alchemy"] = "Alchemy"
L["archaeology"] = "Archaeology"
L["blacksmithing"] = "Blacksmithing"
L["cooking"] = "Cooking"
L["enchanting"] = "Enchanting"
L["engineering"] = "Engineering"
L["firstAid"] = "First Aid"
L["fishing"] = "Fishing"
L["herbalism"] = "Herbalism"
L["herbalismskills"] = "Herbalism Skills"
L["inscription"] = "Inscription"
L["jewelcrafting"] = "Jewelcrafting"
L["leatherworking"] = "Leatherworking"
L["mining"] = "Mining"
L["miningskills"] = "Mining Skills"
L["skinning"] = "Skinning"
L["skinningskills"] = "Skinning Skills"
L["tailoring"] = "Tailoring"
--- Master (default)
L["masterPlayer"] = "|cFFFFFFFFDisplaying all ${player}|r|cFFFFFFFF's professions.|r"
L["masterTutorialBar"] = "|cFF69FF69Point your cursor here! :)|r"
L["masterTutorial"] = TitanUtils_GetHighlightText("\r[INTRODUCTION]").."\r\rThis plugin has the function to summarize all your\rprofessions in one place. Unlike the separate plugins,\rthis one will display EVERYTHING in this tooltip.\r\r"..TitanUtils_GetHighlightText("[HOW TO USE]").."\r\rTo start, right click on this plugin and select the\roption"..TitanUtils_GetHighlightText(" 'Hide Tutorial'")..".\r\rCan be displayed in the right side of the Titan Panel\rto become even more visually pleasing!"
L["hideTutorial"] = "Hide Tutorial"
L["masterHint"] = "|cFFB4EEB4Hint:|r |cFFFFFFFFLeft click opens the profession #1 window\rand middle click opens the profession #2 window.|r\r\r"
L["primprof"] = "Show Primary Professions"
L["bar"] = "Bar"

------ Reagents pack
--- Achaeology (default)
L["ready"] = "|cFF69FF69Ready!  "
L["archfragments"] = "Archaeology Fragments"
L["fragments"] = "Fragments"
L["fragtooltip"] = "|cFFB4EEB4Hint:|r |cFFFFFFFFRight-click in the plugin and\rselect which fragment will be\rdisplayed in the bar.|r\r"
L["hidehint"] = "Hide Hint"
L["displaynofrag"] = "Display Races Without Fragments"
L["inprog"] = "\rIn progress:"
L["nofragments"] = "No fragments"
L["tooltip"] = "Tooltip"
L["noarchaeology"] = "|cFFFF2e2eYou didn't learn archaeology yet\ror don't have fragments.|r\r\rGo to the closest trainer to learn it\ror visit an excavation field."
--- Enchanting (default)
L["arkhana"] = "|cFFFFFFFFArkhana|r"
L["leylight"] = "|cff0070ddLeylight Shard|r"
L["chaosCrystal"] = "|cffa335eeChaos Crystal|r"
--- Fishing (default)
L["mackerel"] = "|cFFFFFFFFSilver Mackerel|r"
L["queenfish"] = "|cFFFFFFFFCursed Queenfish|r"
L["salmon"] = "|cFFFFFFFFHighmountain Salmon|r"
L["mossgill"] = "|cFFFFFFFFMossgill Perch|r"
L["stormray"] = "|cFFFFFFFFStormray|r"
L["koi"] = "|cFFFFFFFFRunescale Koi|r"
L["barracuda"] = "|cFFFFFFFFBlack Barracuda|r"
--- Herbalism (default)
L["yseralline"] = "|cFFFFFFFFYseralline Seed|r"
L["felwort"] = "|cff1eff00Felwort|r"
L["starlight"] = "|cFFFFFFFFStarlight Rose|r"
L["fjarn"] = "|cFFFFFFFFFjarnskaggl|r"
L["foxflower"] = "|cFFFFFFFFFoxflower|r"
L["dreamleaf"] = "|cFFFFFFFFDreamleaf|r"
L["aethril"] = "|cFFFFFFFFAethril|r"
--- Mining (default)
L["leystone"] = "|cFFFFFFFFLeystone Ore|r"
L["felslate"] = "|cFFFFFFFFFelslate|r"
L["brimstone"] = "|cff1eff00Infernal Brimstone|r"
L["blood"] = "|cff0070ddBlood of Sargeras|r"
--- Skinning (default)
L["stormscale"] = "|cFFFFFFFFStormscale|r"
L["stonehide"] = "|cFFFFFFFFStonehide Leather|r"
L["felhide"] = "|cff1eff00Felhide|r"
L["tooth"] = "|cFFFFFFFFUnbroken Tooth|r"
L["claw"] = "|cFFFFFFFFUnbroken Claw|r"
--- Tailoring (default)
L["shaldorei"] = "|cFFFFFFFFShal'dorei Silk|r"
L["silkweave"] = "|cFFFFFFFFImbued Silkweave|r"

------ Shared with one or more
--- Shared (default)
L["hint"] = "|cFFB4EEB4Hint:|r |cFFFFFFFFLeft-click opens your\rprofession window.|r\r\r"
L["maximum"] = "Max"
L["noprof"] = "Not learned"
L["bonus"] = "(Bonus)"
L["hidemax"] = "Hide Maximum Values"
L["session"] = "|rLearned this session: "
L["noskill"] = "|cFFFF2e2eYou didn't learn this profession yet.|r\r\rGo to the closest trainer to learn it.\rIf you need, you can forget any\rprimary profession."
L["nosecskill"] = "|cFFFF2e2eYou didn't learn this profession yet.|r\r\rGo to the closest trainer to learn it."
L["showbb"] = "Display Session Balance in Bar"
L["simpleb"] = "Simplified Bonus"
L["craftsmanship"] = "\rSkill: "
L["goodwith"] = "\r\r"..TitanUtils_GetHighlightText("[Combine with]").."\r"
L["info"] = TitanUtils_GetHighlightText("[Information]")
L["maxskill"] = "|rYou have reached maximum potential!"
L["warning"] = "\r\r|cFFFF2e2e[Attention!]|r\rYou have reached the maximum\rexpertise and is not learning\ranymore! Go to a trainer or learn\rthe local expertise."
L["maxtext"] = "\r|rCurrent maximum (no bonus): "
L["totalbag"] = "Total in Bag: "
L["totalbank"] = "Total in Bank: "
L["reagents"] = "Reagents"
L["noreagent"] = "You have not got any\rof these reagents."
L["hide"] = "Hide"
