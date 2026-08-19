local E, L, V, P, G = unpack(select(2, ...)) --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local DT = E:GetModule("DataTexts")

--Lua functions
local join, format = string.join, string.format
--WoW API / Variables
local GetWatchedFactionInfo = GetWatchedFactionInfo
local REPUTATION = _G["REPUTATION"] or "Reputation"
local NONE = _G["NONE"] or "None"

local displayString = ""
local lastPanel

local function OnEvent(self)
	lastPanel = self

	local name, standingID, barMin, barMax, barValue = GetWatchedFactionInfo()

	if not name then
		self.text:SetText(REPUTATION..": "..NONE)
		return
	end

	local standingText = _G["FACTION_STANDING_LABEL"..standingID] or ""
	local current = barValue - barMin
	local max = barMax - barMin

	self.text:SetFormattedText(displayString, name, standingText, current, max)
end

local function OnEnter(self)
	DT:SetupTooltip(self)

	local name, standingID, barMin, barMax, barValue = GetWatchedFactionInfo()
	if name then
		local standingText = _G["FACTION_STANDING_LABEL"..standingID] or ""
		DT.tooltip:AddLine(name, 1, 1, 1)
		DT.tooltip:AddLine(standingText)
		DT.tooltip:AddLine(format("%d / %d", barValue - barMin, barMax - barMin))
	else
		DT.tooltip:AddLine(REPUTATION)
		DT.tooltip:AddLine("No watched faction. Set one from the Reputation panel.")
	end

	DT.tooltip:Show()
end

local function ValueColorUpdate(hex)
	displayString = join("", hex, "%s", "|r", " (%s) ", hex, "%d/%d|r")

	if lastPanel ~= nil then
		OnEvent(lastPanel)
	end
end
E.valueColorUpdateFuncs[ValueColorUpdate] = true

DT:RegisterDatatext("Reputation", {"UPDATE_FACTION", "PLAYER_ENTERING_WORLD"}, OnEvent, nil, nil, OnEnter, nil, REPUTATION)
