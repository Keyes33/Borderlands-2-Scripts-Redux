# Borderlands-2-Scripts-Redux
Simple Scripts for Borderlands 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; README ;
;;;;;;;;;;
;
;Keyes' Borderlands 2 Scripts Redux 1.5
;
;;;;;;;;;;;;;;;;
; INSTRUCTIONS ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;This is NOT a pick up and use script, and you'll have to get your hands dirty with some setting up before using it. Should be fairly
;simple to do, though. 
;
;First step: You should open BL2SR.ini and from there it should be self explanatory on how to set the hotkeys for the scripts.
;
;Second step (Optional): If you plan on using the Borderlands Community Patch and you get tired of -or simply forget to- execute the 
;patch every time you launch the game, this is for you: There's an AutoExec script and an option to launch it everytime you execute
;the main script. I'm not going to bother you on how it works, but it NEEDS you to follow simple steps on how to make it work. Go to
;the Autoexec folder and read it's readme if you're interested. Should be quite easy to set it up perfectly.
;
;;;;;;;;;;;;;;;;;;
; GENERAL ADVICE ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;As with any AHK and apps, they tend to show weird behaviour when software runs on fullscreen. With that being said, set your 
;Borderlands 2 to Windowed or Borderless, else you might (very likely) have issues with these scripts.
;
;I've noticed these scripts tend to show weird behaviour if you're not hosting/has latency. (Mostly with QuickReload). To circumvent 
;this use more conservative values on DelayTimerDrop and DelayTimerSwitch. 100ms \ 1000ms respectively seems to be enough. Be aware 
;though, I've never personaly tested these on extreme latency scenarios neither low FPS ones. 
;
;Play around with the values and see what works best for you!!!
;
; That's it
; HAVE FUN!
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
