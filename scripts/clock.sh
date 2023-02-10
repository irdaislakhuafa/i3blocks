#!/usr/bin/sh

while (true); do
    hour=$(date +%H)
    minute=$(date +%M)
    # now="$hour:$minute"
    now=$(date +%T) # replace +%R with +%T to show second
    # zone="$(date | awk '{printf$6}')"
    zone="$(date +%Z)"
    interval=$(cat $(pwd)/scripts/interval.conf)

    echo "$now $zone"
    sleep $interval
done

#if [ $hour -lt 06 ]; then
#	mpv ~/.config/i3blocks/resources/waktunya-tidur.m4 > ~/.cache/turu 2> ~/.cache/turu &!
#fi
