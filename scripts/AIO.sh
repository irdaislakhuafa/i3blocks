#!/usr/bin/sh

while (true); do
    interval=$(cat $(pwd)/scripts/interval.conf)
    wifi="$($(pwd)/scripts/wifi.sh)"
    battery="$($(pwd)/scripts/battery.sh)"
# TODO: move all config here
    echo "$wifi $battery"
    sleep $interval
done
