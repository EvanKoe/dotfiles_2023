#!/bin/bash

ISSHOWN=`eww get isDockShown`
echo " old : $ISSHOWN"

if [ "$ISSHOWN" = "false" ]; then
  eww update isDockShown="true"
else
  eww update isDockShown="false"
fi

echo "new: $(eww get isDockShown)"
