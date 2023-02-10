#!/usr/bin/sh

while (true); do
	record="$(ps -e | grep ffmpeg | awk '{print $4}')"
	recordp="$(ps -e | grep ffmpeg | awk '{print $4}' | wc -l)"
	rwf="ffmpeg"
	rwa="ffmpeg-alsa.sh"
	rwp=2
	interval=$(cat $(pwd)/scripts/interval.conf)

	if [ "$record" == "$rwf" ]; then
		echo '<span color="#ff0000"> Recording</span>'
	elif [ "$record" == "$rwa" ]; then
		echo '<span color="#ff0000"> Recording(alsa)</span>'
	elif [ $recordp -eq $rwp ]; then
		echo '<span color="#ff0000"> Recording(pulse)</span>'
	else
		echo ""
	fi
	sleep $interval
done
