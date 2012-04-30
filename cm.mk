$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit device configuration for streak7.
$(call inherit-product, device/dell/streak7/full_streak7.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cm_streak7
PRODUCT_BRAND := dell
PRODUCT_DEVICE := streak7
PRODUCT_MODEL := Streak7
PRODUCT_MANUFACTURER := dell
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=Streak7

# Release name and versioning
PRODUCT_RELEASE_NAME := streak7
