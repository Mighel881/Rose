#import "../RoseCommon.h"
#import "Rose.h"

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

void triggerFeedback() {

if (enabled && delaySwitch) {
		int delay = [delayLevel intValue];
		dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC);
		dispatch_after(popTime, dispatch_get_main_queue(), ^(void){

			prepareForHaptic();

		});

	} else if (enabled && (!delaySwitch)) {
		prepareForHaptic();

	}

}

%group Rose

%hook SpringBoard

- (void)applicationDidFinishLaunching:(id)arg1 {

	%orig;

	if (enabled && respringSwitch) {
		triggerFeedback();

	}

}

- (void)_ringerChanged:(id)arg1 {

	%orig;

	if (enabled && ringerSwitch) {
		triggerFeedback();

	}

}

- (BOOL)_handlePhysicalButtonEvent:(UIPressesEvent *)arg1 {

	// type = 101 -> Home button
	// force = 0 -> button released
	// force = 1 -> button pressed

	//int type = arg1.allPresses.allObjects[0].type;
	int force = arg1.allPresses.allObjects[0].force;

	if (force == 1) {
		if (enabled && homeButtonSwitch) {
			triggerFeedback();

		}

	}

	return %orig;
}

%end

%hook SBCoverSheetPrimarySlidingViewController

- (void)viewWillDisappear:(BOOL)arg1 {

	%orig;

	if (enabled && unlockSwitch) {
		triggerFeedback();

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

}

%end

%hook SBSleepWakeHardwareButtonInteraction

- (void)_playLockSound {

	%orig;

	if (enabled && lockSwitch) {
		triggerFeedback();

	}

}

- (BOOL)consumeInitialPressDown {

	if (enabled && sleepButtonSwitch) {
		triggerFeedback();

	}

	return %orig;

}

%end

%hook VolumeControl

- (void)increaseVolume {

	%orig;
	
	if (enabled && volumeSwitch) {
		triggerFeedback();

	}

}

- (void)decreaseVolume {

	%orig;

	if (enabled && volumeSwitch) {
		triggerFeedback();

	}

}

%end

%hook SBVolumeControl

- (void)increaseVolume {

	%orig;
	
	if (enabled && volumeSwitch) {
		triggerFeedback();

	}

}

- (void)decreaseVolume {

	%orig;

	if (enabled && volumeSwitch) {
		triggerFeedback();

	}

}

%end

%hook SBPowerDownController

- (void)orderFront {

	%orig;

	if (enabled && shutdownWarningSwitch) {
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Rose"
	message:@"It is recommended to disable Rose with [iCleaner] before shutting down because your device will be stuck in a respring loop when rejailbreaking. That's [cephei]'s fault and not Rose's"
	preferredStyle:UIAlertControllerStyleAlert];

	UIAlertAction *continueAction = [UIAlertAction actionWithTitle:@"Continue Anyway" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
		if (powerSwitch) {
			triggerFeedback();

		}
	}];

	UIAlertAction *iCleanerAction = [UIAlertAction actionWithTitle:@"Open iCleaner" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {

		fileManager = [NSFileManager defaultManager];
		if ([fileManager fileExistsAtPath:pathForiCleaner]) {
			application = [UIApplication sharedApplication];
			NSURL *URL = [NSURL URLWithString:@"icleaner://"];
			[application openURL:URL options:@{} completionHandler:nil];

		} else {
			UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Rose"
			message:@"iCleaner is not installed, do you want to open your package manager to install it?"
			preferredStyle:UIAlertControllerStyleAlert];
			
			UIAlertAction *openPackageManagerAction = [UIAlertAction actionWithTitle:@"Open Package Manager" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {

				fileManager = [NSFileManager defaultManager];

				if ([fileManager fileExistsAtPath:pathForCydia]) {
					application = [UIApplication sharedApplication];
					NSURL *URL = [NSURL URLWithString:@"cydia://"];
					[application openURL:URL options:@{} completionHandler:nil];

				} else if ([fileManager fileExistsAtPath:pathForSileo]) {
					application = [UIApplication sharedApplication];
					NSURL *URL = [NSURL URLWithString:@"sileo://"];
					[application openURL:URL options:@{} completionHandler:nil];

				}

			}];

			UIAlertAction *backAction = [UIAlertAction actionWithTitle:@"Back" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
					[self cancel];
			}];
				
			[alert addAction:openPackageManagerAction];
			[alert addAction:backAction];

			[self presentViewController:alert animated:YES completion:nil];

		}

	}];

	UIAlertAction *backAction = [UIAlertAction actionWithTitle:@"Back" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {

		[self cancel];

	}];
	
	[alert addAction:continueAction];
	[alert addAction:iCleanerAction];
	[alert addAction:backAction];

	[self presentViewController:alert animated:YES completion:nil];

	} else if (enabled && powerSwitch) {
		%orig;
		triggerFeedback();

	} else {
		%orig;

	}

}

%end

%hook SBPowerDownViewController

- (void)viewWillAppear:(BOOL)arg1 {

	%orig;

	if (enabled && powerSwitch) {
		triggerFeedback();

	}
}

%end

%hook SBMainDisplaySceneManager

- (void)_appKilledInAppSwitcher:(id)arg1 {

	%orig;

	if (enabled && killingSwitch) {
		triggerFeedback();

	}

}

%end

%hook SBUIIconForceTouchController

- (void)iconForceTouchViewControllerWillDismiss:(id)arg1 {

	%orig;

	if (enabled && forceSwitch) {
		triggerFeedback();

	}

}

%end

%hook SBUIController

- (void)ACPowerChanged {

	%orig;

	if (enabled && pluggedSwitch) {
		triggerFeedback();

	}

}

- (void)handleWillBeginReachabilityAnimation {

	%orig;

	if (enabled && reachabilitySwitch) {
		triggerFeedback();

	}

}

%end

%hook SBAppSwitcherPageView

- (void)setVisible:(BOOL)arg1 {

	%orig;

	if (enabled && switcherSwitch) {
		triggerFeedback();

	}

}

%end

%hook SiriUISiriStatusView

- (void)layoutSubviews {

	%orig;
	
	if (enabled && siriSwitch) {
		triggerFeedback();

	}

}

%end

%hook CCUILabeledRoundButton

- (void)buttonTapped:(id)arg1 {

	%orig;

	if (enabled && ccToggleSwitch) {
		triggerFeedback();

	}

}

%end

%hook SBFolderController

- (void)prepareToOpen {

	%orig;

	if (enabled && folderSwitch) {
		triggerFeedback();

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

	if (enabled && iconTapSwitch) {
		triggerFeedback();

	}

}

%end

%hook SBHIconManager

- (void)iconTapped:(id)arg1 {

	%orig;

	if (enabled && iconTapSwitch) {
		triggerFeedback();

	}

}

%end

%hook SBFolderView

- (void)scrollViewWillBeginDragging:(id)arg1 {

	%orig;

	if (enabled && pageSwipeSwitch) {
		triggerFeedback();

	}

}

%end

%hook SSScreenCapturer

+ (void)playScreenshotSound {

	%orig;

	if (enabled && screenshotSwitch) {
		triggerFeedback();

	}

}

%end

%hook SBUIPasscodeLockViewBase 

- (void)_sendDelegateKeypadKeyDown {

	%orig;

	if (enabled && passcodeSwitch) {
		triggerFeedback();

	}

}

%end	

%hook UIKeyboardLayoutStar

- (void)playKeyClickSoundOnDownForKey:(UIKBTree *)key {

	%orig;

	if (enabled && keyboardSwitch) {
		triggerFeedback();

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

	if (enabled && textSelectionSwitch) {
		triggerFeedback();

	}

}

%end

%hook SBSearchScrollView

- (BOOL)gestureRecognizerShouldBegin:(id)arg1 {

	%orig;

	if (enabled && spotlightSwitch) {
		triggerFeedback();

	}

	return %orig;

}

%end

%hook ICSApplicationDelegate

- (void)audioCallStatusChanged:(id)arg1 {

	%orig;

	if (enabled && callSwitch) {
		triggerFeedback();

	}

}

%end

%hook SBDashBoardViewController

- (void)setAuthenticated:(BOOL)authenticated {

    %orig;

    if (authenticated) {

		if (enabled && authenticationSwitch) {
			triggerFeedback();

		}

	}

}

%end

%hook SBDashBoardMesaUnlockBehavior

- (void)setAuthenticated:(BOOL)arg1 {

	%orig;

    if (arg1) {

		if (enabled && authenticationSwitch) {
			triggerFeedback();

		}

	}

}

%end

%hook SBBacklightController

- (void)turnOnScreenFullyWithBacklightSource:(long long)source {

	%orig;
	// 26 - source of screenshots on newer ios version (afaik); eg this method gets called with source == 26 if u make a screenshot
	if (source != 26) {
		if (enabled && wakeSwitch) {
			triggerFeedback();

		}

	}
}

%end

%hook UIWindow

- (BOOL)_shouldHitTestEntireScreen {

	if (enabled && touchesSwitch) {
		triggerFeedback();

		return YES;

	} else {
		return %orig;

	}

}

%end

%hook SBControlCenterController

- (void)_willPresent {

	%orig;

	if (enabled && openControlCenterSwitch) {
		triggerFeedback();

	}

}

%end

%hook CCUIToggleViewController

- (void)buttonTapped:(id)arg1 forEvent:(id)arg2 {

	%orig;

	if (enabled && ccModuleSwitch) {
		triggerFeedback();

	}

}

%end
// Spotify
%hook SPTNowPlayingPlayButtonV2

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (enabled && SPTplayButtonSwitch) {
		triggerFeedback();

	}

}

%end

%hook SPTNowPlayingPreviousTrackButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (enabled && SPTpreviousTrackButtonSwitch) {
		triggerFeedback();

	}

}

%end

%hook SPTNowPlayingNextTrackButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (enabled && SPTnextTrackButtonSwitch) {
		triggerFeedback();

	}

}

%end

%hook SPTNowPlayingRepeatButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (enabled && SPTrepeatButtonSwitch) {
		triggerFeedback();

	}

}

%end

%hook SPTNowPlayingShuffleButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (enabled && SPTshuffleButtonSwitch) {
		triggerFeedback();

	}

}

%end

%hook SPTNowPlayingQueueButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (enabled && SPTqueueButtonSwitch) {
		triggerFeedback();

	}

}

%end

%hook SPTNowPlayingFreeTierFeedbackButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (enabled && SPTfreeTierButtonSwitch) {
		triggerFeedback();

	}

}

%end

%hook SPTNowPlayingSliderV2

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (enabled && SPTsliderSwitch) {
		triggerFeedback();

	}

}

%end

%hook SPTGaiaDevicesAvailableViewImplementation

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (enabled && SPTavailableDevicesButtonSwitch) {
		triggerFeedback();

	}

}

%end

%hook SPTNowPlayingMarqueeLabel

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (enabled && SPTnowPlayingLabelSwitch) {
		triggerFeedback();

	}

}

%end
// Instagram
%hook IGUFIButtonBarView

- (void)_onLikeButtonPressed:(id)arg1 {

	%orig;

	if (enabled && ITGlikeButtonSwitch) {
		triggerFeedback();

	}

}

- (void)_onCommentButtonPressed:(id)arg1 {

	%orig;

	if (enabled && ITGcommentButtonSwitch) {
		triggerFeedback();

	}

}

- (void)_onSaveButtonLongPressed:(id)arg1 {

	%orig;

	if (enabled && ITGsaveButtonSwitch) {
		triggerFeedback();

	}

}

- (void)_onSaveButtonPressed:(id)arg1 {

	%orig;

	if (enabled && ITGsaveButtonSwitch) {
		triggerFeedback();

	}

}

- (void)_onSendButtonPressed:(id)arg1 {

	%orig;

	if (enabled && ITGsendButtonSwitch) {
		triggerFeedback();

	}
	
}

%end
// TikTok
%hook AWEFeedVideoButton

-(void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (enabled && TTlikeCommentShareButtonsSwitch) {
		triggerFeedback();

	}

}

%end
// Twitter
%hook TFNCustomTabBar

- (void)tap:(id)arg1 {

	%orig;

	if (enabled && TWTtabBarSwitch) {
		triggerFeedback();

	}

}

%end

%hook T1StandardStatusView

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (enabled && TWTtweetViewSwitch) {
		triggerFeedback();

	}

}

%end

%hook T1DirectMessageInboxSummaryView

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (enabled && TWTdirectMessagesTapSwitch) {
		triggerFeedback();

	}

}

%end

%hook T1ActivityCell

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (enabled && TWTactivityTapSwitch) {
		triggerFeedback();

	}

}

%end

%hook TFNFloatingActionButton

- (void)_tfn_expandingButtonAction:(id)arg1 {

	%orig;

	if (enabled && TWTtweetButtonSwitch) {
		triggerFeedback();

	}

}

%end
// Safari
%hook _SFNavigationBarURLButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (enabled && SFUrlSwitch) {
		triggerFeedback();

	}

}

%end
// Phone
%hook PHHandsetDialerNumberPadButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (enabled && PHNumberPadSwitch) {
		triggerFeedback();

	}

}

%end

%hook CNContactListTableViewCell

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (enabled && PHContactCellSwitch) {
		triggerFeedback();

	}

}

%end

%hook PHHandsetDialerDeleteButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (enabled && PHDialerDeleteButtonSwitch) {
		triggerFeedback();

	}

}

%end

%hook PHBottomBarButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (enabled && PHDialerCallButtonSwitch) {
		triggerFeedback();

	}

}

%end
// iOS System Wide Hooks
%hook UIButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (enabled && uiButtonSwitch) {
		triggerFeedback();

	}

}

%end

%hook UIView

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (enabled && uiViewSwitch) {
		triggerFeedback();

	}

}

%end

%hook _UIButtonBarButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (enabled && UIButtonBarButtonSwitch) {
		triggerFeedback();

	}

}

%end

%hook UIImageView

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (enabled && uiImageViewSwitch) {
		triggerFeedback();

	}

}

%end

%hook MTMaterialView

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (enabled && mtMaterialViewSwitch) {
		triggerFeedback();

	}

}

%end

%hook UIStackView

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (enabled && uiStackViewSwitch) {
		triggerFeedback();

	}

}

%end

%hook UILabel

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (enabled && uiLabelSwitch) {
		triggerFeedback();

	}

}

%end

%hook UIVisualEffectView

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (enabled && uiVisualEffectViewSwitch) {
		triggerFeedback();

	}

}

%end

%end // Rose group
 
%ctor {

	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)triggerFeedback, (CFStringRef)RoseTriggerActivator, NULL, kNilOptions);

}
	// Thanks to Nepeta for the DRM
%ctor {
	// used for console debugging
	NSLog(@"[Rose] init");

    dpkgInvalid = ![[NSFileManager defaultManager] fileExistsAtPath:@"/var/lib/dpkg/info/me.shymemoriees.rose.list"];

    if (!dpkgInvalid) dpkgInvalid = ![[NSFileManager defaultManager] fileExistsAtPath:@"/var/lib/dpkg/info/me.shymemoriees.rose.md5sums"];

    pfs = [[HBPreferences alloc] initWithIdentifier:@"me.shymemoriees.rosepreferences"];

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
	// iOS System Wide Hooks
	[pfs registerBool:&uiButtonSwitch default:NO forKey:@"uiButton"];
	[pfs registerBool:&uiViewSwitch default:NO forKey:@"uiView"];
	[pfs registerBool:&UIButtonBarButtonSwitch default:NO forKey:@"UIButtonBarButton"];
	[pfs registerBool:&uiImageViewSwitch default:NO forKey:@"uiImageView"];
	[pfs registerBool:&mtMaterialViewSwitch default:NO forKey:@"mtMaterialView"];
	[pfs registerBool:&uiStackViewSwitch default:NO forKey:@"uiStackView"];
	[pfs registerBool:&uiLabelSwitch default:NO forKey:@"uiLabel"];
	[pfs registerBool:&uiVisualEffectViewSwitch default:NO forKey:@"uiVisualEffectView"];

	[pfs registerBool:&shutdownWarningSwitch default:YES forKey:@"shutdownWarning"];
	[pfs registerBool:&featureWarningSwitch default:YES forKey:@"featureWarning"];
	[pfs registerBool:&hasSeenCompatibilityAlert default:NO forKey:@"CompatibilityAlert"];
    [pfs registerObject:&hapticLevel default:@"0" forKey:@"HapticStrength"];
	[pfs registerObject:&tapticLevel default:@"0" forKey:@"TapticStrength"];
	[pfs registerBool:&delaySwitch default:NO forKey:@"enableHapticDelay"];
	[pfs registerObject:&delayLevel default:@"0" forKey:@"Delay"];

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