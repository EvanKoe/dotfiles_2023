#!/bin/bash


BG_COLOR="rgba(0, 0, 0, 0.3)"

if [ "$($HOME/.config/hypr/isMaximized.sh)" = "1" ]; then
    # previous coordinates: 19,56
    BG_COLOR=`grim -g "10,45 1x1" -t ppm - | magick - -format '%[pixel:p{0,0}]' txt:- | tail -n 1 | cut -d ' ' -f 4`
fi

BGCOLOR_OUTPUT=`eww update backgroundColor="${BG_COLOR}"`
if [ ${?} -ne 0 ]; then
    echo "setting bg_color failed: ${BGCOLOR_OUTPUT}"
fi
