#!/bin/bash

# Where the backlight brightness is stored
BR_DIR="/sys/devices/pci0000:00/0000:00:02.0/drm/card0/card0-eDP-1/intel_backlight/"

test -d "$BR_DIR" || exit 0

MIN=0
MAX=$(cat "$BR_DIR/max_brightness")
VAL=$(cat "$BR_DIR/brightness")

if [ "$1" == "up" ]; then
    VAL=$((VAL+53))
else
    VAL=$((VAL-53))
fi

if [ "$VAL" -lt $MIN ]; then
    VAL=$MIN
elif [ "$VAL" -gt $MAX ]; then
    VAL=$MAX
fi

PERCENT=`echo "$VAL / $MAX" | bc -l`

export XAUTHORITY=/home/redsandro/.Xauthority  # CHANGE "ivo" TO YOUR USER
export DISPLAY=:0.0

# echo "xrandr --output eDP1 --brightness $PERCENT" | logger -t oled-brightness
xrandr --output eDP-1 --brightness $PERCENT 2>&1 >/dev/null | logger -t oled-brightness

echo $VAL > "$BR_DIR/brightness"
