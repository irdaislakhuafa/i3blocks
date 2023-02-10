#!/usr/bin/sh

while (true); do

	stat=$(expr $(cat /sys/class/backlight/intel_backlight/brightness) / $(expr $(cat /sys/class/backlight/intel_backlight/max_brightness) / 100))
	icon=''
	interval=$(cat $(pwd)/scripts/interval.conf)

	if [ $stat -le 20 ]; then
		echo '<span color="#ffffff">'$icon $stat"%"'</span>'
	elif [ $stat -gt 20 -a $stat -le 40 ]; then
		echo '<span color="#0055ff">'$icon $stat"%"'</span>'
	elif [ $stat -gt 40 -a $stat -le 60 ]; then
		echo '<span color="#00ff00">'$icon $stat"%"'</span>'
	elif [ $stat -gt 60 -a $stat -le 80 ]; then
		echo '<span color="#ffff00">'$icon $stat"%"'</span>'
	elif [ $stat -gt 80 ]; then
		echo '<span color="#ff0000">'$icon $stat"%"'</span>'
	fi

	sleep $interval
done
