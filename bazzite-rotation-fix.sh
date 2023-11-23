#!/usr/bin/env bash

# This scripts fixes the screen orientation in the Desktop Mode in Bazzite-Deck KDE
# 
# - Save this script somewhere and mark it as executabe (chmod +x ./bazzite-rotation-fix.sh)
# - Add it to your KDE Autostart config (Menu > search for Autostart > Add)

sleep 1
echo $(date '+%Y-%m-%d %H:%M:%S') Starting Bazzite Desktop Orientation Fix script...| tee -a /tmp/bazrotfix.log

while ! pgrep -x "steam" > /dev/null; do
	echo $(date '+%Y-%m-%d %H:%M:%S') Waiting for Steam to start.. | tee -a /tmp/bazrotfix.log
	sleep 0.5
done

sleep 1

# Uncomment below lines if you don't want Steam to run in the background while in Desktop mode
#echo $(date '+%Y-%m-%d %H:%M:%S') Closing Steam... | tee -a /tmp/bazrotfix.log
#killall -v -r '.*steam.*' 2>&1 | tee -a /tmp/bazrotfix.log

# rotation options: right, normal, left, inverted
echo $(date '+%Y-%m-%d %H:%M:%S') Fixing desktop orientation... | tee -a /tmp/bazrotfix.log
kscreen-doctor output.1.rotation.normal 2>&1 | tee -a /tmp/bazrotfix.log

echo $(date '+%Y-%m-%d %H:%M:%S') Ending Bazzite Desktop Orientation Fix script >> /tmp/bazrotfix.log
echo -e '\n' >> /tmp/bazrotfix.log
