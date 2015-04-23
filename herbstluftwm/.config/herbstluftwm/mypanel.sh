#!/bin/bash
# taken from the default and some other configs I found
# ...sorry for stealing your code!
# disable path name expansion or * will be expanded in the line.
# cmd ( $line )

#set -f

## ⮂  ⮀

### THEME ###
#get the colors

. ~/.config/herbstluftwm/solarized

#for bar - first two values are opacity
bgcolor="#BB$base03"
fgcolor="#FF$base0"
curtagbg="#FF$blue"
atagbg="#BB$violet"
uftagbg="#FF$base3"
ftagbg="#99$blue"
urgenttagbg="#FF$red"

#font1='*-gohufont-medium-r-*-*-14-*-*-*-*-*-*-*'
#font1='-*-tewi-medium-*-*-*-17-*-*-*-*-*-iso10646-*'
font1='-*-tewi-medium-*-*-*-11-*-*-*-*-*-iso10646-*'

height=12

sep1=" %{F#FF$blue}|%{F-}"
###

### Functions n stuff ###

#this probably does something important?
function uniq_linebuffered() { 
    awk '$0 != l { print ; l=$0 ; fflush(); }' "$@" 
}

#herbstclient shortcut
hc() { "${herbstclient_command[@]:-herbstclient}" "$@" ;}

#get a list of monitors
MONITORS=( $(hc list_monitors | cut -d: -f1) )

# add padding to all monitors for statusbar
for monitor in ${MONITORS[@]} ; do
	hc pad $monitor $height
done

#prints tags on all monitors
function print_tags() {
    for monitor in ${MONITORS[@]} ; do
        echo -n "%{S$monitor}"
        #echo -n "%{B#FF$base1}"
        TAGS=( $(hc tag_status $monitor) )
        unset TAGS[${#TAGS[@]}]
        for i in "${TAGS[@]}" ; do
            case ${i:0:1} in
                '#') # current tag
                    echo -n "%{B$curtagbg}%{+u}"
                    ;;
                '+') #atag: active - active tag on other monitor
                    echo -n "%{B$atagbg}"
                    ;;
                '-') #uftag: unfocued - tag viewed on different monitor, but monitor not focused
    	    	    echo -n "%{B$uftagbg}"
                    ;;
                '%') #ftag: focused - tag viewed on different monitor and is focused
                    echo -n "%{B$ftagbg}"
                    ;;
                ':') # tag is not empty
                    echo -n "%{B#FF$red}%{+u}"
                    ;;
                '!') # urgent tag
                    echo -n "%{B$urgenttagbg}"
                    ;;
                *)
                    echo -n "%{B#DD$base3}"
                    ;;
            esac
            echo -n " ${i:1} %{U-}%{-u}"
	done
	echo -n "%{B-}%{F#DD$base3}⮀%{F-}"
    done
}

### Statusbar ###

##get the data
{
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

    hc --idle

    killall $gpu_pid $mem_pid $cpu_temp_pid $long_date_pid

##now output the data
} 2> /dev/null | {
    windowtitle="Dave's not here, man..."
    visible=true	

    ### Main Loop ###
    while true ; do
        ### LEFT ###
        echo -n "%{l}"
        ## monitor0 & monitor1
        print_tags 
		
        ### CENTER ###	
	echo -n "%{c}"
	## monitor0
	echo -n "%{S0}"
	echo -n "${windowtitle//^/^^}"
	## monitor1
	#echo -n "%{S1}"
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
	echo -n "%{F#FF$green}⮂%{F-}" 
	echo -n "%{B#FF$green}"
	echo -n "%{F#FF$base03}"
	echo -n " CPU: $cpu_speed $cpu_temp "
	#memory
	echo -n "%{F#FF$base3}⮂%{F-}%{B-}" 
	echo -n "%{B#FF$base3}"
	echo -n "%{F#FF$base03}"
	echo -n " MEM: $mem "
	#gpu
	echo -n "%{F#FF$green}⮂%{F-}%{B-}"
	echo -n "%{B#FF$green}"
	echo -n "%{F#FF$base03}"
	echo -n " GPU: $gpu_temp "
	#date/time
	echo -n "%{F#FF$base3}⮂%{F-}%{B-}" 
	echo -n "%{B#FF$base3}"
	echo -n "%{F#FF$base03}"
	echo -n " $short_date "
	echo -n "%{F#FF$green}"
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
            focus_changed|window_title_changed)
                windowtitle="${cmd[@]:2}"
                ;;
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
} 2> /dev/null | lemonbar -d -u 2 -g x$height -B "$bgcolor" -F "$fgcolor" -f "$font1" $1

