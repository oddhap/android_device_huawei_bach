#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
#

VENDOR_PATH := device/huawei/bach

TARGET_KERNEL_VERSION := 4.9

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8937
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := msm8937
TARGET_BOARD_PLATFORM_GPU := qcom-adreno505

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_BOARD_SUFFIX := _64

# Assert
TARGET_OTA_ASSERT_DEVICE := bach,bah,BAH,CPN,cpn,msm8937,HwBAH-Q,HWCPN-Q

# Display
TARGET_SCREEN_DENSITY := 320

# Minimal VINTF
DEVICE_MANIFEST_FILE := $(VENDOR_PATH)/prebuilts/manifest_minimal.xml
DEVICE_MATRIX_FILE := $(VENDOR_PATH)/prebuilts/compatibility_matrix_minimal.xml

# Kernel / boot image
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci androidboot.usbconfigfs=true lpm_levels.sleep_disabled=1 slub_min_objects=12 loop.max_part=7 androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_SOURCE := kernel/huawei/bach
TARGET_KERNEL_CONFIG := lineageos_bach_defconfig
TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_KERNEL_ADDITIONAL_FLAGS += CLANG_TRIPLE_ARM32=arm-linux-androideabi-

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE     := 83886080
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE  := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE    := 268435456
BOARD_FLASH_BLOCK_SIZE             := 131072
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 83886080
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 3154116608
BOARD_USERDATAIMAGE_PARTITION_SIZE := 25732005376
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_SIZE   := 771751936
TARGET_COPY_OUT_VENDOR := vendor
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Recovery
TARGET_RECOVERY_FSTAB := $(VENDOR_PATH)/rootdir/fstab.qcom

# Root
BOARD_ROOT_EXTRA_FOLDERS += \
    persist

BOARD_ROOT_EXTRA_SYMLINKS += \
    /vendor/firmware_mnt:/firmware \
    /mnt/vendor/persist:/persist \
    /vendor/dsp:/dsp

# Minimal SELinux: first boot is intentionally permissive.
BOARD_VENDOR_SEPOLICY_DIRS += $(VENDOR_PATH)/sepolicy/minimal
SELINUX_IGNORE_NEVERALLOWS := true

VENDOR_SECURITY_PATCH := 2021-06-05

# Inherit the common proprietary files.
-include vendor/huawei/bach/BoardConfigVendor.mk
