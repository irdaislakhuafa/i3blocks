#!/usr/bin/sh

while (true); do

	capacity=$(cat /sys/class/power_supply/BAT0/capacity)
	stat=$(cat /sys/class/power_supply/BAT0/status)
	currentHealth=$(cat /sys/class/power_supply/BAT0/energy_full)
	designHealth=$(cat /sys/class/power_supply/BAT0/energy_full_design)
	designHealth=$(expr $designHealth / 100)
	health="$(expr $currentHealth / $designHealth)"
	all="$capacity% ($health)"
	statusIcon=''
	interval=$(cat $(pwd)/scripts/interval.conf)

	if [ "$stat" == "Discharging" ]; then
		if [ $capacity -le 20 ]; then
			echo '<span color="#ff0000">' $all'</span>'
		elif [ $capacity -gt 20 -a $capacity -le 40 ]; then
			echo '<span color="#ffff00">' $all'</span>'
		elif [ $capacity -gt 40 -a $capacity -le 60 ]; then
			echo '<span color="#00ff00">' $all'</span>'
		elif [ $capacity -gt 60 -a $capacity -le 80 ]; then
			echo '<span color="#0055ff">' $all'</span>'
		elif [ $capacity -gt 80 ]; then
			echo '<span color="#ffffff">' $all'</span>'
		fi
	elif [ "$stat" == "Charging" ]; then
		if [ $capacity -le 20 ]; then
			echo '<span color="#ff0000">' $all'</span>'"($statusIcon)"
		elif [ $capacity -gt 20 -a $capacity -le 40 ]; then
			echo '<span color="#ffff00">' $all'</span>'"($statusIcon)"
		elif [ $capacity -gt 40 -a $capacity -le 60 ]; then
			echo '<span color="#00ff00">' $all'</span>'"($statusIcon)"
		elif [ $capacity -gt 60 -a $capacity -le 80 ]; then
			echo '<span color="#0055ff">' $all'</span>'"($statusIcon)"
		elif [ $capacity -gt 80 ]; then
			echo '<span color="#ffffff">' $all'</span>'"($statusIcon)"
		fi
	else
		if [ $capacity -le 20 ]; then
			echo '<span color="#ff0000">' $all'</span>'"()"
		elif [ $capacity -gt 20 -a $capacity -le 40 ]; then
			echo '<span color="#ffff00">' $all'</span>'"()"
		elif [ $capacity -gt 40 -a $capacity -le 60 ]; then
			echo '<span color="#00ff00">' $all'</span>'"()"
		elif [ $capacity -gt 60 -a $capacity -le 80 ]; then
			echo '<span color="#0055ff">' $all'</span>'"()"
		elif [ $capacity -gt 80 ]; then
			echo '<span color="#ffffff">' $all'</span>'"()"
		fi
	fi
	sleep $interval
done
