local E, L, V, P, G = unpack(select(2, ...)) --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local DT = E:GetModule("DataTexts")

--Lua functions
local join = string.join
--WoW API / Variables
local GetArmorPenetration = GetArmorPenetration
local ARMOR_PENETRATION = _G["ARMOR_PENETRATION"] or "Armor Penetration"

local chanceString = "%.2f%%"
local displayString = ""
local lastPanel

local function OnEvent(self)
	lastPanel = self

	local armorPen = GetArmorPenetration() or 0

	self.text:SetFormattedText(displayString, armorPen)
end

local function ValueColorUpdate(hex)
	displayString = join("", ARMOR_PENETRATION, ": ", hex, chanceString, "|r")

	if lastPanel ~= nil then
		OnEvent(lastPanel)
	end
end
E.valueColorUpdateFuncs[ValueColorUpdate] = true

DT:RegisterDatatext("Armor Penetration", {"COMBAT_RATING_UPDATE", "PLAYER_ENTERING_WORLD"}, OnEvent, nil, nil, nil, nil, ARMOR_PENETRATION)
