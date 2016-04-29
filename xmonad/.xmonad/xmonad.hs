
import XMonad
import XMonad.Config.Desktop

import XMonad.Util.EZConfig (additionalKeysP, removeKeysP) -- emacs style keybinds
import XMonad.Actions.Submap
import XMonad.Actions.WindowGo

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run (spawnPipe, hPutStrLn)

import XMonad.Layout.Gaps

base00 = "#2b303b"
base01 = "#343d46"
base02 = "#4f5b66"
base03 = "#65737e"
base04 = "#a7adba"
base05 = "#c0c5ce"
base06 = "#dfe1e8"
base07 = "#eff1f5"
base08 = "#bf616a"
base09 = "#d08770"
base0A = "#ebcb8b"
base0B = "#a3be8c"
base0C = "#96b5b4"
base0D = "#8fa1b3"
base0E = "#b48ead"
base0F = "#ab7967"

myBorderWidth = 3
myNormalBorderColor = base02
myFocusedBorderColor = base0D

-- TERMINAL
myTerm = "urxvtc -e tmux"

myKeys =
    [ ("M-g", runOrRaise "emacs" (className =? "Emacs")) -- g is for GNU, and because M-e switches screens
    , ("M-f", runOrRaise "firefox" (className =? "Firefox"))
    , ("M-b", sendMessage ToggleStruts)
    ]

myWorkspaces = ["1:dev", "2:www", "3", "4", "5", "6", "7", "8", "9"]

myManageHook = composeAll
               [ manageHook desktopConfig
               , manageDocks
               , className =? "Emacs" --> doShift "1:dev"
               , className =? "Firefox" --> doShift "2:www"
               ]

myLayoutHook = avoidStruts $ layoutHook desktopConfig

myHandleEventHook = docksEventHook <+> handleEventHook desktopConfig

main = do
  xmproc <- spawnPipe "xmobar"
  -- TODO
  --xmproc <- spawnPipe "~/.xmonad/mybar.sh"
  xmonad $ desktopConfig
           { terminal = myTerm
           , modMask = mod4Mask
           , borderWidth = myBorderWidth
           , normalBorderColor = myNormalBorderColor
           , focusedBorderColor = myFocusedBorderColor
           , workspaces = myWorkspaces
           , manageHook = myManageHook
           , layoutHook = myLayoutHook
           , handleEventHook = myHandleEventHook
           , logHook = dynamicLogWithPP $ xmobarPP
                       { ppOutput = hPutStrLn xmproc
                       , ppCurrent = xmobarColor base0B "" . wrap "<" ">"
                       , ppTitle = xmobarColor base0C ""
                       }
           }`additionalKeysP` myKeys
