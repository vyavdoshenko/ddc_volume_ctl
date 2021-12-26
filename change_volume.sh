#!/bin/bash

if [ $# -ne 3 ]; then
    echo "Usage:"
    echo "$0 VOLUME_CAPABILITY VOLUME_STEP DIRECTION"
    exit 1
fi

readonly VOLUME_CAPABILITY=$1
readonly VOLUME_STEP=$2
readonly DIRECTION=$3

VOLUME=$(ddcutil getvcp ${VOLUME_CAPABILITY} | grep -oP '(?<=Volume level: )[0-9]+')

echo Current volume is ${VOLUME}

if [ "${DIRECTION}" = "up" ]; then
    let "VOLUME+=${VOLUME_STEP}"
    if [[ ${VOLUME} -ge 101 ]]; then
        VOLUME=100
    fi
elif [ "${DIRECTION}" = "down" ]; then
    if [[ ${VOLUME} -ge 10 ]]; then
        let "VOLUME-=${VOLUME_STEP}"
    else
        VOLUME=0
    fi
else
    echo Unknown volume change direction, please choose up or down.
    exit 2
fi

echo Changed volume is ${VOLUME}

ddcutil setvcp ${VOLUME_CAPABILITY} ${VOLUME}
