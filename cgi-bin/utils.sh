#!/usr/bin/env bash

getAbsPath() {
    local readonly FILENAME=$1
    local readonly PARENTDIR=$(dirname "${FILENAME}")

    if [ -d "${FILENAME}" ]; then
        echo "$(cd "${FILENAME}" && pwd)"
    elif [ -d "${PARENTDIR}" ]; then
        echo "$(cd "${PARENTDIR}" && pwd)/$(basename "${FILENAME}")"
    fi
}
