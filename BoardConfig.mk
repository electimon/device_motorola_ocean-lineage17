#
# Copyright (C) 2017 The LineageOS Project
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
BOARD_USES_KEYMASTER_4 := true

# Inherit from motorola sdm632-common
-include device/motorola/sdm632-common/BoardConfigCommon.mk

DEVICE_PATH := device/motorola/ocean

# Assertions
TARGET_OTA_ASSERT_DEVICE := ocean

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# FM
# BOARD_HAVE_QCOM_FM := true
BOARD_HAS_QCA_FM_SOC := "cherokee"

# Kernel
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_KERNEL_CONFIG := ocean_defconfig

TARGET_KERNEL_ADDITIONAL_FLAGS := \
    DTC_EXT=$(shell pwd)/prebuilts/misc/$(HOST_OS)-x86/dtc/dtc

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/touch.xml

# NFC
BOARD_NFC_CHIPSET := pn553

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432        #    32768 * 1024 mmcblk0p41-42
BOARD_DTBOIMG_PARTITION_SIZE := 8388608           #     8192 * 1024 mmcblk0p43-44
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2885681152    #  2818048 * 1024 mmcblk0p62-63
BOARD_VENDORIMAGE_PARTITION_SIZE := 603979776     #   589824 * 1024 mmcblk0p60-61

# Power
TARGET_HAS_NO_WLAN_STATS := true

# RIL
ENABLE_VENDOR_RIL_SERVICE := false

# SELinux
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# inherit from the proprietary version
-include vendor/motorola/ocean/BoardConfigVendor.mk
