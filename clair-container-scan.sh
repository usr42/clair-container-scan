#!/bin/sh

usage() {
    echo "Usage: $0 [-pv] [IMAGE_NAME]"
    echo
    echo "Options:"
    echo " -p : Pull images before running scan"
    echo " -v : verbose output"
    exit 1
}

redirect_stderr() {
    if [ "$VERBOSE" = 1 ]; then
        "$@"
    else
        "$@" 2>/dev/null
    fi
}

redirect_all() {
    if [ "$VERBOSE" = 1 ]; then
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
            ;;
        v)
            VERBOSE=1
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
shift $(($OPTIND -1))

BASEDIR=$(cd $(dirname "$0") && pwd)
cd "$BASEDIR"

if [ ! -f "docker-compose.yaml" ]; then
    wget -q https://raw.githubusercontent.com/usr42/clair-container-scan/master/docker-compose.yaml
fi

[ "$PULL" = 1 ] && redirect_all docker-compose pull
redirect_stderr docker-compose run --rm scanner "$@"
ret=$?
redirect_all docker-compose down
exit $ret
