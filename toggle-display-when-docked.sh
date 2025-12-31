#!/bin/bash

set -e

# get all the displays that are connected. Built in librem5 screen is DSI-1
connected_displays_str=$(wlr-randr | grep -v "^ " | awk '{print $1}')
# Now split the single string on newlines to get an array of connected displays
readarray -t displays <<<"$connected_displays_str"

for i in "${displays[@]}"
do
	echo "Checking $i"
	if [[ "DSI-1" != "$i" ]]
	then
		# We have at least one connected display that isn't the built-in one
		# Set that display to 0,0 then turn off the built-in display
		echo "Setting primary display to $i"
		wlr-randr --output "$i" --pos 0,0
		wlr-randr --output "DSI-1" --off
		exit 0
	fi
done

echo "No external displays found"
exit 1
