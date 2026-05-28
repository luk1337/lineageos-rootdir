#!/bin/bash

function make-kernel-clang() {
    ARCH=arm64 CC=clang LD=ld.lld LLVM=1 make O=../out $@
}

LD=ld.lld LLVM=1 TARGET_BUILD_VARIANT=user scripts/gki/generate_defconfig.sh vendor/lahaina-qgki_defconfig
