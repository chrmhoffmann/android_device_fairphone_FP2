# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from FP2 device
$(call inherit-product, device/fairphone/FP2/FP2.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_NAME := lineage_FP2
PRODUCT_DEVICE := FP2
PRODUCT_MANUFACTURER := Fairphone
PRODUCT_MODEL := FP2

PRODUCT_GMS_CLIENTID_BASE := android-FP2

PRODUCT_BRAND := Fairphone
TARGET_VENDOR := Fairphone
TARGET_VENDOR_PRODUCT_NAME := FP2
TARGET_VENDOR_DEVICE_NAME := FP2
PRODUCT_BUILD_PROP_OVERRIDES += TARGET_DEVICE=FP2 PRODUCT_NAME=FP2

## Use the latest approved GMS identifiers unless running a signed build
ifneq ($(SIGN_BUILD),true)
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=Fairphone/FP2/FP2:6.0.1/FP2-gms-17.04.8/FP2-gms-17.04.8:user/release-keys
    PRIVATE_BUILD_DESC="FP2-user no clue what to put here"
endif
