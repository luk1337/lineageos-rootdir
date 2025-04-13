#!/bin/bash

# Apply patches
sed -i 's/Product name/RD Product name/g' bootable/recovery/recovery.cpp bootable/recovery/fastboot/fastboot.cpp

# Build boot
. build/envsetup.sh
breakfast pioneer
m bootimage

# Restore original code
sed -i 's/RD Product name/Product name/g' bootable/recovery/recovery.cpp bootable/recovery/fastboot/fastboot.cpp

# Make rdimage
mkbootimg \
    --cmdline 'androidboot.hardware=qcom ehci-hcd.park=3 lpm_levels.sleep_disabled=1 sched_enable_hmp=1 sched_enable_power_aware=1 service_locator.enable=1 swiotlb=1 androidboot.configfs=true androidboot.usbcontroller=a800000.dwc3 loop.max_part=7' \
    --ramdisk $OUT/ramdisk-recovery.img \
    --kernel $OUT/obj/KERNEL_OBJ/arch/arm64/boot/Image.gz-dtb \
    --out rdimage.img
