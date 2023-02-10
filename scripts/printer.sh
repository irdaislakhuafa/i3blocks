#/usr/bin/sh

# printStatus="$(lpstat -t | grep Printing)"

while(true);
do
    interval=$(cat $(pwd)/scripts/interval.conf)
    if [ "$printStatus" != "" ]; then
        echo "<span color=\"#00aaff\">🖶 </span> $printStatus"
    fi
    sleep $interval
done