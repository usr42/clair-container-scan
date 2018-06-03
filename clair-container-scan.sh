#!/bin/bash

usage() {
    echo "Usage: $0 [-p]"
    echo
    echo "Options:"
    echo " -p : Pull images before running scan"
    exit 1
}

PULL=0

while getopts ":ph" opt; do
    case $opt in
        p)
            PULL=1
            shift
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            usage
            ;;
        h)
            usage
            ;;
    esac
done

BASEDIR=$(cd $(dirname "$0") && pwd)

cd "$BASEDIR"
[ "$PULL" == 1 ] && docker-compose pull
docker-compose run --rm scanner "$@" #2>/dev/null
ret=$?
docker-compose down #>/dev/null 2>&1
exit $ret
