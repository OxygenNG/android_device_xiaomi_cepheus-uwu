#
# Copyright (C) 2021-2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# uwuAOSP keeps most of its framework in the GMS suite, so this stays on.
# The 6.0 GiB super group only fits because all dynamic partitions are built
# as compressed erofs (see sm8150-common/BoardConfigCommon.mk); with the old
# uncompressed ext4 the partition sum overshot the group limit by 33 MiB.
WITH_GMS := true

# uwuAOSP requires these capabilities before inheriting common.mk
UWU_DEVICE_TYPE := phone
UWU_SUPPORTS_TELEPHONY := true

# Inherit common uwuAOSP configuration.
$(call inherit-product, vendor/uwu/config/common.mk)

# Inherit from cepheus device
$(call inherit-product, device/xiaomi/cepheus/device.mk)

# Specific Flags
TARGET_HAS_UDFPS := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_BOOT_ANIMATION_RES := 1080

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := uwu_cepheus
PRODUCT_DEVICE := cepheus
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Mi 9

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="cepheus-user 11 RKQ1.200826.002 V12.5.1.0.RFAMIXM release-keys" \
    BuildFingerprint=Xiaomi/cepheus/cepheus:11/RKQ1.200826.002/V12.5.1.0.RFAMIXM:user/release-keys
