local E, L, V, P, G = unpack(select(2, ...)) --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local DT = E:GetModule("DataTexts")

--Lua functions
local join = string.join
--WoW API / Variables
local UnitDefense = UnitDefense
local DEFENSE = _G["DEFENSE"] or "Defense"

local displayNumberString = ""
local lastPanel

local function OnEvent(self)
	lastPanel = self

	local base, effectiveBase = UnitDefense("player")
	local total = (effectiveBase or base) or 0

	self.text:SetFormattedText(displayNumberString, total)
end

local function ValueColorUpdate(hex)
	displayNumberString = join("", DEFENSE, ": ", hex, "%d|r")

	if lastPanel ~= nil then
		OnEvent(lastPanel)
	end
end
E.valueColorUpdateFuncs[ValueColorUpdate] = true

DT:RegisterDatatext("Defense", {"COMBAT_RATING_UPDATE", "PLAYER_ENTERING_WORLD"}, OnEvent, nil, nil, nil, nil, DEFENSE)
