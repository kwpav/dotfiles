#!/bin/sh
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# caps to ctrl
setxkbmap -option 'ctrl:nocaps'

# set background
# nitrogen --head=0 --set-zoom-fill wallpapers/night.png
# nitrogen --head=1 --set-zoom-fill wallpapers/night.png
# nitrogen --head=2 --set-zoom-fill wallpapers/night.png
# nitrogen --set-scaled wallpapers/atlantisnebula10-5745-1200.png
nitrogen --set-scaled wallpapers/cathedralpillars.jpg

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

compton &

#exec stumpwm
exec qtile
