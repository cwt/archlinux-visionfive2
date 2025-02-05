#!/usr/bin/env dash

if [ -z "$1" ]; then
    echo "ERROR: please provide the drive name (use 'sda' instead of 'sda1')"
    exit 1
fi

growpart "$1" 4 || exit 1
e2fsck -f "$1"4 || exit 1
resize2fs "$1"4 || exit 1

sync
