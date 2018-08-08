# Inherit device configuration
$(call inherit-product, device/HUAWEI/HWMYA-L6737/HWMYA-L6737.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := HWMYA-L6737
PRODUCT_NAME := HUAWEI_HWMYA_L6737
PRODUCT_BRAND := HUAWEI
PRODUCT_MODEL := HWMYA-L6737
PRODUCT_MANUFACTURER := HUAWEI

# Time Zone data
PRODUCT_COPY_FILES += bionic/libc/zoneinfo/tzdata:recovery/root/system/usr/share/zoneinfo/tzdata

PRODUCT_LOCALES := sk_SK
