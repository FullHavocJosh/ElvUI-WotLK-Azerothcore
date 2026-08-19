local E, L, V, P, G = unpack(select(2, ...)) --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local DT = E:GetModule("DataTexts")

--Lua functions
local join = string.join
--WoW API / Variables
local ENERGY_REGEN = _G["ENERGY_REGEN"] or "Energy Regen"

-- Energy regenerates at a fixed base rate in Wrath (no haste-scaling until Cataclysm)
local BASE_ENERGY_REGEN = 10

local displayNumberString = ""
local lastPanel

local function OnEvent(self)
	lastPanel = self

	self.text:SetFormattedText(displayNumberString, BASE_ENERGY_REGEN)
end

local function ValueColorUpdate(hex)
	displayNumberString = join("", ENERGY_REGEN, ": ", hex, "%d|r")

	if lastPanel ~= nil then
		OnEvent(lastPanel)
	end
end
E.valueColorUpdateFuncs[ValueColorUpdate] = true

DT:RegisterDatatext("Energy Regen", {"PLAYER_ENTERING_WORLD"}, OnEvent, nil, nil, nil, nil, ENERGY_REGEN)
