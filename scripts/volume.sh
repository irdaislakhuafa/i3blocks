#!/usr/bin/sh

while (true); do
    percent=$(amixer | grep Right | grep Playback | grep % | cut -d '[' -f 2 | cut -d ']' -f -1 | awk '{printf "%i", $1}')
    stat=$(amixer | grep Right | grep Playback | grep % | awk '{printf "%s", $6}')
    icon=''
    interval=$(cat $(pwd)/scripts/interval.conf)

    if [ $percent -le 40 ]; then
        echo '<span color="#0055ff">'$icon $percent"%" $stat'</span>'
    elif [ $percent -gt 40 -a $percent -le 60 ]; then
        echo '<span color="#00ff00">'$icon $percent"%" $stat'</span>'
    elif [ $percent -gt 60 -a $percent -le 80 ]; then
        echo '<span color="#ffff00">'$icon $percent"%" $stat'</span>'
    elif [ $percent -gt 80 ]; then
        echo '<span color="#ff0000">'$icon $percent"%" $stat'</span>'
    else
        echo '<span color="#ffffff">'$icon '[off]</span>'
    fi
    sleep $interval
done
