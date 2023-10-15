#!/bin/bash

if [ "$1" -z ]; then
  echo "USAGE: ./triggerDock.sh VARIABLE [--toggle] NEW_VALUE"
  exit 1
fi

TOGGLE=false

while [ $# -ne 0 ]
do
  ARG="$1"
  if [ "$ARG" = "--toggle" ]; then
    TOGGLE=true
  fi
done

ISSHOWN=`eww get isDockShown`
echo "old : $ISSHOWN"

if [ "$ISSHOWN" = "false" ]; then
  RET=`eww update isDockShown="true"`
else
  RET=`eww update isDockShown="false"`
fi

echo "new : $(eww get isDockShown)"
