ifneq ($(QCPATH),)
$(call inherit-product-if-exists, $(QCPATH)/common/config/device-vendor.mk)
endif

DEVICE_PACKAGE_OVERLAYS += device/fairphone/FP2/overlay

TARGET_USES_QCOM_BSP := false
TARGET_USES_QCA_NFC := other

ifeq ($(TARGET_USES_QCOM_BSP), true)
# Add QC Video Enhancements flag
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
endif #TARGET_USES_QCOM_BSP

#TARGET_DISABLE_DASH := true
#TARGET_DISABLE_OMX_SECURE_TEST_APP := true

# media_profiles and media_codecs xmls for 8974
ifeq ($(TARGET_ENABLE_QC_AV_ENHANCEMENTS), true)
PRODUCT_COPY_FILES += device/fairphone/FP2/media/media_profiles_8974.xml:system/etc/media_profiles.xml \
                      device/fairphone/FP2/media/media_codecs_8974.xml:system/etc/media_codecs.xml
endif  #TARGET_ENABLE_QC_AV_ENHANCEMENTS

# IPC router config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sec_config:system/etc/sec_config

ifeq ($(PROPRIETARY_BLOBS_EXIST),true)
PRODUCT_COPY_FILES += \
    device/fairphone/FP2/apns-conf.xml:system/etc/apns-conf.xml
endif

PRODUCT_NAME := FP2
PRODUCT_DEVICE := FP2
PRODUCT_BRAND := Fairphone
PRODUCT_MANUFACTURER := Fairphone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-fairphone

# Audio configuration file
PRODUCT_COPY_FILES += \
    device/fairphone/FP2/audio_policy.conf:system/etc/audio_policy.conf \
    device/fairphone/FP2/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    device/fairphone/FP2/mixer_paths.xml:system/etc/mixer_paths.xml \
    device/fairphone/FP2/mixer_paths_auxpcm.xml:system/etc/mixer_paths_auxpcm.xml

PRODUCT_PACKAGES += \
    audiod \
    audio.a2dp.default \
    audio_policy.msm8974 \
    audio.primary.msm8974 \
    audio.r_submix.default \
    audio.usb.default \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcomvoiceprocessingdescriptors \
    tinymix

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Media
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libdivxdrmdecrypt \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

PRODUCT_PACKAGES += \
    ebtables \
    ethertypes \
    libbson \
    libcnefeatureconfig \
    libnl_2 \
    libtinyxml \
    libxml2

# Data
PRODUCT_PACKAGES += \
    librmnetctl

# Display
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Graphics
PRODUCT_PACKAGES += \
    copybit.msm8974 \
    gralloc.msm8974 \
    hwcomposer.msm8974 \
    memtrack.msm8974 \
    liboverlay

# Feature definition files
PRODUCT_COPY_FILES += \
    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:system/etc/permissions/com.dsi.ant.antradio_library.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.rc \
    init.qcom.usb.rc \
    init.target.rc \
    ueventd.qcom.rc

#battery_monitor
PRODUCT_PACKAGES += \
    battery_monitor \
    battery_shutdown

#wlan driver
PRODUCT_COPY_FILES += \
    device/fairphone/FP2/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    device/fairphone/FP2/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    device/fairphone/FP2/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

PRODUCT_PACKAGES += \
    hostapd \
    wcnss_service \
    wpa_supplicant

PRODUCT_PACKAGES += \
    hostapd_default.conf \
    hostapd.accept \
    hostapd.deny \
    wpa_supplicant.conf \
    wpa_supplicant_overlay.conf \
    p2p_supplicant_overlay.conf

#ANT stack
PRODUCT_PACKAGES += \
        AntHalService \
        libantradio \
        ANTRadioService \
        antradio_app

TARGET_RELEASETOOLS_EXTENSIONS := device/fairphone/FP2
ADD_RADIO_FILES := true

# Enable strict operation
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.strict_op_enable=false \
    persist.sys.usb.config=mtp

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.whitelist=/system/etc/whitelist_appops.xml

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1

PRODUCT_COPY_FILES += \
    device/fairphone/FP2/whitelist_appops.xml:system/etc/whitelist_appops.xml


# NFC packages
ifeq ($(TARGET_USES_QCA_NFC),true)
NFC_D := true

ifeq ($(NFC_D), true)
    PRODUCT_PACKAGES += \
        libnfcD-nci \
        libnfcD_nci_jni \
        nfc_nci.msm8974 \
        NfcDNci \
        Tag \
        com.android.nfc_extras \
        com.android.nfc.helper
else
PRODUCT_PACKAGES += \
    libnfc-nci \
    libnfc_nci_jni \
    nfc_nci.msm8974 \
    NfcNci \
    Tag \
    com.android.nfc_extras
endif

# file that declares the MIFARE NFC constant
# Commands to migrate prefs from com.android.nfc3 to com.android.nfc
# NFC access control + feature files + configuration
PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
        frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
        frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml
# Enable NFC Forum testing by temporarily changing the PRODUCT_BOOT_JARS
# line has to be in sync with build/target/product/core_base.mk
endif

PRODUCT_BOOT_JARS += qcmediaplayer \
                     org.codeaurora.Performance \
                     vcard \
                     tcmiface
ifneq ($(strip $(QCPATH)),)
PRODUCT_BOOT_JARS += WfdCommon
PRODUCT_BOOT_JARS += qcom.fmradio
PRODUCT_BOOT_JARS += security-bridge
PRODUCT_BOOT_JARS += qsb-port
PRODUCT_BOOT_JARS += oem-services
endif

PRODUCT_COPY_FILES += device/fairphone/FP2/twrp.fstab:recovery/root/etc/twrp.fstab

PRODUCT_MODEL := FP2

# include an expanded selection of fonts for the SDK.
EXTENDED_FONT_FOOTPRINT := true

# Preferred Applications for Fairphone
PRODUCT_COPY_FILES += \
    device/fairphone/FP2/preferred.xml:system/etc/preferred-apps/fp.xml

# remove /dev/diag in user version for CTS
ifeq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_COPY_FILES += device/qcom/common/rootdir/etc/init.qcom.diag.rc.user:root/init.qcom.diag.rc
endif

ifeq ($(strip $(FP2_SKIP_BOOT_JARS_CHECK)),)
SKIP_BOOT_JARS_CHECK := true
endif

# we don't have the calibration data so don't generate persist.img
FP2_SKIP_PERSIST_IMG := true

# Call the proprietary setup
$(call inherit-product, vendor/fairphone/FP2/FP2-vendor.mk)
