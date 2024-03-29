#!/bin/bash
#
# Copyright (C) 2018 The LineageOS Project
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

set -e

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

LINEAGE_ROOT="$MY_DIR"/../../..

export DEVICE=ocean
export DEVICE_COMMON=sdm632-common
export VENDOR=motorola

export DEVICE_BRINGUP_YEAR=2019

./../../$VENDOR/$DEVICE_COMMON/extract-files.sh $@

BLOB_ROOT="$LINEAGE_ROOT"/vendor/"$VENDOR"/"$DEVICE"/proprietary

# Add uhid group for fingerprint service
#FP_SERVICE_RC="$BLOB_ROOT"/vendor/etc/init/android.hardware.biometrics.fingerprint@2.1-service-ets.rc
#sed -i "s/input/uhid input/" "$FP_SERVICE_RC"

# Load libmot_gpu_mapper shim
MOT_GPU_MAPPER="$BLOB_ROOT"/vendor/lib/libmot_gpu_mapper.so
patchelf --add-needed libgpu_mapper_shim.so "$MOT_GPU_MAPPER"
