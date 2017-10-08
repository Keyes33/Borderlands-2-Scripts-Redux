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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Utilities;
;;;;;;;;;;;
;
;
SteamPath=
KeyPause=
KeyOverlay1=
KeyOverlay2=
KeyChat=
KeyEnter=enter
KeyNumEnter=numpadenter
KeyEsc=esc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Community Patch Related ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
KeyConsole=
KeyExecPatch=
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Quick Fire and Quick Reload Related ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
KeyQuickFire=
KeyQuickReload=
;
KeyWeaponSlot1=
KeyWeaponSlot2=
KeyWeaponSlot3=
KeyWeaponSlot4=
;
KeyIngameUse=
KeyIngameDrop=
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Timer Related (CHANGE THESE VALUES IF YOU HAVE ISSUES WITH QuickReload / QuickFire) ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;REFERENCE: 1000 miliseconds = 1 second
;
DelayTimerDrop=
DelayTimerSwitch=
DelayMouseTimer=
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CODE ;
;;;;;;;;
;
;DON'T MESS WITH THIS UNLESS YOU KNOW WHAT YOU'RE DOING
;YOU'VE BEEN WARNED
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

IniRead, KeyOverlay1, %A_ScriptDir%\BL2SR.ini, HotkeysUtilities, KeyOverlay1
IniRead, KeyOverlay2, %A_ScriptDir%\BL2SR.ini, HotkeysUtilities, KeyOverlay2
IniRead, KeyConsole, %A_ScriptDir%\BL2SR.ini, HotkeysUtilities, KeyConsole
IniRead, KeyExecPatch, %A_ScriptDir%\BL2SR.ini, HotkeysUtilities, KeyExecPatch
IniRead, KeyPause, %A_ScriptDir%\BL2SR.ini, HotkeysUtilities, KeyPause
IniRead, KeyChat, %A_ScriptDir%\BL2SR.ini, HotkeysUtilities, KeyChat

IniRead, KeyQuickFire, %A_ScriptDir%\BL2SR.ini, HotkeysGame, KeyQuickFire
IniRead, KeyQuickReload, %A_ScriptDir%\BL2SR.ini, HotkeysGame, KeyQuickReload
IniRead, KeyIngameUse, %A_ScriptDir%\BL2SR.ini, HotkeysGame, KeyIngameUse
IniRead, KeyIngameDrop, %A_ScriptDir%\BL2SR.ini, HotkeysGame, KeyIngameDrop
IniRead, KeyWeaponSlot1, %A_ScriptDir%\BL2SR.ini, HotkeysGame, KeyWeaponSlot1
IniRead, KeyWeaponSlot2, %A_ScriptDir%\BL2SR.ini, HotkeysGame, KeyWeaponSlot2
IniRead, KeyWeaponSlot3, %A_ScriptDir%\BL2SR.ini, HotkeysGame, KeyWeaponSlot3
IniRead, KeyWeaponSlot4, %A_ScriptDir%\BL2SR.ini, HotkeysGame, KeyWeaponSlot4

IniRead, DelayTimerDrop, %A_ScriptDir%\BL2SR.ini, HotkeysInterval, DelayTimerDrop
IniRead, DelayTimerSwitch, %A_ScriptDir%\BL2SR.ini, HotkeysInterval, DelayTimerSwitch
IniRead, DelayMouseTimer, %A_ScriptDir%\BL2SR.ini, HotkeysInterval, DelayMouseTimer

IniRead, SteamPath, %A_ScriptDir%\BL2SR.ini, SteamPath, SteamPath



;Hotkey and variable declaring
;
LastWeaponSlot:=
 
Hotkey, %KeyQuickFire%, QuickFire, on

Hotkey, %KeyQuickReload%, QuickReload, on

Hotkey, %KeyWeaponSlot1%, WeaponSlotCheck, on

Hotkey, %KeyWeaponSlot2%, WeaponSlotCheck, on

Hotkey, %KeyWeaponSlot3%, WeaponSlotCheck, on

Hotkey, %KeyWeaponSlot4%, WeaponSlotCheck, on

Hotkey, %KeyExecPatch%, ExecPatch, on

Hotkey, %KeyPause%, PauseScript, on

Hotkey, %KeyChat%, DisableOnChat, on

Hotkey, %KeyOverlay1% & %KeyOverlay2%, DisableOnOverlay, on

Hotkey, %KeyEnter%, EnableHotkeys, on

Hotkey, %KeyNumEnter%, EnableHotkeys, on

Hotkey, %KeyEsc%, EnableHotkeys, on
return


DisableOnOverlay:
	send {%KeyOverlay1% down}{%KeyOverlay2% down}
	sleep 100
	send {%KeyOverlay1% up}{%KeyOverlay2% up}
	sleep 150
	Loop, read, %SteamPath%
	{
		LastLine := A_LoopReadLine
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
		return
	}
return

EnableHotkeys:
	send {%A_ThisHotkey%}
	Hotkey, %KeyQuickFire%, on
	Hotkey, %KeyQuickReload%, on
	Hotkey, %KeyWeaponSlot1%, on
	Hotkey, %KeyWeaponSlot2%, on
	Hotkey, %KeyWeaponSlot3%, on
	Hotkey, %KeyWeaponSlot4%, on
	Hotkey, %KeyExecPatch%, on
	return
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
	return
return

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



ExecPatch:
	if (GetKeyState(KeyExecPatch, "P"))
	{
		Send {%KeyConsole%}exec patch.txt{enter}
		Sleep 350
		Send {%KeyConsole%}
		return
	}
return



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
