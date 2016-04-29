#!/bin/bash
#
# ~/.config/herbstluftwm/mypanel.sh
#
# disable path name expansion or * will be expanded in the line.
# cmd ( $line )

#set -f

### █▓░
##  

### THEME ###
#get the colors

# . ~/.config/herbstluftwm/solarized
# . ~/.config/herbstluftwm/sourcerer
. ~/.config/herbstluftwm/ocean


#for bar - first two values are opacity
bgcolor="#BB$base03"
fgcolor="#FF$base0"

#font1='*-gohufont-medium-r-*-*-14-*-*-*-*-*-*-*'
#font1='-*-tewi-medium-*-*-*-17-*-*-*-*-*-iso10646-*'
#font1='-*-tewi-medium-*-*-*-11-*-*-*-*-*-iso10646-*'
#font1='*-hermit-medium-*-*-*-*-*-*-*-*-*-*-*'
#font1='Hermit:pixelsize=12'
font1='Input Mono Narrow:pixelsize=14'

height=16

lemonbar -d -u 3 -g x$height -B "$bgcolor" -F "$fgcolor" -f "$font1" $1
