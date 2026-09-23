#!/usr/bin/env bash
set -ex

TAG_AUDIO=AUDIO_HANDSET.LA.11.0.r1-.....-kaanapali.0
TAG_BT=BTFM.LA.2.0.r1-.....-kaanapali.0
TAG_CAMERA=CAMERA.LA.6.0.r1-.....-kaanapali.0
TAG_DISPLAY=DISPLAY.LA.6.0.r1-.....-kaanapali.0
TAG_EVA=CV.LA.3.0.r1-.....-kaanapali.0
TAG_GRAPHICS=GRAPHICS.LA.16.0.r1-.....-kaanapali.0
TAG_KP=KERNEL.PLATFORM.5.0.r1-.....-kernel.0
TAG_MAIN=LA.VENDOR.16.2.0.r1-.....-kaanapali.0
TAG_VIDEO=VIDEO_HANDSET.LA.1.0.r1-.....-kaanapali.0
TAG_WLAN=WLAN.LA.2.0.r3-.....-kaanapali.0

pull_latest_tag() {
    TAG=$(git ls-remote $2 2>/dev/null | grep -o "$3$" | sort | tail -1)
    echo TAG=$TAG
    git pull --log=999999999 -X subtree=$1 $2 $TAG
}

pull_latest_tag qcom/opensource/audio-kernel/ https://git.codelinaro.org/clo/la/platform/vendor/qcom/opensource/audio-kernel-ar.git $TAG_AUDIO
pull_latest_tag qcom/opensource/bt-kernel/ https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/bt-kernel.git $TAG_BT
pull_latest_tag qcom/opensource/camera-kernel/ https://git.codelinaro.org/clo/la/platform/vendor/opensource/camera-kernel.git $TAG_CAMERA
pull_latest_tag qcom/opensource/data-kernel/ https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/data-kernel.git $TAG_MAIN
pull_latest_tag qcom/opensource/dataipa/ https://git.codelinaro.org/clo/la/platform/vendor/opensource/dataipa.git $TAG_MAIN
pull_latest_tag qcom/opensource/datarmnet-ext/ https://git.codelinaro.org/clo/la/platform/vendor/qcom/opensource/datarmnet-ext.git $TAG_MAIN
pull_latest_tag qcom/opensource/datarmnet/ https://git.codelinaro.org/clo/la/platform/vendor/qcom/opensource/datarmnet.git $TAG_MAIN
pull_latest_tag qcom/opensource/display-drivers/ https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers.git $TAG_DISPLAY
pull_latest_tag qcom/opensource/dsp-kernel/ https://git.codelinaro.org/clo/la/platform/vendor/qcom/opensource/dsp-kernel.git $TAG_MAIN
pull_latest_tag qcom/opensource/eva-kernel/ https://git.codelinaro.org/clo/la/platform/vendor/opensource/eva-kernel.git $TAG_EVA
pull_latest_tag qcom/opensource/fingerprint/ https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/fingerprint.git $TAG_MAIN
pull_latest_tag qcom/opensource/graphics-kernel/ https://git.codelinaro.org/clo/la/platform/vendor/qcom/opensource/graphics-kernel.git $TAG_GRAPHICS
pull_latest_tag qcom/opensource/mm-drivers/ https://git.codelinaro.org/clo/la/platform/vendor/opensource/mm-drivers.git $TAG_DISPLAY
pull_latest_tag qcom/opensource/mmrm-driver/ https://git.codelinaro.org/clo/la/platform/vendor/opensource/mmrm-driver.git $TAG_VIDEO
pull_latest_tag qcom/opensource/securemsm-kernel/ https://git.codelinaro.org/clo/la/platform/vendor/qcom/opensource/securemsm-kernel.git $TAG_MAIN
pull_latest_tag qcom/opensource/spu-kernel/ https://git.codelinaro.org/clo/la/platform/vendor/qcom/opensource/spu-kernel.git $TAG_MAIN
pull_latest_tag qcom/opensource/synx-kernel/ https://git.codelinaro.org/clo/la/platform/vendor/opensource/synx-kernel.git $TAG_MAIN
pull_latest_tag qcom/opensource/touch-drivers/ https://git.codelinaro.org/clo/la/platform/vendor/opensource/touch-drivers.git $TAG_MAIN
pull_latest_tag qcom/opensource/video-driver/ https://git.codelinaro.org/clo/la/platform/vendor/opensource/video-driver.git $TAG_VIDEO
pull_latest_tag qcom/opensource/wlan/fw-api/ https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/wlan/fw-api.git $TAG_WLAN
pull_latest_tag qcom/opensource/wlan/platform/ https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/wlan/platform.git $TAG_WLAN
pull_latest_tag qcom/opensource/wlan/qca-wifi-host-cmn/ https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/wlan/qca-wifi-host-cmn.git $TAG_WLAN
pull_latest_tag qcom/opensource/wlan/qcacld-3.0/ https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/wlan/qcacld-3.0.git $TAG_WLAN
pull_latest_tag nxp/opensource/driver/ https://git.codelinaro.org/clo/la/platform/vendor/nxp/opensource/driver.git $TAG_MAIN
