--[[
	Autor e Tradutor para Português do Brasil: Canettieri
--]]

local _, L = ...;
if GetLocale() == "ptBR" then
------ Professions pack
--- Profissions
L["alchemy"] = "Alquimia"
L["archaeology"] = "Arqueologia"
L["blacksmithing"] = "Ferraria"
L["cooking"] = "Culinária"
L["enchanting"] = "Encantamento"
L["engineering"] = "Engenharia"
L["firstAid"] = "Primeiros Socorros"
L["fishing"] = "Pesca"
L["herbalism"] = "Herborismo"
L["herbalismskills"] = "Perícias de Herborismo"
L["inscription"] = "Escrivania"
L["jewelcrafting"] = "Joalheria"
L["leatherworking"] = "Couraria"
L["mining"] = "Mineração"
L["miningskills"] = "Perícia em Mineração"
L["skinning"] = "Esfolamento"
L["skinningskills"] = "Habilidades em Esfolamento"
L["tailoring"] = "Alfaiataria"
--- Master
L["masterPlayer"] = "|cFFFFFFFFExibindo todas profissões de ${player}|cFFFFFFFF.|r"
L["masterTutorialBar"] = "|cFF69FF69Passe o cursor aqui! :)|r"
L["masterTutorial"] = TitanUtils_GetHighlightText("\r[INTRODUÇÃO]").."\r\rEste plugin tem a função de resumir todas suas profissões\rem um único lugar. Diferentemente dos plugins avulsos,\reste exibirá TUDO nesta tooltip.\r\r"..TitanUtils_GetHighlightText("[COMO USAR]").."\r\rPara começar, clique com o botão direito no plugin e\rselecione a opção"..TitanUtils_GetHighlightText(" 'Esconder Tutorial'")..".\r\rVocê poderá coloca-lo no canto direito do Painel Titan\rpara ficar ainda mais agradável visualmente!"
L["hideTutorial"] = "Esconder Tutorial"
L["masterHint"] = "|cFFB4EEB4Dica:|r |cFFFFFFFFClique esquerdo abre a janela da profissão nº1\re com o botão do meio abre a janela da profissão nº2.|r\r\r"
L["primprof"] = "Mostrar Profissões Primárias"
L["bar"] = "Barra"

------ Reagents pack
--- Achaeology (default)
L["ready"] = "|cFF69FF69Pronto!  "
L["archfragments"] = "Fragmentos de Arqueologia"
L["fragments"] = "Fragmentos"
L["fragtooltip"] = "|cFFB4EEB4Dica:|r |cFFFFFFFFClique com o botão direito no\rplugin e escolha quais fragmentos\rserão mostrados na barra.|r\r"
L["hidehint"] = "Esconder Dica"
L["displaynofrag"] = "Exibir Raças Sem Fragmentos"
L["inprog"] = "\rEm progresso:"
L["nofragments"] = "Sem fragmentos"
L["tooltip"] = "Texto de Ajuda"
L["noarchaeology"] = "|cFFFF2e2eVocê ainda não aprendeu arqueologia\rou não tem fragmentos.|r\r\rVá ao treinador mais próximo para aprender\rou visite um campo de escavação."
--- Enchanting
L["arkhana"] = "|cFFFFFFFFArkhana|r"
L["leylight"] = "|cff0070ddEstilhaço de Luz Meridiana|r"
L["chaosCrystal"] = "|cffa335eeCristal do Caos|r"
--- Fishing
L["mackerel"] = "|cFFFFFFFFCavala Prateada|r"
L["queenfish"] = "|cFFFFFFFFPeixe-rainha Amaldiçoado|r"
L["salmon"] = "|cFFFFFFFFSalmão Altamontês|r"
L["mossgill"] = "|cFFFFFFFFNinho de Pinalimo|r"
L["stormray"] = "|cFFFFFFFFTrovarraia|r"
L["koi"] = "|cFFFFFFFFCarpa escama rúnica|r"
L["barracuda"] = "|cFFFFFFFFBarracuda Negra|r"
--- Herbalism
L["yseralline"] = "|cFFFFFFFFSemente de Yseralina|r"
L["felwort"] = "|cff1eff00Maltevil|r"
L["starlight"] = "|cFFFFFFFFRosa-da-luz-estelar|r"
L["fjarn"] = "|cFFFFFFFFFjarnskaggl|r"
L["foxflower"] = "|cFFFFFFFFFlor-de-raposa|r"
L["dreamleaf"] = "|cFFFFFFFFFolha-de-sonho|r"
L["aethril"] = "|cFFFFFFFFAethril|r"
--- Mining
L["leystone"] = "|cFFFFFFFFMinério de Pedra de Meridiano|r"
L["felslate"] = "|cFFFFFFFFVilardósia|r"
L["brimstone"] = "|cff1eff00Enxofre Infernal|r"
L["blood"] = "|cff0070ddSangue de Sargeras|r"
--- Skinning
L["stormscale"] = "|cFFFFFFFFEscamarraio|r"
L["stonehide"] = "|cFFFFFFFFCouro Pétreo|r"
L["felhide"] = "|cff1eff00Couro Vil|r"
L["tooth"] = "|cFFFFFFFFDente Inteiro|r"
L["claw"] = "|cFFFFFFFFGarra Inteira|r"
--- Tailoring
L["shaldorei"] = "|cFFFFFFFFSeda Shal'dorei|r"
L["silkweave"] = "|cFFFFFFFFTramasseda Imbuída|r"

------ Shared with one or more
--- Shared
L["hint"] = "|cFFB4EEB4Dica:|r |cFFFFFFFFClique para abrir a janela da\rprofissão.|r\r\r"
L["maximum"] = "Máx"
L["noprof"] = "Não aprendido"
L["bonus"] = "(Bônus)"
L["hidemax"] = "Esconder Valores Máximos"
L["session"] = "|rAprendido na sessão: "
L["noskill"] = "|cFFFF2e2eVocê não aprendeu esta profissão ainda.|r\r\rVá ao treinador mais próximo para aprende-la.\rSe precisar, poderá esquecer qualquer profissão primária."
L["nosecskill"] = "|cFFFF2e2eVocê não aprendeu esta profissão ainda.|r\r\rVá ao treinador mais próximo para aprende-la."
L["showbb"] = "Exibir Saldo da Sessão na Barra"
L["simpleb"] = "Bônus Simplificado"
L["craftsmanship"] = "\rPerícia: "
L["goodwith"] = "\r\r"..TitanUtils_GetHighlightText("[Combina com]").."\r"
L["info"] = TitanUtils_GetHighlightText("[Informações]")
L["maxskill"] = "|rVocê chegou ao potencial máximo!"
L["warning"] = "\r\r|cFFFF2e2e[Atenção!]|r\rVocê chegou ao máximo de perícia e\rnão está aprendendo mais! Vá a um\rtreinador ou aprenda a perícia local."
L["maxtext"] = "\r|rMáximo atual (sem bônus): "
L["totalbag"] = "Total na Bolsa: "
L["totalbank"] = "Total no Banco: "
L["reagents"] = "Reagentes"
L["noreagent"] = "Você ainda não obteve\rnenhum destes reagentes."
L["hide"] = "Esconder"
end
