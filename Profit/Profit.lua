--Global Variables
local PROFIT_TITLE = "Profit";
local PROFIT_VER = "v3.0.1";
local PROFIT_LOADED = false;
local ALGORITHM_DEFAULT = "Default";
local STARTUP_MSG = true;
local AH_LISTING = false;
local AH_LISTING_PERUNIT = false;
local FLAG_PROFIT = false;
local FLAG_PROFIT_VALUE = 10000;
local REAGENT_VALUE = false;
local SKILLET_VALUE = false;
local PROFIT_ROUND = true;
local PROFIT_MARGIN = false;
local PROFIT_SHORT = false;
local PROFIT_SHORTTEXT = "Transmute:,Elixir of,Enchant, Draeni,Flask of the, Draenic, Elixir of the";
local PROFIT_GOLDFONT = 0; --sets the size of the coin images
local PROFIT_USEPLAYERREAGENT = false;
local PROFIT_DEBUGMODE = false;
local tblShortText = {};
local AuctionDBFound = true;

--SavedVariables Database
ProfitDB =
{
	Version = PROFIT_VER,
	Algorithm = ALGORITHM_DEFAULT,
	StartupMsg = STARTUP_MSG,
	AHListing = AH_LISTING,
	AHListingPerUnit = AH_LISTING_PERUNIT,
	FlagProfit = FLAG_PROFIT,
	FlagProfitValue = FLAG_PROFIT_VALUE,
	ShowReagentValue = REAGENT_VALUE,
	SkilletValue = SKILLET_VALUE,
	RoundValue = PROFIT_ROUND,
	Margin = PROFIT_MARGIN,
	Short = PROFIT_SHORT,
	ShortText = PROFIT_SHORTTEXT,
	UsePlayerReagentCount = PROFIT_USEPLAYERREAGENT,
	DebugMode = PROFIT_DEBUGMODE,
};

--Function to show general status messages.  Use the second option to force if the user has turned off.
function ShowMessage(msg, boo)
	if boo then
		ChatFrame1:AddMessage("|CFF1E90FF"..PROFIT_TITLE.." "..PROFIT_VER.."|CFFFFFFFF:  "..msg);
	end
end

--This function will be called when user launches the Blizzard Tradeskill UI
--Since the AddOn is set to LoadOnDemand, everything must be done in the OnEvent function
function Profit_OnLoad(self)
	--Register EVENT	
	self:RegisterEvent("ADDON_LOADED");
end 

--Main function that serves to setup the addon
function Profit_OnEvent(self, event, ...)

	ShowMessage("Profit_OnEvent called with event: "..event,ProfitDB.DebugMode);

	--Test for the event we want
	if (event == "ADDON_LOADED") then
		
		--see if the addon has already been loaded before.
		if (not PROFIT_LOADED) then
			ShowMessage("Profit Not Loaded. Executing Loading...",ProfitDB.DebugMode);
	
			--See if we need to load the Blizzard UI
			if (not IsAddOnLoaded("Blizzard_TradeSkillUI")) then
				ShowMessage("Blizzard_TradeSkillUI not loaded.  Forcing Load...",ProfitDB.DebugMode);
				LoadAddOn("Blizzard_TradeSkillUI");
				ShowMessage("Blizzard_TradeSkillUI loaded.",ProfitDB.DebugMode);
			end
			
			--Set Interface Panel Options
			ProfitOptionsPanel.name = PROFIT_TITLE;
			ProfitOptionsPanel.okay = function (self) Profit_InterfaceOptionsFrameOkayOnClick(); end;	
			ProfitOptionsPanelStartupMsg:SetChecked(ProfitDB.StartupMsg);
			ProfitOptionsPanelAHListing:SetChecked(ProfitDB.AHListing);
			ProfitOptionsPanelAHListingPerUnit:SetChecked(ProfitDB.AHListingPerUnit);
			ProfitOptionsPanelFlagProfit:SetChecked(ProfitDB.FlagProfit);
			ProfitOptionsPanelProfitLevel:SetNumeric(true);
			ProfitOptionsPanelShowReagentValue:SetChecked(ProfitDB.ShowReagentValue);
			ProfitOptionsPanelRoundValue:SetChecked(ProfitDB.RoundValue);
			ProfitOptionsPanelProfitMargin:SetChecked(ProfitDB.Margin);
			ProfitOptionsPanelShort:SetChecked(ProfitDB.Short);
			ProfitOptionsPanelShortEditBox:SetText(ProfitDB.ShortText);
			ProfitOptionsPanelShortEditBox:SetCursorPosition(0);
			ProfitOptionsPanelUsePlayerReagentCount:SetChecked(ProfitDB.UsePlayerReagentCount)
			ProfitOptionsPanelDebugMode:SetChecked(ProfitDB.DebugMode);
			
			local intProfValue = ProfitDB.FlagProfitValue / 10000;

			ProfitOptionsPanelProfitLevel:SetNumber(intProfValue);
			ProfitOptionsPanelProfitLevel:SetCursorPosition(0);

			UIDropDownMenu_Initialize(ProfitOptionsPanel, ProfitDropDownMenu_Initialize)
		
			--Add the ProfitOptionsPanel object to the options frame
			InterfaceOptions_AddCategory(ProfitOptionsPanel);
	
			--Flag the addon as being loaded
			PROFIT_LOADED = true;
			tblShortText = { strsplit(",", PROFIT_SHORTTEXT) }
			ShowMessage("Options set.",ProfitDB.DebugMode);
			
			ShowMessage("Loaded OnDemand!",ProfitDB.StartupMsg)

			if (not AucAdvanced) and (not ZGV) and (not AuctionLite) and (not Atr_GetAuctionBuyout) and (not vendor) then
				ShowMessage("No supported AuctionHouse database loaded.\nYou must have ZygorGuidesViewer, Auctioneer, AuctionLite, Auctionator or AuctionMaster loaded.",true)
				AuctionDBFound = false
			end	
		end
	end
end

--Function that returns the Auction House value for the itemLink specified
function GetAuctionValuePrice(itemLink)		
		--ShowMessage("GetAuctionValuePrice function called for "..itemLink,ProfitDB.DebugMode)
		--test to ensure itemLink is an item (i.e. make sure it's not an enchant)
		if (strfind(itemLink,"Hitem:")) ~= nil then
			--if we make it here, then we have a valid itemLink
			
			local itemID = GetItemID(itemLink);
			
			--See if we can purchase the item from a vendor
			local intVendorPrice = Profit_GetVendorPrice(itemID);
				
			if (intVendorPrice ~= 0) then
				return intVendorPrice or 0; --return the price for the vendor
			
			elseif (AucAdvanced) then	--see if we can get a price from Auctioneer
				--ShowMessage("Getting price from Auctioneer",ProfitDB.DebugMode)
				--Default will always use GetMarketValue API call
				if (ProfitDB.Algorithm == "") or (ProfitDB.Algorithm == ALGORITHM_DEFAULT) or (ProfitDB.Algorithm == nil)  then
					--ShowMessage("using GetMarketValue API",ProfitDB.DebugMode)
					local marketValue, seenCount = AucAdvanced.API.GetMarketValue(itemLink, AucAdvanced.GetFaction())
					return RoundGold(marketValue,false) or 0
				else --the user has selected a specific pricing algorithm
					--ShowMessage("using GetAlgorithmValue API",ProfitDB.DebugMode)
					local newBuy = AucAdvanced.API.GetAlgorithmValue(ProfitDB.Algorithm, itemLink);
					return RoundGold(newBuy,false) or 0
				end
			elseif (AuctionLite) then --auctionlite
				ShowMessage("Getting price from AuctionLite",ProfitDB.DebugMode)
				local auctionValue = AuctionLite:GetAuctionValue(itemID) 
				return RoundGold(auctionValue, false) or 0
			elseif (vendor) then --auctionmaster
				ShowMessage("Getting price from AuctionMaster",ProfitDB.DebugMode)
				local __, value, __, __ = vendor.Statistic:GetCurrentAuctionInfo(itemLink, false)
				return RoundGold(value,false) or 0			
			elseif (Atr_GetAuctionBuyout) then --Auctionator
				ShowMessage("Getting price from Auctionator",ProfitDB.DebugMode)
				local value = Atr_GetAuctionBuyout(itemLink)
				return RoundGold(value,false) or 0
			elseif (ZGV) then
				return ZGV.Gold:GetItemPrice(itemID) or 0
			else --no auction db loaded
				return 0;			
			end

		else
			return 0 --not an item
		end		
end

-- Function to Round Gold
function RoundGold(intPrice, booForce)
	--ShowMessage("RoundGold fired.",ProfitDB.DebugMode);
	if (intPrice ~= nil) then
		if ((ProfitDB.RoundValue) and (intPrice > 0)) or (booForce) then
			return floor((intPrice / 10000)+.5)*10000
		else
			return intPrice		
		end
	else
		return 0
	end
end

--Gets link to an item and returns the ItemID
function GetItemID( itemLink )
	if itemLink then
		return tonumber(strmatch(itemLink, "item:(%d+)"))
	else
		return nil;
	end
end


--Generic function to return the Vendor price for an item
--Currently only supports INFORMANT and internal lookup table
--Informant Function adapted from Informant\InfMain.lua
function Profit_GetVendorPrice(itemID)
	local intCost = 0;

	--Use INFORMANT DB--
	if (Informant) then
		if (itemID and itemID > 0) then
			local itemInfo = nil;
			itemInfo = Informant.GetItem(itemID);
		end
		
		if (not itemInfo) then 
			intCost = 0; --no pricing info found
		else
			local buy = 0;
			local quant;
			buy = tonumber(itemInfo.buy) or 0  --buy price from a vendor
			quant = tonumber(itemInfo.quantity) or 0 --total number that can be purchased from vendor
		
			if (quant > 1) then 
				buy = buy / quant; 
			end

			intCost = buy;
		end
	end
	
	if (Profit_BuyPrices[itemID]) and (intCost == 0) then
		return Profit_BuyPrices[itemID];
	else
		return intCost or 0;
	end

end

--This function is called when the user clicks the OKAY button in the Interface Options Panel
function Profit_InterfaceOptionsFrameOkayOnClick(isApply)
	
 	--GET all the values from the OPTIONS Panel and save them to our variables
	ProfitDB.AHListing = ((ProfitOptionsPanelAHListing:GetChecked() and true) or false);
	ProfitDB.AHListingPerUnit = ((ProfitOptionsPanelAHListingPerUnit:GetChecked() and true) or false);
	
	if (UIDropDownMenu_GetText(ProfitOptionsPanelAlgorithms) ~= nil) or (UIDropDownMenu_GetText(ProfitOptionsPanelAlgorithms) ~= "") then
		ProfitDB.Algorithm = UIDropDownMenu_GetText(ProfitOptionsPanelAlgorithms)
	else
		ProfitDB.Algorithm = ALGORITHM_DEFAULT
	end
	
	--this will account for users who have no pricing algorithms installed or selected in the dropdown box
	if ProfitDB.Algorithm == nil then
		ProfitDB.Algorithm = ALGORITHM_DEFAULT
	end
	
	ProfitDB.StartupMsg = ((ProfitOptionsPanelStartupMsg:GetChecked() and true) or false);
	ProfitDB.ShowReagentValue = ((ProfitOptionsPanelShowReagentValue:GetChecked() and true) or false);
	ProfitDB.FlagProfit = ((ProfitOptionsPanelFlagProfit:GetChecked() and true) or false);
	ProfitDB.FlagProfitValue = ProfitOptionsPanelProfitLevel:GetNumber() * 10000;
	ProfitDB.RoundValue = ((ProfitOptionsPanelRoundValue:GetChecked() and true) or false);
	ProfitDB.Margin = ((ProfitOptionsPanelProfitMargin:GetChecked() and true) or false);
	ProfitDB.Short = ((ProfitOptionsPanelShort:GetChecked() and true) or false);
	ProfitDB.ShortText = ProfitOptionsPanelShortEditBox:GetText();
	ProfitDB.UsePlayerReagentCount = ((ProfitOptionsPanelUsePlayerReagentCount:GetChecked() and true) or false);
	ProfitDB.DebugMode = ((ProfitOptionsPanelDebugMode:GetChecked() and true) or false);

	
	--tblShortText = { strsplit(",", ProfitDB.ShortText) }
	tblShortText = { strsplit(",", PROFIT_SHORTTEXT) }
	
end

--Function called to populate the drop-down list on the options panel
--Populates the drop-down list with all valid auction algorithms from Auctioneer.
function ProfitDropDownMenu_Initialize(self)
	local info = {};
	local intValue = 1;
	
	ShowMessage("DropDown Initialize called",ProfitDB.DebugMode)
	
	--Add the first algorithm as our default to the drop-down list
	---------------------------------------------------------------
	info.text = ALGORITHM_DEFAULT;
	info.value = 1;
	
	if ProfitDB.Algorithm == ALGORITHM_DEFAULT then
		info.checked = true;
	else
		info.checked = nil;
	end

	info.owner = self:GetParent();	
	info.func = ProfitDropDownMenuButton_OnClick;
	UIDropDownMenu_AddButton(info);
	---------------------------------------------------------------
	
	--Only load other algorithms if Auctioneer is loaded
	if (AucAdvanced) then

		--Get a list of available price algorithms the user has installed
		local algorithms = {};
		algorithms = AucAdvanced.API.GetAlgorithms();
	
		for i=2,#algorithms do
			info.text = algorithms[i];
			info.value = i;

			if ProfitDB.Algorithm == algorithms[i] then
				info.checked = true;
				intValue = i
			else
				info.checked = nil;
			end
		
			info.owner = self:GetParent();	
			info.func = ProfitDropDownMenuButton_OnClick;
			UIDropDownMenu_AddButton(info);
		end

		UIDropDownMenu_SetSelectedValue(ProfitOptionsPanelAlgorithms, intValue);
	end
end

function ProfitDropDownMenuButton_OnClick(self) 
	UIDropDownMenu_SetSelectedValue(ProfitOptionsPanelAlgorithms, self.value, false);
end

--Function to determine if a profit can be made
function isProfit(id,iPrice)
	--ShowMessage("isProfit fired",ProfitDB.DebugMode);
	--See if user wants to flag items or not
	--if ProfitDB.FlagProfit then
		local intTotalreagentPrice = 0;
	
		--local numReagents = GetTradeSkillNumReagents(id);
		local numReagents = C_TradeSkillUI.GetRecipeNumReagents(id);
		
		for i=1, numReagents, 1 do
			local intreagentLinkID, intreagentPrice
			local reagentName, reagentTexture, reagentCount, playerReagentCount = C_TradeSkillUI.GetRecipeReagentInfo(id, i);
	
			if ( reagentName or reagentTexture ) then
							
				intreagentLinkID = C_TradeSkillUI.GetRecipeReagentItemLink(id, i)
				
				--Ensure we have a value for intreagentPrice
				if (intreagentLinkID ~= nil) then			
					intreagentPrice = GetAuctionValuePrice(intreagentLinkID)
				else
					intreagentPrice = 0
				end
				
				intTotalreagentPrice = intTotalreagentPrice + (intreagentPrice * reagentCount)
		
			end
		end
	
		
		if (intTotalreagentPrice > iPrice) or (iPrice-intTotalreagentPrice <= ProfitDB.FlagProfitValue) then
			return "";
		else
			return "*";
		end

	--else
	--	return "";
	--end	
end

--Function called when TradeSkillUI is opened
--This function updates the left-hand side of the TradeSkillUI
TradeSkillFrame.RecipeList:HookScript('OnUpdate', function(self, ...)
	
	--Each row (e.g. text) in the left frame of the tradeskillui is considered a button
	--loop through each visible item in the list and perform action on it
	for i = 1, #self.buttons do
		local button = self.buttons[i]

		--Make sure the addon is loaded and the user wants to flag for profit
		if ProfitDB and AuctionDBFound then
			
			--test if our addon's button has been initialized in the button object
			if not button.ProfitFlag then
				button.ProfitFlag = button:CreateFontString(nil, 'ARTWORK', 'GameFontNormalSmall')
				button.ProfitFlag:SetPoint('RIGHT', button.Text, 'LEFT', 1, 0)
			else
				button.ProfitFlag:SetText('')
			end
			
			--Make sure we have a legit button
			if button.tradeSkillInfo and not button.isHeader then
				local recipeID = button.tradeSkillInfo.recipeID;
				local recipeLink = C_TradeSkillUI.GetRecipeItemLink(recipeID);
				local minMade, maxMade = C_TradeSkillUI.GetRecipeNumItemsProduced(recipeID);
				local intPrice = 0 --Holds the value from the various appraiser functions
				
				--Get all the attributes of the current recipe
				local recipeInfo = {};
				C_TradeSkillUI.GetRecipeInfo(recipeID,recipeInfo);
				
	
				--Take off the word specified by user to shorten things up a bit in the tradeskill window
				if (ProfitDB.Short) and (button:GetText() ~= nil) then	
					for idx,searchtext in ipairs(tblShortText) do
						button:SetText(string.gsub(button:GetText(), searchtext.." ", "", 1))						
					end
				end		
				
				--Get the Auction Price
				--ensure we have a value
				if (recipeLink ~= nil) then
					intPrice = GetAuctionValuePrice(recipeLink)
				end
				
				if (intPrice == 0) then
					button.ProfitFlag:SetText('') --if we don't have a price from the appraiser, we might as well quit
				elseif (recipeInfo.numAvailable <= 0) and (ProfitDB.AHListing) then
					--We have no mats, but user still wants to show appraiser price
					if (not ProfitDB.FlagProfit) then
						button.ProfitFlag:SetText(GetCoinTextureString(intPrice,PROFIT_GOLDFONT))
					elseif ProfitDB.FlagProfit and (isProfit(recipeID,intPrice) == "*") then
						button.ProfitFlag:SetText(GetCoinTextureString(intPrice,PROFIT_GOLDFONT))
					end
				elseif (recipeInfo.numAvailable > 0) then
					
					if (ProfitDB.AHListingPerUnit) then --show per unit price rather than the stack price
						button.ProfitFlag:SetText(GetCoinTextureString(intPrice,PROFIT_GOLDFONT))
					else
						--get the price of the item * mats avail * min num made
						button.ProfitFlag:SetText(GetCoinTextureString(intPrice*recipeInfo.numAvailable*minMade,PROFIT_GOLDFONT))
					end		
				end

			else
				button.ProfitFlag:SetText('')
			end
		elseif button.ProfitFlag then
			button.ProfitFlag:SetText('')
		end
	end
end)

function Recipe_Select(selectedRecipeID)
	local txtReturnValue = "";
	local recipeID = selectedRecipeID
	local recipe = GetItemID(C_TradeSkillUI.GetRecipeItemLink(selectedRecipeID))
	
	if recipe ~= nil then -- make sure we have an item
		local recipeLink = C_TradeSkillUI.GetRecipeItemLink(recipeID);
		local minMade, maxMade = C_TradeSkillUI.GetRecipeNumItemsProduced(recipeID);
		local recipeInfo = {};
		local intPrice = 0;
		local intTotalreagentPrice = 0
		
		C_TradeSkillUI.GetRecipeInfo(recipeID,recipeInfo);

		if (recipeLink ~= nil) then
			intPrice = GetAuctionValuePrice(recipeLink)
		else
			intPrice = 0
		end
		
		--Get the number of reagents required for the given recipe
		local numReagents = C_TradeSkillUI.GetRecipeNumReagents(recipeID);
		
		--For each reagent in the recipe...
		for i=1, numReagents, 1 do
			local intreagentLinkID, intreagentPrice
			local reagentName, reagentTexture, reagentCount, playerReagentCount = C_TradeSkillUI.GetRecipeReagentInfo(recipeID, i);
			
			if ( reagentName or reagentTexture ) then
				intreagentLinkID = C_TradeSkillUI.GetRecipeReagentItemLink(recipeID, i)
				
				--Get the price of the reagent from the appraiser
				if (intreagentLinkID ~= nil) then			
					intreagentPrice = GetAuctionValuePrice(intreagentLinkID)
				else
					intreagentPrice = 0
				end
				
				--Keep a running sum of our total reagent price
				if ProfitDB.UsePlayerReagentCount then
					if (reagentCount >= playerReagentCount) then
						intTotalreagentPrice = intTotalreagentPrice + (intreagentPrice * (reagentCount-playerReagentCount))			
					end
				else
					intTotalreagentPrice = intTotalreagentPrice + (intreagentPrice * reagentCount)
				end
				
				if (intreagentPrice ~= 0) and (ProfitDB.ShowReagentValue) then
					--Show the AH price for the reagent

				end
			end
		end
		
		--Determine what text to show in the recipe details pane
		if recipeInfo.name ~= nil then
			if (intTotalreagentPrice > (intPrice*minMade)) then
				if (intPrice ~= 0) then
					return "|cffff2020Profit loss of |CFFFFFFFF"..GetCoinTextureString(RoundGold(intTotalreagentPrice-(intPrice*minMade)),PROFIT_GOLDFONT)
				else
					return "|cffff2020No price data found."
				end
			else
				if (ProfitDB.Margin) and (intPrice ~= 0) then
					txtReturnValue =  "|cff20ff20"..string.format("%d",(((intPrice*minMade)-intTotalreagentPrice) / (intPrice*minMade))*100).."% Profit Margin |CFFFFFFFF("..GetCoinTextureString(RoundGold((intPrice*minMade)-intTotalreagentPrice),PROFIT_GOLDFONT).."  profit)"
				
				elseif (intPrice ~= 0 ) then
					txtReturnValue =   "|cff20ff20Profit Gain = |CFFFFFFFF"..GetCoinTextureString(RoundGold((intPrice*minMade)-intTotalreagentPrice),PROFIT_GOLDFONT)
				else
					txtReturnValue =   "|cffff2020No price data found."
				end
				
				txtReturnValue = "Total Reagent Price = "..GetCoinTextureString(RoundGold(intTotalreagentPrice),PROFIT_GOLDFONT).."\n"..txtReturnValue
				txtReturnValue = "Auction House Unit Price = "..GetCoinTextureString(RoundGold(intPrice),PROFIT_GOLDFONT).."\n"..txtReturnValue
				
				return txtReturnValue				
			end		
		else
			return "|cffff2020No recipe info returned."
		end
	else
		return "|cffff2020No recipe provided."
	end
end

--Function adds text to the bottom of the tradeskillUI details frame
hooksecurefunc(TradeSkillFrame.DetailsFrame, "RefreshDisplay", function(self,...)
	
    if (self.selectedRecipeID == nil) or (not AuctionDBFound) then return end

    local extraText="\n"..Recipe_Select(self.selectedRecipeID)
    local sourceText=self.Contents.SourceText:GetText()
	local numReagents = C_TradeSkillUI.GetRecipeNumReagents(self.selectedRecipeID);
	
	if ProfitDB.ShowReagentValue then
		--Get the number of reagents required for the given recipe
		if numReagents ~= nil then
			--For each reagent in the recipe...
			for i=1, numReagents, 1 do
				local intreagentLinkID, intreagentPrice
				local reagentName, reagentTexture, reagentCount, playerReagentCount = C_TradeSkillUI.GetRecipeReagentInfo(self.selectedRecipeID, i);
				
				--reset the label to its original state
				if not reagentName or not reagentTexture then
					self.Contents.Reagents[i].Icon:SetTexture("");
					self.Contents.Reagents[i].Name:SetText("");
				else
					self.Contents.Reagents[i].Icon:SetTexture(reagentTexture);
					self.Contents.Reagents[i].Name:SetText(reagentName);
				end
				
				--Update the label with the price if option is set				
				if ( reagentName or reagentTexture ) then
					intreagentLinkID = C_TradeSkillUI.GetRecipeReagentItemLink(self.selectedRecipeID, i)
					
					--Get the price of the reagent from the appraiser
					if (intreagentLinkID ~= nil) then			
						intreagentPrice = GetAuctionValuePrice(intreagentLinkID)
					else
						intreagentPrice = 0
					end

					if intreagentPrice >= 5  then
						self.Contents.Reagents[i].Name:SetText(self.Contents.Reagents[i].Name:GetText().." "..GetCoinTextureString(RoundGold(intreagentPrice),PROFIT_GOLDFONT))
					end
				end
			end
		end
	end
		
	if sourceText==nil then
		if numReagents > 0 then
            self.Contents.SourceText:SetPoint("TOP", self.Contents.Reagents[numReagents], "BOTTOM", 0, -15);
		else
			self.Contents.SourceText:SetPoint("TOP", self.Contents.ReagentLabel, "TOP");
        end
        sourceText=extraText
        self:AddContentWidget(self.Contents.SourceText)
        self.Contents.SourceText:Show()
    else
        sourceText=sourceText.."\n"..extraText
    end
    self.Contents.SourceText:SetText(sourceText)
    self:RefreshButtons()
end)
