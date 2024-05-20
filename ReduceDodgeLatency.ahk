;You can replace the following variables as you like.
;All of them should be different.

PracticalDodgeKey := "Shift"
PracticalDashKey := "XButton2" ;I recommend using your in-game "Guard" shortcut
InGameDodgeKey := "I"

;Just an assumption: whether the following variables work might be affected by your frame rate.

TimeYourGameClientCanDetectChangesOfKeyStates := 30 ;Milliseconds
DelayedTimeYouStartDashingAfterHoldingTheDodgeKeyFor := 500 ;Milliseconds

;

HotIfWinActive "ELDEN RING™" 
    Hotkey "~" . PracticalDodgeKey, Dodge
    Hotkey "*" . PracticalDashKey, Dash
HotIfWinActive

Dodge(*)
{
    IsDashing := GetKeyState(InGameDodgeKey)
    
    ;Reset the state
    Send "{" InGameDodgeKey " up}"
    Sleep TimeYourGameClientCanDetectChangesOfKeyStates
        
    Send "{" InGameDodgeKey " down}"
    Sleep TimeYourGameClientCanDetectChangesOfKeyStates
    Send "{" InGameDodgeKey " up}"
    
    If IsDashing
    {
        Sleep TimeYourGameClientCanDetectChangesOfKeyStates
        Send "{" InGameDodgeKey " down}"
    }

    KeyWait PracticalDodgeKey
}

Dash(*)
{
    If GetKeyState("w") || GetKeyState("a") || GetKeyState("s") || GetKeyState("d")
    {
        Send "{" InGameDodgeKey " down}"
    }

    StartTime := A_TickCount
    KeyWait PracticalDashKey
    RemainedTime := DelayedTimeYouStartDashingAfterHoldingTheDodgeKeyFor - A_TickCount + StartTime
    
    if (RemainedTime > 0)
    {
        Sleep RemainedTime
    }

    Send "{" InGameDodgeKey " up}"
}