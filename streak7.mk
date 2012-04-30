
ifneq ($(TARGET_PREBUILT_WIFI_MODULE),)
PRODUCT_COPY_FILES += \
    $(TARGET_PREBUILT_WIFI_MODULE):system/lib/modules/bcm4329.ko
endif

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/dell/streak7/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# Not sure if this is necessary?
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Shared Libraries
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/libcamera.so:obj/lib/libcamera.so \
$(LOCAL_PATH)/libaudio.so:obj/lib/libaudio.so \
$(LOCAL_PATH)/libaudiopolicy.so:obj/lib/libaudiopolicy.so \
$(LOCAL_PATH)/liba2dp.so:obj/lib/liba2dp.so 

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.streak7.rc:root/init.streak7.rc \
    $(LOCAL_PATH)/init.streak7.usb.rc:root/init.streak7.usb.rc \
    $(LOCAL_PATH)/ueventd.streak7.rc:root/ueventd.streak7.rc

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml

# Key layout and touch screen
PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
  $(LOCAL_PATH)/atmel-maxtouch.idc:system/usr/idc/mXT224_touchscreen.idc \
  $(LOCAL_PATH)/panjit_touch.idc:system/usr/idc/panjit_touch.idc

# FSTAB
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/vold.fstab:system/etc/vold.fstab \
        $(LOCAL_PATH)/recovery.fstab:system/etc/recovery.fstab

$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf

# media config xml file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PACKAGES += \
    sensors.streak7 \
    lights.streak7 \
    tegra_alsa.tegra \
    audio.primary.tegra \
    audio.a2dp.default \
    make_ext4fs \
    drmserver \
    LiveWallpapers \
    LiveWallpapersPicker \
    Gallery2 \
    Camera \
    librs_jni

PRODUCT_PROPERTY_OVERRIDES := \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    service.adb.root=1


# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp

include frameworks/base/build/tablet-dalvik-heap.mk

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_CHARACTERISTICS := tablet

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

$(call inherit-product-if-exists, vendor/dell/streak7/streak7-vendor.mk)
