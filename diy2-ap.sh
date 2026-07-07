#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i 's/192.168.6.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
sed -i 's/ImmortalWrt/noodlesWrt/g' package/base-files/files/bin/config_generate

# Modify filename, add date prefix
# sed -i 's|IMG_PREFIX:=|IMG_PREFIX:=AP-$(shell TZ="Asia/Shanghai" date +"%Y%m%d")-|' include/image.mk
sed -i "s|\$(VERSION_DIST_SANITIZED)-|\$(VERSION_DIST_SANITIZED)-$(TZ=Asia/Shanghai date +%Y%m%d)-|" include/image.mk

sed -i '/sed -i "\/log-facility\/d" "\/etc\/dnsmasq.conf"/i sed -i '\''/BUILD_ID/d'\'' /etc/os-release\necho "BUILD_ID='\''R260707'\''" >> /etc/os-release' package/emortal/default-settings/files/99-default-settings

