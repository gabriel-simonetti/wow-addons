--[[ 
AdiBags - Revelry! v0.9k [5.12.2017]
"Add filters for holidays to AdiBags."
]]--

local AddonName, AddonTable = ...
local L = AddonTable.L
local DEBUG = false
--[===[@debug@
local DEBUG = true
--@end-debug@]===]
local function DebugPrint(errorMessage)
	if DEBUG then
		print(RED_FONT_COLOR_CODE..AddonName..":"..errorMessage)
	end
end

-- convert item tables to filter names
local tableToFilter = {
	["FestiveMug"] = L["Holidays"],
	["Noblegarden"] = L["Noblegarden"],
	["NoblegardenAttire"] = L["Noblegarden"],
	["NoblegardenMounts"] = L["Noblegarden"],
	["NoblegardenPets"] = L["Noblegarden"],
	["ChildrensWeek"] = L["Children's Week"],
	["ChildrensWeekFare"] = L["Children's Week"],
	["ChildrensWeekPets"] = L["Children's Week"],
	["ChildrensWeekToys"] = L["Children's Week"],
	["FireFestival"] = L["Fire Festival"],
	["FireFestivalSpecial"] = L["Fire Festival"],
	["FireFestivalArms"] = L["Fire Festival"],
	["FireFestivalAttire"] = L["Fire Festival"],
	["FireFestivalFare"] = L["Fire Festival"],
	["FireFestivalPets"] = L["Fire Festival"],
	["FireFestivalToys"] = L["Fire Festival"],
	["PiratesDay"] = L["Pirates' Day"],
	["PiratesDayToys"] = L["Pirates' Day"],
	["Brewfest"] = L["Brewfest"],
	["BrewfestTokens"] = L["Brewfest"],
	["BrewOfTheMonth"] = L["Brewfest"],
	["BrewfestFare"] = L["Brewfest"],
	["StrangeBrew"] = L["Brewfest"],
	["BrewfestBrew"] = L["Brewfest"],
	["BrewfestAttire"] = L["Brewfest"],
	["BrewfestHops"] = L["Brewfest"],
	["BrewfestMounts"] = L["Brewfest"],
	["BrewfestPets"] = L["Brewfest"],
	["BrewfestToys"] = L["Brewfest"],
	["DayOfTheDead"] = L["Day of the Dead"],
	["DayOfTheDeadAttire"] = L["Day of the Dead"],
	["DayOfTheDeadRecipes"] = L["Day of the Dead"],
	["DayOfTheDeadFare"] = L["Day of the Dead"],
	["DayOfTheDeadPets"] = L["Day of the Dead"],
	["DayOfTheDeadToys"] = L["Day of the Dead"],
	-- Micro-Holidays
	["CallOfTheScarab"] = L["Call of the Scarab"],
	["HatchingOfTheHippogryphs"] = L["Hatching of the Hippogryphs"],
	["UnGoroMadness"] = L["Un'Goro Madness"],
	["MarchOfTheTadpoles"] = L["March Of The Tadpoles"],
	["GlowcapFestival"] = L["Glowcap Festival"],
	["ThousandBoatBash"] = L["Thousand Boat Bash"],
	["TavernCrawl"] = L["Tavern Crawl"],
	-- Darkmoon Faire
	["DarkmoonGuide"] = L["Darkmoon Faire"],
	["DarkmoonTokens"] = L["Darkmoon Faire"],
	["DarkmoonTickets"] = L["Darkmoon Faire"],
	["DarkmoonDaggermaw"] = L["Darkmoon Faire"],
	["DarkmoonItemsQ"] = L["Darkmoon Faire"],
	["DarkmoonAdventurer"] = L["Darkmoon Faire"],
	["FairegoersFeast"] = L["Darkmoon Faire"],
	["DarkmoonFirework"] = L["Darkmoon Faire"],
	["DarkmoonProfs"] = L["Darkmoon Faire"],
	["DarkmoonReagents"] = L["Darkmoon Faire"],
	["DarkmoonFishing"] = L["Darkmoon Faire"],
	["DarkmoonRecipes"] = L["Darkmoon Faire"],
	["DarkmoonArms"] = L["Darkmoon Faire"],
	["DarkmoonAttire"] = L["Darkmoon Faire"],
	["DarkmoonItemsV"] = L["Darkmoon Faire"],
	["DarkmoonMounts"] = L["Darkmoon Faire"],
	["DarkmoonPets"] = L["Darkmoon Faire"],
	["DarkmoonToys"] = L["Darkmoon Faire"],
	["DarkmoonFare"] = L["Darkmoon Faire"],
	["DarkmoonRewards"] = L["Darkmoon Faire"],
	["DarkmoonFortunes"] = L["Darkmoon Faire"],
	["NemelexXobeh"] = L["Darkmoon Faire"],
	["VanillaCards"] = L["Darkmoon Faire"],
	["CrusadeCards"] = L["Darkmoon Faire"],
	["WrathCards"] = L["Darkmoon Faire"],
	["CataCards"] = L["Darkmoon Faire"],
	["PandaCards"] = L["Darkmoon Faire"],
	["DraenorCards"] = L["Darkmoon Faire"],
	["LegionCards"] = L["Darkmoon Faire"],
}

-- AdiBags filters 
local AdiBags = LibStub("AceAddon-3.0"):GetAddon("AdiBags")
local setFilter = AdiBags:RegisterFilter(L["Revelry!"], 99)
setFilter.uiName = L["Revelry!"]
setFilter.uiDesc = L["Add filters for holidays to AdiBags."]
	..'\n'..L[""]
	..'\n|cffff7700'..L["This is a work in progress and not all holidays are currently supported. Stay posted for updates as missing holidays come around."]..'|r'
	..'\n'..L[""]

function setFilter:Filter(slotData)
	for tableName,tableDescription in pairs(tableToFilter) do
		if setFilter.db.profile[tableName] then -- option is enabled
			if AddonTable.HolidayTables[tableName][slotData.itemId] then
				return tableDescription
			end
		end
	end
end


function setFilter:OnInitialize()
	self.db = AdiBags.db:RegisterNamespace(L["Revelry!"], {
		profile = {
			-- Holidays
			HolidaysAll = false,
			MergeHolidays = false,
			MergeMicroHolidays = false,
			FestiveMug = false,
			NoblegardenAll = false,
			Noblegarden = false,
			NoblegardenAttire = false,
			NoblegardenMounts = false,
			NoblegardenPets = false,
			ChildrensWeekAll = false,
			ChildrensWeek = false,
			ChildrensWeekFare = false,
			ChildrensWeekPets = false,
			ChildrensWeekToys = false,
			FireFestivalAll = false,
			FireFestival = false,
			FireFestivalSpecial = false,
			FireFestivalArms = false,
			FireFestivalAttire = false,
			FireFestivalFare = false,
			FireFestivalPets = false,
			FireFestivalToys = false,
			PiratesDayAll = false,
			PiratesDay = false,
			PiratesDayToys = false,
			BrewfestAll = false,
			Brewfest = false,
			BrewfestTokens = false,
			BrewOfTheMonthClub = false,
			BrewOfTheMonth = false,
			BrewfestFare = false,
			StrangeBrew = false,
			BrewfestBrew = false,
			BrewfestAttire = false,
			BrewfestHops = false,
			BrewfestMounts = false,
			BrewfestPets = false,
			BrewfestToys = false,
			DayOfTheDeadAll = false,
			DayOfTheDead = false,
			DayOfTheDeadAttire = false,
			DayOfTheDeadRecipes = false,
			DayOfTheDeadFare = false,
			DayOfTheDeadPets = false,
			DayOfTheDeadToys = false,
			-- Micro-Holidays
			CallOfTheScarab = false,
			HatchingOfTheHippogryphs = false,
			UnGoroMadness = false,
			MarchOfTheTadpoles = false,
			GlowcapFestival = false,
			ThousandBoatBash = false,
			TavernCrawl = false,
			-- Darkmoon Faire
			DarkmoonAll = false,
			DarkmoonGuide = false,
			DarkmoonTokens = false,
			DarkmoonTickets = false,
			DarkmoonDaggermaw = false,
			DarkmoonItemsQ = false,
			DarkmoonAdventurer = false,
			FairegoersFeast = false,
			DarkmoonFirework = false,
			DarkmoonProfs = false,
			DarkmoonReagents = false,
			DarkmoonFishing = false,
			DarkmoonRecipes = false,
			DarkmoonArms = false,
			DarkmoonAttire = false,
			DarkmoonItemsV = false,
			DarkmoonMounts = false,
			DarkmoonPets = false,
			DarkmoonToys = false,
			DarkmoonFare = false,
			DarkmoonRewards = false,
			DarkmoonFortunes = false,
			--Playing Cards
			PlayingCardsAll = false,
			PlayingCardsAlt = false,
			NemelexXobeh = false,
			VanillaCards = false,
			CrusadeCards = false,
			WrathCards = false,
			CataCards = false,
			PandaCards = false,
			DraenorCards = false,
			LegionCards = false,
		}
	})
	if self.db.profile.MergeHolidays then
	-- Merge Holidays
		tableToFilter["Noblegarden"] = L["Holidays"]
		tableToFilter["NoblegardenAttire"] = L["Holidays"]
		tableToFilter["NoblegardenMounts"] = L["Holidays"]
		tableToFilter["NoblegardenPets"] = L["Holidays"]
		tableToFilter["ChildrensWeek"] = L["Holidays"]
		tableToFilter["ChildrensWeekFare"] = L["Holidays"]
		tableToFilter["ChildrensWeekPets"] = L["Holidays"]
		tableToFilter["ChildrensWeekToys"] = L["Holidays"]
		tableToFilter["FireFestival"] = L["Holidays"]
		tableToFilter["FireFestivalSpecial"] = L["Holidays"]
		tableToFilter["FireFestivalArms"] = L["Holidays"]
		tableToFilter["FireFestivalAttire"] = L["Holidays"]
		tableToFilter["FireFestivalFare"] = L["Holidays"]
		tableToFilter["FireFestivalPets"] = L["Holidays"]
		tableToFilter["FireFestivalToys"] = L["Holidays"]
		tableToFilter["FireFestivalToys"] = L["Holidays"]
		tableToFilter["PiratesDay"] = L["Holidays"]
		tableToFilter["PiratesDayToys"] = L["Holidays"]
		tableToFilter["Brewfest"] = L["Holidays"]
		tableToFilter['"Brew of the Month" Club'] = L["Holidays"]
		tableToFilter["BrewfestTokens"] = L["Holidays"]
		tableToFilter["BrewOfTheMonth"] = L["Holidays"]
		tableToFilter["BrewfestFare"] = L["Holidays"]
		tableToFilter["StrangeBrew"] = L["Holidays"]
		tableToFilter["BrewfestBrew"] = L["Holidays"]
		tableToFilter["BrewfestAttire"] = L["Holidays"]
		tableToFilter["BrewfestHops"] = L["Holidays"]
		tableToFilter["BrewfestMounts"] = L["Holidays"]
		tableToFilter["BrewfestPets"] = L["Holidays"]
		tableToFilter["BrewfestToys"] = L["Holidays"]
		tableToFilter["DayOfTheDead"] = L["Holidays"]
		tableToFilter["DayOfTheDeadAttire"] = L["Holidays"]
		tableToFilter["DayOfTheDeadRecipes"] = L["Holidays"]
		tableToFilter["DayOfTheDeadFare"] = L["Holidays"]
		tableToFilter["DayOfTheDeadPets"] = L["Holidays"]
		tableToFilter["DayOfTheDeadToys"] = L["Holidays"]
	end
	if self.db.profile.MergeMicroHolidays then
	-- Merge Micro-Holidays
		tableToFilter["CallOfTheScarab"] = L["Micro-Holidays"]
		tableToFilter["HatchingOfTheHippogryphs"] = L["Micro-Holidays"]
		tableToFilter["UnGoroMadness"] = L["Micro-Holidays"]
		tableToFilter["MarchOfTheTadpoles"] = L["Micro-Holidays"]
		tableToFilter["GlowcapFestival"] = L["Micro-Holidays"]
		tableToFilter["ThousandBoatBash"] = L["Micro-Holidays"]
		tableToFilter["TavernCrawl"] = L["Micro-Holidays"]
	end
	if self.db.profile.MergeAllHolidays then
	-- Merge Everything
		tableToFilter["Noblegarden"] = L["Holidays"]
		tableToFilter["NoblegardenAttire"] = L["Holidays"]
		tableToFilter["NoblegardenMounts"] = L["Holidays"]
		tableToFilter["NoblegardenPets"] = L["Holidays"]
		tableToFilter["ChildrensWeek"] = L["Holidays"]
		tableToFilter["FireFestivalSpecial"] = L["Holidays"]
		tableToFilter["ChildrensWeekPets"] = L["Holidays"]
		tableToFilter["ChildrensWeekToys"] = L["Holidays"]
		tableToFilter["FireFestival"] = L["Holidays"]
		tableToFilter["FireFestivalSpecial"] = L["Holidays"]
		tableToFilter["FireFestivalArms"] = L["Holidays"]
		tableToFilter["FireFestivalAttire"] = L["Holidays"]
		tableToFilter["FireFestivalFare"] = L["Holidays"]
		tableToFilter["FireFestivalPets"] = L["Holidays"]
		tableToFilter["FireFestivalToys"] = L["Holidays"]
		tableToFilter["PiratesDay"] = L["Holidays"]
		tableToFilter["PiratesDayToys"] = L["Holidays"]
		tableToFilter["Brewfest"] = L["Holidays"]
		tableToFilter['"Brew of the Month" Club'] = L["Holidays"]
		tableToFilter["BrewfestTokens"] = L["Holidays"]
		tableToFilter["BrewOfTheMonth"] = L["Holidays"]
		tableToFilter["BrewfestFare"] = L["Holidays"]
		tableToFilter["StrangeBrew"] = L["Holidays"]
		tableToFilter["BrewfestBrew"] = L["Holidays"]
		tableToFilter["BrewfestAttire"] = L["Holidays"]
		tableToFilter["BrewfestHops"] = L["Holidays"]
		tableToFilter["BrewfestMounts"] = L["Holidays"]
		tableToFilter["BrewfestPets"] = L["Holidays"]
		tableToFilter["BrewfestToys"] = L["Holidays"]
		tableToFilter["DayOfTheDead"] = L["Holidays"]
		tableToFilter["DayOfTheDeadAttire"] = L["Holidays"]
		tableToFilter["DayOfTheDeadRecipes"] = L["Holidays"]
		tableToFilter["DayOfTheDeadFare"] = L["Holidays"]
		tableToFilter["DayOfTheDeadPets"] = L["Holidays"]
		tableToFilter["DayOfTheDeadToys"] = L["Holidays"]
		-- Micro-Holidays
		tableToFilter["CallOfTheScarab"] = L["Holidays"]
		tableToFilter["HatchingOfTheHippogryphs"] = L["Holidays"]
		tableToFilter["UnGoroMadness"] = L["Holidays"]
		tableToFilter["MarchOfTheTadpoles"] = L["Holidays"]
		tableToFilter["GlowcapFestival"] = L["Holidays"]
		tableToFilter["ThousandBoatBash"] = L["Holidays"]
		tableToFilter["TavernCrawl"] = L["Holidays"]
		-- Darkmoon Faire
		tableToFilter["Darkmoon Faire"] = L["Holidays"]
		tableToFilter["DarkmoonTokens"] = L["Holidays"]
		tableToFilter["DarkmoonTickets"] = L["Holidays"]
		tableToFilter["DarkmoonDaggermaw"] = L["Holidays"]
		tableToFilter["DarkmoonItemsQ"] = L["Holidays"]
		tableToFilter["DarkmoonAdventurer"] = L["Holidays"]
		tableToFilter["FairegoersFeast"] = L["Holidays"]
		tableToFilter["DarkmoonFirework"] = L["Holidays"]
		tableToFilter["DarkmoonProfs"] = L["Holidays"]
		tableToFilter["DarkmoonReagents"] = L["Holidays"]
		tableToFilter["DarkmoonFishing"] = L["Holidays"]
		tableToFilter["DarkmoonRecipes"] = L["Holidays"]
		tableToFilter["DarkmoonArms"] = L["Holidays"]
		tableToFilter["DarkmoonAttire"] = L["Holidays"]
		tableToFilter["DarkmoonItemsV"] = L["Holidays"]
		tableToFilter["DarkmoonMounts"] = L["Holidays"]
		tableToFilter["DarkmoonPets"] = L["Holidays"]
		tableToFilter["DarkmoonToys"] = L["Holidays"]
		tableToFilter["DarkmoonFare"] = L["Holidays"]
		tableToFilter["DarkmoonRewards"] = L["Holidays"]
		tableToFilter["DarkmoonFortunes"] = L["Holidays"]
		tableToFilter["Playing Cards"] = L["Holidays"]
		tableToFilter["NemelexXobeh"] = L["Holidays"]
		tableToFilter["VanillaCards"] = L["Holidays"]
		tableToFilter["CrusadeCards"] = L["Holidays"]
		tableToFilter["WrathCards"] = L["Holidays"]
		tableToFilter["CataCards"] = L["Holidays"]
		tableToFilter["PandaCards"] = L["Holidays"]
		tableToFilter["DraenorCards"] = L["Holidays"]
		tableToFilter["LegionCards"] = L["Holidays"]
	end
	if self.db.profile.BrewOfTheMonthClub then
		tableToFilter["BrewOfTheMonth"] = L['"Brew of the Month" Club']
	end
	if self.db.profile.PlayingCardsAlt then
		tableToFilter["NemelexXobeh"] = L["Playing Cards"]
		tableToFilter["VanillaCards"] = L["Playing Cards"]
		tableToFilter["CrusadeCards"] = L["Playing Cards"]
		tableToFilter["WrathCards"] = L["Playing Cards"]
		tableToFilter["CataCards"] = L["Playing Cards"]
		tableToFilter["PandaCards"] = L["Playing Cards"]
		tableToFilter["DraenorCards"] = L["Playing Cards"]
		tableToFilter["LegionCards"] = L["Playing Cards"]
	end
end

function setFilter:GetOptions()
	return {
		header = {
			name = L["AdiBags - Revelry! v0.9k"],
			type = 'header',
			order = 0,
		},
		MainPane = {
			name = L[""],
			desc = L["Provides filters for holidays."],
			type = 'group',
			order = 10,
			inline = true,
			args = {
				OptionsGroup = {
					name = L["Options"],
					type = 'group',
					order = 1,
					inline = true,
					args = {
						header = {
							name = L[""],
							type = 'header',
							order = 2,
						},
						HolidaysAll = {
							name = L["Select All"],
							desc = L["Toggle all holiday filters (including micro-holidays and the Darkmoon Faire)."],
							type = 'toggle',
							width = 'normal',
							order = 1,
							set = function(info,val)
								if val then
									self.db.profile.FestiveMug = true
									self.db.profile.NoblegardenAll = true
									self.db.profile.Noblegarden = true
									self.db.profile.NoblegardenAttire = true
									self.db.profile.NoblegardenMounts = true
									self.db.profile.NoblegardenPets = true
									self.db.profile.ChildrensWeekAll = true
									self.db.profile.ChildrensWeek = true
									self.db.profile.ChildrensWeekFare = true
									self.db.profile.ChildrensWeekPets = true
									self.db.profile.ChildrensWeekToys = true
									self.db.profile.FireFestivalAll = true
									self.db.profile.FireFestival = true
									self.db.profile.FireFestivalSpecial = true
									self.db.profile.FireFestivalArms = true
									self.db.profile.FireFestivalAttire = true
									self.db.profile.FireFestivalFare = true
									self.db.profile.FireFestivalPets = true
									self.db.profile.FireFestivalToys = true
									self.db.profile.PiratesDayAll = true
									self.db.profile.PiratesDay = true
									self.db.profile.PiratesDayToys = true
									self.db.profile.BrewfestAll = true
									self.db.profile.Brewfest = true
									self.db.profile.BrewOfTheMonthClub = true
									self.db.profile.BrewfestTokens = true
									self.db.profile.BrewOfTheMonth = true
									self.db.profile.BrewfestAttire = true
									self.db.profile.BrewfestFare = true
									self.db.profile.StrangeBrew = true
									self.db.profile.BrewfestBrew = true
									self.db.profile.BrewfestHops = true
									self.db.profile.BrewfestMounts = true
									self.db.profile.BrewfestPets = true
									self.db.profile.BrewfestToys = true
									self.db.profile.DayOfTheDeadAll = true
									self.db.profile.DayOfTheDead = true
									self.db.profile.DayOfTheDeadAttire = true
									self.db.profile.DayOfTheDeadRecipes = true
									self.db.profile.DayOfTheDeadFare = true
									self.db.profile.DayOfTheDeadPets = true
									self.db.profile.DayOfTheDeadToys = true
									-- Micro-Holidays
									self.db.profile.MicroHolidaysAll = true
									self.db.profile.CallOfTheScarab = true
									self.db.profile.HatchingOfTheHippogryphs = true
									self.db.profile.UnGoroMadness = true
									self.db.profile.MarchOfTheTadpoles = true
									self.db.profile.GlowcapFestival = true
									self.db.profile.ThousandBoatBash = true
									self.db.profile.TavernCrawl = true
									-- Darkmoon Faire
									self.db.profile.DarkmoonAll = true
									self.db.profile.DarkmoonGuide = true
									self.db.profile.DarkmoonTokens = true
									self.db.profile.DarkmoonTickets = true
									self.db.profile.DarkmoonDaggermaw = true
									self.db.profile.DarkmoonItemsQ = true
									self.db.profile.DarkmoonAdventurer = true
									self.db.profile.FairegoersFeast = true
									self.db.profile.DarkmoonFirework = true
									self.db.profile.DarkmoonProfs = true
									self.db.profile.DarkmoonReagents = true
									self.db.profile.DarkmoonFishing = true
									self.db.profile.DarkmoonRecipes = true
									self.db.profile.DarkmoonArms = true
									self.db.profile.DarkmoonAttire = true
									self.db.profile.DarkmoonItemsV = true
									self.db.profile.DarkmoonMounts = true
									self.db.profile.DarkmoonPets = true
									self.db.profile.DarkmoonToys = true
									self.db.profile.DarkmoonFare = true
									self.db.profile.DarkmoonRewards = true
									self.db.profile.DarkmoonFortunes = true
									self.db.profile.PlayingCardsAll = true
									self.db.profile.PlayingCardsAlt = true
									self.db.profile.NemelexXobeh = true
									self.db.profile.VanillaCards = true
									self.db.profile.CrusadeCards = true
									self.db.profile.WrathCards = true
									self.db.profile.CataCards = true
									self.db.profile.PandaCards = true
									self.db.profile.DraenorCards = true
									self.db.profile.LegionCards = true
								elseif not val then
									self.db.profile.FestiveMug = false
									self.db.profile.NoblegardenAll = false
									self.db.profile.Noblegarden = false
									self.db.profile.NoblegardenAttire = false
									self.db.profile.NoblegardenMounts = false
									self.db.profile.NoblegardenPets = false
									self.db.profile.ChildrensWeekAll = false
									self.db.profile.ChildrensWeek = false
									self.db.profile.ChildrensWeekFare = false
									self.db.profile.ChildrensWeekPets = false
									self.db.profile.ChildrensWeekToys = false
									self.db.profile.FireFestivalAll = false
									self.db.profile.FireFestival = false
									self.db.profile.FireFestivalSpecial = false
									self.db.profile.FireFestivalArms = false
									self.db.profile.FireFestivalAttire = false
									self.db.profile.FireFestivalFare = false
									self.db.profile.FireFestivalPets = false
									self.db.profile.FireFestivalToys = false
									self.db.profile.PiratesDayAll = false
									self.db.profile.PiratesDay = false
									self.db.profile.PiratesDayToys = false
									self.db.profile.BrewfestAll = false
									self.db.profile.Brewfest = false
									self.db.profile.BrewOfTheMonthClub = false
									self.db.profile.BrewfestTokens = false
									self.db.profile.BrewOfTheMonth = false
									self.db.profile.BrewfestAttire = false
									self.db.profile.BrewfestFare = false
									self.db.profile.StrangeBrew = false
									self.db.profile.BrewfestBrew = false
									self.db.profile.BrewfestHops = false
									self.db.profile.BrewfestMounts = false
									self.db.profile.BrewfestPets = false
									self.db.profile.BrewfestToys = false
									self.db.profile.DayOfTheDeadAll = false
									self.db.profile.DayOfTheDead = false
									self.db.profile.DayOfTheDeadAttire = false
									self.db.profile.DayOfTheDeadRecipes = false
									self.db.profile.DayOfTheDeadFare = false
									self.db.profile.DayOfTheDeadPets = false
									self.db.profile.DayOfTheDeadToys = false
									-- Micro-Holidays
									self.db.profile.MicroHolidaysAll = false
									self.db.profile.CallOfTheScarab = false
									self.db.profile.HatchingOfTheHippogryphs = false
									self.db.profile.UnGoroMadness = false
									self.db.profile.MarchOfTheTadpoles = false
									self.db.profile.GlowcapFestival = false
									self.db.profile.ThousandBoatBash = false
									self.db.profile.TavernCrawl = false
									-- Darkmoon Faire
									self.db.profile.DarkmoonAll = false
									self.db.profile.DarkmoonGuide = false
									self.db.profile.DarkmoonTokens = false
									self.db.profile.DarkmoonTickets = false
									self.db.profile.DarkmoonDaggermaw = false
									self.db.profile.DarkmoonItemsQ = false
									self.db.profile.DarkmoonAdventurer = false
									self.db.profile.FairegoersFeast = false
									self.db.profile.DarkmoonFirework = false
									self.db.profile.DarkmoonProfs = false
									self.db.profile.DarkmoonReagents = false
									self.db.profile.DarkmoonFishing = false
									self.db.profile.DarkmoonRecipes = false
									self.db.profile.DarkmoonArms = false
									self.db.profile.DarkmoonAttire = false
									self.db.profile.DarkmoonItemsV = false
									self.db.profile.DarkmoonMounts = false
									self.db.profile.DarkmoonPets = false
									self.db.profile.DarkmoonToys = false
									self.db.profile.DarkmoonFare = false
									self.db.profile.DarkmoonRewards = false
									self.db.profile.DarkmoonFortunes = false
									self.db.profile.PlayingCardsAll = false
									self.db.profile.PlayingCardsAlt = false
									self.db.profile.NemelexXobeh = false
									self.db.profile.VanillaCards = false
									self.db.profile.CrusadeCards = false
									self.db.profile.WrathCards = false
									self.db.profile.CataCards = false
									self.db.profile.PandaCards = false
									self.db.profile.DraenorCards = false
									self.db.profile.LegionCards = false
								end
								if val and self.db.profile.BrewOfTheMonthClub then
									self.db.profile.BrewOfTheMonth = true
									tableToFilter["BrewOfTheMonth"] = L['"Brew of the Month" Club']
								elseif val and not self.db.profile.BrewOfTheMonthClub then
									self.db.profile.BrewOfTheMonth = false
									tableToFilter["BrewOfTheMonth"] = L["Brewfest"]
								elseif not val and not self.db.profile.BrewOfTheMonthClub then
									self.db.profile.BrewOfTheMonth = false
									tableToFilter["BrewOfTheMonth"] = L["Brewfest"]
								end
								if val and self.db.profile.PlayingCardsAlt then
									self.db.profile.NemelexXobeh = true
									self.db.profile.VanillaCards = true
									self.db.profile.CrusadeCards = true
									self.db.profile.WrathCards = true
									self.db.profile.CataCards = true
									self.db.profile.PandaCards = true
									self.db.profile.DraenorCards = true
									self.db.profile.LegionCards = true
									tableToFilter["NemelexXobeh"] = L["Playing Cards"]
									tableToFilter["VanillaCards"] = L["Playing Cards"]
									tableToFilter["CrusadeCards"] = L["Playing Cards"]
									tableToFilter["WrathCards"] = L["Playing Cards"]
									tableToFilter["CataCards"] = L["Playing Cards"]
									tableToFilter["PandaCards"] = L["Playing Cards"]
									tableToFilter["DraenorCards"] = L["Playing Cards"]
									tableToFilter["LegionCards"] = L["Playing Cards"]
								elseif val and not self.db.profile.PlayingCardsAlt then
									self.db.profile.NemelexXobeh = false
									self.db.profile.VanillaCards = false
									self.db.profile.CrusadeCards = false
									self.db.profile.WrathCards = false
									self.db.profile.CataCards = false
									self.db.profile.PandaCards = false
									self.db.profile.DraenorCards = false
									self.db.profile.LegionCards = false
									tableToFilter["NemelexXobeh"] = L["Darkmoon Faire"]
									tableToFilter["VanillaCards"] = L["Darkmoon Faire"]
									tableToFilter["CrusadeCards"] = L["Darkmoon Faire"]
									tableToFilter["WrathCards"] = L["Darkmoon Faire"]
									tableToFilter["CataCards"] = L["Darkmoon Faire"]
									tableToFilter["PandaCards"] = L["Darkmoon Faire"]
									tableToFilter["DraenorCards"] = L["Darkmoon Faire"]
									tableToFilter["LegionCards"] = L["Darkmoon Faire"]
								elseif not val and not self.db.profile.PlayingCardsAlt then
									self.db.profile.NemelexXobeh = false
									self.db.profile.VanillaCards = false
									self.db.profile.CrusadeCards = false
									self.db.profile.WrathCards = false
									self.db.profile.CataCards = false
									self.db.profile.PandaCards = false
									self.db.profile.DraenorCards = false
									self.db.profile.LegionCards = false
									tableToFilter["NemelexXobeh"] = L["Darkmoon Faire"]
									tableToFilter["VanillaCards"] = L["Darkmoon Faire"]
									tableToFilter["CrusadeCards"] = L["Darkmoon Faire"]
									tableToFilter["WrathCards"] = L["Darkmoon Faire"]
									tableToFilter["CataCards"] = L["Darkmoon Faire"]
									tableToFilter["PandaCards"] = L["Darkmoon Faire"]
									tableToFilter["DraenorCards"] = L["Darkmoon Faire"]
									tableToFilter["LegionCards"] = L["Darkmoon Faire"]
								end	
								self.db.profile.HolidaysAll = val
								self:SendMessage('AdiBags_FiltersChanged', true)
							end,
						},
						DarkmoonAll = {
							name = L["Darkmoon Faire"],
							desc = L["Toggle all Darkmoon Faire filters."],
							type = 'toggle',
							width = 'normal',
							order = 3,
							set = function(info,val)
								if val then
									self.db.profile.DarkmoonGuide = true
									self.db.profile.DarkmoonTokens = true
									self.db.profile.DarkmoonTickets = true
									self.db.profile.DarkmoonDaggermaw = true
									self.db.profile.DarkmoonGuide = true
									self.db.profile.DarkmoonTokens = true
									self.db.profile.DarkmoonTickets = true
									self.db.profile.DarkmoonDaggermaw = true
									self.db.profile.DarkmoonItemsQ = true
									self.db.profile.DarkmoonAdventurer = true
									self.db.profile.FairegoersFeast = true
									self.db.profile.DarkmoonFirework = true
									self.db.profile.DarkmoonProfs = true
									self.db.profile.DarkmoonReagents = true
									self.db.profile.DarkmoonFishing = true
									self.db.profile.DarkmoonRecipes = true
									self.db.profile.DarkmoonArms = true
									self.db.profile.DarkmoonAttire = true
									self.db.profile.DarkmoonItemsV = true
									self.db.profile.DarkmoonMounts = true
									self.db.profile.DarkmoonPets = true
									self.db.profile.DarkmoonToys = true
									self.db.profile.DarkmoonFare = true
									self.db.profile.DarkmoonRewards = true
									self.db.profile.DarkmoonFortunes = true
									self.db.profile.PlayingCardsAll = true
									self.db.profile.PlayingCardsAlt = true
									self.db.profile.NemelexXobeh = true
									self.db.profile.VanillaCards = true
									self.db.profile.CrusadeCards = true
									self.db.profile.WrathCards = true
									self.db.profile.CataCards = true
									self.db.profile.PandaCards = true
									self.db.profile.DraenorCards = true
									self.db.profile.LegionCards = true
								elseif not val then
									self.db.profile.DarkmoonGuide = false
									self.db.profile.DarkmoonTokens = false
									self.db.profile.DarkmoonTickets = false
									self.db.profile.DarkmoonDaggermaw = false
									self.db.profile.DarkmoonGuide = false
									self.db.profile.DarkmoonTokens = false
									self.db.profile.DarkmoonTickets = false
									self.db.profile.DarkmoonDaggermaw = false
									self.db.profile.DarkmoonItemsQ = false
									self.db.profile.DarkmoonAdventurer = false
									self.db.profile.FairegoersFeast = false
									self.db.profile.DarkmoonFirework = false
									self.db.profile.DarkmoonProfs = false
									self.db.profile.DarkmoonReagents = false
									self.db.profile.DarkmoonFishing = false
									self.db.profile.DarkmoonRecipes = false
									self.db.profile.DarkmoonArms = false
									self.db.profile.DarkmoonAttire = false
									self.db.profile.DarkmoonItemsV = false
									self.db.profile.DarkmoonMounts = false
									self.db.profile.DarkmoonPets = false
									self.db.profile.DarkmoonToys = false
									self.db.profile.DarkmoonFare = false
									self.db.profile.DarkmoonRewards = false
									self.db.profile.DarkmoonFortunes = false
									self.db.profile.PlayingCardsAll = false
									self.db.profile.PlayingCardsAlt = false
									self.db.profile.NemelexXobeh = false
									self.db.profile.VanillaCards = false
									self.db.profile.CrusadeCards = false
									self.db.profile.WrathCards = false
									self.db.profile.CataCards = false
									self.db.profile.PandaCards = false
									self.db.profile.DraenorCards = false
									self.db.profile.LegionCards = false
								end
								if val and self.db.profile.PlayingCardsAlt then
									self.db.profile.NemelexXobeh = true
									self.db.profile.VanillaCards = true
									self.db.profile.CrusadeCards = true
									self.db.profile.WrathCards = true
									self.db.profile.CataCards = true
									self.db.profile.PandaCards = true
									self.db.profile.DraenorCards = true
									self.db.profile.LegionCards = true
									tableToFilter["NemelexXobeh"] = L["Playing Cards"]
									tableToFilter["VanillaCards"] = L["Playing Cards"]
									tableToFilter["CrusadeCards"] = L["Playing Cards"]
									tableToFilter["WrathCards"] = L["Playing Cards"]
									tableToFilter["CataCards"] = L["Playing Cards"]
									tableToFilter["PandaCards"] = L["Playing Cards"]
									tableToFilter["DraenorCards"] = L["Playing Cards"]
									tableToFilter["LegionCards"] = L["Playing Cards"]
								elseif val and not self.db.profile.PlayingCardsAlt then
									self.db.profile.NemelexXobeh = false
									self.db.profile.VanillaCards = false
									self.db.profile.CrusadeCards = false
									self.db.profile.WrathCards = false
									self.db.profile.CataCards = false
									self.db.profile.PandaCards = false
									self.db.profile.DraenorCards = false
									self.db.profile.LegionCards = false
									tableToFilter["NemelexXobeh"] = L["Darkmoon Faire"]
									tableToFilter["VanillaCards"] = L["Darkmoon Faire"]
									tableToFilter["CrusadeCards"] = L["Darkmoon Faire"]
									tableToFilter["WrathCards"] = L["Darkmoon Faire"]
									tableToFilter["CataCards"] = L["Darkmoon Faire"]
									tableToFilter["PandaCards"] = L["Darkmoon Faire"]
									tableToFilter["DraenorCards"] = L["Darkmoon Faire"]
									tableToFilter["LegionCards"] = L["Darkmoon Faire"]
								elseif not val and not self.db.profile.PlayingCardsAlt then
									self.db.profile.NemelexXobeh = false
									self.db.profile.VanillaCards = false
									self.db.profile.CrusadeCards = false
									self.db.profile.WrathCards = false
									self.db.profile.CataCards = false
									self.db.profile.PandaCards = false
									self.db.profile.DraenorCards = false
									self.db.profile.LegionCards = false
									tableToFilter["NemelexXobeh"] = L["Darkmoon Faire"]
									tableToFilter["VanillaCards"] = L["Darkmoon Faire"]
									tableToFilter["CrusadeCards"] = L["Darkmoon Faire"]
									tableToFilter["WrathCards"] = L["Darkmoon Faire"]
									tableToFilter["CataCards"] = L["Darkmoon Faire"]
									tableToFilter["PandaCards"] = L["Darkmoon Faire"]
									tableToFilter["DraenorCards"] = L["Darkmoon Faire"]
									tableToFilter["LegionCards"] = L["Darkmoon Faire"]
								end
								if not val and self.db.profile.MergeAllHolidays then
									tableToFilter["NemelexXobeh"] = L["Holidays"]
									tableToFilter["VanillaCards"] = L["Holidays"]
									tableToFilter["CrusadeCards"] = L["Holidays"]
									tableToFilter["WrathCards"] = L["Holidays"]
									tableToFilter["CataCards"] = L["Holidays"]
									tableToFilter["PandaCards"] = L["Holidays"]
									tableToFilter["DraenorCards"] = L["Holidays"]
									tableToFilter["LegionCards"] = L["Holidays"]
								end
								self.db.profile.DarkmoonAll = val
								self:SendMessage('AdiBags_FiltersChanged', true)
							end,
						},
						FestiveMug = {
							name = L["Festive Mug"],
							desc = L["Include your Festive Mug in your holiday filters."],
							type = 'toggle',
							width = 'normal',
							order = 4,
						},
					},
				},
				MergeGroup = {
					name = L["Merge..."],
					type = 'group',
					order = 2,
					inline = true,
					args = {
						MergeHolidays = {
							name = L["... Holidays"],
							desc = L["Combine all holiday filters under one header."],
							type = 'toggle',
							width = 'normal',
							order = 1,
							set = function(info,val)
								if val then
									tableToFilter["Noblegarden"] = L["Holidays"]
									tableToFilter["NoblegardenAttire"] = L["Holidays"]
									tableToFilter["NoblegardenMounts"] = L["Holidays"]
									tableToFilter["NoblegardenPets"] = L["Holidays"]
									tableToFilter["ChildrensWeek"] = L["Holidays"]
									tableToFilter["ChildrensWeekFare"] = L["Holidays"]
									tableToFilter["ChildrensWeekPets"] = L["Holidays"]
									tableToFilter["ChildrensWeekToys"] = L["Holidays"]
									tableToFilter["FireFestival"] = L["Holidays"]
									tableToFilter["FireFestivalSpecial"] = L["Holidays"]
									tableToFilter["FireFestivalArms"] = L["Holidays"]
									tableToFilter["FireFestivalAttire"] = L["Holidays"]
									tableToFilter["FireFestivalFare"] = L["Holidays"]
									tableToFilter["FireFestivalPets"] = L["Holidays"]
									tableToFilter["FireFestivalToys"] = L["Holidays"]
									tableToFilter["PiratesDay"] = L["Holidays"]
									tableToFilter["PiratesDayToys"] = L["Holidays"]
									tableToFilter["Brewfest"] = L["Holidays"]
									tableToFilter["BrewfestTokens"] = L["Holidays"]
									tableToFilter['"Brew of the Month" Club'] = L["Holidays"]
									tableToFilter["BrewOfTheMonth"] = L["Holidays"]
									tableToFilter["BrewfestFare"] = L["Holidays"]
									tableToFilter["StrangeBrew"] = L["Holidays"]
									tableToFilter["BrewfestBrew"] = L["Holidays"]
									tableToFilter["BrewfestAttire"] = L["Holidays"]
									tableToFilter["BrewfestHops"] = L["Holidays"]
									tableToFilter["BrewfestMounts"] = L["Holidays"]
									tableToFilter["BrewfestPets"] = L["Holidays"]
									tableToFilter["BrewfestToys"] = L["Holidays"]
									tableToFilter["DayOfTheDead"] = L["Holidays"]
									tableToFilter["DayOfTheDeadAttire"] = L["Holidays"]
									tableToFilter["DayOfTheDeadRecipes"] = L["Holidays"]
									tableToFilter["DayOfTheDeadFare"] = L["Holidays"]
									tableToFilter["DayOfTheDeadPets"] = L["Holidays"]
									tableToFilter["DayOfTheDeadToys"] = L["Holidays"]
								elseif not val then
									tableToFilter["Noblegarden"] = L["Noblegarden"]
									tableToFilter["NoblegardenAttire"] = L["Noblegarden"]
									tableToFilter["NoblegardenMounts"] = L["Noblegarden"]
									tableToFilter["NoblegardenPets"] = L["Noblegarden"]
									tableToFilter["ChildrensWeek"] = L["Children's Week"]
									tableToFilter["ChildrensWeekFare"] = L["Children's Week"]
									tableToFilter["ChildrensWeekPets"] = L["Children's Week"]
									tableToFilter["ChildrensWeekToys"] = L["Children's Week"]
									tableToFilter["FireFestival"] = L["Fire Festival"]
									tableToFilter["FireFestivalSpecial"] = L["Fire Festival"]
									tableToFilter["FireFestivalArms"] = L["Fire Festival"]
									tableToFilter["FireFestivalAttire"] = L["Fire Festival"]
									tableToFilter["FireFestivalFare"] = L["Fire Festival"]
									tableToFilter["FireFestivalPets"] = L["Fire Festival"]
									tableToFilter["FireFestivalToys"] = L["Fire Festival"]
									tableToFilter["PiratesDay"] = L["Pirates' Day"]
									tableToFilter["PiratesDayToys"] = L["Pirates' Day"]
									tableToFilter["Brewfest"] = L["Brewfest"]
									tableToFilter["BrewfestTokens"] = L["Brewfest"]
									tableToFilter['"Brew of the Month" Club'] = L['"Brew of the Month" Club']
									tableToFilter["BrewOfTheMonth"] = L["Brewfest"]
									tableToFilter["BrewfestFare"] = L["Brewfest"]
									tableToFilter["StrangeBrew"] = L["Brewfest"]
									tableToFilter["BrewfestBrew"] = L["Brewfest"]
									tableToFilter["BrewfestAttire"] = L["Brewfest"]
									tableToFilter["BrewfestHops"] = L["Brewfest"]
									tableToFilter["BrewfestMounts"] = L["Brewfest"]
									tableToFilter["BrewfestPets"] = L["Brewfest"]
									tableToFilter["BrewfestToys"] = L["Brewfest"]
									tableToFilter["DayOfTheDead"] = L["Day of the Dead"]
									tableToFilter["DayOfTheDeadAttire"] = L["Day of the Dead"]
									tableToFilter["DayOfTheDeadRecipes"] = L["Day of the Dead"]
									tableToFilter["DayOfTheDeadFare"] = L["Day of the Dead"]
									tableToFilter["DayOfTheDeadPets"] = L["Day of the Dead"]
									tableToFilter["DayOfTheDeadToys"] = L["Day of the Dead"]
								end
								if val and self.db.profile.BrewOfTheMonthClub then
									tableToFilter["BrewOfTheMonth"] = L['"Brew of the Month" Club']
								elseif not val and self.db.profile.BrewOfTheMonthClub then
									tableToFilter["BrewOfTheMonth"] = L['"Brew of the Month" Club']
								end
								self.db.profile.MergeHolidays = val
								self:SendMessage('AdiBags_FiltersChanged', true)
							end,
							disabled = function()
								return self.db.profile.MergeAllHolidays
							end,
						},
						MergeMicroHolidays = {
							name = L["... Micro-Holidays"],
							desc = L["Combine all micro-holiday filters under one header."],
							type = 'toggle',
							width = 'normal',
							order = 2,
							set = function(info,val)
								if val then
									tableToFilter["CallOfTheScarab"] = L["Micro-Holidays"]
									tableToFilter["HatchingOfTheHippogryphs"] = L["Micro-Holidays"]
									tableToFilter["UnGoroMadness"] = L["Micro-Holidays"]
									tableToFilter["MarchOfTheTadpoles"] = L["Micro-Holidays"]
									tableToFilter["GlowcapFestival"] = L["Micro-Holidays"]
									tableToFilter["ThousandBoatBash"] = L["Micro-Holidays"]
									tableToFilter["TavernCrawl"] = L["Micro-Holidays"]
								elseif not val then
									tableToFilter["CallOfTheScarab"] = L["Call of the Scarab"]
									tableToFilter["HatchingOfTheHippogryphs"] = L["Hatching of the Hippogryphs"]
									tableToFilter["UnGoroMadness"] = L["Un'Goro Madness"]
									tableToFilter["MarchOfTheTadpoles"] = L["March Of The Tadpoles"]
									tableToFilter["GlowcapFestival"] = L["Glowcap Festival"]
									tableToFilter["ThousandBoatBash"] = L["Thousand Boat Bash"]
									tableToFilter["TavernCrawl"] = L["Tavern Crawl"]
								end
								self.db.profile.MergeMicroHolidays = val
								self:SendMessage('AdiBags_FiltersChanged', true)
							end,
							disabled = function()
								return self.db.profile.MergeAllHolidays
							end,
						},
						MergeAllHolidays = {
							name = L["... Everything!"],
							desc = L["Combine all filters under a single heading."],
							type = 'toggle',
							width = 'normal',
							order = 3,
							set = function(info,val)
								if val then
									self.db.profile.MergeHolidays = true
									self.db.profile.MergeMicroHolidays = true
									tableToFilter["Noblegarden"] = L["Holidays"]
									tableToFilter["NoblegardenAttire"] = L["Holidays"]
									tableToFilter["NoblegardenMounts"] = L["Holidays"]
									tableToFilter["NoblegardenPets"] = L["Holidays"]
									tableToFilter["ChildrensWeek"] = L["Holidays"]
									tableToFilter["ChildrensWeekFare"] = L["Holidays"]
									tableToFilter["ChildrensWeekPets"] = L["Holidays"]
									tableToFilter["ChildrensWeekToys"] = L["Holidays"]
									tableToFilter["FireFestival"] = L["Holidays"]
									tableToFilter["FireFestivalSpecial"] = L["Holidays"]
									tableToFilter["FireFestivalArms"] = L["Holidays"]
									tableToFilter["FireFestivalAttire"] = L["Holidays"]
									tableToFilter["FireFestivalFare"] = L["Holidays"]
									tableToFilter["FireFestivalPets"] = L["Holidays"]
									tableToFilter["FireFestivalToys"] = L["Holidays"]
									tableToFilter["PiratesDay"] = L["Holidays"]
									tableToFilter["PiratesDayToys"] = L["Holidays"]
									tableToFilter["Brewfest"] = L["Holidays"]
									tableToFilter["BrewfestTokens"] = L["Holidays"]
									tableToFilter['"Brew of the Month" Club'] = L["Holidays"]
									tableToFilter["BrewOfTheMonth"] = L["Holidays"]
									tableToFilter["BrewfestAttire"] = L["Holidays"]
									tableToFilter["BrewfestFare"] = L["Holidays"]
									tableToFilter["StrangeBrew"] = L["Holidays"]
									tableToFilter["BrewfestBrew"] = L["Holidays"]
									tableToFilter["BrewfestHops"] = L["Holidays"]
									tableToFilter["BrewfestMounts"] = L["Holidays"]
									tableToFilter["BrewfestPets"] = L["Holidays"]
									tableToFilter["BrewfestToys"] = L["Holidays"]
									tableToFilter["DayOfTheDead"] = L["Holidays"]
									tableToFilter["DayOfTheDeadAttire"] = L["Holidays"]
									tableToFilter["DayOfTheDeadRecipes"] = L["Holidays"]
									tableToFilter["DayOfTheDeadFare"] = L["Holidays"]
									tableToFilter["DayOfTheDeadPets"] = L["Holidays"]
									tableToFilter["DayOfTheDeadToys"] = L["Holidays"]
									-- Micro-Holidays
									tableToFilter["CallOfTheScarab"] = L["Holidays"]
									tableToFilter["HatchingOfTheHippogryphs"] = L["Holidays"]
									tableToFilter["UnGoroMadness"] = L["Holidays"]
									tableToFilter["MarchOfTheTadpoles"] = L["Holidays"]
									tableToFilter["GlowcapFestival"] = L["Holidays"]
									tableToFilter["ThousandBoatBash"] = L["Holidays"]
									tableToFilter["TavernCrawl"] = L["Holidays"]
									-- Darkmoon Faire
									tableToFilter["Darkmoon Faire"] = L["Holidays"]
									tableToFilter["DarkmoonGuide"] = L["Holidays"]
									tableToFilter["DarkmoonTokens"] = L["Holidays"]
									tableToFilter["DarkmoonTickets"] = L["Holidays"]
									tableToFilter["DarkmoonDaggermaw"] = L["Holidays"]
									tableToFilter["DarkmoonItemsQ"] = L["Holidays"]
									tableToFilter["DarkmoonAdventurer"] = L["Holidays"]
									tableToFilter["FairegoersFeast"] = L["Holidays"]
									tableToFilter["DarkmoonFirework"] = L["Holidays"]
									tableToFilter["DarkmoonProfs"] = L["Holidays"]
									tableToFilter["DarkmoonReagents"] = L["Holidays"]
									tableToFilter["DarkmoonFishing"] = L["Holidays"]
									tableToFilter["DarkmoonRecipes"] = L["Holidays"]
									tableToFilter["DarkmoonArms"] = L["Holidays"]
									tableToFilter["DarkmoonAttire"] = L["Holidays"]
									tableToFilter["DarkmoonItemsV"] = L["Holidays"]
									tableToFilter["DarkmoonMounts"] = L["Holidays"]
									tableToFilter["DarkmoonPets"] = L["Holidays"]
									tableToFilter["DarkmoonToys"] = L["Holidays"]
									tableToFilter["DarkmoonFare"] = L["Holidays"]
									tableToFilter["DarkmoonRewards"] = L["Holidays"]
									tableToFilter["DarkmoonFortunes"] = L["Holidays"]
									-- Playing Cards
									tableToFilter["Playing Cards"] = L["Holidays"]
									tableToFilter["NemelexXobeh"] = L["Holidays"]
									tableToFilter["VanillaCards"] = L["Holidays"]
									tableToFilter["CrusadeCards"] = L["Holidays"]
									tableToFilter["WrathCards"] = L["Holidays"]
									tableToFilter["CataCards"] = L["Holidays"]
									tableToFilter["PandaCards"] = L["Holidays"]
									tableToFilter["DraenorCards"] = L["Holidays"]
									tableToFilter["LegionCards"] = L["Holidays"]
								elseif not val then
									self.db.profile.MergeHolidays = false
									self.db.profile.MergeMicroHolidays = false
									tableToFilter["Noblegarden"] = L["Noblegarden"]
									tableToFilter["NoblegardenAttire"] = L["Noblegarden"]
									tableToFilter["NoblegardenMounts"] = L["Noblegarden"]
									tableToFilter["NoblegardenPets"] = L["Noblegarden"]
									tableToFilter["ChildrensWeek"] = L["Children's Week"]
									tableToFilter["ChildrensWeekFare"] = L["Children's Week"]
									tableToFilter["ChildrensWeekPets"] = L["Children's Week"]
									tableToFilter["ChildrensWeekToys"] = L["Children's Week"]
									tableToFilter["FireFestival"] = L["Fire Festival"]
									tableToFilter["FireFestivalSpecial"] = L["Fire Festival"]
									tableToFilter["FireFestivalArms"] = L["Fire Festival"]
									tableToFilter["FireFestivalAttire"] = L["Fire Festival"]
									tableToFilter["FireFestivalFare"] = L["Fire Festival"]
									tableToFilter["FireFestivalPets"] = L["Fire Festival"]
									tableToFilter["FireFestivalToys"] = L["Fire Festival"]
									tableToFilter["PiratesDay"] = L["Pirates' Day"]
									tableToFilter["PiratesDayToys"] = L["Pirates' Day"]
									tableToFilter["Brewfest"] = L["Brewfest"]
									tableToFilter["BrewfestTokens"] = L["Brewfest"]
									tableToFilter["BrewOfTheMonth"] = L["Brewfest"]
									tableToFilter['"Brew of the Month" Club'] = L['"Brew of the Month" Club']
									tableToFilter["BrewfestFare"] = L["Brewfest"]
									tableToFilter["StrangeBrew"] = L["Brewfest"]
									tableToFilter["BrewfestBrew"] = L["Brewfest"]
									tableToFilter["BrewfestAttire"] = L["Brewfest"]
									tableToFilter["BrewfestHops"] = L["Brewfest"]
									tableToFilter["BrewfestMounts"] = L["Brewfest"]
									tableToFilter["BrewfestPets"] = L["Brewfest"]
									tableToFilter["BrewfestToys"] = L["Brewfest"]
									tableToFilter["DayOfTheDead"] = L["Day of the Dead"]
									tableToFilter["DayOfTheDeadAttire"] = L["Day of the Dead"]
									tableToFilter["DayOfTheDeadRecipes"] = L["Day of the Dead"]
									tableToFilter["DayOfTheDeadFare"] = L["Day of the Dead"]
									tableToFilter["DayOfTheDeadPets"] = L["Day of the Dead"]
									tableToFilter["DayOfTheDeadToys"] = L["Day of the Dead"]
									-- Micro-Holidays
									tableToFilter["CallOfTheScarab"] = L["Call of the Scarab"]
									tableToFilter["HatchingOfTheHippogryphs"] = L["Hatching of the Hippogryphs"]
									tableToFilter["UnGoroMadness"] = L["Un'Goro Madness"]
									tableToFilter["MarchOfTheTadpoles"] = L["March Of The Tadpoles"]
									tableToFilter["GlowcapFestival"] = L["Glowcap Festival"]
									tableToFilter["ThousandBoatBash"] = L["Thousand Boat Bash"]
									tableToFilter["TavernCrawl"] = L["Tavern Crawl"]
									-- Darkmoon Faire
									tableToFilter["Darkmoon Faire"] = L["Darkmoon Faire"]
									tableToFilter["DarkmoonGuide"] = L["Darkmoon Faire"]
									tableToFilter["DarkmoonTokens"] = L["Darkmoon Faire"]
									tableToFilter["DarkmoonTickets"] = L["Darkmoon Faire"]
									tableToFilter["DarkmoonDaggermaw"] = L["Darkmoon Faire"]
									tableToFilter["DarkmoonItemsQ"] = L["Darkmoon Faire"]
									tableToFilter["DarkmoonAdventurer"] = L["Darkmoon Faire"]
									tableToFilter["FairegoersFeast"] = L["Darkmoon Faire"]
									tableToFilter["DarkmoonFirework"] = L["Darkmoon Faire"]
									tableToFilter["DarkmoonProfs"] = L["Darkmoon Faire"]
									tableToFilter["DarkmoonReagents"] = L["Darkmoon Faire"]
									tableToFilter["DarkmoonFishing"] = L["Darkmoon Faire"]
									tableToFilter["DarkmoonRecipes"] = L["Darkmoon Faire"]
									tableToFilter["DarkmoonArms"] = L["Darkmoon Faire"]
									tableToFilter["DarkmoonAttire"] = L["Darkmoon Faire"]
									tableToFilter["DarkmoonItemsV"] = L["Darkmoon Faire"]
									tableToFilter["DarkmoonMounts"] = L["Darkmoon Faire"]
									tableToFilter["DarkmoonPets"] = L["Darkmoon Faire"]
									tableToFilter["DarkmoonToys"] = L["Darkmoon Faire"]
									tableToFilter["DarkmoonFare"] = L["Darkmoon Faire"]
									tableToFilter["DarkmoonRewards"] = L["Darkmoon Faire"]
									tableToFilter["DarkmoonFortunes"] = L["Darkmoon Faire"]
									-- Playing Cards
									tableToFilter["Playing Cards"] = L["Playing Cards"]
									tableToFilter["NemelexXobeh"] = L["Darkmoon Faire"]
									tableToFilter["VanillaCards"] = L["Darkmoon Faire"]
									tableToFilter["CrusadeCards"] = L["Darkmoon Faire"]
									tableToFilter["WrathCards"] = L["Darkmoon Faire"]
									tableToFilter["CataCards"] = L["Darkmoon Faire"]
									tableToFilter["PandaCards"] = L["Darkmoon Faire"]
									tableToFilter["DraenorCards"] = L["Darkmoon Faire"]
									tableToFilter["LegionCards"] = L["Darkmoon Faire"]
								end
								if val and self.db.profile.BrewOfTheMonthClub then
									tableToFilter["BrewOfTheMonth"] = L["Holidays"]
								elseif not val and self.db.profile.BrewOfTheMonthClub then
									tableToFilter["BrewOfTheMonth"] = L['"Brew of the Month" Club']
								end
								if val and self.db.profile.PlayingCardsAlt then
									tableToFilter["NemelexXobeh"] = L["Holidays"]
									tableToFilter["VanillaCards"] = L["Holidays"]
									tableToFilter["CrusadeCards"] = L["Holidays"]
									tableToFilter["WrathCards"] = L["Holidays"]
									tableToFilter["CataCards"] = L["Holidays"]
									tableToFilter["PandaCards"] = L["Holidays"]
									tableToFilter["DraenorCards"] = L["Holidays"]
									tableToFilter["LegionCards"] = L["Holidays"]
								elseif not val and self.db.profile.PlayingCardsAlt then
									tableToFilter["NemelexXobeh"] = L["Playing Cards"]
									tableToFilter["VanillaCards"] = L["Playing Cards"]
									tableToFilter["CrusadeCards"] = L["Playing Cards"]
									tableToFilter["WrathCards"] = L["Playing Cards"]
									tableToFilter["CataCards"] = L["Playing Cards"]
									tableToFilter["PandaCards"] = L["Playing Cards"]
									tableToFilter["DraenorCards"] = L["Playing Cards"]
									tableToFilter["LegionCards"] = L["Playing Cards"]
								end
								self.db.profile.MergeAllHolidays = val
								self:SendMessage('AdiBags_FiltersChanged', true)
							end,
						},
					},
				},
			},
		},
		HolidaysPane = {
			name = L["Holidays"],
			desc = L["Provides filters for holidays and micro-holidays."],
			type = 'group',
			order = 11,
			inline = false,
			args = {
				header = {
					name = L["AdiBags - Revelry! v0.9k - Holidays"],
					type = 'header',
					order = 1,
				},
				_desc = {
					name = L["Configure your filters in more detail below.\n\n|cffff7700Remember, any toggled 'Merge' settings will override holiday names.\n|r"],
					type = 'description',
					order = 2,
				},
				NoblegardenGroup = {
					name = L["Noblegarden"],
					type = 'group',
					order = 10,
					inline = true,
					args = {
						NoblegardenAll = {
							name = L["Select All"],
							desc = L["Toggle all filters for this holiday."],
							type = 'toggle',
							width = 'full',
							order = 2,
							set = function(info,val)
								if val then
									self.db.profile.Noblegarden = true
									self.db.profile.NoblegardenAttire = true
									self.db.profile.NoblegardenMounts = true
									self.db.profile.NoblegardenPets = true
								elseif not val then
									self.db.profile.Noblegarden = false
									self.db.profile.NoblegardenAttire = false
									self.db.profile.NoblegardenMounts = false
									self.db.profile.NoblegardenPets = false
								end
								self.db.profile.NoblegardenAll = val
								self:SendMessage('AdiBags_FiltersChanged', true)
							end,
						},
						header = {
							name = L[""],
							type = 'header',
							order = 3,
						},
						Noblegarden = {
							name = L["Items"],
							desc = L["Filter items and equipment for this holiday."],
							type = 'toggle',
							width = 'normal',
							order = 4,
						},
						NoblegardenAttire = {
							name = L["Attire"],
							desc = L["Include filters for clothing and cosmetic attire unique to this holiday."],
							type = 'toggle',
							width = 'normal',
							order = 5,
						},
						NoblegardenMounts = {
							name = L["Mounts"],
							desc = L["Include filters for mounts."],
							type = 'toggle',
							width = 'normal',
							order = 6,
						},
						NoblegardenPets = {
							name = L["Pets"],
							desc = L["Include filters for pets."],
							type = 'toggle',
							width = 'normal',
							order = 7,
						},
					},
				},
				ChildrensWeekGroup = {
					name = L["Children's Week"],
					type = 'group',
					order = 11,
					inline = true,
					args = {
						ChildrensWeekAll = {
							name = L["Select All"],
							desc = L["Toggle all filters for this holiday."],
							type = 'toggle',
							width = 'normal',
							order = 1,
							set = function(info,val)
								if val then
									self.db.profile.ChildrensWeek = true
									self.db.profile.ChildrensWeekFare = true
									self.db.profile.ChildrensWeekPets = true
									self.db.profile.ChildrensWeekToys = true
								elseif not val then
									self.db.profile.ChildrensWeek = false
									self.db.profile.ChildrensWeekFare = false
									self.db.profile.ChildrensWeekPets = false
									self.db.profile.ChildrensWeekToys = false
								end
								self.db.profile.ChildrensWeekAll = val
								self:SendMessage('AdiBags_FiltersChanged', true)
							end,
						},
						header = {
							name = L[""],
							type = 'header',
							order = 2,
						},
						ChildrensWeek = {
							name = L["Items"],
							desc = L["Filter items and equipment for this holiday."],
							type = 'toggle',
							width = 'normal',
							order = 3,
						},
						ChildrensWeekFare = {
							name = L["Food & Drink"],
							desc = L["Include items needed to complete:\n• |cffffff00Bad Example|r"],
							type = 'toggle',
							width = 'normal',
							order = 4,
						},
						ChildrensWeekPets = {
							name = L["Pets"],
							desc = L["Include filters for pets."],
							type = 'toggle',
							width = 'normal',
							order = 5,
						},
						ChildrensWeekToys = {
							name = L["Toys"],
							desc = L["Include filters for toys."],
							type = 'toggle',
							width = 'normal',
							order = 6,
						},
					},
				},
				FireFestivalGroup = {
					name = L["Midsummer Fire Festival"],
					type = 'group',
					order = 12,
					inline = true,
					args = {
						FireFestivalAll = {
							name = L["Select All"],
							desc = L["Toggle all filters for this holiday."],
							type = 'toggle',
							width = 'normal',
							order = 1,
							set = function(info,val)
								if val then
									self.db.profile.FireFestivalSpecial = true
									self.db.profile.FireFestival = true
									self.db.profile.FireFestivalArms = true
									self.db.profile.FireFestivalAttire = true
									self.db.profile.FireFestivalFare = true
									self.db.profile.FireFestivalPets = true
									self.db.profile.FireFestivalToys = true
								elseif not val then
									self.db.profile.FireFestivalSpecial = false
									self.db.profile.FireFestival = false
									self.db.profile.FireFestivalArms = false
									self.db.profile.FireFestivalAttire = false
									self.db.profile.FireFestivalFare = false
									self.db.profile.FireFestivalPets = false
									self.db.profile.FireFestivalToys = false
								end
								self.db.profile.FireFestivalAll = val
								self:SendMessage('AdiBags_FiltersChanged', true)
							end,
						},
						FireFestivalSpecial = {
							name = L["Bag of Smorc Ingredients"],
							desc = L["Include |cffc79c6eBag of Smorc Ingredients|r in your Fire Festival filters."],
							type = 'toggle',
							width = 'double',
							order = 2,
						},
						header = {
							name = L[""],
							type = 'header',
							order = 3,
						},
						FireFestival = {
							name = L["Items"],
							desc = L["Filter items and equipment for this holiday."],
							type = 'toggle',
							width = 'normal',
							order = 4,
						},
						FireFestivalArms = {
							name = L["Arms"],
							desc = L["Include filters for weapons and cosmetic accoutrements unique to this holiday."],
							type = 'toggle',
							width = 'normal',
							order = 5,
						},
						FireFestivalAttire = {
							name = L["Attire"],
							desc = L["Include filters for clothing and cosmetic attire unique to this holiday."],
							type = 'toggle',
							width = 'normal',
							order = 6,
						},
						FireFestivalFare = {
							name = L["Food & Drink"],
							desc = L["Include filters for holiday fare."],
							type = 'toggle',
							width = 'normal',
							order = 7,
						},
						FireFestivalPets = {
							name = L["Pets"],
							desc = L["Include filters for pets."],
							type = 'toggle',
							width = 'normal',
							order = 8,
						},
						FireFestivalToys = {
							name = L["Toys"],
							desc = L["Include filters for toys."],
							type = 'toggle',
							width = 'normal',
							order = 9,
						},
					},
				},
				PiratesDayGroup = {
					name = L["Pirates' Day"],
					type = 'group',
					order = 13,
					inline = true,
					args = {
						header = {
							name = L[""],
							type = 'header',
							order = 2,
						},
						PiratesDayAll = {
							name = L["Select All"],
							desc = L["Toggle all filters for this holiday."],
							type = 'toggle',
							width = 'full',
							order = 1,
							set = function(info,val)
								if val then
									self.db.profile.PiratesDay = true
									self.db.profile.PiratesDayToys = true
								elseif not val then
									self.db.profile.PiratesDay = false
									self.db.profile.PiratesDayToys = false
								end
								self.db.profile.PiratesDayAll = val
								self:SendMessage('AdiBags_FiltersChanged', true)
							end,
						},
						PiratesDay = {
							name = L["Items"],
							desc = L["Filter items and equipment for this holiday."],
							type = 'toggle',
							width = 'normal',
							order = 3,
						},
						PiratesDayToys = {
							name = L["Toys"],
							desc = L["Include filters for toys."],
							type = 'toggle',
							width = 'normal',
							order = 4,
						},
					},
				},
				BrewfestGroup = {
					name = L["Brewfest"],
					type = 'group',
					order = 14,
					inline = true,
					args = {
						header = {
							name = L[""],
							type = 'header',
							order = 4,
						},
						BrewfestAll = {
							name = L["Select All"],
							desc = L["Toggle all filters for this holiday."],
							type = 'toggle',
							width = 'full',
							order = 1,
							set = function(info,val)
								if val then
									self.db.profile.Brewfest = true
									self.db.profile.BrewfestTokens = true
									self.db.profile.BrewOfTheMonthClub = true
									self.db.profile.BrewOfTheMonth = true
									self.db.profile.BrewfestAttire = true
									self.db.profile.BrewfestFare = true
									self.db.profile.StrangeBrew = true
									self.db.profile.BrewfestBrew = true
									self.db.profile.BrewfestHops = true
									self.db.profile.BrewfestMounts = true
									self.db.profile.BrewfestPets = true
									self.db.profile.BrewfestToys = true
								elseif not val then
									self.db.profile.Brewfest = false
									self.db.profile.BrewfestTokens = false
									self.db.profile.BrewOfTheMonthClub = false
									self.db.profile.BrewOfTheMonth = false
									self.db.profile.BrewfestAttire = false
									self.db.profile.BrewfestFare = false
									self.db.profile.StrangeBrew = false
									self.db.profile.BrewfestBrew = false
									self.db.profile.BrewfestHops = false
									self.db.profile.BrewfestMounts = false
									self.db.profile.BrewfestPets = false
									self.db.profile.BrewfestToys = false
								end
								if val and self.db.profile.BrewOfTheMonthClub then
									self.db.profile.BrewOfTheMonth = true
									tableToFilter["BrewOfTheMonth"] = L['"Brew of the Month" Club']
								elseif val and not self.db.profile.BrewOfTheMonthClub then
									self.db.profile.BrewOfTheMonth = false
									tableToFilter["BrewOfTheMonth"] = L["Brewfest"]
								elseif not val and not self.db.profile.BrewOfTheMonthClub then
									self.db.profile.BrewOfTheMonth = false
									tableToFilter["BrewOfTheMonth"] = L["Brewfest"]
								end
								if val and self.db.profile.MergeAllHolidays then
									self.db.profile.BrewOfTheMonth = true
									tableToFilter["BrewOfTheMonth"] = L["Holidays"]
								elseif not val and self.db.profile.MergeAllHolidays then
									tableToFilter["BrewOfTheMonth"] = L["Holidays"]
								end
								self.db.profile.BrewfestAll = val
								self:SendMessage('AdiBags_FiltersChanged', true)
							end,
						},
						BrewOfTheMonthClub = {
							name = L['"Brew of the Month" Club'],
							desc = L['If this is toggled, items for the |cff4d85e6"Brew of the Month" Club|r will be sorted into their own section.'],
							type = 'toggle',
							width = 'double',
							order = 2,
							set = function(info,val)
								if val then
									self.db.profile.BrewOfTheMonth = true
									tableToFilter["BrewOfTheMonth"] = L['"Brew of the Month" Club']
								elseif self.db.profile.BrewfestAll then
									self.db.profile.BrewOfTheMonth = true
									tableToFilter["BrewOfTheMonth"] = L["Brewfest"]
								elseif not val and not self.db.profile.BrewfestAll then
									self.db.profile.BrewOfTheMonth = false
									tableToFilter["BrewOfTheMonth"] = L["Brewfest"]
								end
								if val and self.db.profile.MergeAllHolidays then
									self.db.profile.BrewOfTheMonth = true
									tableToFilter["BrewOfTheMonth"] = L["Holidays"]
								elseif not val and self.db.profile.MergeAllHolidays then
									tableToFilter["BrewOfTheMonth"] = L["Holidays"]
								elseif not val and self.db.profile.MergeHolidays then
									tableToFilter["BrewOfTheMonth"] = L["Holidays"]
								end
								self.db.profile.BrewOfTheMonthClub = val
								self:SendMessage('AdiBags_FiltersChanged', true)
							end,
						},
						BrewfestTokens = {
							name = L["Tokens"],
							desc = L["Include tokens used to purchase unique items and equipment during Brewfest."],
							type = 'toggle',
							width = 'normal',
							order = 3,
						},
						BrewOfTheMonth = {
							name = L["Brew of the Month"],
							desc = L['Filter items and brews for the |cff4d85e6"Brew of the Month" Club|r.'],
							type = 'toggle',
							width = 'normal',
							order = 5,
							set = function(info,val)
								if val and self.db.profile.MergeHolidays then
									tableToFilter["BrewOfTheMonth"] = L["Holidays"]
								elseif val and self.db.profile.MergeAllHolidays then
									tableToFilter["BrewOfTheMonth"] = L["Holidays"]
								end
								self.db.profile.BrewOfTheMonth = val
								self:SendMessage('AdiBags_FiltersChanged', true)
							end,
							disabled = function()
								return self.db.profile.BrewOfTheMonthClub
							end,
						},
						BrewfestAttire = {
							name = L["Attire"],
							desc = L["Include filters for clothing and cosmetic attire unique to this holiday."],
							type = 'toggle',
							width = 'normal',
							order = 6,
						},
						BrewfestFare = {
							name = L["Food & Drink"],
							desc = L["Include items needed to complete:\n• |cffffff00The Brewfest Diet|r"],
							type = 'toggle',
							width = 'normal',
							order = 7,
						},
						StrangeBrew = {
							name = L["Strange Brew"],
							desc = L["Include items needed to complete:\n• |cffffff00Strange Brew|r"],
							type = 'toggle',
							width = 'normal',
							order = 8,
						},
						BrewfestBrew = {
							name = L["Brews"],
							desc = L["Include filters for special Brewfest beverages."],
							type = 'toggle',
							width = 'normal',
							order = 9,
						},
						BrewfestHops = {
							name = L["Hops"],
							desc = L["Include any Brewfest Hops in your filters."],
							type = 'toggle',
							width = 'normal',
							order = 10,
						},
						BrewfestMounts = {
							name = L["Mounts"],
							desc = L["Include filters for mounts."],
							type = 'toggle',
							width = 'normal',
							order = 11,
						},
						BrewfestPets = {
							name = L["Pets"],
							desc = L["Include filters for pets."],
							type = 'toggle',
							width = 'normal',
							order = 12,
						},
						BrewfestToys = {
							name = L["Toys"],
							desc = L["Include filters for toys."],
							type = 'toggle',
							width = 'normal',
							order = 13,
						},
					},
				},
				DayOfTheDeadGroup = {
					name = L["Day of the Dead"],
					type = 'group',
					order = 17,
					inline = true,
					args = {
						header = {
							name = L[""],
							type = 'header',
							order = 2,
						},
						DayOfTheDeadAll = {
							name = L["Select All"],
							desc = L["Toggle all filters for this holiday."],
							type = 'toggle',
							width = 'full',
							order = 1,
							set = function(info,val)
								if val then
									self.db.profile.DayOfTheDead = true
									self.db.profile.DayOfTheDeadAttire = true
									self.db.profile.DayOfTheDeadRecipes = true
									self.db.profile.DayOfTheDeadFare = true
									self.db.profile.DayOfTheDeadPets = true
									self.db.profile.DayOfTheDeadToys = true
								elseif not val then
									self.db.profile.DayOfTheDead = false
									self.db.profile.DayOfTheDeadAttire = false
									self.db.profile.DayOfTheDeadRecipes = false
									self.db.profile.DayOfTheDeadFare = false
									self.db.profile.DayOfTheDeadPets = false
									self.db.profile.DayOfTheDeadToys = false
								end
								self.db.profile.DayOfTheDeadAll = val
								self:SendMessage('AdiBags_FiltersChanged', true)
							end,
						},
						DayOfTheDeadAttire = {
							name = L["Attire"],
							desc = L["Include filters for clothing and cosmetic attire unique to this holiday."],
							type = 'toggle',
							width = 'normal',
							order = 3,
						},
						DayOfTheDeadRecipes = {
							name = L["Recipes"],
							desc = L["Include filters for recipes."],
							type = 'toggle',
							width = 'normal',
							order = 4,
						},
						DayOfTheDeadFare = {
							name = L["Food & Drink"],
							desc = L["Include filters for holiday fare."],
							type = 'toggle',
							width = 'normal',
							order = 5,
						},
						DayOfTheDeadPets = {
							name = L["Pets"],
							desc = L["Include filters for pets."],
							type = 'toggle',
							width = 'normal',
							order = 6,
						},
						DayOfTheDeadToys = {
							name = L["Toys"],
							desc = L["Include filters for toys."],
							type = 'toggle',
							width = 'normal',
							order = 7,
						},
					},
				},
				MicroHolidaysGroup = {
					name = L["Micro-Holidays"],
					type = 'group',
					order = 50,
					inline = true,
					args = {
						header = {
							name = L[""],
							type = 'header',
							order = 2,
						},
						MicroHolidaysAll = {
							name = L["Select All"],
							desc = L["Toggle all micro-holiday filters."],
							type = 'toggle',
							width = 'full',
							order = 1,
							set = function(info,val)
								if val then
									self.db.profile.CallOfTheScarab = true
									self.db.profile.HatchingOfTheHippogryphs = true
									self.db.profile.UnGoroMadness = true
									self.db.profile.MarchOfTheTadpoles = true
									self.db.profile.GlowcapFestival = true
									self.db.profile.ThousandBoatBash = true
									self.db.profile.TavernCrawl = true
								elseif not val then
									self.db.profile.CallOfTheScarab = false
									self.db.profile.HatchingOfTheHippogryphs = false
									self.db.profile.UnGoroMadness = false
									self.db.profile.MarchOfTheTadpoles = false
									self.db.profile.GlowcapFestival = false
									self.db.profile.ThousandBoatBash = false
									self.db.profile.TavernCrawl = false
								end
								self.db.profile.MicroHolidaysAll = val
								self:SendMessage('AdiBags_FiltersChanged', true)
							end,
						},
						CallOfTheScarab = {
							name = L["Call of the Scarab"],
							desc = L["Filter items and equipment for this micro-holiday."],
							type = 'toggle',
							width = 'normal',
							order = 3,
						},
						HatchingOfTheHippogryphs = {
							name = L["Hatching of the Hippogryphs"],
							desc = L["Filter items and equipment for this micro-holiday."],
							type = 'toggle',
							width = 'double',
							order = 4,
						},
						UnGoroMadness = {
							name = L["Un'Goro Madness"],
							desc = L["Filter items and equipment for this micro-holiday."],
							type = 'toggle',
							width = 'normal',
							order = 5,
						},
						MarchOfTheTadpoles = {
							name = L["March of the Tadpoles"],
							desc = L["Filter items and equipment for this micro-holiday."],
							type = 'toggle',
							width = 'normal',
							order = 6,
						},
						GlowcapFestival = {
							name = L["Glowcap Festival"],
							desc = L["Filter items and equipment for this micro-holiday."],
							type = 'toggle',
							width = 'normal',
							order = 7,
						},
						ThousandBoatBash = {
							name = L["Thousand Boat Bash"],
							desc = L["Filter items and equipment for this micro-holiday."],
							type = 'toggle',
							width = 'normal',
							order = 8,
						},
						TavernCrawl = {
							name = L["Kirin Tor Tavern Crawl"],
							desc = L["Filter items and equipment for this micro-holiday."],
							type = 'toggle',
							width = 'normal',
							order = 9,
						},
					},
				},
			},
		},
		DarkmoonPane = {
			name = L["Darkmoon Faire"],
			desc = L["Provides filters for the Darkmoon Faire."],
			type = 'group',
			order = 12,
			inline = false,
			args = {
				header = {
					name = L["AdiBags - Revelry! v0.9k - Darkmoon Faire"],
					type = 'header',
					order = 1,
				},
				_desc = {
					name = L["Configure your filters in more detail below.\n\n|cffff7700If toggled, Darkmoon Faire items will be grouped into their own separate section (otherwise they will be merged or ignored, depending upon your other selections).\n|r"],
					type = 'description',
					order = 2,
				},
				DarkmoonGroup = {
					name = L["Key Items"],
					type = 'group',
					order = 3,
					inline = true,
					args = {
						DarkmoonGuide = {
							name = L["Adventurer's Guide"],
							desc = L["Include the |cffe2a6caDarkmoon Adventurer's Guide|r."],
							type = 'toggle',
							width = 'normal',
							order = 1,
						},
						DarkmoonTokens = {
							name = L["Game Tokens"],
							desc = L["Include tokens for games at the Darkmoon Faire."],
							type = 'toggle',
							width = 'normal',
							order = 2,
						},
						DarkmoonTickets = {
							name = L["Ride Tickets"],
							desc = L["Include tickets for rides at the Darkmoon Faire."],
							type = 'toggle',
							width = 'normal',
							order = 3,
						},
						DarkmoonDaggermaw = {
							name = L["Daggermaw"],
							desc = L["Include Darkmoon Daggermaw."],
							type = 'toggle',
							width = 'normal',
							order = 4,
						},
						DarkmoonItemsQ = {
							name = L["Quest Items"],
							desc = L["Include items needed to complete important quests at the Darkmoon Faire."],
							type = 'toggle',
							width = 'normal',
							order = 5,
						},
					},
				},
				DarkmoonAchieveGroup = {
					name = L["Achievements"],
					type = 'group',
					order = 4,
					inline = true,
					args = {
						DarkmoonAdventurer = {
							name = L["Darkmoon Adventurer"],
							desc = L["Include items needed to complete:\n• |cffffff00Darkmoon Defender|r\n• |cffffff00Darkmoon Dungeoneer|r\n• |cffffff00Darkmoon Despoiler|r"],
							type = 'toggle',
							width = 'double',
							order = 1,
						},
						FairegoersFeast = {
							name = L["Fairegoer's Feast"],
							desc = L["Include items needed to complete:\n• |cffffff00Fairegoer's Feast|r"],
							type = 'toggle',
							width = 'normal',
							order = 2,
						},
						DarkmoonFirework = {
							name = L["Taking the Show on the Road"],
							desc = L["Include items needed to complete:\n• |cffffff00Taking the Show on the Road|r"],
							type = 'toggle',
							width = 'double',
							order = 3,
						},
					},
				},
				DarkmoonProfsGroup = {
					name = L["Professions"],
					type = 'group',
					order = 5,
					inline = true,
					args = {
						DarkmoonProfs = {
							name = L["Faire Favors"],
							desc = L["Include items used for profession-based quests at the Darkmoon Faire."],
							type = 'toggle',
							width = 'normal',
							order = 1,
						},
						DarkmoonReagents = {
							name = L["Craft Goods"],
							desc = L["Include reagents like Coarse Thread or Simple Flour, which are needed for profession-based quests at the Darkmoon Faire."],
							type = 'toggle',
							width = 'normal',
							order = 2,
						},
						DarkmoonFishing = {
							name = L["Fishing"],
							desc = L["Include crates and containers that can be fished from the waters around Darkmoon Island."],
							type = 'toggle',
							width = 'normal',
							order = 3,
						},
						DarkmoonRecipes = {
							name = L["Recipes"],
							desc = L["Include filters for recipes."],
							type = 'toggle',
							width = 'normal',
							order = 4,
						},
					},
				},
				DarkmoonGearGroup = {
					name = L["Gear"],
					type = 'group',
					order = 6,
					inline = true,
					args = {
						DarkmoonArms = {
							name = L["Arms"],
							desc = L["Include weapons and cosmetic accoutrements found at the Darkmoon Faire."],
							type = 'toggle',
							width = 'normal',
							order = 1,
						},
						DarkmoonAttire = {
							name = L["Attire"],
							desc = L["Include clothing and cosmetic attire found at the Darkmoon Faire."],
							type = 'toggle',
							width = 'normal',
							order = 2,
						},
						DarkmoonItemsV = {
							name = L["Vanity Items"],
							desc = L["Include vanity items that can be purchased or won at the Darkmoon Faire."],
							type = 'toggle',
							width = 'normal',
							order = 3,
						},
					},
				},
				DarkmoonCollectGroup = {
					name = L["Collections"],
					type = 'group',
					order = 7,
					inline = true,
					args = {
						DarkmoonMounts = {
							name = L["Mounts"],
							desc = L["Include mounts that can be found on Darkmoon Island."],
							type = 'toggle',
							width = 'normal',
							order = 1,
						},
						DarkmoonPets = {
							name = L["Pets"],
							desc = L["Include pets found on or around Darkmoon Island."],
							type = 'toggle',
							width = 'normal',
							order = 2,
						},
						DarkmoonToys = {
							name = L["Toys"],
							desc = L["Include toys found on or around Darkmoon Island."],
							type = 'toggle',
							width = 'normal',
							order = 3,
						},
					},
				},
				DarkmoonMiscGroup = {
					name = L["Miscellaneous"],
					type = 'group',
					order = 8,
					inline = true,
					args = {
						DarkmoonFare = {
							name = L["Food & Drink"],
							desc = L["Include filters for holiday fare."],
							type = 'toggle',
							width = 'normal',
							order = 1,
						},
						DarkmoonRewards = {
							name = L["Prizes"],
							desc = L["Include prize containers that can be won at the Darkmoon Faire."],
							type = 'toggle',
							width = 'normal',
							order = 2,
						},
						DarkmoonFortunes = {
							name = L["Fortunes"],
							desc = L["Include Sayge's fortunes in your Darkmoon Faire filters."],
							type = 'toggle',
							width = 'normal',
							order = 3,
						},
					},
				},
				PlayingCardsMain = {
					name = L[""],
					type = 'group',
					order = 9,
					inline = true,
					args = {
						header = {
							name = L["Darkmoon Faire - Playing Cards"],
							type = 'header',
							order = 1,
						},
						_desc = {
							name = L["Completed decks from all expansions, except Warlords, can be turned in to |cffcc9900Professor Thaddeus Paleo|r at the Darkmoon Faire. Additionally, |cffc942fdLast Deck of Nemelex Xobeh|r has been included in this section for aesthetic purposes.\n"],
							type = 'description',
							order = 2,
						},
						PlayingCardsGroup = {
							name = L["Decks"],
							type = 'group',
							order = 3,
							inline = true,
							args = {
								PlayingCardsAll = {
									name = L["Select All"],
									desc = L["Toggle all decks."],
									type = 'toggle',
									width = 'normal',
									order = 1,
									set = function(info,val)
										if val then
											self.db.profile.PlayingCardsAlt = true
											self.db.profile.NemelexXobeh = true
											self.db.profile.VanillaCards = true
											self.db.profile.CrusadeCards = true
											self.db.profile.WrathCards = true
											self.db.profile.CataCards = true
											self.db.profile.PandaCards = true
											self.db.profile.DraenorCards = true
											self.db.profile.LegionCards = true
										elseif not val then
											self.db.profile.PlayingCardsAlt = false
											self.db.profile.NemelexXobeh = false
											self.db.profile.VanillaCards = false
											self.db.profile.CrusadeCards = false
											self.db.profile.WrathCards = false
											self.db.profile.CataCards = false
											self.db.profile.PandaCards = false
											self.db.profile.DraenorCards = false
											self.db.profile.LegionCards = false
										end
										if val and self.db.profile.PlayingCardsAlt then
											self.db.profile.NemelexXobeh = true
											self.db.profile.VanillaCards = true
											self.db.profile.CrusadeCards = true
											self.db.profile.WrathCards = true
											self.db.profile.CataCards = true
											self.db.profile.PandaCards = true
											self.db.profile.DraenorCards = true
											self.db.profile.LegionCards = true
											tableToFilter["NemelexXobeh"] = L["Playing Cards"]
											tableToFilter["VanillaCards"] = L["Playing Cards"]
											tableToFilter["CrusadeCards"] = L["Playing Cards"]
											tableToFilter["WrathCards"] = L["Playing Cards"]
											tableToFilter["CataCards"] = L["Playing Cards"]
											tableToFilter["PandaCards"] = L["Playing Cards"]
											tableToFilter["DraenorCards"] = L["Playing Cards"]
											tableToFilter["LegionCards"] = L["Playing Cards"]
										elseif val and not self.db.profile.PlayingCardsAlt then
											self.db.profile.NemelexXobeh = false
											self.db.profile.VanillaCards = false
											self.db.profile.CrusadeCards = false
											self.db.profile.WrathCards = false
											self.db.profile.CataCards = false
											self.db.profile.PandaCards = false
											self.db.profile.DraenorCards = false
											self.db.profile.LegionCards = false
											tableToFilter["NemelexXobeh"] = L["Darkmoon Faire"]
											tableToFilter["VanillaCards"] = L["Darkmoon Faire"]
											tableToFilter["CrusadeCards"] = L["Darkmoon Faire"]
											tableToFilter["WrathCards"] = L["Darkmoon Faire"]
											tableToFilter["CataCards"] = L["Darkmoon Faire"]
											tableToFilter["PandaCards"] = L["Darkmoon Faire"]
											tableToFilter["DraenorCards"] = L["Darkmoon Faire"]
											tableToFilter["LegionCards"] = L["Darkmoon Faire"]
										elseif not val and not self.db.profile.PlayingCardsAlt then
											self.db.profile.NemelexXobeh = false
											self.db.profile.VanillaCards = false
											self.db.profile.CrusadeCards = false
											self.db.profile.WrathCards = false
											self.db.profile.CataCards = false
											self.db.profile.PandaCards = false
											self.db.profile.DraenorCards = false
											self.db.profile.LegionCards = false
											tableToFilter["NemelexXobeh"] = L["Darkmoon Faire"]
											tableToFilter["VanillaCards"] = L["Darkmoon Faire"]
											tableToFilter["CrusadeCards"] = L["Darkmoon Faire"]
											tableToFilter["WrathCards"] = L["Darkmoon Faire"]
											tableToFilter["CataCards"] = L["Darkmoon Faire"]
											tableToFilter["PandaCards"] = L["Darkmoon Faire"]
											tableToFilter["DraenorCards"] = L["Darkmoon Faire"]
											tableToFilter["LegionCards"] = L["Darkmoon Faire"]
										end
										if val and self.db.profile.MergeAllHolidays then
											self.db.profile.NemelexXobeh = true
											self.db.profile.VanillaCards = true
											self.db.profile.CrusadeCards = true
											self.db.profile.WrathCards = true
											self.db.profile.CataCards = true
											self.db.profile.PandaCards = true
											self.db.profile.DraenorCards = true
											self.db.profile.LegionCards = true
											tableToFilter["NemelexXobeh"] = L["Holidays"]
											tableToFilter["VanillaCards"] = L["Holidays"]
											tableToFilter["CrusadeCards"] = L["Holidays"]
											tableToFilter["WrathCards"] = L["Holidays"]
											tableToFilter["CataCards"] = L["Holidays"]
											tableToFilter["PandaCards"] = L["Holidays"]
											tableToFilter["DraenorCards"] = L["Holidays"]
											tableToFilter["LegionCards"] = L["Holidays"]
										elseif not val and self.db.profile.MergeAllHolidays then
											tableToFilter["NemelexXobeh"] = L["Holidays"]
											tableToFilter["VanillaCards"] = L["Holidays"]
											tableToFilter["CrusadeCards"] = L["Holidays"]
											tableToFilter["WrathCards"] = L["Holidays"]
											tableToFilter["CataCards"] = L["Holidays"]
											tableToFilter["PandaCards"] = L["Holidays"]
											tableToFilter["DraenorCards"] = L["Holidays"]
											tableToFilter["LegionCards"] = L["Holidays"]
										end									
										self.db.profile.PlayingCardsAll = val
										self:SendMessage('AdiBags_FiltersChanged', true)
									end,
								},
								PlayingCardsAlt = {
									name = L["Separate Filter"],
									desc = L["If this is toggled, playing cards will be sorted into their own section."],
									type = 'toggle',
									width = 'normal',
									order = 2,
									set = function(info,val)
										if val then
											self.db.profile.NemelexXobeh = true
											self.db.profile.VanillaCards = true
											self.db.profile.CrusadeCards = true
											self.db.profile.WrathCards = true
											self.db.profile.CataCards = true
											self.db.profile.PandaCards = true
											self.db.profile.DraenorCards = true
											self.db.profile.LegionCards = true
											tableToFilter["NemelexXobeh"] = L["Playing Cards"]
											tableToFilter["VanillaCards"] = L["Playing Cards"]
											tableToFilter["CrusadeCards"] = L["Playing Cards"]
											tableToFilter["WrathCards"] = L["Playing Cards"]
											tableToFilter["CataCards"] = L["Playing Cards"]
											tableToFilter["PandaCards"] = L["Playing Cards"]
											tableToFilter["DraenorCards"] = L["Playing Cards"]
											tableToFilter["LegionCards"] = L["Playing Cards"]
										elseif self.db.profile.PlayingCardsAll then
											self.db.profile.NemelexXobeh = true
											self.db.profile.VanillaCards = true
											self.db.profile.CrusadeCards = true
											self.db.profile.WrathCards = true
											self.db.profile.CataCards = true
											self.db.profile.PandaCards = true
											self.db.profile.DraenorCards = true
											self.db.profile.LegionCards = true
											tableToFilter["NemelexXobeh"] = L["Darkmoon Faire"]
											tableToFilter["VanillaCards"] = L["Darkmoon Faire"]
											tableToFilter["CrusadeCards"] = L["Darkmoon Faire"]
											tableToFilter["WrathCards"] = L["Darkmoon Faire"]
											tableToFilter["CataCards"] = L["Darkmoon Faire"]
											tableToFilter["PandaCards"] = L["Darkmoon Faire"]
											tableToFilter["DraenorCards"] = L["Darkmoon Faire"]
											tableToFilter["LegionCards"] = L["Darkmoon Faire"]											
										elseif not val and not self.db.profile.PlayingCardsAll then
											self.db.profile.NemelexXobeh = false
											self.db.profile.VanillaCards = false
											self.db.profile.CrusadeCards = false
											self.db.profile.WrathCards = false
											self.db.profile.CataCards = false
											self.db.profile.PandaCards = false
											self.db.profile.DraenorCards = false
											self.db.profile.LegionCards = false
											tableToFilter["NemelexXobeh"] = L["Darkmoon Faire"]
											tableToFilter["VanillaCards"] = L["Darkmoon Faire"]
											tableToFilter["CrusadeCards"] = L["Darkmoon Faire"]
											tableToFilter["WrathCards"] = L["Darkmoon Faire"]
											tableToFilter["CataCards"] = L["Darkmoon Faire"]
											tableToFilter["PandaCards"] = L["Darkmoon Faire"]
											tableToFilter["DraenorCards"] = L["Darkmoon Faire"]
											tableToFilter["LegionCards"] = L["Darkmoon Faire"]
										end
										if val and self.db.profile.MergeAllHolidays then
											self.db.profile.NemelexXobeh = true
											self.db.profile.VanillaCards = true
											self.db.profile.CrusadeCards = true
											self.db.profile.WrathCards = true
											self.db.profile.CataCards = true
											self.db.profile.PandaCards = true
											self.db.profile.DraenorCards = true
											self.db.profile.LegionCards = true
											tableToFilter["NemelexXobeh"] = L["Holidays"]
											tableToFilter["VanillaCards"] = L["Holidays"]
											tableToFilter["CrusadeCards"] = L["Holidays"]
											tableToFilter["WrathCards"] = L["Holidays"]
											tableToFilter["CataCards"] = L["Holidays"]
											tableToFilter["PandaCards"] = L["Holidays"]
											tableToFilter["DraenorCards"] = L["Holidays"]
											tableToFilter["LegionCards"] = L["Holidays"]
										elseif not val and self.db.profile.MergeAllHolidays then
											tableToFilter["NemelexXobeh"] = L["Holidays"]
											tableToFilter["VanillaCards"] = L["Holidays"]
											tableToFilter["CrusadeCards"] = L["Holidays"]
											tableToFilter["WrathCards"] = L["Holidays"]
											tableToFilter["CataCards"] = L["Holidays"]
											tableToFilter["PandaCards"] = L["Holidays"]
											tableToFilter["DraenorCards"] = L["Holidays"]
											tableToFilter["LegionCards"] = L["Holidays"]
										end
										self.db.profile.PlayingCardsAlt = val
										self:SendMessage('AdiBags_FiltersChanged', true)
									end,
								},
								header = {
									name = L[""],
									type = 'header',
									order = 3,
								},
								NemelexXobeh = {
									name = L["Last Deck of Nemelex Xobeh"],
									desc = L["Include |cffc942fdLast Deck of Nemelex Xobeh|r with your playing card filters."],
									type = 'toggle',
									width = 'full',
									order = 4,
									set = function(info,val)
										if val and self.db.profile.MergeAllHolidays then
											tableToFilter["NemelexXobeh"] = L["Holidays"]
										end
										self.db.profile.NemelexXobeh = val
										self:SendMessage('AdiBags_FiltersChanged', true)
									end,
								},
								VanillaCards = {
									name = L["Vanilla"],
									desc = L["• |cffc942fdBeasts|r\n• |cffc942fdElementals|r\n• |cffc942fdPortals|r\n• |cffc942fdWarlords|r\n"],
									type = 'toggle',
									width = 'normal',
									order = 5,
									set = function(info,val)
										if val and self.db.profile.MergeAllHolidays then
											tableToFilter["VanillaCards"] = L["Holidays"]
										end
										self.db.profile.VanillaCards = val
										self:SendMessage('AdiBags_FiltersChanged', true)
									end,
									disabled = function()
										return self.db.profile.PlayingCardsAlt
									end,
								},
								CrusadeCards = {
									name = L["The Burning Crusade"],
									desc = L["• |cffc942fdBlessings|r\n• |cffc942fdFuries|r\n• |cffc942fdLunacy|r\n• |cffc942fdPrisms|r\n• |cffc942fdStorms|r\n"],
									type = 'toggle',
									width = 'normal',
									order = 6,
									set = function(info,val)
										if val and self.db.profile.MergeAllHolidays then
											tableToFilter["CrusadeCards"] = L["Holidays"]
										end
										self.db.profile.CrusadeCards = val
										self:SendMessage('AdiBags_FiltersChanged', true)
									end,
									disabled = function()
										return self.db.profile.PlayingCardsAlt
									end,
								},
								WrathCards = {
									name = L["Wrath of the Lich King"],
									desc = L["• |cffc942fdChaos|r\n• |cffc942fdNobles|r\n• |cffc942fdUndeath|r\n"],
									type = 'toggle',
									width = 'normal',
									order = 7,
									set = function(info,val)
										if val and self.db.profile.MergeAllHolidays then
											tableToFilter["WrathCards"] = L["Holidays"]
										end
										self.db.profile.WrathCards = val
										self:SendMessage('AdiBags_FiltersChanged', true)
									end,
									disabled = function()
										return self.db.profile.PlayingCardsAlt
									end,
								},
								CataCards = {
									name = L["Cataclysm"],
									desc = L["• |cffc942fdEarthquake|r\n• |cffc942fdHurricane|r\n• |cffc942fdTsunami|r\n• |cffc942fdVolcanic|r\n"],
									type = 'toggle',
									width = 'normal',
									order = 8,
									set = function(info,val)
										if val and self.db.profile.MergeAllHolidays then
											tableToFilter["CataCards"] = L["Holidays"]
										end
										self.db.profile.CataCards = val
										self:SendMessage('AdiBags_FiltersChanged', true)
									end,
									disabled = function()
										return self.db.profile.PlayingCardsAlt
									end,
								},
								PandaCards = {
									name = L["Mists of Pandaria"],
									desc = L["• |cffc942fdCrane|r\n• |cffc942fdOx|r\n• |cffc942fdSerpent|r\n• |cffc942fdTiger|r\n"],
									type = 'toggle',
									width = 'normal',
									order = 9,
									set = function(info,val)
										if val and self.db.profile.MergeAllHolidays then
											tableToFilter["PandaCards"] = L["Holidays"]
										end
										self.db.profile.PandaCards = val
										self:SendMessage('AdiBags_FiltersChanged', true)
									end,
									disabled = function()
										return self.db.profile.PlayingCardsAlt
									end,
								},
								DraenorCards = {
									name = L["Warlords of Draenor"],
									desc = L["• |cffc942fdIron|r\n• |cffc942fdMoon|r\n• |cffc942fdVisions|r\n• |cffc942fdWar|r\n"],
									type = 'toggle',
									width = 'normal',
									order = 10,
									set = function(info,val)
										if val and self.db.profile.MergeAllHolidays then
											tableToFilter["DraenorCards"] = L["Holidays"]
										end
										self.db.profile.DraenorCards = val
										self:SendMessage('AdiBags_FiltersChanged', true)
									end,
									disabled = function()
										return self.db.profile.PlayingCardsAlt
									end,
								},
								LegionCards = {
									name = L["Legion"],
									desc = L["• |cffc942fdDominion|r\n• |cffc942fdHellfire|r\n• |cffc942fdImmortality|r\n• |cffc942fdPromises|r\n"],
									type = 'toggle',
									width = 'normal',
									order = 11,
									set = function(info,val)
										if val and self.db.profile.MergeAllHolidays then
											tableToFilter["LegionCards"] = L["Holidays"]
										end
										self.db.profile.LegionCards = val
										self:SendMessage('AdiBags_FiltersChanged', true)
									end,
									disabled = function()
										return self.db.profile.PlayingCardsAlt
									end,
								},
							},
						},
					},
				},
			},
		},
	},
	AdiBags:GetOptionHandler(self, true)
end
