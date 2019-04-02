# Inherit common AOSGP stuff
$(call inherit-product, vendor/aosgp/config/common_full.mk)

# Required AOSGP packages
PRODUCT_PACKAGES += \
    LatinIME
