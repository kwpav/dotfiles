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
curtagbg="#FF$blue"
atagbg="#BB$cyan"
uftagbg="#FF$base3"
ftagbg="#99$blue"
# ftagfg=#"FF$base03"
urgenttagbg="#FF$red"

#font1='*-gohufont-medium-r-*-*-14-*-*-*-*-*-*-*'
#font1='-*-tewi-medium-*-*-*-17-*-*-*-*-*-iso10646-*'
#font1='-*-tewi-medium-*-*-*-11-*-*-*-*-*-iso10646-*'
#font1='*-hermit-medium-*-*-*-*-*-*-*-*-*-*-*'
#font1='Hermit:pixelsize=12'
font1='Input Mono Narrow:pixelsize=14'

height=16
#sep1=" %{F#FF$blue}|%{F-}"
###

### Functions n stuff ###

#this probably does something important?
function uniq_linebuffered() { 
    awk '$0 != l { print ; l=$0 ; fflush(); }' "$@" 
}

### Statusbar ###

##get the data
{
    #active windows
    while true ; do
	echo "window $(stumpish echo-frame-windows)"
	sleeep 1 || break
    done > >(uniq_linebuffered) &
    window_pid=$!

    #groups
    while true ; do
	echo "groups $(stumpish groups)"
	sleep 1 || break
    done > >(uniq_linebuffered) &
    group_pid=$!
    
    #gpu
    while true ; do
        echo "gputemp $(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)°C"
	sleep 5 || break
    done > >(uniq_linebuffered) &
    gpu_pid=$!

    #free memory
    while true ; do
        echo "freemem $(free -h | grep Mem | awk '{print $7}')"
        sleep 5 || break
    done > >(uniq_linebuffered) &
    mem_pid=$!

    #cpu temp
    while true ; do
        echo "cputemp $(sensors coretemp-isa-0000 | grep 'id 0' | awk '{print $4}' | tr -d '+')"
        sleep 1 || break
    done > >(uniq_linebuffered) &
    cpu_temp_pid=$!

    #cpu speed
    while true ; do
        echo "cpuspeed $(cat /proc/cpuinfo | grep -m 1 'cpu MHz' | cut --characters 12-18)"
        sleep 1 || break
    done > >(uniq_linebuffered) &

    #long date
    while true ; do
        #echo "longdate $(date '+%A %b %d')"
        echo "longdate $(ddate)"
        sleep 5 || break
    done > >(uniq_linebuffered) &
    long_date_pid=$!

    #short date
    while true ; do
        echo "shortdate $(date '+%F')"
        sleep 5 || break
    done > >(uniq_linebuffered) &
    short_date_pid=$!

    #time
    while true ; do
        echo "time1 $(date '+%I:%M%P')"
        sleep 1 || break
    done > >(uniq_linebuffered) &
    time_pid=$!

    killall $gpu_pid $mem_pid $cpu_temp_pid $long_date_pid $window_pid $group_pid

##now output the data
} 2> /dev/null | {
    #windowtitle="Dave's not here, man..."
    visible=true	

    ### Main Loop ###
    while true ; do
        ### LEFT ###
        echo -n "%{l}"
        ## monitor0 & monitor1
	echo -n " $window |"
	echo -n " $groups"
        ### CENTER ###	
	echo -n "%{c}"
	## monitor0
	echo -n "%{S0}"
        echo -n "%{F#FF$base3}"
	#echo -n "${windowtitle//^/^^}"
	## monitor1
	echo -n "%{S1}"
	#echo -n "${windowtitle//^/^^}"
	
        ### RIGHT ### 
        echo -n "%{r}"
	## monitor0
	echo -n "%{S0}"
	echo -n " $long_date"
	#echo -n " $stime"
	## monitor1
	echo -n "%{S1}"
	#cpu
	echo -n "%{F#FF$blue}%{F-}" 
	echo -n "%{B#FF$blue}"
	echo -n "%{F#FF$base3}"
	echo -n " CPU: $cpu_speed $cpu_temp "
	#memory
	echo -n "%{F#FF$violet}%{F-}%{B-}" 
	echo -n "%{B#FF$violet}"
	echo -n "%{F#FF$base3}"
	echo -n " MEM: $mem "
	#gpu
	echo -n "%{F#FF$blue}%{F-}%{B-}"
	echo -n "%{B#FF$blue}"
	echo -n "%{F#FF$base3}"
	echo -n " GPU: $gpu_temp "
	#date/time
	echo -n "%{F#FF$violet}%{F-}%{B-}" 
	echo -n "%{B#FF$violet}"
	echo -n "%{F#FF$base3}"
	echo -n " $short_date "
	echo -n "%{F#FF$base3}"
	echo -n " $stime "
	echo -n "%{F-}%{B-}"

	### END OUTPUT ###
	echo ""

	### Data Handling ###
        # wait for next event
        read line || break
        cmd=( $line ) 
        # find out event origin
        case "${cmd[0]}" in
	    window)
                window="${cmd[@]:1}"
                ;;
	    groups)
		groups="${cmd[@]:1}"
		;;
            cputemp)
                cpu_temp="${cmd[@]:1}"
                ;;
            cpuspeed)
                cpu_speed="${cmd[@]:1}"
                ;;
            freemem)
                mem="${cmd[@]:1}"
                ;;
            gputemp)
                gpu_temp="${cmd[@]:1}"
                ;;
            longdate)
                long_date="${cmd[@]:1}"
                ;;
            shortdate)
                short_date="${cmd[@]:1}"
                ;;
            time1)
                stime="${cmd[@]:1}"
                ;;
            #focus_changed|window_title_changed)
            #    windowtitle="${cmd[@]:2}"
            #    ;;
            quit_panel)
                killall lemonbar
                exit
                ;;
            reload)
                killall lemonbar
                exit
                ;;
        esac
    done
} 2> /dev/null | lemonbar -d -u 3 -g x$height -B "$bgcolor" -F "$fgcolor" -f "$font1" $1
