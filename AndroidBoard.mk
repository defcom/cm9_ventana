# At this stage main makefiles, including product makefiles,
# have been read, so all major variables should be available.

LOCAL_PATH := $(call my-dir)

#TARGET_KERNEL_CONFIG := kernel/dell/streak7/

ifeq ($(wildcard $(PRODUCT_OUT)/blob),$(PRODUCT_OUT)/blob)
	INSTALLED_RADIOIMAGE_TARGET += $(PRODUCT_OUT)/blob
endif

-include vendor/dell/build/kernel.mk
