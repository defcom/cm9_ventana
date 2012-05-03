# Inherit device configuration for streak7.
$(call inherit-product, device/dell/streak7/full_streak7.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cm_streak7
PRODUCT_DEVICE := streak7
PRODUCT_MODEL := Dell Streak 7
PRODUCT_BRAND := Dell
PRODUCT_MANUFACTURER := Dell Inc.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=Streak7

# Release name and versioning
PRODUCT_RELEASE_NAME := streak7
