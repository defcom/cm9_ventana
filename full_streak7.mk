
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, device/dell/streak7/streak7.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

PRODUCT_NAME := full_streak7
PRODUCT_DEVICE := streak7
PRODUCT_MODEL := Streak7
PRODUCT_BRAND := Dell
PRODUCT_MANUFACTURER := DELL
