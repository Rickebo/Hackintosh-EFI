#!/usr/bin/env bash
MOUNT=/Volumes/EFI
CONFIG_PATH=/Volumes/EFI/EFI/OC/config.plist

if [[ -d "$MOUNT" ]]
then
    echo "$MOUNT already exits, not mounting again."
else
    ./mountefi.sh
fi


echo "Using path $CONFIG_PATH, with new id $1"
EXISTING=$(egrep "alcid=\d+" $CONFIG_PATH -o)

if [ -z "$EXISTING" ]
then
    echo "Found no alcid, exiting..."
    exit 0
fi


echo "Found existing: $EXISTING"
sed -i -E "s/alcid=[0-9]\{1,\}/alcid=$1/" $CONFIG_PATH

NEW=$(egrep "alcid=[0-9]+" $CONFIG_PATH -o)
echo "New value: $NEW"

sudo reboot