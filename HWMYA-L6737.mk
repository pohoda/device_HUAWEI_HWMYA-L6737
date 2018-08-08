LOCAL_PATH := device/HUAWEI/HWMYA-L6737

# on omni 6.0.1, this line is no longer needed and only errors are stuck on it, on 4.4.4 I have no she was not going to
# $(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/kernel:kernel \
    $(LOCAL_PATH)/fstab.mt6735:root/fstab.mt6735 \
 
$(call inherit-product, build/target/product/full.mk)

PRODUCT_NAME := HWMYA-L6737
