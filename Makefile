ARCHS = arm64 arm64e

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Rose

Rose_FILES = Tweak.x
Rose_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += rosepreferences
include $(THEOS_MAKE_PATH)/aggregate.mk
