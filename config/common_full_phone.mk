# Inherit common AOSGP stuff
$(call inherit-product, vendor/aosgp/config/common.mk)

# Required AOSGP packages
PRODUCT_PACKAGES += \
    LatinIME \
    Recorder

PRODUCT_SIZE := full

$(call inherit-product, vendor/aosgp/config/telephony.mk)
