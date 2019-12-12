#import "../RoseCommon.h"
#import "Rose.h"
	
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

if (LowPowerModeSwitch && LowPowerMode == YES) {}
	else if (enabled && delaySwitch) {
		int delay = [delayLevel intValue];
		dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC);
		dispatch_after(popTime, dispatch_get_main_queue(), ^(void){

			prepareForHaptic();

		});

	} else if (enabled && !(delaySwitch)) {
		prepareForHaptic();
		
	}

}

	// Rose custom haptis controller
void prepareCustomFeedback() {

	switch(customFeedbackValue) {
	case 1:
		AudioServicesPlaySystemSound(1519);
		break;
	case 2:
		AudioServicesPlaySystemSound(1520);
		break;
	case 3:
		AudioServicesPlaySystemSound(1521);
		break;
	case 4:
		[gen prepare];
		gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
		[gen impactOccurred];
		break;
	case 5:
		[gen prepare];
		gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
		[gen impactOccurred];
		break;
	case 6:
		[gen prepare];
		gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy];
		[gen impactOccurred];
		break;
	case 7:
		[gen prepare];
		gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleSoft];
		[gen impactOccurred];
		break;
	case 8:
		[gen prepare];
		gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleRigid];
		[gen impactOccurred];
		break;
	default:
		break;
	}

}

	// Rose custom haptics trigger
void triggerCustomFeedback() {

	if (LowPowerModeSwitch && LowPowerMode == YES) {}
	else if (enabled && delaySwitch) {
		int delay = [delayLevel intValue];
		dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC);
		dispatch_after(popTime, dispatch_get_main_queue(), ^(void){

			prepareCustomFeedback();

		});

	} else if (enabled && !(delaySwitch)) {
		prepareCustomFeedback();
		
	}

}

%group Rose

%hook SpringBoard

- (void)applicationDidFinishLaunching:(id)arg1 {

	%orig;

	int customStrength = [customStrengthRespringControl intValue];

	if (respringSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (respringSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

- (void)_ringerChanged:(id)arg1 {

	%orig;

	int customStrength = [customStrengthRingerControl intValue];

	if (ringerSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (ringerSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

- (BOOL)_handlePhysicalButtonEvent:(UIPressesEvent *)arg1 {

	// type = 101 -> Home button
	// force = 0 -> button released
	// force = 1 -> button pressed

	//int type = arg1.allPresses.allObjects[0].type;
	int force = arg1.allPresses.allObjects[0].force;
	int customStrength = [customStrengthHomeButtonControl intValue];

	if (force == 1) {
		if (homeButtonSwitch && customStrength == 0) {
			triggerFeedback();

		} else if (homeButtonSwitch && customStrength != 0) {
			customFeedbackValue = customStrength;
			triggerCustomFeedback();

		}

	}

	return %orig;

}

%end

%hook SBCoverSheetPrimarySlidingViewController

- (void)viewWillDisappear:(BOOL)arg1 {

	%orig;

	int customStrength = [customStrengthUnlockControl intValue];

	if (unlockSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (unlockSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

- (void)viewDidDisappear:(BOOL)arg1 {

    %orig; //  Thanks to Nepeta for the DRM
    if (!dpkgInvalid) return;
		UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Rose"
		message:@"Seriously? Pirating a free Tweak is awful!\nPiracy repo's Tweaks could contain Malware if you didn't know that, so go ahead and get Rose from the official Source https://repo.shymemoriees.me/.\nIf you're seeing this but you got it from the official source then make sure to add https://repo.shymemoriees.me to Cydia or Sileo."
		preferredStyle:UIAlertControllerStyleAlert];

		UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Aww man" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {

			UIApplication *application = [UIApplication sharedApplication];
			[application openURL:[NSURL URLWithString:@"https://repo.shymemoriees.me/"] options:@{} completionHandler:nil];

	}];

		[alertController addAction:cancelAction];

		[self presentViewController:alertController animated:YES completion:nil];

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

	%orig;

	int customStrength = [customStrengthLockControl intValue];

	if (lockSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (lockSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

- (BOOL)consumeInitialPressDown {

	int customStrength = [customStrengthSleepButtonControl intValue];

	if (sleepButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (sleepButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

	return %orig;

}

%end

%hook VolumeControl

- (void)increaseVolume {

	%orig;

	int customStrength = [customStrengthVolumeControl intValue];

	if (volumeSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (volumeSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

- (void)decreaseVolume {

	%orig;

	int customStrength = [customStrengthVolumeControl intValue];

	if (volumeSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (volumeSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook SBVolumeControl

- (void)increaseVolume {

	%orig;

	int customStrength = [customStrengthVolumeControl intValue];

	if (volumeSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (volumeSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

- (void)decreaseVolume {

	%orig;

	int customStrength = [customStrengthVolumeControl intValue];

	if (volumeSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (volumeSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook SBPowerDownController

- (void)orderFront {

	%orig;

	int customStrength = [customStrengthPowerDownControl intValue];

	if (powerSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (powerSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook SBPowerDownViewController

- (void)viewWillAppear:(BOOL)arg1 {

	%orig;

	int customStrength = [customStrengthPowerDownControl intValue];

	if (powerSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (powerSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook SBMainDisplaySceneManager

- (void)_appKilledInAppSwitcher:(id)arg1 {

	%orig;

	int customStrength = [customStrengthKillingControl intValue];

	if (killingSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (killingSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook SBUIIconForceTouchController

- (void)iconForceTouchViewControllerWillDismiss:(id)arg1 {

	%orig;

	int customStrength = [customStrengthForceTouchControl intValue];

	if (forceSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (forceSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook SBUIController

- (void)ACPowerChanged {

	%orig;

	int customStrength = [customStrengthPluggedControl intValue];

	if (pluggedSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (pluggedSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

- (void)handleWillBeginReachabilityAnimation {

	%orig;

	int customStrength = [customStrengthReachabilityControl intValue];

	if (reachabilitySwitch && customStrength == 0) {
		triggerFeedback();

	} else if (reachabilitySwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook SBAppSwitcherPageView

- (void)setVisible:(BOOL)arg1 {

	%orig;

	int customStrength = [customStrengthSwitcherControl intValue];

	if (switcherSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (switcherSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook SiriUISiriStatusView

- (void)layoutSubviews {

	%orig;

	int customStrength = [customStrengthSiriControl intValue];

	if (siriSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (siriSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook CCUILabeledRoundButton

- (void)buttonTapped:(id)arg1 {

	%orig;

	int customStrength = [customStrengthCCToggleControl intValue];

	if (ccToggleSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (ccToggleSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook SBFolderController

- (void)prepareToOpen {

	%orig;

	int customStrength = [customStrengthFolderControl intValue];

	if (folderSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (folderSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook SBIconController

- (void)viewDidAppear:(BOOL)animated {

	%orig;

	if (enabled && touchesSwitch && featureWarningSwitch) {
		UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Rose"
		message:@"Please consider to not using the 'feedback on every touch' feature too often, because it could harm your Haptic/Taptic Engine with very long usage. It's not my fault if something happens.\n[This alert can be turned off in Rose's settings]"
		preferredStyle:UIAlertControllerStyleAlert];

		UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Understood" style:UIAlertActionStyleCancel handler:nil];

		[alert addAction:cancelAction];

		[self presentViewController:alert animated:YES completion:nil];

	}

}

- (void)iconTapped:(id)arg1 {

	%orig;

	int customStrength = [customStrengthIconTapControl intValue];

	if (iconTapSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (iconTapSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook SBHIconManager

- (void)iconTapped:(id)arg1 {

	%orig;

	int customStrength = [customStrengthIconTapControl intValue];

	if (iconTapSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (iconTapSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook SBFolderView

- (void)scrollViewWillBeginDragging:(id)arg1 {

	%orig;

	int customStrength = [customStrengthPageSwipeControl intValue];

	if (pageSwipeSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (pageSwipeSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook SSScreenCapturer

+ (void)playScreenshotSound {

	%orig;

	int customStrength = [customStrengthScreenshotControl intValue];

	if (screenshotSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (screenshotSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook SBUIPasscodeLockViewBase 

- (void)_sendDelegateKeypadKeyDown {

	%orig;

	int customStrength = [customStrengthPasscodeControl intValue];

	if (passcodeSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (passcodeSwitch &&  customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end	

%hook UIKeyboardLayoutStar

- (void)playKeyClickSoundOnDownForKey:(UIKBTree *)key {

	%orig;

	int customStrength = [customStrengthKeyboardControl intValue];

	if (keyboardSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (keyboardSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

- (void)setPlayKeyClickSoundOn:(int)arg1 {

	if (enabled && keyboardSwitch) {
	            UIKBTree *delKey = [%c(UIKBTree) key];
				NSString *myDelKeyString = [delKey name];

		 if ([myDelKeyString isEqualToString:@"Delete-Key"]) {
            
		
      } else {
		  %orig;

	}
} else {
	%orig;

}

}

%end

%hook UICalloutBar

- (void)buttonPressed:(id)arg1 {

	%orig;

	int customStrength = [customStrengthTextSelectionControl intValue];

	if (textSelectionSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (textSelectionSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook SBSearchScrollView

- (BOOL)gestureRecognizerShouldBegin:(id)arg1 {

	int customStrength = [customStrengthSpotlightControl intValue];

	if (spotlightSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (spotlightSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

	return %orig;

}

%end

%hook ICSApplicationDelegate

- (void)audioCallStatusChanged:(id)arg1 {

	%orig;

	int customStrength = [customStrengthCallControl intValue];

	if (callSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (callSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook SBDashBoardViewController

- (void)setAuthenticated:(BOOL)authenticated {

    %orig;

    if (authenticated) {

	%orig;

		int customStrength = [customStrengthAuthenticationControl intValue];

		if (authenticationSwitch && customStrength == 0) {
			triggerFeedback();

		} else if (authenticationSwitch && customStrength != 0) {
			customFeedbackValue = customStrength;
			triggerCustomFeedback();

		}

	}

}

%end

%hook SBDashBoardMesaUnlockBehavior

- (void)setAuthenticated:(BOOL)arg1 {

	%orig;

    if (arg1) {

		int customStrength = [customStrengthAuthenticationControl intValue];

		if (authenticationSwitch && customStrength == 0) {
			triggerFeedback();

		} else if (authenticationSwitch && customStrength != 0) {
			customFeedbackValue = customStrength;
			triggerCustomFeedback();

		}

	}

}

%end

%hook SBBacklightController

- (void)turnOnScreenFullyWithBacklightSource:(long long)source {

	%orig;
	// 26 - source of screenshots on newer ios version (afaik); eg this method gets called with source == 26 if u make a screenshot
	if (source != 26) {
		int customStrength = [customStrengthWakeControl intValue];

		if (wakeSwitch && customStrength == 0) {
			triggerFeedback();

		} else if (wakeSwitch && customStrength != 0) {
			customFeedbackValue = customStrength;
			triggerCustomFeedback();

		}

	}
}

%end

%hook UIWindow

- (BOOL)_shouldHitTestEntireScreen {

	int customStrength = [customStrengthTouchesControl intValue];

	if (touchesSwitch && customStrength == 0) {
		triggerFeedback();

		return YES;

	} else if (touchesSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

		return YES;

	} else {
		return %orig;

	}

}

%end

%hook SBControlCenterController

- (void)_willPresent {

	%orig;

	int customStrength = [customStrengthOpenControlCenterControl intValue];

	if (openControlCenterSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (openControlCenterSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook CCUIToggleViewController

- (void)buttonTapped:(id)arg1 forEvent:(id)arg2 {

	%orig;

	int customStrength = [customStrengthCCModuleControl intValue];

	if (ccModuleSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (ccModuleSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end
// iOS System Wide Hooks
%hook UIButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	int customStrength = [customStrengthuiButtonControl intValue];

	if (uiButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (uiButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook UIView

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	int customStrength = [customStrengthuiViewControl intValue];

	if (uiViewSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (uiViewSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook _UIButtonBarButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	int customStrength = [customStrengthuiButtonBarButtonControl intValue];

	if (UIButtonBarButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (UIButtonBarButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook UIImageView

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	int customStrength = [customStrengthuiImageViewControl intValue];

	if (uiImageViewSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (uiImageViewSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook MTMaterialView

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	int customStrength = [customStrengthmtMaterialViewControl intValue];

	if (mtMaterialViewSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (mtMaterialViewSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook UIStackView

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	int customStrength = [customStrengthuiStackViewControl intValue];

	if (uiStackViewSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (uiStackViewSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook UILabel

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	int customStrength = [customStrengthuiLabelControl intValue];

	if (uiLabelSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (uiLabelSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook UIVisualEffectView

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	int customStrength = [customStrengthuiVisualEffectViewControl intValue];

	if (uiVisualEffectViewSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (uiVisualEffectViewSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end
// Spotify
%hook SPTNowPlayingPlayButtonV2

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	int customStrength = [customStrengthSPTplayButtonControl intValue];

	if (SPTplayButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (SPTplayButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook SPTNowPlayingPreviousTrackButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	int customStrength = [customStrengthSPTpreviousTrackButtonControl intValue];

	if (SPTpreviousTrackButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (SPTpreviousTrackButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook SPTNowPlayingNextTrackButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	int customStrength = [customStrengthSPTnextTrackButtonControl intValue];

	if (SPTnextTrackButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (SPTnextTrackButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook SPTNowPlayingRepeatButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	int customStrength = [customStrengthSPTrepeatButtonControl intValue];

	if (SPTrepeatButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (SPTrepeatButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook SPTNowPlayingShuffleButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	int customStrength = [customStrengthSPTshuffleButtonControl intValue];

	if (SPTshuffleButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (SPTshuffleButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook SPTNowPlayingQueueButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	int customStrength = [customStrengthSPTqueueButtonControl intValue];

	if (SPTqueueButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (SPTqueueButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook SPTNowPlayingSliderV2

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	int customStrength = [customStrengthSPTsliderControl intValue];

	if (SPTsliderSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (SPTsliderSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook SPTNowPlayingFreeTierFeedbackButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	int customStrength = [customStrengthSPTfreeTierButtonControl intValue];

	if (SPTfreeTierButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (SPTfreeTierButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook SPTGaiaDevicesAvailableViewImplementation

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	int customStrength = [customStrengthSPTavailableDevicesButtonControl intValue];

	if (SPTavailableDevicesButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (SPTavailableDevicesButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook SPTNowPlayingMarqueeLabel

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	int customStrength = [customStrengthSPTnowPlayingLabelControl intValue];

	if (SPTnowPlayingLabelSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (SPTnowPlayingLabelSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end
// Instagram
%hook IGUFIButtonBarView

- (void)_onLikeButtonPressed:(id)arg1 {

	%orig;

	int customStrength = [customStrengthITGlikeButtonControl intValue];

	if (ITGlikeButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (ITGlikeButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

- (void)_onCommentButtonPressed:(id)arg1 {

	%orig;

	int customStrength = [customStrengthITGcommentButtonControl intValue];

	if (ITGcommentButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (ITGcommentButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

- (void)_onSaveButtonLongPressed:(id)arg1 {

	%orig;

	int customStrength = [customStrengthITGsaveButtonControl intValue];

	if (ITGsaveButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (ITGsaveButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

- (void)_onSaveButtonPressed:(id)arg1 {

	%orig;

	int customStrength = [customStrengthITGsaveButtonControl intValue];

	if (ITGsaveButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (ITGsaveButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

- (void)_onSendButtonPressed:(id)arg1 {

	%orig;

	int customStrength = [customStrengthITGsendButtonControl intValue];

	if (ITGsendButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (ITGsendButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}
	
}

%end
// TikTok
%hook AWEFeedVideoButton

-(void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	int customStrength = [customStrengthTTlikeCommentShareButtonsControl intValue];

	if (TTlikeCommentShareButtonsSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (TTlikeCommentShareButtonsSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end
// Twitter
%hook TFNCustomTabBar

- (void)tap:(id)arg1 {

	%orig;

	int customStrength = [customStrengthTWTtabBarControl intValue];

	if (TWTtabBarSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (TWTtabBarSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook T1StandardStatusView

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	int customStrength = [customStrengthTWTtweetViewControl intValue];

	if (TWTtweetViewSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (TWTtweetViewSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook T1DirectMessageInboxSummaryView

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	int customStrength = [customStrengthTWTdirectMessagesTapControl intValue];

	if (TWTdirectMessagesTapSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (TWTdirectMessagesTapSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook T1ActivityCell

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	int customStrength = [customStrengthTWTactivityTapControl intValue];

	if (TWTactivityTapSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (TWTactivityTapSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook TFNFloatingActionButton

- (void)_tfn_expandingButtonAction:(id)arg1 {

	%orig;

	int customStrength = [customStrengthTWTtweetButtonControl intValue];

	if (TWTtweetButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (TWTtweetButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end
// Safari
%hook _SFNavigationBarURLButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	int customStrength = [customStrengthSFUrlControl intValue];

	if (SFUrlSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (SFUrlSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end
// Phone
%hook PHHandsetDialerNumberPadButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	int customStrength = [customStrengthPHNumberPadControl intValue];

	if (PHNumberPadSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (PHNumberPadSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook CNContactListTableViewCell

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	int customStrength = [customStrengthPHContactCellControl intValue];

	if (PHContactCellSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (PHContactCellSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook PHHandsetDialerDeleteButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	int customStrength = [customStrengthPHDialerDeleteButtonControl intValue];

	if (PHDialerDeleteButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (PHDialerDeleteButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook PHBottomBarButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	int customStrength = [customStrengthPHDialerCallButtonControl intValue];

	if (PHDialerCallButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (PHDialerCallButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end
// Facebook
%hook FBTabBar

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	int customStrength = [customStrengthFBTabBarControl intValue];

	if (FBTabBarSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (FBTabBarSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook FDSTetraPressStateAnnouncingControl

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	int customStrength = [customStrengthFBQuickAccessButtonsControl intValue];

	if (FBQuickAccessButtonsSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (FBQuickAccessButtonsSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook FBNavigationBarButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	int customStrength = [customStrengthFBNavigationBarButtonControl intValue];

	if (FBNavigationBarButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (FBNavigationBarButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

%end

%hook NSProcessInfo

-(BOOL)isLowPowerModeEnabled {

	LowPowerMode = %orig;

	return %orig;

}

%end

%end // Rose group
 
%ctor {

	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)triggerFeedback, (CFStringRef)RoseTriggerActivator, NULL, kNilOptions);

}
	// Thanks to Nepeta for the DRM
%ctor {

	if (![NSProcessInfo processInfo]) return;
    NSString *processName = [NSProcessInfo processInfo].processName;
    bool isSpringboard = [@"SpringBoard" isEqualToString:processName];

    // Someone smarter than Nepeta invented this.
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

    dpkgInvalid = ![[NSFileManager defaultManager] fileExistsAtPath:@"/var/lib/dpkg/info/me.shymemoriees.rose.list"];

    if (!dpkgInvalid) dpkgInvalid = ![[NSFileManager defaultManager] fileExistsAtPath:@"/var/lib/dpkg/info/me.shymemoriees.rose.md5sums"];

    pfs = [[HBPreferences alloc] initWithIdentifier:@"me.shymemoriees.rosepreferences"];
	// Option Switches
    [pfs registerBool:&enabled default:YES forKey:@"Enabled"];
	[pfs registerBool:&enableHapticEngineSwitch default:NO forKey:@"enableHapticEngine"];
	[pfs registerBool:&enableTapticEngineSwitch default:NO forKey:@"enableTapticEngine"];
    [pfs registerBool:&respringSwitch default:NO forKey:@"ReSpringSwitch"];
    [pfs registerBool:&unlockSwitch default:NO forKey:@"UnlockSwitch"];
    [pfs registerBool:&lockSwitch default:NO forKey:@"LockSwitch"];
    [pfs registerBool:&wakeSwitch default:NO forKey:@"displayWake"];
    [pfs registerBool:&volumeSwitch default:NO forKey:@"VolumeChangedSwitch"];
    [pfs registerBool:&powerSwitch default:NO forKey:@"PowerDownViewSwitch"];
    [pfs registerBool:&killingSwitch default:NO forKey:@"KillingAppSwitch"];
    [pfs registerBool:&forceSwitch default:NO forKey:@"ForceTouchDismiss"];
    [pfs registerBool:&pluggedSwitch default:NO forKey:@"ChargerPluggedInOrOut"];
    [pfs registerBool:&switcherSwitch default:NO forKey:@"AppSwitcherFeedback"];
    [pfs registerBool:&siriSwitch default:NO forKey:@"SiriUIFeedback"];
	[pfs registerBool:&ccToggleSwitch default:NO forKey:@"ControlCenterToggleFeedback"];
	[pfs registerBool:&folderSwitch default:NO forKey:@"FolderFeedback"];
	[pfs registerBool:&iconTapSwitch default:NO forKey:@"iconTap"];
	[pfs registerBool:&pageSwipeSwitch default:NO forKey:@"pageSwipe"];
	[pfs registerBool:&screenshotSwitch default:NO forKey:@"takeScreenshot"];
	[pfs registerBool:&passcodeSwitch default:NO forKey:@"enterPasscode"];
	[pfs registerBool:&keyboardSwitch default:NO forKey:@"usingKeyboard"];
	[pfs registerBool:&ringerSwitch default:NO forKey:@"unmuting"];
	[pfs registerBool:&reachabilitySwitch default:NO forKey:@"reachability"];
	[pfs registerBool:&textSelectionSwitch default:NO forKey:@"textSelection"];
	[pfs registerBool:&spotlightSwitch default:NO forKey:@"spotlight"];
	[pfs registerBool:&callSwitch default:NO forKey:@"call"];
	[pfs registerBool:&authenticationSwitch default:NO forKey:@"authentication"];
	[pfs registerBool:&sleepButtonSwitch default:NO forKey:@"sleepButton"];
	[pfs registerBool:&homeButtonSwitch default:NO forKey:@"homeButton"];
	[pfs registerBool:&touchesSwitch default:NO forKey:@"touches"];
	[pfs registerBool:&openControlCenterSwitch default:NO forKey:@"openControlCenter"];
	[pfs registerBool:&ccModuleSwitch default:NO forKey:@"ccModule"];
	// iOS System Wide Hooks
	[pfs registerBool:&uiButtonSwitch default:NO forKey:@"uiButton"];
	[pfs registerBool:&uiViewSwitch default:NO forKey:@"uiView"];
	[pfs registerBool:&UIButtonBarButtonSwitch default:NO forKey:@"UIButtonBarButton"];
	[pfs registerBool:&uiImageViewSwitch default:NO forKey:@"uiImageView"];
	[pfs registerBool:&mtMaterialViewSwitch default:NO forKey:@"mtMaterialView"];
	[pfs registerBool:&uiStackViewSwitch default:NO forKey:@"uiStackView"];
	[pfs registerBool:&uiLabelSwitch default:NO forKey:@"uiLabel"];
	[pfs registerBool:&uiVisualEffectViewSwitch default:NO forKey:@"uiVisualEffectView"];
	// Spotify
	[pfs registerBool:&SPTplayButtonSwitch default:NO forKey:@"SPTplayButton"];
	[pfs registerBool:&SPTpreviousTrackButtonSwitch default:NO forKey:@"SPTpreviousTrackButton"];
	[pfs registerBool:&SPTnextTrackButtonSwitch default:NO forKey:@"SPTnextTrackButton"];
	[pfs registerBool:&SPTrepeatButtonSwitch default:NO forKey:@"SPTrepeatButton"];
	[pfs registerBool:&SPTshuffleButtonSwitch default:NO forKey:@"SPTshuffleButton"];
	[pfs registerBool:&SPTqueueButtonSwitch default:NO forKey:@"SPTqueueButton"];
	[pfs registerBool:&SPTsliderSwitch default:NO forKey:@"SPTslider"];
	[pfs registerBool:&SPTfreeTierButtonSwitch default:NO forKey:@"SPTfreeTierButton"];
	[pfs registerBool:&SPTavailableDevicesButtonSwitch default:NO forKey:@"SPTavailableDevicesButton"];
	[pfs registerBool:&SPTnowPlayingLabelSwitch default:NO forKey:@"SPTnowPlayingLabel"];
	// Instagram
	[pfs registerBool:&ITGlikeButtonSwitch default:NO forKey:@"ITGlikeButton"];
	[pfs registerBool:&ITGcommentButtonSwitch default:NO forKey:@"ITGcommentButton"];
	[pfs registerBool:&ITGsaveButtonSwitch default:NO forKey:@"ITGsaveButton"];
	[pfs registerBool:&ITGsendButtonSwitch default:NO forKey:@"ITGsendButton"];
	// TikTok
	[pfs registerBool:&TTlikeCommentShareButtonsSwitch default:NO forKey:@"TTlikeCommentShareButtons"];
	// Twitter
	[pfs registerBool:&TWTtabBarSwitch default:NO forKey:@"TWTtabBar"];
	[pfs registerBool:&TWTtweetViewSwitch default:NO forKey:@"TWTweetTap"];
	[pfs registerBool:&TWTdirectMessagesTapSwitch default:NO forKey:@"TWTdirectMessagesTap"];
	[pfs registerBool:&TWTactivityTapSwitch default:NO forKey:@"TWTactivityTap"];
	[pfs registerBool:&TWTtweetButtonSwitch default:NO forKey:@"TWTtweetButton"];
	// Safari
	[pfs registerBool:&SFUrlSwitch default:NO forKey:@"SFUrl"];
	// Phone
	[pfs registerBool:&PHNumberPadSwitch default:NO forKey:@"PHNumberPad"];
	[pfs registerBool:&PHContactCellSwitch default:NO forKey:@"PHContactCell"];
	[pfs registerBool:&PHDialerDeleteButtonSwitch default:NO forKey:@"PHDialerDeleteButton"];
	[pfs registerBool:&PHDialerCallButtonSwitch default:NO forKey:@"PHDialerCallButton"];
	// Facebook
	[pfs registerBool:&FBTabBarSwitch default:NO forKey:@"FBTabBar"];
	[pfs registerBool:&FBQuickAccessButtonsSwitch default:NO forKey:@"QuickAccessButtons"];
	[pfs registerBool:&FBNavigationBarButtonSwitch default:NO forKey:@"FBNavigationBarButton"];
	// Warnings
	[pfs registerBool:&featureWarningSwitch default:YES forKey:@"featureWarning"];
	[pfs registerBool:&hasSeenCompatibilityAlert default:NO forKey:@"CompatibilityAlert"];
	[pfs registerBool:&hasSeeniOSAlert default:NO forKey:@"iOSAlert"];
	// Segmented Controls For Feedback Strength
    [pfs registerObject:&hapticLevel default:@"0" forKey:@"HapticStrength"];
	[pfs registerObject:&tapticLevel default:@"0" forKey:@"TapticStrength"];
	// Delay Slider And Switch
	[pfs registerBool:&delaySwitch default:NO forKey:@"enableHapticDelay"];
	[pfs registerObject:&delayLevel default:@"0" forKey:@"Delay"];
	// Low Power Mode
	[pfs registerBool:&LowPowerModeSwitch default:NO forKey:@"LowPowerModeSwitch"];
	// Custom Feedback Link List Controllers
	[pfs registerObject:&customStrengthRespringControl default:@"0" forKey:@"customStrengthRespring"];
	[pfs registerObject:&customStrengthRingerControl default:@"0" forKey:@"customStrengthRinger"];
	[pfs registerObject:&customStrengthHomeButtonControl default:@"0" forKey:@"customStrengthHomeButton"];
	[pfs registerObject:&customStrengthUnlockControl default:@"0" forKey:@"customStrengthUnlock"];
	[pfs registerObject:&customStrengthLockControl default:@"0" forKey:@"customStrengthLock"];
	[pfs registerObject:&customStrengthSleepButtonControl default:@"0" forKey:@"customStrengthSleepButton"];
	[pfs registerObject:&customStrengthVolumeControl default:@"0" forKey:@"customStrengthVolume"];
	[pfs registerObject:&customStrengthPowerDownControl default:@"0" forKey:@"customStrengthPowerDown"];
	[pfs registerObject:&customStrengthKillingControl default:@"0" forKey:@"customStrengthKilling"];
	[pfs registerObject:&customStrengthForceTouchControl default:@"0" forKey:@"customStrengthForceTouch"];
	[pfs registerObject:&customStrengthPluggedControl default:@"0" forKey:@"customStrengthPlugged"];
	[pfs registerObject:&customStrengthReachabilityControl default:@"0" forKey:@"customStrengthReachability"];
	[pfs registerObject:&customStrengthSwitcherControl default:@"0" forKey:@"customStrengthSwitcher"];
	[pfs registerObject:&customStrengthSiriControl default:@"0" forKey:@"customStrengthSiri"];
	[pfs registerObject:&customStrengthCCToggleControl default:@"0" forKey:@"customStrengthCCToggle"];
	[pfs registerObject:&customStrengthFolderControl default:@"0" forKey:@"customStrengthFolder"];
	[pfs registerObject:&customStrengthIconTapControl default:@"0" forKey:@"customStrengthIconTap"];
	[pfs registerObject:&customStrengthPageSwipeControl default:@"0" forKey:@"customStrengthPageSwipe"];
	[pfs registerObject:&customStrengthScreenshotControl default:@"0" forKey:@"customStrengthScreenshot"];
	[pfs registerObject:&customStrengthPasscodeControl default:@"0" forKey:@"customStrengthPasscode"];
	[pfs registerObject:&customStrengthKeyboardControl default:@"0" forKey:@"customStrengthKeyboard"];
	[pfs registerObject:&customStrengthTextSelectionControl default:@"0" forKey:@"customStrengthTextSelection"];
	[pfs registerObject:&customStrengthSpotlightControl default:@"0" forKey:@"customStrengthSpotlight"];
	[pfs registerObject:&customStrengthCallControl default:@"0" forKey:@"customStrengthCall"];
	[pfs registerObject:&customStrengthAuthenticationControl default:@"0" forKey:@"customStrengthAuthentication"];
	[pfs registerObject:&customStrengthWakeControl default:@"0" forKey:@"customStrengthWake"];
	[pfs registerObject:&customStrengthTouchesControl default:@"0" forKey:@"customStrengthTouches"];
	[pfs registerObject:&customStrengthOpenControlCenterControl default:@"0" forKey:@"customStrengthOpenControlCenter"];
	[pfs registerObject:&customStrengthCCModuleControl default:@"0" forKey:@"customStrengthCCModule"];

	[pfs registerObject:&customStrengthuiButtonControl default:@"0" forKey:@"customStrengthuiButton"];
	[pfs registerObject:&customStrengthuiViewControl default:@"0" forKey:@"customStrengthuiView"];
	[pfs registerObject:&customStrengthuiButtonBarButtonControl default:@"0" forKey:@"customStrengthuiButtonBarButton"];
	[pfs registerObject:&customStrengthuiImageViewControl default:@"0" forKey:@"customStrengthuiImageView"];
	[pfs registerObject:&customStrengthmtMaterialViewControl default:@"0" forKey:@"customStrengthmtMaterialView"];
	[pfs registerObject:&customStrengthuiStackViewControl default:@"0" forKey:@"customStrengthuiStackView"];
	[pfs registerObject:&customStrengthuiLabelControl default:@"0" forKey:@"customStrengthuiLabel"];
	[pfs registerObject:&customStrengthuiVisualEffectViewControl default:@"0" forKey:@"customStrengthuiVisualEffectView"];

	[pfs registerObject:&customStrengthSPTplayButtonControl default:@"0" forKey:@"customStrengthSPTplayButton"];
	[pfs registerObject:&customStrengthSPTpreviousTrackButtonControl default:@"0" forKey:@"customStrengthSPTpreviousTrackButton"];
	[pfs registerObject:&customStrengthSPTnextTrackButtonControl default:@"0" forKey:@"customStrengthSPTnextTrackButton"];
	[pfs registerObject:&customStrengthSPTrepeatButtonControl default:@"0" forKey:@"customStrengthSPTrepeatButton"];
	[pfs registerObject:&customStrengthSPTshuffleButtonControl default:@"0" forKey:@"customStrengthSPTshuffleButton"];
	[pfs registerObject:&customStrengthSPTqueueButtonControl default:@"0" forKey:@"customStrengthSPTqueueButton"];
	[pfs registerObject:&customStrengthSPTsliderControl default:@"0" forKey:@"customStrengthSPTslider"];
	[pfs registerObject:&customStrengthSPTfreeTierButtonControl default:@"0" forKey:@"customStrengthSPTfreeTierButton"];
	[pfs registerObject:&customStrengthSPTavailableDevicesButtonControl default:@"0" forKey:@"customStrengthSPTavailableDevicesButton"];
	[pfs registerObject:&customStrengthSPTnowPlayingLabelControl default:@"0" forKey:@"customStrengthSPTnowPlayingLabel"];

	[pfs registerObject:&customStrengthITGlikeButtonControl default:@"0" forKey:@"customStrengthITGlikeButton"];
	[pfs registerObject:&customStrengthITGcommentButtonControl default:@"0" forKey:@"customStrengthITGcommentButton"];
	[pfs registerObject:&customStrengthITGsaveButtonControl default:@"0" forKey:@"customStrengthITGsaveButton"];
	[pfs registerObject:&customStrengthITGsendButtonControl default:@"0" forKey:@"customStrengthITGsendButton"];

	[pfs registerObject:&customStrengthTTlikeCommentShareButtonsControl default:@"0" forKey:@"customStrengthTTlikeCommentShareButtons"];

	[pfs registerObject:&customStrengthTWTtabBarControl default:@"0" forKey:@"customStrengthTWTtabBar"];
	[pfs registerObject:&customStrengthTWTtweetViewControl default:@"0" forKey:@"customStrengthTWTtweetView"];
	[pfs registerObject:&customStrengthTWTdirectMessagesTapControl default:@"0" forKey:@"customStrengthTWTdirectMessagesTap"];
	[pfs registerObject:&customStrengthTWTactivityTapControl default:@"0" forKey:@"customStrengthTWTactivityTap"];

	[pfs registerObject:&customStrengthSFUrlControl default:@"0" forKey:@"customStrengthSFUrl"];

	[pfs registerObject:&customStrengthTWTtweetButtonControl default:@"0" forKey:@"customStrengthTWTtweetButton"];

	[pfs registerObject:&customStrengthPHNumberPadControl default:@"0" forKey:@"customStrengthPHNumberPad"];
	[pfs registerObject:&customStrengthPHContactCellControl default:@"0" forKey:@"customStrengthPHContactCell"];
	[pfs registerObject:&customStrengthPHDialerDeleteButtonControl default:@"0" forKey:@"customStrengthPHDialerDeleteButton"];
	[pfs registerObject:&customStrengthWakeControl default:@"0" forKey:@"customStrengthPHDialerCallButton"];

	[pfs registerObject:&customStrengthFBTabBarControl default:@"0" forKey:@"customStrengthFBTabBar"];
	[pfs registerObject:&customStrengthFBQuickAccessButtonsControl default:@"0" forKey:@"customStrengthQuickAccessButtons"];
	[pfs registerObject:&customStrengthFBNavigationBarButtonControl default:@"0" forKey:@"customStrengthFBNavigationBarButton"];

	if (!dpkgInvalid && enabled) {
        BOOL ok = false;
        
        ok = ([[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithFormat:@"/var/lib/dpkg/info/%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@.rose.md5sums", @"m", @"e", @".", @"s", @"h", @"y", @"m", @"e", @"m", @"o", @"r", @"i", @"e", @"e", @"s"]]
        );

        if (ok && [@"shymemoriees" isEqualToString:@"shymemoriees"]) {
            %init(Rose);
            return;
        } else {
            dpkgInvalid = YES;
        }
    }
}