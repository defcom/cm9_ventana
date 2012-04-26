# NVIDIA Tegra2 "Ventana" development system

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

PRODUCT_NAME := ventana
PRODUCT_DEVICE := ventana
PRODUCT_MODEL := Ventana
PRODUCT_MANUFACTURER := NVIDIA

PRODUCT_LOCALES += en_US

$(call inherit-product-if-exists, vendor/nvidia/tegra/core/nvidia-tegra-vendor.mk)
$(call inherit-product, build/target/product/languages_full.mk)

PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/libcamera.so:obj/lib/libcamera.so \
$(LOCAL_PATH)/libaudio.so:obj/lib/libaudio.so \
$(LOCAL_PATH)/libaudiopolicy.so:obj/lib/libaudiopolicy.so \
$(LOCAL_PATH)/liba2dp.so:obj/lib/liba2dp.so 

PRODUCT_COPY_FILES += \
    device/dell/streak7/init.streak7.rc:root/init.streak7.rc \
    device/dell/streak7/ueventd.streak7.rc:root/ueventd.streak7.rc \
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


ifneq (,$(filter $(BOARD_INCLUDES_TEGRA_JNI),display))
PRODUCT_COPY_FILES += \
    vendor/nvidia/tegra/hal/frameworks/Display/com.nvidia.display.xml:system/etc/permissions/com.nvidia.display.xml
endif

ifneq (,$(filter $(BOARD_INCLUDES_TEGRA_JNI),cursor))
PRODUCT_COPY_FILES += \
    vendor/nvidia/tegra/hal/frameworks/Graphics/com.nvidia.graphics.xml:system/etc/permissions/com.nvidia.graphics.xml
endif

PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/vold.fstab:system/etc/vold.fstab \
  $(LOCAL_PATH)/init.ventana.rc:root/init.ventana.rc \
  $(LOCAL_PATH)/ueventd.ventana.rc:root/ueventd.ventana.rc \
  $(LOCAL_PATH)/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
  $(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml \
  $(LOCAL_PATH)/atmel-maxtouch.idc:system/usr/idc/mXT224_touchscreen.idc \
  $(LOCAL_PATH)/panjit_touch.idc:system/usr/idc/panjit_touch.idc \
  $(LOCAL_PATH)/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf

PRODUCT_COPY_FILES += \
    vendor/nvidia/tegra/graphics/android/build/egl.cfg:system/lib/egl/egl.cfg

PRODUCT_COPY_FILES += \
	external/alsa-lib/src/conf/alsa.conf:system/usr/share/alsa/alsa.conf \
	external/alsa-lib/src/conf/pcm/dsnoop.conf:system/usr/share/alsa/pcm/dsnoop.conf \
	external/alsa-lib/src/conf/pcm/modem.conf:system/usr/share/alsa/pcm/modem.conf \
	external/alsa-lib/src/conf/pcm/dpl.conf:system/usr/share/alsa/pcm/dpl.conf \
	external/alsa-lib/src/conf/pcm/default.conf:system/usr/share/alsa/pcm/default.conf \
	external/alsa-lib/src/conf/pcm/surround51.conf:system/usr/share/alsa/pcm/surround51.conf \
	external/alsa-lib/src/conf/pcm/surround41.conf:system/usr/share/alsa/pcm/surround41.conf \
	external/alsa-lib/src/conf/pcm/surround50.conf:system/usr/share/alsa/pcm/surround50.conf \
	external/alsa-lib/src/conf/pcm/dmix.conf:system/usr/share/alsa/pcm/dmix.conf \
	external/alsa-lib/src/conf/pcm/center_lfe.conf:system/usr/share/alsa/pcm/center_lfe.conf \
	external/alsa-lib/src/conf/pcm/surround40.conf:system/usr/share/alsa/pcm/surround40.conf \
	external/alsa-lib/src/conf/pcm/side.conf:system/usr/share/alsa/pcm/side.conf \
	external/alsa-lib/src/conf/pcm/iec958.conf:system/usr/share/alsa/pcm/iec958.conf \
	external/alsa-lib/src/conf/pcm/rear.conf:system/usr/share/alsa/pcm/rear.conf \
	external/alsa-lib/src/conf/pcm/surround71.conf:system/usr/share/alsa/pcm/surround71.conf \
	external/alsa-lib/src/conf/pcm/front.conf:system/usr/share/alsa/pcm/front.conf \
	external/alsa-lib/src/conf/cards/aliases.conf:system/usr/share/alsa/cards/aliases.conf \
	device/nvidia/ventana/asound.conf:system/etc/asound.conf \
	device/nvidia/common/bdaddr:system/etc/bluetooth/bdaddr

ifeq ($(wildcard vendor/nvidia/tegra/core-private),vendor/nvidia/tegra/core-private)
PRODUCT_COPY_FILES += \
   vendor/nvidia/tegra/3rdparty/bcmbinaries/bcm4329/bluetooth/bcmpatchram.hcd:system/etc/firmware/bcm4329.hcd \
   vendor/nvidia/tegra/3rdparty/bcmbinaries/bcm4329/wlan/nh930_nvram.txt:system/etc/nvram.txt \
   vendor/nvidia/tegra/3rdparty/broadcom/gps/bin/glgps_nvidiaTegra2android:system/bin/glgps_nvidiaTegra2android \
   vendor/nvidia/tegra/3rdparty/broadcom/gps/bin/gpsconfig.xml:system/etc/gps/gpsconfig.xml \
   vendor/nvidia/tegra/3rdparty/broadcom/gps/bin/gps.tegra.so:system/lib/hw/gps.tegra.so \
   vendor/nvidia/tegra/customers/nvidia-partner/ventana/partition_data/config/nvcamera.conf:system/etc/nvcamera.conf
else
PRODUCT_COPY_FILES += \
   vendor/nvidia/tegra/prebuilt/3rdparty/bcmbinaries/bcm4329/bluetooth/bcmpatchram.hcd:system/etc/firmware/bcm4329.hcd \
   vendor/nvidia/tegra/prebuilt/3rdparty/bcmbinaries/bcm4329/wlan/nh930_nvram.txt:system/etc/nvram.txt \
   vendor/nvidia/tegra/prebuilt/3rdparty/broadcom/gps/bin/glgps_nvidiaTegra2android:system/bin/glgps_nvidiaTegra2android \
   vendor/nvidia/tegra/prebuilt/3rdparty/broadcom/gps/bin/gpsconfig.xml:system/etc/gps/gpsconfig.xml \
   vendor/nvidia/tegra/prebuilt/3rdparty/broadcom/gps/bin/gps.tegra.so:system/lib/hw/gps.tegra.so \
   vendor/nvidia/tegra/odm/ventana/partition_data/config/nvcamera.conf:system/etc/nvcamera.conf
endif

PRODUCT_PACKAGES += \
    sensors.ventana \
    lights.ventana \
    tegra_alsa.tegra \
    audio.primary.tegra \
    audio.a2dp.default \
    audio_policy.tegra \
    make_ext4fs \
    drmserver \
    LiveWallpapers \
    LiveWallpapersPicker \
    Gallery2 \
    Camera \
    librs_jni \
    libdrmframework_jni

include frameworks/base/build/tablet-dalvik-heap.mk

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_CHARACTERISTICS := tablet

# Default NVFlash boot config files.
ifeq ($(wildcard vendor/nvidia/tegra/core-private),vendor/nvidia/tegra/core-private)
PRODUCT_COPY_FILES += \
    vendor/nvidia/tegra/customers/nvidia-partner/ventana/nvflash/ventana_A03_12MHz_EDB8132B1PB6DF_300Mhz_1GB_emmc_THGBM1G6D4EBAI4.bct:flash.bct \
    vendor/nvidia/tegra/customers/nvidia-partner/ventana/nvflash/android_fastboot_emmc_full.cfg:flash.cfg
else
PRODUCT_COPY_FILES += \
    vendor/nvidia/tegra/odm/ventana/nvflash/ventana_A03_12MHz_EDB8132B1PB6DF_300Mhz_1GB_emmc_THGBM1G6D4EBAI4.bct:flash.bct \
    vendor/nvidia/tegra/odm/ventana/nvflash/android_fastboot_emmc_full.cfg:flash.cfg
endif

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay
