# Naming alignment with retail ElvUI (tukui-org/ElvUI)

This fork started life as `ElvUI-WotLK/ElvUI`, which predates tukui-org's later
file/function renames. This document tracks every place where this fork's
naming was aligned to retail's, and — just as importantly — every place where
alignment was investigated and **deliberately not done**, so future comparison
work doesn't have to re-derive these findings from scratch.

Whenever you're diffing this fork against `tukui-org/ElvUI` for backport
candidates, check this file *before* concluding something is missing — several
"missing" features turned out to already exist under a different name.

## Renamed (file + DB key + function names now match retail)

| WotLK (old) | WotLK (now) | Retail equivalent | DB key |
|---|---|---|---|
| `UnitFrames/Elements/BuffIndicator.lua` | `UnitFrames/Elements/AuraWatch.lua` | `UnitFrames/Elements/AuraWatch.lua` | `buffwatch` → `aurawatch` (migrated, see below) |
| `UnitFrames/Elements/HealComm.lua` | `UnitFrames/Elements/HealPrediction.lua` | `UnitFrames/Elements/HealPrediction.lua` | already `healPrediction`, unchanged |
| `UnitFrames/Elements/PvPIcon.lua` | `UnitFrames/Elements/PVPIcon.lua` | `UnitFrames/Elements/PVPIcon.lua` | already `pvpIcon`, unchanged (casing-only rename) |
| `UnitFrames/Elements/PvPIndicator.lua` | `UnitFrames/Elements/PVPText.lua` | `UnitFrames/Elements/PVPText.lua` | already `pvp`, unchanged |
| `Blizzard/WatchFrame.lua` | `Blizzard/QuestWatch.lua` | `Blizzard/QuestWatch.lua` | already `general`, unchanged |
| `Nameplates/Elements/Elite.lua` | `Nameplates/Elements/ClassificationIndicator.lua` | `Nameplates/Plugins/ClassificationIndicator.lua` | `eliteIcon` — no retail equivalent found, see below |

Function renames that went with the above (all call sites updated, verified
with `luac -p` + repo-wide grep):

- `Construct_HealComm` → `Construct_HealPrediction`, `Configure_HealComm` →
  `Configure_HealPrediction`, `HealthClipFrame_HealComm` →
  `HealthClipFrame_HealPrediction`, `SetAlpha_HealComm` →
  `SetAlpha_HealPrediction`, `SetVisibility_HealComm` →
  `SetVisibility_HealPrediction`, `UpdateHealComm` → `UpdateHealPrediction`
- `Construct_PvPIndicator` → `Construct_PvPText`, `Configure_PVPIndicator` →
  `Configure_PVPText`
- `UF:Construct_AuraWatch` / `Configure_*` in AuraWatch.lua were **already**
  named correctly — only the file itself was misnamed.
- `Construct_Elite` / `Configure_Elite` / `Update_Elite` in
  ClassificationIndicator.lua were **not** renamed — see below.

### DB key migration: `buffwatch` → `aurawatch`

`buffwatch` was the only DB key that actually diverged from retail's name
(`aurawatch`). Renamed in `Settings/Global.lua`, `Settings/Filters/UnitFrame.lua`,
`Core/Distributor.lua`, and `AuraWatch.lua`. A one-time migration lives in
`Core/Core.lua`'s `E:DBConversions()`, gated on
`E.db.unitframe.aurawatchRenameConverted`, copying any existing
`buffwatch`/`filters.buffwatch` data forward before clearing the old keys —
existing characters' AuraWatch setups are preserved, not reset.

## Investigated, NOT renamed — no clean 1:1 target

These looked like naming mismatches but turned out to be real architectural
differences. Forcing a rename here would misrepresent what the code actually
does, so they were left alone. Check the actual function bodies here before
assuming retail's file of the same purpose is a drop-in reference.

- **`Nameplates/Elements/Glow.lua`** — this fork's target-highlight glow.
  Retail decomposed this into two separate features (`TargetIndicator` +
  low-health coloring baked into oUF's health element). WotLK's `Glow.lua`
  already handles both combined (`frame.isTarget` for target glow,
  `lowHealthThreshold` for the low-health variant) using the same
  `CreateShadow`-based border glow. **Do not port retail's `TargetIndicator.lua`
  wholesale** — it would collide with this. (We started to before catching it —
  see git history on the `backport/high-value-features` branch.)

- **`Modules/Skins/Blizzard/WatchFrame.lua`** — visual skin for the quest
  tracker. Retail's closest equivalent is `Skins/Quest.lua` (per-flavor, e.g.
  `Game/Wrath/Skins/Quest.lua`), but that file's scope is broader — it also
  covers the quest greeting frame, quest log, etc., not just the tracker.
  Renaming this file to `Quest.lua` would overstate the overlap, so it was left
  as `WatchFrame.lua`.

- **`ClassificationIndicator.lua`'s internal functions** — retail's
  `ClassificationIndicator` is an oUF element (`local function Update(self)` /
  `Enable` / `Disable`, registered via `ElvUF:AddElement`), not a
  `NP:Construct_X`/`Configure_X`/`Update_X` triplet. WotLK's nameplate system
  isn't oUF-based at all (nameplates are hand-built from Blizzard's own
  regions via `frame:GetRegions()`), so there's no real function-name target
  to align to. Only the file was renamed for discoverability.

- **`Blizzard/QuestWatch.lua`'s internal functions** — retail's version does
  more than this fork's: it adds click-to-open-quest-log support
  (`QuestWatch_OnClick`, `QuestWatch_SetClickFrames`,
  `QuestWatch_AddQuestClick`) that this fork's `WatchFrame.lua` never had.
  Renaming WotLK's `MoveWatchFrame`/`SetWatchFrameHeight` to retail's names
  would claim feature parity that doesn't exist. **The click-to-open feature
  itself is a legitimate future backport candidate** — flagged here for later,
  not implemented as part of this naming pass.

## Also considered, found already covered (from the original feature-gap pass)

Documented here too since they're naming-adjacent discoveries from the same
investigation:

- Retail's `AuraWatch.lua` ≈ this fork's `AuraWatch.lua` (renamed above)
- Retail's `HealPrediction.lua` ≈ this fork's `HealPrediction.lua` (renamed above)
- Retail's `PVPIcon.lua` / `PVPText.lua` ≈ this fork's `PVPIcon.lua` / `PVPText.lua` (renamed above)
- Retail's `QuestWatch.lua` (positioning half) ≈ this fork's `QuestWatch.lua` (renamed above)
- Retail's `ClassificationIndicator.lua` ≈ this fork's `ClassificationIndicator.lua` (renamed above, functions differ architecturally)
- Retail's `TargetIndicator.lua` ≈ this fork's `Glow.lua` (NOT renamed, see above)
