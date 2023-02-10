#!/usr/bin/sh

while (true); do
	interval=$(cat $(pwd)/scripts/interval.conf)
	interface="$(ip a | grep usb0: | cut -d ':' -f 2)"

	if [ "$interface" == " usb0" ]; then
		echo '<span color="#55aaff"> </span>' $(ip link | cut -d ":" -f 2 | grep usb0)
	else
		echo ""
	fi
	sleep $interval
done
