LOCAL_PATH := $(call my-dir)

ifneq ($(filter bach,$(TARGET_DEVICE)),)

include $(LOCAL_PATH)/rootdir/Android.mk

endif
