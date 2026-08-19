local E, L, V, P, G = unpack(select(2, ...)) --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local DT = E:GetModule("DataTexts")

--Lua functions
local join, floor = string.join, math.floor
--WoW API / Variables
local UnitXP = UnitXP
local UnitXPMax = UnitXPMax
local IsXPUserDisabled = IsXPUserDisabled
local UnitLevel = UnitLevel
local MAX_PLAYER_LEVEL_TABLE = MAX_PLAYER_LEVEL_TABLE
local EXPERIENCE = _G["EXPERIENCE"] or "Experience"

local displayNumberString = ""
local lastPanel

local function OnEvent(self)
	lastPanel = self

	local maxLevel = (MAX_PLAYER_LEVEL_TABLE and MAX_PLAYER_LEVEL_TABLE[1]) or 80
	if UnitLevel("player") >= maxLevel or (IsXPUserDisabled and IsXPUserDisabled()) then
		self.text:SetText(EXPERIENCE..": --")
		return
	end

	local cur = UnitXP("player")
	local max = UnitXPMax("player")
	local percent = (max and max > 0) and floor((cur / max) * 100 + 0.5) or 0

	self.text:SetFormattedText(displayNumberString, percent, cur, max)
end

local function ValueColorUpdate(hex)
	displayNumberString = join("", EXPERIENCE, ": ", hex, "%d%%", "|r", " (%d/%d)")

	if lastPanel ~= nil then
		OnEvent(lastPanel)
	end
end
E.valueColorUpdateFuncs[ValueColorUpdate] = true

DT:RegisterDatatext("Experience", {"PLAYER_XP_UPDATE", "PLAYER_LEVEL_UP", "PLAYER_ENTERING_WORLD"}, OnEvent, nil, nil, nil, nil, EXPERIENCE)
