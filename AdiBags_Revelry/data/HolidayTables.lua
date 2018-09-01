--[[ 
AdiBags - Revelry! v0.9k [5.12.2017]
"Add filters for holidays to AdiBags."
]]--

local AddonName, AddonTable = ...
AddonTable.HolidayTables = {}

-- Festive Mug
AddonTable.HolidayTables.FestiveMug = {
	[21174] = true,		-- Empty Festive Mug	
	[21171] = true, 	-- Filled Festive Mug
}
-- Holidays
-- Noblegarden
AddonTable.HolidayTables.Noblegarden = {
	[44791] = true,		-- Noblegarden Chocolate
	[44792] = true,		-- Blossoming Branch
	[44802] = true,		-- Borrowed Egg Basket
	[44818] = true,		-- Noblegarden Egg
	[45067] = true,		-- Egg Basket
	[45072] = true,		-- Brightly Colored Egg
	[45073] = true,		-- Spring Flowers
	[116357] = true,	-- Poorly-Painted Egg
	[116358] = true,	-- Intricately-Painted Egg
	[116359] = true,	-- Magnificiently-Painted Egg
	[116369] = true,	-- Poorly-Painted Egg
	[116370] = true,	-- Intricately-Painted Egg
	[116371] = true,	-- Magnificiently-Painted Egg
}
AddonTable.HolidayTables.NoblegardenAttire = {
	[6833] = true,		-- White Tuxedo Shirt
	[6835] = true,		-- Black Tuxedo Pants
	[19028] = true,		-- Elegant Dress
	[44800] = true,		-- Spring Robes
	[44803] = true,		-- Spring Circlet
	[74282] = true,		-- Black Spring Circlet
	[74283] = true,		-- Pink Spring Circlet
}
AddonTable.HolidayTables.NoblegardenMounts = {
	[72145] = true,		-- Swift Springstrider
}
AddonTable.HolidayTables.NoblegardenPets = {
	[44794] = true,		-- Spring Rabbit's Foot
	[116258] = true,	-- Mystical Spring Bouquet
	[141532] = true,	-- Noblegarden Bunny
}
-- Children's Week
AddonTable.HolidayTables.ChildrensWeek = {
	[18597] = true,		-- Orcish Orphan Whistle
	[18598] = true,		-- Human Orphan Whistle
	[23022] = true,		-- Curmudgeon's Payoff
	[31880] = true,		-- Blood Elf Orphan Whistle
	[31881] = true,		-- Draenei Orphan Whistle
	[31951] = true,		-- Toy Dragon
	[46396] = true,		-- Wolvar Orphan Whistle
	[46397] = true,		-- Oracle Orphan Whistle
	[46693] = true,		-- Small Paper Zeppelin
	[69027] = true,		-- Cone of Cold
	[69057] = true,		-- Foam Sword Rack
	[69231] = true,		-- Dragon Kite 2-Pack
}
AddonTable.HolidayTables.ChildrensWeekFare = {
	[7228] = true,		-- Tigule and Foror's Strawberry Ice Cream
	[33924] = true,		-- Delicious Chocolate Cake
	[42429] = true,		-- Red Velvet Cupcake
	[42430] = true,		-- Dalaran Doughnut
	[42431] = true,		-- Dalaran Brownie
	[42434] = true,		-- Lovely Cake Slice
	[43490] = true,		-- Tasty Cupcake
}
AddonTable.HolidayTables.ChildrensWeekPets = {
	[23002] = true,		-- Turtle Box
	[23007] = true,		-- Piglet's Collar
	[23015] = true,		-- Rat Cage
	[32616] = true,		-- Egbert's Egg
	[32617] = true,		-- Sleepy Willy
	[32622] = true,		-- Elekk Training Collar
	[46544] = true,		-- Curious Wolvar Pup
	[46545] = true,		-- Curious Oracle Hatchling
	[66073] = true,		-- Snail Shell
	[69648] = true,		-- Legs	
	[116202] = true,	-- Pet Care Package
}
AddonTable.HolidayTables.ChildrensWeekToys = {
	[69895] = true,		-- Green Balloon
	[69896] = true,		-- Yellow Balloon
}
-- Midsummer Holidays
AddonTable.HolidayTables.FireFestival = {
	[23179] = true,		-- Flame of Orgrimmar
	[23180] = true,		-- Flame of Thunder Bluff
	[23181] = true,		-- Flame of the Undercity
	[23182] = true,		-- Flame of Stormwind
	[23183] = true,		-- Flame of Ironforge
	[23184] = true,		-- Flame of Darnassus
	[23247] = true,		-- Burning Blossom
	[34599] = true,		-- Juggling Torches
	[34684] = true,		-- Handful of Summer Petals
	[34833] = true,		-- Unlit Torches
	[34862] = true,		-- Practice Torches
	[35237] = true,		-- Orb of the Crawler
	[35277] = true,		-- Twilight Correspondence
	[35568] = true,		-- Flame of Silvermoon
	[35569] = true,		-- Flame of the Exodar
	[35723] = true,		-- Shards of Ahune
	[35725] = true,		-- Summer Incense
	[35828] = true,		-- Totemic Beacon
	[117394] = true,	-- Satchel of Chilled Goods
}
AddonTable.HolidayTables.FireFestivalSpecial = {
	[23215] = true,		-- Bag of Smorc Ingredients
}
AddonTable.HolidayTables.FireFestivalArms = {
	[117373] = true,	-- Frostscythe of Lord Ahune
}
AddonTable.HolidayTables.FireFestivalAttire = {
	[23323] = true,		-- Crown of the Holidays
	[23324] = true,		-- Mantle of the Holidays
	[34683] = true,		-- Sandals of Summer
	[34685] = true,		-- Vestment of Summer
	[35279] = true,		-- Tabard of Summer Skies
	[35280] = true,		-- Tabard of Summer Flames
	[74278] = true,		-- Helm of the Holidays
}
AddonTable.HolidayTables.FireFestivalFare = {
	[23211] = true,		-- Toasted Smorc
	[23246] = true,		-- Fiery Festival Brew
	[23326] = true,		-- Midsummer Sausage
	[23327] = true,		-- Fire-Toasted Bun
	[23435] = true,		-- Elderberry Pie
}
AddonTable.HolidayTables.FireFestivalPets = {
	[23083] = true,		-- Captured Flames
	[53641] = true,		-- Ice Chip
	[116439] = true,	-- Blazing Cindercrawler
}
AddonTable.HolidayTables.FireFestivalToys = {
	[34686] = true,		-- Brazier of Dancing Flames
	[116435] = true,	-- Cozy Bonfire
	[116440] = true,	-- Burning Defender's Medallion
}
-- Pirates' Day
AddonTable.HolidayTables.PiratesDay = {
	[116392] = true,	-- Big Bag of Booty
	[138400] = true,	-- Petey
	[138414] = true,	-- Emergency Pirate Costume
}
AddonTable.HolidayTables.PiratesDayToys = {
	[138415] = true,	-- Slightly-Chewed Insult Book
}
-- Brewfest
AddonTable.HolidayTables.BrewfestTokens = {
	[37829] = true,		-- Brewfest Prize Token
}
AddonTable.HolidayTables.Brewfest = {
	[33096] = true,		-- Alcohol-Free Brewfest Sampler
	[32907] = true,		-- Wolpertinger Net
	[46735] = true,		-- Synthebrew Goggles
	[32960] = true,		-- Elekk Dispersion Ray
	[33797] = true,		-- Portable Brewfest Keg
	[33306] = true,		-- Ram Racing Reins
	[38281] = true,		-- Direbrew's Dire Brew
	[38280] = true,		-- Direbrew's Dire Brew
	[117393] = true,	-- Keg-Shaped Treasure Chest
}
AddonTable.HolidayTables.BrewOfTheMonth = {
	[37571] = true,		-- "Brew of the Month" Club Membership Form
	[37599] = true,		-- "Brew of the Month" Club Membership Form
	[119209] = true,	-- Angry Brewfest Letter
	[37898] = true,		-- Wild Winter Pilsner
	[37489] = true,		-- Izzard's Ever Flavor
	[37490] = true,		-- Aromatic Honey Brew
	[37491] = true,		-- Metok's Bubble Bock
	[37492] = true,		-- Springtime Stout
	[37493] = true,		-- Blackrock Lager
	[37494] = true,		-- Stranglethorn Brew
	[37495] = true,		-- Draenic Pale Ale
	[37496] = true,		-- Binary Brew
	[37497] = true,		-- Autumnal Acorn Ale
	[37498] = true,		-- Bartlett's Bitter Brew
	[37499] = true,		-- Lord of Frost's Private Label
}
AddonTable.HolidayTables.BrewfestToys = {
	[33927] = true,		-- Brewfest Pony Keg
	[71137] = true,		-- Brewfest Keg Pony
	[116758] = true,	-- Brewfest Banner
	[116757] = true,	-- Steamworks Sausage Grill
	[90427] = true,		-- Pandaren Brewpack
	[138900] = true,	-- Gravil Goldbraid's Famous Sausage Hat
}
AddonTable.HolidayTables.BrewfestPets = {
	[46707] = true,		-- Pint-Sized Pink Pachyderm
	[32233] = true,		-- Wolpertinger's Tankard
	[116756] = true,	-- Stout Alemental
}
AddonTable.HolidayTables.BrewfestMounts = {
	[33977] = true,		-- Swift Brewfest Ram
	[37828] = true,		-- Great Brewfest Kodo
	[33976] = true,		-- Brewfest Ram
}
AddonTable.HolidayTables.BrewfestHops = {
	[37750] = true,		-- Fresh Brewfest Hops
	[39477] = true,		-- Fresh Dwarven Brewfest Hops
	[39476] = true,		-- Fresh Goblin Brewfest Hops
	[37816] = true,		-- Preserved Brewfest Hops
}
AddonTable.HolidayTables.BrewfestFare = {
	[33026] = true,		-- The Golden Link
	[34064] = true,		-- Succulent Sausage
	[33024] = true,		-- Pickled Sausage
	[33023] = true,		-- Savory Sausage
	[34063] = true,		-- Dried Sausage
	[33025] = true,		-- Spicy Smoked Sausage
	[34065] = true,		-- Spiced Onion Cheese
	[33043] = true,		-- The Essential Brewfest Pretzel
}
AddonTable.HolidayTables.StrangeBrew = {
	[34022] = true,		-- Stout Shrunken Head
	[34021] = true,		-- Brewdoo Magic
	[34020] = true,		-- Jungle River Water
	[34019] = true,		-- Path of Brew
	[34018] = true,		-- Long Stride Brew
	[34017] = true,		-- Small Step Brew
	[33036] = true,		-- Mudder's Milk
	[33035] = true,		-- Ogre Mead
	[33034] = true,		-- Gordok Grog
	[33033] = true,		-- Thunderbrew Stout
	[33032] = true,		-- Thunderbrew Ale
	[33031] = true,		-- Thunder 45
	[33030] = true,		-- Barleybrew Clear
	[33029] = true,		-- Barleybrew Dark
	[33028] = true,		-- Barleybrew Light
}
AddonTable.HolidayTables.BrewfestBrew = {
	[46401] = true,		-- Crimson Stripe
	[138870] = true,	-- Spirit Spirits
	[46402] = true,		-- Promise of the Pandaren
	[138868] = true,	-- Mannoroth's Blood Red Ale
	[46403] = true,		-- Chuganpug's Delight
	[138869] = true,	-- Gordok Bock
	[46399] = true,		-- Thunder's Plunder
	[138871] = true,	-- Storming Saison
	[46400] = true,		-- Barleybrew Gold
	[138867] = true,	-- Shimmer Stout
}
AddonTable.HolidayTables.BrewfestAttire = {
	[34008] = true,		-- Blix's Eyesight Enhancing Romance Goggles
	[33047] = true,		-- Belbi's Eyesight Enhancing Romance Goggles
	[33968] = true,		-- Blue Brewfest Hat
	[33967] = true,		-- Green Brewfest Hat
	[33864] = true,		-- Brown Brewfest Hat
	[33969] = true,		-- Purple Brewfest Hat
	[33863] = true,		-- Brewfest Dress
	[33966] = true,		-- Brewfest Slippers
	[33862] = true,		-- Brewfest Regalia
	[33868] = true,		-- Brewfest Boots
	[90426] = true,		-- Brewhelm
	[138730] = true,	-- Synthebrew Goggles XL
}
-- Day of the Dead
AddonTable.HolidayTables.DayOfTheDead = {
	[46711] = true,		-- Spirit Candle
	[46718] = true,		-- Orange Marigolds
	[46861] = true,		-- Bouquet of Orange Marigolds
	[79048] = true,		-- Whimsical Skull Mask	
}
AddonTable.HolidayTables.DayOfTheDeadAttire = {
	[46860] = true,		-- Whimsical Skull Mask
}
AddonTable.HolidayTables.DayOfTheDeadRecipes = {
	[46710] = true,		-- Recipe: Bread of the Dead
}
AddonTable.HolidayTables.DayOfTheDeadFare = {
	[46690] = true,		-- Candy Skull
	[46691] = true,		-- Bread of the Dead
}
AddonTable.HolidayTables.DayOfTheDeadPets = {
	[46831] = true,		-- Macabre Marionette
}
AddonTable.HolidayTables.DayOfTheDeadToys = {
	[116856] = true,	-- "Blooming Rose" Contender's Costume
	[116888] = true,	-- "Night Demon" Contender's Costume
	[116889] = true,	-- "Purple Phantom" Contender's Costume
	[116890] = true,	-- "Santo's Sun" Contender's Costume
	[116891] = true,	-- "Snowy Owl" Contender's Costume
}
-- Micro-Holidays
-- Call of the Scarab
AddonTable.HolidayTables.CallOfTheScarab = {
	[20424] = true,		-- Sandworm Meat
	[22644] = true,		-- Crunchy Spider Leg
	[43013] = true,		-- Chilled Meat
	[62784] = true,		-- Crocolisk Tail
	[74833] = true,		-- Raw Tiger Steak
	[109131] = true,	-- Raw Clefthoof Meat
	[124117] = true,	-- Lean Shank
	[143865] = true,	-- Abyssal Crest
	[143866] = true,	-- Twilight Cultist Ring of Lordship
	[143867] = true,	-- Twilight Cultist Medallion of Station
}
-- Hatching of the Hippogryphs
AddonTable.HolidayTables.HatchingOfTheHippogryphs = {
	[142259] = true,	-- Spectral Feather
}
-- Un'Goro Madness
AddonTable.HolidayTables.UnGoroMadness = {
	[144228] = true,	-- Dino Mojo
}
-- March of the Tadpoles
AddonTable.HolidayTables.MarchOfTheTadpoles = {
	[144291] = true,	-- Tadpole Gift
}
-- Glowcap Festival
AddonTable.HolidayTables.GlowcapFestival = {
	[144261] = true,	-- Sporeggium
	[144262] = true,	-- Fungal Lifestalk
	[144263] = true,	-- Pungent Truffle
	[144264] = true,	-- Pungent Truffle
	[144265] = true,	-- Rimecap
	[144276] = true,	-- Sack of Healing Spores
}
-- Thousand Boat Bash
AddonTable.HolidayTables.ThousandBoatBash = {
	[144073] = true,	-- Ship Mast
	[144074] = true,	-- Mainsail
	[144075] = true,	-- Waxy Reeds
	[144076] = true,	-- Rigging Rope
	[144077] = true,	-- Submarine Tar
}
-- Kirin Tor Tavern Crawl
AddonTable.HolidayTables.TavernCrawl = {
	[62672] = true,		-- South Island Iced Tea
	[144409] = true,	-- Entangling Rootbeer
	[144410] = true,	-- Barrel-Aged Stormstout
	[144411] = true,	-- Sargeras Sangria
	[144412] = true,	-- Mechs on the Beach
	[144413] = true,	-- Wiley's Wicked Ale
	[144414] = true,	-- Liquid Qiraj
	[144415] = true,	-- Coilfang Reserve
	[144417] = true,	-- Blackout Kick
	[145272] = true,	-- Sparkling Snowplum Brandy
}
-- Darkmoon Faire
-- Adventurer's Guide
AddonTable.HolidayTables.DarkmoonGuide = {
	[71634] = true,		-- Darkmoon Adventurer's Guide
}
-- Game Tokens
AddonTable.HolidayTables.DarkmoonTokens = {
	[71083] = true,		-- Darkmoon Game Token
	[78897] = true,		-- Pouch o' Tokens
	[78898] = true,		-- Sack o' Tokens
	[78899] = true,		-- Pouch o' Tokens
	[78900] = true,		-- Pouch o' Tokens
	[78901] = true,		-- Pouch o' Tokens
	[78902] = true,		-- Pouch o' Tokens
	[78903] = true,		-- Pouch o' Tokens
	[78904] = true,		-- Pouch o' Tokens
	[78905] = true,		-- Sack o' Tokens
	[78906] = true,		-- Sack o' Tokens
	[78907] = true,		-- Sack o' Tokens
	[78908] = true,		-- Sack o' Tokens
	[78909] = true,		-- Sack o' Tokens
	[78910] = true,		-- Sack o' Tokens
}
-- Ride Tickets
AddonTable.HolidayTables.DarkmoonTickets = {
	[81055] = true,		-- Darkmoon Ride Ticket
	[92788] = true,		-- Ride Ticket Book
	[92789] = true,		-- Ride Ticket Book
	[92790] = true,		-- Ride Ticket Book
	[92791] = true,		-- Ride Ticket Book
	[92792] = true,		-- Ride Ticket Book
	[92793] = true,		-- Ride Ticket Book
	[92794] = true,		-- Ride Ticket Book
	[110678] = true,	-- Darkmoon Ticket Fanny Pack
}
AddonTable.HolidayTables.DarkmoonDaggermaw = {
	[124669] = true,	-- Darkmoon Daggermaw
}
AddonTable.HolidayTables.DarkmoonItemsQ = {
	[71096] = true,		-- Grisly Trophy
	[105891] = true,	-- Moonfang's Pelt
	[116068] = true,	-- Ring of Promises
	[126930] = true,	-- Faded Treasure Map
	[127148] = true,	-- Silas' Secret Stash
}
-- Darkmoon Achievements
AddonTable.HolidayTables.DarkmoonAdventurer = {	
	[71635] = true,		-- Imbued Crystal
	[71636] = true,		-- Monstrous Egg
	[71637] = true,		-- Mysterious Grimoire
	[71638] = true,		-- Ornate Weapon
	[71715] = true,		-- A Treatise on Strategy
	[71716] = true,		-- Soothsayer's Runes
	[71951] = true,		-- Banner of the Fallen
	[71952] = true,		-- Captured Insignia
	[71953] = true,		-- Fallen Adventurer's Journal
}
AddonTable.HolidayTables.FairegoersFeast = {
	[19221] = true,		-- Darkmoon Special Reserve
	[19222] = true,		-- Cheap Beer
	[19223] = true,		-- Darkmoon Dog
	[19224] = true,		-- Red Hot Wings
	[19225] = true,		-- Deep Fried Candybar
	[19299] = true,		-- Fizzy Faire Drink
	[19300] = true,		-- Bottled Winterspring Water
	[19304] = true,		-- Spiced Beef Jerky
	[19305] = true,		-- Pickled Kodo Foot
	[19306] = true,		-- Crunchy Frog
	[33234] = true,		-- Iced Berry Slush
	[33236] = true,		-- Fizzy Faire Drink "Classic"
	[33246] = true,		-- Funnel Cake
	[33254] = true,		-- Forest Strider Drumstick
	[44940] = true,		-- Corn-Breaded Sausage
	[44941] = true,		-- Fresh-Squeezed Limeade
	[73260] = true,		-- Salty Sea Dog
	[74822] = true,		-- Sasparilla Sinker
	[93208] = true,		-- Darkmoon P.I.E.
}
AddonTable.HolidayTables.DarkmoonFirework = {
	[74142] = true,		-- Darkmoon Firework
}
-- Darkmoon Professions
AddonTable.HolidayTables.DarkmoonProfs = {
	[71964] = true,		-- Iron Stock
	[71967] = true,		-- Horseshoe
	[71968] = true,		-- Tonk Scrap
	[71971] = true,		-- Bundle of Exotic Herbs
	[71972] = true,		-- Prophetic Ink
	[71974] = true,		-- Fortune
	[71976] = true,		-- Darkmoon Prize
	[71977] = true,		-- Darkmoon Craftsman's Kit
	[71978] = true,		-- Darkmoon Bandage
	[71979] = true,		-- Soothsayer's Dust
	[72018] = true,		-- Discarded Weapon
	[72043] = true,		-- Cocktail Shaker
	[72044] = true,		-- Moonberry Fizz
	[72046] = true,		-- Darkblossom
	[72048] = true,		-- Darkmoon Banner Kit
	[72049] = true,		-- Darkmoon Banner
	[72050] = true,		-- Sparkling 'Gemstone'
	[72052] = true,		-- Bit of Glass
	[72056] = true,		-- Plump Frogs
	[72057] = true,		-- Breaded Frog
	[72058] = true,		-- Crunchy Frog
	[72110] = true,		-- Battered Wrench
	[73269] = true,		-- Great Sea Herring
}
AddonTable.HolidayTables.DarkmoonReagents = {
	[1645] = true,		-- Moonberry Juice
	[2320] = true,		-- Coarse Thread
	[2604] = true,		-- Red Dye
	[6260] = true,		-- Blue Dye
	[6529] = true,		-- Shiny Bauble
	[30817] = true,		-- Simple Flour
	[39354] = true,		-- Light Parchment
}
AddonTable.HolidayTables.DarkmoonFishing = {
	[78930] = true,		-- Sealed Crate
	[88496] = true,		-- Sealed Crate
	[124669] = true,	-- Darkmoon Daggermaw
	[124670] = true,	-- Sealed Darkmoon Crate
	[127141] = true,	-- Bloated Thresher
}
AddonTable.HolidayTables.DarkmoonRecipes = {
	[126927] = true,	-- Recipe: Sugar-Crusted Fish Feast
	[126928] = true,	-- Recipe: Lemon Herb Filet
	[126929] = true,	-- Recipe: Fancy Darkmoon Feast
}
-- Darkmoon Equipment
AddonTable.HolidayTables.DarkmoonArms = {
	[19292] = true,		-- Last Month's Mutton
	[19293] = true,		-- Last Year's Mutton
	[19295] = true,		-- Darkmoon Flower
	[77256] = true,		-- Darkmoon "Sword"
	[78341] = true,		-- Darkmoon Hammer
}
AddonTable.HolidayTables.DarkmoonAttire = {
	[78340] = true,		-- Cloak of the Darkmoon Faire
	[93730] = true,		-- Darkmoon Top Hat
	[116052] = true,	-- Nobleman's Coat
	[116133] = true,	-- Nobleman's Pantaloons
	[116134] = true,	-- Noble's Fancy Boots
	[116136] = true,	-- Noblewoman's Skirt
	[116137] = true,	-- Noblewoman's Finery
}
AddonTable.HolidayTables.DarkmoonItemsV = {
	[75040] = true,		-- Flimsy Darkmoon Balloon
	[75041] = true,		-- Flimsy Green Balloon
	[122124] = true,	-- Darkmoon Cannon
	[122128] = true,	-- Checkered Flag
}
-- Darkmoon Collections
AddonTable.HolidayTables.DarkmoonMounts = {
	[72140] = true,		-- Swift Forest Strider
	[73766] = true,		-- Darkmoon Dancing Bear
	[101675] = true,	-- Shimmering Moonstone
	[142398] = true,	-- Darkwater Skate
}
AddonTable.HolidayTables.DarkmoonPets = {
	[19450] = true,		-- A Jubling's Tiny Home
	[19462] = true,		-- Unhatched Jubling Egg
	[73762] = true,		-- Darkmoon Balloon
	[73764] = true,		-- Darkmoon Monkey
	[73765] = true,		-- Darkmoon Turtle
	[73903] = true,		-- Darkmoon Tonk
	[73905] = true,		-- Darkmoon Zeppelin
	[73953] = true,		-- Sea Pony
	[74981] = true,		-- Darkmoon Cub
	[80008] = true,		-- Darkmoon Rabbit
	[91003] = true,		-- Darkmoon Hatchling
	[91040] = true,		-- Darkmoon Eye
	[101570] = true,	-- Moon Moon
	[116064] = true,	-- Syd the Squid
	[122125] = true,	-- Race MiniZep Controller
	[123862] = true,	-- Hogs' Studded Collar
	[126925] = true,	-- Blorp's Bubble
	[126926] = true,	-- Translucent Shell
}
AddonTable.HolidayTables.DarkmoonToys = {
	[75042] = true,		-- Flimsy Yellow Balloon
	[90899] = true,		-- Darkmoon Whistle
	[97994] = true,		-- Darkmoon Seesaw
	[101571] = true,	-- Moonfang Shroud
	[105898] = true,	-- Moonfang's Paw
	[116067] = true,	-- Ring of Broken Promises
	[116115] = true,	-- Blazing Wings
	[116139] = true,	-- Haunting Memento
	[122119] = true,	-- Everlasting Darkmoon Firework
	[122120] = true,	-- Gaze of the Darkmoon
	[122121] = true,	-- Darkmoon Gazer
	[122122] = true,	-- Darkmoon Tonk Controller
	[122123] = true,	-- Darkmoon Ring-Flinger
	[122126] = true,	-- Attraction Sign
	[122129] = true,	-- Fire-Eater's Vial
	[126931] = true,	-- Seafarer's Slidewhistle
	[138202] = true,	-- Sparklepony XL
}
-- Darkmoon Miscellaneous
AddonTable.HolidayTables.DarkmoonFare = {
	[124669] = true,	-- Lemon Herb Filet
	[126935] = true,	-- Fancy Darkmoon Feast
	[126936] = true,	-- Sugar-Crusted Fish Feast
}
AddonTable.HolidayTables.DarkmoonRewards = {
	[91086] = true,		-- Darkmoon Pet Supplies
	[93724] = true,		-- Darkmoon Game Prize
	[116062] = true,	-- Greater Darkmoon Pet Supplies
}
AddonTable.HolidayTables.DarkmoonFortunes = {
	[19229] = true,		-- Sayge's Fortune #1
	[19238] = true,		-- Sayge's Fortune #3
	[19239] = true,		-- Sayge's Fortune #4
	[19240] = true,		-- Sayge's Fortune #5
	[19241] = true,		-- Sayge's Fortune #6
	[19242] = true,		-- Sayge's Fortune #7
	[19243] = true,		-- Sayge's Fortune #8
	[19244] = true,		-- Sayge's Fortune #9
	[19245] = true,		-- Sayge's Fortune #10
	[19246] = true,		-- Sayge's Fortune #11
	[19247] = true,		-- Sayge's Fortune #12
	[19248] = true,		-- Sayge's Fortune #13
	[19249] = true,		-- Sayge's Fortune #14
	[19250] = true,		-- Sayge's Fortune #15
	[19251] = true,		-- Sayge's Fortune #16
	[19252] = true,		-- Sayge's Fortune #18
	[19253] = true,		-- Sayge's Fortune #19
	[19254] = true,		-- Sayge's Fortune #21
	[19255] = true,		-- Sayge's Fortune #22
	[19256] = true,		-- Sayge's Fortune #2
	[19266] = true,		-- Sayge's Fortune #20
	[19422] = true,		-- Darkmoon Faire Fortune
	[19423] = true,		-- Sayge's Fortune #23
	[19424] = true,		-- Sayge's Fortune #24
	[19443] = true,		-- Sayge's Fortune #25
	[19451] = true,		-- Sayge's Fortune #26
	[19452] = true,		-- Sayge's Fortune #27
	[19453] = true,		-- Sayge's Fortune #28
	[19454] = true,		-- Sayge's Fortune #29
}
-- Playing Cards
AddonTable.HolidayTables.NemelexXobeh = {
	[116138] = true,	-- Last Deck of Nemelex Xobeh
}
AddonTable.HolidayTables.VanillaCards = {
	[19227] = true,		-- Ace of Beasts
	[19228] = true,		-- Beasts Deck
	[19230] = true,		-- Two of Beasts
	[19231] = true,		-- Three of Beasts
	[19232] = true,		-- Four of Beasts
	[19233] = true,		-- Five of Beasts
	[19234] = true,		-- Six of Beasts
	[19235] = true,		-- Seven of Beasts
	[19236] = true,		-- Eight of Beasts
	[19257] = true,		-- Warlords Deck
	[19258] = true,		-- Ace of Warlords
	[19259] = true,		-- Two of Warlords
	[19260] = true,		-- Three of Warlords
	[19261] = true,		-- Four of Warlords
	[19262] = true,		-- Five of Warlords
	[19263] = true,		-- Six of Warlords
	[19264] = true,		-- Seven of Warlords
	[19265] = true,		-- Eight of Warlords
	[19267] = true,		-- Elementals Deck
	[19268] = true,		-- Ace of Elementals
	[19269] = true,		-- Two of Elementals
	[19270] = true,		-- Three of Elementals
	[19271] = true,		-- Four of Elementals
	[19272] = true,		-- Five of Elementals
	[19273] = true,		-- Six of Elementals
	[19274] = true,		-- Seven of Elementals
	[19275] = true,		-- Eight of Elementals
	[19276] = true,		-- Ace of Portals
	[19277] = true,		-- Portals Deck
	[19278] = true,		-- Two of Portals
	[19279] = true,		-- Three of Portals
	[19280] = true,		-- Four of Portals
	[19281] = true,		-- Five of Portals
	[19282] = true,		-- Six of Portals
	[19283] = true,		-- Seven of Portals
	[19284] = true,		-- Eight of Portals
	[44316] = true,		-- Darkmoon Card
}
AddonTable.HolidayTables.CrusadeCards = {
	[31882] = true,		-- Ace of Blessings
	[31883] = true,		-- Eight of Blessings
	[31884] = true,		-- Five of Blessings
	[31885] = true,		-- Four of Blessings
	[31886] = true,		-- Seven of Blessings
	[31887] = true,		-- Six of Blessings
	[31888] = true,		-- Three of Blessings
	[31889] = true,		-- Two of Blessings
	[31890] = true,		-- Blessings Deck
	[31891] = true,		-- Storms Deck
	[31892] = true,		-- Ace of Storms
	[31893] = true,		-- Eight of Storms
	[31894] = true,		-- Five of Storms
	[31895] = true,		-- Four of Storms
	[31896] = true,		-- Seven of Storms
	[31898] = true,		-- Six of Storms
	[31899] = true,		-- Three of Storms
	[31900] = true,		-- Two of Storms
	[31901] = true,		-- Ace of Furies
	[31902] = true,		-- Eight of Furies
	[31903] = true,		-- Five of Furies
	[31904] = true,		-- Four of Furies
	[31905] = true,		-- Seven of Furies
	[31906] = true,		-- Six of Furies
	[31907] = true,		-- Furies Deck
	[31908] = true,		-- Three of Furies
	[31909] = true,		-- Two of Furies
	[31910] = true,		-- Ace of Lunacy
	[31911] = true,		-- Eight of Lunacy
	[31912] = true,		-- Five of Lunacy
	[31913] = true,		-- Four of Lunacy
	[31914] = true,		-- Lunacy Deck
	[31915] = true,		-- Seven of Lunacy
	[31916] = true,		-- Six of Lunacy
	[31917] = true,		-- Three of Lunacy
	[31918] = true,		-- Two of Lunacy
	[44259] = true,		-- Prisms Deck
	[44260] = true,		-- Ace of Prisms
	[44261] = true,		-- Two of Prisms
	[44262] = true,		-- Three of Prisms
	[44263] = true,		-- Four of Prisms
	[44264] = true,		-- Five of Prisms
	[44265] = true,		-- Six of Prisms
	[44266] = true,		-- Seven of Prisms
	[44267] = true,		-- Eight of Prisms
	[44317] = true,		-- Greater Darkmoon Card
}
AddonTable.HolidayTables.WrathCards = {
	[44268] = true,		-- Ace of Nobles
	[44269] = true,		-- Two of Nobles
	[44270] = true,		-- Three of Nobles
	[44271] = true,		-- Four of Nobles
	[44272] = true,		-- Five of Nobles
	[44273] = true,		-- Six of Nobles
	[44274] = true,		-- Seven of Nobles
	[44275] = true,		-- Eight of Nobles
	[44276] = true,		-- Chaos Deck
	[44277] = true,		-- Ace of Chaos
	[44278] = true,		-- Two of Chaos
	[44279] = true,		-- Three of Chaos
	[44280] = true,		-- Four of Chaos
	[44281] = true,		-- Five of Chaos
	[44282] = true,		-- Six of Chaos
	[44284] = true,		-- Seven of Chaos
	[44285] = true,		-- Eight of Chaos
	[44286] = true,		-- Ace of Undeath
	[44287] = true,		-- Two of Undeath
	[44288] = true,		-- Three of Undeath
	[44289] = true,		-- Four of Undeath
	[44290] = true,		-- Five of Undeath
	[44291] = true,		-- Six of Undeath
	[44292] = true,		-- Seven of Undeath
	[44293] = true,		-- Eight of Undeath
	[44294] = true,		-- Undeath Deck
	[44318] = true,		-- Darkmoon Card of the North
	[44326] = true,		-- Nobles Deck
}
AddonTable.HolidayTables.CataCards = {
	[61987] = true,		-- Darkmoon Card of Destruction
	[61988] = true,		-- Ace of Embers
	[61989] = true,		-- Two of Embers
	[61990] = true,		-- Three of Embers
	[61991] = true,		-- Four of Embers
	[61992] = true,		-- Five of Embers
	[61993] = true,		-- Six of Embers
	[61994] = true,		-- Seven of Embers
	[61995] = true,		-- Eight of Embers
	[61996] = true,		-- Ace of Stones
	[61997] = true,		-- Two of Stones
	[61998] = true,		-- Three of Stones
	[61999] = true,		-- Four of Stones
	[62000] = true,		-- Five of Stones
	[62001] = true,		-- Six of Stones
	[62002] = true,		-- Seven of Stones
	[62003] = true,		-- Eight of Stones
	[62004] = true,		-- Ace of the Winds
	[62005] = true,		-- Two of the Winds
	[62006] = true,		-- Three of the Winds
	[62007] = true,		-- Four of the Winds
	[62008] = true,		-- Five of the Winds
	[62009] = true,		-- Six of the Winds
	[62010] = true,		-- Seven of the Winds
	[62011] = true,		-- Eight of the Winds
	[62012] = true,		-- Ace of Waves
	[62013] = true,		-- Two of Waves
	[62014] = true,		-- Three of Waves
	[62015] = true,		-- Four of Waves
	[62016] = true,		-- Five of Waves
	[62017] = true,		-- Six of Waves
	[62018] = true,		-- Seven of Waves
	[62019] = true,		-- Eight of Waves
	[62021] = true,		-- Volcanic Deck
	[62044] = true,		-- Tsunami Deck
	[62045] = true,		-- Hurricane Deck
	[62046] = true,		-- Earthquake Deck
}
AddonTable.HolidayTables.PandaCards = {
	[79283] = true,		-- Ace of Tigers
	[79284] = true,		-- Two of Tigers
	[79285] = true,		-- Three of Tigers
	[79286] = true,		-- Four of Tigers
	[79287] = true,		-- Five of Tigers
	[79288] = true,		-- Six of Tigers
	[79289] = true,		-- Seven of Tigers
	[79290] = true,		-- Eight of Tigers
	[79291] = true,		-- Ace of Oxen
	[79292] = true,		-- Two of Oxen
	[79293] = true,		-- Three of Oxen
	[79294] = true,		-- Four of Oxen
	[79295] = true,		-- Five of Oxen
	[79296] = true,		-- Six of Oxen
	[79297] = true,		-- Seven of Oxen
	[79298] = true,		-- Eight of Oxen
	[79299] = true,		-- Ace of Cranes
	[79300] = true,		-- Two of Cranes
	[79301] = true,		-- Three of Cranes
	[79302] = true,		-- Four of Cranes
	[79303] = true,		-- Five of Cranes
	[79304] = true,		-- Six of Cranes
	[79305] = true,		-- Seven of Cranes
	[79306] = true,		-- Eight of Cranes
	[79307] = true,		-- Ace of Serpents
	[79308] = true,		-- Two of Serpents
	[79309] = true,		-- Three of Serpents
	[79310] = true,		-- Four of Serpents
	[79311] = true,		-- Five of Serpents
	[79312] = true,		-- Six of Serpents
	[79313] = true,		-- Seven of Serpents
	[79314] = true,		-- Eight of Serpents
	[79318] = true,		-- Darkmoon Card of Mists
	[79323] = true,		-- Tiger Deck
	[79324] = true,		-- Ox Deck
	[79325] = true,		-- Crane Deck
	[79326] = true,		-- Serpent Deck
}
AddonTable.HolidayTables.DraenorCards = {
	[112270] = true,	-- Darkmoon Card of Draenor
	[112271] = true,	-- Eight of Iron
	[112272] = true,	-- Seven of Iron
	[112273] = true,	-- Six of Iron
	[112274] = true,	-- Four of Iron
	[112275] = true,	-- Five of Iron
	[112276] = true,	-- Three of Iron
	[112277] = true,	-- Two of Iron
	[112278] = true,	-- Ace of Iron
	[112279] = true,	-- Eight of Visions
	[112280] = true,	-- Seven of Visions
	[112281] = true,	-- Six of Visions
	[112282] = true,	-- Five of Visions
	[112283] = true,	-- Four of Visions
	[112284] = true,	-- Three of Visions
	[112285] = true,	-- Two of Visions
	[112286] = true,	-- Ace of Visions
	[112287] = true,	-- Eight of War
	[112288] = true,	-- Seven of War
	[112289] = true,	-- Six of War
	[112290] = true,	-- Five of War
	[112291] = true,	-- Four of War
	[112292] = true,	-- Three of War
	[112293] = true,	-- Two of War
	[112294] = true,	-- Ace of War
	[112295] = true,	-- Eight of the Moon
	[112296] = true,	-- Seven of Moon
	[112297] = true,	-- Six of the Moon
	[112298] = true,	-- Five of the Moon
	[112299] = true,	-- Four of the Moon
	[112300] = true,	-- Three of the Moon
	[112301] = true,	-- Two of the Moon
	[112302] = true,	-- Ace of the Moon
	[112303] = true,	-- Iron Deck
	[112304] = true,	-- Moons Deck
	[112305] = true,	-- Visions Deck
	[112306] = true,	-- War Deck
	[113135] = true,	-- Iron Joker
	[113139] = true,	-- Visions Joker
	[113140] = true,	-- War Joker
	[113142] = true,	-- Moon Joker
}
AddonTable.HolidayTables.LegionCards = {
	[128712] = true,	-- Darkmoon Card of the Legion
	[128713] = true,	-- Eight of Immortality
	[128714] = true,	-- Seven of Immortality
	[128715] = true,	-- Six of Immortality
	[128716] = true,	-- Four of Immortality
	[128717] = true,	-- Five of Immortality
	[128718] = true,	-- Three of Immortality
	[128719] = true,	-- Two of Immortality
	[128720] = true,	-- Ace of Immortality
	[128721] = true,	-- Eight of Promises
	[128722] = true,	-- Seven of Promises
	[128723] = true,	-- Six of Promises
	[128724] = true,	-- Five of Promises
	[128725] = true,	-- Four of Promises
	[128726] = true,	-- Three of Promises
	[128727] = true,	-- Two of Promises
	[128728] = true,	-- Ace of Promises
	[128729] = true,	-- Eight of Dominion
	[128730] = true,	-- Seven of Dominion
	[128731] = true,	-- Six of Dominion
	[128732] = true,	-- Five of Dominion
	[128733] = true,	-- Four of Dominion
	[128734] = true,	-- Three of Dominion
	[128735] = true,	-- Two of Dominion
	[128736] = true,	-- Ace of Dominion
	[128737] = true,	-- Eight of Hellfire
	[128738] = true,	-- Seven of Hellfire
	[128739] = true,	-- Six of Hellfire
	[128740] = true,	-- Five of Hellfire
	[128741] = true,	-- Four of Hellfire
	[128742] = true,	-- Three of Hellfire
	[128743] = true,	-- Two of Hellfire
	[128744] = true,	-- Ace of Hellfire
}