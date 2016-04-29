#!/bin/sh
#
# ~/.xinitrc


if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

export PATH=$PATH:~/bin/:~/omnisharp-server
export BROWSER=firefox
export EDITOR=emacs
export TERM=urxvtc
#export POWERLINE_CONFIG_COMMAND=/home/kevin/powerline/scripts/powerline-config

sh ~/.fehbg &
#pcmanfm -d &
urxvtd &
#compton --config ~/.config/compton.conf -b &

# swap ctrl / capslock
setxkbmap -option 'ctrl:nocaps'
#setxkbmap -option 'ctrl:swapcaps'

#exec i3
#exec ratpoison
#exec herbstluftwm --locked
#exec stumpwm
exec xmonad

#export PANEL_FIFO=/tmp/panel-fifo
#sxhkd &
#exec bspwm

#sxhkd -c ~/.config/swm/sxhkd &
#exec swm
