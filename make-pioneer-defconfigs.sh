#!/bin/bash

function make-kernel-clang() {
    ARCH=arm64 CC=clang LD=ld.lld LLVM=1 make O=../out $@
}

make-kernel-clang vendor/sdm660-perf_defconfig
mv ../out/.config{,_a}

make-kernel-clang vendor/sdm660-perf_defconfig vendor/sony/common.config
mv ../out/.config{,_b}
scripts/diffconfig -m ../out/.config_{a,b} > arch/arm64/configs/vendor/sony/common.config

for x in discovery pioneer voyager kirin mermaid; do
    make-kernel-clang vendor/sdm660-perf_defconfig vendor/sony/common.config vendor/sony/$x.config
    mv ../out/.config{,_c}
    scripts/diffconfig -m ../out/.config_{b,c} > arch/arm64/configs/vendor/sony/$x.config
done
