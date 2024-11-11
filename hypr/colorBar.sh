#!/bin/bash


BG_COLOR="rgba(0, 0, 0, 0.1)"

MONITORS=$(hyprctl monitors -j | jq length)

X=30

if [ "${MONITORS}" != "1" ]; then
    X=1950
fi

if [ "$($HOME/.config/hypr/isMaximized.sh)" = "1" ]; then
    # previous coordinates: 19,56
    BG_COLOR=`grim -g "${X},45 1x1" -t ppm - | magick - -format '%[pixel:p{0,0}]' txt:- | tail -n 1 | cut -d ' ' -f 4`
fi

BGCOLOR_OUTPUT=`eww update backgroundColor="${BG_COLOR}"`
if [ ${?} -ne 0 ]; then
    echo "setting bg_color failed: ${BGCOLOR_OUTPUT}"
fi
