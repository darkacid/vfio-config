#!/bin/bash
FOUND=`grep "tap0" /proc/net/dev`

if  [ -n "$FOUND" ] ; then
echo yes
else
echo no
fi
