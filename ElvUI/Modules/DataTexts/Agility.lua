local E, L, V, P, G = unpack(select(2, ...)) --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local DT = E:GetModule("DataTexts")

--Lua functions
local join = string.join
--WoW API / Variables
local UnitStat = UnitStat
local STAT_AGILITY = _G["STAT_AGILITY"] or "Agility"

local displayNumberString = ""
local lastPanel

local function OnEvent(self)
	lastPanel = self

	local effectiveStat = UnitStat("player", 2)

	self.text:SetFormattedText(displayNumberString, effectiveStat)
end

local function ValueColorUpdate(hex)
	displayNumberString = join("", STAT_AGILITY, ": ", hex, "%d|r")

	if lastPanel ~= nil then
		OnEvent(lastPanel)
	end
end
E.valueColorUpdateFuncs[ValueColorUpdate] = true

DT:RegisterDatatext("Agility", {"UNIT_STATS", "PLAYER_ENTERING_WORLD"}, OnEvent, nil, nil, nil, nil, STAT_AGILITY)
