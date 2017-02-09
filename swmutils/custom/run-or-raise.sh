#!/bin/sh

## run or raise
## start the program if it isnt running
## focus the program if it is

#if [ "$(pidof $1)" ]; then
    # get the window name
    # xdotool getwindowname $(pfw)
    # focus
#    WID=$(xwininfo -root -children | grep $1 | head -n1 | cut -c1-13 | tr -d ' ')
#    ~/dotfiles/swmutils/contrib/focus.sh $WID
#    for WINDOW in $(lsw)
#    do
#	wname $WINDOW
#    done
#else
    # start
#    $1
#fi

CMD=$1

# check to see if the application is running
# if it is, iterate through each open window to find it
# once it is found, then focus on it
if [ "$(pidof $CMD)" ]; then
    # hacky way of focusing on firefox or the terminal...
    if [ $CMD == "firefox" ]; then
	CMD="Pentadactyl"
    elif [ $CMD == "urxvtc" ]; then
	CMD="tmux"
    fi
    
    for WINDOW in $(lsw)
    do
	echo $WINDOW
	if [ "$(wname $WINDOW | grep $CMD)" ]; then
	    ~/dotfiles/swmutils/contrib/focus.sh $WINDOW
	    break
	fi
    done
# if its not running already, run it
else
    $CMD
fi
