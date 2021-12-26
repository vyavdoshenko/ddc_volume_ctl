#!/bin/bash

if [ $# -ne 3 ]; then
    echo "Usage:"
    echo "$0 VOLUME_CAPABILITY VOLUME_STEP DIRECTION"
    exit 1
fi

readonly VOLUME_CAPABILITY=$1
readonly VOLUME_STEP=$2
readonly DIRECTION=$3

readonly VOLUME=$(ddcutil getvcp ${VOLUME_CAPABILITY} | grep -oP '(?<=Volume level: )[0-9]+')

echo ${VOLUME}
