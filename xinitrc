#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)


if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

export PATH=$PATH:~/bin/
export BROWSER=firefox
export EDITOR=vim
export TERM=urxvtc
export POWERLINE_CONFIG_COMMAND=/home/kevin/powerline/scripts/powerline-config

sh ~/.fehbg &
#pcmanfm -d &
urxvtd &
compton --config ~/.config/compton.conf -b &

#exec i3
#exec ratpoison
exec herbstluftwm --locked

#export PANEL_FIFO=/tmp/panel-fifo
#sxhkd &
#exec bspwm

#exec $1

##case "$1" in
#	i3) exec i3 ;;
#	awesome) exec awesome ;;
#	lxqt) exec startlxqt ;;
#	cinnamon) cinnamon-session ;;
#	*) exec $DEFAULTSESSION ;;
#esec
