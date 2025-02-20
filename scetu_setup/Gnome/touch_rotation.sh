
#!/bin/bash

set -e

TOUCHSCREEN='silead_ts'
XDISPLAY='DSI1'
TRANSFORM='libinput Calibration Matrix'

X_SCALE=2.17
Y_SCALE=3.22
X_OFFSET=-0.045
Y_OFFSET=-0.004

if [ -z "$1" ]; then
  ROTATION=right
else
  ROTATION=$1
fi

#xrandr --output $XDISPLAY --rotate $ROTATION
xinput set-prop 'silead_ts' --type=float "$TRANSFORM" 0 $Y_SCALE $Y_OFFSET $X_SCALE 0 $X_OFFSET 0 0 1
xinput --map-to-output "$TOUCHSCREEN" "$XDISPLAY"