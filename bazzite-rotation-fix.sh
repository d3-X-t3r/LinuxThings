#!/usr/bin/env bash

# This script fixes the screen orientation in the Desktop Mode in Bazzite-Deck KDE
# Author: d3Xt3r
# 
# - Save this script somewhere and mark it as executabe (chmod +x ./bazzite-rotation-fix.sh)
# - Add it to your KDE Autostart config (Menu > search for Autostart > Add)

sleep 1
echo $(date '+%Y-%m-%d %H:%M:%S') Starting Bazzite Desktop Orientation Fix script...| tee -a /tmp/bazrotfix.log

# This bit is needed to allow enough time for the desktop to load, otherwise the fix won't work
# Since Steam launches automatically in the Desktop mode in Bazzite-Deck, we can use it 
# to determine whether or not the desktop has loaded.
while ! pgrep -x "steam" > /dev/null; do
	echo $(date '+%Y-%m-%d %H:%M:%S') Waiting for Steam to start.. | tee -a /tmp/bazrotfix.log
	sleep 0.5
done

sleep 1

# Uncomment below lines if you DONT want Steam running in the background while in Desktop mode
#echo $(date '+%Y-%m-%d %H:%M:%S') Closing Steam... | tee -a /tmp/bazrotfix.log
#killall -v -r '.*steam.*' 2>&1 | tee -a /tmp/bazrotfix.log

# Debug: Get current outputs
kscreen-doctor --outputs 2>&1 | tee -a /tmp/bazrotfix.log

# Fix desktop orientation
# Rotation options: right, normal, left, inverted
echo $(date '+%Y-%m-%d %H:%M:%S') Fixing desktop orientation... | tee -a /tmp/bazrotfix.log
kscreen-doctor output.1.rotation.normal 2>&1 | tee -a /tmp/bazrotfix.log

echo $(date '+%Y-%m-%d %H:%M:%S') Ending Bazzite Desktop Orientation Fix script >> /tmp/bazrotfix.log
echo -e '\n' >> /tmp/bazrotfix.log
