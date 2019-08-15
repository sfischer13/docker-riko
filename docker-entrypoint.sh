#!/usr/bin/env bash

set -e -o pipefail

if [ "$1" = '--help' ]; then
    exec ls -1 /home/docker /usr/local
elif [ "$#" -eq 1 ]; then
    exec runpipe "$1"
fi

exec "$@"
