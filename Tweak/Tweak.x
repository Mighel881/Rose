#import "Rose.h"

// Enabled And Engine Switches
BOOL enabled = NO;
BOOL enableTapticEngineSwitch = NO;
BOOL enableHapticEngineSwitch = NO;
BOOL enableLegacyEngineSwitch = NO;

// Switches To Enable Sections
BOOL anywhereSectionSupportSwitch = NO;
BOOL controlCenterSectionSupportSwitch = NO;
BOOL hardwareButtonsSectionSupportSwitch = NO;
BOOL homescreenSectionSupportSwitch = NO;
BOOL lockscreenSectionSupportSwitch = NO;
BOOL otherHardwareActionsSectionSupportSwitch = NO;
BOOL statusChangesSectionSupportSwitch = NO;
BOOL systemWideSectionSupportSwitch = NO;
BOOL extrasSectionSupportSwitch = NO;
BOOL exceptionsSectionSupportSwitch = NO;

// Anywhere Section
BOOL killingSwitch = NO;
BOOL switcherSwitch = NO;
BOOL siriSwitch = NO;
BOOL screenshotSwitch = NO;
BOOL reachabilitySwitch = NO;
BOOL textSelectionSwitch = NO;
BOOL powerSwitch = NO;
BOOL respringSwitch = NO;
BOOL keyboardSwitch = NO;
BOOL enterBackgroundSwitch = NO;
BOOL alertAppearSwitch = NO;
BOOL alertDisappearSwitch = NO;

// Control Center Section
BOOL ccToggleSwitch = NO;
BOOL openControlCenterSwitch = NO;
BOOL ccModuleSwitch = NO;

// Hardware Buttons
BOOL volumeSwitch = NO;
BOOL sleepButtonSwitch = NO;
BOOL homeButtonSwitch = NO;
BOOL ringerSwitch = NO;

// Homescreen Section
BOOL forceSwitch = NO;
BOOL folderOpenSwitch = NO;
BOOL folderCloseSwitch = NO;
BOOL iconTapSwitch = NO;
BOOL pageSwipeSwitch = NO;
BOOL spotlightSwitch = NO;

// Lockscreen Section
BOOL passcodeSwitch = NO;
BOOL quickActionsButtonSwitch = NO;

// Other Hardware Actions Section
BOOL wakeSwitch = NO;
BOOL pluggedSwitch = NO;
BOOL connectBluetoothDeviceSwitch = NO;

// Status Changes Section
BOOL unlockSwitch = NO;
BOOL lockSwitch = NO;
BOOL authenticationSwitch = NO;
BOOL callSwitch = NO;

// System Wide Section
BOOL UIButtonSwitch = NO;
BOOL UIButtonBarButtonSwitch = NO;
BOOL UITabBarButtonSwitch = NO;
BOOL UIImageViewSwitch = NO;
BOOL UIViewSwitch = NO;
BOOL UIWindowSwitch = NO;

// Additionals Section
BOOL lockAnimationSwitch = NO;

// Enable App Support Switches
BOOL apolloSupportSwitch = NO;
BOOL calculatorSupportSwitch = NO;
BOOL facebookSupportSwitch = NO;
BOOL instagramSupportSwitch = NO;
BOOL musicSupportSwitch = NO;
BOOL phoneSupportSwitch = NO;
BOOL safariSupportSwitch = NO;
BOOL sileoSupportSwitch = NO;
BOOL spotifySupportSwitch = NO;
BOOL tiktokSupportSwitch = NO;
BOOL twitterSupportSwitch = NO;

// Delay
BOOL delaySwitch = NO;
NSString* delayLevel = @"0.0";

// Low Power Mode And DND Mode Recognition
BOOL LowPowerMode = NO;
BOOL LowPowerModeSwitch = NO;
BOOL isDNDActive = NO;
BOOL isDNDActiveSwitch = NO;

// Anywhere Section (Custom)
NSString* customStrengthKillingControl = @"0";
NSString* customStrengthSwitcherControl = @"0";
NSString* customStrengthSiriControl = @"0";
NSString* customStrengthScreenshotControl = @"0";
NSString* customStrengthReachabilityControl = @"0";
NSString* customStrengthTextSelectionControl = @"0";
NSString* customStrengthPowerDownControl = @"0";
NSString* customStrengthRespringControl = @"0";
NSString* customStrengthKeyboardControl = @"0";
NSString* customStrengthEnterBackgroundControl = @"0";
NSString* customStrengthAlertAppearControl = @"0";
NSString* customStrengthAlertDisappearControl = @"0";

// Control Center Section (Custom)
NSString* customStrengthCCToggleControl = @"0";
NSString* customStrengthOpenControlCenterControl = @"0";
NSString* customStrengthCCModuleControl = @"0";

// Hardware Buttons Section (Custom)
NSString* customStrengthVolumeControl = @"0";
NSString* customStrengthSleepButtonControl = @"0";
NSString* customStrengthHomeButtonControl = @"0";
NSString* customStrengthRingerControl = @"0";

// Homescreen Section (Custom)
NSString* customStrengthForceTouchControl = @"0";
NSString* customStrengthFolderOpenControl = @"0";
NSString* customStrengthFolderCloseControl = @"0";
NSString* customStrengthIconTapControl = @"0";
NSString* customStrengthPageSwipeControl = @"0";
NSString* customStrengthSpotlightControl = @"0";

// Lockscreen Section (Custom)
NSString* customStrengthPasscodeControl = @"0";
NSString* customStrengthQuickActionsButtonControl = @"0";

// Other Hardware Action Section (Custom)
NSString* customStrengthWakeControl = @"0";
NSString* customStrengthPluggedControl = @"0";
NSString* customStrengthConnectBluetoothDeviceControl = @"0";

// Status Changes Section (Custom)
NSString* customStrengthUnlockControl = @"0";
NSString* customStrengthLockControl = @"0";
NSString* customStrengthAuthenticationControl = @"0";
NSString* customStrengthCallControl = @"0";

// System Wide Section (Custom)
NSString* customStrengthUIButtonControl = @"0";
NSString* customStrengthUIButtonBarButtonControl = @"0";
NSString* customStrengthUITabBarButtonControl = @"0";
NSString* customStrengthUIImageViewControl = @"0";
NSString* customStrengthUIViewControl = @"0";
NSString* customStrengthUIWindowControl = @"0";

// Rose wide haptics controller
void prepareForHaptic() {

    int hapticStrength = [hapticLevel intValue];
	int tapticStrength = [tapticLevel intValue];

	if (enableHapticEngineSwitch) {
		if (hapticStrength == 0) {
			AudioServicesPlaySystemSound(1519);

		}

		else if (hapticStrength == 1) {
			AudioServicesPlaySystemSound(1520);

		}

		else if (hapticStrength == 2) {
			AudioServicesPlaySystemSound(1521);

		}
		
	}

	if (enableTapticEngineSwitch) {
		[gen prepare];

		if (tapticStrength == 0) {
			gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];

		} else if (tapticStrength == 1) {
			gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];

		} else if (tapticStrength == 2) {
			gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy];

		} else if (tapticStrength == 3) {
			gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleSoft];

		} else if (tapticStrength == 4) {
			gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleRigid];

		}

		[gen impactOccurred];

	}

}

	// Rose wide haptics trigger
void triggerFeedback() {

	if ((LowPowerModeSwitch && LowPowerMode) || (isDNDActiveSwitch && isDNDActive) || !enabled) return;
	if (!delaySwitch) {
		prepareForHaptic();

	} else if (delaySwitch) {
		double delay = [delayLevel intValue];
		dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC);
		dispatch_after(popTime, dispatch_get_main_queue(), ^(void){

			prepareForHaptic();

		});
		
	}

}

	// Rose custom haptis controller
void prepareCustomFeedback() {

	if (customFeedbackValue > 0 && customFeedbackValue < 4) {
		if (customFeedbackValue == 1) {
			AudioServicesPlaySystemSound(1519);

		}

		else if (customFeedbackValue == 2) {
			AudioServicesPlaySystemSound(1520);

		}

		else if (customFeedbackValue == 3) {
			AudioServicesPlaySystemSound(1521);

		}
		
	}

	if (customFeedbackValue > 3 && customFeedbackValue < 9) {
		[gen prepare];

		if (customFeedbackValue == 4) {
			gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];

		} else if (customFeedbackValue == 5) {
			gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];

		} else if (customFeedbackValue == 6) {
			gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy];

		} else if (customFeedbackValue == 7) {
			gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleSoft];

		} else if (customFeedbackValue == 8) {
			gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleRigid];

		}

		[gen impactOccurred];

	}

}

	// Rose custom haptics trigger
void triggerCustomFeedback() {

	if ((LowPowerModeSwitch && LowPowerMode) || (isDNDActiveSwitch && isDNDActive) || !enabled) return;
	if (!delaySwitch) {
		prepareCustomFeedback();

	} else if (delaySwitch) {
		double delay = [delayLevel intValue];
		dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC);
		dispatch_after(popTime, dispatch_get_main_queue(), ^(void){

			prepareCustomFeedback();

		});
		
	}

}

// https://stackoverflow.com/a/43816242
void AudioServicesPlaySystemSoundWithVibration(UInt32 inSystemSoundID, id arg, NSDictionary* vibratePattern);

void prepareLegacyFeedback(float durationInSeconds, float intensivity, long count)  {

    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    NSMutableArray* arr = [NSMutableArray array];

    for (long i = count; i--;) {
		[arr addObject:[NSNumber numberWithBool:YES]];
        [arr addObject:[NSNumber numberWithInt:durationInSeconds*1000]];

        [arr addObject:[NSNumber numberWithBool:NO]];
        [arr addObject:[NSNumber numberWithInt:durationInSeconds*1000]];

    }

    [dict setObject:arr forKey:@"VibePattern"];
    [dict setObject:[NSNumber numberWithFloat:intensivity] forKey:@"Intensity"];

    AudioServicesPlaySystemSoundWithVibration(4095,nil,dict);

}

	// Rose legacy haptics trigger
void triggerLegacyFeedback() {

	if ((LowPowerModeSwitch && LowPowerMode) || (isDNDActiveSwitch && isDNDActive) || !enabled) return;
	int selectedLegacyMode = [legacyLevel intValue];
	double customLegacyDuration = [customlegacyDurationLevel doubleValue];
	double customLegacyStrength = [customlegacyStrengthLevel doubleValue];

	if (!delaySwitch) {
		if (selectedLegacyMode == 0) {
				prepareLegacyFeedback(.025, .05, 1);

		} else if (selectedLegacyMode == 1) {
				prepareLegacyFeedback(customLegacyDuration, customLegacyStrength, 1);

		}

	} else if (delaySwitch) {
		double delay = [delayLevel intValue];
		dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC);
		dispatch_after(popTime, dispatch_get_main_queue(), ^(void){

			if (selectedLegacyMode == 0) {
				prepareLegacyFeedback(.025, .05, 1);

			} else if (selectedLegacyMode == 1) {
				prepareLegacyFeedback(customLegacyDuration, customLegacyStrength, 1);

			}

		});
		
	}

}

%group Homescreen

%hook SBUIIconForceTouchController

- (void)iconForceTouchViewControllerWillDismiss:(id)arg1 {

	%orig;

	if (!enabled || !homescreenSectionSupportSwitch || !forceSwitch) return;
	int customStrength = [customStrengthForceTouchControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%hook SBFolderController

- (void)folderControllerWillOpen:(id)arg1 {

	%orig;

	if (!enabled || !homescreenSectionSupportSwitch || !folderOpenSwitch) return;
	int customStrength = [customStrengthFolderOpenControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

- (void)folderControllerWillClose:(id)arg1 {

	%orig;

	if (!enabled || !homescreenSectionSupportSwitch || !folderCloseSwitch) return;
	int customStrength = [customStrengthFolderCloseControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%hook SBHIconManager

- (void)iconTapped:(id)arg1 {

	%orig;

	if (!enabled || !homescreenSectionSupportSwitch || !iconTapSwitch) return;
	int customStrength = [customStrengthIconTapControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%hook SBFolderView

- (void)scrollViewWillBeginDragging:(id)arg1 {

	%orig;

	if (!enabled || !homescreenSectionSupportSwitch || !pageSwipeSwitch) return;
	int customStrength = [customStrengthPageSwipeControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%hook SBSearchScrollView

- (BOOL)gestureRecognizerShouldBegin:(id)arg1 {

	if (!enabled || !homescreenSectionSupportSwitch || !spotlightSwitch) return %orig;
	int customStrength = [customStrengthSpotlightControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

	return %orig;

}

%end

%end

%group Lockscreen

%hook SBUIPasscodeLockViewBase 

- (void)_sendDelegateKeypadKeyDown {

	%orig;

	if (!enabled || !lockscreenSectionSupportSwitch || !passcodeSwitch) return;
	int customStrength = [customStrengthPasscodeControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%hook CSQuickActionsButton

- (void)setSelected:(BOOL)arg1 {

	%orig;

	if (!enabled || !anywhereSectionSupportSwitch || !alertDisappearSwitch) return;
	int customStrength = [customStrengthQuickActionsButtonControl intValue];

	if (quickActionsButtonSwitch && customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (quickActionsButtonSwitch && customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (quickActionsButtonSwitch && customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%end

%group Anywhere

%hook SBApplication

- (void)_didExitWithContext:(id)arg1 {

	%orig;

	if (!enabled || !anywhereSectionSupportSwitch || !killingSwitch) return;
	int customStrength = [customStrengthKillingControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%hook SBAppSwitcherPageView

- (void)setVisible:(BOOL)arg1 {

	%orig;

	if (!enabled || !anywhereSectionSupportSwitch || !switcherSwitch) return;
	int customStrength = [customStrengthSwitcherControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%hook SiriUISiriStatusView

- (void)didMoveToWindow {

	%orig;

	if (!enabled || !anywhereSectionSupportSwitch || !siriSwitch) return;
	int customStrength = [customStrengthSiriControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%hook SSScreenCapturer

+ (void)playScreenshotSound {

	%orig;

	if (!enabled || !anywhereSectionSupportSwitch || !screenshotSwitch) return;
	int customStrength = [customStrengthScreenshotControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%hook SBUIController

- (void)handleWillBeginReachabilityAnimation {

	%orig;

	if (!enabled || !anywhereSectionSupportSwitch || !reachabilitySwitch) return;
	int customStrength = [customStrengthReachabilityControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%hook UICalloutBar

- (void)buttonPressed:(id)arg1 {

	%orig;

	if (!enabled || !anywhereSectionSupportSwitch || !textSelectionSwitch) return;
	int customStrength = [customStrengthTextSelectionControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%hook SBPowerDownViewController

- (void)viewWillAppear:(BOOL)arg1 {

	%orig;

	if (!enabled || !anywhereSectionSupportSwitch || !powerSwitch) return;
	int customStrength = [customStrengthPowerDownControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%hook SpringBoard

- (void)applicationDidFinishLaunching:(id)arg1 {

	%orig;

	if (!enabled || !anywhereSectionSupportSwitch || !respringSwitch) return;
	int customStrength = [customStrengthRespringControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%hook UIKeyboardLayoutStar

- (void)playKeyClickSoundOnDownForKey:(UIKBTree *)key {

	%orig;

	if (!enabled || !anywhereSectionSupportSwitch || !keyboardSwitch) return;
	int customStrength = [customStrengthKeyboardControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%hook SBIconController

- (void)viewWillAppear:(BOOL)arg1 {

	%orig;

	if (!enabled || !anywhereSectionSupportSwitch || !enterBackgroundSwitch) return;
	int customStrength = [customStrengthEnterBackgroundControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%hook UIAlertController

- (void)viewWillAppear:(BOOL)arg1 {

    %orig;
	
	if (!enabled || !anywhereSectionSupportSwitch || !alertAppearSwitch) return;
	int customStrength = [customStrengthAlertAppearControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

- (void)viewWillDisappear:(BOOL)arg1 {

   %orig;
	
	if (!enabled || !anywhereSectionSupportSwitch || !alertDisappearSwitch) return;
	int customStrength = [customStrengthAlertDisappearControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%end

%group HardwareButtons

%hook SBVolumeControl

- (void)increaseVolume {

	%orig;

	if (!enabled || !hardwareButtonsSectionSupportSwitch || !volumeSwitch) return;
	int customStrength = [customStrengthVolumeControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

- (void)decreaseVolume {

	%orig;

	if (!enabled || !hardwareButtonsSectionSupportSwitch || !volumeSwitch) return;
	int customStrength = [customStrengthVolumeControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%hook SBSleepWakeHardwareButtonInteraction

- (BOOL)consumeInitialPressDown {

	if (!enabled || !hardwareButtonsSectionSupportSwitch || !sleepButtonSwitch) return %orig;
	int customStrength = [customStrengthSleepButtonControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

	return %orig;

}

%end

%hook SpringBoard

- (BOOL)_handlePhysicalButtonEvent:(UIPressesEvent *)arg1 {

	// type = 101 -> Home button
	// force = 0 -> button released
	// force = 1 -> button pressed

	//int type = arg1.allPresses.allObjects[0].type;
	if (!enabled || !hardwareButtonsSectionSupportSwitch || !homeButtonSwitch) return %orig;
	int force = arg1.allPresses.allObjects[0].force;
	int customStrength = [customStrengthHomeButtonControl intValue];

	if (force == 1) {
		if (customStrength == 0 && !enableLegacyEngineSwitch) {
			triggerFeedback();

		} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
			customFeedbackValue = customStrength;
			triggerCustomFeedback();

		} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

		}

	}

	return %orig;

}

- (void)_ringerChanged:(id)arg1 {

	%orig;

	if (!enabled || !hardwareButtonsSectionSupportSwitch || !ringerSwitch) return;
	int customStrength = [customStrengthRingerControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%end

%group ControlCenter

%hook CCUILabeledRoundButton

- (void)buttonTapped:(id)arg1 {

	%orig;

	if (!enabled || !controlCenterSectionSupportSwitch || !ccToggleSwitch) return;
	int customStrength = [customStrengthCCToggleControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%hook SBControlCenterController

- (void)_willPresent {

	%orig;

	if (!enabled || !controlCenterSectionSupportSwitch || !openControlCenterSwitch) return;
	int customStrength = [customStrengthOpenControlCenterControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%hook CCUIToggleViewController

- (void)buttonTapped:(id)arg1 forEvent:(id)arg2 {

	%orig;

	if (!enabled || !controlCenterSectionSupportSwitch || !ccModuleSwitch) return;
	int customStrength = [customStrengthCCModuleControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%end

%group StatusChanges

%hook SBCoverSheetPrimarySlidingViewController

- (void)viewWillDisappear:(BOOL)arg1 {

	%orig;

	if (!enabled || !statusChangesSectionSupportSwitch || !unlockSwitch) return;
	int customStrength = [customStrengthUnlockControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%hook SBSleepWakeHardwareButtonInteraction

- (void)_playLockSound {

	%orig;

	if (!enabled || !statusChangesSectionSupportSwitch || !lockSwitch) return;
	int customStrength = [customStrengthLockControl intValue];

	if (lockAnimationSwitch && !(LowPowerModeSwitch && LowPowerMode)) {
		gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleRigid];
		[gen impactOccurred];
		dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.065 * NSEC_PER_SEC);
		dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
					
			[gen impactOccurred];

		});

	} else if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%hook SBDashBoardLockScreenEnvironment

- (void)setAuthenticated:(BOOL)arg1 {

	%orig;

	if (!enabled || !statusChangesSectionSupportSwitch || !authenticationSwitch) return;
	if (arg1) {
		int customStrength = [customStrengthAuthenticationControl intValue];

		if (customStrength == 0 && !enableLegacyEngineSwitch) {
			triggerFeedback();

		} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
			customFeedbackValue = customStrength;
			triggerCustomFeedback();

		} else if (customStrength == 0 && enableLegacyEngineSwitch) {
			triggerLegacyFeedback();

		}

	}

}

%end

%hook TUCall

- (void)_handleStatusChange {

	%orig;

	if (!enabled || !statusChangesSectionSupportSwitch || !callSwitch) return;
	int customStrength = [customStrengthCallControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%hook BluetoothDevice

- (void)connect {

	%orig;
	
	if (!enabled || !otherHardwareActionsSectionSupportSwitch || !connectBluetoothDeviceSwitch) return;
	int customStrength = [customStrengthConnectBluetoothDeviceControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%end

%group OtherHardwareActions

%hook SBBacklightController

- (void)turnOnScreenFullyWithBacklightSource:(long long)source {

	%orig;

	if (!enabled || !otherHardwareActionsSectionSupportSwitch || !wakeSwitch) return;
	// 26 - source of screenshots on newer ios version (afaik); eg this method gets called with source == 26 if u make a screenshot
	if (source != 26) {
		int customStrength = [customStrengthWakeControl intValue];

		if (customStrength == 0 && !enableLegacyEngineSwitch) {
			triggerFeedback();

		} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
			customFeedbackValue = customStrength;
			triggerCustomFeedback();

		} else if (customStrength == 0 && enableLegacyEngineSwitch) {
			triggerLegacyFeedback();

		}

	}

}

%end

%hook SBUIController

- (void)ACPowerChanged {

	%orig;

	if (!enabled || !otherHardwareActionsSectionSupportSwitch || !pluggedSwitch) return;
	int customStrength = [customStrengthPluggedControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%end

%group SystemWide

%hook UIButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;
	
	if (!enabled || !systemWideSectionSupportSwitch || !UIButtonSwitch) return;
	int customStrength = [customStrengthUIButtonControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%hook _UIButtonBarButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;
	
	if (!enabled || !systemWideSectionSupportSwitch || !UIButtonBarButtonSwitch) return;
	int customStrength = [customStrengthUIButtonBarButtonControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%hook UITabBarButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;
	
	if (!enabled || !systemWideSectionSupportSwitch || !UITabBarButtonSwitch) return;
	int customStrength = [customStrengthUITabBarButtonControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%hook UIImageView

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;
	
	if (!enabled || !systemWideSectionSupportSwitch || !UIImageViewSwitch) return;
	int customStrength = [customStrengthUIImageViewControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%hook UIView 

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;
	
	if (!enabled || !systemWideSectionSupportSwitch || !UIViewSwitch) return;
	int customStrength = [customStrengthUIViewControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%hook UIWindow

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;
	
	if (!enabled || !systemWideSectionSupportSwitch || !UIWindowSwitch) return;
	int customStrength = [customStrengthUIWindowControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%end

// Getting The State Of The Low Power Mode And DND
%hook NSProcessInfo

- (BOOL)isLowPowerModeEnabled {

	LowPowerMode = %orig;

	return %orig;

}

%end

%hook DNDState

- (BOOL)isActive {

	isDNDActive = %orig;

	return %orig;

}

%end

%group iOS12

%hook VolumeControl

- (void)increaseVolume {

	%orig;

	if (!enabled || !hardwareButtonsSectionSupportSwitch || !volumeSwitch) return;
	int customStrength = [customStrengthVolumeControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

- (void)decreaseVolume {

	%orig;

	if (!enabled || !hardwareButtonsSectionSupportSwitch || !volumeSwitch) return;
	int customStrength = [customStrengthVolumeControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%hook SBPowerDownController

- (void)orderFront {

	%orig;

	if (!enabled || !anywhereSectionSupportSwitch || !powerSwitch) return;
	int customStrength = [customStrengthPowerDownControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%hook SBIconController

- (void)iconTapped:(id)arg1 {

	%orig;

	if (!enabled || !homescreenSectionSupportSwitch || !iconTapSwitch) return;
	int customStrength = [customStrengthIconTapControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%hook SBDashBoardViewController

- (void)setAuthenticated:(BOOL)authenticated {

    %orig;

	if (!enabled || !statusChangesSectionSupportSwitch || !authenticationSwitch) return;
    if (authenticated) {
		int customStrength = [customStrengthAuthenticationControl intValue];

		if (customStrength == 0 && !enableLegacyEngineSwitch) {
			triggerFeedback();

		} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
			customFeedbackValue = customStrength;
			triggerCustomFeedback();

		} else if (customStrength == 0 && enableLegacyEngineSwitch) {
			triggerLegacyFeedback();

		}

	}

}

%end

%hook SBDashBoardQuickActionsButton

- (void)setSelected:(BOOL)arg1 {

	%orig;

	if (!enabled || !lockscreenSectionSupportSwitch || !quickActionsButtonSwitch) return;
	int customStrength = [customStrengthQuickActionsButtonControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%end

%group RoseIntegrityFail

%hook SBIconController

- (void)viewDidAppear:(BOOL)animated {

    %orig; //  Thanks to Nepeta for the DRM
    if (!dpkgInvalid) return;
		UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Rose"
		message:@"Seriously? Pirating a free Tweak is awful!\nPiracy repo's Tweaks could contain Malware if you didn't know that, so go ahead and get Rose from the official Source https://repo.litten.sh/.\nIf you're seeing this but you got it from the official source then make sure to add https://repo.litten.sh to Cydia or Sileo."
		preferredStyle:UIAlertControllerStyleAlert];

		UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Aww man" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {

			UIApplication *application = [UIApplication sharedApplication];
			[application openURL:[NSURL URLWithString:@"https://repo.litten.sh/"] options:@{} completionHandler:nil];

	}];

		[alertController addAction:cancelAction];

		[self presentViewController:alertController animated:YES completion:nil];

}

%end

%end
	// Thanks to Nepeta for the DRM
%ctor {

	if (![NSProcessInfo processInfo]) return;
    NSString *processName = [NSProcessInfo processInfo].processName;
    bool isSpringboard = [@"SpringBoard" isEqualToString:processName];

    // https://www.reddit.com/r/jailbreak/comments/4yz5v5/questionremote_messages_not_enabling/d6rlh88/
    bool shouldLoad = NO;
    NSArray *args = [[NSClassFromString(@"NSProcessInfo") processInfo] arguments];
    NSUInteger count = args.count;
    if (count != 0) {
        NSString *executablePath = args[0];
        if (executablePath) {
            NSString *processName = [executablePath lastPathComponent];
            BOOL isApplication = [executablePath rangeOfString:@"/Application/"].location != NSNotFound || [executablePath rangeOfString:@"/Applications/"].location != NSNotFound;
            BOOL isFileProvider = [[processName lowercaseString] rangeOfString:@"fileprovider"].location != NSNotFound;
            BOOL skip = [processName isEqualToString:@"AdSheet"]
                        || [processName isEqualToString:@"CoreAuthUI"]
                        || [processName isEqualToString:@"InCallService"]
                        || [processName isEqualToString:@"MessagesNotificationViewService"]
                        || [executablePath rangeOfString:@".appex/"].location != NSNotFound;
            if ((!isFileProvider && isApplication && !skip) || isSpringboard) {
                shouldLoad = YES;
            }
        }
    }

    if (!shouldLoad) return;

    dpkgInvalid = ![[NSFileManager defaultManager] fileExistsAtPath:@"/var/lib/dpkg/info/sh.litten.rose.list"];

    if (!dpkgInvalid) dpkgInvalid = ![[NSFileManager defaultManager] fileExistsAtPath:@"/var/lib/dpkg/info/sh.litten.rose.md5sums"];

	if (dpkgInvalid) {
        %init(RoseIntegrityFail);
        return;

    }

    pfs = [[HBPreferences alloc] initWithIdentifier:@"sh.litten.rosepreferences"];
	// Enabled Switch
    [pfs registerBool:&enabled default:nil forKey:@"Enabled"];
	// Engine Switches
	[pfs registerBool:&enableTapticEngineSwitch default:NO forKey:@"enableTapticEngine"];
	[pfs registerBool:&enableHapticEngineSwitch default:NO forKey:@"enableHapticEngine"];
	[pfs registerBool:&enableLegacyEngineSwitch default:NO forKey:@"enableLegacyEngine"];
	// Segmented Controls For Feedback Strength
	[pfs registerObject:&tapticLevel default:@"0" forKey:@"TapticStrength"];
    [pfs registerObject:&hapticLevel default:@"0" forKey:@"HapticStrength"];
	[pfs registerObject:&legacyLevel default:@"0" forKey:@"LegacyStrength"];
	// Custom Legacy Sliders
	[pfs registerObject:&customlegacyDurationLevel default:@"0" forKey:@"customLegacyDuration"];
	[pfs registerObject:&customlegacyStrengthLevel default:@"0" forKey:@"customLegacyStrength"];
	// Switches To Enable Sections
	[pfs registerBool:&anywhereSectionSupportSwitch default:NO forKey:@"anywhereSectionSupport"];
	[pfs registerBool:&controlCenterSectionSupportSwitch default:NO forKey:@"controlCenterSectionSupport"];
	[pfs registerBool:&hardwareButtonsSectionSupportSwitch default:NO forKey:@"hardwareButtonsSectionSupport"];
	[pfs registerBool:&homescreenSectionSupportSwitch default:NO forKey:@"homescreenSectionSupport"];
	[pfs registerBool:&lockscreenSectionSupportSwitch default:NO forKey:@"lockscreenSectionSupport"];
	[pfs registerBool:&otherHardwareActionsSectionSupportSwitch default:NO forKey:@"otherHardwareActionsSectionSupport"];
	[pfs registerBool:&statusChangesSectionSupportSwitch default:NO forKey:@"statusChangesSectionSupport"];
	[pfs registerBool:&systemWideSectionSupportSwitch default:NO forKey:@"systemWideSectionSupport"];
	[pfs registerBool:&extrasSectionSupportSwitch default:NO forKey:@"extrasSectionSupport"];
	[pfs registerBool:&exceptionsSectionSupportSwitch default:NO forKey:@"exceptionsSectionSupport"];
	// Anywhere Section
	if (anywhereSectionSupportSwitch) {
		[pfs registerBool:&killingSwitch default:NO forKey:@"killingApp"];
		[pfs registerBool:&switcherSwitch default:NO forKey:@"appSwitcherFeedback"];
		[pfs registerBool:&siriSwitch default:NO forKey:@"siriUIFeedback"];
		[pfs registerBool:&screenshotSwitch default:NO forKey:@"takeScreenshot"];
		[pfs registerBool:&reachabilitySwitch default:NO forKey:@"reachability"];
		[pfs registerBool:&textSelectionSwitch default:NO forKey:@"textSelection"];
		[pfs registerBool:&powerSwitch default:NO forKey:@"powerDownView"];
		[pfs registerBool:&respringSwitch default:NO forKey:@"respring"];
		[pfs registerBool:&keyboardSwitch default:NO forKey:@"usingKeyboard"];
		[pfs registerBool:&enterBackgroundSwitch default:NO forKey:@"enterBackground"];
		[pfs registerBool:&alertAppearSwitch default:NO forKey:@"alertAppear"];
		[pfs registerBool:&alertDisappearSwitch default:NO forKey:@"alertDisappear"];

	}
	// Control Center Section
	if (controlCenterSectionSupportSwitch) {
		[pfs registerBool:&ccToggleSwitch default:NO forKey:@"controlCenterToggleFeedback"];
		[pfs registerBool:&openControlCenterSwitch default:NO forKey:@"openControlCenter"];
		[pfs registerBool:&ccModuleSwitch default:NO forKey:@"ccModule"];

	}
	// Hardware Buttons Section
	if (hardwareButtonsSectionSupportSwitch) {
		[pfs registerBool:&volumeSwitch default:NO forKey:@"volumeChanged"];
		[pfs registerBool:&sleepButtonSwitch default:NO forKey:@"sleepButton"];
		[pfs registerBool:&homeButtonSwitch default:NO forKey:@"homeButton"];
		[pfs registerBool:&ringerSwitch default:NO forKey:@"ringer"];

	}
	// Homescreen Section
	if (homescreenSectionSupportSwitch) {
		[pfs registerBool:&forceSwitch default:NO forKey:@"forceTouchDismiss"];
		[pfs registerBool:&folderOpenSwitch default:NO forKey:@"folderOpen"];
		[pfs registerBool:&folderCloseSwitch default:NO forKey:@"folderClose"];
		[pfs registerBool:&iconTapSwitch default:NO forKey:@"iconTap"];
		[pfs registerBool:&pageSwipeSwitch default:NO forKey:@"pageSwipe"];
		[pfs registerBool:&spotlightSwitch default:NO forKey:@"spotlight"];

	}
	// Lockscreen Section
	if (lockscreenSectionSupportSwitch) {
		[pfs registerBool:&passcodeSwitch default:NO forKey:@"enterPasscode"];
		[pfs registerBool:&quickActionsButtonSwitch default:NO forKey:@"quickActionsButton"];

	}
	// Other Hardware Actions Section
	if (otherHardwareActionsSectionSupportSwitch) {
		[pfs registerBool:&wakeSwitch default:NO forKey:@"displayWake"];
		[pfs registerBool:&pluggedSwitch default:NO forKey:@"chargerPluggedInOrOut"];
		[pfs registerBool:&connectBluetoothDeviceSwitch default:NO forKey:@"connectBluetoothDevice"];

	}
	// Status Changes Section
	if (statusChangesSectionSupportSwitch) {
		[pfs registerBool:&unlockSwitch default:NO forKey:@"unlock"];
		[pfs registerBool:&lockSwitch default:NO forKey:@"lock"];
		[pfs registerBool:&authenticationSwitch default:NO forKey:@"authentication"];
		[pfs registerBool:&callSwitch default:NO forKey:@"call"];

	}
	// System Wide Section
	if (systemWideSectionSupportSwitch) {
		[pfs registerBool:&UIButtonSwitch default:NO forKey:@"UIButton"];
		[pfs registerBool:&UIButtonBarButtonSwitch default:NO forKey:@"UIButtonBarButton"];
		[pfs registerBool:&UITabBarButtonSwitch default:NO forKey:@"UITabBarButton"];
		[pfs registerBool:&UIImageViewSwitch default:NO forKey:@"UIImageView"];
		[pfs registerBool:&UIViewSwitch default:NO forKey:@"UIView"];
		[pfs registerBool:&UIWindowSwitch default:NO forKey:@"UIWindow"];

	}
	// Additionals Section
	if (extrasSectionSupportSwitch) {
		[pfs registerBool:&lockAnimationSwitch default:NO forKey:@"lockAnimation"];

	}

	// App Support Switches
	[pfs registerBool:&apolloSupportSwitch default:NO forKey:@"apolloSupport"];
	[pfs registerBool:&calculatorSupportSwitch default:NO forKey:@"calculatorSupport"];
	[pfs registerBool:&facebookSupportSwitch default:NO forKey:@"facebookSupport"];
	[pfs registerBool:&instagramSupportSwitch default:NO forKey:@"instagramSupport"];
	[pfs registerBool:&musicSupportSwitch default:NO forKey:@"musicSupport"];
	[pfs registerBool:&phoneSupportSwitch default:NO forKey:@"phoneSupport"];
	[pfs registerBool:&safariSupportSwitch default:NO forKey:@"safariSupport"];
	[pfs registerBool:&sileoSupportSwitch default:NO forKey:@"sileoSupport"];
	[pfs registerBool:&spotifySupportSwitch default:NO forKey:@"spotifySupport"];
	[pfs registerBool:&tiktokSupportSwitch default:NO forKey:@"tiktokSupport"];
	[pfs registerBool:&twitterSupportSwitch default:NO forKey:@"twitterSupport"];

	// Delay Slider And Switch
	[pfs registerBool:&delaySwitch default:NO forKey:@"enableHapticDelay"];
	[pfs registerObject:&delayLevel default:@"0.0" forKey:@"Delay"];
	// Low Power And DND Mode
	if (exceptionsSectionSupportSwitch) {
		[pfs registerBool:&LowPowerModeSwitch default:NO forKey:@"lowPowerMode"];
		[pfs registerBool:&isDNDActiveSwitch default:NO forKey:@"isDNDActive"];

	}
	// Anywhere List Controllers
	if (anywhereSectionSupportSwitch) {
		[pfs registerObject:&customStrengthKillingControl default:@"0" forKey:@"customStrengthKilling"];
		[pfs registerObject:&customStrengthSwitcherControl default:@"0" forKey:@"customStrengthSwitcher"];
		[pfs registerObject:&customStrengthSiriControl default:@"0" forKey:@"customStrengthSiri"];
		[pfs registerObject:&customStrengthScreenshotControl default:@"0" forKey:@"customStrengthScreenshot"];
		[pfs registerObject:&customStrengthReachabilityControl default:@"0" forKey:@"customStrengthReachability"];
		[pfs registerObject:&customStrengthTextSelectionControl default:@"0" forKey:@"customStrengthTextSelection"];
		[pfs registerObject:&customStrengthPowerDownControl default:@"0" forKey:@"customStrengthPowerDown"];
		[pfs registerObject:&customStrengthRespringControl default:@"0" forKey:@"customStrengthRespring"];
		[pfs registerObject:&customStrengthKeyboardControl default:@"0" forKey:@"customStrengthKeyboard"];
		[pfs registerObject:&customStrengthEnterBackgroundControl default:@"0" forKey:@"customStrengthEnterBackground"];
		[pfs registerObject:&customStrengthAlertAppearControl default:@"0" forKey:@"customStrengthAlertAppear"];
		[pfs registerObject:&customStrengthAlertDisappearControl default:@"0" forKey:@"customStrengthAlertDisappear"];

	}
	// Control Center Section
	if (controlCenterSectionSupportSwitch) {
		[pfs registerObject:&customStrengthCCToggleControl default:@"0" forKey:@"customStrengthCCToggle"];
		[pfs registerObject:&customStrengthOpenControlCenterControl default:@"0" forKey:@"customStrengthOpenControlCenter"];
		[pfs registerObject:&customStrengthCCModuleControl default:@"0" forKey:@"customStrengthCCModule"];

	}
	// Hardware Buttons Section
	if (hardwareButtonsSectionSupportSwitch) {
		[pfs registerObject:&customStrengthVolumeControl default:@"0" forKey:@"customStrengthVolume"];
		[pfs registerObject:&customStrengthSleepButtonControl default:@"0" forKey:@"customStrengthSleepButton"];
		[pfs registerObject:&customStrengthHomeButtonControl default:@"0" forKey:@"customStrengthHomeButton"];
		[pfs registerObject:&customStrengthRingerControl default:@"0" forKey:@"customStrengthRinger"];

	}
	// Homescreen Section
	if (homescreenSectionSupportSwitch) {
		[pfs registerObject:&customStrengthForceTouchControl default:@"0" forKey:@"customStrengthForceTouch"];
		[pfs registerObject:&customStrengthFolderOpenControl default:@"0" forKey:@"customStrengthFolderOpen"];
		[pfs registerObject:&customStrengthFolderCloseControl default:@"0" forKey:@"customStrengthFolderClose"];
		[pfs registerObject:&customStrengthIconTapControl default:@"0" forKey:@"customStrengthIconTap"];
		[pfs registerObject:&customStrengthPageSwipeControl default:@"0" forKey:@"customStrengthPageSwipe"];
		[pfs registerObject:&customStrengthSpotlightControl default:@"0" forKey:@"customStrengthSpotlight"];

	}
	// Lockscreen Section
	if (lockscreenSectionSupportSwitch) {
		[pfs registerObject:&customStrengthPasscodeControl default:@"0" forKey:@"customStrengthPasscode"];
		[pfs registerObject:&customStrengthQuickActionsButtonControl default:@"0" forKey:@"customStrengthQuickActionsButton"];

	}
	// Other Hardware Actions Section
	if (otherHardwareActionsSectionSupportSwitch) {
		[pfs registerObject:&customStrengthWakeControl default:@"0" forKey:@"customStrengthWake"];
		[pfs registerObject:&customStrengthPluggedControl default:@"0" forKey:@"customStrengthPlugged"];
		[pfs registerObject:&customStrengthConnectBluetoothDeviceControl default:@"0" forKey:@"customStrengthConnectBluetoothDevice"];

	}
	// Status Changes Section
	if (statusChangesSectionSupportSwitch) {
		[pfs registerObject:&customStrengthUnlockControl default:@"0" forKey:@"customStrengthUnlock"];
		[pfs registerObject:&customStrengthLockControl default:@"0" forKey:@"customStrengthLock"];
		[pfs registerObject:&customStrengthAuthenticationControl default:@"0" forKey:@"customStrengthAuthentication"];
		[pfs registerObject:&customStrengthCallControl default:@"0" forKey:@"customStrengthCall"];

	}
	// System Wide Section
	if (systemWideSectionSupportSwitch) {
		[pfs registerObject:&customStrengthUIButtonControl default:@"0" forKey:@"customStrengthUIButton"];
		[pfs registerObject:&customStrengthUIButtonBarButtonControl default:@"0" forKey:@"customStrengthUIButtonBarButton"];
		[pfs registerObject:&customStrengthUITabBarButtonControl default:@"0" forKey:@"customStrengthUITabBarButton"];
		[pfs registerObject:&customStrengthUIImageViewControl default:@"0" forKey:@"customStrengthUIImageView"];
		[pfs registerObject:&customStrengthUIViewControl default:@"0" forKey:@"customStrengthUIView"];
		[pfs registerObject:&customStrengthUIWindowControl default:@"0" forKey:@"customStrengthUIWindow"];

	}

	if (!dpkgInvalid && enabled) {
        BOOL ok = false;
        
        ok = ([[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithFormat:@"/var/lib/dpkg/info/%@%@%@%@%@%@%@%@%@.rose.md5sums", @"s", @"h", @".", @"l", @"i", @"t", @"t", @"e", @"n"]]
        );

        if (ok && [@"litten" isEqualToString:@"litten"]) {
			if (homescreenSectionSupportSwitch) %init(Homescreen);
			if (lockscreenSectionSupportSwitch) %init(Lockscreen);
			if (anywhereSectionSupportSwitch) %init(Anywhere);
			if (hardwareButtonsSectionSupportSwitch) %init(HardwareButtons);
			if (controlCenterSectionSupportSwitch) %init(ControlCenter);
			if (statusChangesSectionSupportSwitch) %init(StatusChanges);
			if (otherHardwareActionsSectionSupportSwitch) %init(OtherHardwareActions);
			if (systemWideSectionSupportSwitch)	 %init(SystemWide);
			%init(_ungrouped); // Initialise Everything Outside Any Group
			if (@available(iOS 12.0, *)) %init(iOS12);

			return;

        } else {
            dpkgInvalid = YES;

        }

    }

}