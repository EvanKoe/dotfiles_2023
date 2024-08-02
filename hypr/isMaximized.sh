#!/bin/bash

# Get the actual gaps_in
ACTUAL_GAPSIN="$(hyprctl getoption general:gaps_in -j | jq '.custom')"

# if gaps_in is "0" then it is maximized
if [ "$ACTUAL_GAPSIN" = "\"0 0 0 0\"" ]; then
    echo 1
else
    echo 0
fi
