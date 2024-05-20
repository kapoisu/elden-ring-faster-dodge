# Elden Ring Faster Dodge
The AutoHotkey script helps you perform a dodge roll more accurately in Elden Ring. In the original game, your dodge rolls are delayed until the shortcut is released. The script lets you dodge upon pressing down the shortcut. It also allows you to dodge while dashing, and keep dashing afterwards if you still hold the key for dashing.

## Usage
To use the script, you have to download [AutoHotkey](https://www.autohotkey.com/) and install it if you haven't got it. Then download the [ReduceDodgeLatency.ahk](https://github.com/kapoisu/elden-ring-faster-dodge/blob/main/ReduceDodgeLatency.ahk) from this repository. Before you execute it, you have to modify some variables in the script. Check https://www.autohotkey.com/docs/v2/KeyList.htm if you have no idea how to specify a specific key.

Change the value of this variable to the practical shortcut you'd like to use for dodging:
```autohotkey
PracticalDodgeKey := "Shift"
```
, this for dashing:
```autohotkey
PracticalSprintKey := "XButton2"
```
, and finally this for in-game keybind (this can be any unused key):
```autohotkey
InGameDodgeKey := "I"
```

Now you can execute the script.

I recommend setting the key for dashing to the same key as blocking, which may save you a keybind. These two actions do not conflict with each other. Blocking also doesn't prevent your from performing subsequent actions after dashing (e.g., dash + attack.)

## Warning
I have no idea if using AutoHotkey scripts while connecting to the official server would get you a ban. I've only played the co-op version of this game recently.

## FAQ
### Why would you separate the dash function from the dodge roll?
In the beginning, I tried to get the same experience as in Dragon Nest, where you dash after dodging with a single key if the key is being held. Eventually I realized that it's not suitable for this game. There are times when you want to perform a dash and jump without triggering a dodge roll beforehand.

### I've checked the code. There's still short latency before every action?
A short latency is still required for the game to recognize the changes of key states. If you sent a keydown event followed by a keyup event immediately, the game wouldn't notice that you'd ever pressed and released a key.
