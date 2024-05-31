#!/bin/bash

# variables for parametesr
A_1080=400
B_1080=450
B_
# Check if wlogout is already running
if pgrep -x "wlogout" > /dev/null; then
    pkill -x "wlogout"
    exit 0
fi

# Detect monitor resolution and scaling factor
resolution=$(hyprctl -j monitors | jq -r '.[] | select(.focused==true) | .height / .scale' | awk -F'.' '{print $1}')
hypr_scale=$(hyprctl -j monitors | jq -r '.[] | select(.focused==true) | .scale')

echo "Detected Resolution: $resolution"

# Set parameters based on screen resolution and scaling factor
if ((resolution >= 1080)); then
    wlogout --protocol layer-shell -b 6 -T $(awk "BEGIN {printf \"%.0f\", $A_1080 * 1080 * $hypr_scale / $resolution}") -B $(awk "BEGIN {printf \"%.0f\", $B_1080 * 1080 * $hypr_scale / $resolution}") &
    echo "Setting parameters for resolution >= 1080p"
else
    wlogout &
    echo "Setting default parameters for resolution <= 720p"
fi
