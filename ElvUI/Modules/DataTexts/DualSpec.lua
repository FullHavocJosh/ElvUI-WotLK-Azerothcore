local E, L, V, P, G = unpack(select(2, ...)) --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local DT = E:GetModule("DataTexts")

--Lua functions
--WoW API / Variables
local GetActiveTalentGroup = GetActiveTalentGroup
local GetNumTalentGroups = GetNumTalentGroups
local SetActiveTalentGroup = SetActiveTalentGroup
local TALENT_SPECIALIZATIONS = _G["TALENT_SPECIALIZATIONS"] or "Talent Specializations"

local lastPanel

local function OnEvent(self)
	lastPanel = self

	local numSpecs = GetNumTalentGroups() or 1
	local active = GetActiveTalentGroup() or 1

	if numSpecs > 1 then
		self.text:SetFormattedText("%s: %d", TALENT_SPECIALIZATIONS, active)
	else
		self.text:SetFormattedText("%s: --", TALENT_SPECIALIZATIONS)
	end
end

local function OnClick(self)
	local numSpecs = GetNumTalentGroups() or 1
	if numSpecs <= 1 then return end

	local active = GetActiveTalentGroup() or 1
	local other = (active == 1) and 2 or 1

	SetActiveTalentGroup(other)
end

local function OnEnter(self)
	DT:SetupTooltip(self)

	DT.tooltip:AddLine(TALENT_SPECIALIZATIONS)
	DT.tooltip:AddLine(" ")
	DT.tooltip:AddLine("Click to swap to your other talent spec. Requires a Dual Talent Specialization unlock and being out of combat.")

	DT.tooltip:Show()
end

DT:RegisterDatatext("Dual Spec", {"PLAYER_TALENT_UPDATE", "ACTIVE_TALENT_GROUP_CHANGED", "PLAYER_ENTERING_WORLD"}, OnEvent, nil, OnClick, OnEnter, nil, TALENT_SPECIALIZATIONS)
