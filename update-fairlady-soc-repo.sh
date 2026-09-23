#!/usr/bin/env bash
set -ex

TAG_KP=KERNEL.PLATFORM.5.0.r1-.....-kernel.0

pull_latest_tag() {
    TAG=$(git ls-remote $2 2>/dev/null | grep -o "$3$" | sort | tail -1)
    if [ ! -z "$1" ]; then
        git pull --log=999999999 -X subtree=$1 $2 $TAG
    else
        git pull --log=999999999 $2 $TAG
    fi
}

pull_latest_tag "" https://git.codelinaro.org/clo/la/kernel/qcom.git $TAG_KP
