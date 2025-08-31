# AHK_UmamusumeReroll

[AHK](https://www.autohotkey.com/download/) Script to AFK-Reroll Umamusume Support-Cards (or Umas, see settings) I made while I was bedridden the last couple days.<br>
Used it to reroll my Save and got all three big Supports after hundreds of rerolls ([Kitasan Black](https://gametora.com/umamusume/supports/30028-kitasan-black), [Super Creek](https://gametora.com/umamusume/supports/30016-super-creek) and [Fine Motion](https://gametora.com/umamusume/supports/30010-fine-motion))<br>

### Reroll-Time: ~3 Minutes 20 Seconds

### ⚠️ **Warning:**
- AHK has to be installed: https://www.autohotkey.com/download/
- This only works with a Screen-Resolution of 1920x1080!<br>
*Change your Resolution temporarily if not 1920x1080.*
<br>

## Usage

| Hotkey | Description |
|:-----------|:------------|
| Space | Start Script |
| Backspace | Abort Execution (reloads script) |
| Esc | Exit Script completely |
<br>
1)<br>

Download the [Latest Release](https://github.com/yani9o/AHK_UmamusumeReroll/releases/latest).

2)<br>Extract UmamusumeReroll.ahk (doesn't matter where).<br>
<br>
3)<br>Execute UmamusumeReroll.ahk (doubleclick it).<br>
<br>
4)<br>Be ingame ("To Title Screen" has to be clickable).<br>
<br>

> ⚠️ First Play<br>
> *If you didn't play umamusume before, start the game first and let it download everything.*<br>
> *Continue with 5) when all is downloaded and on the following screen*<br>

<img width="640" height="360" alt="image" src="https://github.com/user-attachments/assets/d4a2a338-e82c-4795-b552-9ba0b9d41548" />
<br>
<br>
5) Press Space to start the Script.<br>
<br>
6) Wait for it to complete (Sound is played if not disabled in settings).<br>

*It will automatically close the WebBrowser-Popups*<br>
<br>

## Settings

| Setting | Default | Description |
|:-----------|:------------:|:------------|
| DateofBirth | 200001 | Date of Birth (YYYYMM) |
| IntroAmount | 10 | How many Intro Skips (Login Reward, News, etc.) |
| FreeSupportRolls | 3 | How many free/guaranteed SSR Support rolls (0 = skip SSR Supports) |
| BannerSlot | 3 | How many times go right for current Banner reroll on scout tab (0 = default banner) |
| PullAmount | 12 | How many 10 Pulls are possible (Carats / 150 - currently it's 18'870 Carats -> 12 Pulls) |
| UmaReroll | 0 | Rerolling for Umas instead of Supports |
| CompleteSound | 1 | Play Sound when complete |
<br>

## Known Issues

Even if I gave generous Timeouts and tested it for days,<br>
this script may not 100% work for everyone.<br>
It depends on Loadtimes and Connectionspeed to the Gameserver.<br>
If something doesn't work for you, you'd need to adjust waiting times in the script (`Sleep, x`)
