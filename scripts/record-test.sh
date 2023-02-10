#!/usr/bin/sh

while (true); do
	record="$(ps -e | grep ffmpeg | awk '{print $4}')"
	rwf="ffmpeg"
	rwa="ffmpeg-alsa.sh"
	rwp="ffmpeg-pulse.sh"
	interval=$(cat $(pwd)/scripts/interval.conf)

	# if [ "$record" == "$rwf" ]; then
	# 	echo '<span color="#ff0000"> Recording</span>'
	# el
	if [ "$record" == "$rwa" ]; then
		echo '<span color="#ff0000"> Recording(alsa)</span>'
	elif [ "$record" == "$rwp" ]; then
		echo '<span color="#ff0000"> Recording(pulse)</span>'
	fi

	echo "$record"
	sleep $interval
done
