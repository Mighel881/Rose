#line 1 "Tweak.x"
#import "Rose.h"

BOOL enabled = NO;
BOOL enableTapticEngineSwitch = NO;
BOOL enableHapticEngineSwitch = NO;
BOOL enableLegacyEngineSwitch = NO;
	
	
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


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBIconController; @class TFNFloatingActionButton; @class PHHandsetDialerDeleteButton; @class _SFNavigationBarURLButton; @class SBDashBoardQuickActionsButton; @class SiriUISiriStatusView; @class SileoSourcesCell; @class SBVolumeControl; @class _UIButtonBarButton; @class SBFolderController; @class SBPowerDownViewController; @class CCUILabeledRoundButton; @class SBAppSwitcherPageView; @class SPTGaiaDevicesAvailableViewImplementation; @class T1DirectMessageInboxSummaryView; @class SBSearchScrollView; @class T1StandardStatusView; @class SBBacklightController; @class NSProcessInfo; @class SileoConfirmDownloadButton; @class SPTNowPlayingPreviousTrackButton; @class SileoTableViewCell; @class UIWindow; @class JumpBar; @class SBCoverSheetPrimarySlidingViewController; @class SBMainDisplaySceneManager; @class SBDashBoardViewController; @class SPTNowPlayingQueueButton; @class IGFeedPhotoView; @class DNDState; @class SBUIPasscodeLockViewBase; @class PHBottomBarButton; @class ICSApplicationDelegate; @class UIButton; @class SPTNowPlayingSliderV2; @class IGUFIButtonBarView; @class SBApplication; @class MPRouteButton; @class CSQuickActionsButton; @class TFNCustomTabBar; @class PHHandsetDialerNumberPadButton; @class UIAlertController; @class SileoFeaturedBannerView; @class CNContactListTableViewCell; @class T1ActivityCell; @class SPTNowPlayingNextTrackButton; @class SBControlCenterController; @class MusicApplicationTimeSlider; @class SPTNowPlayingBarPlayButton; @class SBDashBoardLockScreenEnvironment; @class SBPowerDownController; @class ApolloFloatingActionButton; @class _TtCC16MusicApplication32NowPlayingControlsViewController12VolumeSlider; @class SBUIIconForceTouchController; @class SPTNowPlayingMarqueeLabel; @class SBSleepWakeHardwareButtonInteraction; @class IGFeedItemVideoView; @class SBUIController; @class _TtCC16MusicApplication30LibraryMenuTableViewController4Cell; @class AWEFeedVideoButton; @class CCUIToggleViewController; @class SpringBoard; @class FDSTetraPressStateAnnouncingControl; @class VolumeControl; @class MusicApplicationContextualActionsButton; @class UITabBarButton; @class MusicApplicationPlayButton; @class SBFolderView; @class SPTNowPlayingFreeTierFeedbackButton; @class SileoPackageCollectionViewCell; @class SPTNowPlayingPlayButtonV2; @class MusicApplicationAlbumCell; @class MPButton; @class FBTabBar; @class SSScreenCapturer; @class UICalloutBar; @class MusicApplicationSongCell; @class SPTNowPlayingRepeatButton; @class SBHIconManager; @class UIKeyboardLayoutStar; @class _ASDisplayView; @class CalculatorApplicationKeyPadButton; @class SPTNowPlayingShuffleButton; 


#line 205 "Tweak.x"
static void (*_logos_orig$Rose$SpringBoard$applicationDidFinishLaunching$)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SpringBoard$_ringerChanged$)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SpringBoard$_ringerChanged$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static BOOL (*_logos_orig$Rose$SpringBoard$_handlePhysicalButtonEvent$)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, UIPressesEvent *); static BOOL _logos_method$Rose$SpringBoard$_handlePhysicalButtonEvent$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, UIPressesEvent *); static void (*_logos_orig$Rose$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$)(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$SBCoverSheetPrimarySlidingViewController$viewDidAppear$)(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$SBCoverSheetPrimarySlidingViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$SBSleepWakeHardwareButtonInteraction$_playLockSound)(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBSleepWakeHardwareButtonInteraction$_playLockSound(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$Rose$SBSleepWakeHardwareButtonInteraction$consumeInitialPressDown)(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$Rose$SBSleepWakeHardwareButtonInteraction$consumeInitialPressDown(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$VolumeControl$increaseVolume)(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$VolumeControl$increaseVolume(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$VolumeControl$decreaseVolume)(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$VolumeControl$decreaseVolume(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBVolumeControl$increaseVolume)(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBVolumeControl$increaseVolume(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBVolumeControl$decreaseVolume)(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBVolumeControl$decreaseVolume(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBPowerDownController$orderFront)(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBPowerDownController$orderFront(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBPowerDownViewController$viewWillAppear$)(_LOGOS_SELF_TYPE_NORMAL SBPowerDownViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$SBPowerDownViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL SBPowerDownViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$SBMainDisplaySceneManager$_appKilledInAppSwitcher$)(_LOGOS_SELF_TYPE_NORMAL SBMainDisplaySceneManager* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SBMainDisplaySceneManager$_appKilledInAppSwitcher$(_LOGOS_SELF_TYPE_NORMAL SBMainDisplaySceneManager* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SBApplication$_didExitWithContext$)(_LOGOS_SELF_TYPE_NORMAL SBApplication* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SBApplication$_didExitWithContext$(_LOGOS_SELF_TYPE_NORMAL SBApplication* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$)(_LOGOS_SELF_TYPE_NORMAL SBUIIconForceTouchController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$(_LOGOS_SELF_TYPE_NORMAL SBUIIconForceTouchController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SBUIController$ACPowerChanged)(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBUIController$ACPowerChanged(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBUIController$handleWillBeginReachabilityAnimation)(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBUIController$handleWillBeginReachabilityAnimation(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBAppSwitcherPageView$setVisible$)(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherPageView* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$SBAppSwitcherPageView$setVisible$(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherPageView* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$SiriUISiriStatusView$didMoveToWindow)(_LOGOS_SELF_TYPE_NORMAL SiriUISiriStatusView* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SiriUISiriStatusView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL SiriUISiriStatusView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$CCUILabeledRoundButton$buttonTapped$)(_LOGOS_SELF_TYPE_NORMAL CCUILabeledRoundButton* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$CCUILabeledRoundButton$buttonTapped$(_LOGOS_SELF_TYPE_NORMAL CCUILabeledRoundButton* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SBFolderController$folderControllerWillOpen$)(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SBFolderController$folderControllerWillOpen$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SBFolderController$folderControllerWillClose$)(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SBFolderController$folderControllerWillClose$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SBIconController$viewWillAppear$)(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$SBIconController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$SBIconController$iconTapped$)(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SBIconController$iconTapped$(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SBHIconManager$iconTapped$)(_LOGOS_SELF_TYPE_NORMAL SBHIconManager* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SBHIconManager$iconTapped$(_LOGOS_SELF_TYPE_NORMAL SBHIconManager* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SBFolderView$scrollViewWillBeginDragging$)(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SBFolderView$scrollViewWillBeginDragging$(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_meta_orig$Rose$SSScreenCapturer$playScreenshotSound)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void _logos_meta_method$Rose$SSScreenCapturer$playScreenshotSound(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBUIPasscodeLockViewBase$_sendDelegateKeypadKeyDown)(_LOGOS_SELF_TYPE_NORMAL SBUIPasscodeLockViewBase* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBUIPasscodeLockViewBase$_sendDelegateKeypadKeyDown(_LOGOS_SELF_TYPE_NORMAL SBUIPasscodeLockViewBase* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$UIKeyboardLayoutStar$playKeyClickSoundOnDownForKey$)(_LOGOS_SELF_TYPE_NORMAL UIKeyboardLayoutStar* _LOGOS_SELF_CONST, SEL, UIKBTree *); static void _logos_method$Rose$UIKeyboardLayoutStar$playKeyClickSoundOnDownForKey$(_LOGOS_SELF_TYPE_NORMAL UIKeyboardLayoutStar* _LOGOS_SELF_CONST, SEL, UIKBTree *); static void (*_logos_orig$Rose$UICalloutBar$buttonPressed$)(_LOGOS_SELF_TYPE_NORMAL UICalloutBar* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$UICalloutBar$buttonPressed$(_LOGOS_SELF_TYPE_NORMAL UICalloutBar* _LOGOS_SELF_CONST, SEL, id); static BOOL (*_logos_orig$Rose$SBSearchScrollView$gestureRecognizerShouldBegin$)(_LOGOS_SELF_TYPE_NORMAL SBSearchScrollView* _LOGOS_SELF_CONST, SEL, id); static BOOL _logos_method$Rose$SBSearchScrollView$gestureRecognizerShouldBegin$(_LOGOS_SELF_TYPE_NORMAL SBSearchScrollView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$ICSApplicationDelegate$audioCallStatusChanged$)(_LOGOS_SELF_TYPE_NORMAL ICSApplicationDelegate* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$ICSApplicationDelegate$audioCallStatusChanged$(_LOGOS_SELF_TYPE_NORMAL ICSApplicationDelegate* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SBDashBoardViewController$setAuthenticated$)(_LOGOS_SELF_TYPE_NORMAL SBDashBoardViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$SBDashBoardViewController$setAuthenticated$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$SBDashBoardLockScreenEnvironment$setAuthenticated$)(_LOGOS_SELF_TYPE_NORMAL SBDashBoardLockScreenEnvironment* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$SBDashBoardLockScreenEnvironment$setAuthenticated$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardLockScreenEnvironment* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$SBBacklightController$turnOnScreenFullyWithBacklightSource$)(_LOGOS_SELF_TYPE_NORMAL SBBacklightController* _LOGOS_SELF_CONST, SEL, long long); static void _logos_method$Rose$SBBacklightController$turnOnScreenFullyWithBacklightSource$(_LOGOS_SELF_TYPE_NORMAL SBBacklightController* _LOGOS_SELF_CONST, SEL, long long); static BOOL (*_logos_orig$Rose$UIWindow$_shouldHitTestEntireScreen)(_LOGOS_SELF_TYPE_NORMAL UIWindow* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$Rose$UIWindow$_shouldHitTestEntireScreen(_LOGOS_SELF_TYPE_NORMAL UIWindow* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBControlCenterController$_willPresent)(_LOGOS_SELF_TYPE_NORMAL SBControlCenterController* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBControlCenterController$_willPresent(_LOGOS_SELF_TYPE_NORMAL SBControlCenterController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$CCUIToggleViewController$buttonTapped$forEvent$)(_LOGOS_SELF_TYPE_NORMAL CCUIToggleViewController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$CCUIToggleViewController$buttonTapped$forEvent$(_LOGOS_SELF_TYPE_NORMAL CCUIToggleViewController* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$CSQuickActionsButton$setSelected$)(_LOGOS_SELF_TYPE_NORMAL CSQuickActionsButton* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$CSQuickActionsButton$setSelected$(_LOGOS_SELF_TYPE_NORMAL CSQuickActionsButton* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$SBDashBoardQuickActionsButton$setSelected$)(_LOGOS_SELF_TYPE_NORMAL SBDashBoardQuickActionsButton* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$SBDashBoardQuickActionsButton$setSelected$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardQuickActionsButton* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$UIAlertController$viewWillAppear$)(_LOGOS_SELF_TYPE_NORMAL UIAlertController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$UIAlertController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL UIAlertController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$UIAlertController$viewWillDisappear$)(_LOGOS_SELF_TYPE_NORMAL UIAlertController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$UIAlertController$viewWillDisappear$(_LOGOS_SELF_TYPE_NORMAL UIAlertController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$UIButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL UIButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$UIButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL UIButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$_UIButtonBarButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL _UIButtonBarButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$_UIButtonBarButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL _UIButtonBarButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$UITabBarButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL UITabBarButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$UITabBarButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL UITabBarButton* _LOGOS_SELF_CONST, SEL, id, id); static BOOL (*_logos_orig$Rose$NSProcessInfo$isLowPowerModeEnabled)(_LOGOS_SELF_TYPE_NORMAL NSProcessInfo* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$Rose$NSProcessInfo$isLowPowerModeEnabled(_LOGOS_SELF_TYPE_NORMAL NSProcessInfo* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$Rose$DNDState$isActive)(_LOGOS_SELF_TYPE_NORMAL DNDState* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$Rose$DNDState$isActive(_LOGOS_SELF_TYPE_NORMAL DNDState* _LOGOS_SELF_CONST, SEL); 



static void _logos_method$Rose$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$SpringBoard$applicationDidFinishLaunching$(self, _cmd, arg1);

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

static void _logos_method$Rose$SpringBoard$_ringerChanged$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$SpringBoard$_ringerChanged$(self, _cmd, arg1);

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

static BOOL _logos_method$Rose$SpringBoard$_handlePhysicalButtonEvent$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIPressesEvent * arg1) {

	
	
	

	
	if (!enabled || !hardwareButtonsSectionSupportSwitch || !homeButtonSwitch) return _logos_orig$Rose$SpringBoard$_handlePhysicalButtonEvent$(self, _cmd, arg1);
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

	return _logos_orig$Rose$SpringBoard$_handlePhysicalButtonEvent$(self, _cmd, arg1);

}





static void _logos_method$Rose$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {

	_logos_orig$Rose$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$(self, _cmd, arg1);

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

static void _logos_method$Rose$SBCoverSheetPrimarySlidingViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {

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





static void _logos_method$Rose$SBSleepWakeHardwareButtonInteraction$_playLockSound(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SBSleepWakeHardwareButtonInteraction$_playLockSound(self, _cmd);

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

static BOOL _logos_method$Rose$SBSleepWakeHardwareButtonInteraction$consumeInitialPressDown(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	if (!enabled || !hardwareButtonsSectionSupportSwitch || !sleepButtonSwitch) return _logos_orig$Rose$SBSleepWakeHardwareButtonInteraction$consumeInitialPressDown(self, _cmd);
	int customStrength = [customStrengthSleepButtonControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

	return _logos_orig$Rose$SBSleepWakeHardwareButtonInteraction$consumeInitialPressDown(self, _cmd);

}





static void _logos_method$Rose$VolumeControl$increaseVolume(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$VolumeControl$increaseVolume(self, _cmd);

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

static void _logos_method$Rose$VolumeControl$decreaseVolume(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$VolumeControl$decreaseVolume(self, _cmd);

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





static void _logos_method$Rose$SBVolumeControl$increaseVolume(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SBVolumeControl$increaseVolume(self, _cmd);

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

static void _logos_method$Rose$SBVolumeControl$decreaseVolume(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SBVolumeControl$decreaseVolume(self, _cmd);

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





static void _logos_method$Rose$SBPowerDownController$orderFront(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SBPowerDownController$orderFront(self, _cmd);

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





static void _logos_method$Rose$SBPowerDownViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL SBPowerDownViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {

	_logos_orig$Rose$SBPowerDownViewController$viewWillAppear$(self, _cmd, arg1);

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





static void _logos_method$Rose$SBMainDisplaySceneManager$_appKilledInAppSwitcher$(_LOGOS_SELF_TYPE_NORMAL SBMainDisplaySceneManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$SBMainDisplaySceneManager$_appKilledInAppSwitcher$(self, _cmd, arg1);

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





static void _logos_method$Rose$SBApplication$_didExitWithContext$(_LOGOS_SELF_TYPE_NORMAL SBApplication* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$SBApplication$_didExitWithContext$(self, _cmd, arg1);

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





static void _logos_method$Rose$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$(_LOGOS_SELF_TYPE_NORMAL SBUIIconForceTouchController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$(self, _cmd, arg1);

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





static void _logos_method$Rose$SBUIController$ACPowerChanged(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SBUIController$ACPowerChanged(self, _cmd);

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

static void _logos_method$Rose$SBUIController$handleWillBeginReachabilityAnimation(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SBUIController$handleWillBeginReachabilityAnimation(self, _cmd);

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





static void _logos_method$Rose$SBAppSwitcherPageView$setVisible$(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherPageView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {

	_logos_orig$Rose$SBAppSwitcherPageView$setVisible$(self, _cmd, arg1);

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





static void _logos_method$Rose$SiriUISiriStatusView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL SiriUISiriStatusView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SiriUISiriStatusView$didMoveToWindow(self, _cmd);

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





static void _logos_method$Rose$CCUILabeledRoundButton$buttonTapped$(_LOGOS_SELF_TYPE_NORMAL CCUILabeledRoundButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$CCUILabeledRoundButton$buttonTapped$(self, _cmd, arg1);

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





static void _logos_method$Rose$SBFolderController$folderControllerWillOpen$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$SBFolderController$folderControllerWillOpen$(self, _cmd, arg1);

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

static void _logos_method$Rose$SBFolderController$folderControllerWillClose$(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$SBFolderController$folderControllerWillClose$(self, _cmd, arg1);

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





static void _logos_method$Rose$SBIconController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {

	_logos_orig$Rose$SBIconController$viewWillAppear$(self, _cmd, arg1);

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

static void _logos_method$Rose$SBIconController$iconTapped$(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$SBIconController$iconTapped$(self, _cmd, arg1);

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





static void _logos_method$Rose$SBHIconManager$iconTapped$(_LOGOS_SELF_TYPE_NORMAL SBHIconManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$SBHIconManager$iconTapped$(self, _cmd, arg1);

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





static void _logos_method$Rose$SBFolderView$scrollViewWillBeginDragging$(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$SBFolderView$scrollViewWillBeginDragging$(self, _cmd, arg1);

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





static void _logos_meta_method$Rose$SSScreenCapturer$playScreenshotSound(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_meta_orig$Rose$SSScreenCapturer$playScreenshotSound(self, _cmd);

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



 

static void _logos_method$Rose$SBUIPasscodeLockViewBase$_sendDelegateKeypadKeyDown(_LOGOS_SELF_TYPE_NORMAL SBUIPasscodeLockViewBase* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SBUIPasscodeLockViewBase$_sendDelegateKeypadKeyDown(self, _cmd);

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

	



static void _logos_method$Rose$UIKeyboardLayoutStar$playKeyClickSoundOnDownForKey$(_LOGOS_SELF_TYPE_NORMAL UIKeyboardLayoutStar* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIKBTree * key) {

	_logos_orig$Rose$UIKeyboardLayoutStar$playKeyClickSoundOnDownForKey$(self, _cmd, key);

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





static void _logos_method$Rose$UICalloutBar$buttonPressed$(_LOGOS_SELF_TYPE_NORMAL UICalloutBar* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$UICalloutBar$buttonPressed$(self, _cmd, arg1);

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





static BOOL _logos_method$Rose$SBSearchScrollView$gestureRecognizerShouldBegin$(_LOGOS_SELF_TYPE_NORMAL SBSearchScrollView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	if (!enabled || !homescreenSectionSupportSwitch || !spotlightSwitch) return _logos_orig$Rose$SBSearchScrollView$gestureRecognizerShouldBegin$(self, _cmd, arg1);
	int customStrength = [customStrengthSpotlightControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch) {
		triggerFeedback();

	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		triggerLegacyFeedback();

	}

	return _logos_orig$Rose$SBSearchScrollView$gestureRecognizerShouldBegin$(self, _cmd, arg1);

}





static void _logos_method$Rose$ICSApplicationDelegate$audioCallStatusChanged$(_LOGOS_SELF_TYPE_NORMAL ICSApplicationDelegate* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$ICSApplicationDelegate$audioCallStatusChanged$(self, _cmd, arg1);

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





static void _logos_method$Rose$SBDashBoardViewController$setAuthenticated$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL authenticated) {

    _logos_orig$Rose$SBDashBoardViewController$setAuthenticated$(self, _cmd, authenticated);

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



 

static void _logos_method$Rose$SBDashBoardLockScreenEnvironment$setAuthenticated$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardLockScreenEnvironment* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {

	_logos_orig$Rose$SBDashBoardLockScreenEnvironment$setAuthenticated$(self, _cmd, arg1);

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





static void _logos_method$Rose$SBBacklightController$turnOnScreenFullyWithBacklightSource$(_LOGOS_SELF_TYPE_NORMAL SBBacklightController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, long long source) {

	_logos_orig$Rose$SBBacklightController$turnOnScreenFullyWithBacklightSource$(self, _cmd, source);

	if (!enabled || !otherHardwareActionsSectionSupportSwitch || !wakeSwitch) return;
	
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





static BOOL _logos_method$Rose$UIWindow$_shouldHitTestEntireScreen(_LOGOS_SELF_TYPE_NORMAL UIWindow* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	if (!enabled || !anywhereSectionSupportSwitch || !touchesSwitch) return _logos_orig$Rose$UIWindow$_shouldHitTestEntireScreen(self, _cmd);
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
		return _logos_orig$Rose$UIWindow$_shouldHitTestEntireScreen(self, _cmd);

	}

}





static void _logos_method$Rose$SBControlCenterController$_willPresent(_LOGOS_SELF_TYPE_NORMAL SBControlCenterController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SBControlCenterController$_willPresent(self, _cmd);

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





static void _logos_method$Rose$CCUIToggleViewController$buttonTapped$forEvent$(_LOGOS_SELF_TYPE_NORMAL CCUIToggleViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$CCUIToggleViewController$buttonTapped$forEvent$(self, _cmd, arg1, arg2);

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





static void _logos_method$Rose$CSQuickActionsButton$setSelected$(_LOGOS_SELF_TYPE_NORMAL CSQuickActionsButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {

	_logos_orig$Rose$CSQuickActionsButton$setSelected$(self, _cmd, arg1);

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





static void _logos_method$Rose$SBDashBoardQuickActionsButton$setSelected$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardQuickActionsButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {

	_logos_orig$Rose$SBDashBoardQuickActionsButton$setSelected$(self, _cmd, arg1);

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





static void _logos_method$Rose$UIAlertController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL UIAlertController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {

    _logos_orig$Rose$UIAlertController$viewWillAppear$(self, _cmd, arg1);
	
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

static void _logos_method$Rose$UIAlertController$viewWillDisappear$(_LOGOS_SELF_TYPE_NORMAL UIAlertController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {

   _logos_orig$Rose$UIAlertController$viewWillDisappear$(self, _cmd, arg1);
	
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





static void _logos_method$Rose$UIButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL UIButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$UIButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);
	
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





static void _logos_method$Rose$_UIButtonBarButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL _UIButtonBarButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$_UIButtonBarButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);
	
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





static void _logos_method$Rose$UITabBarButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL UITabBarButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$UITabBarButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);
	
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





static BOOL _logos_method$Rose$NSProcessInfo$isLowPowerModeEnabled(_LOGOS_SELF_TYPE_NORMAL NSProcessInfo* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	LowPowerMode = _logos_orig$Rose$NSProcessInfo$isLowPowerModeEnabled(self, _cmd);

	return _logos_orig$Rose$NSProcessInfo$isLowPowerModeEnabled(self, _cmd);

}





static BOOL _logos_method$Rose$DNDState$isActive(_LOGOS_SELF_TYPE_NORMAL DNDState* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	isDNDActive = _logos_orig$Rose$DNDState$isActive(self, _cmd);

	return _logos_orig$Rose$DNDState$isActive(self, _cmd);

}



 


static void (*_logos_orig$Spotify$SPTNowPlayingPlayButtonV2$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingPlayButtonV2* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Spotify$SPTNowPlayingPlayButtonV2$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingPlayButtonV2* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Spotify$SPTNowPlayingPreviousTrackButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingPreviousTrackButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Spotify$SPTNowPlayingPreviousTrackButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingPreviousTrackButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Spotify$SPTNowPlayingNextTrackButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingNextTrackButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Spotify$SPTNowPlayingNextTrackButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingNextTrackButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Spotify$SPTNowPlayingRepeatButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingRepeatButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Spotify$SPTNowPlayingRepeatButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingRepeatButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Spotify$SPTNowPlayingShuffleButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingShuffleButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Spotify$SPTNowPlayingShuffleButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingShuffleButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Spotify$SPTNowPlayingQueueButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingQueueButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Spotify$SPTNowPlayingQueueButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingQueueButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Spotify$SPTNowPlayingSliderV2$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingSliderV2* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Spotify$SPTNowPlayingSliderV2$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingSliderV2* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Spotify$SPTNowPlayingFreeTierFeedbackButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingFreeTierFeedbackButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Spotify$SPTNowPlayingFreeTierFeedbackButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingFreeTierFeedbackButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Spotify$SPTGaiaDevicesAvailableViewImplementation$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SPTGaiaDevicesAvailableViewImplementation* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Spotify$SPTGaiaDevicesAvailableViewImplementation$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTGaiaDevicesAvailableViewImplementation* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Spotify$SPTNowPlayingMarqueeLabel$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingMarqueeLabel* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Spotify$SPTNowPlayingMarqueeLabel$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingMarqueeLabel* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Spotify$SPTNowPlayingBarPlayButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingBarPlayButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Spotify$SPTNowPlayingBarPlayButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingBarPlayButton* _LOGOS_SELF_CONST, SEL, id, id); 



static void _logos_method$Spotify$SPTNowPlayingPlayButtonV2$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingPlayButtonV2* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Spotify$SPTNowPlayingPlayButtonV2$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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





static void _logos_method$Spotify$SPTNowPlayingPreviousTrackButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingPreviousTrackButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Spotify$SPTNowPlayingPreviousTrackButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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





static void _logos_method$Spotify$SPTNowPlayingNextTrackButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingNextTrackButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Spotify$SPTNowPlayingNextTrackButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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





static void _logos_method$Spotify$SPTNowPlayingRepeatButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingRepeatButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Spotify$SPTNowPlayingRepeatButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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





static void _logos_method$Spotify$SPTNowPlayingShuffleButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingShuffleButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Spotify$SPTNowPlayingShuffleButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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





static void _logos_method$Spotify$SPTNowPlayingQueueButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingQueueButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Spotify$SPTNowPlayingQueueButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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





static void _logos_method$Spotify$SPTNowPlayingSliderV2$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingSliderV2* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Spotify$SPTNowPlayingSliderV2$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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





static void _logos_method$Spotify$SPTNowPlayingFreeTierFeedbackButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingFreeTierFeedbackButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Spotify$SPTNowPlayingFreeTierFeedbackButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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





static void _logos_method$Spotify$SPTGaiaDevicesAvailableViewImplementation$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTGaiaDevicesAvailableViewImplementation* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Spotify$SPTGaiaDevicesAvailableViewImplementation$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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





static void _logos_method$Spotify$SPTNowPlayingMarqueeLabel$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingMarqueeLabel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Spotify$SPTNowPlayingMarqueeLabel$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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





static void _logos_method$Spotify$SPTNowPlayingBarPlayButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingBarPlayButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Spotify$SPTNowPlayingBarPlayButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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






static void (*_logos_orig$Instagram$IGFeedPhotoView$_onDoubleTap$)(_LOGOS_SELF_TYPE_NORMAL IGFeedPhotoView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Instagram$IGFeedPhotoView$_onDoubleTap$(_LOGOS_SELF_TYPE_NORMAL IGFeedPhotoView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Instagram$IGFeedItemVideoView$overlayViewDidDoubleTap$)(_LOGOS_SELF_TYPE_NORMAL IGFeedItemVideoView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Instagram$IGFeedItemVideoView$overlayViewDidDoubleTap$(_LOGOS_SELF_TYPE_NORMAL IGFeedItemVideoView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Instagram$IGUFIButtonBarView$_onLikeButtonPressed$)(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Instagram$IGUFIButtonBarView$_onLikeButtonPressed$(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Instagram$IGUFIButtonBarView$_onCommentButtonPressed$)(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Instagram$IGUFIButtonBarView$_onCommentButtonPressed$(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Instagram$IGUFIButtonBarView$_onSaveButtonLongPressed$)(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Instagram$IGUFIButtonBarView$_onSaveButtonLongPressed$(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Instagram$IGUFIButtonBarView$_onSaveButtonPressed$)(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Instagram$IGUFIButtonBarView$_onSaveButtonPressed$(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Instagram$IGUFIButtonBarView$_onSendButtonPressed$)(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Instagram$IGUFIButtonBarView$_onSendButtonPressed$(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST, SEL, id); 



static void _logos_method$Instagram$IGFeedPhotoView$_onDoubleTap$(_LOGOS_SELF_TYPE_NORMAL IGFeedPhotoView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Instagram$IGFeedPhotoView$_onDoubleTap$(self, _cmd, arg1);

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





static void _logos_method$Instagram$IGFeedItemVideoView$overlayViewDidDoubleTap$(_LOGOS_SELF_TYPE_NORMAL IGFeedItemVideoView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Instagram$IGFeedItemVideoView$overlayViewDidDoubleTap$(self, _cmd, arg1);

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





static void _logos_method$Instagram$IGUFIButtonBarView$_onLikeButtonPressed$(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Instagram$IGUFIButtonBarView$_onLikeButtonPressed$(self, _cmd, arg1);

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

static void _logos_method$Instagram$IGUFIButtonBarView$_onCommentButtonPressed$(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Instagram$IGUFIButtonBarView$_onCommentButtonPressed$(self, _cmd, arg1);

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

static void _logos_method$Instagram$IGUFIButtonBarView$_onSaveButtonLongPressed$(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Instagram$IGUFIButtonBarView$_onSaveButtonLongPressed$(self, _cmd, arg1);

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

static void _logos_method$Instagram$IGUFIButtonBarView$_onSaveButtonPressed$(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Instagram$IGUFIButtonBarView$_onSaveButtonPressed$(self, _cmd, arg1);

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

static void _logos_method$Instagram$IGUFIButtonBarView$_onSendButtonPressed$(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Instagram$IGUFIButtonBarView$_onSendButtonPressed$(self, _cmd, arg1);

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






static void (*_logos_orig$TikTok$AWEFeedVideoButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL AWEFeedVideoButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$TikTok$AWEFeedVideoButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL AWEFeedVideoButton* _LOGOS_SELF_CONST, SEL, id, id); 



static void _logos_method$TikTok$AWEFeedVideoButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL AWEFeedVideoButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$TikTok$AWEFeedVideoButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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






static void (*_logos_orig$Twitter$TFNCustomTabBar$tap$)(_LOGOS_SELF_TYPE_NORMAL TFNCustomTabBar* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Twitter$TFNCustomTabBar$tap$(_LOGOS_SELF_TYPE_NORMAL TFNCustomTabBar* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Twitter$T1StandardStatusView$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL T1StandardStatusView* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Twitter$T1StandardStatusView$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL T1StandardStatusView* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Twitter$T1DirectMessageInboxSummaryView$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL T1DirectMessageInboxSummaryView* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Twitter$T1DirectMessageInboxSummaryView$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL T1DirectMessageInboxSummaryView* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Twitter$T1ActivityCell$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL T1ActivityCell* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Twitter$T1ActivityCell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL T1ActivityCell* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Twitter$TFNFloatingActionButton$_tfn_expandingButtonAction$)(_LOGOS_SELF_TYPE_NORMAL TFNFloatingActionButton* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Twitter$TFNFloatingActionButton$_tfn_expandingButtonAction$(_LOGOS_SELF_TYPE_NORMAL TFNFloatingActionButton* _LOGOS_SELF_CONST, SEL, id); 



static void _logos_method$Twitter$TFNCustomTabBar$tap$(_LOGOS_SELF_TYPE_NORMAL TFNCustomTabBar* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Twitter$TFNCustomTabBar$tap$(self, _cmd, arg1);

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





static void _logos_method$Twitter$T1StandardStatusView$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL T1StandardStatusView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Twitter$T1StandardStatusView$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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





static void _logos_method$Twitter$T1DirectMessageInboxSummaryView$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL T1DirectMessageInboxSummaryView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Twitter$T1DirectMessageInboxSummaryView$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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





static void _logos_method$Twitter$T1ActivityCell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL T1ActivityCell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Twitter$T1ActivityCell$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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





static void _logos_method$Twitter$TFNFloatingActionButton$_tfn_expandingButtonAction$(_LOGOS_SELF_TYPE_NORMAL TFNFloatingActionButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Twitter$TFNFloatingActionButton$_tfn_expandingButtonAction$(self, _cmd, arg1);

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






static void (*_logos_orig$Safari$_SFNavigationBarURLButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL _SFNavigationBarURLButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Safari$_SFNavigationBarURLButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL _SFNavigationBarURLButton* _LOGOS_SELF_CONST, SEL, id, id); 



static void _logos_method$Safari$_SFNavigationBarURLButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL _SFNavigationBarURLButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Safari$_SFNavigationBarURLButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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






static void (*_logos_orig$Phone$PHHandsetDialerNumberPadButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL PHHandsetDialerNumberPadButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Phone$PHHandsetDialerNumberPadButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL PHHandsetDialerNumberPadButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Phone$CNContactListTableViewCell$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL CNContactListTableViewCell* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Phone$CNContactListTableViewCell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL CNContactListTableViewCell* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Phone$PHHandsetDialerDeleteButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL PHHandsetDialerDeleteButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Phone$PHHandsetDialerDeleteButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL PHHandsetDialerDeleteButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Phone$PHBottomBarButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL PHBottomBarButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Phone$PHBottomBarButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL PHBottomBarButton* _LOGOS_SELF_CONST, SEL, id, id); 



static void _logos_method$Phone$PHHandsetDialerNumberPadButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL PHHandsetDialerNumberPadButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Phone$PHHandsetDialerNumberPadButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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





static void _logos_method$Phone$CNContactListTableViewCell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL CNContactListTableViewCell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Phone$CNContactListTableViewCell$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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





static void _logos_method$Phone$PHHandsetDialerDeleteButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL PHHandsetDialerDeleteButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Phone$PHHandsetDialerDeleteButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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





static void _logos_method$Phone$PHBottomBarButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL PHBottomBarButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Phone$PHBottomBarButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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






static void (*_logos_orig$Facebook$FBTabBar$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL FBTabBar* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Facebook$FBTabBar$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL FBTabBar* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Facebook$FDSTetraPressStateAnnouncingControl$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL FDSTetraPressStateAnnouncingControl* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Facebook$FDSTetraPressStateAnnouncingControl$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL FDSTetraPressStateAnnouncingControl* _LOGOS_SELF_CONST, SEL, id, id); 



static void _logos_method$Facebook$FBTabBar$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL FBTabBar* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Facebook$FBTabBar$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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





static void _logos_method$Facebook$FDSTetraPressStateAnnouncingControl$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL FDSTetraPressStateAnnouncingControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Facebook$FDSTetraPressStateAnnouncingControl$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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






static void (*_logos_orig$Music$MusicApplicationPlayButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Music$MusicApplicationPlayButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Music$_TtCC16MusicApplication32NowPlayingControlsViewController12VolumeSlider$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL _TtCC16MusicApplication32NowPlayingControlsViewController12VolumeSlider* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Music$_TtCC16MusicApplication32NowPlayingControlsViewController12VolumeSlider$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL _TtCC16MusicApplication32NowPlayingControlsViewController12VolumeSlider* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Music$MusicApplicationContextualActionsButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Music$MusicApplicationContextualActionsButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Music$MusicApplicationTimeSlider$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Music$MusicApplicationTimeSlider$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Music$MusicApplicationSongCell$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Music$MusicApplicationSongCell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Music$_TtCC16MusicApplication30LibraryMenuTableViewController4Cell$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL _TtCC16MusicApplication30LibraryMenuTableViewController4Cell* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Music$_TtCC16MusicApplication30LibraryMenuTableViewController4Cell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL _TtCC16MusicApplication30LibraryMenuTableViewController4Cell* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Music$MusicApplicationAlbumCell$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Music$MusicApplicationAlbumCell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Music$MPRouteButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL MPRouteButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Music$MPRouteButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL MPRouteButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Music$MPButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL MPButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Music$MPButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL MPButton* _LOGOS_SELF_CONST, SEL, id, id); 

 

static void _logos_method$Music$MusicApplicationPlayButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Music$MusicApplicationPlayButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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



 

static void _logos_method$Music$_TtCC16MusicApplication32NowPlayingControlsViewController12VolumeSlider$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL _TtCC16MusicApplication32NowPlayingControlsViewController12VolumeSlider* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Music$_TtCC16MusicApplication32NowPlayingControlsViewController12VolumeSlider$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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



 

static void _logos_method$Music$MusicApplicationContextualActionsButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Music$MusicApplicationContextualActionsButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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



 

static void _logos_method$Music$MusicApplicationTimeSlider$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Music$MusicApplicationTimeSlider$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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



 

static void _logos_method$Music$MusicApplicationSongCell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Music$MusicApplicationSongCell$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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



 

static void _logos_method$Music$_TtCC16MusicApplication30LibraryMenuTableViewController4Cell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL _TtCC16MusicApplication30LibraryMenuTableViewController4Cell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Music$_TtCC16MusicApplication30LibraryMenuTableViewController4Cell$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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



 

static void _logos_method$Music$MusicApplicationAlbumCell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Music$MusicApplicationAlbumCell$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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



 

static void _logos_method$Music$MPRouteButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL MPRouteButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Music$MPRouteButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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



 

static void _logos_method$Music$MPButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL MPButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Music$MPButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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





static void (*_logos_orig$Calculator$CalculatorApplicationKeyPadButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Calculator$CalculatorApplicationKeyPadButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); 

 

static void _logos_method$Calculator$CalculatorApplicationKeyPadButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Calculator$CalculatorApplicationKeyPadButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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





static void (*_logos_orig$Sileo$SileoSourcesCell$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Sileo$SileoSourcesCell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Sileo$SileoPackageCollectionViewCell$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Sileo$SileoPackageCollectionViewCell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Sileo$SileoTableViewCell$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Sileo$SileoTableViewCell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Sileo$SileoFeaturedBannerView$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Sileo$SileoFeaturedBannerView$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Sileo$SileoConfirmDownloadButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Sileo$SileoConfirmDownloadButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); 

 

static void _logos_method$Sileo$SileoSourcesCell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Sileo$SileoSourcesCell$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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



 

static void _logos_method$Sileo$SileoPackageCollectionViewCell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Sileo$SileoPackageCollectionViewCell$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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



 

static void _logos_method$Sileo$SileoTableViewCell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Sileo$SileoTableViewCell$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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



 

static void _logos_method$Sileo$SileoFeaturedBannerView$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Sileo$SileoFeaturedBannerView$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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



 

static void _logos_method$Sileo$SileoConfirmDownloadButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Sileo$SileoConfirmDownloadButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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





static void (*_logos_orig$Apollo$JumpBar$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Apollo$JumpBar$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Apollo$ApolloFloatingActionButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Apollo$ApolloFloatingActionButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Apollo$_ASDisplayView$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL _ASDisplayView* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Apollo$_ASDisplayView$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL _ASDisplayView* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Apollo$UIButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL UIButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Apollo$UIButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL UIButton* _LOGOS_SELF_CONST, SEL, id, id); 



static void _logos_method$Apollo$JumpBar$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Apollo$JumpBar$touchesBegan$withEvent$(self, _cmd, arg1, arg2);
	
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





static void _logos_method$Apollo$ApolloFloatingActionButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Apollo$ApolloFloatingActionButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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





static void _logos_method$Apollo$_ASDisplayView$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL _ASDisplayView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Apollo$_ASDisplayView$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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





static void _logos_method$Apollo$UIButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL UIButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Apollo$UIButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

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





static void (*_logos_orig$RoseIntegrityFail$SBIconController$viewDidAppear$)(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$RoseIntegrityFail$SBIconController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST, SEL, BOOL); 



static void _logos_method$RoseIntegrityFail$SBIconController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL animated) {

    _logos_orig$RoseIntegrityFail$SBIconController$viewDidAppear$(self, _cmd, animated); 
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




	
static __attribute__((constructor)) void _logosLocalCtor_397e789e(int __unused argc, char __unused **argv, char __unused **envp) {

	if (![NSProcessInfo processInfo]) return;
    NSString *processName = [NSProcessInfo processInfo].processName;
    bool isSpringboard = [@"SpringBoard" isEqualToString:processName];

    
    
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
        {Class _logos_class$RoseIntegrityFail$SBIconController = objc_getClass("SBIconController"); MSHookMessageEx(_logos_class$RoseIntegrityFail$SBIconController, @selector(viewDidAppear:), (IMP)&_logos_method$RoseIntegrityFail$SBIconController$viewDidAppear$, (IMP*)&_logos_orig$RoseIntegrityFail$SBIconController$viewDidAppear$);}
        return;

    }

    pfs = [[HBPreferences alloc] initWithIdentifier:@"sh.litten.rosepreferences"];
	

	if (!dpkgInvalid && enabled) {
        BOOL ok = false;
        
        ok = ([[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithFormat:@"/var/lib/dpkg/info/%@%@%@%@%@%@%@%@%@.rose.md5sums", @"s", @"h", @".", @"l", @"i", @"t", @"t", @"e", @"n"]]
        );

        if (ok && [@"litten" isEqualToString:@"litten"]) {
            {Class _logos_class$Rose$SpringBoard = objc_getClass("SpringBoard"); MSHookMessageEx(_logos_class$Rose$SpringBoard, @selector(applicationDidFinishLaunching:), (IMP)&_logos_method$Rose$SpringBoard$applicationDidFinishLaunching$, (IMP*)&_logos_orig$Rose$SpringBoard$applicationDidFinishLaunching$);MSHookMessageEx(_logos_class$Rose$SpringBoard, @selector(_ringerChanged:), (IMP)&_logos_method$Rose$SpringBoard$_ringerChanged$, (IMP*)&_logos_orig$Rose$SpringBoard$_ringerChanged$);MSHookMessageEx(_logos_class$Rose$SpringBoard, @selector(_handlePhysicalButtonEvent:), (IMP)&_logos_method$Rose$SpringBoard$_handlePhysicalButtonEvent$, (IMP*)&_logos_orig$Rose$SpringBoard$_handlePhysicalButtonEvent$);Class _logos_class$Rose$SBCoverSheetPrimarySlidingViewController = objc_getClass("SBCoverSheetPrimarySlidingViewController"); MSHookMessageEx(_logos_class$Rose$SBCoverSheetPrimarySlidingViewController, @selector(viewWillDisappear:), (IMP)&_logos_method$Rose$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$, (IMP*)&_logos_orig$Rose$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$);MSHookMessageEx(_logos_class$Rose$SBCoverSheetPrimarySlidingViewController, @selector(viewDidAppear:), (IMP)&_logos_method$Rose$SBCoverSheetPrimarySlidingViewController$viewDidAppear$, (IMP*)&_logos_orig$Rose$SBCoverSheetPrimarySlidingViewController$viewDidAppear$);Class _logos_class$Rose$SBSleepWakeHardwareButtonInteraction = objc_getClass("SBSleepWakeHardwareButtonInteraction"); MSHookMessageEx(_logos_class$Rose$SBSleepWakeHardwareButtonInteraction, @selector(_playLockSound), (IMP)&_logos_method$Rose$SBSleepWakeHardwareButtonInteraction$_playLockSound, (IMP*)&_logos_orig$Rose$SBSleepWakeHardwareButtonInteraction$_playLockSound);MSHookMessageEx(_logos_class$Rose$SBSleepWakeHardwareButtonInteraction, @selector(consumeInitialPressDown), (IMP)&_logos_method$Rose$SBSleepWakeHardwareButtonInteraction$consumeInitialPressDown, (IMP*)&_logos_orig$Rose$SBSleepWakeHardwareButtonInteraction$consumeInitialPressDown);Class _logos_class$Rose$VolumeControl = objc_getClass("VolumeControl"); MSHookMessageEx(_logos_class$Rose$VolumeControl, @selector(increaseVolume), (IMP)&_logos_method$Rose$VolumeControl$increaseVolume, (IMP*)&_logos_orig$Rose$VolumeControl$increaseVolume);MSHookMessageEx(_logos_class$Rose$VolumeControl, @selector(decreaseVolume), (IMP)&_logos_method$Rose$VolumeControl$decreaseVolume, (IMP*)&_logos_orig$Rose$VolumeControl$decreaseVolume);Class _logos_class$Rose$SBVolumeControl = objc_getClass("SBVolumeControl"); MSHookMessageEx(_logos_class$Rose$SBVolumeControl, @selector(increaseVolume), (IMP)&_logos_method$Rose$SBVolumeControl$increaseVolume, (IMP*)&_logos_orig$Rose$SBVolumeControl$increaseVolume);MSHookMessageEx(_logos_class$Rose$SBVolumeControl, @selector(decreaseVolume), (IMP)&_logos_method$Rose$SBVolumeControl$decreaseVolume, (IMP*)&_logos_orig$Rose$SBVolumeControl$decreaseVolume);Class _logos_class$Rose$SBPowerDownController = objc_getClass("SBPowerDownController"); MSHookMessageEx(_logos_class$Rose$SBPowerDownController, @selector(orderFront), (IMP)&_logos_method$Rose$SBPowerDownController$orderFront, (IMP*)&_logos_orig$Rose$SBPowerDownController$orderFront);Class _logos_class$Rose$SBPowerDownViewController = objc_getClass("SBPowerDownViewController"); MSHookMessageEx(_logos_class$Rose$SBPowerDownViewController, @selector(viewWillAppear:), (IMP)&_logos_method$Rose$SBPowerDownViewController$viewWillAppear$, (IMP*)&_logos_orig$Rose$SBPowerDownViewController$viewWillAppear$);Class _logos_class$Rose$SBMainDisplaySceneManager = objc_getClass("SBMainDisplaySceneManager"); MSHookMessageEx(_logos_class$Rose$SBMainDisplaySceneManager, @selector(_appKilledInAppSwitcher:), (IMP)&_logos_method$Rose$SBMainDisplaySceneManager$_appKilledInAppSwitcher$, (IMP*)&_logos_orig$Rose$SBMainDisplaySceneManager$_appKilledInAppSwitcher$);Class _logos_class$Rose$SBApplication = objc_getClass("SBApplication"); MSHookMessageEx(_logos_class$Rose$SBApplication, @selector(_didExitWithContext:), (IMP)&_logos_method$Rose$SBApplication$_didExitWithContext$, (IMP*)&_logos_orig$Rose$SBApplication$_didExitWithContext$);Class _logos_class$Rose$SBUIIconForceTouchController = objc_getClass("SBUIIconForceTouchController"); MSHookMessageEx(_logos_class$Rose$SBUIIconForceTouchController, @selector(iconForceTouchViewControllerWillDismiss:), (IMP)&_logos_method$Rose$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$, (IMP*)&_logos_orig$Rose$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$);Class _logos_class$Rose$SBUIController = objc_getClass("SBUIController"); MSHookMessageEx(_logos_class$Rose$SBUIController, @selector(ACPowerChanged), (IMP)&_logos_method$Rose$SBUIController$ACPowerChanged, (IMP*)&_logos_orig$Rose$SBUIController$ACPowerChanged);MSHookMessageEx(_logos_class$Rose$SBUIController, @selector(handleWillBeginReachabilityAnimation), (IMP)&_logos_method$Rose$SBUIController$handleWillBeginReachabilityAnimation, (IMP*)&_logos_orig$Rose$SBUIController$handleWillBeginReachabilityAnimation);Class _logos_class$Rose$SBAppSwitcherPageView = objc_getClass("SBAppSwitcherPageView"); MSHookMessageEx(_logos_class$Rose$SBAppSwitcherPageView, @selector(setVisible:), (IMP)&_logos_method$Rose$SBAppSwitcherPageView$setVisible$, (IMP*)&_logos_orig$Rose$SBAppSwitcherPageView$setVisible$);Class _logos_class$Rose$SiriUISiriStatusView = objc_getClass("SiriUISiriStatusView"); MSHookMessageEx(_logos_class$Rose$SiriUISiriStatusView, @selector(didMoveToWindow), (IMP)&_logos_method$Rose$SiriUISiriStatusView$didMoveToWindow, (IMP*)&_logos_orig$Rose$SiriUISiriStatusView$didMoveToWindow);Class _logos_class$Rose$CCUILabeledRoundButton = objc_getClass("CCUILabeledRoundButton"); MSHookMessageEx(_logos_class$Rose$CCUILabeledRoundButton, @selector(buttonTapped:), (IMP)&_logos_method$Rose$CCUILabeledRoundButton$buttonTapped$, (IMP*)&_logos_orig$Rose$CCUILabeledRoundButton$buttonTapped$);Class _logos_class$Rose$SBFolderController = objc_getClass("SBFolderController"); MSHookMessageEx(_logos_class$Rose$SBFolderController, @selector(folderControllerWillOpen:), (IMP)&_logos_method$Rose$SBFolderController$folderControllerWillOpen$, (IMP*)&_logos_orig$Rose$SBFolderController$folderControllerWillOpen$);MSHookMessageEx(_logos_class$Rose$SBFolderController, @selector(folderControllerWillClose:), (IMP)&_logos_method$Rose$SBFolderController$folderControllerWillClose$, (IMP*)&_logos_orig$Rose$SBFolderController$folderControllerWillClose$);Class _logos_class$Rose$SBIconController = objc_getClass("SBIconController"); MSHookMessageEx(_logos_class$Rose$SBIconController, @selector(viewWillAppear:), (IMP)&_logos_method$Rose$SBIconController$viewWillAppear$, (IMP*)&_logos_orig$Rose$SBIconController$viewWillAppear$);MSHookMessageEx(_logos_class$Rose$SBIconController, @selector(iconTapped:), (IMP)&_logos_method$Rose$SBIconController$iconTapped$, (IMP*)&_logos_orig$Rose$SBIconController$iconTapped$);Class _logos_class$Rose$SBHIconManager = objc_getClass("SBHIconManager"); MSHookMessageEx(_logos_class$Rose$SBHIconManager, @selector(iconTapped:), (IMP)&_logos_method$Rose$SBHIconManager$iconTapped$, (IMP*)&_logos_orig$Rose$SBHIconManager$iconTapped$);Class _logos_class$Rose$SBFolderView = objc_getClass("SBFolderView"); MSHookMessageEx(_logos_class$Rose$SBFolderView, @selector(scrollViewWillBeginDragging:), (IMP)&_logos_method$Rose$SBFolderView$scrollViewWillBeginDragging$, (IMP*)&_logos_orig$Rose$SBFolderView$scrollViewWillBeginDragging$);Class _logos_class$Rose$SSScreenCapturer = objc_getClass("SSScreenCapturer"); Class _logos_metaclass$Rose$SSScreenCapturer = object_getClass(_logos_class$Rose$SSScreenCapturer); MSHookMessageEx(_logos_metaclass$Rose$SSScreenCapturer, @selector(playScreenshotSound), (IMP)&_logos_meta_method$Rose$SSScreenCapturer$playScreenshotSound, (IMP*)&_logos_meta_orig$Rose$SSScreenCapturer$playScreenshotSound);Class _logos_class$Rose$SBUIPasscodeLockViewBase = objc_getClass("SBUIPasscodeLockViewBase"); MSHookMessageEx(_logos_class$Rose$SBUIPasscodeLockViewBase, @selector(_sendDelegateKeypadKeyDown), (IMP)&_logos_method$Rose$SBUIPasscodeLockViewBase$_sendDelegateKeypadKeyDown, (IMP*)&_logos_orig$Rose$SBUIPasscodeLockViewBase$_sendDelegateKeypadKeyDown);Class _logos_class$Rose$UIKeyboardLayoutStar = objc_getClass("UIKeyboardLayoutStar"); MSHookMessageEx(_logos_class$Rose$UIKeyboardLayoutStar, @selector(playKeyClickSoundOnDownForKey:), (IMP)&_logos_method$Rose$UIKeyboardLayoutStar$playKeyClickSoundOnDownForKey$, (IMP*)&_logos_orig$Rose$UIKeyboardLayoutStar$playKeyClickSoundOnDownForKey$);Class _logos_class$Rose$UICalloutBar = objc_getClass("UICalloutBar"); MSHookMessageEx(_logos_class$Rose$UICalloutBar, @selector(buttonPressed:), (IMP)&_logos_method$Rose$UICalloutBar$buttonPressed$, (IMP*)&_logos_orig$Rose$UICalloutBar$buttonPressed$);Class _logos_class$Rose$SBSearchScrollView = objc_getClass("SBSearchScrollView"); MSHookMessageEx(_logos_class$Rose$SBSearchScrollView, @selector(gestureRecognizerShouldBegin:), (IMP)&_logos_method$Rose$SBSearchScrollView$gestureRecognizerShouldBegin$, (IMP*)&_logos_orig$Rose$SBSearchScrollView$gestureRecognizerShouldBegin$);Class _logos_class$Rose$ICSApplicationDelegate = objc_getClass("ICSApplicationDelegate"); MSHookMessageEx(_logos_class$Rose$ICSApplicationDelegate, @selector(audioCallStatusChanged:), (IMP)&_logos_method$Rose$ICSApplicationDelegate$audioCallStatusChanged$, (IMP*)&_logos_orig$Rose$ICSApplicationDelegate$audioCallStatusChanged$);Class _logos_class$Rose$SBDashBoardViewController = objc_getClass("SBDashBoardViewController"); MSHookMessageEx(_logos_class$Rose$SBDashBoardViewController, @selector(setAuthenticated:), (IMP)&_logos_method$Rose$SBDashBoardViewController$setAuthenticated$, (IMP*)&_logos_orig$Rose$SBDashBoardViewController$setAuthenticated$);Class _logos_class$Rose$SBDashBoardLockScreenEnvironment = objc_getClass("SBDashBoardLockScreenEnvironment"); MSHookMessageEx(_logos_class$Rose$SBDashBoardLockScreenEnvironment, @selector(setAuthenticated:), (IMP)&_logos_method$Rose$SBDashBoardLockScreenEnvironment$setAuthenticated$, (IMP*)&_logos_orig$Rose$SBDashBoardLockScreenEnvironment$setAuthenticated$);Class _logos_class$Rose$SBBacklightController = objc_getClass("SBBacklightController"); MSHookMessageEx(_logos_class$Rose$SBBacklightController, @selector(turnOnScreenFullyWithBacklightSource:), (IMP)&_logos_method$Rose$SBBacklightController$turnOnScreenFullyWithBacklightSource$, (IMP*)&_logos_orig$Rose$SBBacklightController$turnOnScreenFullyWithBacklightSource$);Class _logos_class$Rose$UIWindow = objc_getClass("UIWindow"); MSHookMessageEx(_logos_class$Rose$UIWindow, @selector(_shouldHitTestEntireScreen), (IMP)&_logos_method$Rose$UIWindow$_shouldHitTestEntireScreen, (IMP*)&_logos_orig$Rose$UIWindow$_shouldHitTestEntireScreen);Class _logos_class$Rose$SBControlCenterController = objc_getClass("SBControlCenterController"); MSHookMessageEx(_logos_class$Rose$SBControlCenterController, @selector(_willPresent), (IMP)&_logos_method$Rose$SBControlCenterController$_willPresent, (IMP*)&_logos_orig$Rose$SBControlCenterController$_willPresent);Class _logos_class$Rose$CCUIToggleViewController = objc_getClass("CCUIToggleViewController"); MSHookMessageEx(_logos_class$Rose$CCUIToggleViewController, @selector(buttonTapped:forEvent:), (IMP)&_logos_method$Rose$CCUIToggleViewController$buttonTapped$forEvent$, (IMP*)&_logos_orig$Rose$CCUIToggleViewController$buttonTapped$forEvent$);Class _logos_class$Rose$CSQuickActionsButton = objc_getClass("CSQuickActionsButton"); MSHookMessageEx(_logos_class$Rose$CSQuickActionsButton, @selector(setSelected:), (IMP)&_logos_method$Rose$CSQuickActionsButton$setSelected$, (IMP*)&_logos_orig$Rose$CSQuickActionsButton$setSelected$);Class _logos_class$Rose$SBDashBoardQuickActionsButton = objc_getClass("SBDashBoardQuickActionsButton"); MSHookMessageEx(_logos_class$Rose$SBDashBoardQuickActionsButton, @selector(setSelected:), (IMP)&_logos_method$Rose$SBDashBoardQuickActionsButton$setSelected$, (IMP*)&_logos_orig$Rose$SBDashBoardQuickActionsButton$setSelected$);Class _logos_class$Rose$UIAlertController = objc_getClass("UIAlertController"); MSHookMessageEx(_logos_class$Rose$UIAlertController, @selector(viewWillAppear:), (IMP)&_logos_method$Rose$UIAlertController$viewWillAppear$, (IMP*)&_logos_orig$Rose$UIAlertController$viewWillAppear$);MSHookMessageEx(_logos_class$Rose$UIAlertController, @selector(viewWillDisappear:), (IMP)&_logos_method$Rose$UIAlertController$viewWillDisappear$, (IMP*)&_logos_orig$Rose$UIAlertController$viewWillDisappear$);Class _logos_class$Rose$UIButton = objc_getClass("UIButton"); MSHookMessageEx(_logos_class$Rose$UIButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$UIButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$UIButton$touchesBegan$withEvent$);Class _logos_class$Rose$_UIButtonBarButton = objc_getClass("_UIButtonBarButton"); MSHookMessageEx(_logos_class$Rose$_UIButtonBarButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$_UIButtonBarButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$_UIButtonBarButton$touchesBegan$withEvent$);Class _logos_class$Rose$UITabBarButton = objc_getClass("UITabBarButton"); MSHookMessageEx(_logos_class$Rose$UITabBarButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$UITabBarButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$UITabBarButton$touchesBegan$withEvent$);Class _logos_class$Rose$NSProcessInfo = objc_getClass("NSProcessInfo"); MSHookMessageEx(_logos_class$Rose$NSProcessInfo, @selector(isLowPowerModeEnabled), (IMP)&_logos_method$Rose$NSProcessInfo$isLowPowerModeEnabled, (IMP*)&_logos_orig$Rose$NSProcessInfo$isLowPowerModeEnabled);Class _logos_class$Rose$DNDState = objc_getClass("DNDState"); MSHookMessageEx(_logos_class$Rose$DNDState, @selector(isActive), (IMP)&_logos_method$Rose$DNDState$isActive, (IMP*)&_logos_orig$Rose$DNDState$isActive);}
			
			if (apolloSupportSwitch)
				{Class _logos_class$Apollo$JumpBar = objc_getClass("Apollo.JumpBar"); MSHookMessageEx(_logos_class$Apollo$JumpBar, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Apollo$JumpBar$touchesBegan$withEvent$, (IMP*)&_logos_orig$Apollo$JumpBar$touchesBegan$withEvent$);Class _logos_class$Apollo$ApolloFloatingActionButton = objc_getClass("Apollo.FloatingActionButton"); MSHookMessageEx(_logos_class$Apollo$ApolloFloatingActionButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Apollo$ApolloFloatingActionButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Apollo$ApolloFloatingActionButton$touchesBegan$withEvent$);Class _logos_class$Apollo$_ASDisplayView = objc_getClass("_ASDisplayView"); MSHookMessageEx(_logos_class$Apollo$_ASDisplayView, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Apollo$_ASDisplayView$touchesBegan$withEvent$, (IMP*)&_logos_orig$Apollo$_ASDisplayView$touchesBegan$withEvent$);Class _logos_class$Apollo$UIButton = objc_getClass("UIButton"); MSHookMessageEx(_logos_class$Apollo$UIButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Apollo$UIButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Apollo$UIButton$touchesBegan$withEvent$);}
			
			if (calculatorSupportSwitch)
				{Class _logos_class$Calculator$CalculatorApplicationKeyPadButton = objc_getClass("Calculator.CalculatorKeypadButton"); MSHookMessageEx(_logos_class$Calculator$CalculatorApplicationKeyPadButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Calculator$CalculatorApplicationKeyPadButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Calculator$CalculatorApplicationKeyPadButton$touchesBegan$withEvent$);}
			
			if (facebookSupportSwitch)
				{Class _logos_class$Facebook$FBTabBar = objc_getClass("FBTabBar"); MSHookMessageEx(_logos_class$Facebook$FBTabBar, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Facebook$FBTabBar$touchesBegan$withEvent$, (IMP*)&_logos_orig$Facebook$FBTabBar$touchesBegan$withEvent$);Class _logos_class$Facebook$FDSTetraPressStateAnnouncingControl = objc_getClass("FDSTetraPressStateAnnouncingControl"); MSHookMessageEx(_logos_class$Facebook$FDSTetraPressStateAnnouncingControl, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Facebook$FDSTetraPressStateAnnouncingControl$touchesBegan$withEvent$, (IMP*)&_logos_orig$Facebook$FDSTetraPressStateAnnouncingControl$touchesBegan$withEvent$);}

			if (instagramSupportSwitch)
				{Class _logos_class$Instagram$IGFeedPhotoView = objc_getClass("IGFeedPhotoView"); MSHookMessageEx(_logos_class$Instagram$IGFeedPhotoView, @selector(_onDoubleTap:), (IMP)&_logos_method$Instagram$IGFeedPhotoView$_onDoubleTap$, (IMP*)&_logos_orig$Instagram$IGFeedPhotoView$_onDoubleTap$);Class _logos_class$Instagram$IGFeedItemVideoView = objc_getClass("IGFeedItemVideoView"); MSHookMessageEx(_logos_class$Instagram$IGFeedItemVideoView, @selector(overlayViewDidDoubleTap:), (IMP)&_logos_method$Instagram$IGFeedItemVideoView$overlayViewDidDoubleTap$, (IMP*)&_logos_orig$Instagram$IGFeedItemVideoView$overlayViewDidDoubleTap$);Class _logos_class$Instagram$IGUFIButtonBarView = objc_getClass("IGUFIButtonBarView"); MSHookMessageEx(_logos_class$Instagram$IGUFIButtonBarView, @selector(_onLikeButtonPressed:), (IMP)&_logos_method$Instagram$IGUFIButtonBarView$_onLikeButtonPressed$, (IMP*)&_logos_orig$Instagram$IGUFIButtonBarView$_onLikeButtonPressed$);MSHookMessageEx(_logos_class$Instagram$IGUFIButtonBarView, @selector(_onCommentButtonPressed:), (IMP)&_logos_method$Instagram$IGUFIButtonBarView$_onCommentButtonPressed$, (IMP*)&_logos_orig$Instagram$IGUFIButtonBarView$_onCommentButtonPressed$);MSHookMessageEx(_logos_class$Instagram$IGUFIButtonBarView, @selector(_onSaveButtonLongPressed:), (IMP)&_logos_method$Instagram$IGUFIButtonBarView$_onSaveButtonLongPressed$, (IMP*)&_logos_orig$Instagram$IGUFIButtonBarView$_onSaveButtonLongPressed$);MSHookMessageEx(_logos_class$Instagram$IGUFIButtonBarView, @selector(_onSaveButtonPressed:), (IMP)&_logos_method$Instagram$IGUFIButtonBarView$_onSaveButtonPressed$, (IMP*)&_logos_orig$Instagram$IGUFIButtonBarView$_onSaveButtonPressed$);MSHookMessageEx(_logos_class$Instagram$IGUFIButtonBarView, @selector(_onSendButtonPressed:), (IMP)&_logos_method$Instagram$IGUFIButtonBarView$_onSendButtonPressed$, (IMP*)&_logos_orig$Instagram$IGUFIButtonBarView$_onSendButtonPressed$);}

			if (musicSupportSwitch)
				{Class _logos_class$Music$MusicApplicationPlayButton = objc_getClass("MusicApplication.NowPlayingTransportButton"); MSHookMessageEx(_logos_class$Music$MusicApplicationPlayButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Music$MusicApplicationPlayButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Music$MusicApplicationPlayButton$touchesBegan$withEvent$);Class _logos_class$Music$_TtCC16MusicApplication32NowPlayingControlsViewController12VolumeSlider = objc_getClass("_TtCC16MusicApplication32NowPlayingControlsViewController12VolumeSlider"); MSHookMessageEx(_logos_class$Music$_TtCC16MusicApplication32NowPlayingControlsViewController12VolumeSlider, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Music$_TtCC16MusicApplication32NowPlayingControlsViewController12VolumeSlider$touchesBegan$withEvent$, (IMP*)&_logos_orig$Music$_TtCC16MusicApplication32NowPlayingControlsViewController12VolumeSlider$touchesBegan$withEvent$);Class _logos_class$Music$MusicApplicationContextualActionsButton = objc_getClass("MusicApplication.ContextualActionsButton"); MSHookMessageEx(_logos_class$Music$MusicApplicationContextualActionsButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Music$MusicApplicationContextualActionsButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Music$MusicApplicationContextualActionsButton$touchesBegan$withEvent$);Class _logos_class$Music$MusicApplicationTimeSlider = objc_getClass("MusicApplication.PlayerTimeControl"); MSHookMessageEx(_logos_class$Music$MusicApplicationTimeSlider, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Music$MusicApplicationTimeSlider$touchesBegan$withEvent$, (IMP*)&_logos_orig$Music$MusicApplicationTimeSlider$touchesBegan$withEvent$);Class _logos_class$Music$MusicApplicationSongCell = objc_getClass("MusicApplication.SongCell"); MSHookMessageEx(_logos_class$Music$MusicApplicationSongCell, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Music$MusicApplicationSongCell$touchesBegan$withEvent$, (IMP*)&_logos_orig$Music$MusicApplicationSongCell$touchesBegan$withEvent$);Class _logos_class$Music$_TtCC16MusicApplication30LibraryMenuTableViewController4Cell = objc_getClass("_TtCC16MusicApplication30LibraryMenuTableViewController4Cell"); MSHookMessageEx(_logos_class$Music$_TtCC16MusicApplication30LibraryMenuTableViewController4Cell, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Music$_TtCC16MusicApplication30LibraryMenuTableViewController4Cell$touchesBegan$withEvent$, (IMP*)&_logos_orig$Music$_TtCC16MusicApplication30LibraryMenuTableViewController4Cell$touchesBegan$withEvent$);Class _logos_class$Music$MusicApplicationAlbumCell = objc_getClass("MusicApplication.AlbumCell"); MSHookMessageEx(_logos_class$Music$MusicApplicationAlbumCell, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Music$MusicApplicationAlbumCell$touchesBegan$withEvent$, (IMP*)&_logos_orig$Music$MusicApplicationAlbumCell$touchesBegan$withEvent$);Class _logos_class$Music$MPRouteButton = objc_getClass("MPRouteButton"); MSHookMessageEx(_logos_class$Music$MPRouteButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Music$MPRouteButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Music$MPRouteButton$touchesBegan$withEvent$);Class _logos_class$Music$MPButton = objc_getClass("MPButton"); MSHookMessageEx(_logos_class$Music$MPButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Music$MPButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Music$MPButton$touchesBegan$withEvent$);}
            
			if (phoneSupportSwitch) 
				{Class _logos_class$Phone$PHHandsetDialerNumberPadButton = objc_getClass("PHHandsetDialerNumberPadButton"); MSHookMessageEx(_logos_class$Phone$PHHandsetDialerNumberPadButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Phone$PHHandsetDialerNumberPadButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Phone$PHHandsetDialerNumberPadButton$touchesBegan$withEvent$);Class _logos_class$Phone$CNContactListTableViewCell = objc_getClass("CNContactListTableViewCell"); MSHookMessageEx(_logos_class$Phone$CNContactListTableViewCell, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Phone$CNContactListTableViewCell$touchesBegan$withEvent$, (IMP*)&_logos_orig$Phone$CNContactListTableViewCell$touchesBegan$withEvent$);Class _logos_class$Phone$PHHandsetDialerDeleteButton = objc_getClass("PHHandsetDialerDeleteButton"); MSHookMessageEx(_logos_class$Phone$PHHandsetDialerDeleteButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Phone$PHHandsetDialerDeleteButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Phone$PHHandsetDialerDeleteButton$touchesBegan$withEvent$);Class _logos_class$Phone$PHBottomBarButton = objc_getClass("PHBottomBarButton"); MSHookMessageEx(_logos_class$Phone$PHBottomBarButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Phone$PHBottomBarButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Phone$PHBottomBarButton$touchesBegan$withEvent$);}

			if (safariSupportSwitch)
				{Class _logos_class$Safari$_SFNavigationBarURLButton = objc_getClass("_SFNavigationBarURLButton"); MSHookMessageEx(_logos_class$Safari$_SFNavigationBarURLButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Safari$_SFNavigationBarURLButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Safari$_SFNavigationBarURLButton$touchesBegan$withEvent$);}

			if (sileoSupportSwitch)
				{Class _logos_class$Sileo$SileoSourcesCell = objc_getClass("Sileo.SourcesTableViewCell"); MSHookMessageEx(_logos_class$Sileo$SileoSourcesCell, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Sileo$SileoSourcesCell$touchesBegan$withEvent$, (IMP*)&_logos_orig$Sileo$SileoSourcesCell$touchesBegan$withEvent$);Class _logos_class$Sileo$SileoPackageCollectionViewCell = objc_getClass("Sileo.PackageCollectionViewCell"); MSHookMessageEx(_logos_class$Sileo$SileoPackageCollectionViewCell, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Sileo$SileoPackageCollectionViewCell$touchesBegan$withEvent$, (IMP*)&_logos_orig$Sileo$SileoPackageCollectionViewCell$touchesBegan$withEvent$);Class _logos_class$Sileo$SileoTableViewCell = objc_getClass("Sileo.SileoTableViewCell"); MSHookMessageEx(_logos_class$Sileo$SileoTableViewCell, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Sileo$SileoTableViewCell$touchesBegan$withEvent$, (IMP*)&_logos_orig$Sileo$SileoTableViewCell$touchesBegan$withEvent$);Class _logos_class$Sileo$SileoFeaturedBannerView = objc_getClass("Sileo.FeaturedBannerView"); MSHookMessageEx(_logos_class$Sileo$SileoFeaturedBannerView, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Sileo$SileoFeaturedBannerView$touchesBegan$withEvent$, (IMP*)&_logos_orig$Sileo$SileoFeaturedBannerView$touchesBegan$withEvent$);Class _logos_class$Sileo$SileoConfirmDownloadButton = objc_getClass("Sileo.DownloadConfirmButton"); MSHookMessageEx(_logos_class$Sileo$SileoConfirmDownloadButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Sileo$SileoConfirmDownloadButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Sileo$SileoConfirmDownloadButton$touchesBegan$withEvent$);}

			if (spotifySupportSwitch)
				{Class _logos_class$Spotify$SPTNowPlayingPlayButtonV2 = objc_getClass("SPTNowPlayingPlayButtonV2"); MSHookMessageEx(_logos_class$Spotify$SPTNowPlayingPlayButtonV2, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Spotify$SPTNowPlayingPlayButtonV2$touchesBegan$withEvent$, (IMP*)&_logos_orig$Spotify$SPTNowPlayingPlayButtonV2$touchesBegan$withEvent$);Class _logos_class$Spotify$SPTNowPlayingPreviousTrackButton = objc_getClass("SPTNowPlayingPreviousTrackButton"); MSHookMessageEx(_logos_class$Spotify$SPTNowPlayingPreviousTrackButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Spotify$SPTNowPlayingPreviousTrackButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Spotify$SPTNowPlayingPreviousTrackButton$touchesBegan$withEvent$);Class _logos_class$Spotify$SPTNowPlayingNextTrackButton = objc_getClass("SPTNowPlayingNextTrackButton"); MSHookMessageEx(_logos_class$Spotify$SPTNowPlayingNextTrackButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Spotify$SPTNowPlayingNextTrackButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Spotify$SPTNowPlayingNextTrackButton$touchesBegan$withEvent$);Class _logos_class$Spotify$SPTNowPlayingRepeatButton = objc_getClass("SPTNowPlayingRepeatButton"); MSHookMessageEx(_logos_class$Spotify$SPTNowPlayingRepeatButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Spotify$SPTNowPlayingRepeatButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Spotify$SPTNowPlayingRepeatButton$touchesBegan$withEvent$);Class _logos_class$Spotify$SPTNowPlayingShuffleButton = objc_getClass("SPTNowPlayingShuffleButton"); MSHookMessageEx(_logos_class$Spotify$SPTNowPlayingShuffleButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Spotify$SPTNowPlayingShuffleButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Spotify$SPTNowPlayingShuffleButton$touchesBegan$withEvent$);Class _logos_class$Spotify$SPTNowPlayingQueueButton = objc_getClass("SPTNowPlayingQueueButton"); MSHookMessageEx(_logos_class$Spotify$SPTNowPlayingQueueButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Spotify$SPTNowPlayingQueueButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Spotify$SPTNowPlayingQueueButton$touchesBegan$withEvent$);Class _logos_class$Spotify$SPTNowPlayingSliderV2 = objc_getClass("SPTNowPlayingSliderV2"); MSHookMessageEx(_logos_class$Spotify$SPTNowPlayingSliderV2, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Spotify$SPTNowPlayingSliderV2$touchesBegan$withEvent$, (IMP*)&_logos_orig$Spotify$SPTNowPlayingSliderV2$touchesBegan$withEvent$);Class _logos_class$Spotify$SPTNowPlayingFreeTierFeedbackButton = objc_getClass("SPTNowPlayingFreeTierFeedbackButton"); MSHookMessageEx(_logos_class$Spotify$SPTNowPlayingFreeTierFeedbackButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Spotify$SPTNowPlayingFreeTierFeedbackButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Spotify$SPTNowPlayingFreeTierFeedbackButton$touchesBegan$withEvent$);Class _logos_class$Spotify$SPTGaiaDevicesAvailableViewImplementation = objc_getClass("SPTGaiaDevicesAvailableViewImplementation"); MSHookMessageEx(_logos_class$Spotify$SPTGaiaDevicesAvailableViewImplementation, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Spotify$SPTGaiaDevicesAvailableViewImplementation$touchesBegan$withEvent$, (IMP*)&_logos_orig$Spotify$SPTGaiaDevicesAvailableViewImplementation$touchesBegan$withEvent$);Class _logos_class$Spotify$SPTNowPlayingMarqueeLabel = objc_getClass("SPTNowPlayingMarqueeLabel"); MSHookMessageEx(_logos_class$Spotify$SPTNowPlayingMarqueeLabel, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Spotify$SPTNowPlayingMarqueeLabel$touchesBegan$withEvent$, (IMP*)&_logos_orig$Spotify$SPTNowPlayingMarqueeLabel$touchesBegan$withEvent$);Class _logos_class$Spotify$SPTNowPlayingBarPlayButton = objc_getClass("SPTNowPlayingBarPlayButton"); MSHookMessageEx(_logos_class$Spotify$SPTNowPlayingBarPlayButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Spotify$SPTNowPlayingBarPlayButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Spotify$SPTNowPlayingBarPlayButton$touchesBegan$withEvent$);}

			if (tiktokSupportSwitch)
				{Class _logos_class$TikTok$AWEFeedVideoButton = objc_getClass("AWEFeedVideoButton"); MSHookMessageEx(_logos_class$TikTok$AWEFeedVideoButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$TikTok$AWEFeedVideoButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$TikTok$AWEFeedVideoButton$touchesBegan$withEvent$);}

			if (twitterSupportSwitch)
				{Class _logos_class$Twitter$TFNCustomTabBar = objc_getClass("TFNCustomTabBar"); MSHookMessageEx(_logos_class$Twitter$TFNCustomTabBar, @selector(tap:), (IMP)&_logos_method$Twitter$TFNCustomTabBar$tap$, (IMP*)&_logos_orig$Twitter$TFNCustomTabBar$tap$);Class _logos_class$Twitter$T1StandardStatusView = objc_getClass("T1StandardStatusView"); MSHookMessageEx(_logos_class$Twitter$T1StandardStatusView, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Twitter$T1StandardStatusView$touchesBegan$withEvent$, (IMP*)&_logos_orig$Twitter$T1StandardStatusView$touchesBegan$withEvent$);Class _logos_class$Twitter$T1DirectMessageInboxSummaryView = objc_getClass("T1DirectMessageInboxSummaryView"); MSHookMessageEx(_logos_class$Twitter$T1DirectMessageInboxSummaryView, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Twitter$T1DirectMessageInboxSummaryView$touchesBegan$withEvent$, (IMP*)&_logos_orig$Twitter$T1DirectMessageInboxSummaryView$touchesBegan$withEvent$);Class _logos_class$Twitter$T1ActivityCell = objc_getClass("T1ActivityCell"); MSHookMessageEx(_logos_class$Twitter$T1ActivityCell, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Twitter$T1ActivityCell$touchesBegan$withEvent$, (IMP*)&_logos_orig$Twitter$T1ActivityCell$touchesBegan$withEvent$);Class _logos_class$Twitter$TFNFloatingActionButton = objc_getClass("TFNFloatingActionButton"); MSHookMessageEx(_logos_class$Twitter$TFNFloatingActionButton, @selector(_tfn_expandingButtonAction:), (IMP)&_logos_method$Twitter$TFNFloatingActionButton$_tfn_expandingButtonAction$, (IMP*)&_logos_orig$Twitter$TFNFloatingActionButton$_tfn_expandingButtonAction$);}

			return;

        } else {
            dpkgInvalid = YES;

        }

    }

}
