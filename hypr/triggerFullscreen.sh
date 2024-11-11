#!/bin/bash

# Default values
GAPS_IN="0 0 0 0"
GAPS_OUT="0 0 0 0"
ROUNDING=0
BG_COLOR="#1A1B26"


# Getting the actual gaps_in from Hyprland
ACTUAL_GAPSIN="$(hyprctl getoption general:gaps_in -j | jq '.custom')"


# If currently no gaps
if [ "$($HOME/.config/hypr/isMaximized.sh)" = "1" ]; then
    echo "Changing gaps_in to 5, gaps_out to 10 and rounding to 15"
    GAPS_IN="5 5 5 5"
    GAPS_OUT="10 10 10 10"
    ROUNDING=15
else
    echo "Changing gaps_in, gaps_out and rounding to 0"
fi


# Set new gaps with error gestion
GAPSIN_OUTPUT=`hyprctl keyword general:gaps_in "${GAPS_IN}"`
if [ ${?} -ne 0 ]; then
    echo "setting gaps_in failed: ${GAPSIN_OUTPUT}"
fi

GAPSOUT_OUTPUT=`hyprctl keyword general:gaps_out "${GAPS_OUT}"`
if [ ${?} -ne 0 ]; then
    echo "setting gaps_out failed: ${GAPSOUT_OUTPUT}"
fi

ROUNDING_OUTPUT=`hyprctl keyword decoration:rounding ${ROUNDING}`
if [ ${?} -ne 0 ]; then
    echo "setting rounding failed: ${ROUNDING_OUTPUT}"
fi


# Change the bar color
# $HOME/.config/hypr/colorBar.sh
