#
# Makefile for Motorola Moto E Condor (xt1021,xt1022)
#

# The original zip file, MUST be specified by each product
local-zip-file     := stockrom.zip

# The output zip file of MIUI rom, the default is porting_miui.zip if not specified
local-out-zip-file := MIUI_Condor.zip

# the location for local-ota to save target-file
local-previous-target-dir :=

# All apps from original ZIP, but has smali files chanded
local-modified-apps :=

local-modified-jars :=

# All apks from MIUI
local-miui-removed-apps :=

local-miui-modified-apps := miuisystem MiuiHome TeleService Settings SecurityCenter \
			MiuiSystemUI DeskClock Updater DownloadProvider \
			XiaomiServiceFramework

local-phone-apps :=

local-phone-priv-apps :=

local-density := XHDPI

PORT_PRODUCT := el_condor

# To include the local targets before and after zip the final ZIP file,
# and the local-targets should:
# (1) be defined after including porting.mk if using any global variable(see porting.mk)
# (2) the name should be leaded with local- to prevent any conflict with global targets
local-pre-zip := local-pre-zip-misc
local-after-zip:= local-put-to-phone
include phoneapps.mk

# The local targets after the zip file is generated, could include 'zip2sd' to
# deliver the zip file to phone, or to customize other actions

include $(PORT_BUILD)/porting.mk

local-pre-zip-misc:
	#copy files
	cp other/boot.img $(ZIP_DIR)/boot.img
	cp -a -rf other/system/* $(ZIP_DIR)/system/
	#fix selinux
	sed -i '4asetenforce 0' $(ZIP_DIR)/system/bin/sysinit
	@echo goodbye! miui prebuilt binaries!
	cp -rf stockrom/system/bin/app_process $(ZIP_DIR)/system/bin/app_process
	rm -rf $(ZIP_DIR)/system/bin/debuggerd_vendor
	cp -rf stockrom/system/bin/debuggerd $(ZIP_DIR)/system/bin/debuggerd
	rm -rf $(ZIP_DIR)/system/bin/dexopt_vendor
	cp -rf stockrom/system/bin/dexopt $(ZIP_DIR)/system/bin/dexopt
	echo "debug.sf.hw=1" >> $(ZIP_DIR)/system/build.prop
	echo "debug.composition.type=dyn" >> $(ZIP_DIR)/system/build.prop
	echo "debug.mdpcomp.maxlayer=3" >> $(ZIP_DIR)/system/build.prop
	#PowerKeeper and Whetstone
	echo "persist.sys.mcd_config_file=/system/etc/mcd_default.conf" >> $(ZIP_DIR)/system/build.prop
	echo "persist.sys.klo=on" >> $(ZIP_DIR)/system/build.prop
