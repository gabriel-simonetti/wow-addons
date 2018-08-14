local _G = getfenv(0);
local TITAN_WOWTOKEN_ID = "WowToken";
local TITAN_WOWTOKEN_VERSION = "a1.0";
local buttonString = "nothing here";
--print(C_WowTokenPublic.GetCurrentMarketPrice());

function TitanPanelWowTokenButton_OnLoad(self)
	self.registry = {
		id = TITAN_WOWTOKEN_ID,
		category = "",
		version = TITAN_WOWTOKEN_VERSION,
		menuText = "Wow Token price",
		buttonTextFunction = "TitanPanelWowTokenButton_GetButtonText",
		--tooltipTitle = "TITLE",
		--tooltipTextFunction = "TitanPanelExampleButton_GetTooltipText",
		icon = "Interface\\AddOns\\TitanWowToken\\token.blp",
		iconWidth = 16,
		controlVariables = {
			ShowIcon = true,
			ShowLabelText = true,
			ShowRegularText = false,
			ShowColoredText = true,
			DisplayOnRightSide = false
		},
		savedVariables = {
			ShowIcon = 1,
			ShowLabelText = 1,
			
		}
		
	};

	self:RegisterEvent("PLAYER_ENTERING_WORLD");
	self:RegisterEvent("TOKEN_MARKET_PRICE_UPDATED")
	
end

function TitanPanelWowTokenButton_OnEvent(self, event, ...)
	if (event == "PLAYER_ENTERING_WORLD") then
		
		UpdateTokenPriceString();
	end

	if event == "TOKEN_MARKET_PRICE_UPDATED" then
		UpdateTokenPriceString();
	end

end

function MakeItNicer(price)
	if price == nil then 
	price = 0;
	end
	local gold, copper, silver;
	--print(price);
	local ret = "";
	if(price > 0) then
		copper = math.fmod(price,100);
	else
		copper = 0;
	end
	if(price > 99) then
		silver = math.fmod(math.floor(price/100),100);
	else
		silver = 0;
	end
	if (price > 9999) then
		gold = math.floor(price/10000);
	else
		gold = 0;
	end
	return "|cffffffff" .. gold .. "|r|cffffe700g|r |cffffffff" .. silver .. "|r|cffeeeeees|r |cffffffff" .. copper .. "|r|cffb87333c|r";
end


function UpdateTokenPriceString()
	C_WowTokenPublic.UpdateMarketPrice();
	buttonString = MakeItNicer(C_WowTokenPublic.GetCurrentMarketPrice());
	TitanPanelButton_UpdateButton(TITAN_WOWTOKEN_ID);
end

function TitanPanelWowTokenButton_GetButtonText(id)
	return buttonString;
end

function TitanPanelWowTokenButton_OnClick(self, button)
	UpdateTokenPriceString();
end