#
# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# common msm8960 configs
$(call inherit-product, device/htc/msm8960-common/msm8960.mk)

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# overlays
DEVICE_PACKAGE_OVERLAYS += device/htc/opa/overlay

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.operaul \
    init.operaul.usb.rc \
    init.operaul.rc \
    ueventd.operaul.rc

# QC thermald config
PRODUCT_COPY_FILES += device/htc/opa/configs/thermald.conf:system/etc/thermald.conf

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8960

# WiFi
PRODUCT_PACKAGES += \
    libnetcmdiface

# WiFi config
PRODUCT_COPY_FILES += \
    device/htc/opa/configs/calibration.gpio4:/system/etc/calibration.gpio4 \
    device/htc/opa/configs/p2p_supplicant_overlay.conf:/system/etc/wifi/p2p_supplicant_overlay.conf \
    device/htc/opa/configs/wpa_supplicant_overlay.conf:/system/etc/wifi/wpa_supplicant_overlay.conf

# FM radio
PRODUCT_PACKAGES += \
    FM2 \
    libqcomfm_jni \
    qcom.fmradio

# Audio
PRODUCT_PACKAGES += \
    audio_amplifier.msm8960

# Audio config
 PRODUCT_COPY_FILES += \
    device/htc/opa/configs/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    device/htc/opa/configs/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    device/htc/opa/configs/audio_policy.conf:system/etc/audio_policy.conf \
    device/htc/opa/configs/mixer_paths.xml:system/etc/mixer_paths.xml

# Media config
PRODUCT_COPY_FILES += \
    device/htc/opa/configs/media_profiles.xml:system/etc/media_profiles.xml

# Keylayouts and Keychars
PRODUCT_COPY_FILES += \
    device/htc/opa/keylayout/operaul-keypad.kl:system/usr/keylayout/operaul-keypad.kl \
    device/htc/opa/keylayout/projector-Keypad.kl:system/usr/keylayout/projector-Keypad.kl \
    device/htc/opa/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl

# Input device config
PRODUCT_COPY_FILES += \
    device/htc/opa/idc/projector_input.idc:system/usr/idc/projector_input.idc \
    device/htc/opa/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := device/htc/opa/configs/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := device/htc/opa/configs/nfcee_access_debug.xml
endif
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

# NFC Support
PRODUCT_PACKAGES += \
    nfc.msm8960 \
    libnfc \
    libnfc_ndef \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

# Camera
PRODUCT_PACKAGES += \
    camera.msm8960 \
    Snap

# GPS
PRODUCT_PACKAGES += \
    gps.msm8960

PRODUCT_COPY_FILES += \
    device/htc/opa/gps/gps.conf:system/etc/gps.conf

# Lights
PRODUCT_PACKAGES += \
    lights.operaul

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8960

# Shims
PRODUCT_PACKAGES += \
    libshim_camera \
    libshim_log \
    libshim_qcopt \
    libshim_wvm

# Stlport
PRODUCT_PACKAGES += \
    libstlport

# Voice processing
PRODUCT_PACKAGES += \
    libqcomvoiceprocessing

# Permissions (maybe remove low latency)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml


PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb \
    persist.service.adb.enable=1 \
    persist.service.debuggable=1 \
    ro.adb.secure=0 \
    ro.secure=0

PRODUCT_CHARACTERISTICS += nosdcard

# call the proprietary setup
$(call inherit-product, vendor/htc/mystul/mystul-vendor.mk)
