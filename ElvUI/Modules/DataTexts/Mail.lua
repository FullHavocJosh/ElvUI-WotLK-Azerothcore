local E, L, V, P, G = unpack(select(2, ...)) --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local DT = E:GetModule("DataTexts")

--Lua functions
local join = string.join
--WoW API / Variables
local HasNewMail = HasNewMail
local MAIL_LABEL = _G["MAIL_LABEL"] or "Mail"
local HAVE_MAIL = _G["HAVE_MAIL"] or "New Mail"
local NO_MAIL = "No Mail"

local displayHaveMailString = ""
local displayNoMailString = ""
local lastPanel

local function OnEvent(self)
	lastPanel = self

	if HasNewMail() then
		self.text:SetText(displayHaveMailString)
	else
		self.text:SetText(displayNoMailString)
	end
end

local function ValueColorUpdate(hex)
	displayHaveMailString = join("", hex, HAVE_MAIL, "|r")
	displayNoMailString = join("", hex, NO_MAIL, "|r")

	if lastPanel ~= nil then
		OnEvent(lastPanel)
	end
end
E.valueColorUpdateFuncs[ValueColorUpdate] = true

DT:RegisterDatatext("Mail", {"UPDATE_PENDING_MAIL", "PLAYER_ENTERING_WORLD"}, OnEvent, nil, nil, nil, nil, MAIL_LABEL)
