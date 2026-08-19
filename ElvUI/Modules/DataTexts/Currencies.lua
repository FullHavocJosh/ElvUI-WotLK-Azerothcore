local E, L, V, P, G = unpack(select(2, ...)) --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local DT = E:GetModule("DataTexts")

--Lua functions
local join = string.join
--WoW API / Variables
local GetCurrencyListSize = GetCurrencyListSize
local GetCurrencyListInfo = GetCurrencyListInfo
local ToggleCharacter = ToggleCharacter
local CURRENCY = _G["CURRENCY"] or "Currency"

local displayNumberString = ""
local lastPanel

-- Returns name, count of the first watched (tracked) currency, if any
local function GetFirstWatchedCurrency()
	local size = GetCurrencyListSize and GetCurrencyListSize() or 0
	for i = 1, size do
		local name, isHeader, _, isWatched, _, count = GetCurrencyListInfo(i)
		if not isHeader and isWatched and name then
			return name, count or 0
		end
	end
end

local function OnEvent(self)
	lastPanel = self

	local name, count = GetFirstWatchedCurrency()
	if name then
		self.text:SetFormattedText(displayNumberString, name, count)
	else
		self.text:SetText(CURRENCY..": --")
	end
end

local function OnClick()
	ToggleCharacter("TokenFrame")
end

local function OnEnter(self)
	DT:SetupTooltip(self)

	DT.tooltip:AddLine(CURRENCY)
	DT.tooltip:AddLine(" ")

	local size = GetCurrencyListSize and GetCurrencyListSize() or 0
	local shown = 0
	for i = 1, size do
		local name, isHeader, _, isWatched, _, count = GetCurrencyListInfo(i)
		if not isHeader and isWatched and name then
			DT.tooltip:AddDoubleLine(name, count or 0, 1, 1, 1)
			shown = shown + 1
		end
	end

	if shown == 0 then
		DT.tooltip:AddLine("No tracked currencies. Right-click a currency in your Currency tab to track it.")
	end

	DT.tooltip:Show()
end

local function ValueColorUpdate(hex)
	displayNumberString = join("", hex, "%s", "|r", ": ", hex, "%d|r")

	if lastPanel ~= nil then
		OnEvent(lastPanel)
	end
end
E.valueColorUpdateFuncs[ValueColorUpdate] = true

DT:RegisterDatatext("Currencies", {"CURRENCY_DISPLAY_UPDATE", "PLAYER_ENTERING_WORLD"}, OnEvent, nil, OnClick, OnEnter, nil, CURRENCY)
