#!/bin/sh

scan_images.sh $(docker ps --format='{{.Image}}' | paste -s -d " " -)
