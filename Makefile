ARCHS = arm64 arm64e
TARGET = iphone:clang:11.2:11.2
GO_EASY_ON_ME = 1
FINALPACKAGE = 0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Rose
$(TWEAK_NAME)_FILES = Tweak.x
$(TWEAK_NAME)_CFLAGS += -fobjc-arc
$(TWEAK_NAME)_FRAMEWORKS = UIKit AudioToolbox
$(TWEAK_NAME)_EXTRA_FRAMEWORKS += Cephei

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += rosepreferences
include $(THEOS_MAKE_PATH)/aggregate.mk
