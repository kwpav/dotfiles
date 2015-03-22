#!/bin/bash
# taken from the default and some other configs I found
# ...sorry for stealing your code!
# disable path name expansion or * will be expanded in the line.
# cmd ( $line )

#set -f

### THEME ###
#get the colors
. ~/.config/herbstluftwm/solarized

#color format for bar, first two values are opacity
bgcolor="#BB$base03"
fgcolor="#FF$base0"
curtagbg="#DD$blue"
atagbg="#FF$base01"
uftagbg="#BB$violet"
ftagbg="#99$blue"
urgenttagbg="#FF$red"

font1='*-gohufont-medium-r-*-*-14-*-*-*-*-*-*-*'

height=20

sep1=" %{F#FF$blue}|%{F-}"
###

### Functions n stuff ###
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
		TAGS=( $(hc tag_status $monitor) )
		unset TAGS[${#TAGS[@]}]
		for i in "${TAGS[@]}" ; do
			case ${i:0:1} in
    			'#') # current tag
        			echo -n "%{B$curtagbg}"
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
	    	        echo -n "%{B-}"
					;;
	    	    '!') # urgent tag
					echo -n "%{B$urgenttagbg}"
					;;
		        *)
    		     	echo -n "%{B-}"
        		    ;;
			esac
			echo -n " ${i:1} "
		done
	done
}

function gpu() {
	echo -n "$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)°C"
}

function mem() {
	echo -n "$(free -h | grep Mem | awk '{print $7}')"
}

function cpu_temp() {
	echo -n "$(sensors coretemp-isa-0000 | grep "id 0" | awk '{print $4}' | tr -d '+')"
}

function long_date() {
	echo -n " $(date "+%A %b %d %R") "
}

function short_date() {
	echo -n " $(date "+%F") "
	echo -n " $sdate"
}

function stime() {
	echo -n "$(date "+%H:%M") "
}

### Statusbar ###
hc --idle | {
    windowtitle="Dave's not here, man.." 

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
		long_date 
		## monitor1
		echo -n "%{S1}"
		echo -n " CPU: "
		cpu_temp
		echo -n "$sep1"
		echo -n " MEM: "
		mem
		echo -n "$sep1"
		echo -n " GPU: "
		gpu
		echo -n "$sep1"
		short_date
		stime

		### END OUTPUT ###
		echo ""

		### Data Handling ###
        # wait for next event
        read line || break
        cmd=( $line ) 
        # find out event origin
        case "${cmd[0]}" in
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
	#sleep 1
    done
} 2> /dev/null | lemonbar -u 2 -g x$height -B "$bgcolor" -F "$fgcolor" -f "$font1" $1

