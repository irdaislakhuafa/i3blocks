#!/usr/bin/sh

while (true); do

	percent=$(amixer | grep Right | grep Playback | grep % | cut -d '[' -f 2 | cut -d ']' -f -1 | awk '{printf "%i", $1}')
	song=$(mocp -i | grep File: | cut -d '/' -f 5 | cut -d '.' -f 1 | cut -d '-' -f -2)
	stat=$(ps -A | grep mocp | grep "?" | awk '{print$4}')
	timeleft=$(mocp --format %tl)
	mocpstat=$(mocp -i | grep State | cut -d ':' -f 2 | cut -d " " -f 2)
	interval=$(cat $(pwd)/scripts/interval.conf)

	echo '<span color="#0055ff">🎧' "$song ($timeleft)"'</span>'
	# if [ "$stat" == "mocp" -a "$mocpstat" == "PLAY" ]; then
	# 	echo '<span color="#0055ff">🎧' "$song ($timeleft)"'</span>'
	# 	# if [ $percent -le 40 ]; then
	# 	# 	echo '<span color="#0055ff">🎧' "$song ($timeleft)"'</span>'
	# 	# elif [ $percent -gt 40 -a $percent -le 60 ]; then
	# 	# 	echo '<span color="#00ff00">🎧' "$song ($timeleft)"'</span>'
	# 	# elif [ $percent -gt 60 -a $percent -le 80 ]; then
	# 	# 	echo '<span color="#ffff00">🎧' "$song ($timeleft)"'</span>'
	# 	# elif [ $percent -gt 80 ]; then
	# 	# 	echo '<span color="#ff0000">🎧' "$song ($timeleft)"'</span>'
	# 	# fi
	# elif [ "$mocpstat" == "PAUSE" ]; then
	# 	echo '<span color="#ffff00">🎧' "$song (pause)"'</span>'
	# elif [ "$mocpstat" == "STOP" ]; then
	# 	echo '<span color="#00ff00">🎧' "$song (stop)"'</span>'
	# fi
	sleep $interval
done
