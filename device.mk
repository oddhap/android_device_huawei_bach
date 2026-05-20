#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
#

VENDOR_PATH := device/huawei/bach

# AAPT
PRODUCT_CHARACTERISTICS := tablet
PRODUCT_AAPT_CONFIG := normal large xlarge hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Minimal boot/debug permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/tablet_core_hardware.xml

# Ramdisk / vendor init surface
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.bach.rc \
    init.bach.usb.rc \
    ueventd.qcom.rc

# Basic local debug path
PRODUCT_PACKAGES += \
    android.hardware.usb-service.example

PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.qti.va_aosp.support=0 \
    ro.vendor.qti.va_odm.support=0

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=adb \
    ro.oem_unlock_supported=1

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    device/huawei/bach

# Baseline Vendor Blobs only; do not include old vendor package groups yet.
$(call inherit-product, vendor/huawei/bach/bach-vendor-minimal.mk)
