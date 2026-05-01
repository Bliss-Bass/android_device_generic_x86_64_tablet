#
# Copyright (C) 2014 The Android-x86 Open Source Project
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
# Inherit from those products. Most specific first.
$(call inherit-product,$(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# TV config
ifeq ($(USE_TV_BUILD), true)
$(call inherit-product, device/google/atv/products/atv_base.mk)

TARGET_ATV_FORCE_1080_SCALING := false
$(call inherit-product, vendor/lineage/config/common_tv.mk)
$(call inherit-product,$(LOCAL_PATH)/../device.mk)


endif

# Inherit lowram TV config for Go build
ifeq ($(USE_TV_LOWRAM), true)

BOARD_IS_GO_BUILD := true
$(call inherit-product, device/google/atv/products/atv_lowram_defaults.mk)
PRODUCT_PACKAGES += \
    TvLowRamOverlay

endif

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_tablet.mk)

# Include from Android-x86 device
BOARD_IS_ZENITH_BUILD :=true
$(call inherit-product,$(LOCAL_PATH)/device.mk)

# Overrides
PRODUCT_NAME := lineage_x86_64_tablet
PRODUCT_BRAND := Android-x86
PRODUCT_DEVICE := x86_64_tablet
PRODUCT_MODEL := Generic Android-x86_64
