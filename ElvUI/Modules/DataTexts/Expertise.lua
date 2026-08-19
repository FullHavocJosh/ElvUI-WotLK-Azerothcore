local E, L, V, P, G = unpack(select(2, ...)) --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local DT = E:GetModule("DataTexts")

--Lua functions
local join = string.join
--WoW API / Variables
local GetExpertise = GetExpertise
local GetRangedExpertise = GetRangedExpertise
local EXPERTISE = _G["EXPERTISE"] or "Expertise"

local displayNumberString = ""
local lastPanel

local function OnEvent(self)
	lastPanel = self

	local expertise
	if E.myclass == "HUNTER" then
		expertise = GetRangedExpertise()
	else
		expertise = GetExpertise()
	end

	self.text:SetFormattedText(displayNumberString, expertise)
end

local function ValueColorUpdate(hex)
	displayNumberString = join("", EXPERTISE, ": ", hex, "%d|r")

	if lastPanel ~= nil then
		OnEvent(lastPanel)
	end
end
E.valueColorUpdateFuncs[ValueColorUpdate] = true

DT:RegisterDatatext("Expertise", {"COMBAT_RATING_UPDATE", "PLAYER_ENTERING_WORLD"}, OnEvent, nil, nil, nil, nil, EXPERTISE)
