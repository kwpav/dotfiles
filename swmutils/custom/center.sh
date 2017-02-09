#!/bin/sh
#
# this script will put the current window in the center of its screen
# currently only works with 2 monitors

usage() {
    echo "Usage: $basename $0) <wid>"
    exit 1
}


# get current window id, width and height
#WID=$(pfw)
WID=$1
WW=$(wattr w $WID)
WH=$(wattr h $WID)

### hacky way to get screen height and width for 2 monitors
#first monitor
SW1=$(xrandr | grep -w connected | awk -F'[ ]' '{print $3}' | (head -n1) | cut -c1-4)
SH1=$(xrandr | grep -w connected | awk -F'[ ]' '{print $3}' | (head -n1) | cut -c6-9)
#second monitor
SW2=$(xrandr | grep -w connected | awk -F'[ ]' '{print $3}' | (tail -n1) | cut -c1-4)
SH2=$(xrandr | grep -w connected | awk -F'[ ]' '{print $3}' | (tail -n1) | cut -c6-9)

# get window x position and add width to determine which screen its on
WX=$(wattr x $(pfw))
WX=$(($WX + ($WW/2)))

# move the current window to the center of the screen
if [ $WX -lt $SW1 ] # if its on the first screen...
then
    wtp $(((SW1 - WW)/2)) $(((SH1 - WH)/2)) $WW $WH $WID
elif [ $WX -gt $SW1 ] # if its on the second screen...
then
    wtp $((((SW2 - WW)/2) + SW1)) $(((SH2 - WH)/2)) $WW $WH $WID
fi

