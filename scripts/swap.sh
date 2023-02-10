#!/usr/bin/sh

while (true); do
	final="$(free --mebi | grep Swap | awk 'FNR=2 { printf "%sMiB / %sMiB", $3, $4}')"
	swap="$(free --mebi | grep Swap | awk '{print $2}')"
	interval=$(cat $(pwd)/scripts/interval.conf)

	if [ $swap -le 0 ]; then
		echo " (off)"
	else
		echo " $final"
	fi
	sleep $interval
done
