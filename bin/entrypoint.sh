#!/bin/sh

if [ "$#" -eq 0 ]; then
    scan_all_local_images.sh
else
    scan_images.sh "$@"
fi
