# Copyright (C) 2017 Unlegacy-Android
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

# -----------------------------------------------------------------
# Streak OTA update package

ifneq ($(BUILD_WITH_COLORS),0)
    include $(TOP_DIR)vendor/streak/build/core/colors.mk
endif

STREAK_TARGET_PACKAGE := $(PRODUCT_OUT)/$(STREAK_VERSION).zip

MD5 := prebuilts/build-tools/path/$(HOST_OS)-x86/md5sum

.PHONY: streak bacon
streak: otapackage
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(STREAK_TARGET_PACKAGE)
	$(hide) $(MD5) $(STREAK_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(STREAK_TARGET_PACKAGE).md5sum

	@echo  ${CL_MAG}""${CL_MAG}
	@echo -e ${CL_MAG}" ▄▄▄·▄▄▄         ▐▄▄▄▄▄▄ . ▄▄· ▄▄▄▄▄.▄▄ · ▄▄▄▄▄▄▄▄  ▄▄▄ . ▄▄▄· ▄ •▄"${CL_MAG}
	@echo -e ${CL_MAG}"▐█ ▄█▀▄ █·▪       ·██▀▄.▀·▐█ ▌▪•██  ▐█ ▀. •██  ▀▄ █·▀▄.▀·▐█ ▀█ █▌▄▌▪"${CL_MAG}
	@echo -e ${CL_MAG}" ██▀·▐▀▀▄  ▄█▀▄ ▪▄ ██▐▀▀▪▄██ ▄▄ ▐█.▪▄▀▀▀█▄ ▐█.▪▐▀▀▄ ▐▀▀▪▄▄█▀▀█ ▐▀▀▄·"${CL_MAG}
	@echo -e ${CL_MAG}"▐█▪·•▐█•█▌▐█▌.▐▌▐▌▐█▌▐█▄▄▌▐███▌ ▐█▌·▐█▄▪▐█ ▐█▌·▐█•█▌▐█▄▄▌▐█ ▪▐▌▐█.█▌"${CL_MAG}
	@echo -e ${CL_MAG}".▀   .▀  ▀ ▀█▄▀▪ ▀▀▀• ▀▀▀ ·▀▀▀  ▀▀▀  ▀▀▀▀  ▀▀▀ .▀  ▀ ▀▀▀  ▀  ▀ ·▀  ▀"${CL_MAG}
	@echo -e ${CL_RST}""${CL_RST}
	@echo -e ${CL_RST}""${CL_RST}
	@echo -e ${CL_MAG}"======================================================================================="${CL_MAG}
	@echo -e ${CL_RST}""Package Complete: "$(STREAK_TARGET_PACKAGE)"${CL_RST}
	@echo -e ${CL_MAG}"======================================================================================="${CL_MAG}
