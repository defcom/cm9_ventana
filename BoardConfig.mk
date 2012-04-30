TARGET_PREBUILT_KERNEL := device/dell/streak7/kernel
TARGET_BOARD_INFO_FILE := device/dell/streak7/board-info.txt
BOARD_EGL_CFG := vendor/dell/streak7/proprietary/lib/egl/egl.cfg
BOARD_KERNEL_CMDLINE := #no_console_suspend=1 console=null video=tegrafb usbcore.old_scheme_first=1 tegraboot=sdmmc tegrapart=mmcblk0=system:900:20000:800,cache:20900:80000:800,misc:a0900:400:800,linux:a0e00:1000:800,userdata:a1f00:80000:800,recovery:122000:a00:800,intmmc:122B00:647900:800 boardtype=PR androidboot.hardware=ventana

TARGET_BOARD_PLATFORM := tegra
TARGET_TEGRA_VERSION := ap20

# Streak 7 uses an internal sd card
BOARD_HAS_SDCARD_INTERNAL := true

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH_VARIANT := armv7-a
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_ARCH_VARIANT_FPU := vfpv3-d16
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_PROVIDES_INIT_RC := true

# Audio hack for streak7 - use legacy 3.2 libs
BOARD_USES_GENERIC_AUDIO := false
BOARD_PREBUILT_LIBAUDIO := true
BOARD_USES_AUDIO_LEGACY := true

TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := ventana

BOARD_BUILD_BOOTLOADER := false

BOARD_KERNEL_BASE := 0x10000000
BOARD_PAGE_SIZE := 0x00000800

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 5242880
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 268435456
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1073741824
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_HAS_NO_MISC_PARTITION := true

BOARD_DATA_DEVICE := /dev/block/mmcblk0p6
BOARD_DATA_FILESYSTEM := ext4
BOARD_CACHE_DEVICE := /dev/block/mmcblk0p2
BOARD_CACHE_FILESYSTEM := ext4

USE_E2FSPROGS := true
USE_OPENGL_RENDERER := true

# OTA
#TARGET_RECOVERY_UPDATER_LIBS += libnvrecoveryupdater

# Skip droiddoc build to save build time
BOARD_SKIP_ANDROID_DOC_BUILD := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# Camera
#USE_CAMERA_STUB := false
#BOARD_VENDOR_USE_NV_CAMERA := true
# omxcamera is default
#TEGRA_CAMERA_TYPE := usb_uvc

# Connectivity - Wi-Fi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
BOARD_WLAN_DEVICE := bcm4329
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
WIFI_DRIVER_MODULE_PATH     := "/system/lib/hw/dhd.ko"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_MODULE_NAME     :=  "dhd"
WIFI_DRIVER_MODULE_ARG      :=  "iface_name=wlan0 firmware_path=/vendor/firmware/fw_bcm4329.bin nvram_path=/system/etc/wlan/nvram.txt"

#3G
BOARD_MOBILEDATA_INTERFACE_NAME := "usb0"

# GPS
BOARD_HAVE_GPS_BCM := true

# Route Video to HDMI Display only, if it is connected
BOARD_HAVE_VID_ROUTING_TO_HDMI := false

# Default HDMI mirror mode
# Crop (default) picks closest mode, crops to screen resolution
# Scale picks closest mode, scales to screen resolution (aspect preserved)
# Center picks a mode greater than or equal to the panel size and centers;
#     if no suitable mode is available, reverts to scale
BOARD_HDMI_MIRROR_MODE := Scale

# Double buffered display surfaces reduce memory usage, but will decrease performance.
# The default is to triple buffer the display surfaces.
# BOARD_DISABLE_TRIPLE_BUFFERED_DISPLAY_SURFACES := true

# Set this to true if the camera preview needs to be displayed only on HDMI
# when connected.
# --------------------------------------------------------------------------
# NOTE: BOARD_HAVE_VID_ROUTING_TO_HDMI  must be set to true for this to take
# effect.
# --------------------------------------------------------------------------
BOARD_CAMERA_PREVIEW_HDMI_ONLY := false

#Sounds
include frameworks/base/data/sounds/AudioPackageNewWave.mk

ifneq ($(HAVE_NVIDIA_PROP_SRC),false)
# Needed for source compilation of nvidia libraries
-include vendor/nvidia/proprietary_src/build/definitions.mk
-include vendor/nvidia/build/definitions.mk
endif

# Avoid the generation of ldrcc instructions
NEED_WORKAROUND_CORTEX_A9_745320 := true

BOARD_NO_ALLOW_DEQUEUE_CURRENT_BUFFER := true
BOARD_VOLD_MAX_PARTITIONS := 11

# Green Screen Fix
COMMON_GLOBAL_CFLAGS += -DMISSING_EGL_EXTERNAL_IMAGE -DMISSING_GRALLOC_BUFFERS
COMMON_GLOBAL_CFLAGS += -DMISSING_EGL_PIXEL_FORMAT_YV12
COMMON_GLOBAL_CFLAGS += -DBOARD_GL_OES_EGL_IMG_EXTERNAL_HACK

# Use nicer font rendering
BOARD_USE_SKIA_LCDTEXT := true
BOARD_INCLUDES_TEGRA_JNI:= graphics,cursor
