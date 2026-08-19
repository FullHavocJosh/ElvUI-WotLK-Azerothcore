local E, L, V, P, G = unpack(select(2, ...)) --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local DT = E:GetModule("DataTexts")

--Lua functions
--WoW API / Variables
local GetZoneText = GetZoneText
local GetSubZoneText = GetSubZoneText
local GetRealZoneText = GetRealZoneText
local ToggleFrame = ToggleFrame

local lastPanel

local function OnEvent(self)
	lastPanel = self

	local subZone = GetSubZoneText()
	local zone = GetZoneText() or GetRealZoneText() or ""

	if subZone and subZone ~= "" and subZone ~= zone then
		self.text:SetText(subZone)
	else
		self.text:SetText(zone)
	end
end

local function OnClick()
	ToggleFrame(WorldMapFrame)
end

DT:RegisterDatatext("Location", {"ZONE_CHANGED", "ZONE_CHANGED_INDOORS", "ZONE_CHANGED_NEW_AREA", "PLAYER_ENTERING_WORLD"}, OnEvent, nil, OnClick, nil, nil, "Location")
