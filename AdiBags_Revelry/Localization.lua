--[[
AdiBags - Revelry! v0.9k [5.12.2017]
"Add filters for holidays to AdiBags."
]]--

local AddonName, AddonTable = ...
AddonTable.L = {}
local L = AddonTable.L
local locale = GetLocale()

-------------------- enUS Default---------------------
-- Name and Description
	L["Revelry!"] = true
	L["Add filters for holidays to AdiBags."] = true
	L["This is a work in progress and not all holidays are currently supported. Stay posted for updates as missing holidays come around."] = true
	L[""] = true
	L[" "] = true
-- Holidays
	L["Holidays"] = true
	L["Noblegarden"] = true
	L["Children's Week"] = true
	L["Midsummer Fire Festival"] = true
	L["Fire Festival"] = true
	L["Pirates' Day"] = true
	L["Brewfest"] = true
	L["Day of the Dead"] = true
-- Micro-Holidays
	L["Micro-Holidays"] = true
	L["Call of the Scarab"] = true
	L["Hatching of the Hippogryphs"] = true
	L["Un'Goro Madness"] = true
	L["March of the Tadpoles"] = true
	L["Glowcap Festival"] = true
	L["Thousand Boat Bash"] = true
	L["Kirin Tor Tavern Crawl"] = true
	L["Tavern Crawl"] = true
-- Darkmoon Faire
	L["Darkmoon Faire"] = true
	L["Playing Cards"] = true
-- Headers
	L["AdiBags - Revelry! v0.9k"] = true
	L["AdiBags - Revelry! v0.9k - Holidays"] = true
	L["AdiBags - Revelry! v0.9k - Darkmoon Faire"] = true
	L["Provides filters for holidays."] = true
	L["Provides filters for holidays and micro-holidays."] = true
	L["Provides filters for the Darkmoon Faire."] = true
	L["Configure your filters in more detail below.\n\n|cffff7700Remember, any toggled 'Merge' settings will override holiday names.\n|r"] = true
	L["Configure your filters in more detail below.\n\n|cffff7700If toggled, Darkmoon Faire items will be grouped into their own separate section (otherwise they will be merged or ignored, depending upon your other selections).\n|r"] = true
-- Core Options
	L["Options"] = true
	L["Select All"] = true
	L["Toggle all holiday filters (including micro-holidays and the Darkmoon Faire)."] = true
	L["Toggle all Darkmoon Faire filters."] = true
	L["Festive Mug"] = true
	L["Include your Festive Mug in your holiday filters."] = true
	L["Merge..."] = true
	L["... Holidays"] = true
	L["... Micro-Holidays"] = true
	L["... Everything!"] = true
	L["Combine all holiday filters under one header."] = true
	L["Combine all micro-holiday filters under one header."] = true
	L["Combine all filters under a single heading."] = true
-- Holiday Options
	L["Toggle all filters for this holiday."] = true
	L["Toggle all micro-holiday filters."] = true
	L["Tokens"] = true
	L["Items"] = true
	L["Arms"] = true
	L["Attire"] = true
	L["Food & Drink"] = true
	L["Booze"] = true
	L["Recipes"] = true
	L["Mounts"] = true
	L["Pets"] = true
	L["Toys"] = true
-- Holiday Option Descriptions
	L["Filter items and equipment for this holiday."] = true
	L["Filter items and equipment for this micro-holiday."] = true
	L["Include filters for weapons and cosmetic accoutrements unique to this holiday."] = true
	L["Include filters for clothing and cosmetic attire unique to this holiday."] = true
	L["Include filters for holiday fare."] = true
	L["Include filters for recipes."] = true
	L["Include filters for mounts."] = true
	L["Include filters for pets."] = true
	L["Include filters for toys."] = true
-- Children's Week Options
	L["Bad Example"] = true
	L["Include items needed to complete:\n• |cffffff00Bad Example|r"] = true
-- Midsummer Fire Festival Options
	L["Bag of Smorc Ingredients"] = true
	L["Include |cffc79c6eBag of Smorc Ingredients|r in your Fire Festival filters."] = true
-- Brewfest Options
	L["Include tokens used to purchase unique items and equipment during Brewfest."] = true
	L['"Brew of the Month" Club'] = true
	L['If this is toggled, items for the |cff4d85e6"Brew of the Month" Club|r will be sorted into their own section.'] = true
	L["Brew of the Month"] = true
	L['Filter items and brews for the |cff4d85e6"Brew of the Month" Club|r.'] = true
	L["Include items needed to complete:\n• |cffffff00The Brewfest Diet|r"] = true
	L["Strange Brew"] = true
	L["Include items needed to complete:\n• |cffffff00Strange Brew|r"] = true
	L["Brews"] = true
	L["Include filters for special Brewfest beverages."] = true
	L["Hops"] = true
	L["Include any Brewfest Hops in your filters."] = true
-- Darkmoon Faire Options
	L["Key Items"] = true
	L["Achievements"] = true
	L["Professions"] = true
	L["Gear"] = true
	L["Collections"] = true
	L["Miscellaneous"] = true
	L["Adventurer's Guide"] = true
	L["Game Tokens"] = true
	L["Ride Tickets"] = true
	L["Daggermaw"] = true
	L["Quest Items"] = true
	L["Darkmoon Adventurer"] = true
	L["Fairegoer's Feast"] = true
	L["Taking the Show on the Road"] = true
	L["Faire Favors"] = true
	L["Craft Goods"] = true
	L["Fishing"] = true
	L["Vanity Items"] = true
	L["Prizes"] = true
	L["Fortunes"] = true
-- Darkmoon Faire Descriptions
	L["Include the |cffe2a6caDarkmoon Adventurer's Guide|r."] = true
	L["Include tokens for games at the Darkmoon Faire."] = true
	L["Include tickets for rides at the Darkmoon Faire."] = true
	L["Include Darkmoon Daggermaw."] = true
	L["Include items needed to complete important quests at the Darkmoon Faire."] = true
	L["Include items needed to complete:\n• |cffffff00Darkmoon Defender|r\n• |cffffff00Darkmoon Dungeoneer|r\n• |cffffff00Darkmoon Despoiler|r"] = true
	L["Include items needed to complete:\n• |cffffff00Fairegoer's Feast|r"] = true
	L["Include items needed to complete:\n• |cffffff00Taking the Show on the Road|r"] = true
	L["Include items used for profession-based quests at the Darkmoon Faire."] = true
	L["Include reagents like Coarse Thread or Simple Flour, which are needed for profession-based quests at the Darkmoon Faire."] = true
	L["Include crates and containers that can be fished from the waters around Darkmoon Island."] = true
	L["Include weapons and cosmetic accoutrements found at the Darkmoon Faire."] = true
	L["Include clothing and cosmetic attire found at the Darkmoon Faire."] = true
	L["Include vanity items that can be purchased or won at the Darkmoon Faire."] = true
	L["Include mounts that can be found on Darkmoon Island."] = true
	L["Include pets found on or around Darkmoon Island."] = true
	L["Include toys found on or around Darkmoon Island."] = true
	L["Include prize containers that can be won at the Darkmoon Faire."] = true
	L["Include Sayge's fortunes in your Darkmoon Faire filters."] = true
-- Playing Cards
	L["Darkmoon Faire - Playing Cards"] = true
	L["Toggle all decks."] = true
	L["Completed decks from all expansions, except Warlords, can be turned in to |cffcc9900Professor Thaddeus Paleo|r at the Darkmoon Faire. Additionally, |cffc942fdLast Deck of Nemelex Xobeh|r has been included in this section for aesthetic purposes.\n"] = true
	L["Decks"] = true
	L["Separate Filter"] = true
	L["If this is toggled, playing cards will be sorted into their own section."] = true
	L["Last Deck of Nemelex Xobeh"] = true
	L["Include |cffc942fdLast Deck of Nemelex Xobeh|r with your playing card filters."] = true
	L["Vanilla"] = EXPANSION_NAME0
	L["• |cffc942fdBeasts|r\n• |cffc942fdElementals|r\n• |cffc942fdPortals|r\n• |cffc942fdWarlords|r\n"] = true
	L["The Burning Crusade"] = EXPANSION_NAME1
	L["• |cffc942fdBlessings|r\n• |cffc942fdFuries|r\n• |cffc942fdLunacy|r\n• |cffc942fdPrisms|r\n• |cffc942fdStorms|r\n"] = true
	L["Wrath of the Lich King"] = EXPANSION_NAME2
	L["• |cffc942fdChaos|r\n• |cffc942fdNobles|r\n• |cffc942fdUndeath|r\n"] = true
	L["Cataclysm"] = EXPANSION_NAME3
	L["• |cffc942fdEarthquake|r\n• |cffc942fdHurricane|r\n• |cffc942fdTsunami|r\n• |cffc942fdVolcanic|r\n"] = true
	L["Mists of Pandaria"] = EXPANSION_NAME4
	L["• |cffc942fdCrane|r\n• |cffc942fdOx|r\n• |cffc942fdSerpent|r\n• |cffc942fdTiger|r\n"] = true
	L["Warlords of Draenor"] = EXPANSION_NAME5
	L["• |cffc942fdIron|r\n• |cffc942fdMoon|r\n• |cffc942fdVisions|r\n• |cffc942fdWar|r\n"] = true
	L["Legion"] = EXPANSION_NAME6
	L["• |cffc942fdDominion|r\n• |cffc942fdHellfire|r\n• |cffc942fdImmortality|r\n• |cffc942fdPromises|r\n"] = true

--- CURRENTLY LOOKING FOR TRANSLATION CONTRIBUTORS ---
------------------------ frFR ------------------------
if locale == "frFR" then
-- Name and Description
	L["Revelry!"] = "Festivités!"
	L["Add filters for holidays to AdiBags."] = "Ajouter des filtres pour les fêtes à AdiBags."
	L["This is a work in progress and not all holidays are currently supported. Stay posted for updates as missing holidays come around."] = "Il s'agit d'un travail en cours et toutes les fêtes ne sont pas prises en charge actuellement. Restez postés pour les mises à jour car les fêtes manquantes se déroulent."
	L[""] = true
	L[" "] = true
-- Holidays
	L["Holidays"] = "Fêtes"
	L["Noblegarden"] = "Le Jardin des nobles"
	L["Children's Week"] = "Semaine des enfants"
	L["Midsummer Fire Festival"] = "Fête du Feu du solstice d'été"
	L["Fire Festival"] = "Fête du feu"
	L["Pirates' Day"] = "Jour des pirates"
	L["Brewfest"] = "Fête des Brasseurs"
	L["Day of the Dead"] = "Jour des morts"
-- Micro-Holidays
	L["Micro-Holidays"] = "Jours de congé"
	L["Call of the Scarab"] = "Appel du Scarabée"
	L["Hatching of the Hippogryphs"] = "Appel du Scarabée"
	L["Un'Goro Madness"] = "Paléon’Goro"
	L["March of the Tadpoles"] = "Marche des têtards"
	L["Glowcap Festival"] = "Fête des chapeluisants"
	L["Thousand Boat Bash"] = "Embarquement pour les Mille pointes"
	L["Kirin Tor Tavern Crawl"] = "Tournée des tavernes du Kirin Tor"
	L["Tavern Crawl"] = "Tournée des tavernes"
-- Darkmoon Faire
	L["Darkmoon Faire"] = "Foire de Sombrelune"
	L["Playing Cards"] = "Cartes à jouer"
-- Headers
	L["AdiBags - Revelry! v0.9k"] = "AdiBags - Festivités! v0.9k"
	L["AdiBags - Revelry! v0.9k - Holidays"] = "AdiBags - Festivités! v0.9k - Fêtes"
	L["AdiBags - Revelry! v0.9k - Darkmoon Faire"] = "AdiBags - Revelry! v0.9k - Foire de Sombrelune"
	L["Provides filters for holidays."] = "Fournit des filtres pour les fêtes."
	L["Provides filters for holidays and micro-holidays."] = "Fournit des filtres pour les fêtes et les jours de congé."
	L["Provides filters for the Darkmoon Faire."] = "Fournit des filtres pour la Foire de Sombrelune."
	L["Configure your filters in more detail below.\n\n|cffff7700Remember, any toggled 'Merge' settings will override holiday names.\n|r"] = "Configurez vos filtres plus en détail ci-dessous.\n\n|cffff7700N'oubliez pas que tous les paramètres de 'Fusion' que vous avez choisis annuleront les noms des fêtes.\n|r"
	L["Configure your filters in more detail below.\n\n|cffff7700If toggled, Darkmoon Faire items will be grouped into their own separate section (otherwise they will be merged or ignored, depending upon your other selections).\n|r"] = "Configurez vos filtres plus en détail ci-dessous.\n\n|cffff7700Si sélectionné, les éléments de la Foire de Sombrelune seront regroupés dans leur section distincte (sinon ils seront fusionnés ou ignorés, selon vos autres sélections).\n|r"
-- Core Options
	L["Options"] = "Les Options"
	L["Select All"] = "Tout sélectionner"
	L["Toggle all holiday filters (including micro-holidays and the Darkmoon Faire)."] = "Basculer tous les filtres de fêtes (y compris les jour de congé et la Foire de Sombrelune)."
	L["Toggle all Darkmoon Faire filters."] = "Basculer tous les filtres pour la Foire de Sombrelune."
	L["Festive Mug"] = "Chope de fête"
	L["Include your Festive Mug in your holiday filters."] = "Incluez votre chope de fête dans vos filtres."
	L["Merge..."] = "Fusionner..."
	L["... Holidays"] = "... les fêtes"
	L["... Micro-Holidays"] = "... les jours de congé."
	L["... Everything!"] = "... tout!"
	L["Combine all holiday filters under one header."] = "Combinez tous les filtres pour les fêtes dans une section distincte."
	L["Combine all micro-holiday filters under one header."] = "Combinez tous les filtres pour les jours de congé dans une section distincte."
	L["Combine all filters under a single heading."] = "Combinez tous les filtres dans une seule section."
-- Holiday Options
	L["Toggle all filters for this holiday."] = "Basculez tous les filtres pour cette fête."
	L["Toggle all micro-holiday filters."] = "Basculez tous les filtres pour les jours de congé."
	L["Tokens"] = "Jetons"
	L["Items"] = "Objets"
	L["Arms"] = "Armes"
	L["Attire"] = "Vêtements"
	L["Food & Drink"] = "Nourriture et Boissons"
	L["Booze"] = "Tises"
	L["Recipes"] = "Recettes"
	L["Mounts"] = "Montures"
	L["Pets"] = "Mascottes"
	L["Toys"] = "Jouets"
-- Holiday Option Descriptions
	L["Filter items and equipment for this holiday."] = "Filtrer les éléments et les équipements pour cette fête."
	L["Filter items and equipment for this micro-holiday."] = "Filtrer les éléments et les équipements pour ce jour de congé."
	L["Include filters for weapons and cosmetic accoutrements unique to this holiday."] = "Inclure des filtres pour les armes et les accessoires cosmétiques propres à cette fête."
	L["Include filters for clothing and cosmetic attire unique to this holiday."] = "Inclure des filtres pour les vêtements et habillement cosmétique unique à cette fête."
	L["Include filters for holiday fare."] = "Inclure des filtres pour les comestibles festive."
	L["Include filters for recipes."] = "Inclure des filtres pour les recettes."
	L["Include filters for mounts."] = "Inclure des filtres pour les montures."
	L["Include filters for pets."] = "Inclure des filtres pour les mascottes."
	L["Include filters for toys."] = "Inclure des filtres pour les jouets."
-- Children's Week Options
	L["Bad Example"] = "Montrer le mauvais exemple"
	L["Include items needed to complete:\n• |cffffff00Bad Example|r"] = "Inclure les éléments nécessaires pour compléter:\n• |cffffff00Montrer le mauvais exemple|r"
-- Midsummer Fire Festival Options
	L["Bag of Smorc Ingredients"] = "Sac d'ingrédients de s'morc"
	L["Include |cffc79c6eBag of Smorc Ingredients|r in your Fire Festival filters."] = "Inclure |cffc79c6eSac d'ingrédients de s'morc|r dans vos filtres pour la Fête du Feu."
-- Brewfest Options
	L["Include tokens used to purchase unique items and equipment during Brewfest."] = "Inclure les jetons utilisés pour acheter des objets et des équipements uniques pendant la Fête des Brasseurs."
	L['"Brew of the Month" Club'] = "Le club de la Bière du mois"
	L['If this is toggled, items for the |cff4d85e6"Brew of the Month" Club|r will be sorted into their own section.'] = 'Si cela est basculé, les éléments pour |cff4d85e6le club de la Bière du mois|r seront triés dans leur propre section.'
	L["Brew of the Month"] = "Bière du mois"
	L['Filter items and brews for the |cff4d85e6"Brew of the Month" Club|r.'] = "Filtrer les articles et les breuvages pour le |cff4d85e6club de la Bière du mois|r."
	L["Include items needed to complete:\n• |cffffff00The Brewfest Diet|r"] = "Inclure les éléments nécessaires pour compléter:\n• |cffffff00Régime de la fête des Brasseurs|r"
	L["Strange Brew"] = "Bière étrange"
	L["Include items needed to complete:\n• |cffffff00Strange Brew|r"] = "Inclure les éléments nécessaires pour compléter:\n• |cffffff00Bière étrange|r"
	L["Brews"] = "Bière"
	L["Include filters for special Brewfest beverages."] = "Inclure les filtres pour les boissons spéciales à la Fête des Brasseurs."
	L["Hops"] = "Houblon"
	L["Include any Brewfest Hops in your filters."] = "Inclure les houblons de la Fête des Brasseurs dans vos filtres."
-- Darkmoon Faire Options
	L["Key Items"] = "Objets clés"
	L["Achievements"] = "Hauts faits"
	L["Professions"] = "Métiers"
	L["Gear"] = "Équipement"
	L["Collections"] = true
	L["Miscellaneous"] = "Recueil"
	L["Adventurer's Guide"] = "Guide pratique"
	L["Game Tokens"] = "Jetons de jeu"
	L["Ride Tickets"] = "Tickets pour le manège"
	L["Daggermaw"] = "Crocs-lames"
	L["Quest Items"] = "Objets de quête"
	L["Darkmoon Adventurer"] = "Aventurier Sombrelune"
	L["Fairegoer's Feast"] = "Festin forain"
	L["Taking the Show on the Road"] = "Spectacle itinérant"
	L["Faire Favors"] = "Les faveurs de la foire"
	L["Craft Goods"] = "Biens artisanaux"
	L["Fishing"] = "La pêche"
	L["Vanity Items"] = "Objets de vanité"
	L["Prizes"] = "Prix"
	L["Fortunes"] = "Fortunes"
-- Darkmoon Faire Descriptions
	L["Include the |cffe2a6caDarkmoon Adventurer's Guide|r."] = "Inclure le |cffe2a6caGuide pratique de Sombrelune|r."
	L["Include tokens for games at the Darkmoon Faire."] = "Inclure les jetons pour les jeux à la Foire de Sombrelune."
	L["Include tickets for rides at the Darkmoon Faire."] = "Inclure les tickets pour le manège à la Foire de Sombrelune."
	L["Include Darkmoon Daggermaw."] = "Incluez crocs-lames de Sombrelune"
	L["Include items needed to complete important quests at the Darkmoon Faire."] = "Inclure les éléments nécessaires pour mener à bien les quêtes importantes à la Foire de Sombrelune."
	L["Include items needed to complete:\n• |cffffff00Darkmoon Defender|r\n• |cffffff00Darkmoon Dungeoneer|r\n• |cffffff00Darkmoon Despoiler|r"] = "Inclure les éléments nécessaires pour compléter:\n• |cffffff00Défenseur de Sombrelune|r\n• |cffffff00Écumeur de donjons de Sombrelune|r\n• |cffffff00Spoliateur de Sombrelune|r"
	L["Include items needed to complete:\n• |cffffff00Fairegoer's Feast|r"] = "Inclure les éléments nécessaires pour compléter:\n• |cffffff00Festin forain|r"
	L["Include items needed to complete:\n• |cffffff00Taking the Show on the Road|r"] = "Inclure les éléments nécessaires pour compléter:\n• |cffffff00Spectacle itinérant|r"
	L["Include items used for profession-based quests at the Darkmoon Faire."] = "Inclure les éléments utilisés pour les quêtes professionnelles à la Foire de Sombrelune."
	L["Include reagents like Coarse Thread or Simple Flour, which are needed for profession-based quests at the Darkmoon Faire."] = "Inclure des réactifs comme la bobine de fil grossier ou la farine simple, qui sont nécessaires pour les quêtes professionnelles à la Foire de Sombrelune."
	L["Include crates and containers that can be fished from the waters around Darkmoon Island."] = "Inclure des caisses et des conteneurs qui peuvent être pêchés dans les eaux autour de l'île Sombrelune."
	L["Include weapons and cosmetic accoutrements found at the Darkmoon Faire."] = "Inclure les armes et les accessoires cosmétiques trouvés à la Foire de Sombrelune."
	L["Include clothing and cosmetic attire found at the Darkmoon Faire."] = "Inclure les vêtements et habillement cosmétique trouvés à la Foire de Sombrelune."
	L["Include vanity items that can be purchased or won at the Darkmoon Faire."] = "Inclure les objets de vanité qui peuvent être achetés ou gagnés à la Foire de Sombrelune."
	L["Include mounts that can be found on Darkmoon Island."] = "Inclure les montures qui peuvent être trouvés sur l'île Sombrelune."
	L["Include pets found on or around Darkmoon Island."] = "Inclure les mascottes trouvées dans ou autour de l'île Sombrelune."
	L["Include toys found on or around Darkmoon Island."] = "Inclure les jouets trouvées dans ou autour de l'île Sombrelune."
	L["Include prize containers that can be won at the Darkmoon Faire."] = "Inclure les conteneurs de prix qui peuvent être gagnés à la Foire de Sombrelune."
	L["Include Sayge's fortunes in your Darkmoon Faire filters."] = "Incluez les fortunes de Sayge dans vos filtres de la Foire de Sombrelune."
-- Playing Cards
	L["Darkmoon Faire - Playing Cards"] = "Foire de Sombrelune - Cartes à Jouer"
	L["Toggle all decks."] = "Basculer tous les paquets."
	L["Completed decks from all expansions, except Warlords, can be turned in to |cffcc9900Professor Thaddeus Paleo|r at the Darkmoon Faire. Additionally, |cffc942fdLast Deck of Nemelex Xobeh|r has been included in this section for aesthetic purposes.\n"] = "Les paquets complétés de toutes les expansions, à l'exception de Warlords, peuvent être retournés à |cffcc9900Professeur Thaddeus Paleo|r à la Foire de Sombrelune. En outre, | cffc942fdBaroud de Nemelex Xobeh|r a été inclus dans cette section à des fins esthétiques.\n"
	L["Decks"] = "Paquets"
	L["Separate Filter"] = "Filtre séparé"
	L["If this is toggled, playing cards will be sorted into their own section."] = "Si cela est basculé, les cartes à jouer seront classées dans leur propre section."
	L["Last Deck of Nemelex Xobeh"] = "Baroud de Nemelex Xobeh"
	L["Include |cffc942fdLast Deck of Nemelex Xobeh|r with your playing card filters."] = "Inclure |cffc942fdBaroud de Nemelex Xobeh|r avec vos filtres de cartes à jouer."
	L["Vanilla"] = EXPANSION_NAME0
	L["• |cffc942fdBeasts|r\n• |cffc942fdElementals|r\n• |cffc942fdPortals|r\n• |cffc942fdWarlords|r\n"] = "• |cffc942fdFauves|r\n• |cffc942fdÉlémentaires|r\n• |cffc942fdPortails|r\n• |cffc942fdSeigneurs de guerre|r\n"
	L["The Burning Crusade"] = EXPANSION_NAME1
	L["• |cffc942fdBlessings|r\n• |cffc942fdFuries|r\n• |cffc942fdLunacy|r\n• |cffc942fdPrisms|r\n• |cffc942fdStorms|r\n"] = "• |cffc942fdBénédictions|r\n• |cffc942fdFuries|r\n• |cffc942fdDéraison|r\n• |cffc942fdPrismes|r\n• |cffc942fdOrages|r\n"
	L["Wrath of the Lich King"] = EXPANSION_NAME2
	L["• |cffc942fdChaos|r\n• |cffc942fdNobles|r\n• |cffc942fdUndeath|r\n"] = "• |cffc942fdChaos|r\n• |cffc942fdNobles|r\n• |cffc942fdNon-mort|r\n"
	L["Cataclysm"] = EXPANSION_NAME3
	L["• |cffc942fdEarthquake|r\n• |cffc942fdHurricane|r\n• |cffc942fdTsunami|r\n• |cffc942fdVolcanic|r\n"] = "• |cffc942fdSéisme|r\n• |cffc942fdOuragans|r\n• |cffc942fdTsunamis|r\n• |cffc942fdVolcans|r\n"
	L["Mists of Pandaria"] = EXPANSION_NAME4
	L["• |cffc942fdGrues|r\n• |cffc942fdBuffles|r\n• |cffc942fdSerpents|r\n• |cffc942fdTigres|r\n"] = true
	L["Warlords of Draenor"] = EXPANSION_NAME5
	L["• |cffc942fdFers|r\n• |cffc942fdLunes|r\n• |cffc942fdVisions|r\n• |cffc942fdGuerres|r\n"] = true
	L["Legion"] = EXPANSION_NAME6
	L["• |cffc942fdDomination|r\n• |cffc942fdFlammes infernales|r\n• |cffc942fdImmortalité|r\n• |cffc942fdPromesses|r\n"] = true

------------------------ deDE ------------------------
elseif locale == "deDE" then
-- Name and Description
	L["Revelry!"] = true
	L["Add filters for holidays to AdiBags."] = true
	L["This is a work in progress and not all holidays are currently supported. Stay posted for updates as missing holidays come around."] = true
	L[""] = true
	L[" "] = true
-- Holidays
	L["Holidays"] = true
	L["Noblegarden"] = true
	L["Children's Week"] = true
	L["Midsummer Fire Festival"] = true
	L["Fire Festival"] = true
	L["Pirates' Day"] = true
	L["Brewfest"] = true
	L["Day of the Dead"] = true
-- Micro-Holidays
	L["Micro-Holidays"] = true
	L["Call of the Scarab"] = true
	L["Hatching of the Hippogryphs"] = true
	L["Un'Goro Madness"] = true
	L["March of the Tadpoles"] = true
	L["Glowcap Festival"] = true
	L["Thousand Boat Bash"] = true
	L["Kirin Tor Tavern Crawl"] = true
	L["Tavern Crawl"] = true
-- Darkmoon Faire
	L["Darkmoon Faire"] = true
	L["Playing Cards"] = true
-- Headers
	L["AdiBags - Revelry! v0.9k"] = true
	L["AdiBags - Revelry! v0.9k - Holidays"] = true
	L["AdiBags - Revelry! v0.9k - Darkmoon Faire"] = true
	L["Provides filters for holidays."] = true
	L["Provides filters for holidays and micro-holidays."] = true
	L["Provides filters for the Darkmoon Faire."] = true
	L["Configure your filters in more detail below.\n\n|cffff7700Remember, any toggled 'Merge' settings will override holiday names.\n|r"] = true
	L["Configure your filters in more detail below.\n\n|cffff7700If toggled, Darkmoon Faire items will be grouped into their own separate section (otherwise they will be merged or ignored, depending upon your other selections).\n|r"] = true
-- Core Options
	L["Options"] = true
	L["Select All"] = true
	L["Toggle all holiday filters (including micro-holidays and the Darkmoon Faire)."] = true
	L["Toggle all Darkmoon Faire filters."] = true
	L["Festive Mug"] = true
	L["Include your Festive Mug in your holiday filters."] = true
	L["Merge..."] = true
	L["... Holidays"] = true
	L["... Micro-Holidays"] = true
	L["... Everything!"] = true
	L["Combine all holiday filters under one header."] = true
	L["Combine all micro-holiday filters under one header."] = true
	L["Combine all filters under a single heading."] = true
-- Holiday Options
	L["Toggle all filters for this holiday."] = true
	L["Toggle all micro-holiday filters."] = true
	L["Tokens"] = true
	L["Items"] = true
	L["Arms"] = true
	L["Attire"] = true
	L["Food & Drink"] = true
	L["Booze"] = true
	L["Recipes"] = true
	L["Mounts"] = true
	L["Pets"] = true
	L["Toys"] = true
-- Holiday Option Descriptions
	L["Filter items and equipment for this holiday."] = true
	L["Filter items and equipment for this micro-holiday."] = true
	L["Include filters for weapons and cosmetic accoutrements unique to this holiday."] = true
	L["Include filters for clothing and cosmetic attire unique to this holiday."] = true
	L["Include filters for holiday fare."] = true
	L["Include filters for recipes."] = true
	L["Include filters for mounts."] = true
	L["Include filters for pets."] = true
	L["Include filters for toys."] = true
-- Children's Week Options
	L["Bad Example"] = true
	L["Include items needed to complete:\n• |cffffff00Bad Example|r"] = true
-- Midsummer Fire Festival Options
	L["Bag of Smorc Ingredients"] = true
	L["Include |cffc79c6eBag of Smorc Ingredients|r in your Fire Festival filters."] = true
-- Brewfest Options
	L["Include tokens used to purchase unique items and equipment during Brewfest."] = true
	L['"Brew of the Month" Club'] = true
	L['If this is toggled, items for the |cff4d85e6"Brew of the Month" Club|r will be sorted into their own section.'] = true
	L["Brew of the Month"] = true
	L['Filter items and brews for the |cff4d85e6"Brew of the Month" Club|r.'] = true
	L["Include items needed to complete:\n• |cffffff00The Brewfest Diet|r"] = true
	L["Strange Brew"] = true
	L["Include items needed to complete:\n• |cffffff00Strange Brew|r"] = true
	L["Brews"] = true
	L["Include filters for special Brewfest beverages."] = true
	L["Hops"] = true
	L["Include any Brewfest Hops in your filters."] = true
-- Darkmoon Faire Options
	L["Key Items"] = true
	L["Achievements"] = true
	L["Professions"] = true
	L["Gear"] = true
	L["Collections"] = true
	L["Miscellaneous"] = true
	L["Adventurer's Guide"] = true
	L["Game Tokens"] = true
	L["Ride Tickets"] = true
	L["Daggermaw"] = true
	L["Quest Items"] = true
	L["Darkmoon Adventurer"] = true
	L["Fairegoer's Feast"] = true
	L["Taking the Show on the Road"] = true
	L["Faire Favors"] = true
	L["Craft Goods"] = true
	L["Fishing"] = true
	L["Vanity Items"] = true
	L["Prizes"] = true
	L["Fortunes"] = true
-- Darkmoon Faire Descriptions
	L["Include the |cffe2a6caDarkmoon Adventurer's Guide|r."] = true
	L["Include tokens for games at the Darkmoon Faire."] = true
	L["Include tickets for rides at the Darkmoon Faire."] = true
	L["Include Darkmoon Daggermaw."] = true
	L["Include items needed to complete important quests at the Darkmoon Faire."] = true
	L["Include items needed to complete:\n• |cffffff00Darkmoon Defender|r\n• |cffffff00Darkmoon Dungeoneer|r\n• |cffffff00Darkmoon Despoiler|r"] = true
	L["Include items needed to complete:\n• |cffffff00Fairegoer's Feast|r"] = true
	L["Include items needed to complete:\n• |cffffff00Taking the Show on the Road|r"] = true
	L["Include items used for profession-based quests at the Darkmoon Faire."] = true
	L["Include reagents like Coarse Thread or Simple Flour, which are needed for profession-based quests at the Darkmoon Faire."] = true
	L["Include crates and containers that can be fished from the waters around Darkmoon Island."] = true
	L["Include weapons and cosmetic accoutrements found at the Darkmoon Faire."] = true
	L["Include clothing and cosmetic attire found at the Darkmoon Faire."] = true
	L["Include vanity items that can be purchased or won at the Darkmoon Faire."] = true
	L["Include mounts that can be found on Darkmoon Island."] = true
	L["Include pets found on or around Darkmoon Island."] = true
	L["Include toys found on or around Darkmoon Island."] = true
	L["Include prize containers that can be won at the Darkmoon Faire."] = true
	L["Include Sayge's fortunes in your Darkmoon Faire filters."] = true
-- Playing Cards
	L["Darkmoon Faire - Playing Cards"] = true
	L["Toggle all decks."] = true
	L["Completed decks from all expansions, except Warlords, can be turned in to |cffcc9900Professor Thaddeus Paleo|r at the Darkmoon Faire. Additionally, |cffc942fdLast Deck of Nemelex Xobeh|r has been included in this section for aesthetic purposes.\n"] = true
	L["Decks"] = true
	L["Separate Filter"] = true
	L["If this is toggled, playing cards will be sorted into their own section."] = true
	L["Last Deck of Nemelex Xobeh"] = true
	L["Include |cffc942fdLast Deck of Nemelex Xobeh|r with your playing card filters."] = true
	L["Vanilla"] = EXPANSION_NAME0
	L["• |cffc942fdBeasts|r\n• |cffc942fdElementals|r\n• |cffc942fdPortals|r\n• |cffc942fdWarlords|r\n"] = true
	L["The Burning Crusade"] = EXPANSION_NAME1
	L["• |cffc942fdBlessings|r\n• |cffc942fdFuries|r\n• |cffc942fdLunacy|r\n• |cffc942fdPrisms|r\n• |cffc942fdStorms|r\n"] = true
	L["Wrath of the Lich King"] = EXPANSION_NAME2
	L["• |cffc942fdChaos|r\n• |cffc942fdNobles|r\n• |cffc942fdUndeath|r\n"] = true
	L["Cataclysm"] = EXPANSION_NAME3
	L["• |cffc942fdEarthquake|r\n• |cffc942fdHurricane|r\n• |cffc942fdTsunami|r\n• |cffc942fdVolcanic|r\n"] = true
	L["Mists of Pandaria"] = EXPANSION_NAME4
	L["• |cffc942fdCrane|r\n• |cffc942fdOx|r\n• |cffc942fdSerpent|r\n• |cffc942fdTiger|r\n"] = true
	L["Warlords of Draenor"] = EXPANSION_NAME5
	L["• |cffc942fdIron|r\n• |cffc942fdMoon|r\n• |cffc942fdVisions|r\n• |cffc942fdWar|r\n"] = true
	L["Legion"] = EXPANSION_NAME6
	L["• |cffc942fdDominion|r\n• |cffc942fdHellfire|r\n• |cffc942fdImmortality|r\n• |cffc942fdPromises|r\n"] = true

------------------------ esMX ------------------------
elseif locale == "esMX" then
-- Name and Description
	L["Revelry!"] = true
	L["Add filters for holidays to AdiBags."] = true
	L["This is a work in progress and not all holidays are currently supported. Stay posted for updates as missing holidays come around."] = true
	L[""] = true
	L[" "] = true
-- Holidays
	L["Holidays"] = true
	L["Noblegarden"] = true
	L["Children's Week"] = true
	L["Midsummer Fire Festival"] = true
	L["Fire Festival"] = true
	L["Pirates' Day"] = true
	L["Brewfest"] = true
	L["Day of the Dead"] = true
-- Micro-Holidays
	L["Micro-Holidays"] = true
	L["Call of the Scarab"] = true
	L["Hatching of the Hippogryphs"] = true
	L["Un'Goro Madness"] = true
	L["March of the Tadpoles"] = true
	L["Glowcap Festival"] = true
	L["Thousand Boat Bash"] = true
	L["Kirin Tor Tavern Crawl"] = true
	L["Tavern Crawl"] = true
-- Darkmoon Faire
	L["Darkmoon Faire"] = true
	L["Playing Cards"] = true
-- Headers
	L["AdiBags - Revelry! v0.9k"] = true
	L["AdiBags - Revelry! v0.9k - Holidays"] = true
	L["AdiBags - Revelry! v0.9k - Darkmoon Faire"] = true
	L["Provides filters for holidays."] = true
	L["Provides filters for holidays and micro-holidays."] = true
	L["Provides filters for the Darkmoon Faire."] = true
	L["Configure your filters in more detail below.\n\n|cffff7700Remember, any toggled 'Merge' settings will override holiday names.\n|r"] = true
	L["Configure your filters in more detail below.\n\n|cffff7700If toggled, Darkmoon Faire items will be grouped into their own separate section (otherwise they will be merged or ignored, depending upon your other selections).\n|r"] = true
-- Core Options
	L["Options"] = true
	L["Select All"] = true
	L["Toggle all holiday filters (including micro-holidays and the Darkmoon Faire)."] = true
	L["Toggle all Darkmoon Faire filters."] = true
	L["Festive Mug"] = true
	L["Include your Festive Mug in your holiday filters."] = true
	L["Merge..."] = true
	L["... Holidays"] = true
	L["... Micro-Holidays"] = true
	L["... Everything!"] = true
	L["Combine all holiday filters under one header."] = true
	L["Combine all micro-holiday filters under one header."] = true
	L["Combine all filters under a single heading."] = true
-- Holiday Options
	L["Toggle all filters for this holiday."] = true
	L["Toggle all micro-holiday filters."] = true
	L["Tokens"] = true
	L["Items"] = true
	L["Arms"] = true
	L["Attire"] = true
	L["Food & Drink"] = true
	L["Booze"] = true
	L["Recipes"] = true
	L["Mounts"] = true
	L["Pets"] = true
	L["Toys"] = true
-- Holiday Option Descriptions
	L["Filter items and equipment for this holiday."] = true
	L["Filter items and equipment for this micro-holiday."] = true
	L["Include filters for weapons and cosmetic accoutrements unique to this holiday."] = true
	L["Include filters for clothing and cosmetic attire unique to this holiday."] = true
	L["Include filters for holiday fare."] = true
	L["Include filters for recipes."] = true
	L["Include filters for mounts."] = true
	L["Include filters for pets."] = true
	L["Include filters for toys."] = true
-- Children's Week Options
	L["Bad Example"] = true
	L["Include items needed to complete:\n• |cffffff00Bad Example|r"] = true
-- Midsummer Fire Festival Options
	L["Bag of Smorc Ingredients"] = true
	L["Include |cffc79c6eBag of Smorc Ingredients|r in your Fire Festival filters."] = true
-- Brewfest Options
	L["Include tokens used to purchase unique items and equipment during Brewfest."] = true
	L['"Brew of the Month" Club'] = true
	L['If this is toggled, items for the |cff4d85e6"Brew of the Month" Club|r will be sorted into their own section.'] = true
	L["Brew of the Month"] = true
	L['Filter items and brews for the |cff4d85e6"Brew of the Month" Club|r.'] = true
	L["Include items needed to complete:\n• |cffffff00The Brewfest Diet|r"] = true
	L["Strange Brew"] = true
	L["Include items needed to complete:\n• |cffffff00Strange Brew|r"] = true
	L["Brews"] = true
	L["Include filters for special Brewfest beverages."] = true
	L["Hops"] = true
	L["Include any Brewfest Hops in your filters."] = true
-- Darkmoon Faire Options
	L["Key Items"] = true
	L["Achievements"] = true
	L["Professions"] = true
	L["Gear"] = true
	L["Collections"] = true
	L["Miscellaneous"] = true
	L["Adventurer's Guide"] = true
	L["Game Tokens"] = true
	L["Ride Tickets"] = true
	L["Daggermaw"] = true
	L["Quest Items"] = true
	L["Darkmoon Adventurer"] = true
	L["Fairegoer's Feast"] = true
	L["Taking the Show on the Road"] = true
	L["Faire Favors"] = true
	L["Craft Goods"] = true
	L["Fishing"] = true
	L["Vanity Items"] = true
	L["Prizes"] = true
	L["Fortunes"] = true
-- Darkmoon Faire Descriptions
	L["Include the |cffe2a6caDarkmoon Adventurer's Guide|r."] = true
	L["Include tokens for games at the Darkmoon Faire."] = true
	L["Include tickets for rides at the Darkmoon Faire."] = true
	L["Include Darkmoon Daggermaw."] = true
	L["Include items needed to complete important quests at the Darkmoon Faire."] = true
	L["Include items needed to complete:\n• |cffffff00Darkmoon Defender|r\n• |cffffff00Darkmoon Dungeoneer|r\n• |cffffff00Darkmoon Despoiler|r"] = true
	L["Include items needed to complete:\n• |cffffff00Fairegoer's Feast|r"] = true
	L["Include items needed to complete:\n• |cffffff00Taking the Show on the Road|r"] = true
	L["Include items used for profession-based quests at the Darkmoon Faire."] = true
	L["Include reagents like Coarse Thread or Simple Flour, which are needed for profession-based quests at the Darkmoon Faire."] = true
	L["Include crates and containers that can be fished from the waters around Darkmoon Island."] = true
	L["Include weapons and cosmetic accoutrements found at the Darkmoon Faire."] = true
	L["Include clothing and cosmetic attire found at the Darkmoon Faire."] = true
	L["Include vanity items that can be purchased or won at the Darkmoon Faire."] = true
	L["Include mounts that can be found on Darkmoon Island."] = true
	L["Include pets found on or around Darkmoon Island."] = true
	L["Include toys found on or around Darkmoon Island."] = true
	L["Include prize containers that can be won at the Darkmoon Faire."] = true
	L["Include Sayge's fortunes in your Darkmoon Faire filters."] = true
-- Playing Cards
	L["Darkmoon Faire - Playing Cards"] = true
	L["Toggle all decks."] = true
	L["Completed decks from all expansions, except Warlords, can be turned in to |cffcc9900Professor Thaddeus Paleo|r at the Darkmoon Faire. Additionally, |cffc942fdLast Deck of Nemelex Xobeh|r has been included in this section for aesthetic purposes.\n"] = true
	L["Decks"] = true
	L["Separate Filter"] = true
	L["If this is toggled, playing cards will be sorted into their own section."] = true
	L["Last Deck of Nemelex Xobeh"] = true
	L["Include |cffc942fdLast Deck of Nemelex Xobeh|r with your playing card filters."] = true
	L["Vanilla"] = EXPANSION_NAME0
	L["• |cffc942fdBeasts|r\n• |cffc942fdElementals|r\n• |cffc942fdPortals|r\n• |cffc942fdWarlords|r\n"] = true
	L["The Burning Crusade"] = EXPANSION_NAME1
	L["• |cffc942fdBlessings|r\n• |cffc942fdFuries|r\n• |cffc942fdLunacy|r\n• |cffc942fdPrisms|r\n• |cffc942fdStorms|r\n"] = true
	L["Wrath of the Lich King"] = EXPANSION_NAME2
	L["• |cffc942fdChaos|r\n• |cffc942fdNobles|r\n• |cffc942fdUndeath|r\n"] = true
	L["Cataclysm"] = EXPANSION_NAME3
	L["• |cffc942fdEarthquake|r\n• |cffc942fdHurricane|r\n• |cffc942fdTsunami|r\n• |cffc942fdVolcanic|r\n"] = true
	L["Mists of Pandaria"] = EXPANSION_NAME4
	L["• |cffc942fdCrane|r\n• |cffc942fdOx|r\n• |cffc942fdSerpent|r\n• |cffc942fdTiger|r\n"] = true
	L["Warlords of Draenor"] = EXPANSION_NAME5
	L["• |cffc942fdIron|r\n• |cffc942fdMoon|r\n• |cffc942fdVisions|r\n• |cffc942fdWar|r\n"] = true
	L["Legion"] = EXPANSION_NAME6
	L["• |cffc942fdDominion|r\n• |cffc942fdHellfire|r\n• |cffc942fdImmortality|r\n• |cffc942fdPromises|r\n"] = true

------------------------ ruRU ------------------------
elseif locale == "ruRU" then
-- Name and Description
	L["Revelry!"] = true
	L["Add filters for holidays to AdiBags."] = true
	L["This is a work in progress and not all holidays are currently supported. Stay posted for updates as missing holidays come around."] = true
	L[""] = true
	L[" "] = true
-- Holidays
	L["Holidays"] = true
	L["Noblegarden"] = true
	L["Children's Week"] = true
	L["Midsummer Fire Festival"] = true
	L["Fire Festival"] = true
	L["Pirates' Day"] = true
	L["Brewfest"] = true
	L["Day of the Dead"] = true
-- Micro-Holidays
	L["Micro-Holidays"] = true
	L["Call of the Scarab"] = true
	L["Hatching of the Hippogryphs"] = true
	L["Un'Goro Madness"] = true
	L["March of the Tadpoles"] = true
	L["Glowcap Festival"] = true
	L["Thousand Boat Bash"] = true
	L["Kirin Tor Tavern Crawl"] = true
	L["Tavern Crawl"] = true
-- Darkmoon Faire
	L["Darkmoon Faire"] = true
	L["Playing Cards"] = true
-- Headers
	L["AdiBags - Revelry! v0.9k"] = true
	L["AdiBags - Revelry! v0.9k - Holidays"] = true
	L["AdiBags - Revelry! v0.9k - Darkmoon Faire"] = true
	L["Provides filters for holidays."] = true
	L["Provides filters for holidays and micro-holidays."] = true
	L["Provides filters for the Darkmoon Faire."] = true
	L["Configure your filters in more detail below.\n\n|cffff7700Remember, any toggled 'Merge' settings will override holiday names.\n|r"] = true
	L["Configure your filters in more detail below.\n\n|cffff7700If toggled, Darkmoon Faire items will be grouped into their own separate section (otherwise they will be merged or ignored, depending upon your other selections).\n|r"] = true
-- Core Options
	L["Options"] = true
	L["Select All"] = true
	L["Toggle all holiday filters (including micro-holidays and the Darkmoon Faire)."] = true
	L["Toggle all Darkmoon Faire filters."] = true
	L["Festive Mug"] = true
	L["Include your Festive Mug in your holiday filters."] = true
	L["Merge..."] = true
	L["... Holidays"] = true
	L["... Micro-Holidays"] = true
	L["... Everything!"] = true
	L["Combine all holiday filters under one header."] = true
	L["Combine all micro-holiday filters under one header."] = true
	L["Combine all filters under a single heading."] = true
-- Holiday Options
	L["Toggle all filters for this holiday."] = true
	L["Toggle all micro-holiday filters."] = true
	L["Tokens"] = true
	L["Items"] = true
	L["Arms"] = true
	L["Attire"] = true
	L["Food & Drink"] = true
	L["Booze"] = true
	L["Recipes"] = true
	L["Mounts"] = true
	L["Pets"] = true
	L["Toys"] = true
-- Holiday Option Descriptions
	L["Filter items and equipment for this holiday."] = true
	L["Filter items and equipment for this micro-holiday."] = true
	L["Include filters for weapons and cosmetic accoutrements unique to this holiday."] = true
	L["Include filters for clothing and cosmetic attire unique to this holiday."] = true
	L["Include filters for holiday fare."] = true
	L["Include filters for recipes."] = true
	L["Include filters for mounts."] = true
	L["Include filters for pets."] = true
	L["Include filters for toys."] = true
-- Children's Week Options
	L["Bad Example"] = true
	L["Include items needed to complete:\n• |cffffff00Bad Example|r"] = true
-- Midsummer Fire Festival Options
	L["Bag of Smorc Ingredients"] = true
	L["Include |cffc79c6eBag of Smorc Ingredients|r in your Fire Festival filters."] = true
-- Brewfest Options
	L["Include tokens used to purchase unique items and equipment during Brewfest."] = true
	L['"Brew of the Month" Club'] = true
	L['If this is toggled, items for the |cff4d85e6"Brew of the Month" Club|r will be sorted into their own section.'] = true
	L["Brew of the Month"] = true
	L['Filter items and brews for the |cff4d85e6"Brew of the Month" Club|r.'] = true
	L["Include items needed to complete:\n• |cffffff00The Brewfest Diet|r"] = true
	L["Strange Brew"] = true
	L["Include items needed to complete:\n• |cffffff00Strange Brew|r"] = true
	L["Brews"] = true
	L["Include filters for special Brewfest beverages."] = true
	L["Hops"] = true
	L["Include any Brewfest Hops in your filters."] = true
-- Darkmoon Faire Options
	L["Key Items"] = true
	L["Achievements"] = true
	L["Professions"] = true
	L["Gear"] = true
	L["Collections"] = true
	L["Miscellaneous"] = true
	L["Adventurer's Guide"] = true
	L["Game Tokens"] = true
	L["Ride Tickets"] = true
	L["Daggermaw"] = true
	L["Quest Items"] = true
	L["Darkmoon Adventurer"] = true
	L["Fairegoer's Feast"] = true
	L["Taking the Show on the Road"] = true
	L["Faire Favors"] = true
	L["Craft Goods"] = true
	L["Fishing"] = true
	L["Vanity Items"] = true
	L["Prizes"] = true
	L["Fortunes"] = true
-- Darkmoon Faire Descriptions
	L["Include the |cffe2a6caDarkmoon Adventurer's Guide|r."] = true
	L["Include tokens for games at the Darkmoon Faire."] = true
	L["Include tickets for rides at the Darkmoon Faire."] = true
	L["Include Darkmoon Daggermaw."] = true
	L["Include items needed to complete important quests at the Darkmoon Faire."] = true
	L["Include items needed to complete:\n• |cffffff00Darkmoon Defender|r\n• |cffffff00Darkmoon Dungeoneer|r\n• |cffffff00Darkmoon Despoiler|r"] = true
	L["Include items needed to complete:\n• |cffffff00Fairegoer's Feast|r"] = true
	L["Include items needed to complete:\n• |cffffff00Taking the Show on the Road|r"] = true
	L["Include items used for profession-based quests at the Darkmoon Faire."] = true
	L["Include reagents like Coarse Thread or Simple Flour, which are needed for profession-based quests at the Darkmoon Faire."] = true
	L["Include crates and containers that can be fished from the waters around Darkmoon Island."] = true
	L["Include weapons and cosmetic accoutrements found at the Darkmoon Faire."] = true
	L["Include clothing and cosmetic attire found at the Darkmoon Faire."] = true
	L["Include vanity items that can be purchased or won at the Darkmoon Faire."] = true
	L["Include mounts that can be found on Darkmoon Island."] = true
	L["Include pets found on or around Darkmoon Island."] = true
	L["Include toys found on or around Darkmoon Island."] = true
	L["Include prize containers that can be won at the Darkmoon Faire."] = true
	L["Include Sayge's fortunes in your Darkmoon Faire filters."] = true
-- Playing Cards
	L["Darkmoon Faire - Playing Cards"] = true
	L["Toggle all decks."] = true
	L["Completed decks from all expansions, except Warlords, can be turned in to |cffcc9900Professor Thaddeus Paleo|r at the Darkmoon Faire. Additionally, |cffc942fdLast Deck of Nemelex Xobeh|r has been included in this section for aesthetic purposes.\n"] = true
	L["Decks"] = true
	L["Separate Filter"] = true
	L["If this is toggled, playing cards will be sorted into their own section."] = true
	L["Last Deck of Nemelex Xobeh"] = true
	L["Include |cffc942fdLast Deck of Nemelex Xobeh|r with your playing card filters."] = true
	L["Vanilla"] = EXPANSION_NAME0
	L["• |cffc942fdBeasts|r\n• |cffc942fdElementals|r\n• |cffc942fdPortals|r\n• |cffc942fdWarlords|r\n"] = true
	L["The Burning Crusade"] = EXPANSION_NAME1
	L["• |cffc942fdBlessings|r\n• |cffc942fdFuries|r\n• |cffc942fdLunacy|r\n• |cffc942fdPrisms|r\n• |cffc942fdStorms|r\n"] = true
	L["Wrath of the Lich King"] = EXPANSION_NAME2
	L["• |cffc942fdChaos|r\n• |cffc942fdNobles|r\n• |cffc942fdUndeath|r\n"] = true
	L["Cataclysm"] = EXPANSION_NAME3
	L["• |cffc942fdEarthquake|r\n• |cffc942fdHurricane|r\n• |cffc942fdTsunami|r\n• |cffc942fdVolcanic|r\n"] = true
	L["Mists of Pandaria"] = EXPANSION_NAME4
	L["• |cffc942fdCrane|r\n• |cffc942fdOx|r\n• |cffc942fdSerpent|r\n• |cffc942fdTiger|r\n"] = true
	L["Warlords of Draenor"] = EXPANSION_NAME5
	L["• |cffc942fdIron|r\n• |cffc942fdMoon|r\n• |cffc942fdVisions|r\n• |cffc942fdWar|r\n"] = true
	L["Legion"] = EXPANSION_NAME6
	L["• |cffc942fdDominion|r\n• |cffc942fdHellfire|r\n• |cffc942fdImmortality|r\n• |cffc942fdPromises|r\n"] = true

------------------------ esES ------------------------
-- Name and Description
	L["Revelry!"] = true
	L["Add filters for holidays to AdiBags."] = true
	L["This is a work in progress and not all holidays are currently supported. Stay posted for updates as missing holidays come around."] = true
	L[""] = true
	L[" "] = true
-- Holidays
	L["Holidays"] = true
	L["Noblegarden"] = true
	L["Children's Week"] = true
	L["Midsummer Fire Festival"] = true
	L["Fire Festival"] = true
	L["Pirates' Day"] = true
	L["Brewfest"] = true
	L["Day of the Dead"] = true
-- Micro-Holidays
	L["Micro-Holidays"] = true
	L["Call of the Scarab"] = true
	L["Hatching of the Hippogryphs"] = true
	L["Un'Goro Madness"] = true
	L["March of the Tadpoles"] = true
	L["Glowcap Festival"] = true
	L["Thousand Boat Bash"] = true
	L["Kirin Tor Tavern Crawl"] = true
	L["Tavern Crawl"] = true
-- Darkmoon Faire
	L["Darkmoon Faire"] = true
	L["Playing Cards"] = true
-- Headers
	L["AdiBags - Revelry! v0.9k"] = true
	L["AdiBags - Revelry! v0.9k - Holidays"] = true
	L["AdiBags - Revelry! v0.9k - Darkmoon Faire"] = true
	L["Provides filters for holidays."] = true
	L["Provides filters for holidays and micro-holidays."] = true
	L["Provides filters for the Darkmoon Faire."] = true
	L["Configure your filters in more detail below.\n\n|cffff7700Remember, any toggled 'Merge' settings will override holiday names.\n|r"] = true
	L["Configure your filters in more detail below.\n\n|cffff7700If toggled, Darkmoon Faire items will be grouped into their own separate section (otherwise they will be merged or ignored, depending upon your other selections).\n|r"] = true
-- Core Options
	L["Options"] = true
	L["Select All"] = true
	L["Toggle all holiday filters (including micro-holidays and the Darkmoon Faire)."] = true
	L["Toggle all Darkmoon Faire filters."] = true
	L["Festive Mug"] = true
	L["Include your Festive Mug in your holiday filters."] = true
	L["Merge..."] = true
	L["... Holidays"] = true
	L["... Micro-Holidays"] = true
	L["... Everything!"] = true
	L["Combine all holiday filters under one header."] = true
	L["Combine all micro-holiday filters under one header."] = true
	L["Combine all filters under a single heading."] = true
-- Holiday Options
	L["Toggle all filters for this holiday."] = true
	L["Toggle all micro-holiday filters."] = true
	L["Tokens"] = true
	L["Items"] = true
	L["Arms"] = true
	L["Attire"] = true
	L["Food & Drink"] = true
	L["Booze"] = true
	L["Recipes"] = true
	L["Mounts"] = true
	L["Pets"] = true
	L["Toys"] = true
-- Holiday Option Descriptions
	L["Filter items and equipment for this holiday."] = true
	L["Filter items and equipment for this micro-holiday."] = true
	L["Include filters for weapons and cosmetic accoutrements unique to this holiday."] = true
	L["Include filters for clothing and cosmetic attire unique to this holiday."] = true
	L["Include filters for holiday fare."] = true
	L["Include filters for recipes."] = true
	L["Include filters for mounts."] = true
	L["Include filters for pets."] = true
	L["Include filters for toys."] = true
-- Children's Week Options
	L["Bad Example"] = true
	L["Include items needed to complete:\n• |cffffff00Bad Example|r"] = true
-- Midsummer Fire Festival Options
	L["Bag of Smorc Ingredients"] = true
	L["Include |cffc79c6eBag of Smorc Ingredients|r in your Fire Festival filters."] = true
-- Brewfest Options
	L["Include tokens used to purchase unique items and equipment during Brewfest."] = true
	L['"Brew of the Month" Club'] = true
	L['If this is toggled, items for the |cff4d85e6"Brew of the Month" Club|r will be sorted into their own section.'] = true
	L["Brew of the Month"] = true
	L['Filter items and brews for the |cff4d85e6"Brew of the Month" Club|r.'] = true
	L["Include items needed to complete:\n• |cffffff00The Brewfest Diet|r"] = true
	L["Strange Brew"] = true
	L["Include items needed to complete:\n• |cffffff00Strange Brew|r"] = true
	L["Brews"] = true
	L["Include filters for special Brewfest beverages."] = true
	L["Hops"] = true
	L["Include any Brewfest Hops in your filters."] = true
-- Darkmoon Faire Options
	L["Key Items"] = true
	L["Achievements"] = true
	L["Professions"] = true
	L["Gear"] = true
	L["Collections"] = true
	L["Miscellaneous"] = true
	L["Adventurer's Guide"] = true
	L["Game Tokens"] = true
	L["Ride Tickets"] = true
	L["Daggermaw"] = true
	L["Quest Items"] = true
	L["Darkmoon Adventurer"] = true
	L["Fairegoer's Feast"] = true
	L["Taking the Show on the Road"] = true
	L["Faire Favors"] = true
	L["Craft Goods"] = true
	L["Fishing"] = true
	L["Vanity Items"] = true
	L["Prizes"] = true
	L["Fortunes"] = true
-- Darkmoon Faire Descriptions
	L["Include the |cffe2a6caDarkmoon Adventurer's Guide|r."] = true
	L["Include tokens for games at the Darkmoon Faire."] = true
	L["Include tickets for rides at the Darkmoon Faire."] = true
	L["Include Darkmoon Daggermaw."] = true
	L["Include items needed to complete important quests at the Darkmoon Faire."] = true
	L["Include items needed to complete:\n• |cffffff00Darkmoon Defender|r\n• |cffffff00Darkmoon Dungeoneer|r\n• |cffffff00Darkmoon Despoiler|r"] = true
	L["Include items needed to complete:\n• |cffffff00Fairegoer's Feast|r"] = true
	L["Include items needed to complete:\n• |cffffff00Taking the Show on the Road|r"] = true
	L["Include items used for profession-based quests at the Darkmoon Faire."] = true
	L["Include reagents like Coarse Thread or Simple Flour, which are needed for profession-based quests at the Darkmoon Faire."] = true
	L["Include crates and containers that can be fished from the waters around Darkmoon Island."] = true
	L["Include weapons and cosmetic accoutrements found at the Darkmoon Faire."] = true
	L["Include clothing and cosmetic attire found at the Darkmoon Faire."] = true
	L["Include vanity items that can be purchased or won at the Darkmoon Faire."] = true
	L["Include mounts that can be found on Darkmoon Island."] = true
	L["Include pets found on or around Darkmoon Island."] = true
	L["Include toys found on or around Darkmoon Island."] = true
	L["Include prize containers that can be won at the Darkmoon Faire."] = true
	L["Include Sayge's fortunes in your Darkmoon Faire filters."] = true
-- Playing Cards
	L["Darkmoon Faire - Playing Cards"] = true
	L["Toggle all decks."] = true
	L["Completed decks from all expansions, except Warlords, can be turned in to |cffcc9900Professor Thaddeus Paleo|r at the Darkmoon Faire. Additionally, |cffc942fdLast Deck of Nemelex Xobeh|r has been included in this section for aesthetic purposes.\n"] = true
	L["Decks"] = true
	L["Separate Filter"] = true
	L["If this is toggled, playing cards will be sorted into their own section."] = true
	L["Last Deck of Nemelex Xobeh"] = true
	L["Include |cffc942fdLast Deck of Nemelex Xobeh|r with your playing card filters."] = true
	L["Vanilla"] = EXPANSION_NAME0
	L["• |cffc942fdBeasts|r\n• |cffc942fdElementals|r\n• |cffc942fdPortals|r\n• |cffc942fdWarlords|r\n"] = true
	L["The Burning Crusade"] = EXPANSION_NAME1
	L["• |cffc942fdBlessings|r\n• |cffc942fdFuries|r\n• |cffc942fdLunacy|r\n• |cffc942fdPrisms|r\n• |cffc942fdStorms|r\n"] = true
	L["Wrath of the Lich King"] = EXPANSION_NAME2
	L["• |cffc942fdChaos|r\n• |cffc942fdNobles|r\n• |cffc942fdUndeath|r\n"] = true
	L["Cataclysm"] = EXPANSION_NAME3
	L["• |cffc942fdEarthquake|r\n• |cffc942fdHurricane|r\n• |cffc942fdTsunami|r\n• |cffc942fdVolcanic|r\n"] = true
	L["Mists of Pandaria"] = EXPANSION_NAME4
	L["• |cffc942fdCrane|r\n• |cffc942fdOx|r\n• |cffc942fdSerpent|r\n• |cffc942fdTiger|r\n"] = true
	L["Warlords of Draenor"] = EXPANSION_NAME5
	L["• |cffc942fdIron|r\n• |cffc942fdMoon|r\n• |cffc942fdVisions|r\n• |cffc942fdWar|r\n"] = true
	L["Legion"] = EXPANSION_NAME6
	L["• |cffc942fdDominion|r\n• |cffc942fdHellfire|r\n• |cffc942fdImmortality|r\n• |cffc942fdPromises|r\n"] = true

------------------------ zhTW ------------------------
elseif locale == "zhTW" then
-- Name and Description
	L["Revelry!"] = true
	L["Add filters for holidays to AdiBags."] = true
	L["This is a work in progress and not all holidays are currently supported. Stay posted for updates as missing holidays come around."] = true
	L[""] = true
	L[" "] = true
-- Holidays
	L["Holidays"] = true
	L["Noblegarden"] = true
	L["Children's Week"] = true
	L["Midsummer Fire Festival"] = true
	L["Fire Festival"] = true
	L["Pirates' Day"] = true
	L["Brewfest"] = true
	L["Day of the Dead"] = true
-- Micro-Holidays
	L["Micro-Holidays"] = true
	L["Call of the Scarab"] = true
	L["Hatching of the Hippogryphs"] = true
	L["Un'Goro Madness"] = true
	L["March of the Tadpoles"] = true
	L["Glowcap Festival"] = true
	L["Thousand Boat Bash"] = true
	L["Kirin Tor Tavern Crawl"] = true
	L["Tavern Crawl"] = true
-- Darkmoon Faire
	L["Darkmoon Faire"] = true
	L["Playing Cards"] = true
-- Headers
	L["AdiBags - Revelry! v0.9k"] = true
	L["AdiBags - Revelry! v0.9k - Holidays"] = true
	L["AdiBags - Revelry! v0.9k - Darkmoon Faire"] = true
	L["Provides filters for holidays."] = true
	L["Provides filters for holidays and micro-holidays."] = true
	L["Provides filters for the Darkmoon Faire."] = true
	L["Configure your filters in more detail below.\n\n|cffff7700Remember, any toggled 'Merge' settings will override holiday names.\n|r"] = true
	L["Configure your filters in more detail below.\n\n|cffff7700If toggled, Darkmoon Faire items will be grouped into their own separate section (otherwise they will be merged or ignored, depending upon your other selections).\n|r"] = true
-- Core Options
	L["Options"] = true
	L["Select All"] = true
	L["Toggle all holiday filters (including micro-holidays and the Darkmoon Faire)."] = true
	L["Toggle all Darkmoon Faire filters."] = true
	L["Festive Mug"] = true
	L["Include your Festive Mug in your holiday filters."] = true
	L["Merge..."] = true
	L["... Holidays"] = true
	L["... Micro-Holidays"] = true
	L["... Everything!"] = true
	L["Combine all holiday filters under one header."] = true
	L["Combine all micro-holiday filters under one header."] = true
	L["Combine all filters under a single heading."] = true
-- Holiday Options
	L["Toggle all filters for this holiday."] = true
	L["Toggle all micro-holiday filters."] = true
	L["Tokens"] = true
	L["Items"] = true
	L["Arms"] = true
	L["Attire"] = true
	L["Food & Drink"] = true
	L["Booze"] = true
	L["Recipes"] = true
	L["Mounts"] = true
	L["Pets"] = true
	L["Toys"] = true
-- Holiday Option Descriptions
	L["Filter items and equipment for this holiday."] = true
	L["Filter items and equipment for this micro-holiday."] = true
	L["Include filters for weapons and cosmetic accoutrements unique to this holiday."] = true
	L["Include filters for clothing and cosmetic attire unique to this holiday."] = true
	L["Include filters for holiday fare."] = true
	L["Include filters for recipes."] = true
	L["Include filters for mounts."] = true
	L["Include filters for pets."] = true
	L["Include filters for toys."] = true
-- Children's Week Options
	L["Bad Example"] = true
	L["Include items needed to complete:\n• |cffffff00Bad Example|r"] = true
-- Midsummer Fire Festival Options
	L["Bag of Smorc Ingredients"] = true
	L["Include |cffc79c6eBag of Smorc Ingredients|r in your Fire Festival filters."] = true
-- Brewfest Options
	L["Include tokens used to purchase unique items and equipment during Brewfest."] = true
	L['"Brew of the Month" Club'] = true
	L['If this is toggled, items for the |cff4d85e6"Brew of the Month" Club|r will be sorted into their own section.'] = true
	L["Brew of the Month"] = true
	L['Filter items and brews for the |cff4d85e6"Brew of the Month" Club|r.'] = true
	L["Include items needed to complete:\n• |cffffff00The Brewfest Diet|r"] = true
	L["Strange Brew"] = true
	L["Include items needed to complete:\n• |cffffff00Strange Brew|r"] = true
	L["Brews"] = true
	L["Include filters for special Brewfest beverages."] = true
	L["Hops"] = true
	L["Include any Brewfest Hops in your filters."] = true
-- Darkmoon Faire Options
	L["Key Items"] = true
	L["Achievements"] = true
	L["Professions"] = true
	L["Gear"] = true
	L["Collections"] = true
	L["Miscellaneous"] = true
	L["Adventurer's Guide"] = true
	L["Game Tokens"] = true
	L["Ride Tickets"] = true
	L["Daggermaw"] = true
	L["Quest Items"] = true
	L["Darkmoon Adventurer"] = true
	L["Fairegoer's Feast"] = true
	L["Taking the Show on the Road"] = true
	L["Faire Favors"] = true
	L["Craft Goods"] = true
	L["Fishing"] = true
	L["Vanity Items"] = true
	L["Prizes"] = true
	L["Fortunes"] = true
-- Darkmoon Faire Descriptions
	L["Include the |cffe2a6caDarkmoon Adventurer's Guide|r."] = true
	L["Include tokens for games at the Darkmoon Faire."] = true
	L["Include tickets for rides at the Darkmoon Faire."] = true
	L["Include Darkmoon Daggermaw."] = true
	L["Include items needed to complete important quests at the Darkmoon Faire."] = true
	L["Include items needed to complete:\n• |cffffff00Darkmoon Defender|r\n• |cffffff00Darkmoon Dungeoneer|r\n• |cffffff00Darkmoon Despoiler|r"] = true
	L["Include items needed to complete:\n• |cffffff00Fairegoer's Feast|r"] = true
	L["Include items needed to complete:\n• |cffffff00Taking the Show on the Road|r"] = true
	L["Include items used for profession-based quests at the Darkmoon Faire."] = true
	L["Include reagents like Coarse Thread or Simple Flour, which are needed for profession-based quests at the Darkmoon Faire."] = true
	L["Include crates and containers that can be fished from the waters around Darkmoon Island."] = true
	L["Include weapons and cosmetic accoutrements found at the Darkmoon Faire."] = true
	L["Include clothing and cosmetic attire found at the Darkmoon Faire."] = true
	L["Include vanity items that can be purchased or won at the Darkmoon Faire."] = true
	L["Include mounts that can be found on Darkmoon Island."] = true
	L["Include pets found on or around Darkmoon Island."] = true
	L["Include toys found on or around Darkmoon Island."] = true
	L["Include prize containers that can be won at the Darkmoon Faire."] = true
	L["Include Sayge's fortunes in your Darkmoon Faire filters."] = true
-- Playing Cards
	L["Darkmoon Faire - Playing Cards"] = true
	L["Toggle all decks."] = true
	L["Completed decks from all expansions, except Warlords, can be turned in to |cffcc9900Professor Thaddeus Paleo|r at the Darkmoon Faire. Additionally, |cffc942fdLast Deck of Nemelex Xobeh|r has been included in this section for aesthetic purposes.\n"] = true
	L["Decks"] = true
	L["Separate Filter"] = true
	L["If this is toggled, playing cards will be sorted into their own section."] = true
	L["Last Deck of Nemelex Xobeh"] = true
	L["Include |cffc942fdLast Deck of Nemelex Xobeh|r with your playing card filters."] = true
	L["Vanilla"] = EXPANSION_NAME0
	L["• |cffc942fdBeasts|r\n• |cffc942fdElementals|r\n• |cffc942fdPortals|r\n• |cffc942fdWarlords|r\n"] = true
	L["The Burning Crusade"] = EXPANSION_NAME1
	L["• |cffc942fdBlessings|r\n• |cffc942fdFuries|r\n• |cffc942fdLunacy|r\n• |cffc942fdPrisms|r\n• |cffc942fdStorms|r\n"] = true
	L["Wrath of the Lich King"] = EXPANSION_NAME2
	L["• |cffc942fdChaos|r\n• |cffc942fdNobles|r\n• |cffc942fdUndeath|r\n"] = true
	L["Cataclysm"] = EXPANSION_NAME3
	L["• |cffc942fdEarthquake|r\n• |cffc942fdHurricane|r\n• |cffc942fdTsunami|r\n• |cffc942fdVolcanic|r\n"] = true
	L["Mists of Pandaria"] = EXPANSION_NAME4
	L["• |cffc942fdCrane|r\n• |cffc942fdOx|r\n• |cffc942fdSerpent|r\n• |cffc942fdTiger|r\n"] = true
	L["Warlords of Draenor"] = EXPANSION_NAME5
	L["• |cffc942fdIron|r\n• |cffc942fdMoon|r\n• |cffc942fdVisions|r\n• |cffc942fdWar|r\n"] = true
	L["Legion"] = EXPANSION_NAME6
	L["• |cffc942fdDominion|r\n• |cffc942fdHellfire|r\n• |cffc942fdImmortality|r\n• |cffc942fdPromises|r\n"] = true

------------------------ zhCN ------------------------
elseif locale == "zhCN" then
-- Name and Description
	L["Revelry!"] = true
	L["Add filters for holidays to AdiBags."] = true
	L["This is a work in progress and not all holidays are currently supported. Stay posted for updates as missing holidays come around."] = true
	L[""] = true
	L[" "] = true
-- Holidays
	L["Holidays"] = true
	L["Noblegarden"] = true
	L["Children's Week"] = true
	L["Midsummer Fire Festival"] = true
	L["Fire Festival"] = true
	L["Pirates' Day"] = true
	L["Brewfest"] = true
	L["Day of the Dead"] = true
-- Micro-Holidays
	L["Micro-Holidays"] = true
	L["Call of the Scarab"] = true
	L["Hatching of the Hippogryphs"] = true
	L["Un'Goro Madness"] = true
	L["March of the Tadpoles"] = true
	L["Glowcap Festival"] = true
	L["Thousand Boat Bash"] = true
	L["Kirin Tor Tavern Crawl"] = true
	L["Tavern Crawl"] = true
-- Darkmoon Faire
	L["Darkmoon Faire"] = true
	L["Playing Cards"] = true
-- Headers
	L["AdiBags - Revelry! v0.9k"] = true
	L["AdiBags - Revelry! v0.9k - Holidays"] = true
	L["AdiBags - Revelry! v0.9k - Darkmoon Faire"] = true
	L["Provides filters for holidays."] = true
	L["Provides filters for holidays and micro-holidays."] = true
	L["Provides filters for the Darkmoon Faire."] = true
	L["Configure your filters in more detail below.\n\n|cffff7700Remember, any toggled 'Merge' settings will override holiday names.\n|r"] = true
	L["Configure your filters in more detail below.\n\n|cffff7700If toggled, Darkmoon Faire items will be grouped into their own separate section (otherwise they will be merged or ignored, depending upon your other selections).\n|r"] = true
-- Core Options
	L["Options"] = true
	L["Select All"] = true
	L["Toggle all holiday filters (including micro-holidays and the Darkmoon Faire)."] = true
	L["Toggle all Darkmoon Faire filters."] = true
	L["Festive Mug"] = true
	L["Include your Festive Mug in your holiday filters."] = true
	L["Merge..."] = true
	L["... Holidays"] = true
	L["... Micro-Holidays"] = true
	L["... Everything!"] = true
	L["Combine all holiday filters under one header."] = true
	L["Combine all micro-holiday filters under one header."] = true
	L["Combine all filters under a single heading."] = true
-- Holiday Options
	L["Toggle all filters for this holiday."] = true
	L["Toggle all micro-holiday filters."] = true
	L["Tokens"] = true
	L["Items"] = true
	L["Arms"] = true
	L["Attire"] = true
	L["Food & Drink"] = true
	L["Booze"] = true
	L["Recipes"] = true
	L["Mounts"] = true
	L["Pets"] = true
	L["Toys"] = true
-- Holiday Option Descriptions
	L["Filter items and equipment for this holiday."] = true
	L["Filter items and equipment for this micro-holiday."] = true
	L["Include filters for weapons and cosmetic accoutrements unique to this holiday."] = true
	L["Include filters for clothing and cosmetic attire unique to this holiday."] = true
	L["Include filters for holiday fare."] = true
	L["Include filters for recipes."] = true
	L["Include filters for mounts."] = true
	L["Include filters for pets."] = true
	L["Include filters for toys."] = true
-- Children's Week Options
	L["Bad Example"] = true
	L["Include items needed to complete:\n• |cffffff00Bad Example|r"] = true
-- Midsummer Fire Festival Options
	L["Bag of Smorc Ingredients"] = true
	L["Include |cffc79c6eBag of Smorc Ingredients|r in your Fire Festival filters."] = true
-- Brewfest Options
	L["Include tokens used to purchase unique items and equipment during Brewfest."] = true
	L['"Brew of the Month" Club'] = true
	L['If this is toggled, items for the |cff4d85e6"Brew of the Month" Club|r will be sorted into their own section.'] = true
	L["Brew of the Month"] = true
	L['Filter items and brews for the |cff4d85e6"Brew of the Month" Club|r.'] = true
	L["Include items needed to complete:\n• |cffffff00The Brewfest Diet|r"] = true
	L["Strange Brew"] = true
	L["Include items needed to complete:\n• |cffffff00Strange Brew|r"] = true
	L["Brews"] = true
	L["Include filters for special Brewfest beverages."] = true
	L["Hops"] = true
	L["Include any Brewfest Hops in your filters."] = true
-- Darkmoon Faire Options
	L["Key Items"] = true
	L["Achievements"] = true
	L["Professions"] = true
	L["Gear"] = true
	L["Collections"] = true
	L["Miscellaneous"] = true
	L["Adventurer's Guide"] = true
	L["Game Tokens"] = true
	L["Ride Tickets"] = true
	L["Daggermaw"] = true
	L["Quest Items"] = true
	L["Darkmoon Adventurer"] = true
	L["Fairegoer's Feast"] = true
	L["Taking the Show on the Road"] = true
	L["Faire Favors"] = true
	L["Craft Goods"] = true
	L["Fishing"] = true
	L["Vanity Items"] = true
	L["Prizes"] = true
	L["Fortunes"] = true
-- Darkmoon Faire Descriptions
	L["Include the |cffe2a6caDarkmoon Adventurer's Guide|r."] = true
	L["Include tokens for games at the Darkmoon Faire."] = true
	L["Include tickets for rides at the Darkmoon Faire."] = true
	L["Include Darkmoon Daggermaw."] = true
	L["Include items needed to complete important quests at the Darkmoon Faire."] = true
	L["Include items needed to complete:\n• |cffffff00Darkmoon Defender|r\n• |cffffff00Darkmoon Dungeoneer|r\n• |cffffff00Darkmoon Despoiler|r"] = true
	L["Include items needed to complete:\n• |cffffff00Fairegoer's Feast|r"] = true
	L["Include items needed to complete:\n• |cffffff00Taking the Show on the Road|r"] = true
	L["Include items used for profession-based quests at the Darkmoon Faire."] = true
	L["Include reagents like Coarse Thread or Simple Flour, which are needed for profession-based quests at the Darkmoon Faire."] = true
	L["Include crates and containers that can be fished from the waters around Darkmoon Island."] = true
	L["Include weapons and cosmetic accoutrements found at the Darkmoon Faire."] = true
	L["Include clothing and cosmetic attire found at the Darkmoon Faire."] = true
	L["Include vanity items that can be purchased or won at the Darkmoon Faire."] = true
	L["Include mounts that can be found on Darkmoon Island."] = true
	L["Include pets found on or around Darkmoon Island."] = true
	L["Include toys found on or around Darkmoon Island."] = true
	L["Include prize containers that can be won at the Darkmoon Faire."] = true
	L["Include Sayge's fortunes in your Darkmoon Faire filters."] = true
-- Playing Cards
	L["Darkmoon Faire - Playing Cards"] = true
	L["Toggle all decks."] = true
	L["Completed decks from all expansions, except Warlords, can be turned in to |cffcc9900Professor Thaddeus Paleo|r at the Darkmoon Faire. Additionally, |cffc942fdLast Deck of Nemelex Xobeh|r has been included in this section for aesthetic purposes.\n"] = true
	L["Decks"] = true
	L["Separate Filter"] = true
	L["If this is toggled, playing cards will be sorted into their own section."] = true
	L["Last Deck of Nemelex Xobeh"] = true
	L["Include |cffc942fdLast Deck of Nemelex Xobeh|r with your playing card filters."] = true
	L["Vanilla"] = EXPANSION_NAME0
	L["• |cffc942fdBeasts|r\n• |cffc942fdElementals|r\n• |cffc942fdPortals|r\n• |cffc942fdWarlords|r\n"] = true
	L["The Burning Crusade"] = EXPANSION_NAME1
	L["• |cffc942fdBlessings|r\n• |cffc942fdFuries|r\n• |cffc942fdLunacy|r\n• |cffc942fdPrisms|r\n• |cffc942fdStorms|r\n"] = true
	L["Wrath of the Lich King"] = EXPANSION_NAME2
	L["• |cffc942fdChaos|r\n• |cffc942fdNobles|r\n• |cffc942fdUndeath|r\n"] = true
	L["Cataclysm"] = EXPANSION_NAME3
	L["• |cffc942fdEarthquake|r\n• |cffc942fdHurricane|r\n• |cffc942fdTsunami|r\n• |cffc942fdVolcanic|r\n"] = true
	L["Mists of Pandaria"] = EXPANSION_NAME4
	L["• |cffc942fdCrane|r\n• |cffc942fdOx|r\n• |cffc942fdSerpent|r\n• |cffc942fdTiger|r\n"] = true
	L["Warlords of Draenor"] = EXPANSION_NAME5
	L["• |cffc942fdIron|r\n• |cffc942fdMoon|r\n• |cffc942fdVisions|r\n• |cffc942fdWar|r\n"] = true
	L["Legion"] = EXPANSION_NAME6
	L["• |cffc942fdDominion|r\n• |cffc942fdHellfire|r\n• |cffc942fdImmortality|r\n• |cffc942fdPromises|r\n"] = true

------------------------ koKR ------------------------
----------- Contributed by: yuk6196@Curse ------------
elseif locale == "koKR" then
-- Name and Description
	L["Revelry!"] = true
	L["Add filters for holidays to AdiBags."] = "AdiBags에 축제를 위한 필터를 추가합니다."
	L["This is a work in progress and not all holidays are currently supported. Stay posted for updates as missing holidays come around."] = "이것은 아직 진행 중인 작업이며 현재 모든 축제를 지원하지 않습니다. 누락된 축제의 업데이트를 계속 확인하세요."
	L[""] = true
	L[" "] = true
-- Holidays
	L["Holidays"] = "축제"
	L["Noblegarden"] = "귀족의 정원"
	L["Children's Week"] = "어린이 주간"
	L["Midsummer Fire Festival"] = "한여름 불꽃축제"
	L["Fire Festival"] = "불꽃축제"
	L["Pirates' Day"] = "해적의 날"
	L["Brewfest"] = "가을 축제"
	L["Day of the Dead"] = "망자의 날"
-- Micro-Holidays
	L["Micro-Holidays"] = "짧은 축제"
	L["Call of the Scarab"] = "스카라베의 부름"
	L["Hatching of the Hippogryphs"] = "히포그리프 부화일"
	L["Un'Goro Madness"] = "운고로의 광기"
	L["March of the Tadpoles"] = "올챙이들의 행진"
	L["Glowcap Festival"] = "초롱버섯 축제"
	L["Thousand Boat Bash"] = "버섯구름 뱃놀이 대잔치"
	L["Kirin Tor Tavern Crawl"] = "키린 토 선술집 순례"
	L["Tavern Crawl"] = "선술집 순례"
-- Darkmoon Faire
	L["Darkmoon Faire"] = "다크문 축제"
	L["Playing Cards"] = "카드 놀이"
-- Headers
	L["AdiBags - Revelry! v0.9k"] = true
	L["AdiBags - Revelry! v0.9k - Holidays"] = "AdiBags - Revelry! v0.9k - 축제"
	L["AdiBags - Revelry! v0.9k - Darkmoon Faire"] = "AdiBags - Revelry! v0.9k - 다크문 축제"
	L["Provides filters for holidays."] = "축제와 기념일을 위한 필터를 제공합니다."
	L["Provides filters for holidays and micro-holidays."] = "축제와 기념일을 위한 필터를 제공합니다."
	L["Provides filters for the Darkmoon Faire."] = "다크문 축제를 위한 필터를 제공합니다."
	L["Configure your filters in more detail below.\n\n|cffff7700Remember, any toggled 'Merge' settings will override holiday names.\n|r"] = "아래에서 당신의 필터를 세부 설정하세요.\n\n|cffff7700'합치기' 설정을 사용하면 축제 이름을 강제 적용합니다.\n|r"
	L["Configure your filters in more detail below.\n\n|cffff7700If toggled, Darkmoon Faire items will be grouped into their own separate section (otherwise they will be merged or ignored, depending upon your other selections).\n|r"] = "아래에서 당신의 필터를 세부 설정하세요.\n\n|cffff7700선택하면 다크문 축제 아이템은 별도의 항목으로 그룹화됩니다 (그렇지 않으면 당신의 항목에 따라 병합되거나 무시됩니다).\n|r"
-- Core Options
	L["Options"] = "옵션"
	L["Select All"] = "모두 선택"
	L["Toggle all holiday filters (including micro-holidays)."] = "모든 축제 필터를 사용합니다 (짧은 축제 포함)"
	L["Toggle all Darkmoon Faire filters."] = "모든 다크문 축제 필터를 사용합니다."
	L["Festive Mug"] = "축제 잔"
	L["Include your Festive Mug in your holiday filters."] = "당신의 축제 필터에 당신의 축제 잔을 포함시킵니다."
	L["Merge..."] = "합치기..."
	L["... Holidays"] = "... 축제"
	L["... Micro-Holidays"] = "... 짧은 축제"
	L["... Everything!"] = "... 모두!"
	L["Combine all holiday filters under one header."] = "모든 축제 필터를 단일 제목 아래 결합시킵니다."
	L["Combine all micro-holiday filters under one header."] = "모든 짧은 축제 필터를 단일 제목 아래 결합시킵니다."
	L["Combine all filters under a single heading."] = "모든 필터를 단일 제목 아래 결합시킵니다."
-- Holiday Options
	L["Toggle all filters for this holiday."] = "이 축제의 모든 필터를 사용합니다."
	L["Toggle all micro-holiday filters."] = "모든 짧은 축제 필터를 사용합니다."
	L["Tokens"] = "동전"
	L["Items"] = "아이템"
	L["Arms"] = "무기"
	L["Attire"] = "의상"
	L["Food & Drink"] = "음식 & 음료"
	L["Booze"] = "술"
	L["Recipes"] = "제조법"
	L["Mounts"] = "탈것"
	L["Pets"] = "애완동물"
	L["Toys"] = "장난감"
-- Holiday Option Descriptions
	L["Filter items and equipment for this holiday."] = "이 휴일을위한 항목 및 장비 필터링."
	L["Filter items and equipment for this micro-holiday."] = "짧은 축제를 위한 아이템과 장비를 선별합니다."
	L["Include filters for weapons and cosmetic accoutrements unique to this holiday."] = "이 축제의 고유한 무기와 미용 용품을 선별하는 필터를 포함시킵니다."
	L["Include filters for clothing and cosmetic attire unique to this holiday."] = "이 축제의 고유한 의상과 복장을 선별하는 필터를 포함시킵니다."
	L["Include filters for holiday fare."] = "축제일 음식을 위한 필터를 포함시킵니다."
	L["Include filters for recipes."] = "제조법을 위한 필터를 포함시킵니다."	
	L["Include filters for mounts."] = "탈것을 위한 필터를 포함시킵니다."
	L["Include filters for pets."] = "애완동물을 위한 필터를 포함시킵니다."
	L["Include filters for toys."] = "장난감을 위한 필터를 포함시킵니다."
-- Children's Week Options
	L["Bad Example"] = "나쁜 본보기"
	L["Include items needed to complete:\n• |cffffff00Bad Example|r"] = "다음을 완료하기 위해 필요한 아이템을 포함시킵니다:\n• |cffffff00나쁜 본보기|r"
-- Midsummer Fire Festival Options
	L["Bag of Smorc Ingredients"] = "스모크 재료 주머니"
	L["Include |cffc79c6eBag of Smorc Ingredients|r in your Fire Festival filters."] = "당신의 불꽃축제 필터에 |cffc79c6e스모크 재료 주머니|r를 포함시킵니다."
-- Brewfest Options
    L["Include tokens used to purchase unique items and equipment during Brewfest."] = "가을 축제 동안 고유 아이템과 장비를 구입하는데 사용하는 동전을 포함시킵니다."
    L['"Brew of the Month" Club'] = '"맥주 사랑" 동호회'
	L['If this is toggled, items for the |cff4d85e6"Brew of the Month" Club|r will be sorted into their own section.'] = '활성화하면 |cff4d85e6"맥주 사랑" 동호회|r 관련 아이템이 개별 항목으로 정렬됩니다.'
	L["Brew of the Month"] = "맥주 사랑"
    L['Filter items and brews for the |cff85ff85"Brew of the Month"|r Club.'] = '|cff85ff85"맥주 사랑"|r 동호회의 아이템과 맥주를 선별합니다.'
    L["Include items needed to complete:\n• |cffffff00The Brewfest Diet|r"] = "다음을 완료하기 위해 필요한 아이템을 포함시킵니다:\n? |cffffff00가을 축제 건강 식단|r"
    L["Strange Brew"] = "이상한 맥주"
    L["Include items needed to complete:\n• |cffffff00Strange Brew|r"] = "다음을 완료하기 위해 필요한 아이템을 포함시킵니다:\n? |cffffff00이상한 맥주|r"
    L["Brews"] = "맥주"
    L["Include filters for special Brewfest beverages."] = "특별한 가을 축제 음료를 위한 필터를 포함시킵니다."
    L["Hops"] = "홉"
    L["Include any Brewfest Hops in your filters."] = "당신의 필터에 모든 가을 축제 홉을 포함시킵니다."
-- Darkmoon Faire Options
	L["Key Items"] = "핵심 아이템"
	L["Achievements"] = "업적"
	L["Professions"] = "전문기술"
	L["Gear"] = "장비"
	L["Collections"] = "수집품"
	L["Miscellaneous"] = "기타"
	L["Adventurer's Guide"] = "모험가 도감"
	L["Game Tokens"] = "게임 동전"
	L["Ride Tickets"] = "탑승권"
	L["Daggermaw"] = "비수아귀"
	L["Quest Items"] = "퀘스트 아이템"
	L["Darkmoon Adventurer"] = "다크문 모험가"
	L["Fairegoer's Feast"] = "다크문도 식후경"
	L["Taking the Show on the Road"] = "순회공연"
	L["Faire Favors"] = "축제 도우미"
	L["Craft Goods"] = "제작 재료"
	L["Fishing"] = "낚시"
	L["Vanity Items"] = "허영 아이템"
	L["Prizes"] = "상품"
	L["Fortunes"] = "점괘"	
-- Darkmoon Faire Descriptions
	L["Include the |cffe2a6caDarkmoon Adventurer's Guide|r."] = "|cffe2a6ca다크문 모험가 도감|r을 포함시킵니다."	
	L["Include tokens for games at the Darkmoon Faire."] = "다크문 축제에 게임 동전을 포함시킵니다."	
	L["Include tickets for rides at the Darkmoon Faire."] = "다크문 축제에 탑승권을 포함시킵니다."	
	L["Include Darkmoon Daggermaw."] = "다크문 비수아귀를 포함시킵니다."	
	L["Include items needed to complete important quests at the Darkmoon Faire."] = "다크문 축제에 주요 퀘스트를 완료하기 위해 필요한 아이템을 포함시킵니다."	
	L["Include items needed to complete:\n• |cffffff00Darkmoon Defender|r\n• |cffffff00Darkmoon Dungeoneer|r\n• |cffffff00Darkmoon Despoiler|r"] = "다음을 완료하기 위해 필요한 아이템을 포함시킵니다:\n• |cffffff00다크문 수호자|r\n• |cffffff00다크문 던전 탐험가|r\n• |cffffff00다크문 강탈자|r"	
	L["Include items needed to complete:\n• |cffffff00Fairegoer's Feast|r"] = "다음을 완료하기 위해 필요한 아이템을 포함시킵니다:\n• |cffffff00다크문도 식후경|r"	
	L["Include items needed to complete:\n• |cffffff00Taking the Show on the Road|r"] = "다음을 완료하기 위해 필요한 아이템을 포함시킵니다:\n• |cffffff00순회공연|r"
	L["Include items used for profession-based quests at the Darkmoon Faire."] = "다크문 축제에 전문기술 기반 퀘스트에 사용되는 아이템을 포함시킵니다."
	L["Include reagents like Coarse Thread or Simple Flour, which are needed for profession-based quests at the Darkmoon Faire."] = "다크문 축제에서 전문기술 기반 퀘스트에 필요한 굵은 실타래나 밀가루 포대같은 재료를 포함시킵니다."
	L["Include crates and containers that can be fished from the waters around Darkmoon Island."] = "다크문 섬 주변의 물에서 낚을 수 있는 상자와 보관함을 포함시킵니다."
	L["Include weapons and cosmetic accoutrements found at the Darkmoon Faire."] = "다크문 축제에서 발견한 무기와 미용 용품을 포함시킵니다."
	L["Include clothing and cosmetic attire found at the Darkmoon Faire."] = "다크문 축제에서 발견한 의상과 복장을 포함시킵니다."
	L["Include vanity items that can be purchased or won at the Darkmoon Faire."] = "다크문 축제에서 구입하거나 획득할 수 있는 허영 아이템을 포함시킵니다."
	L["Include mounts that can be found on Darkmoon Island."] = "다크문 섬에서 발견할 수 있는 탈것을 포함시킵니다."
	L["Include pets found on or around Darkmoon Island."] = "다크문 섬 또는 그 주변에서 발견할 수 있는 애완동물을 포함시킵니다. "
	L["Include toys found on or around Darkmoon Island."] = "다크문 섬 또는 그 주변에서 발견할 수 있는 장난감을 포함시킵니다."
	L["Include prize containers that can be won at the Darkmoon Faire."] = "다크문 축제에서 획득할 수 있는 상품 보관함을 포함시킵니다."
	L["Include Sayge's fortunes in your Darkmoon Faire filters."] = "당신의 다크문 축제 필터에 세이지의 점괘를 포함시킵니다."
-- Playing Cards
    L["Darkmoon Faire - Playing Cards"] = "다크문 축제 - 카드 놀이"
    L["Toggle all decks."] = "모든 카드 한 벌 사용 전환"
    L["Completed decks from all expansions, except Warlords, can be turned in to |cffcc9900Professor Thaddeus Paleo|r at the Darkmoon Faire. Additionally, |cffc942fdLast Deck of Nemelex Xobeh|r has been included in this section for aesthetic purposes.\n"] = "다크문 축제의 |cffcc9900학자 타데우스 팔레오|r에게 반납할 수 있는 전쟁군주를 제외한 모든 확장팩의 완성된 카드 한 벌입니다. 추가로 미적 목적을 위해 |cffc942fd네멜렉스 조베의 마지막 카드 한 벌|r도 이 항목에 포함됩니다.\n"
    L["Decks"] = "카드 한 벌"
    L["Separate Filter"] = "필터 분리"
    L["If this is toggled, playing cards will be sorted into their own section."] = "활성화하면 카드 놀이가 개별 항목으로 정렬됩니다."
    L["Last Deck of Nemelex Xobeh"] = "네멜렉스 조베의 마지막 카드 한 벌"
    L["Include |cffc942fdLast Deck of Nemelex Xobeh|r with your playing card filters."] = "당신의 카드 놀이 필터에 |cffc942fd네멜렉스 조베의 마지막 카드 한 벌|r을 포함시킵니다."
    L["Vanilla"] = "오리지널"
    L["• |cffc942fdBeasts|r\n• |cffc942fdElementals|r\n• |cffc942fdPortals|r\n• |cffc942fdWarlords|r\n"] = "• |cffc942fd야수|r\n• |cffc942fd정령|r\n• |cffc942fd차원문|r\n• |cffc942fd대장군|r\n"
    L["The Burning Crusade"] = "불타는 성전"
    L["• |cffc942fdBlessings|r\n• |cffc942fdFuries|r\n• |cffc942fdLunacy|r\n• |cffc942fdPrisms|r\n• |cffc942fdStorms|r\n"] = "• |cffc942fd축복|r\n• |cffc942fd원한|r\n• |cffc942fd열광|r\n• |cffc942fd프리즘|r\n• |cffc942fd폭풍|r\n"
    L["Wrath of the Lich King"] = "리치 왕의 분노"
    L["• |cffc942fdChaos|r\n• |cffc942fdNobles|r\n• |cffc942fdUndeath|r\n"] = "• |cffc942fd혼돈|r\n• |cffc942fd귀족|r\n• |cffc942fd불사|r\n"
    L["Cataclysm"] = "대격변"
    L["• |cffc942fdEarthquake|r\n• |cffc942fdHurricane|r\n• |cffc942fdTsunami|r\n• |cffc942fdVolcanic|r\n"] = "• |cffc942fd지진|r\n• |cffc942fd싹쓸바람|r\n• |cffc942fd지진해일|r\n• |cffc942fd화산|r\n"
    L["Mists of Pandaria"] = "판다리아의 안개"
    L["• |cffc942fdCrane|r\n• |cffc942fdOx|r\n• |cffc942fdSerpent|r\n• |cffc942fdTiger|r\n"] = "• |cffc942fd학|r\n• |cffc942fd소|r\n• |cffc942fd용|r\n• |cffc942fd호랑이|r\n"
    L["Warlords of Draenor"] = "드레노어의 전쟁군주"
    L["• |cffc942fdIron|r\n• |cffc942fdMoon|r\n• |cffc942fdVisions|r\n• |cffc942fdWar|r\n"] = "• |cffc942fd강철|r\n• |cffc942fd달|r\n• |cffc942fd환영|r\n• |cffc942fd전쟁|r\n"
    L["Legion"] = "군단"
    L["• |cffc942fdDominion|r\n• |cffc942fdHellfire|r\n• |cffc942fdImmortality|r\n• |cffc942fdPromises|r\n"] = "• |cffc942fd지배|r\n• |cffc942fd지옥불|r\n• |cffc942fd불멸|r\n• |cffc942fd약속|r\n"
end

-- Replace remaining true values by their key
for k,v in pairs(L) do
	if v == true then
		L[k] = k
	end
end
