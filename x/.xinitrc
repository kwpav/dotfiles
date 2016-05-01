
#!/bin/sh

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

urxvtd &

#compton --config ~/.config/compton.conf -b &

setxkbmap -option 'ctrl:nocaps'

exec xmonad
