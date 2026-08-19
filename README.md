[![Game Version](https://img.shields.io/badge/wow-3.3.5-blue.svg)](https://github.com/ElvUI-WotLK)
[![Discord](https://discordapp.com/api/guilds/259362419372064778/widget.png?style=shield)](https://discord.gg/UXSc7nt)
[![GitHub Actions](https://github.com/ElvUI-WotLK/ElvUI/workflows/lint/badge.svg?branch=master&event=push)](https://github.com/ElvUI-WotLK/ElvUI/actions?query=workflow%3Alint+branch%3Amaster)

# ElvUI - Wrath of the Lich King (3.3.5a) — AzerothCore fork

> **This is a fork.** It builds on [ElvUI-WotLK/ElvUI](https://github.com/ElvUI-WotLK/ElvUI), the community backport of ElvUI to the original 3.3.5a client, which in turn is based on the modern, actively-developed [tukui-org/ElvUI](https://github.com/tukui-org/ElvUI). This fork's changes are AzerothCore-specific customizations and features backported from tukui-org/ElvUI where WotLK's older API allows it — not a general-purpose replacement for either upstream project.

This is the backported version of ElvUI for World of Warcraft - Wrath of the Lich King (3.3.5a)
<br />
ElvUI is a full UI replacement.
It completely replaces the default Blizzard UI at every level with a new and better interface.
As such, you'll only ever have to update ElvUI and not worry too much about its individual components.
This UI will arrange your interface to be more flexible and practical.

## Default Layout

This fork ships with a curated default profile rather than upstream's stock layout. Notably:

- **Just one action bar, bar 1, with all 12 slots, always visible** — 50px buttons, backdrop skin. Bars 2-6 are disabled by default; everything happens on this one bar instead of spreading across several stacked bars.
- **Bar 1 pages via keyboard modifiers, not extra visible bars.** Holding **Ctrl**, **Shift**, or **Ctrl+Shift** swaps the entire bar to a different action page in place. This is built in as class-conditional paging (Death Knight/Paladin/Warlock/Shaman get the modifier-driven bonus-bar paging by default, alongside upstream's existing Druid/Warrior/Priest/Rogue stance-bar paging — both sets are active, nothing lost).

## Screenshots:

<a href="https://user-images.githubusercontent.com/590348/77227057-4d9ec400-6b8e-11ea-8672-29789434b9fe.jpg">
<img src="https://user-images.githubusercontent.com/590348/77227055-4bd50080-6b8e-11ea-975e-a68784d34327.jpg" align="right" width="48.5%">
</a>
<a href="https://user-images.githubusercontent.com/590348/77227304-65774780-6b90-11ea-9f64-432786d2a597.jpg">
<img src="https://user-images.githubusercontent.com/590348/77227077-98b8d700-6b8e-11ea-9822-f30103eca56b.jpg" width="48.5%">
</a>

<a href="https://user-images.githubusercontent.com/590348/77227091-bc7c1d00-6b8e-11ea-8c4f-29029a0b750a.jpg">
<img src="https://user-images.githubusercontent.com/590348/77227094-bdad4a00-6b8e-11ea-91a6-d134d7f01d8d.jpg" align="right" width="48.5%">
</a>
<a href="https://user-images.githubusercontent.com/590348/77227309-74f69080-6b90-11ea-9aa1-95c760340e9d.jpg">
<img src="https://user-images.githubusercontent.com/590348/77227311-76c05400-6b90-11ea-8704-dfb0cfd1dd3c.jpg" width="48.5%">
</a>

<a href="https://user-images.githubusercontent.com/590348/77227322-9192c880-6b90-11ea-9944-b9ae42e19431.jpg">
<img src="https://user-images.githubusercontent.com/590348/77227324-935c8c00-6b90-11ea-88ad-96f05a23b3f6.jpg" align="right" width="48.5%">
</a>
<a href="https://user-images.githubusercontent.com/590348/77227328-a53e2f00-6b90-11ea-8dd4-a8d7287185e8.jpg">
<img src="https://user-images.githubusercontent.com/590348/77227329-a707f280-6b90-11ea-9395-3bbc665a3593.jpg" width="48.5%">
</a>


## Installation:

1. Clone this repo **with submodules**: `git clone --recurse-submodules https://github.com/FullHavocJosh/ElvUI-WotLK-Azerothcore.git` (the submodules under `Plugins/` are optional add-ons — skip `--recurse-submodules` if you only want core ElvUI)
2. Copy (or drag and drop) **ElvUI** and **ElvUI_OptionsUI** into your Wow-Directory\Interface\AddOns
3. Restart WoW

Note: this fork's default profile (see [Default Layout](#default-layout) above) only applies to a fresh ElvUI profile — an existing profile from upstream ElvUI-WotLK keeps its own saved settings and won't pick up these defaults automatically.

## Plugins:
[ElvUI_Enhanced](https://github.com/ElvUI-WotLK/ElvUI_Enhanced)
<br />
[ElvUI_AddOnSkins](https://github.com/ElvUI-WotLK/ElvUI_AddOnSkins)
<br />
[ElvUI_AuraBarsMovers](https://github.com/ElvUI-WotLK/ElvUI_AuraBarsMovers)
<br />
[ElvUI_BagControl](https://github.com/ElvUI-WotLK/ElvUI_BagControl)
<br />
[ElvUI_CastBarOverlay](https://github.com/ElvUI-WotLK/ElvUI_CastBarOverlay)
<br />
[ElvUI_CustomTags](https://github.com/ElvUI-WotLK/ElvUI_CustomTags)
<br />
[ElvUI_CustomTweaks](https://github.com/ElvUI-WotLK/ElvUI_CustomTweaks)
<br />
[ElvUI_DTBars2](https://github.com/ElvUI-WotLK/ElvUI_DTBars2)
<br />
[ElvUI_DataTextColors](https://github.com/ElvUI-WotLK/ElvUI_DataTextColors)
<br />
[ElvUI_EnhancedFriendsList](https://github.com/ElvUI-WotLK/ElvUI_EnhancedFriendsList)
<br />
[ElvUI_ExtraActionBars](https://github.com/ElvUI-WotLK/ElvUI_ExtraActionBars)
<br />
[ElvUI_LocPlus](https://github.com/ElvUI-WotLK/ElvUI_LocPlus)
<br />
[ElvUI_MicrobarEnhancement](https://github.com/ElvUI-WotLK/ElvUI_MicrobarEnhancement)
<br />
[ElvUI_RaidMarkers](https://github.com/ElvUI-WotLK/ElvUI_RaidMarkers)
<br />
[ElvUI_SwingBar](https://github.com/ElvUI-WotLK/ElvUI_SwingBar)
<br />
[ElvUI_VisualProcs](https://github.com/ElvUI-WotLK/ElvUI_VisualProcs)
<br />

-- Please Note: These plugins will not function without ElvUI installed.

## Commands:

    /ec or /elvui     Toggle the configuration GUI.
    /rl or /reloadui  Reload the whole UI.
    /moveui           Open the movable frames options.
    /bgstats          Toggles Battleground datatexts to display info when inside a battleground.
    /hellokitty       Enables the Hello Kitty theme (can be reverted by repeating the command).
    /hellokittyfix    Fixes any colors or borders to default after using /hellokitty. Optional Use.
    /harlemshake      Enables Harlem Shake april fools joke. (DO THE HARLEM SHAKE!)
    /egrid            Toggles visibility of the grid for helping placement of thirdparty addons.
    /farmmode         Toggles the Minimap Farmmode.
    /in               The input of how many seconds you want a command to fire.
                          usage: /in <seconds> <command>
                          example: /in 1.5 /say hi
    /enable           Enable an Addon.
                          usage: /enable <addon>
                          example: /enable AtlasLoot
    /disable          Disable an Addon.
                          usage: /disable <addon>
                          example: /disable AtlasLoot

    ---------------------------------------------------------------------------------------------------------------
    -- Development ------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------------------
    /etrace           Toggles events window.
    /luaerror on      Enable luaerrors and disable all AddOns except ElvUI.
    /luaerror off     Disable luaerrors and re-enable all AddOns disabled within that session.
    /cpuimpact        Toggles calculations of CPU Impact. Type /cpuimpact to get results when you are ready.
    /cpuusage         Calculates and dumps CPU usage differences (module: all, showall: false, minCalls: 15, delay: 5).
    /frame            Command to grab frame information when mouseing over a frame or when inputting the name.
                          usage: /frame (when mousing over frame) or /frame <name>
                          example: /frame WorldFrame
    /framelist        Dumps frame level information with children and parents. Also places info into copy box.
    /framestack       Toggles dynamic mouseover frame displaying frame name and level information.
    /resetui          If no argument is provided it will reset all frames to their default positions.
                      If an argument is provided it will reset only that frame.
                          example: /resetui uf (resets all unitframes)


## FAQ:

### I would like to report a bug. What i need to do?
Make sure you're using the latest version of [ElvUI](https://github.com/ElvUI-WotLK/ElvUI/releases/latest)
<br />
Describe your issue in as much detail as possible.
<br />
If your issue is graphical, please take some screenshots to illustrate it.
<br />
What were you doing when the problem occurred?
<br />
Explain how people can reproduce the issue.
<br />
The more info you provide, the better and faster support you will receive.

### I would like to request a feature. Where do I go?
This repository has been created to reproduce the original ElvUI functions.
<br />
If you want to request a feature, post in the [ElvUI_Enhanced](https://github.com/ElvUI-WotLK/ElvUI_Enhanced/issues)
<br />
If you want to request for a change to an existing **ElvUI** function, post in the [ElvUI_CustomTweaks](https://github.com/ElvUI-WotLK/ElvUI_CustomTweaks/issues)

### I have a suggestion/problem with ElvUI_"PluginName". Where do I go?
Create an issue at the bug tracker of [ElvUI](https://github.com/ElvUI-WotLK)_"PluginName" repository.

### ElvUI conflicting with "AddonName".
Make sure you're using the latest available version of "AddonName" for WotLK before creating a ticket about it.

### Can you backport "AddonName" to WotLK?
The only purpose of ElvUI-WotLK is to improve the backported version of ElvUI and its plugins.
