#!/bin/bash

function make-kernel-clang() {
    ARCH=arm64 CC=clang LD=ld.lld LLVM=1 make O=../out $@
}

LD=ld.lld LLVM=1 TARGET_BUILD_VARIANT=user scripts/gki/generate_defconfig.sh vendor/holi-qgki_defconfig
make mrproper
git checkout drivers/input/touchscreen/focaltech_touch/include/**/*.i

make-kernel-clang vendor/holi-qgki_defconfig
mv ../out/.config{,_a}

make-kernel-clang vendor/holi-qgki_defconfig diffconfig/common.config
mv ../out/.config{,_b}
scripts/diffconfig -m ../out/.config_{a,b} > arch/arm64/configs/diffconfig/common.config

for x in pdx225 pdx235 pdx235_j; do
    make-kernel-clang vendor/holi-qgki_defconfig diffconfig/common.config diffconfig/$x.config
    mv ../out/.config{,_c}
    scripts/diffconfig -m ../out/.config_{b,c} > arch/arm64/configs/diffconfig/$x.config
done
