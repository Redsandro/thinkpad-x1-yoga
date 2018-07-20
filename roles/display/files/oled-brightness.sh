#!/bin/bash
export XAUTHORITY=/home/redsandro/.Xauthority
export DISPLAY=:0.0

OLED_BR=`xrandr --verbose | grep -i brightness | cut -f2 -d ' '`
CURR=`LC_ALL=C /usr/bin/printf "%.*f" 1 $OLED_BR`
PANEL="eDP-1"

MIN=0
MAX=1.2

if [ "$1" == "up" ]; then
    VAL=`echo "scale=1; $CURR+0.1" | bc`
else
    VAL=`echo "scale=1; $CURR-0.1" | bc`
fi

if (( `echo "$VAL < $MIN" | bc -l` )); then
    VAL=$MIN
elif (( `echo "$VAL > $MAX" | bc -l` )); then
    VAL=$MAX
else
    if [ "$1" == "up" ]; then
        for I in {1..10..1}; do xrandr --output $PANEL --brightness `echo "scale=2; $I/100+$CURR" | bc` 2>&1 >/dev/null | logger -t oled-brightness; done
    else
        for I in {1..10..1}; do xrandr --output $PANEL --brightness `echo "scale=2; $CURR-$I/100" | bc` 2>&1 >/dev/null | logger -t oled-brightness; done
    fi
fi

# Store fake value into intel backlight to sync OSD brightness meter
INTEL_PANEL="/sys/devices/pci0000:00/0000:00:02.0/drm/card0/card0-$PANEL/intel_backlight"
if [ -d "$INTEL_PANEL" ]; then
    PERCENT=`echo "scale=4; $VAL/$MAX" | bc -l`
    INTEL_MAX=$(cat "$INTEL_PANEL/max_brightness")
    INTEL_BRIGHTNESS=`echo "scale=4; $PERCENT*$INTEL_MAX" | bc -l`
    INTEL_BRIGHTNESS=`LC_ALL=C /usr/bin/printf "%.*f" 0 $INTEL_BRIGHTNESS`
    echo $INTEL_BRIGHTNESS > "$INTEL_PANEL/brightness"
fi
