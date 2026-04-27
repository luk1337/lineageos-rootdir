#!/usr/bin/env bash
set -ex

TAG_BT=BTFM.LA.1.0.r3-.....-pakala.0
TAG_GRAPHICS=GRAPHICS.LA.15.1.r1-.....-WAIPIO.0
TAG_MAIN=LA.VENDOR.15.4.1.r1-.....-WAIPIO.0
TAG_WLAN=WLAN.LA.1.1.r1-.....-WAIPIO.0

pull_latest_tag() {
    TAG=$(git ls-remote $2 2>/dev/null | grep -o "$3$" | sort | tail -1)
    git pull --log=999999999 -X subtree=$1 $2 $TAG
}

pull_latest_tag qcom/opensource/audio-kernel/ https://git.codelinaro.org/clo/la/platform/vendor/qcom/opensource/audio-kernel-ar $TAG_MAIN
pull_latest_tag qcom/opensource/bt-kernel/ https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/bt-kernel $TAG_BT
pull_latest_tag qcom/opensource/camera-kernel/ https://git.codelinaro.org/clo/la/platform/vendor/opensource/camera-kernel $TAG_MAIN
pull_latest_tag qcom/opensource/data-kernel/ https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/data-kernel $TAG_MAIN
pull_latest_tag qcom/opensource/dataipa/ https://git.codelinaro.org/clo/la/platform/vendor/opensource/dataipa $TAG_MAIN
pull_latest_tag qcom/opensource/datarmnet/ https://git.codelinaro.org/clo/la/platform/vendor/qcom/opensource/datarmnet $TAG_MAIN
pull_latest_tag qcom/opensource/datarmnet-ext/ https://git.codelinaro.org/clo/la/platform/vendor/qcom/opensource/datarmnet-ext $TAG_MAIN
pull_latest_tag qcom/opensource/display-drivers/ https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers $TAG_MAIN
pull_latest_tag qcom/opensource/dsp-kernel/ https://git.codelinaro.org/clo/la/platform/vendor/qcom/opensource/dsp-kernel $TAG_MAIN
pull_latest_tag qcom/opensource/graphics-kernel/ https://git.codelinaro.org/clo/la/platform/vendor/qcom/opensource/graphics-kernel $TAG_GRAPHICS
pull_latest_tag qcom/opensource/mm-drivers/ https://git.codelinaro.org/clo/la/platform/vendor/opensource/mm-drivers $TAG_MAIN
pull_latest_tag qcom/opensource/mm-sys-kernel/ https://git.codelinaro.org/clo/la/platform/vendor/opensource/mm-sys-kernel $TAG_MAIN
pull_latest_tag qcom/opensource/mmrm-driver/ https://git.codelinaro.org/clo/la/platform/vendor/opensource/mmrm-driver $TAG_MAIN
pull_latest_tag qcom/opensource/securemsm-kernel/ https://git.codelinaro.org/clo/la/platform/vendor/qcom/opensource/securemsm-kernel $TAG_MAIN
pull_latest_tag qcom/opensource/spu-kernel/ https://git.codelinaro.org/clo/la/platform/vendor/qcom/opensource/spu-kernel $TAG_MAIN
pull_latest_tag qcom/opensource/synx-kernel/ https://git.codelinaro.org/clo/la/platform/vendor/opensource/synx-kernel $TAG_MAIN
pull_latest_tag qcom/opensource/touch-drivers/ https://git.codelinaro.org/clo/la/platform/vendor/opensource/touch-drivers $TAG_MAIN
pull_latest_tag qcom/opensource/video-driver/ https://git.codelinaro.org/clo/la/platform/vendor/opensource/video-driver $TAG_MAIN
pull_latest_tag qcom/opensource/wlan/fw-api/ https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/wlan/fw-api $TAG_WLAN
pull_latest_tag qcom/opensource/wlan/platform/ https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/wlan/platform $TAG_WLAN
pull_latest_tag qcom/opensource/wlan/qca-wifi-host-cmn/ https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/wlan/qca-wifi-host-cmn $TAG_WLAN
pull_latest_tag qcom/opensource/wlan/qcacld-3.0/ https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/wlan/qcacld-3.0 $TAG_WLAN
pull_latest_tag nxp/opensource/driver/ https://git.codelinaro.org/clo/la/platform/vendor/nxp/opensource/driver $TAG_MAIN
