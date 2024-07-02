#!/bin/bash

GAPS_IN=0
GAPS_OUT=0
ROUNDING=0
BG_COLOR="#1A1B26"

if [ $(hyprctl getoption general:gaps_in -j | jq '.int') -eq 0 ]; then
    echo "changing gaps_in to 5"
    GAPS_IN=5
    GAPS_OUT=10
    ROUNDING=15
    BG_COLOR="rgba(0, 0, 0, 0.3)"
else
    BG_COLOR=`grim -g "19,56 1x1" -t ppm - | convert - -format '%[pixel:p{0,0}]' txt:- | tail -n 1 | cut -d ' ' -f 4`
fi


echo "${BG_COLOR}"
BGCOLOR_OUTPUT=`eww update backgroundColor="${BG_COLOR}"`
if [ ${?} -ne 0 ]; then
    echo "setting bg_color failed: ${BGCOLOR_OUTPUT}"
fi

GAPSIN_OUTPUT=`hyprctl keyword general:gaps_in ${GAPS_IN}`
if [ ${?} -ne 0 ]; then
    echo "setting gaps_in failed: ${GAPSIN_OUTPUT}"
fi

GAPSOUT_OUTPUT=`hyprctl keyword general:gaps_out ${GAPS_OUT}`
if [ ${?} -ne 0 ]; then
    echo "setting gaps_out failed: ${GAPSOUT_OUTPUT}"
fi

ROUNDING_OUTPUT=`hyprctl keyword decoration:rounding ${ROUNDING}`
if [ ${?} -ne 0 ]; then
    echo "setting rounding failed: ${ROUNDING_OUTPUT}"
fi
