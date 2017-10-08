#SingleInstance, Force
SendMode event
#UseHook On
#NoEnv
#MaxThreadsPerHotkey 2
SetWorkingDir %A_ScriptDir%

#IfWinActive ahk_exe Borderlands2.exe

KeyConsole=

IniRead, KeyConsole, %A_ScriptDir%\BL2SR.ini, HotkeysUtilities, KeyConsole

Loop
{
	ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, *100 %A_ScriptDir%\Autoexec\patch.png
	if !ErrorLevel
	{
		soundplay *48
		msgbox, 0, Borderlands 2 Scripts Redux' Autoexec, Menu Detected! Please wait... 5, 1
		msgbox, 0, Borderlands 2 Scripts Redux' Autoexec, Menu Detected! Please wait... 4, 1
		msgbox, 0, Borderlands 2 Scripts Redux' Autoexec, Menu Detected! Please wait... 3, 1
		msgbox, 0, Borderlands 2 Scripts Redux' Autoexec, Menu Detected! Please wait... 2, 1
		msgbox, 0, Borderlands 2 Scripts Redux' Autoexec, Menu Detected! Please wait... 1, 1
		sleep 500
		send {%KeyConsole%}
		sleep 200
		send exec patch.txt{enter}
		sleep 200
		send {%KeyConsole%}
		soundplay *48
		break
	}
	while ErrorLevel
	{
		ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, *100 %A_ScriptDir%\Autoexec\patch.png
		if !ErrorLevel
		{
			soundplay *48
			msgbox, 0, Borderlands 2 Scripts Redux' Autoexec, Menu Detected! Please wait... 5, 1
			msgbox, 0, Borderlands 2 Scripts Redux' Autoexec, Menu Detected! Please wait... 4, 1
			msgbox, 0, Borderlands 2 Scripts Redux' Autoexec, Menu Detected! Please wait... 3, 1
			msgbox, 0, Borderlands 2 Scripts Redux' Autoexec, Menu Detected! Please wait... 2, 1
			msgbox, 0, Borderlands 2 Scripts Redux' Autoexec, Menu Detected! Please wait... 1, 1
			sleep 500
			send {%KeyConsole%}
			sleep 200
			send exec patch.txt{enter}
			sleep 200
			send {%KeyConsole%}
			soundplay *48
			break
		}
		sleep 250
	}
	break
}
ExitApp
