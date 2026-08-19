local E, L, V, P, G = unpack(select(2, ...)) --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local DT = E:GetModule("DataTexts")

--Lua functions
local join, floor = string.join, math.floor
--WoW API / Variables
local GetUnitSpeed = GetUnitSpeed
local SPEED = _G["SPEED"] or "Speed"

-- Base run speed in Wrath is 7 yards/sec
local BASE_SPEED = 7

local displayNumberString = ""
local lastPanel

local function OnEvent(self)
	lastPanel = self

	local speed = GetUnitSpeed("player") or BASE_SPEED
	local percent = floor((speed / BASE_SPEED) * 100 + 0.5)

	self.text:SetFormattedText(displayNumberString, percent)
end

local function ValueColorUpdate(hex)
	displayNumberString = join("", SPEED, ": ", hex, "%d%%|r")

	if lastPanel ~= nil then
		OnEvent(lastPanel)
	end
end
E.valueColorUpdateFuncs[ValueColorUpdate] = true

DT:RegisterDatatext("Movement Speed", {"UNIT_SPEED_UPDATE", "PLAYER_ENTERING_WORLD"}, OnEvent, nil, nil, nil, nil, SPEED)
