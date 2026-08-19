local E, L, V, P, G = unpack(select(2, ...)) --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local DT = E:GetModule("DataTexts")

--Lua functions
local join, floor = string.join, math.floor
--WoW API / Variables
local GetCVar = GetCVar
local SetCVar = SetCVar
local VOLUME = _G["VOLUME"] or "Volume"

local displayNumberString = ""
local lastPanel

local function OnEvent(self)
	lastPanel = self

	local volume = floor((tonumber(GetCVar("Sound_MasterVolume")) or 0) * 100 + 0.5)

	self.text:SetFormattedText(displayNumberString, volume)
end

local function OnClick(self, button)
	local step = 0.1

	if button == "RightButton" then
		SetCVar("Sound_EnableAllSound", GetCVar("Sound_EnableAllSound") == "0" and "1" or "0")
	else
		local volume = tonumber(GetCVar("Sound_MasterVolume")) or 0
		volume = volume + step
		if volume > 1 then volume = 0 end

		SetCVar("Sound_MasterVolume", volume)
		SetCVar("Sound_EnableAllSound", "1")
	end

	OnEvent(self)
end

local function OnEnter(self)
	DT:SetupTooltip(self)

	DT.tooltip:AddLine(VOLUME)
	DT.tooltip:AddLine(" ")
	DT.tooltip:AddLine("Left-click to cycle volume, right-click to toggle mute.")

	DT.tooltip:Show()
end

local function ValueColorUpdate(hex)
	displayNumberString = join("", VOLUME, ": ", hex, "%d%%|r")

	if lastPanel ~= nil then
		OnEvent(lastPanel)
	end
end
E.valueColorUpdateFuncs[ValueColorUpdate] = true

DT:RegisterDatatext("Volume", {"CVAR_UPDATE", "PLAYER_ENTERING_WORLD"}, OnEvent, nil, OnClick, OnEnter, nil, VOLUME)
