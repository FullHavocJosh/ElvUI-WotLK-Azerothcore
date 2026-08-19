local E, L, V, P, G = unpack(select(2, ...)) --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local DT = E:GetModule("DataTexts")

--Lua functions
--WoW API / Variables
local GetDungeonDifficulty = GetDungeonDifficulty
local GetRaidDifficulty = GetRaidDifficulty
local IsInRaid = IsInRaid
local DIFFICULTY = _G["DIFFICULTY"] or "Difficulty"
local NORMAL_DIFFICULTY_COLOR = "|cffffffff"
local HEROIC_DIFFICULTY_COLOR = "|cffcc3333"

local lastPanel

local function OnEvent(self)
	lastPanel = self

	local text
	if IsInRaid() then
		local raidDiff = GetRaidDifficulty()
		if raidDiff == 1 then
			text = NORMAL_DIFFICULTY_COLOR.."10"..DIFFICULTY.."|r"
		elseif raidDiff == 2 then
			text = HEROIC_DIFFICULTY_COLOR.."25"..DIFFICULTY.."|r"
		elseif raidDiff == 3 then
			text = NORMAL_DIFFICULTY_COLOR.."10"..DIFFICULTY.."|r"
		elseif raidDiff == 4 then
			text = HEROIC_DIFFICULTY_COLOR.."25"..DIFFICULTY.."|r"
		end
	else
		local dungeonDiff = GetDungeonDifficulty()
		if dungeonDiff == 1 then
			text = NORMAL_DIFFICULTY_COLOR.."Normal|r"
		elseif dungeonDiff == 2 then
			text = HEROIC_DIFFICULTY_COLOR.."Heroic|r"
		end
	end

	self.text:SetText(text or (DIFFICULTY..": --"))
end

DT:RegisterDatatext("Difficulty", {"RAID_INSTANCE_WELCOME", "PLAYER_ENTERING_WORLD", "PARTY_MEMBERS_CHANGED", "RAID_ROSTER_UPDATE"}, OnEvent, nil, nil, nil, nil, DIFFICULTY)
