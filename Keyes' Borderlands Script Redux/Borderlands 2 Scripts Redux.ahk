;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CODE ;
;;;;;;;;
;
;DON'T MESS WITH THIS UNLESS YOU KNOW WHAT YOU'RE DOING
;YOU'VE BEEN WARNED
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


#SingleInstance, Force
SendMode event
#UseHook On
#NoEnv
#MaxThreadsPerHotkey 2
SetWorkingDir %A_ScriptDir%

Version=
IniRead, Version, %A_ScriptDir%\BL2SR.ini, Version, Version


MsgBox, 4, Borderlands Scripts Redux %Version%, Do you wish to run the autoexec for Community Patch?
IfMsgBox Yes
{
	Run %A_ScriptDir%\Borderlands 2 autoexec.ahk
}

#IfWinActive ahk_exe Borderlands2.exe

;;;;;;;;;;;;;;;;;;;;;;;;;
; Variables for hotkeys ;
;;;;;;;;;;;;;;;;;;;;;;;;;
LastWeaponSlot:=
LastLine:=
KeyOverlayCombo:=

KeyEnter=enter
KeyNumEnter=numpadenter
KeyEsc=esc

KeyPause=
KeyOverlay1=
KeyOverlay2=
KeyChat=

KeyConsole=
KeyExecPatch=

KeyQuickFire=
KeyQuickReload=

KeyWeaponSlot1=
KeyWeaponSlot2=
KeyWeaponSlot3=
KeyWeaponSlot4=

KeyIngameUse=
KeyIngameDrop=

DelayTimerDrop=
DelayTimerSwitch=
DelayMouseTimer=

SteamPath=

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Read hotkeys from .ini file and bind them to variables ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
IniRead, KeyPause, %A_ScriptDir%\BL2SR.ini, HotkeysUtilities, KeyPause

IniRead, KeyOverlay1, %A_ScriptDir%\BL2SR.ini, HotkeysUtilities, KeyOverlay1
IniRead, KeyOverlay2, %A_ScriptDir%\BL2SR.ini, HotkeysUtilities, KeyOverlay2
IniRead, KeyChat, %A_ScriptDir%\BL2SR.ini, HotkeysUtilities, KeyChat

IniRead, KeyConsole, %A_ScriptDir%\BL2SR.ini, HotkeysUtilities, KeyConsole
IniRead, KeyExecPatch, %A_ScriptDir%\BL2SR.ini, HotkeysUtilities, KeyExecPatch

IniRead, KeyQuickFire, %A_ScriptDir%\BL2SR.ini, HotkeysGame, KeyQuickFire
IniRead, KeyQuickReload, %A_ScriptDir%\BL2SR.ini, HotkeysGame, KeyQuickReload

IniRead, KeyWeaponSlot1, %A_ScriptDir%\BL2SR.ini, HotkeysGame, KeyWeaponSlot1
IniRead, KeyWeaponSlot2, %A_ScriptDir%\BL2SR.ini, HotkeysGame, KeyWeaponSlot2
IniRead, KeyWeaponSlot3, %A_ScriptDir%\BL2SR.ini, HotkeysGame, KeyWeaponSlot3
IniRead, KeyWeaponSlot4, %A_ScriptDir%\BL2SR.ini, HotkeysGame, KeyWeaponSlot4

IniRead, KeyIngameUse, %A_ScriptDir%\BL2SR.ini, HotkeysGame, KeyIngameUse
IniRead, KeyIngameDrop, %A_ScriptDir%\BL2SR.ini, HotkeysGame, KeyIngameDrop

IniRead, DelayTimerDrop, %A_ScriptDir%\BL2SR.ini, HotkeysInterval, DelayTimerDrop
IniRead, DelayTimerSwitch, %A_ScriptDir%\BL2SR.ini, HotkeysInterval, DelayTimerSwitch
IniRead, DelayMouseTimer, %A_ScriptDir%\BL2SR.ini, HotkeysInterval, DelayMouseTimer

IniRead, SteamPath, %A_ScriptDir%\BL2SR.ini, SteamPath, SteamPath

;Checks how many overlay keys are used
if KeyOverlay2 = 
{
	KeyOverlayCombo=%KeyOverlay1%
}
else
{
	KeyOverlayCombo=%KeyOverlay1% & %KeyOverlay2%
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Hotkey variables binding to labels ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Hotkey, %KeyPause%, PauseScript, on

Hotkey, %KeyOverlayCombo%, DisableOnOverlay, on

Hotkey, %KeyChat%, DisableOnChat, on

Hotkey, %KeyExecPatch%, ExecPatch, on

Hotkey, %KeyQuickFire%, QuickFire, on

Hotkey, %KeyQuickReload%, QuickReload, on

Hotkey, %KeyWeaponSlot1%, WeaponSlotCheck, on

Hotkey, %KeyWeaponSlot2%, WeaponSlotCheck, on

Hotkey, %KeyWeaponSlot3%, WeaponSlotCheck, on

Hotkey, %KeyWeaponSlot4%, WeaponSlotCheck, on

Hotkey, %KeyEnter%, CheckHotkeys, on

Hotkey, %KeyNumEnter%, CheckHotkeys, on

Hotkey, %KeyEsc%, CheckHotkeys, on
return


;;;;;;;;;;
; Labels ;
;;;;;;;;;;

;Overlay / Chat Check
;	Purpose of the following isto disable most 
;	hotkeys of the script while Steam Overlay
;	or ingame chat is active
DisableOnOverlay:
	send {%KeyOverlay1% down}{%KeyOverlay2% down}
	sleep 100
	send {%KeyOverlay1% up}{%KeyOverlay2% up}
	sleep 150
	Loop, read, %SteamPath%
	{
		LastLine:=A_LoopReadLine
	}
	IfInString, LastLine, enable
	{		
		Hotkey, %KeyQuickFire%, off
		Hotkey, %KeyQuickReload%, off
		Hotkey, %KeyWeaponSlot1%, off
		Hotkey, %KeyWeaponSlot2%, off
		Hotkey, %KeyWeaponSlot3%, off
		Hotkey, %KeyWeaponSlot4%, off
		Hotkey, %KeyExecPatch%, off
		Hotkey, %KeyChat%, off
		return
	}
	else
	{
		Hotkey, %KeyQuickFire%, on
		Hotkey, %KeyQuickReload%, on
		Hotkey, %KeyWeaponSlot1%, on
		Hotkey, %KeyWeaponSlot2%, on
		Hotkey, %KeyWeaponSlot3%, on
		Hotkey, %KeyWeaponSlot4%, on
		Hotkey, %KeyExecPatch%, on
		Hotkey, %KeyChat%, on
		return
	}
return

CheckHotkeys:
	send {%A_ThisHotkey%}
	if (A_ThisHotkey = "esc")
	{
		LastLine=0
		Hotkey, %KeyQuickFire%, on
		Hotkey, %KeyQuickReload%, on
		Hotkey, %KeyWeaponSlot1%, on
		Hotkey, %KeyWeaponSlot2%, on
		Hotkey, %KeyWeaponSlot3%, on
		Hotkey, %KeyWeaponSlot4%, on
		Hotkey, %KeyExecPatch%, on
		Hotkey, %KeyChat%, on
		return
	}
	if (A_ThisHotkey = "enter" || A_ThisHotkey = "numpadenter")
	{
		IfInString, LastLine, enable
		{
			Hotkey, %KeyQuickFire%, off
			Hotkey, %KeyQuickReload%, off
			Hotkey, %KeyWeaponSlot1%, off
			Hotkey, %KeyWeaponSlot2%, off
			Hotkey, %KeyWeaponSlot3%, off
			Hotkey, %KeyWeaponSlot4%, off
			Hotkey, %KeyExecPatch%, off
			Hotkey, %KeyChat%, off
			return
		}
		else
		{
			Hotkey, %KeyQuickFire%, on
			Hotkey, %KeyQuickReload%, on
			Hotkey, %KeyWeaponSlot1%, on
			Hotkey, %KeyWeaponSlot2%, on
			Hotkey, %KeyWeaponSlot3%, on
			Hotkey, %KeyWeaponSlot4%, on
			Hotkey, %KeyExecPatch%, on
			Hotkey, %KeyChat%, on
			return
		}
	}
return

DisableOnChat:
	send {%KeyChat%}
	Hotkey, %KeyQuickFire%, off
	Hotkey, %KeyQuickReload%, off
	Hotkey, %KeyWeaponSlot1%, off
	Hotkey, %KeyWeaponSlot2%, off
	Hotkey, %KeyWeaponSlot3%, off
	Hotkey, %KeyWeaponSlot4%, off
	Hotkey, %KeyExecPatch%, off
	Hotkey, %KeyChat%, off
	return
return



;Quick reload and Quick fire scripts
;	The real stars of the script
QuickReload:
	if (GetKeyState(KeyQuickReload,"P"))
	{
		Send %KeyIngameDrop%
		Sleep %DelayTimerDrop%
		Send %KeyIngameUse%
		Sleep %DelayTimerSwitch%
		Send %LastWeaponSlot%
		return
	}
return	

QuickFire:
	while (GetKeyState(KeyQuickFire, "P"))
	{
		Click
		SetMouseDelay %DelayMouseTimer%
	}
	send {%KeyQuickFire% up}
return


;Routine to check what was the last weapon selected:
;	That makes it the second part of the Quick Reload process
;	ensuring the script always knows which was the last weapon
;	selected to switch back to it after pickup.
WeaponSlotCheck:
	if (GetKeyState(KeyWeaponSlot1,"P"))
	{
		Send %KeyWeaponSlot1%
		LastWeaponSlot=%KeyWeaponSlot1%
		return
	}

	else if (GetKeyState(KeyWeaponSlot2, "P"))
	{
		Send %KeyWeaponSlot2%
		LastWeaponSlot=%KeyWeaponSlot2%
		return
	}

	else if (GetKeyState(KeyWeaponSlot3, "P"))
	{
		Send %KeyWeaponSlot3%
		LastWeaponSlot=%KeyWeaponSlot3%
		return
	}

	else if (GetKeyState(KeyWeaponSlot4, "P"))
	{
		Send %KeyWeaponSlot4%
		LastWeaponSlot=%KeyWeaponSlot4%
		return
	}
return


;Manually execute Community Patch
;	Just in case the autoexec fails
ExecPatch:
	if (GetKeyState(KeyExecPatch, "P"))
	{
		Send {%KeyConsole%}exec patch.txt{enter}
		Sleep 350
		Send {%KeyConsole%}
		return
	}
return


;Script Pause toggle 
;   Pauses when needed
;	resumes if desired
PauseScript:
	suspend
	pause,,1
	if (A_IsSuspended)
	{
		TrayTip Borderlands 2 Scripts Redux %Version%, Hotkeys disabled
		soundplay %A_ScriptDir%\Sound\Off.mp3
	}
	else
	{
		TrayTip Borderlands 2 Scripts Redux %Version%, Hotkeys enabled
		soundplay %A_ScriptDir%\Sound\On.mp3
	}
return
