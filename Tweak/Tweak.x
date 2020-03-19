#import "Rose.h"

// Enabled And Engine Switches
BOOL enabled = NO;
BOOL enableTapticEngineSwitch = NO;
BOOL enableHapticEngineSwitch = NO;
BOOL enableLegacyEngineSwitch = NO;

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

%group Rose

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

%end

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

- (void)viewDidAppear:(BOOL)arg1 {

	fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:pathForHapticPasscode] || [fileManager fileExistsAtPath:pathForHapticKeys] || [fileManager fileExistsAtPath:pathForHapticVolume] || [fileManager fileExistsAtPath:pathForHapticker] || [fileManager fileExistsAtPath:pathForHapticLock]) {
        if (!hasSeenCompatibilityAlert) {
			if ([fileManager fileExistsAtPath:pathForRosePlist]) {
				UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Rose"
				message:@"Rose has detected that you have another haptic feedback tweak installed,\nRose will probably also have those features so you can uninstall the other tweak but still,\nfeel free to not uninstall the other tweak and to just ignore this alert\n\n[This Alert can be turned on or off manually in Rose's Preferences]"
				preferredStyle:UIAlertControllerStyleAlert];

				UIAlertAction *dontShowAgainAction = [UIAlertAction actionWithTitle:@"Don't Show Again" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {

					hasSeenCompatibilityAlert = YES;
					[pfs setBool:hasSeenCompatibilityAlert forKey:@"CompatibilityAlert"];

				}];
				UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleCancel handler:nil];
				[alert addAction:dontShowAgainAction];
				[alert addAction:cancelAction];
				[self presentViewController:alert animated:YES completion:nil];

			}

        }

    }

    if (SYSTEM_VERSION_LESS_THAN(@"13.0")) {
        if ([fileManager fileExistsAtPath:pathForRosePlist]) {
			if (!hasSeeniOSAlert) {
				UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Rose - Notice!"
				message:@"Rose has detected that you're on iOS 12.x means Soft and Rigid Mode for your haptic strength are NOT available as it's only availble on iOS 13! Please use one of the other options, enjoy 💖"
				preferredStyle:UIAlertControllerStyleAlert];

				UIAlertAction *dontShowAgainAction = [UIAlertAction actionWithTitle:@"Don't Show Again" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {

					hasSeeniOSAlert = YES;
					[pfs setBool:hasSeeniOSAlert forKey:@"iOSAlert"];

				}];

				UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Okey" style:UIAlertActionStyleCancel handler:nil];
				[alert addAction:dontShowAgainAction];
				[alert addAction:cancelAction];
				[self presentViewController:alert animated:YES completion:nil];

			}

        }

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

%hook SBMainDisplaySceneManager

- (void)_appKilledInAppSwitcher:(id)arg1 {

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

%hook SBApplication

- (void)_didExitWithContext:(id)arg1 {

	%orig;

	if (!enabled || !anywhereSectionSupportSwitch || !killingSwitch) return;
	if (!(SYSTEM_VERSION_LESS_THAN(@"13.0"))) {
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

}

%end

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

%hook SBIconController

- (void)viewWillAppear:(BOOL)arg1 {

	%orig;

	if (!enabled || !homescreenSectionSupportSwitch || !enterBackgroundSwitch) return;
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

%hook SBDashBoardLockScreenEnvironment // iOS 13

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

%hook UIWindow

- (BOOL)_shouldHitTestEntireScreen {

	if (!enabled || !anywhereSectionSupportSwitch || !touchesSwitch) return %orig;
	int customStrength = [customStrengthTouchesControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

		return YES;

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

		return YES;

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

		return YES;

	} else {
		return %orig;

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

%end // Rose group

// Spotify
%group Spotify

%hook SPTNowPlayingPlayButtonV2

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !spotifySupportSwitch || !SPTplayButtonSwitch) return;
	int customStrength = [customStrengthSPTplayButtonControl intValue];

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

%hook SPTNowPlayingPreviousTrackButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !spotifySupportSwitch || !SPTpreviousTrackButtonSwitch) return;
	int customStrength = [customStrengthSPTpreviousTrackButtonControl intValue];

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

%hook SPTNowPlayingNextTrackButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !spotifySupportSwitch || !SPTnextTrackButtonSwitch) return;
	int customStrength = [customStrengthSPTnextTrackButtonControl intValue];

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

%hook SPTNowPlayingRepeatButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !spotifySupportSwitch || !SPTrepeatButtonSwitch) return;
	int customStrength = [customStrengthSPTrepeatButtonControl intValue];

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

%hook SPTNowPlayingShuffleButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !spotifySupportSwitch || !SPTshuffleButtonSwitch) return;
	int customStrength = [customStrengthSPTshuffleButtonControl intValue];

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

%hook SPTNowPlayingQueueButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !spotifySupportSwitch || !SPTqueueButtonSwitch) return;
	int customStrength = [customStrengthSPTqueueButtonControl intValue];

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

%hook SPTNowPlayingSliderV2

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !spotifySupportSwitch || !SPTsliderSwitch) return;
	int customStrength = [customStrengthSPTsliderControl intValue];

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

%hook SPTNowPlayingFreeTierFeedbackButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !spotifySupportSwitch || !SPTfreeTierButtonSwitch) return;
	int customStrength = [customStrengthSPTfreeTierButtonControl intValue];

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

%hook SPTGaiaDevicesAvailableViewImplementation

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !spotifySupportSwitch || !SPTavailableDevicesButtonSwitch) return;
	int customStrength = [customStrengthSPTavailableDevicesButtonControl intValue];

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

%hook SPTNowPlayingMarqueeLabel

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !spotifySupportSwitch || !SPTnowPlayingLabelSwitch) return;
	int customStrength = [customStrengthSPTnowPlayingLabelControl intValue];

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

%hook SPTNowPlayingBarPlayButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !spotifySupportSwitch || !SPTplayBarButtonSwitch) return;
	int customStrength = [customStrengthSPTplayBarButtonControl intValue];

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

// Instagram
%group Instagram

%hook IGFeedPhotoView

- (void)_onDoubleTap:(id)arg1 {

	%orig;

	if (!enabled || !instagramSupportSwitch || !ITGdoubleTapToLikeSwitch) return;
	int customStrength = [customStrengthITGdoubleTapToLikeControl intValue];

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

%hook IGFeedItemVideoView

- (void)overlayViewDidDoubleTap:(id)arg1 {

	%orig;

	if (!enabled || !instagramSupportSwitch || !ITGdoubleTapToLikeSwitch) return;
	int customStrength = [customStrengthITGdoubleTapToLikeControl intValue];

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

%hook IGUFIButtonBarView

- (void)_onLikeButtonPressed:(id)arg1 {

	%orig;

	if (!enabled || !instagramSupportSwitch || !ITGlikeButtonSwitch) return;
	int customStrength = [customStrengthITGlikeButtonControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

- (void)_onCommentButtonPressed:(id)arg1 {

	%orig;

	if (!enabled || !instagramSupportSwitch || !ITGcommentButtonSwitch) return;
	int customStrength = [customStrengthITGcommentButtonControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

- (void)_onSaveButtonLongPressed:(id)arg1 {

	%orig;

	if (!enabled || !instagramSupportSwitch || !ITGsaveButtonSwitch) return;
	int customStrength = [customStrengthITGsaveButtonControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

- (void)_onSaveButtonPressed:(id)arg1 {

	%orig;

	if (!enabled || !instagramSupportSwitch || !ITGsaveButtonSwitch) return;
	int customStrength = [customStrengthITGsaveButtonControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

- (void)_onSendButtonPressed:(id)arg1 {

	%orig;

	if (!enabled || !instagramSupportSwitch || !ITGsendButtonSwitch) return;
	int customStrength = [customStrengthITGsendButtonControl intValue];

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

// TikTok
%group TikTok

%hook AWEFeedVideoButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !tiktokSupportSwitch || !TTlikeCommentShareButtonsSwitch) return;
	int customStrength = [customStrengthTTlikeCommentShareButtonsControl intValue];

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

// Twitter
%group Twitter

%hook TFNCustomTabBar

- (void)tap:(id)arg1 {

	%orig;

	if (!enabled || !twitterSupportSwitch || !TWTtabBarSwitch) return;
	int customStrength = [customStrengthTWTtabBarControl intValue];

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

%hook T1StandardStatusView

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !twitterSupportSwitch || !TWTtweetViewSwitch) return;
	int customStrength = [customStrengthTWTtweetViewControl intValue];

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

%hook T1DirectMessageInboxSummaryView

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !twitterSupportSwitch || !TWTdirectMessagesTapSwitch) return;
	int customStrength = [customStrengthTWTdirectMessagesTapControl intValue];

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

%hook T1ActivityCell

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !twitterSupportSwitch || !TWTactivityTapSwitch) return;
	int customStrength = [customStrengthTWTactivityTapControl intValue];

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

%hook TFNFloatingActionButton

- (void)_tfn_expandingButtonAction:(id)arg1 {

	%orig;

	if (!enabled || !twitterSupportSwitch || !TWTtweetButtonSwitch) return;
	int customStrength = [customStrengthTWTtweetButtonControl intValue];

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

// Safari
%group Safari

%hook _SFNavigationBarURLButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !safariSupportSwitch || !SFUrlSwitch) return;
	int customStrength = [customStrengthSFUrlControl intValue];

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

// Phone
%group Phone

%hook PHHandsetDialerNumberPadButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !phoneSupportSwitch || !PHNumberPadSwitch) return;
	int customStrength = [customStrengthPHNumberPadControl intValue];

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

%hook CNContactListTableViewCell

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !phoneSupportSwitch || !PHContactCellSwitch) return;
	int customStrength = [customStrengthPHContactCellControl intValue];

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

%hook PHHandsetDialerDeleteButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !phoneSupportSwitch || !PHDialerDeleteButtonSwitch) return;
	int customStrength = [customStrengthPHDialerDeleteButtonControl intValue];

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

%hook PHBottomBarButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !phoneSupportSwitch || !PHDialerCallButtonSwitch) return;
	int customStrength = [customStrengthPHDialerCallButtonControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (PHDialerCallButtonSwitch && customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (PHDialerCallButtonSwitch && customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

}

%end

%end

// Facebook
%group Facebook

%hook FBTabBar

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !facebookSupportSwitch || !FBTabBarSwitch) return;
	int customStrength = [customStrengthFBTabBarControl intValue];

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

%hook FDSTetraPressStateAnnouncingControl

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !facebookSupportSwitch || !FBQuickAccessButtonsSwitch) return;
	int customStrength = [customStrengthFBQuickAccessButtonsControl intValue];

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

// Music
%group Music

%hook MusicApplicationPlayButton // Play/Pause, Skip, Previous Song buttons

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !musicSupportSwitch || !MusicPlayPauseButtonsSwitch) return;
	int customStrength = [customStrengthMusicApplicationPlayButtonControl intValue];

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

%hook _TtCC16MusicApplication32NowPlayingControlsViewController12VolumeSlider // This is not a ObjC method, just badly converted to ObjC , Volume Slider

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !musicSupportSwitch || !MusicVolumeSliderSwitch) return;
	int customStrength = [customStrengthMusicApplicationVolumeSliderControl intValue];

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

%hook MusicApplicationContextualActionsButton // "..." More Actions Button

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !musicSupportSwitch || !MusicContextualActionsButtonSwitch) return;
	int customStrength = [customStrengthMusicApplicationContextualActionsButtonControl intValue];

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

%hook MusicApplicationTimeSlider // Time Slider

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !musicSupportSwitch || !MusicTimeSliderSwitch) return;
	int customStrength = [customStrengthMusicApplicationTimeSliderControl intValue];

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

%hook MusicApplicationSongCell // Song Cell

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !musicSupportSwitch || !MusicSongCellSwitch) return;
	int customStrength = [customStrengthMusicApplicationSongCellControl intValue];

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

%hook  _TtCC16MusicApplication30LibraryMenuTableViewController4Cell // Same here, badly converted to ObjC , Library selections like "Songs" or "Albums"

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !musicSupportSwitch || !MusicLibraryCellSwitch) return;
	int customStrength = [customStrengthLibraryCellControl intValue];

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

%hook MusicApplicationAlbumCell // Album Cell

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !musicSupportSwitch || !MusicAlbumCellSwitch) return;
	int customStrength = [customStrengthMusicApplicationAlbumCellControl intValue];

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

%hook MPRouteButton // Airplay Button

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !musicSupportSwitch || !MusicAirPlayButtonSwitch) return;
	NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];

	if ([bundleIdentifier isEqualToString:@"com.apple.Music"]) {
		int customStrength = [customStrengthMPRouteButtonControl intValue];

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

%hook MPButton // Live Lyrics, Queue Button

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !musicSupportSwitch || !MusicLiveLyricsQueueButtonSwitch) return;
	NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];

	if ([bundleIdentifier isEqualToString:@"com.apple.Music"]) {
		int customStrength = [customStrengthMPButtonControl intValue];

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

%end

%group Calculator

%hook CalculatorApplicationKeyPadButton // Keypad Button

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !calculatorSupportSwitch || !CalculatorKeyPadButtonSwitch) return;
	int customStrength = [customStrengthCalculatorApplicationKeyPadButtonControl intValue];

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

%group Sileo

%hook SileoSourcesCell // Sources Cell

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !sileoSupportSwitch || !SileoSourcesCellSwitch) return;
	int customStrength = [customStrengthSileoSourcesCellControl intValue];

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

%hook SileoPackageCollectionViewCell // Package Cell

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !sileoSupportSwitch || !SileoPackageCollectionViewCellSwitch) return;
	int customStrength = [customStrengthSileoPackageCollectionViewCellControl intValue];

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

%hook SileoTableViewCell // Table View Cell

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !sileoSupportSwitch || !SileoTableViewCellSwitch) return;
	int customStrength = [customStrengthSileoTableViewCellControl intValue];

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

%hook SileoFeaturedBannerView // Featured Banner View

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !sileoSupportSwitch || !SileoFeaturedBannerViewSwitch) return;
	int customStrength = [customStrengthSileoFeaturedBannerViewControl intValue];

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

%hook SileoConfirmDownloadButton // Download Confirm / ReSpring Button

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !sileoSupportSwitch || !SileoConfirmDownloadButtonSwitch) return;
	int customStrength = [customStrengthSileoConfirmDownloadButtonControl intValue];

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

%group Apollo

%hook JumpBar

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;
	
	if (!enabled || !apolloSupportSwitch || !apolloJumpBarSwitch) return;
	int customStrength = [customStrengthApolloJumpBarControl intValue];

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

%hook ApolloFloatingActionButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !apolloSupportSwitch || !apolloFloatingActionButtonSwitch) return;
	int customStrength = [customStrengthApolloFloatingActionButtonControl intValue];

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

%hook _ASDisplayView

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !apolloSupportSwitch || !apolloASDisplayViewSwitch) return;
	NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];

	if ([bundleIdentifier isEqualToString:@"com.christianselig.Apollo"]) {
		int customStrength = [customStrengthApolloASDisplayViewControl intValue];

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

%hook UIButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !apolloSupportSwitch || !apolloUIButtonSwitch) return;
	NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];

	if ([bundleIdentifier isEqualToString:@"com.christianselig.Apollo"]) {
		int customStrength = [customStrengthApolloUIButtonControl intValue];

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

    // Someone smarter than Nepeta invented this. ~~ Her Words
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
	// Switches To Enable Sections - I Do All Of This To Improve App Launch Time
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
		[pfs registerBool:&touchesSwitch default:NO forKey:@"touches"];
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

	// Spotify
	if (spotifySupportSwitch) {
		[pfs registerBool:&SPTplayButtonSwitch default:NO forKey:@"SPTplayButton"];
		[pfs registerBool:&SPTplayBarButtonSwitch default:NO forKey:@"SPTplayBarButton"];
		[pfs registerBool:&SPTpreviousTrackButtonSwitch default:NO forKey:@"SPTpreviousTrackButton"];
		[pfs registerBool:&SPTnextTrackButtonSwitch default:NO forKey:@"SPTnextTrackButton"];
		[pfs registerBool:&SPTrepeatButtonSwitch default:NO forKey:@"SPTrepeatButton"];
		[pfs registerBool:&SPTshuffleButtonSwitch default:NO forKey:@"SPTshuffleButton"];
		[pfs registerBool:&SPTqueueButtonSwitch default:NO forKey:@"SPTqueueButton"];
		[pfs registerBool:&SPTsliderSwitch default:NO forKey:@"SPTslider"];
		[pfs registerBool:&SPTfreeTierButtonSwitch default:NO forKey:@"SPTfreeTierButton"];
		[pfs registerBool:&SPTavailableDevicesButtonSwitch default:NO forKey:@"SPTavailableDevicesButton"];
		[pfs registerBool:&SPTnowPlayingLabelSwitch default:NO forKey:@"SPTnowPlayingLabel"];

	}
	// Instagram
	if (instagramSupportSwitch) {
		[pfs registerBool:&ITGlikeButtonSwitch default:NO forKey:@"ITGlikeButton"];
		[pfs registerBool:&ITGdoubleTapToLikeSwitch default:NO forKey:@"ITGdoubleTapToLike"];
		[pfs registerBool:&ITGcommentButtonSwitch default:NO forKey:@"ITGcommentButton"];
		[pfs registerBool:&ITGsaveButtonSwitch default:NO forKey:@"ITGsaveButton"];
		[pfs registerBool:&ITGsendButtonSwitch default:NO forKey:@"ITGsendButton"];

	}
	// TikTok
	if (tiktokSupportSwitch) {
		[pfs registerBool:&TTlikeCommentShareButtonsSwitch default:NO forKey:@"TTlikeCommentShareButtons"];

	}
	// Twitter
	if (twitterSupportSwitch) {
		[pfs registerBool:&TWTtabBarSwitch default:NO forKey:@"TWTtabBar"];
		[pfs registerBool:&TWTtweetViewSwitch default:NO forKey:@"TWTweetTap"];
		[pfs registerBool:&TWTdirectMessagesTapSwitch default:NO forKey:@"TWTdirectMessagesTap"];
		[pfs registerBool:&TWTactivityTapSwitch default:NO forKey:@"TWTactivityTap"];
		[pfs registerBool:&TWTtweetButtonSwitch default:NO forKey:@"TWTtweetButton"];

	}
	// Safari
	if (safariSupportSwitch) {
		[pfs registerBool:&SFUrlSwitch default:NO forKey:@"SFUrl"];

	}
	// Phone
	if (phoneSupportSwitch) {
		[pfs registerBool:&PHNumberPadSwitch default:NO forKey:@"PHNumberPad"];
		[pfs registerBool:&PHContactCellSwitch default:NO forKey:@"PHContactCell"];
		[pfs registerBool:&PHDialerDeleteButtonSwitch default:NO forKey:@"PHDialerDeleteButton"];
		[pfs registerBool:&PHDialerCallButtonSwitch default:NO forKey:@"PHDialerCallButton"];

	}
	// Facebook
	if (facebookSupportSwitch) {
		[pfs registerBool:&FBTabBarSwitch default:NO forKey:@"FBTabBar"];
		[pfs registerBool:&FBQuickAccessButtonsSwitch default:NO forKey:@"QuickAccessButtons"];
		[pfs registerBool:&FBNavigationBarButtonSwitch default:NO forKey:@"FBNavigationBarButton"];

	}
	// Music
	if (musicSupportSwitch) {
		[pfs registerBool:&MusicPlayPauseButtonsSwitch default:NO forKey:@"MusicPlayPauseButtons"];
		[pfs registerBool:&MusicVolumeSliderSwitch default:NO forKey:@"MusicVolumeSlider"];
		[pfs registerBool:&MusicContextualActionsButtonSwitch default:NO forKey:@"MusicContextualActionsButton"];
		[pfs registerBool:&MusicTimeSliderSwitch default:NO forKey:@"MusicTimeSlider"];
		[pfs registerBool:&MusicSongCellSwitch default:NO forKey:@"MusicSongCell"];
		[pfs registerBool:&MusicLibraryCellSwitch default:NO forKey:@"MusicLibraryCell"];
		[pfs registerBool:&MusicAlbumCellSwitch default:NO forKey:@"MusicAlbumCell"];
		[pfs registerBool:&MusicAirPlayButtonSwitch default:NO forKey:@"MusicAirPlayButton"];
		[pfs registerBool:&MusicLiveLyricsQueueButtonSwitch default:NO forKey:@"MusicLiveLyricsQueueButton"];

	}
	// Calculator
	if (calculatorSupportSwitch) {
		[pfs registerBool:&CalculatorKeyPadButtonSwitch default:NO forKey:@"CalculatorKeyPadButton"];

	}
	// Sileo
	if (sileoSupportSwitch) {
		[pfs registerBool:&SileoSourcesCellSwitch default:NO forKey:@"SileoSourcesCell"];
		[pfs registerBool:&SileoPackageCollectionViewCellSwitch default:NO forKey:@"SileoPackageCollectionViewCell"];
		[pfs registerBool:&SileoTableViewCellSwitch default:NO forKey:@"SileoTableViewCell"];
		[pfs registerBool:&SileoFeaturedBannerViewSwitch default:NO forKey:@"SileoFeaturedBannerView"];
		[pfs registerBool:&SileoConfirmDownloadButtonSwitch default:NO forKey:@"SileoConfirmDownloadButton"];

	}
	// Apollo
	if (apolloSupportSwitch) {
		[pfs registerBool:&apolloJumpBarSwitch default:NO forKey:@"apolloJumpBar"];
		[pfs registerBool:&apolloFloatingActionButtonSwitch default:NO forKey:@"ApolloFloatingActionButton"];
		[pfs registerBool:&apolloASDisplayViewSwitch default:NO forKey:@"apolloASDisplayView"];
		[pfs registerBool:&apolloUIButtonSwitch default:NO forKey:@"apolloUIButton"];

	}
	// Warnings
	[pfs registerBool:&hasSeenCompatibilityAlert default:NO forKey:@"CompatibilityAlert"];
	[pfs registerBool:&hasSeeniOSAlert default:NO forKey:@"iOSAlert"];
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
		[pfs registerObject:&customStrengthTouchesControl default:@"0" forKey:@"customStrengthTouches"];
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

	}

	if (spotifySupportSwitch) {
		[pfs registerObject:&customStrengthSPTplayButtonControl default:@"0" forKey:@"customStrengthSPTplayButton"];
		[pfs registerObject:&customStrengthSPTplayBarButtonControl default:@"0" forKey:@"customStrengthSPTplayBarButton"];
		[pfs registerObject:&customStrengthSPTpreviousTrackButtonControl default:@"0" forKey:@"customStrengthSPTpreviousTrackButton"];
		[pfs registerObject:&customStrengthSPTnextTrackButtonControl default:@"0" forKey:@"customStrengthSPTnextTrackButton"];
		[pfs registerObject:&customStrengthSPTrepeatButtonControl default:@"0" forKey:@"customStrengthSPTrepeatButton"];
		[pfs registerObject:&customStrengthSPTshuffleButtonControl default:@"0" forKey:@"customStrengthSPTshuffleButton"];
		[pfs registerObject:&customStrengthSPTqueueButtonControl default:@"0" forKey:@"customStrengthSPTqueueButton"];
		[pfs registerObject:&customStrengthSPTsliderControl default:@"0" forKey:@"customStrengthSPTslider"];
		[pfs registerObject:&customStrengthSPTfreeTierButtonControl default:@"0" forKey:@"customStrengthSPTfreeTierButton"];
		[pfs registerObject:&customStrengthSPTavailableDevicesButtonControl default:@"0" forKey:@"customStrengthSPTavailableDevicesButton"];
		[pfs registerObject:&customStrengthSPTnowPlayingLabelControl default:@"0" forKey:@"customStrengthSPTnowPlayingLabel"];

	}

	if (instagramSupportSwitch) {
		[pfs registerObject:&customStrengthITGlikeButtonControl default:@"0" forKey:@"customStrengthITGlikeButton"];
		[pfs registerObject:&customStrengthITGdoubleTapToLikeControl default:@"0" forKey:@"customStrengthITGdoubleTapToLike"];
		[pfs registerObject:&customStrengthITGcommentButtonControl default:@"0" forKey:@"customStrengthITGcommentButton"];
		[pfs registerObject:&customStrengthITGsaveButtonControl default:@"0" forKey:@"customStrengthITGsaveButton"];
		[pfs registerObject:&customStrengthITGsendButtonControl default:@"0" forKey:@"customStrengthITGsendButton"];

	}

	if (tiktokSupportSwitch) {
		[pfs registerObject:&customStrengthTTlikeCommentShareButtonsControl default:@"0" forKey:@"customStrengthTTlikeCommentShareButtons"];

	}

	if (twitterSupportSwitch) {
		[pfs registerObject:&customStrengthTWTtabBarControl default:@"0" forKey:@"customStrengthTWTtabBar"];
		[pfs registerObject:&customStrengthTWTtweetViewControl default:@"0" forKey:@"customStrengthTWTtweetView"];
		[pfs registerObject:&customStrengthTWTdirectMessagesTapControl default:@"0" forKey:@"customStrengthTWTdirectMessagesTap"];
		[pfs registerObject:&customStrengthTWTactivityTapControl default:@"0" forKey:@"customStrengthTWTactivityTap"];
		[pfs registerObject:&customStrengthTWTtweetButtonControl default:@"0" forKey:@"customStrengthTWTtweetButton"];

	}

	if (safariSupportSwitch) {
		[pfs registerObject:&customStrengthSFUrlControl default:@"0" forKey:@"customStrengthSFUrl"];

	}

	if (phoneSupportSwitch) {
		[pfs registerObject:&customStrengthPHNumberPadControl default:@"0" forKey:@"customStrengthPHNumberPad"];
		[pfs registerObject:&customStrengthPHContactCellControl default:@"0" forKey:@"customStrengthPHContactCell"];
		[pfs registerObject:&customStrengthPHDialerDeleteButtonControl default:@"0" forKey:@"customStrengthPHDialerDeleteButton"];
		[pfs registerObject:&customStrengthWakeControl default:@"0" forKey:@"customStrengthPHDialerCallButton"];

	}

	if (facebookSupportSwitch) {
		[pfs registerObject:&customStrengthFBTabBarControl default:@"0" forKey:@"customStrengthFBTabBar"];
		[pfs registerObject:&customStrengthFBQuickAccessButtonsControl default:@"0" forKey:@"customStrengthQuickAccessButtons"];
		[pfs registerObject:&customStrengthFBNavigationBarButtonControl default:@"0" forKey:@"customStrengthFBNavigationBarButton"];

	}

	if (musicSupportSwitch) {
		[pfs registerObject:&customStrengthMusicApplicationPlayButtonControl default:@"0" forKey:@"customStrengthMusicApplicationPlayButton"];
		[pfs registerObject:&customStrengthMusicApplicationVolumeSliderControl default:@"0" forKey:@"customStrengthMusicApplicationVolumeSlider"];
		[pfs registerObject:&customStrengthMusicApplicationContextualActionsButtonControl default:@"0" forKey:@"customStrengthMusicApplicationContextualActionsButton"];
		[pfs registerObject:&customStrengthMusicApplicationTimeSliderControl default:@"0" forKey:@"customStrengthMusicApplicationTimeSlider"];
		[pfs registerObject:&customStrengthMusicApplicationSongCellControl default:@"0" forKey:@"customStrengthMusicApplicationSongCell"];
		[pfs registerObject:&customStrengthLibraryCellControl default:@"0" forKey:@"customStrengthLibraryCell"];
		[pfs registerObject:&customStrengthMusicApplicationAlbumCellControl default:@"0" forKey:@"customStrengthMusicApplicationAlbumCell"];
		[pfs registerObject:&customStrengthMPRouteButtonControl default:@"0" forKey:@"customStrengthMPRouteButton"];
		[pfs registerObject:&customStrengthMPButtonControl default:@"0" forKey:@"customStrengthMPButton"];

	}

	if (calculatorSupportSwitch) {
		[pfs registerObject:&customStrengthCalculatorApplicationKeyPadButtonControl default:@"0" forKey:@"customStrengthCalculatorApplicationKeyPadButton"];

	}

	if (sileoSupportSwitch) {
		[pfs registerObject:&customStrengthSileoSourcesCellControl default:@"0" forKey:@"customStrengthSileoSourcesCell"];
		[pfs registerObject:&customStrengthSileoPackageCollectionViewCellControl default:@"0" forKey:@"customStrengthSileoPackageCollectionViewCell"];
		[pfs registerObject:&customStrengthSileoTableViewCellControl default:@"0" forKey:@"customStrengthSileoTableViewCell"];
		[pfs registerObject:&customStrengthSileoFeaturedBannerViewControl default:@"0" forKey:@"customStrengthSileoFeaturedBannerView"];
		[pfs registerObject:&customStrengthSileoConfirmDownloadButtonControl default:@"0" forKey:@"customStrengthSileoConfirmDownloadButton"];

	}

	if (apolloSupportSwitch) {
		[pfs registerObject:&customStrengthApolloJumpBarControl default:@"0" forKey:@"customStrengthApolloJumpBar"];
		[pfs registerObject:&customStrengthApolloFloatingActionButtonControl default:@"0" forKey:@"customStrengthApolloFloatingActionButton"];
		[pfs registerObject:&customStrengthApolloASDisplayViewControl default:@"0" forKey:@"customStrengthApolloASDisplayView"];
		[pfs registerObject:&customStrengthApolloUIButtonControl default:@"0" forKey:@"customStrengthApolloUIButton"];

	}

	if (!dpkgInvalid && enabled) {
        BOOL ok = false;
        
        ok = ([[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithFormat:@"/var/lib/dpkg/info/%@%@%@%@%@%@%@%@%@.rose.md5sums", @"s", @"h", @".", @"l", @"i", @"t", @"t", @"e", @"n"]]
        );

        if (ok && [@"litten" isEqualToString:@"litten"]) {
            %init(Rose);
			
			if (apolloSupportSwitch)
				%init(Apollo, JumpBar=objc_getClass("Apollo.JumpBar"), ApolloFloatingActionButton=objc_getClass("Apollo.FloatingActionButton"));
			
			if (calculatorSupportSwitch)
				%init(Calculator, CalculatorApplicationKeyPadButton=objc_getClass("Calculator.CalculatorKeypadButton"));
			
			if (facebookSupportSwitch)
				%init(Facebook);

			if (instagramSupportSwitch)
				%init(Instagram);

			if (musicSupportSwitch)
				%init(Music, MusicApplicationPlayButton=objc_getClass("MusicApplication.NowPlayingTransportButton"), MusicApplicationContextualActionsButton=objc_getClass("MusicApplication.ContextualActionsButton"), MusicApplicationTimeSlider=objc_getClass("MusicApplication.PlayerTimeControl"), MusicApplicationSongCell=objc_getClass("MusicApplication.SongCell"), MusicApplicationAlbumCell=objc_getClass("MusicApplication.AlbumCell"));
            
			if (phoneSupportSwitch) 
				%init(Phone);

			if (safariSupportSwitch)
				%init(Safari);

			if (sileoSupportSwitch)
				%init(Sileo, SileoSourcesCell=objc_getClass("Sileo.SourcesTableViewCell"), SileoPackageCollectionViewCell=objc_getClass("Sileo.PackageCollectionViewCell"), SileoTableViewCell=objc_getClass("Sileo.SileoTableViewCell"), SileoFeaturedBannerView=objc_getClass("Sileo.FeaturedBannerView"), SileoConfirmDownloadButton=objc_getClass("Sileo.DownloadConfirmButton"));

			if (spotifySupportSwitch)
				%init(Spotify);

			if (tiktokSupportSwitch)
				%init(TikTok);

			if (twitterSupportSwitch)
				%init(Twitter);

			return;

        } else {
            dpkgInvalid = YES;

        }

    }

}