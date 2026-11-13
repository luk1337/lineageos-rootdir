#!/bin/bash

function make-kernel-clang() {
    ARCH=arm64 CC=clang LD=ld.lld LLVM=1 make O=../out $@
}

make-kernel-clang vendor/sdm670-perf_defconfig
mv ../out/.config{,_a}

make-kernel-clang vendor/sdm670-perf_defconfig vendor/samsung/gts4lv.config
mv ../out/.config{,_b}
scripts/diffconfig -m ../out/.config_{a,b} > arch/arm64/configs/vendor/samsung/gts4lv.config

make-kernel-clang vendor/sdm670-perf_defconfig vendor/samsung/gts4lv.config vendor/samsung/gts4lvwifi.config
mv ../out/.config{,_c}
scripts/diffconfig -m ../out/.config_{b,c} > arch/arm64/configs/vendor/samsung/gts4lvwifi.config
