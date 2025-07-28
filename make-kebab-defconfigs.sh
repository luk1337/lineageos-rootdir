#!/bin/bash

function make-kernel-clang() {
    ARCH=arm64 CC=clang LD=ld.lld LLVM=1 make O=../out $@
}

make-kernel-clang vendor/kona-perf_defconfig
mv ../out/.config{,_a}

make-kernel-clang vendor/kona-perf_defconfig vendor/oplus.config
mv ../out/.config{,_b}
scripts/diffconfig -m ../out/.config_{a,b} > arch/arm64/configs/vendor/oplus.config
