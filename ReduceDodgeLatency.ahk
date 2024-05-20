;You can replace the following variables as you like.
;All of them should be different.

PracticalDodgeKey := "Shift"
PracticalSprintKey := "XButton2" ;I recommend using your in-game "Block" keybind
InGameDodgeKey := "I"

;Just an assumption: whether the following variables work might be affected by your frame rate.

TimeYourGameClientCanDetectChangesOfKeyStates := 30 ;Milliseconds
DelayedTimeYouStartSprintingAfterHoldingTheDodgeKeyFor := 500 ;Milliseconds

;

HotIfWinActive "ELDEN RING™" 
    Hotkey "~" . PracticalDodgeKey, Dodge
    Hotkey "*" . PracticalSprintKey, Sprint
HotIfWinActive

Dodge(*)
{
    IsSprinting := GetKeyState(InGameDodgeKey)
    
    ;Reset the state
    Send "{" InGameDodgeKey " up}"
    Sleep TimeYourGameClientCanDetectChangesOfKeyStates
        
    Send "{" InGameDodgeKey " down}"
    Sleep TimeYourGameClientCanDetectChangesOfKeyStates
    Send "{" InGameDodgeKey " up}"
    
    If IsSprinting
    {
        Sleep TimeYourGameClientCanDetectChangesOfKeyStates
        Send "{" InGameDodgeKey " down}"
    }

    KeyWait PracticalDodgeKey
}

Sprint(*)
{
    If GetKeyState("w") || GetKeyState("a") || GetKeyState("s") || GetKeyState("d")
    {
        Send "{" InGameDodgeKey " down}"
    }

    StartTime := A_TickCount
    KeyWait PracticalSprintKey
    RemainedTime := DelayedTimeYouStartSprintingAfterHoldingTheDodgeKeyFor - A_TickCount + StartTime
    
    if (RemainedTime > 0)
    {
        Sleep RemainedTime
    }

    Send "{" InGameDodgeKey " up}"
}