#!/usr/bin/sh

while (true); do
	temp="$(sensors | grep temp1 | grep crit | awk '{printf "%i", $2}')"
	icon=''
	interval=$(cat $(pwd)/scripts/interval.conf)

	if [ $temp -le 40 ]; then
		echo '<span color="#0055ff">'$icon $temp"°C</span>"
	elif [ $temp -gt 40 -a $temp -le 60 ]; then
		echo '<span color="#00ff00">'$icon $temp"°C</span>"
	elif [ $temp -gt 60 -a $temp -le 75 ]; then
		echo '<span color="#ffff00">'$icon $temp"°C</span>"
	elif [ $temp -gt 75 ]; then
		echo '<span color="#ff0000">'$icon $temp"°C</span>"
	fi
	sleep $interval
done
