$(call inherit-product, device/htc/opa/full_opa.mk)

PRODUCT_RELEASE_NAME := opa

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/opa/device.mk)

# Device naming
PRODUCT_DEVICE := opa
PRODUCT_NAME := lineage_opa
PRODUCT_BRAND := htc
PRODUCT_MODEL := HTC First
PRODUCT_MANUFACTURER := HTC

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=opa BUILD_FINGERPRINT="cingular_us/opa/opa:4.1.2/JZO54K/180011.4:user/release-keys" PRIVATE_BUILD_DESC="1.08.502.4 CL180011 release-keys"
