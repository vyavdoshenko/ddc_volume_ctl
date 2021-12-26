#!/bin/bash

if [ $# -ne 3 ]; then
    echo "Usage:"
    echo "$0 VOLUME_CAPABILITY VOLUME_STEP DIRECTION"
    exit 1
fi

readonly local VOLUME_CAPABILITY=$1
readonly local VOLUME_STEP=$2
readonly local DIRECTION=$3

local VOLUME=$(ddcutil getvcp ${VOLUME_CAPABILITY} | grep -oP '(?<=Volume level: )[0-9]+')

echo Current volume is ${VOLUME}

if [ "${DIRECTION}" = "up" ]; then
    let "VOLUME+=${VOLUME_STEP}"
elif [ "${DIRECTION}" = "down" ]; then
    let "VOLUME-=${VOLUME_STEP}"
else
    echo Unknown volume change direction, please choose up or down.
    exit 2
fi

echo Current volume is ${VOLUME}
