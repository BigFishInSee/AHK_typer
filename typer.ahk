#Persistent
SetBatchLines, -1

Gui, Add, Edit, vUserInput w200 h25, Type here...
Gui, Add, Button, Default gStartTyping, Start Typing
Gui, Add, Text, x30 y80 w140, Press F1 to Stop
Gui, Show, Center

return

StartTyping:
    Gui, Submit, NoHide
    Gui, Destroy
    SetTimer, CheckMouseClick, 10
    return

CheckMouseClick:
    if (GetKeyState("LButton", "P")) {
        ; Mouse click detected, start typing
        Loop, Parse, UserInput
        {
	          Random, rand, 50,500
            SendInput, %A_LoopField%
            Sleep, rand
        }
        SetTimer, CheckMouseClick, Off
        return
    }
    return

$F1::
    ; Stop typing and show the GUI again
    SetTimer, CheckMouseClick, Off
    Gui, Show
    return
