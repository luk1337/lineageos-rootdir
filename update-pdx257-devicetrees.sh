#!/usr/bin/env bash
set -ex

TAG_BT=BTFM.LA.1.0.r3-.....-pakala.0
TAG_GRAPHICS=GRAPHICS.LA.15.1.r1-.....-WAIPIO.0
TAG_KP=KERNEL.PLATFORM.4.0.r1-.....-kernel.0
TAG_MAIN=LA.VENDOR.15.4.1.r1-.....-WAIPIO.0
TAG_WLAN=WLAN.LA.1.1.r1-.....-WAIPIO.0

pull_latest_tag() {
    TAG=$(git ls-remote $2 2>/dev/null | grep -o "$3$" | sort | tail -1)
    if [ ! -z "$1" ]; then
        git pull --log=999999999 -X subtree=$1 $2 $TAG
    else
        git pull --log=999999999 $2 $TAG
    fi
}

pull_latest_tag "" https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/devicetree.git $TAG_KP
pull_latest_tag qcom/audio/ https://git.codelinaro.org/clo/la/platform/vendor/qcom/opensource/audio-devicetree.git $TAG_MAIN
pull_latest_tag qcom/bt/ https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/bt-devicetree.git $TAG_BT
pull_latest_tag qcom/data/ https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/data-devicetree.git $TAG_MAIN
pull_latest_tag qcom/dsp/ https://git.codelinaro.org/clo/la/platform/vendor/qcom/opensource/dsp-devicetree.git $TAG_MAIN
pull_latest_tag qcom/eSE/ https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/eSE-devicetree.git $TAG_MAIN
pull_latest_tag qcom/nfc/ https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/nfc-devicetree.git $TAG_MAIN
pull_latest_tag qcom/synx/ https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/synx-devicetree.git $TAG_MAIN
pull_latest_tag qcom/video/ https://git.codelinaro.org/clo/la/platform/vendor/opensource/video-devicetree.git $TAG_MAIN
pull_latest_tag qcom/wlan/ https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/wlan/wlan-devicetree.git $TAG_WLAN
