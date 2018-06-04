#!/bin/bash

usage() {
    echo "Usage: $0 [-p]"
    echo
    echo "Options:"
    echo " -p : Pull images before running scan"
    echo " -v : verbose output"
    exit 1
}

redirect_stderr() {
    if [ "$VERBOSE" == 1 ]; then
        "$@"
    else
        "$@" 2>/dev/null
    fi
}

redirect_all() {
    if [ "$VERBOSE" == 1 ]; then
        "$@"
    else
        "$@" 2>/dev/null >/dev/null
    fi
}

PULL=0
VERBOSE=0

while getopts ":phv" opt; do
    case $opt in
        p)
            PULL=1
            shift
            ;;
        v)
            VERBOSE=1
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
[ "$PULL" == 1 ] && redirect_all docker-compose pull
redirect_stderr docker-compose run --rm scanner "$@"
ret=$?
redirect_all docker-compose down
exit $ret
