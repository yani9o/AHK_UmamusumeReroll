; GameVer: 1.9.13 (Wedding Event)
;-------------------------------------------------------
; Variables
;-------------------------------------------------------

; Date of Birth (YYYYMM)
DateofBirth := 200001

; How many Intro Skips (Login Reward, News, etc.)
IntroAmount := 10

; How many free/guaranteed SSR Support rolls (0 = skip SSR Supports)
FreeSupportRolls := 3

; How many times go right for current Banner reroll on scout tab (0 = default banner)
BannerSlot := 3

; How many 10 Pulls are possible (Carats / 150 - currently it's 18'870 Carats -> 12 Pulls)
PullAmount := 12

; Rerolling for Umas instead of Supports
UmaReroll := 0

; Play Sound when complete
CompleteSound := 1


;-------------------------------------------------------
; Script
;-------------------------------------------------------

#IfWinActive, Umamusume

SetBatchLines, -1
SetWinDelay, 0
SetKeyDelay, 0
SetMouseDelay, 0

Esc::ExitApp
Backspace::Reload

Space::

	; Check if Fullscreen
	
	WinGetPos, X, Y, W, H, Umamusume
	SysGet, ScreenW, 78
	SysGet, ScreenH, 79
	
	if (ScreenW != 1920 || ScreenH != 1080) {
		SoundPlay, %A_WinDir%\Media\Windows Critical Stop.wav
		MsgBox, 16, Resolution Error, Set your resolution to 1920x1080!`nOtherwise this Script doesn't work.
		return
	}

	if (W != ScreenW || H != ScreenH) {
		Send, !{Enter}
		Sleep, 1000
	}

	;====================
	; Reset Game
	;====================
	
	; Back to Title and Delete User Data
	Click, 1500, 900 Left
	Sleep, 5000
	Click, 1500, 900 Left
	Sleep, 1000
	Click, 1500, 900 Left
	Sleep, 1000
	Click, 1850, 1000 Left
	Sleep, 1000
	Click, 950, 750 Left
	Sleep, 1000
	Click, 1100, 700 Left
	Sleep, 1000
	Click, 1100, 700 Left
	Sleep, 2000
	Click, 950, 700 Left

	; Game Reloading
	Sleep, 5000
	Click, 950, 700 Left
	Sleep, 2000
	Click, 950, 700 Left
	Sleep, 1000

	;====================
	; Start New Game
	;====================
	
	; Legal Stuff
	Click, 950, 950 Left
	Sleep, 1000
	Click, 1165, 480 Left
	Sleep, 1000
	Send, ^w
	Sleep, 750
	if !WinActive("Umamusume") {
		WinMinimize, A
		Sleep, 1000
	}
	Click, 1165, 591 Left
	Sleep, 1000
	Send, ^w
	Sleep, 750
	if !WinActive("Umamusume") {
		WinMinimize, A
		Sleep, 1000
	}
	Click, 1100, 780 Left
	Sleep, 1000
	
	; Region
	Click, 1150, 550 Left
	Sleep, 750
	Click, 1100, 780 Left
	Sleep, 750
	Click, 1100, 700 Left
	Sleep, 1000
	
	; Age
	Click, 1000, 565 Left
	Sleep, 500
	Send, %DateofBirth%
	Sleep, 500
	Click, 1075, 700 Left
	Sleep, 5000
	
	; Skip
	Click, 1075, 700 Left
	Sleep, 2000
	
	; Username
	Click, 900, 500 Left
	Sleep, 500
	Send, %DateofBirth%
	Sleep, 500
	Click, 950, 700 Left
	Sleep, 2000
	Click, 1100, 700 Left
	Sleep, 6000
	
	;====================
	; Ingame
	;====================
	
	; Skip Intros - wait 2secs each
	Loop, %IntroAmount%
	{
		Click, 900, 1025 Left
		Sleep, 2000
	}
	
	; Claim Rewards
	Click, 800, 770 Left
	Sleep, 2000
	Click, 700, 1000 Left
	Sleep, 2000
	Click, 550, 1000 Left
	Sleep, 2000
	Click, 400, 1000 Left
	Sleep, 2000
	
	; Switch to Scout and Choose SSR Supports if > 0
	Click, 800, 1050 Left
	Sleep, 2000
	
	if (FreeSupportRolls != 0) {
		Click, 250, 650 Left
		Sleep, 1000
		Click, 550, 865 Left
		Sleep, 1000
		Click, 685, 700 Left
		Sleep, 3500
		
		; Open SSR Supports
		FreeSupportRolls -= 1
		Loop, %FreeSupportRolls%
		{
			Click, 900, 1025 Left
			Sleep, 1000
			Click, 900, 1025 Left
			Sleep, 1500
			Click, 700, 750 Left
			Sleep, 1000
			Click, 700, 700 Left
			Sleep, 3000
		}

		; Open last SSR Support and back to Scout
		Click, 900, 1025 Left
		Sleep, 1000
		Click, 900, 1025 Left
		Sleep, 1500
		Click, 550, 750 Left
		Sleep, 6000
	}
	
	; Switch to Banner to reroll and open first
	Loop, %BannerSlot%
	{
		Click, 850, 650 Left
		Sleep, 1000
	}
	Click, 750, 860 Left
	Sleep, 1000
	Click, 700, 700 Left
	Sleep, 3500
	; Spam Skip for 2 seconds
	Loop, 10
	{
		Click, 900, 1025 Left
		Sleep, 200
	}
	Sleep, 500
	
	; 10 Pull Loop - Remaining 11 Pulls
	PullAmount -= 1
	Loop, %PullAmount%
	{

		; Pull again
		Click, 685, 1013 Left
		Sleep, 750
		Click, 683, 706 Left
		Sleep, 3000
		
		; Spam Skip for 2 seconds
		Loop, 10
		{
			Click, 900, 1025 Left
			Sleep, 200
		}
		Sleep, 300
		
	}

	; Go to List
	Click, 427, 1014 Left
	Sleep, 7500
	if (UmaReroll == 1) {
		Click, 550, 1000 Left
		Sleep, 1000
	}
	Click, 318, 1038 Left
	Sleep, 2000
	if (UmaReroll == 0) {
		Click, 680, 711 Left
		Sleep, 1000
		Click, 416, 837 Left
	} else {
		Click, 416, 711 Left
		Sleep, 1000
		Click, 416, 774 Left
		Sleep, 2000
		Click, 550, 1025 Left
	}

	; Done
	if (CompleteSound == 1) {
		SoundPlay, %A_WinDir%\Media\Windows Notify Email.wav
	}

return