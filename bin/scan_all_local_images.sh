#!/bin/sh

clair_ip=$(/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2| cut -d' ' -f1)
mkdir /tmp/report/
docker ps --format='{{.Image}}' | sort -u | while read image
do 
    clair-scanner -c=http://clair:6060 --ip=$clair_ip -r /tmp/report/$(echo $image|md5sum |cut -d' ' -f1).json $image > /dev/null 2> /dev/null
done

if [ -n "$(ls -A /tmp/report)" ]
then
    jq -sM . /tmp/report/*
fi
