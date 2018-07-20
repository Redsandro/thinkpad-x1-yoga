#!/usr/bin/env bash

# WARNING!
# Bad command will prevent your GUI from starting!
# Try with xrandr first to make sure your output is named correctly.
# For example, after upgrading Ubuntu from 16.04 to 18.04, my output changed from eDP1 to eDP-1
/usr/bin/xrandr --output eDP-1 --brightness 0.6
