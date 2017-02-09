#!/bin/sh
#
# z3bra - 2014 (c) wtfpl
# toggle the fullscreen state of a window
# depends on: focus.sh
#
# modified by me to support 2 monitors

# this file is used to store the previous geometry of a window
FSFILE=${FSFILE:-~/.fwin}

# it's pretty simple, but anyway...
usage() {
    echo "usage: $(basename $0) <wid>"
    exit 1
}

GAP=20

# this will unset the fullscreen state of any fullscreen window if there is one.
# this way, there will only be one window in fullscreen at a time, and no window
# will loose their previous geometry info
#test -f $FSFILE && wtp $(cat $FSFILE)

### hacky way to get screen height and width for 2 monitors
#first monitor
SW1=$(xrandr | grep -w connected | awk -F'[ ]' '{print $3}' | (head -n1) | cut -c1-4)
SH1=$(xrandr | grep -w connected | awk -F'[ ]' '{print $3}' | (head -n1) | cut -c6-9)
#second monitor
SW2=$(xrandr | grep -w connected | awk -F'[ ]' '{print $3}' | (tail -n1) | cut -c1-4) 
SH2=$(xrandr | grep -w connected | awk -F'[ ]' '{print $3}' | (tail -n1) | cut -c6-9)

# get window x position and add width to determine which screen its on
WW=$(wattr w $(pfw))
WX=$(wattr x $(pfw))
WX=$(($WX + ($WW/2)))

# if file exist and contain our window id, it means that out window is in
# fullscreen mode
#if test -f $FSFILE && grep -q $1 $FSFILE; then
    # if the window we removed was our window, delete the file, so we can
    # fullscreen it again later 
#    rm -f $FSFILE
#else
    # if not, then put the current window in fullscreen mode, after saving its
    # geometry and id to $FSFILE we also remove any border from this window.
    wattr xywhi $1 > $FSFILE
    #wtp $(wattr xywh `lsw -r`) $1

    # move the current window to the center of the screen
    if [ $WX -lt $SW1 ] # if its on the first screen...
    then
	wtp $GAP $GAP $(( SW1 - (GAP * 2) )) $(( SH1 - (GAP * 2) )) $1
    elif [ $WX -gt $SW1 ] # if its on the second screen...
    then
	wtp $(( SW1 + GAP )) $GAP $(( SW2 - (GAP * 2) )) $(( SH2 - (GAP * 2) )) $1
    fi
    chwb -s 0 $1
#fi

# now focus the window, and put it in front, no matter which state we're in, and
# put the cursor on its bottom-right corner (for consistency)
~/dotfiles/swmutils/contrib/focus.sh $1
