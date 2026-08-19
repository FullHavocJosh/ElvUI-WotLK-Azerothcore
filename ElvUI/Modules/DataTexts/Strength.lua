local E, L, V, P, G = unpack(select(2, ...)) --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local DT = E:GetModule("DataTexts")

--Lua functions
local join = string.join
--WoW API / Variables
local UnitStat = UnitStat
local STAT_STRENGTH = _G["STAT_STRENGTH"] or "Strength"

local displayNumberString = ""
local lastPanel

local function OnEvent(self)
	lastPanel = self

	local effectiveStat = UnitStat("player", 1)

	self.text:SetFormattedText(displayNumberString, effectiveStat)
end

local function ValueColorUpdate(hex)
	displayNumberString = join("", STAT_STRENGTH, ": ", hex, "%d|r")

	if lastPanel ~= nil then
		OnEvent(lastPanel)
	end
end
E.valueColorUpdateFuncs[ValueColorUpdate] = true

DT:RegisterDatatext("Strength", {"UNIT_STATS", "PLAYER_ENTERING_WORLD"}, OnEvent, nil, nil, nil, nil, STAT_STRENGTH)
