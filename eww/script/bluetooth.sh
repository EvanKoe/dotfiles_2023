#!/bin/bash

DEV=$(bluetoothctl info)

if [[ "$DEV" == "Missing device address argument"* ]]; then
  echo "Not connected"
  exit 0
fi

DEV=`echo $DEV | grep -o -P '(?<=Name: ).*(?= Alias:)'`
echo "$DEV"
exit 0
