#!/usr/bin/env bash

source "$(dirname `which $0`)/utils.sh"
SCRIPT_PATH=$(getAbsPath $(dirname `which $0`))
# ASUS MG279 volume down
/usr/bin/bash ${SCRIPT_PATH}/change_volume.sh 62 5 down
