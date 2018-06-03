#!/bin/sh

mkdir /tmp/report/
docker ps --format='{{.Image}}' | sort -u | while read image
do
    cs -r /tmp/report/$(echo $image|md5sum |cut -d' ' -f1).json $image > /dev/null 2> /dev/null
done

if [ -n "$(ls -A /tmp/report)" ]
then
    jq -sM . /tmp/report/* | jq '[.[] | select (.vulnerabilities != []) | {image: .image, vulnerabilities: .vulnerabilities}]'|grep -v '^\[\]$' && exit 1 || exit 0
else
    echo "No image scanned."
    exit 1
fi
