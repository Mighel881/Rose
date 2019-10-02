ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = RosePreferences

RosePreferences_FILES = RSERootListController.m
RosePreferences_INSTALL_PATH = /Library/PreferenceBundles
RosePreferences_FRAMEWORKS = UIKit
RosePreferences_PRIVATE_FRAMEWORKS = Preferences
RosePreferences_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/RosePreferences.plist$(ECHO_END)
