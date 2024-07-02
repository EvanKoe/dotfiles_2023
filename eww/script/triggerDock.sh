#!/bin/bash

ISSHOWN=`eww get isDockShown`
echo "old : $ISSHOWN"

if [ "$ISSHOWN" = "false" ]; then
  RET=`eww update isDockShown=true`
  RET=`eww open dock`
else
  RET=`eww update isDockShown=false`
  RET=`eww close dock`
fi

echo "new : $(eww get isDockShown)"
