--ScrapMaster by BilisOnyxia (admin@bilisonyxia.com) All Rights Reserved--


ScrapMaster = LibStub("AceAddon-3.0"):NewAddon("ScrapMaster", "AceEvent-3.0")
local scrapMaster = ScrapMaster;
local AddonVersion = GetAddOnMetadata("ScrapMaster", "Version");
local scrapMasterDB = {}
local scrapMasterResultsDB = {}
local scrapQueue = {}
local frame = CreateFrame("frame")
CreateFrame("button","ScrapMasterButton",nil,"SecureActionButtonTemplate")
local scrapMasterButton = ScrapMasterButton;

local function Initialize()
	scrapMasterDB = ScrapMasterDB or {}
	scrapMasterResultsDB = ScrapMasterResultsDB or {}
end


frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("SCRAPPING_MACHINE_SHOW")
frame:RegisterEvent("SCRAPPING_MACHINE_CLOSE")

local function updateGainedItemsData(gainedItems, newlyGainedItems)
	for kn,vn in pairs(newlyGainedItems) do
		local recordExists = false
		for ko,vo in pairs(gainedItems) do
			if(vn.itemID == vo.itemID) then -- there already exists a record for this material, adding new data to the existing record
				recordExists = true
				vo.amount = vo.amount + vn.amount
				break
			end
		end
		if(not recordExists) then
			table.insert(gainedItems, vn)
		end
	end
end

local function getItemDetails(itemLink)
	local _,_,itemRarity, itemLevel = GetItemInfo(itemLink)
	local itemID = tonumber(string.match(itemLink, "Hitem:(%d+):"))
	local itemName = string.match(itemLink, "\|h.(.*)\]\|h\|r")
	return itemRarity, itemLevel, itemID, itemName
end

local function saveResult(scrapResult)
	if(scrapResult.gainedItems[1] == nil) then --there is no data on gained items, return
		return
	end
	for k,v in pairs(scrapMasterResultsDB) do 
		if(v.itemLink == scrapResult.itemLink) then -- item is already in the DB, adding results to it		
			v.numberScrapped = v.numberScrapped + 1;
			updateGainedItemsData(v.gainedItems, scrapResult.gainedItems)
			return
		end 
	end	
	local newItem = {["itemName"] = scrapResult.itemName, ["itemID"] = scrapResult.itemID, ["itemLevel"] = scrapResult.itemLevel, ["itemRarity"] = scrapResult.itemRarity, ["itemLink"] = scrapResult.itemLink, ["numberScrapped"] = 1, ["gainedItems"] =  {}} -- item is not in the DB yet, adding it
	updateGainedItemsData(newItem.gainedItems, scrapResult.gainedItems)
	table.insert(scrapMasterResultsDB, newItem)
	ScrapMasterResultsDB = scrapMasterResultsDB
end

local function isScrappingMaterial(itemID)
	local scrappingMaterials = {152512, 152579, 152513, 152541, 153050, 154164, 153051, 154722, 152542, 154165, 152576, 152577, 158378, 153706, 154121, 154125, 154120, 154122, 154124, 154123, 153701, 153705, 153700, 153702, 153704, 153703, 152875, 152876, 152877, 158187, 158188, 158189, 152510, 152511, 152509, 152506, 152508, 152505, 152507, 152668, 162460, 162461, 3371, 39354, 160059, 11291, 160298, 18567, 159959, 163569, 160502}
	for k, v in ipairs(scrappingMaterials) do
		if(v==itemID) then
			return true
		end
	end
	return false
end

frame:SetScript("OnEvent",function(self,event,...)
	if (... == "ScrapMaster") then
		frame:UnregisterEvent("ADDON_LOADED")
		Initialize()
	elseif event == "CHAT_MSG_LOOT" then
        local lootmessage = ...
		local itemID = tonumber(string.match(lootmessage, "Hitem:(%d+):"))
		if(not isScrappingMaterial(itemID)) then -- ignore CHAT_MSG_LOOT for items that cannot come from the scrapper
			return
		end
		local lootQuantity = string.match(lootmessage, "\]\|h\|rx(.*)\.") or 1          
		local itemLink = string.match(lootmessage, "(\|.*\|h\|r)")
		table.insert(scrapQueue[1].gainedItems, {["itemID"] = itemID, ["itemLink"] = itemLink,  amount = lootQuantity})
	elseif event == "UNIT_SPELLCAST_SUCCEEDED" then
        local unitTag, spellName, rank, lineID, spellID = ...
		if(unitTag == "player" and rank == 265742) then
			if(table.getn(scrapQueue) >= 2) then -- we are done scrapping the second item in the queue, so we should have recorded all results for the first item in the queue by now, so we can remove it from the queue
				saveResult(scrapQueue[1])
				table.remove(scrapQueue, 1)					
			end
		end
	elseif event == "UNIT_SPELLCAST_START" then
		local unitTag, spellName, rank, lineID, spellID = ...
		if(unitTag == "player" and rank == 265742) then	
			local bag, slot = 0,0
			local pending = nil
			for i=0,8 do
				pending = C_ScrappingMachineUI.GetCurrentPendingScrapItemLocationByIndex(i)
				if(pending) then
					bag = pending.bagID
					slot = pending.slotIndex
					break
				end
			end
			if(not pending) then --no pending item found, return
				return 
			end
			local texture, itemCount, locked, quality, readable, lootable, itemLink = GetContainerItemInfo(bag,slot)
			local itemRarity, itemLevel, itemID, itemName = getItemDetails(itemLink)
			local currentItem = {itemID = 0, itemLevel = 0, itemRarity = 0, itemLink = "", itemName = "", gainedItems =  {}}
			currentItem.itemRarity = itemRarity
			currentItem.itemName = itemName
			currentItem.itemID = itemID
			currentItem.itemLevel = itemLevel
			currentItem.itemLink = itemLink
			
			table.insert(scrapQueue, currentItem)
		end
		--265742
	elseif event == "UNIT_SPELLCAST_INTERRUPTED" then
		local unitTag, spellName, rank, lineID, spellID = ...
		if(unitTag == "player" and rank == 265742) then
			if(table.getn(scrapQueue) >= 1 and scrapQueue[1].gainedItems[1]) then -- there are results that still need to be recorded
				saveResult(scrapQueue[1])		
			end
			scrapQueue = {}	
		end	
	elseif event == "SCRAPPING_MACHINE_PENDING_ITEM_CHANGED" then
		--print("Changed!")	
	elseif event == "SCRAPPING_MACHINE_SHOW" then	--register events to track scrapping results
		frame:RegisterEvent("CHAT_MSG_LOOT")
		frame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
		frame:RegisterEvent("UNIT_SPELLCAST_START")
		frame:RegisterEvent("UNIT_SPELLCAST_INTERRUPTED")
		frame:RegisterEvent("UNIT_SPELLCAST_STOP")
		frame:RegisterEvent("SCRAPPING_MACHINE_PENDING_ITEM_CHANGED")
	elseif event == "SCRAPPING_MACHINE_CLOSE" then	--unregister events
		frame:UnregisterEvent("CHAT_MSG_LOOT")
		frame:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")
		frame:UnregisterEvent("UNIT_SPELLCAST_START")
		frame:UnregisterEvent("UNIT_SPELLCAST_INTERRUPTED")
		frame:UnregisterEvent("UNIT_SPELLCAST_STOP")
		frame:UnregisterEvent("SCRAPPING_MACHINE_PENDING_ITEM_CHANGED")
		if(table.getn(scrapQueue) >= 1 and scrapQueue[1].gainedItems[1]) then -- there are results that still need to be recorded
			saveResult(scrapQueue[1])		
		end
		scrapQueue = {}		
	end
end)

local function isIgnored(itemLink)
	local itemRarity, itemLevel, itemID, itemName = getItemDetails(itemLink)
    for k,v in pairs(scrapMasterDB) do 
		if(v.itemID == itemID and v.itemRarity == itemRarity and v.itemLevel == itemLevel and v.itemName == itemName) then 
			return true 
		end 
	end 
	return false
end

local function FillScrapper()
	if(ScrappingMachineFrame and ScrappingMachineFrame:IsShown()) then
		for bag = 0, 4 do
			for slot = 1, GetContainerNumSlots(bag) do
				local itemlink = GetContainerItemLink(bag,slot)
				if(itemlink and not isIgnored(itemlink)) then
					UseContainerItem(bag,slot)
				end
			end
		end
	end
end

local function resetIgnoreList()
	scrapMasterDB = {}
	ScrapMasterDB = scrapMasterDB
	print("Ignore-List has been reset.")
end

local function removeItem(itemLink)
	local itemRarity, itemLevel, itemID, itemName = getItemDetails(itemLink)
	for k,v in pairs(scrapMasterDB) do 
		if(v.itemID == itemID and v.itemRarity == itemRarity and v.itemLevel == itemLevel and v.itemName == itemName) then
			table.remove(scrapMasterDB, k)
			ScrapMasterDB = scrapMasterDB
			print(itemLink .. " has been removed from the Ignore-List.")
			return
		end 
	end
	print(itemLink .. " is not on the Ignore-List.")	
end

local function addItem(itemLink)
	local itemRarity, itemLevel, itemID, itemName = getItemDetails(itemLink)
	for k,v in pairs(scrapMasterDB) do 
		if(v.itemID == itemID and v.itemRarity == itemRarity and v.itemLevel == itemLevel and v.itemName == itemName) then
			print(itemLink .. " is already on the Ignore-List.")
			return
		end 
	end
	table.insert(scrapMasterDB, {["itemID"] = itemID, ["itemLevel"] = itemLevel, ["itemRarity"] = itemRarity, ["itemLink"] = itemLink, ["itemName"] =  itemName})
	ScrapMasterDB = scrapMasterDB
	print("Added item to ignore list: " .. itemLink)
end

local function printIgnoredItems()
	if(table.getn(scrapMasterDB) > 0) then
		print("ScrapMaster Ignore-List:")
		for k,v in pairs(scrapMasterDB) do 
			print(v.itemLink)
		end 
	else
		print("ScrapMaster Ignore-List is empty.")
	end
end

local function clearData(itemLink)
	local itemRarity, itemLevel, itemID, itemName = getItemDetails(itemLink)
	local clearedData = false;
	for k,v in pairs(scrapMasterResultsDB) do
		if(v.itemID == itemID and v.itemRarity == itemRarity and v.itemLevel == itemLevel and v.itemName == itemName) then
			table.remove(scrapMasterResultsDB, k)
			ScrapMasterResultsDB = scrapMasterResultsDB
			clearedData = true
		end 
	end
	if(clearedData) then
		print("Scrapping-Stats for " .. itemLink .. " have been cleared.")
	else
		print("There are no Scrapping-Stats for " .. itemLink)
	end	
end

local function clearAllData()
	scrapMasterResultsDB = {}
	ScrapMasterResultsDB = scrapMasterResultsDB
	print("All Scrapping-Stats data has been cleared.")
end

function copy(obj, seen)
	if type(obj) ~= 'table' then 
		return obj 
	end
	if seen and seen[obj] then 
		return seen[obj] 
	end
	local s = seen or {}
	local res = setmetatable({}, getmetatable(obj))
	s[obj] = res
	for k, v in pairs(obj) do 
		res[copy(k, s)] = copy(v, s) 
	end
	return res
end

local function printStats(itemLink)
	local itemRarity, itemLevel, itemID, itemName = getItemDetails(itemLink)
	local combinedData = {}
	local totalNumberScrapped = 0;
	local tempDB = copy(scrapMasterResultsDB)
	for k,v in pairs(tempDB) do 
		if(v.itemID == itemID and v.itemRarity == itemRarity and v.itemLevel == itemLevel and string.match(v.itemLink, "\|h.(.*)\]\|h\|r") == itemName) then
			totalNumberScrapped = totalNumberScrapped + v.numberScrapped
			for kn,vn in pairs(v.gainedItems) do
				local recordExists = false
				for ko,vo in pairs(combinedData) do
					if(vn.itemID == vo.itemID) then
						recordExists = true
						vo.amount = vo.amount + vn.amount
						break
					end
				end
				if(not recordExists) then
					table.insert(combinedData, vn)
				end
			end
		end
	end
	
	--print stats for the specific version if there is data available
	if(table.getn(combinedData) >= 1) then
		print("Stats for " .. itemLink .. " (" .. totalNumberScrapped .. "):")
		for k,v in pairs(combinedData) do 
			print("\-\- " .. v.itemLink .. ": Total: " .. v.amount .. " || Per Item: " .. (floor((v.amount / totalNumberScrapped)*10^3 + 0.5 ) / 10^3) .. " | " .. (floor((v.amount * 100 / totalNumberScrapped)*10^1 + 0.5 ) / 10^1) .. "%")
		end	
	end
	combinedData = {}
	tempDB = copy(scrapMasterResultsDB)
	totalNumberScrapped = 0;
	for k,v in pairs(tempDB) do 
		if(v.itemID == itemID) then
			totalNumberScrapped = totalNumberScrapped + v.numberScrapped
			for kn,vn in pairs(v.gainedItems) do
				local recordExists = false
				for ko,vo in pairs(combinedData) do
					if(vn.itemID == vo.itemID) then
						recordExists = true
						vo.amount = vo.amount + vn.amount
						break
					end
				end
				if(not recordExists) then
					table.insert(combinedData, vn)
				end
			end
		end
	end
	if(table.getn(combinedData) >= 1) then
		--print stats for all versions if there is data available
		print("Stats for i:" .. itemID .. " (" .. totalNumberScrapped .. "):" )
		for k,v in pairs(combinedData) do 
			print("\-\- " .. v.itemLink .. ": Total: " .. v.amount .. " || Per Item: " .. (floor((v.amount / totalNumberScrapped)*10^3 + 0.5 ) / 10^3) .. " | " .. (floor((v.amount * 100 / totalNumberScrapped)*10^1 + 0.5 ) / 10^1) .. "%")
		end	
	else
		print("You have no data for this item.")
	end	
end

function scrapMaster:OnEnable()
	self:RegisterEvent("SCRAPPING_MACHINE_PENDING_ITEM_CHANGED", "ItemChanged");
	scrapMasterButton:SetAttribute("type","click");
end

function scrapMaster:ItemChanged()
	scrapMasterButton:SetAttribute("clickbutton", ScrappingMachineFrame.ScrapButton);
end

scrapMasterButton:HookScript("OnClick", function(self, arg1)
	FillScrapper()
end)

-- Slash Commands --
SLASH_SCRAPMASTERHELP1, SLASH_SCRAPMASTERHELP2, SLASH_SCRAPMASTERHELP3 = "/smhelp", "/scrapmasterhelp", "/scrapmaster"
function SlashCmdList.SCRAPMASTERHELP()
	print("ScrapMaster commands:")	
	print("/smhelp  -  Displays all commands.")
	print("/smlist  -  Prints list of ignored items.")
	print("/smadd [itemlink]  -  Adds item to Ignore-List.")
	print("/smremove [itemlink]  -  Removes item from Ignore-List.")
	print("/smreset  -  Resets the Ignore-List.")
	print("/smstats [itemlink] - Prints Scraping-Stats for the item.")
	print("/smclear [itemlink]  -  Clears all Scrapping-Stats for this item.")
	print("/smsclearall - Clears all Scrapping-Stats.")
	print("/click ScrapMasterButton  -  Fills the scrapper and clicks the scrap button.")
end

SLASH_SCRAPMASTERLIST1, SLASH_SCRAPMASTERLIST2 = '/smlist', '/scrapmasterlist';
function SlashCmdList.SCRAPMASTERLIST()
	printIgnoredItems()
end

SLASH_SCRAPMASTERADD1, SLASH_SCRAPMASTERADD2 = '/smadd', '/scrapmasteradd';
function SlashCmdList.SCRAPMASTERADD(itemLink)
	addItem(itemLink)	
end

SLASH_SCRAPMASTERREMOVE1, SLASH_SCRAPMASTERREMOVE2 = '/smremove', '/scrapmasterremove';
function SlashCmdList.SCRAPMASTERREMOVE(itemLink)
	removeItem(itemLink)	
end

SLASH_SCRAPMASTERRESET1, SLASH_SCRAPMASTERRESET2 = '/smreset', '/scrapmasterreset';
function SlashCmdList.SCRAPMASTERRESET()
	resetIgnoreList()	
end

SLASH_SCRAPMASTERSTATS1, SLASH_SCRAPMASTERSTATS2 = '/smstats', '/scrapmasterstats';
function SlashCmdList.SCRAPMASTERSTATS(itemLink)
	printStats(itemLink)	
end

SLASH_SCRAPMASTERCLEAR1, SLASH_SCRAPMASTERCLEAR2 = '/smclear', '/scrapmasterclear';
function SlashCmdList.SCRAPMASTERCLEAR(itemLink)
	clearData(itemLink)	
end

SLASH_SCRAPMASTERCLEARALL1, SLASH_SCRAPMASTERCLEARALL2 = '/smclearall', '/scrapmasterclearall';
function SlashCmdList.SCRAPMASTERCLEARALL()
	clearAllData()	
end