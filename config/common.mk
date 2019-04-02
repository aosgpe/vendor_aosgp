PRODUCT_BRAND ?= AOSGP

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/aosgp/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/aosgp/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/aosgp/prebuilt/common/bin/50-cm.sh:system/addon.d/50-cm.sh \
    vendor/aosgp/prebuilt/common/bin/blacklist:system/addon.d/blacklist

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/aosgp/prebuilt/common/bin/otasigcheck.sh:install/bin/otasigcheck.sh

# init.d support
PRODUCT_COPY_FILES += \
    vendor/aosgp/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/aosgp/prebuilt/common/bin/sysinit:system/bin/sysinit

# AOSGP Tweaks support
PRODUCT_COPY_FILES += \
    vendor/aosgp/prebuilt/common/etc/init.d/00ARCHIDROID_INITD:system/etc/init.d/00ARCHIDROID_INITD \
    vendor/aosgp/prebuilt/common/etc/init.d/AS00better_scrolling:system/etc/init.d/LS00better_scrolling \
    vendor/aosgp/prebuilt/common/etc/init.d/AS00CPU:system/etc/init.d/LS00CPU \
    vendor/aosgp/prebuilt/common/etc/init.d/AS00CPU_optimizer:system/etc/init.d/LS00CPU_optimizer \
    vendor/aosgp/prebuilt/common/etc/init.d/AS00GP_services_drainfix:system/etc/init.d/LS00GP_services_drainfix \
    vendor/aosgp/prebuilt/common/etc/init.d/AS00improve_battery:system/etc/init.d/LS00improve_battery \
    vendor/aosgp/prebuilt/common/etc/init.d/AS00Kernel_tweaks:system/etc/init.d/LS00Kernel_tweaks \
    vendor/aosgp/prebuilt/common/etc/init.d/AS00Kill_google_apps:system/etc/init.d/LS00Kill_google_apps \
    vendor/aosgp/prebuilt/common/etc/init.d/AS00Ram_manager_BL:system/etc/init.d/LS00Ram_manager_BL \
    vendor/aosgp/prebuilt/common/etc/init.d/AS00VM_tweaks:system/etc/init.d/LS00VM_tweaks \
    vendor/aosgp/prebuilt/common/etc/init.d/AX00DEFAULT:system/etc/init.d/X00DEFAULT \
    vendor/aosgp/prebuilt/common/etc/init.d/AX00MPS2:system/etc/init.d/X00MPS2 \
    vendor/aosgp/prebuilt/common/etc/init.d/AX00ZIP:system/etc/init.d/X00ZIP \
    vendor/aosgp/prebuilt/common/etc/init.d/98fly_engine:system/etc/init.d/98fly_engine \
    vendor/aosgp/prebuilt/common/etc/init.d/S98system_tweak:system/etc/init.d/S98system_tweak

ifneq ($(TARGET_BUILD_VARIANT),user)
# userinit support
PRODUCT_COPY_FILES += \
    vendor/aosgp/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit
endif

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl



# Custom AOSGP packages
#PRODUCT_PACKAGES += \
#     Substratum \
#    ExactCalculator \
#    Snap \
#    Trebuchet \
#    AOSGPWalls \
#    ResurrectionOTA \
#    SnapdragonMusic \
#    AnExplorer \
#	 AOSGPSetupWizard
	
# Custom AOSGP Optimizations 

# Set lowram options
PRODUCT_PROPERTY_OVERRIDES += \
     ro.config.low_ram=true \
     ro.lmk.critical_upgrade=true \
     ro.lmk.upgrade_pressure=40 \
     ro.lmk.downgrade_pressure=60 \
     ro.lmk.kill_heaviest_task=false \
     ro.statsd.enable=false

# set threshold to filter unused apps
PRODUCT_PROPERTY_OVERRIDES += \
     pm.dexopt.downgrade_after_inactive_days=10


# Speed profile services and wifi-service to reduce RAM and storage.
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile

# Default heap sizes. Allow up to 256m for large heaps to make sure a single app
# doesn't take all of the RAM.
PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.heapgrowthlimit=128m
PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.heapsize=256m

# Do not generate libartd.
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Exchange support
PRODUCT_PACKAGES += \
    Exchange2

# Extra tools in AOSGP
PRODUCT_PACKAGES += \
    7z \
    bash \
    bzip2 \
    curl \
    fsck.ntfs \
    gdbserver \
    htop \
    lib7z \
    libsepol \
    micro_bench \
    mke2fs \
    mkfs.ntfs \
    mount.ntfs \
    oprofiled \
    pigz \
    powertop \
    sqlite3 \
    strace \
    tune2fs \
    unrar \
    unzip \
    vim \
    wget \
    zip

# rsync
PRODUCT_PACKAGES += \
    rsync

# Storage manager
PRODUCT_PROPERTY_OVERRIDES += \
    ro.storage_manager.enabled=true

DEVICE_PACKAGE_OVERLAYS += vendor/aosgp/overlay/common

# Don't compile SystemUITests
EXCLUDE_SYSTEMUI_TESTS := true

# Enable Google Assistant
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opa.eligible_device=true /
    ro.com.google.ime.theme_id=5

# Proprietary latinime lib needed for swyping
PRODUCT_COPY_FILES += \
    vendor/aosgp/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

# Enable storage manager
PRODUCT_PROPERTY_OVERRIDES += \
    ro.storage_manager.enabled=1
	
# Fix some MTK boot devices
PRODUCT_COPY_FILES += \
    vendor/aosgp/prebuilt/common/lib/libdirect-coredump.so:system/lib/libdirect-coredump.so \
    vendor/aosgp/prebuilt/common/lib64/libdirect-coredump.so:system/lib64/libdirect-coredump.so \

# AOSGP version
AOSGP_VERSION := E-1.0

AOSGP_ZIP_VERSION := aosgp-$(AOSGP_VERSION)-$(shell date -u +%Y%m%d)

AOSGP_DISPLAY_VERSION := $(AOSGP_VERSION)-$(shell date -u +%Y%m%d)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.aosgp.version=$(AOSGP_DISPLAY_VERSION)

