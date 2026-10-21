#
# Copyright (C) 2021-2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8150-common
include device/xiaomi/sm8150-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/cepheus

# Assert
TARGET_OTA_ASSERT_DEVICE := cepheus

# Build
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Display
TARGET_SCREEN_DENSITY := 440

# Kernel
TARGET_KERNEL_CONFIG += vendor/xiaomi/cepheus.config

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/configs/prop/vendor.prop

# Inherit from the proprietary version
include vendor/xiaomi/cepheus/BoardConfigVendor.mk

# uwuAOSP port
# cepheus ships with API 28 (Android 9), but Android 17 only provides FCM
# level 9 matrices, so checkvintf can never satisfy the inferred level 5.
TARGET_SKIP_VINTF_CHECK := true

# vendor/uwu/build/tasks/kernel.mk reads this to pick the GKI suffix and to
# decide which kernel build helpers apply. cepheus uses a 4.14 tree.
TARGET_KERNEL_VERSION := 4.14
