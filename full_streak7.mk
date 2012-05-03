#$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
#$(call inherit-product, vendor/cm/config/gsm.mk)
$(call inherit-product, device/dell/streak7/streak7.mk)

PRODUCT_NAME := full_streak7
PRODUCT_DEVICE := streak7
PRODUCT_MODEL := Dell Streak 7
PRODUCT_BRAND := Dell
PRODUCT_MANUFACTURER := Dell Inc.
