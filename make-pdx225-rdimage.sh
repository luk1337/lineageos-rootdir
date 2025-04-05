#!/bin/bash

# Apply patches
sed -i 's/Product name/RD Product name/g' bootable/recovery/recovery.cpp bootable/recovery/fastboot/fastboot.cpp
sed -i 's/androidboot.force_normal_boot/androidboot.force_normal_boox/g' system/core/init/first_stage_init.cpp

# Build boot
. build/envsetup.sh
breakfast pdx225
m bootimage

# Build merged dtb
sed -i 's/CONFIG_BUILD_ARM64_DT_OVERLAY=y/CONFIG_BUILD_ARM64_DT_OVERLAY=n/g' kernel/sony/sm6375/arch/arm64/configs/diffconfig/common.config
m bootimage

# Restore original code
sed -i 's/RD Product name/Product name/g' bootable/recovery/recovery.cpp bootable/recovery/fastboot/fastboot.cpp
sed -i 's/CONFIG_BUILD_ARM64_DT_OVERLAY=n/CONFIG_BUILD_ARM64_DT_OVERLAY=y/g' kernel/sony/sm6375/arch/arm64/configs/diffconfig/common.config
sed -i 's/androidboot.force_normal_boox/androidboot.force_normal_boot/g' system/core/init/first_stage_init.cpp

# Make rdimage
mkbootimg \
    --header_version 2 \
    --cmdline 'androidboot.hardware=qcom androidboot.memcg=1 androidboot.usbcontroller=4e00000.dwc3 cgroup.memory=nokmem,nosocket loop.max_part=7 lpm_levels.sleep_disabled=1 msm_rtb.filter=0x237 pcie_ports=compat service_locator.enable=1 swiotlb=0 ip6table_raw.raw_before_defrag=1 iptable_raw.raw_before_defrag=1' \
    --ramdisk $OUT/ramdisk-recovery.img \
    --kernel $OUT/obj/KERNEL_OBJ/arch/arm64/boot/Image \
    --dtb $OUT/obj/KERNEL_OBJ/arch/arm64/boot/dts/vendor/somc/blair-murray-pdx225_sm5038_generic.dtb \
    --out rdimage.img
