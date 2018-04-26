#!/bin/bash

BASEDIR=$(cd $(dirname "$0") && pwd)

cd "$BASEDIR"
docker-compose run --rm scanner "$@" #2>/dev/null
docker-compose down >/dev/null #2>&1
