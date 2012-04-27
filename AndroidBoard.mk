# At this stage main makefiles, including product makefiles,
# have been read, so all major variables should be available.

LOCAL_PATH := $(call my-dir)
ifeq ($(TARGET_PREBUILT_KERNEL),)
	TARGET_KERNEL_CONFIG := streak7_ics_defconfig
	TARGET_KERNEL_SOURCE := kernel/dell/streak7
endif

ifeq ($(wildcard $(PRODUCT_OUT)/blob),$(PRODUCT_OUT)/blob)
	INSTALLED_RADIOIMAGE_TARGET += $(PRODUCT_OUT)/blob
endif

-include vendor/dell/build/kernel.mk
