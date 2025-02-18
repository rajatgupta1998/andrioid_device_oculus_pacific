#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/oculus/pacific
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)


# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# # Another common config inclusion
# $(call inherit-product, $(SRC_TARGET_DIR)/product/embedded.mk)


# Inherit from pacific device
$(call inherit-product, device/oculus/pacific/device.mk)
$(call inherit-product-if-exists, vendor/oculus/pacific/pacific-vendor.mk)

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(DEVICE_PATH)/recovery/root,recovery/root)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := pacific
PRODUCT_NAME := lineage_pacific
PRODUCT_BRAND := oculus
PRODUCT_MODEL := Oculus Go
PRODUCT_MANUFACTURER := oculus

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="vr_pacific-user 7.1.1 NGI77B 20480400000200000 release-keys" \
    TARGET_DEVICE="pacific" \
    PRODUCT_NAME="pacific"

BUILD_FINGERPRINT := oculus/vr_pacific/pacific:7.1.1/NGI77B/20480400000200000:user/release-keys
