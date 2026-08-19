local E, L, V, P, G = unpack(select(2, ...)) --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local DT = E:GetModule("DataTexts")

--Lua functions
local join = string.join
--WoW API / Variables
local UnitStat = UnitStat
local STAT_STAMINA = _G["STAT_STAMINA"] or "Stamina"

local displayNumberString = ""
local lastPanel

local function OnEvent(self)
	lastPanel = self

	local effectiveStat = UnitStat("player", 3)

	self.text:SetFormattedText(displayNumberString, effectiveStat)
end

local function ValueColorUpdate(hex)
	displayNumberString = join("", STAT_STAMINA, ": ", hex, "%d|r")

	if lastPanel ~= nil then
		OnEvent(lastPanel)
	end
end
E.valueColorUpdateFuncs[ValueColorUpdate] = true

DT:RegisterDatatext("Stamina", {"UNIT_STATS", "PLAYER_ENTERING_WORLD"}, OnEvent, nil, nil, nil, nil, STAT_STAMINA)
