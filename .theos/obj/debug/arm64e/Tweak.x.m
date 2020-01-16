#line 1 "Tweak.x"
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

@class SBFolderView; @class SBIconController; @class UICalloutBar; @class SBHIconManager; @class SPTGaiaDevicesAvailableViewImplementation; @class PHBottomBarButton; @class _TtCC16MusicApplication30LibraryMenuTableViewController4Cell; @class UIButton; @class VolumeControl; @class MPButton; @class SPTNowPlayingShuffleButton; @class _UIButtonBarButton; @class UIStackView; @class SSScreenCapturer; @class SBSearchScrollView; @class MPRouteButton; @class SBSleepWakeHardwareButtonInteraction; @class PHHandsetDialerDeleteButton; @class SBCoverSheetPrimarySlidingViewController; @class SBUIController; @class FBTabBar; @class CCUILabeledRoundButton; @class SBApplication; @class SPTNowPlayingPlayButtonV2; @class SPTNowPlayingNextTrackButton; @class UIWindow; @class MusicApplicationPlayButton; @class SBDashBoardViewController; @class SiriUISiriStatusView; @class TFNFloatingActionButton; @class FDSTetraPressStateAnnouncingControl; @class PHHandsetDialerNumberPadButton; @class SPTNowPlayingPreviousTrackButton; @class UIVisualEffectView; @class SPTNowPlayingMarqueeLabel; @class SpringBoard; @class SBPowerDownViewController; @class TFNCustomTabBar; @class CCUIToggleViewController; @class T1ActivityCell; @class SPTNowPlayingBarPlayButton; @class SileoConfirmDownloadButton; @class SileoPackageCollectionViewCell; @class UIImageView; @class UIView; @class SBDashBoardMesaUnlockBehavior; @class UIKeyboardLayoutStar; @class AWEFeedVideoButton; @class MTMaterialView; @class T1StandardStatusView; @class MusicApplicationSongCell; @class NSProcessInfo; @class FBNavigationBarButton; @class SileoTableViewCell; @class SBFolderController; @class MusicApplicationAlbumCell; @class SBMainDisplaySceneManager; @class CNContactListTableViewCell; @class MusicApplicationContextualActionsButton; @class MusicApplicationTimeSlider; @class SBUIPasscodeLockViewBase; @class SileoSourcesCell; @class IGUFIButtonBarView; @class ICSApplicationDelegate; @class SPTNowPlayingRepeatButton; @class SPTNowPlayingSliderV2; @class _TtCC16MusicApplication32NowPlayingControlsViewController12VolumeSlider; @class T1DirectMessageInboxSummaryView; @class SBAppSwitcherPageView; @class SileoFeaturedBannerView; @class UILabel; @class CalculatorApplicationKeyPadButton; @class SBVolumeControl; @class SBUIIconForceTouchController; @class SBControlCenterController; @class SBPowerDownController; @class SPTNowPlayingQueueButton; @class SBBacklightController; @class SPTNowPlayingFreeTierFeedbackButton; @class UIKBTree; @class _SFNavigationBarURLButton; 

static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$UIKBTree(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("UIKBTree"); } return _klass; }
#line 138 "Tweak.x"
static void (*_logos_orig$Rose$SpringBoard$applicationDidFinishLaunching$)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SpringBoard$_ringerChanged$)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SpringBoard$_ringerChanged$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static BOOL (*_logos_orig$Rose$SpringBoard$_handlePhysicalButtonEvent$)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, UIPressesEvent *); static BOOL _logos_method$Rose$SpringBoard$_handlePhysicalButtonEvent$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, UIPressesEvent *); static void (*_logos_orig$Rose$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$)(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$SBCoverSheetPrimarySlidingViewController$viewDidDisappear$)(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$SBCoverSheetPrimarySlidingViewController$viewDidDisappear$(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$SBCoverSheetPrimarySlidingViewController$viewDidAppear$)(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$SBCoverSheetPrimarySlidingViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$SBSleepWakeHardwareButtonInteraction$_playLockSound)(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBSleepWakeHardwareButtonInteraction$_playLockSound(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$Rose$SBSleepWakeHardwareButtonInteraction$consumeInitialPressDown)(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$Rose$SBSleepWakeHardwareButtonInteraction$consumeInitialPressDown(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$VolumeControl$increaseVolume)(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$VolumeControl$increaseVolume(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$VolumeControl$decreaseVolume)(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$VolumeControl$decreaseVolume(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBVolumeControl$increaseVolume)(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBVolumeControl$increaseVolume(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBVolumeControl$decreaseVolume)(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBVolumeControl$decreaseVolume(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBPowerDownController$orderFront)(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBPowerDownController$orderFront(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBPowerDownViewController$viewWillAppear$)(_LOGOS_SELF_TYPE_NORMAL SBPowerDownViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$SBPowerDownViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL SBPowerDownViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$SBMainDisplaySceneManager$_appKilledInAppSwitcher$)(_LOGOS_SELF_TYPE_NORMAL SBMainDisplaySceneManager* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SBMainDisplaySceneManager$_appKilledInAppSwitcher$(_LOGOS_SELF_TYPE_NORMAL SBMainDisplaySceneManager* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SBApplication$_didExitWithContext$)(_LOGOS_SELF_TYPE_NORMAL SBApplication* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SBApplication$_didExitWithContext$(_LOGOS_SELF_TYPE_NORMAL SBApplication* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$)(_LOGOS_SELF_TYPE_NORMAL SBUIIconForceTouchController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$(_LOGOS_SELF_TYPE_NORMAL SBUIIconForceTouchController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SBUIController$ACPowerChanged)(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBUIController$ACPowerChanged(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBUIController$handleWillBeginReachabilityAnimation)(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBUIController$handleWillBeginReachabilityAnimation(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBAppSwitcherPageView$setVisible$)(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherPageView* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$SBAppSwitcherPageView$setVisible$(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherPageView* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$SiriUISiriStatusView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL SiriUISiriStatusView* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SiriUISiriStatusView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SiriUISiriStatusView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$CCUILabeledRoundButton$buttonTapped$)(_LOGOS_SELF_TYPE_NORMAL CCUILabeledRoundButton* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$CCUILabeledRoundButton$buttonTapped$(_LOGOS_SELF_TYPE_NORMAL CCUILabeledRoundButton* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SBFolderController$prepareToOpen)(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBFolderController$prepareToOpen(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBIconController$viewWillAppear$)(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$SBIconController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$SBIconController$viewDidAppear$)(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$SBIconController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$SBIconController$iconTapped$)(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SBIconController$iconTapped$(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SBIconController$_iconForceTouchControllerDidDismiss$)(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SBIconController$_iconForceTouchControllerDidDismiss$(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SBHIconManager$iconTapped$)(_LOGOS_SELF_TYPE_NORMAL SBHIconManager* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SBHIconManager$iconTapped$(_LOGOS_SELF_TYPE_NORMAL SBHIconManager* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SBFolderView$scrollViewWillBeginDragging$)(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SBFolderView$scrollViewWillBeginDragging$(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_meta_orig$Rose$SSScreenCapturer$playScreenshotSound)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void _logos_meta_method$Rose$SSScreenCapturer$playScreenshotSound(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBUIPasscodeLockViewBase$_sendDelegateKeypadKeyDown)(_LOGOS_SELF_TYPE_NORMAL SBUIPasscodeLockViewBase* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBUIPasscodeLockViewBase$_sendDelegateKeypadKeyDown(_LOGOS_SELF_TYPE_NORMAL SBUIPasscodeLockViewBase* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$UIKeyboardLayoutStar$playKeyClickSoundOnDownForKey$)(_LOGOS_SELF_TYPE_NORMAL UIKeyboardLayoutStar* _LOGOS_SELF_CONST, SEL, UIKBTree *); static void _logos_method$Rose$UIKeyboardLayoutStar$playKeyClickSoundOnDownForKey$(_LOGOS_SELF_TYPE_NORMAL UIKeyboardLayoutStar* _LOGOS_SELF_CONST, SEL, UIKBTree *); static void (*_logos_orig$Rose$UIKeyboardLayoutStar$setPlayKeyClickSoundOn$)(_LOGOS_SELF_TYPE_NORMAL UIKeyboardLayoutStar* _LOGOS_SELF_CONST, SEL, int); static void _logos_method$Rose$UIKeyboardLayoutStar$setPlayKeyClickSoundOn$(_LOGOS_SELF_TYPE_NORMAL UIKeyboardLayoutStar* _LOGOS_SELF_CONST, SEL, int); static void (*_logos_orig$Rose$UICalloutBar$buttonPressed$)(_LOGOS_SELF_TYPE_NORMAL UICalloutBar* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$UICalloutBar$buttonPressed$(_LOGOS_SELF_TYPE_NORMAL UICalloutBar* _LOGOS_SELF_CONST, SEL, id); static BOOL (*_logos_orig$Rose$SBSearchScrollView$gestureRecognizerShouldBegin$)(_LOGOS_SELF_TYPE_NORMAL SBSearchScrollView* _LOGOS_SELF_CONST, SEL, id); static BOOL _logos_method$Rose$SBSearchScrollView$gestureRecognizerShouldBegin$(_LOGOS_SELF_TYPE_NORMAL SBSearchScrollView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$ICSApplicationDelegate$audioCallStatusChanged$)(_LOGOS_SELF_TYPE_NORMAL ICSApplicationDelegate* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$ICSApplicationDelegate$audioCallStatusChanged$(_LOGOS_SELF_TYPE_NORMAL ICSApplicationDelegate* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SBDashBoardViewController$setAuthenticated$)(_LOGOS_SELF_TYPE_NORMAL SBDashBoardViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$SBDashBoardViewController$setAuthenticated$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$SBDashBoardMesaUnlockBehavior$setAuthenticated$)(_LOGOS_SELF_TYPE_NORMAL SBDashBoardMesaUnlockBehavior* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$SBDashBoardMesaUnlockBehavior$setAuthenticated$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardMesaUnlockBehavior* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$SBBacklightController$turnOnScreenFullyWithBacklightSource$)(_LOGOS_SELF_TYPE_NORMAL SBBacklightController* _LOGOS_SELF_CONST, SEL, long long); static void _logos_method$Rose$SBBacklightController$turnOnScreenFullyWithBacklightSource$(_LOGOS_SELF_TYPE_NORMAL SBBacklightController* _LOGOS_SELF_CONST, SEL, long long); static BOOL (*_logos_orig$Rose$UIWindow$_shouldHitTestEntireScreen)(_LOGOS_SELF_TYPE_NORMAL UIWindow* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$Rose$UIWindow$_shouldHitTestEntireScreen(_LOGOS_SELF_TYPE_NORMAL UIWindow* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBControlCenterController$_willPresent)(_LOGOS_SELF_TYPE_NORMAL SBControlCenterController* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBControlCenterController$_willPresent(_LOGOS_SELF_TYPE_NORMAL SBControlCenterController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$CCUIToggleViewController$buttonTapped$forEvent$)(_LOGOS_SELF_TYPE_NORMAL CCUIToggleViewController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$CCUIToggleViewController$buttonTapped$forEvent$(_LOGOS_SELF_TYPE_NORMAL CCUIToggleViewController* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$UIButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL UIButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$UIButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL UIButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$UIView$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL UIView* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$UIView$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL UIView* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$_UIButtonBarButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL _UIButtonBarButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$_UIButtonBarButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL _UIButtonBarButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$UIImageView$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL UIImageView* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$UIImageView$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL UIImageView* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$MTMaterialView$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL MTMaterialView* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$MTMaterialView$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL MTMaterialView* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$UIStackView$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL UIStackView* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$UIStackView$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL UIStackView* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$UILabel$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$UILabel$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$UIVisualEffectView$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL UIVisualEffectView* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$UIVisualEffectView$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL UIVisualEffectView* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$SPTNowPlayingPlayButtonV2$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingPlayButtonV2* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$SPTNowPlayingPlayButtonV2$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingPlayButtonV2* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$SPTNowPlayingPreviousTrackButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingPreviousTrackButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$SPTNowPlayingPreviousTrackButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingPreviousTrackButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$SPTNowPlayingNextTrackButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingNextTrackButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$SPTNowPlayingNextTrackButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingNextTrackButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$SPTNowPlayingRepeatButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingRepeatButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$SPTNowPlayingRepeatButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingRepeatButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$SPTNowPlayingShuffleButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingShuffleButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$SPTNowPlayingShuffleButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingShuffleButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$SPTNowPlayingQueueButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingQueueButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$SPTNowPlayingQueueButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingQueueButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$SPTNowPlayingSliderV2$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingSliderV2* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$SPTNowPlayingSliderV2$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingSliderV2* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$SPTNowPlayingFreeTierFeedbackButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingFreeTierFeedbackButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$SPTNowPlayingFreeTierFeedbackButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingFreeTierFeedbackButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$SPTGaiaDevicesAvailableViewImplementation$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SPTGaiaDevicesAvailableViewImplementation* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$SPTGaiaDevicesAvailableViewImplementation$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTGaiaDevicesAvailableViewImplementation* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$SPTNowPlayingMarqueeLabel$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingMarqueeLabel* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$SPTNowPlayingMarqueeLabel$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingMarqueeLabel* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$SPTNowPlayingBarPlayButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingBarPlayButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$SPTNowPlayingBarPlayButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingBarPlayButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$IGUFIButtonBarView$_onLikeButtonPressed$)(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$IGUFIButtonBarView$_onLikeButtonPressed$(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$IGUFIButtonBarView$_onCommentButtonPressed$)(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$IGUFIButtonBarView$_onCommentButtonPressed$(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$IGUFIButtonBarView$_onSaveButtonLongPressed$)(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$IGUFIButtonBarView$_onSaveButtonLongPressed$(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$IGUFIButtonBarView$_onSaveButtonPressed$)(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$IGUFIButtonBarView$_onSaveButtonPressed$(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$IGUFIButtonBarView$_onSendButtonPressed$)(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$IGUFIButtonBarView$_onSendButtonPressed$(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$AWEFeedVideoButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL AWEFeedVideoButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$AWEFeedVideoButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL AWEFeedVideoButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$TFNCustomTabBar$tap$)(_LOGOS_SELF_TYPE_NORMAL TFNCustomTabBar* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$TFNCustomTabBar$tap$(_LOGOS_SELF_TYPE_NORMAL TFNCustomTabBar* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$T1StandardStatusView$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL T1StandardStatusView* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$T1StandardStatusView$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL T1StandardStatusView* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$T1DirectMessageInboxSummaryView$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL T1DirectMessageInboxSummaryView* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$T1DirectMessageInboxSummaryView$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL T1DirectMessageInboxSummaryView* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$T1ActivityCell$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL T1ActivityCell* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$T1ActivityCell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL T1ActivityCell* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$TFNFloatingActionButton$_tfn_expandingButtonAction$)(_LOGOS_SELF_TYPE_NORMAL TFNFloatingActionButton* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$TFNFloatingActionButton$_tfn_expandingButtonAction$(_LOGOS_SELF_TYPE_NORMAL TFNFloatingActionButton* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$_SFNavigationBarURLButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL _SFNavigationBarURLButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$_SFNavigationBarURLButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL _SFNavigationBarURLButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$PHHandsetDialerNumberPadButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL PHHandsetDialerNumberPadButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$PHHandsetDialerNumberPadButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL PHHandsetDialerNumberPadButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$CNContactListTableViewCell$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL CNContactListTableViewCell* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$CNContactListTableViewCell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL CNContactListTableViewCell* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$PHHandsetDialerDeleteButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL PHHandsetDialerDeleteButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$PHHandsetDialerDeleteButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL PHHandsetDialerDeleteButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$PHBottomBarButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL PHBottomBarButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$PHBottomBarButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL PHBottomBarButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$FBTabBar$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL FBTabBar* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$FBTabBar$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL FBTabBar* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$FDSTetraPressStateAnnouncingControl$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL FDSTetraPressStateAnnouncingControl* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$FDSTetraPressStateAnnouncingControl$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL FDSTetraPressStateAnnouncingControl* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$FBNavigationBarButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL FBNavigationBarButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$FBNavigationBarButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL FBNavigationBarButton* _LOGOS_SELF_CONST, SEL, id, id); static BOOL (*_logos_orig$Rose$NSProcessInfo$isLowPowerModeEnabled)(_LOGOS_SELF_TYPE_NORMAL NSProcessInfo* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$Rose$NSProcessInfo$isLowPowerModeEnabled(_LOGOS_SELF_TYPE_NORMAL NSProcessInfo* _LOGOS_SELF_CONST, SEL); 



static void _logos_method$Rose$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$SpringBoard$applicationDidFinishLaunching$(self, _cmd, arg1);

	int customStrength = [customStrengthRespringControl intValue];

	if (respringSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (respringSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

static void _logos_method$Rose$SpringBoard$_ringerChanged$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$SpringBoard$_ringerChanged$(self, _cmd, arg1);

	int customStrength = [customStrengthRingerControl intValue];

	if (ringerSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (ringerSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

static BOOL _logos_method$Rose$SpringBoard$_handlePhysicalButtonEvent$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIPressesEvent * arg1) {

	
	
	

	
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

	return _logos_orig$Rose$SpringBoard$_handlePhysicalButtonEvent$(self, _cmd, arg1);

}





static void _logos_method$Rose$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {

	_logos_orig$Rose$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$(self, _cmd, arg1);

	int customStrength = [customStrengthUnlockControl intValue];

	if (unlockSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (unlockSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

static void _logos_method$Rose$SBCoverSheetPrimarySlidingViewController$viewDidDisappear$(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {

    _logos_orig$Rose$SBCoverSheetPrimarySlidingViewController$viewDidDisappear$(self, _cmd, arg1); 
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

	_logos_orig$Rose$SBSleepWakeHardwareButtonInteraction$_playLockSound(self, _cmd);

	int customStrength = [customStrengthLockControl intValue];

	if (lockSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (lockSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

static BOOL _logos_method$Rose$SBSleepWakeHardwareButtonInteraction$consumeInitialPressDown(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	int customStrength = [customStrengthSleepButtonControl intValue];

	if (sleepButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (sleepButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

	return _logos_orig$Rose$SBSleepWakeHardwareButtonInteraction$consumeInitialPressDown(self, _cmd);

}





static void _logos_method$Rose$VolumeControl$increaseVolume(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$VolumeControl$increaseVolume(self, _cmd);

	int customStrength = [customStrengthVolumeControl intValue];

	if (volumeSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (volumeSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

static void _logos_method$Rose$VolumeControl$decreaseVolume(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$VolumeControl$decreaseVolume(self, _cmd);

	int customStrength = [customStrengthVolumeControl intValue];

	if (volumeSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (volumeSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$SBVolumeControl$increaseVolume(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SBVolumeControl$increaseVolume(self, _cmd);

	int customStrength = [customStrengthVolumeControl intValue];

	if (volumeSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (volumeSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

static void _logos_method$Rose$SBVolumeControl$decreaseVolume(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SBVolumeControl$decreaseVolume(self, _cmd);

	int customStrength = [customStrengthVolumeControl intValue];

	if (volumeSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (volumeSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$SBPowerDownController$orderFront(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SBPowerDownController$orderFront(self, _cmd);

	int customStrength = [customStrengthPowerDownControl intValue];

	if (powerSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (powerSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$SBPowerDownViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL SBPowerDownViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {

	_logos_orig$Rose$SBPowerDownViewController$viewWillAppear$(self, _cmd, arg1);

	int customStrength = [customStrengthPowerDownControl intValue];

	if (powerSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (powerSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$SBMainDisplaySceneManager$_appKilledInAppSwitcher$(_LOGOS_SELF_TYPE_NORMAL SBMainDisplaySceneManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$SBMainDisplaySceneManager$_appKilledInAppSwitcher$(self, _cmd, arg1);

	int customStrength = [customStrengthKillingControl intValue];

	if (killingSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (killingSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$SBApplication$_didExitWithContext$(_LOGOS_SELF_TYPE_NORMAL SBApplication* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$SBApplication$_didExitWithContext$(self, _cmd, arg1);

	int customStrength = [customStrengthKillingControl intValue];

	if (killingSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (killingSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$(_LOGOS_SELF_TYPE_NORMAL SBUIIconForceTouchController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$(self, _cmd, arg1);

	int customStrength = [customStrengthForceTouchControl intValue];

	if (forceSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (forceSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$SBUIController$ACPowerChanged(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SBUIController$ACPowerChanged(self, _cmd);

	int customStrength = [customStrengthPluggedControl intValue];

	if (pluggedSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (pluggedSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

static void _logos_method$Rose$SBUIController$handleWillBeginReachabilityAnimation(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SBUIController$handleWillBeginReachabilityAnimation(self, _cmd);

	int customStrength = [customStrengthReachabilityControl intValue];

	if (reachabilitySwitch && customStrength == 0) {
		triggerFeedback();

	} else if (reachabilitySwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$SBAppSwitcherPageView$setVisible$(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherPageView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {

	_logos_orig$Rose$SBAppSwitcherPageView$setVisible$(self, _cmd, arg1);

	int customStrength = [customStrengthSwitcherControl intValue];

	if (switcherSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (switcherSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$SiriUISiriStatusView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SiriUISiriStatusView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SiriUISiriStatusView$layoutSubviews(self, _cmd);

	int customStrength = [customStrengthSiriControl intValue];

	if (siriSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (siriSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$CCUILabeledRoundButton$buttonTapped$(_LOGOS_SELF_TYPE_NORMAL CCUILabeledRoundButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$CCUILabeledRoundButton$buttonTapped$(self, _cmd, arg1);

	int customStrength = [customStrengthCCToggleControl intValue];

	if (ccToggleSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (ccToggleSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$SBFolderController$prepareToOpen(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SBFolderController$prepareToOpen(self, _cmd);

	int customStrength = [customStrengthFolderControl intValue];

	if (folderSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (folderSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$SBIconController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {

	_logos_orig$Rose$SBIconController$viewWillAppear$(self, _cmd, arg1);

	int customStrength = [customStrengthEnterBackgroundControl intValue];

	if (enterBackgroundSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (enterBackgroundSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

static void _logos_method$Rose$SBIconController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL animated) {

	_logos_orig$Rose$SBIconController$viewDidAppear$(self, _cmd, animated);

	if (enabled && touchesSwitch && featureWarningSwitch) {
		UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Rose"
		message:@"Please consider to not using the 'feedback on every touch' feature too often, because it could harm your Haptic/Taptic Engine with very long usage. It's not my fault if something happens.\n[This alert can be turned off in Rose's settings]"
		preferredStyle:UIAlertControllerStyleAlert];

		UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Understood" style:UIAlertActionStyleCancel handler:nil];

		[alert addAction:cancelAction];

		[self presentViewController:alert animated:YES completion:nil];

	}

}

static void _logos_method$Rose$SBIconController$iconTapped$(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$SBIconController$iconTapped$(self, _cmd, arg1);

	int customStrength = [customStrengthIconTapControl intValue];

	if (iconTapSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (iconTapSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

static void _logos_method$Rose$SBIconController$_iconForceTouchControllerDidDismiss$(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$SBIconController$_iconForceTouchControllerDidDismiss$(self, _cmd, arg1);

	int customStrength = [customStrengthForceTouchControl intValue];

	if (forceSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (forceSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$SBHIconManager$iconTapped$(_LOGOS_SELF_TYPE_NORMAL SBHIconManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$SBHIconManager$iconTapped$(self, _cmd, arg1);

	int customStrength = [customStrengthIconTapControl intValue];

	if (iconTapSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (iconTapSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$SBFolderView$scrollViewWillBeginDragging$(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$SBFolderView$scrollViewWillBeginDragging$(self, _cmd, arg1);

	int customStrength = [customStrengthPageSwipeControl intValue];

	if (pageSwipeSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (pageSwipeSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_meta_method$Rose$SSScreenCapturer$playScreenshotSound(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_meta_orig$Rose$SSScreenCapturer$playScreenshotSound(self, _cmd);

	int customStrength = [customStrengthScreenshotControl intValue];

	if (screenshotSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (screenshotSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}



 

static void _logos_method$Rose$SBUIPasscodeLockViewBase$_sendDelegateKeypadKeyDown(_LOGOS_SELF_TYPE_NORMAL SBUIPasscodeLockViewBase* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SBUIPasscodeLockViewBase$_sendDelegateKeypadKeyDown(self, _cmd);

	int customStrength = [customStrengthPasscodeControl intValue];

	if (passcodeSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (passcodeSwitch &&  customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

	



static void _logos_method$Rose$UIKeyboardLayoutStar$playKeyClickSoundOnDownForKey$(_LOGOS_SELF_TYPE_NORMAL UIKeyboardLayoutStar* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIKBTree * key) {

	_logos_orig$Rose$UIKeyboardLayoutStar$playKeyClickSoundOnDownForKey$(self, _cmd, key);

	int customStrength = [customStrengthKeyboardControl intValue];

	if (keyboardSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (keyboardSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

static void _logos_method$Rose$UIKeyboardLayoutStar$setPlayKeyClickSoundOn$(_LOGOS_SELF_TYPE_NORMAL UIKeyboardLayoutStar* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, int arg1) {

	if (enabled && keyboardSwitch) {
	            UIKBTree *delKey = [_logos_static_class_lookup$UIKBTree() key];
				NSString *myDelKeyString = [delKey name];

		 if ([myDelKeyString isEqualToString:@"Delete-Key"]) {
            
		
      } else {
		  _logos_orig$Rose$UIKeyboardLayoutStar$setPlayKeyClickSoundOn$(self, _cmd, arg1);

	}
} else {
	_logos_orig$Rose$UIKeyboardLayoutStar$setPlayKeyClickSoundOn$(self, _cmd, arg1);

}

}





static void _logos_method$Rose$UICalloutBar$buttonPressed$(_LOGOS_SELF_TYPE_NORMAL UICalloutBar* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$UICalloutBar$buttonPressed$(self, _cmd, arg1);

	int customStrength = [customStrengthTextSelectionControl intValue];

	if (textSelectionSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (textSelectionSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static BOOL _logos_method$Rose$SBSearchScrollView$gestureRecognizerShouldBegin$(_LOGOS_SELF_TYPE_NORMAL SBSearchScrollView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	int customStrength = [customStrengthSpotlightControl intValue];

	if (spotlightSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (spotlightSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

	return _logos_orig$Rose$SBSearchScrollView$gestureRecognizerShouldBegin$(self, _cmd, arg1);

}





static void _logos_method$Rose$ICSApplicationDelegate$audioCallStatusChanged$(_LOGOS_SELF_TYPE_NORMAL ICSApplicationDelegate* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$ICSApplicationDelegate$audioCallStatusChanged$(self, _cmd, arg1);

	int customStrength = [customStrengthCallControl intValue];

	if (callSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (callSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$SBDashBoardViewController$setAuthenticated$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL authenticated) {

    _logos_orig$Rose$SBDashBoardViewController$setAuthenticated$(self, _cmd, authenticated);

    if (authenticated) {

	_logos_orig$Rose$SBDashBoardViewController$setAuthenticated$(self, _cmd, authenticated);

		int customStrength = [customStrengthAuthenticationControl intValue];

		if (authenticationSwitch && customStrength == 0) {
			triggerFeedback();

		} else if (authenticationSwitch && customStrength != 0) {
			customFeedbackValue = customStrength;
			triggerCustomFeedback();

		}

	}

}





static void _logos_method$Rose$SBDashBoardMesaUnlockBehavior$setAuthenticated$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardMesaUnlockBehavior* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {

	_logos_orig$Rose$SBDashBoardMesaUnlockBehavior$setAuthenticated$(self, _cmd, arg1);

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





static void _logos_method$Rose$SBBacklightController$turnOnScreenFullyWithBacklightSource$(_LOGOS_SELF_TYPE_NORMAL SBBacklightController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, long long source) {

	_logos_orig$Rose$SBBacklightController$turnOnScreenFullyWithBacklightSource$(self, _cmd, source);
	
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





static BOOL _logos_method$Rose$UIWindow$_shouldHitTestEntireScreen(_LOGOS_SELF_TYPE_NORMAL UIWindow* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	int customStrength = [customStrengthTouchesControl intValue];

	if (touchesSwitch && customStrength == 0) {
		triggerFeedback();

		return YES;

	} else if (touchesSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

		return YES;

	} else {
		return _logos_orig$Rose$UIWindow$_shouldHitTestEntireScreen(self, _cmd);

	}

}





static void _logos_method$Rose$SBControlCenterController$_willPresent(_LOGOS_SELF_TYPE_NORMAL SBControlCenterController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SBControlCenterController$_willPresent(self, _cmd);

	int customStrength = [customStrengthOpenControlCenterControl intValue];

	if (openControlCenterSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (openControlCenterSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$CCUIToggleViewController$buttonTapped$forEvent$(_LOGOS_SELF_TYPE_NORMAL CCUIToggleViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$CCUIToggleViewController$buttonTapped$forEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthCCModuleControl intValue];

	if (ccModuleSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (ccModuleSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$UIButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL UIButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$UIButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthuiButtonControl intValue];

	if (uiButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (uiButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$UIView$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL UIView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$UIView$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthuiViewControl intValue];

	if (uiViewSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (uiViewSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$_UIButtonBarButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL _UIButtonBarButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$_UIButtonBarButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthuiButtonBarButtonControl intValue];

	if (UIButtonBarButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (UIButtonBarButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$UIImageView$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL UIImageView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$UIImageView$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthuiImageViewControl intValue];

	if (uiImageViewSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (uiImageViewSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$MTMaterialView$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL MTMaterialView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$MTMaterialView$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthmtMaterialViewControl intValue];

	if (mtMaterialViewSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (mtMaterialViewSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$UIStackView$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL UIStackView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$UIStackView$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthuiStackViewControl intValue];

	if (uiStackViewSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (uiStackViewSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$UILabel$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$UILabel$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthuiLabelControl intValue];

	if (uiLabelSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (uiLabelSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$UIVisualEffectView$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL UIVisualEffectView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$UIVisualEffectView$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthuiVisualEffectViewControl intValue];

	if (uiVisualEffectViewSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (uiVisualEffectViewSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$SPTNowPlayingPlayButtonV2$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingPlayButtonV2* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$SPTNowPlayingPlayButtonV2$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthSPTplayButtonControl intValue];

	if (SPTplayButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (SPTplayButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$SPTNowPlayingPreviousTrackButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingPreviousTrackButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$SPTNowPlayingPreviousTrackButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthSPTpreviousTrackButtonControl intValue];

	if (SPTpreviousTrackButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (SPTpreviousTrackButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$SPTNowPlayingNextTrackButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingNextTrackButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$SPTNowPlayingNextTrackButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthSPTnextTrackButtonControl intValue];

	if (SPTnextTrackButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (SPTnextTrackButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$SPTNowPlayingRepeatButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingRepeatButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$SPTNowPlayingRepeatButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthSPTrepeatButtonControl intValue];

	if (SPTrepeatButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (SPTrepeatButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$SPTNowPlayingShuffleButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingShuffleButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$SPTNowPlayingShuffleButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthSPTshuffleButtonControl intValue];

	if (SPTshuffleButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (SPTshuffleButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$SPTNowPlayingQueueButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingQueueButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$SPTNowPlayingQueueButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthSPTqueueButtonControl intValue];

	if (SPTqueueButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (SPTqueueButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$SPTNowPlayingSliderV2$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingSliderV2* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$SPTNowPlayingSliderV2$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthSPTsliderControl intValue];

	if (SPTsliderSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (SPTsliderSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$SPTNowPlayingFreeTierFeedbackButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingFreeTierFeedbackButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$SPTNowPlayingFreeTierFeedbackButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthSPTfreeTierButtonControl intValue];

	if (SPTfreeTierButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (SPTfreeTierButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$SPTGaiaDevicesAvailableViewImplementation$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTGaiaDevicesAvailableViewImplementation* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$SPTGaiaDevicesAvailableViewImplementation$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthSPTavailableDevicesButtonControl intValue];

	if (SPTavailableDevicesButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (SPTavailableDevicesButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$SPTNowPlayingMarqueeLabel$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingMarqueeLabel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$SPTNowPlayingMarqueeLabel$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthSPTnowPlayingLabelControl intValue];

	if (SPTnowPlayingLabelSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (SPTnowPlayingLabelSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$SPTNowPlayingBarPlayButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingBarPlayButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$SPTNowPlayingBarPlayButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthSPTplayBarButtonControl intValue];

	if (SPTplayBarButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (SPTplayBarButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$IGUFIButtonBarView$_onLikeButtonPressed$(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$IGUFIButtonBarView$_onLikeButtonPressed$(self, _cmd, arg1);

	int customStrength = [customStrengthITGlikeButtonControl intValue];

	if (ITGlikeButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (ITGlikeButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

static void _logos_method$Rose$IGUFIButtonBarView$_onCommentButtonPressed$(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$IGUFIButtonBarView$_onCommentButtonPressed$(self, _cmd, arg1);

	int customStrength = [customStrengthITGcommentButtonControl intValue];

	if (ITGcommentButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (ITGcommentButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

static void _logos_method$Rose$IGUFIButtonBarView$_onSaveButtonLongPressed$(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$IGUFIButtonBarView$_onSaveButtonLongPressed$(self, _cmd, arg1);

	int customStrength = [customStrengthITGsaveButtonControl intValue];

	if (ITGsaveButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (ITGsaveButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

static void _logos_method$Rose$IGUFIButtonBarView$_onSaveButtonPressed$(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$IGUFIButtonBarView$_onSaveButtonPressed$(self, _cmd, arg1);

	int customStrength = [customStrengthITGsaveButtonControl intValue];

	if (ITGsaveButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (ITGsaveButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}

static void _logos_method$Rose$IGUFIButtonBarView$_onSendButtonPressed$(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$IGUFIButtonBarView$_onSendButtonPressed$(self, _cmd, arg1);

	int customStrength = [customStrengthITGsendButtonControl intValue];

	if (ITGsendButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (ITGsendButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}
	
}





static void _logos_method$Rose$AWEFeedVideoButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL AWEFeedVideoButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$AWEFeedVideoButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthTTlikeCommentShareButtonsControl intValue];

	if (TTlikeCommentShareButtonsSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (TTlikeCommentShareButtonsSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$TFNCustomTabBar$tap$(_LOGOS_SELF_TYPE_NORMAL TFNCustomTabBar* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$TFNCustomTabBar$tap$(self, _cmd, arg1);

	int customStrength = [customStrengthTWTtabBarControl intValue];

	if (TWTtabBarSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (TWTtabBarSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$T1StandardStatusView$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL T1StandardStatusView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$T1StandardStatusView$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthTWTtweetViewControl intValue];

	if (TWTtweetViewSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (TWTtweetViewSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$T1DirectMessageInboxSummaryView$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL T1DirectMessageInboxSummaryView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$T1DirectMessageInboxSummaryView$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthTWTdirectMessagesTapControl intValue];

	if (TWTdirectMessagesTapSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (TWTdirectMessagesTapSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$T1ActivityCell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL T1ActivityCell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$T1ActivityCell$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthTWTactivityTapControl intValue];

	if (TWTactivityTapSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (TWTactivityTapSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$TFNFloatingActionButton$_tfn_expandingButtonAction$(_LOGOS_SELF_TYPE_NORMAL TFNFloatingActionButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$TFNFloatingActionButton$_tfn_expandingButtonAction$(self, _cmd, arg1);

	int customStrength = [customStrengthTWTtweetButtonControl intValue];

	if (TWTtweetButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (TWTtweetButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$_SFNavigationBarURLButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL _SFNavigationBarURLButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$_SFNavigationBarURLButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthSFUrlControl intValue];

	if (SFUrlSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (SFUrlSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$PHHandsetDialerNumberPadButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL PHHandsetDialerNumberPadButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$PHHandsetDialerNumberPadButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthPHNumberPadControl intValue];

	if (PHNumberPadSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (PHNumberPadSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$CNContactListTableViewCell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL CNContactListTableViewCell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$CNContactListTableViewCell$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthPHContactCellControl intValue];

	if (PHContactCellSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (PHContactCellSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$PHHandsetDialerDeleteButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL PHHandsetDialerDeleteButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$PHHandsetDialerDeleteButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthPHDialerDeleteButtonControl intValue];

	if (PHDialerDeleteButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (PHDialerDeleteButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$PHBottomBarButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL PHBottomBarButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$PHBottomBarButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthPHDialerCallButtonControl intValue];

	if (PHDialerCallButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (PHDialerCallButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$FBTabBar$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL FBTabBar* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$FBTabBar$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthFBTabBarControl intValue];

	if (FBTabBarSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (FBTabBarSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$FDSTetraPressStateAnnouncingControl$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL FDSTetraPressStateAnnouncingControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$FDSTetraPressStateAnnouncingControl$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthFBQuickAccessButtonsControl intValue];

	if (FBQuickAccessButtonsSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (FBQuickAccessButtonsSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}





static void _logos_method$Rose$FBNavigationBarButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL FBNavigationBarButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$FBNavigationBarButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	triggerFeedback();

}





static BOOL _logos_method$Rose$NSProcessInfo$isLowPowerModeEnabled(_LOGOS_SELF_TYPE_NORMAL NSProcessInfo* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	LowPowerMode = _logos_orig$Rose$NSProcessInfo$isLowPowerModeEnabled(self, _cmd);

	return _logos_orig$Rose$NSProcessInfo$isLowPowerModeEnabled(self, _cmd);

}



 

static id (*_logos_orig$Music$MusicApplicationPlayButton$init)(_LOGOS_SELF_TYPE_INIT id, SEL) _LOGOS_RETURN_RETAINED; static id _logos_method$Music$MusicApplicationPlayButton$init(_LOGOS_SELF_TYPE_INIT id, SEL) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$Music$MusicApplicationPlayButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Music$MusicApplicationPlayButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Music$_TtCC16MusicApplication32NowPlayingControlsViewController12VolumeSlider$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL _TtCC16MusicApplication32NowPlayingControlsViewController12VolumeSlider* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Music$_TtCC16MusicApplication32NowPlayingControlsViewController12VolumeSlider$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL _TtCC16MusicApplication32NowPlayingControlsViewController12VolumeSlider* _LOGOS_SELF_CONST, SEL, id, id); static id (*_logos_orig$Music$MusicApplicationContextualActionsButton$init)(_LOGOS_SELF_TYPE_INIT id, SEL) _LOGOS_RETURN_RETAINED; static id _logos_method$Music$MusicApplicationContextualActionsButton$init(_LOGOS_SELF_TYPE_INIT id, SEL) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$Music$MusicApplicationContextualActionsButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Music$MusicApplicationContextualActionsButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static id (*_logos_orig$Music$MusicApplicationTimeSlider$init)(_LOGOS_SELF_TYPE_INIT id, SEL) _LOGOS_RETURN_RETAINED; static id _logos_method$Music$MusicApplicationTimeSlider$init(_LOGOS_SELF_TYPE_INIT id, SEL) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$Music$MusicApplicationTimeSlider$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Music$MusicApplicationTimeSlider$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static id (*_logos_orig$Music$MusicApplicationSongCell$init)(_LOGOS_SELF_TYPE_INIT id, SEL) _LOGOS_RETURN_RETAINED; static id _logos_method$Music$MusicApplicationSongCell$init(_LOGOS_SELF_TYPE_INIT id, SEL) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$Music$MusicApplicationSongCell$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Music$MusicApplicationSongCell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Music$_TtCC16MusicApplication30LibraryMenuTableViewController4Cell$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL _TtCC16MusicApplication30LibraryMenuTableViewController4Cell* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Music$_TtCC16MusicApplication30LibraryMenuTableViewController4Cell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL _TtCC16MusicApplication30LibraryMenuTableViewController4Cell* _LOGOS_SELF_CONST, SEL, id, id); static id (*_logos_orig$Music$MusicApplicationAlbumCell$init)(_LOGOS_SELF_TYPE_INIT id, SEL) _LOGOS_RETURN_RETAINED; static id _logos_method$Music$MusicApplicationAlbumCell$init(_LOGOS_SELF_TYPE_INIT id, SEL) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$Music$MusicApplicationAlbumCell$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Music$MusicApplicationAlbumCell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Music$MPRouteButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL MPRouteButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Music$MPRouteButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL MPRouteButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Music$MPButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL MPButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Music$MPButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL MPButton* _LOGOS_SELF_CONST, SEL, id, id); 

 

static id _logos_method$Music$MusicApplicationPlayButton$init(_LOGOS_SELF_TYPE_INIT id __unused self, SEL __unused _cmd) _LOGOS_RETURN_RETAINED {

    return _logos_orig$Music$MusicApplicationPlayButton$init(self, _cmd);

}

static void _logos_method$Music$MusicApplicationPlayButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Music$MusicApplicationPlayButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthMusicApplicationPlayButtonControl intValue];

	if (MusicPlayPauseButtonsSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (MusicPlayPauseButtonsSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}



 

static void _logos_method$Music$_TtCC16MusicApplication32NowPlayingControlsViewController12VolumeSlider$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL _TtCC16MusicApplication32NowPlayingControlsViewController12VolumeSlider* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Music$_TtCC16MusicApplication32NowPlayingControlsViewController12VolumeSlider$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthMusicApplicationVolumeSliderControl intValue];

	if (MusicVolumeSliderSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (MusicVolumeSliderSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}



 

static id _logos_method$Music$MusicApplicationContextualActionsButton$init(_LOGOS_SELF_TYPE_INIT id __unused self, SEL __unused _cmd) _LOGOS_RETURN_RETAINED {

    return _logos_orig$Music$MusicApplicationContextualActionsButton$init(self, _cmd);

}

static void _logos_method$Music$MusicApplicationContextualActionsButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Music$MusicApplicationContextualActionsButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthMusicApplicationContextualActionsButtonControl intValue];

	if (MusicContextualActionsButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (MusicContextualActionsButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}



 

static id _logos_method$Music$MusicApplicationTimeSlider$init(_LOGOS_SELF_TYPE_INIT id __unused self, SEL __unused _cmd) _LOGOS_RETURN_RETAINED {

    return _logos_orig$Music$MusicApplicationTimeSlider$init(self, _cmd);

}

static void _logos_method$Music$MusicApplicationTimeSlider$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Music$MusicApplicationTimeSlider$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthMusicApplicationTimeSliderControl intValue];

	if (MusicTimeSliderSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (MusicTimeSliderSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}



 

static id _logos_method$Music$MusicApplicationSongCell$init(_LOGOS_SELF_TYPE_INIT id __unused self, SEL __unused _cmd) _LOGOS_RETURN_RETAINED {

    return _logos_orig$Music$MusicApplicationSongCell$init(self, _cmd);

}

static void _logos_method$Music$MusicApplicationSongCell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Music$MusicApplicationSongCell$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthMusicApplicationSongCellControl intValue];

	if (MusicSongCellSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (MusicSongCellSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}



 

static void _logos_method$Music$_TtCC16MusicApplication30LibraryMenuTableViewController4Cell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL _TtCC16MusicApplication30LibraryMenuTableViewController4Cell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Music$_TtCC16MusicApplication30LibraryMenuTableViewController4Cell$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthLibraryCellControl intValue];

	if (MusicLibraryCellSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (MusicLibraryCellSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}



 

static id _logos_method$Music$MusicApplicationAlbumCell$init(_LOGOS_SELF_TYPE_INIT id __unused self, SEL __unused _cmd) _LOGOS_RETURN_RETAINED {

    return _logos_orig$Music$MusicApplicationAlbumCell$init(self, _cmd);

}

static void _logos_method$Music$MusicApplicationAlbumCell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Music$MusicApplicationAlbumCell$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthMusicApplicationAlbumCellControl intValue];

	if (MusicAlbumCellSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (MusicAlbumCellSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}



 

static void _logos_method$Music$MPRouteButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL MPRouteButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Music$MPRouteButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthMPRouteButtonControl intValue];

	if (MusicAirPlayButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (MusicAirPlayButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}



 

static void _logos_method$Music$MPButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL MPButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Music$MPButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthMPButtonControl intValue];

	if (MusicLiveLyricsQueueButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (MusicLiveLyricsQueueButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}



static __attribute__((constructor)) void _logosLocalCtor_08b3c8dd(int __unused argc, char __unused **argv, char __unused **envp) {
    {Class _logos_class$Music$MusicApplicationPlayButton = objc_getClass("MusicApplication.NowPlayingTransportButton"); MSHookMessageEx(_logos_class$Music$MusicApplicationPlayButton, @selector(init), (IMP)&_logos_method$Music$MusicApplicationPlayButton$init, (IMP*)&_logos_orig$Music$MusicApplicationPlayButton$init);MSHookMessageEx(_logos_class$Music$MusicApplicationPlayButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Music$MusicApplicationPlayButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Music$MusicApplicationPlayButton$touchesBegan$withEvent$);Class _logos_class$Music$_TtCC16MusicApplication32NowPlayingControlsViewController12VolumeSlider = objc_getClass("_TtCC16MusicApplication32NowPlayingControlsViewController12VolumeSlider"); MSHookMessageEx(_logos_class$Music$_TtCC16MusicApplication32NowPlayingControlsViewController12VolumeSlider, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Music$_TtCC16MusicApplication32NowPlayingControlsViewController12VolumeSlider$touchesBegan$withEvent$, (IMP*)&_logos_orig$Music$_TtCC16MusicApplication32NowPlayingControlsViewController12VolumeSlider$touchesBegan$withEvent$);Class _logos_class$Music$MusicApplicationContextualActionsButton = objc_getClass("MusicApplication.ContextualActionsButton"); MSHookMessageEx(_logos_class$Music$MusicApplicationContextualActionsButton, @selector(init), (IMP)&_logos_method$Music$MusicApplicationContextualActionsButton$init, (IMP*)&_logos_orig$Music$MusicApplicationContextualActionsButton$init);MSHookMessageEx(_logos_class$Music$MusicApplicationContextualActionsButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Music$MusicApplicationContextualActionsButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Music$MusicApplicationContextualActionsButton$touchesBegan$withEvent$);Class _logos_class$Music$MusicApplicationTimeSlider = objc_getClass("MusicApplication.PlayerTimeControl"); MSHookMessageEx(_logos_class$Music$MusicApplicationTimeSlider, @selector(init), (IMP)&_logos_method$Music$MusicApplicationTimeSlider$init, (IMP*)&_logos_orig$Music$MusicApplicationTimeSlider$init);MSHookMessageEx(_logos_class$Music$MusicApplicationTimeSlider, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Music$MusicApplicationTimeSlider$touchesBegan$withEvent$, (IMP*)&_logos_orig$Music$MusicApplicationTimeSlider$touchesBegan$withEvent$);Class _logos_class$Music$MusicApplicationSongCell = objc_getClass("MusicApplication.SongCell"); MSHookMessageEx(_logos_class$Music$MusicApplicationSongCell, @selector(init), (IMP)&_logos_method$Music$MusicApplicationSongCell$init, (IMP*)&_logos_orig$Music$MusicApplicationSongCell$init);MSHookMessageEx(_logos_class$Music$MusicApplicationSongCell, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Music$MusicApplicationSongCell$touchesBegan$withEvent$, (IMP*)&_logos_orig$Music$MusicApplicationSongCell$touchesBegan$withEvent$);Class _logos_class$Music$_TtCC16MusicApplication30LibraryMenuTableViewController4Cell = objc_getClass("_TtCC16MusicApplication30LibraryMenuTableViewController4Cell"); MSHookMessageEx(_logos_class$Music$_TtCC16MusicApplication30LibraryMenuTableViewController4Cell, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Music$_TtCC16MusicApplication30LibraryMenuTableViewController4Cell$touchesBegan$withEvent$, (IMP*)&_logos_orig$Music$_TtCC16MusicApplication30LibraryMenuTableViewController4Cell$touchesBegan$withEvent$);Class _logos_class$Music$MusicApplicationAlbumCell = objc_getClass("MusicApplication.AlbumCell"); MSHookMessageEx(_logos_class$Music$MusicApplicationAlbumCell, @selector(init), (IMP)&_logos_method$Music$MusicApplicationAlbumCell$init, (IMP*)&_logos_orig$Music$MusicApplicationAlbumCell$init);MSHookMessageEx(_logos_class$Music$MusicApplicationAlbumCell, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Music$MusicApplicationAlbumCell$touchesBegan$withEvent$, (IMP*)&_logos_orig$Music$MusicApplicationAlbumCell$touchesBegan$withEvent$);Class _logos_class$Music$MPRouteButton = objc_getClass("MPRouteButton"); MSHookMessageEx(_logos_class$Music$MPRouteButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Music$MPRouteButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Music$MPRouteButton$touchesBegan$withEvent$);Class _logos_class$Music$MPButton = objc_getClass("MPButton"); MSHookMessageEx(_logos_class$Music$MPButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Music$MPButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Music$MPButton$touchesBegan$withEvent$);}
}



static id (*_logos_orig$Calculator$CalculatorApplicationKeyPadButton$init)(_LOGOS_SELF_TYPE_INIT id, SEL) _LOGOS_RETURN_RETAINED; static id _logos_method$Calculator$CalculatorApplicationKeyPadButton$init(_LOGOS_SELF_TYPE_INIT id, SEL) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$Calculator$CalculatorApplicationKeyPadButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Calculator$CalculatorApplicationKeyPadButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); 

 

static id _logos_method$Calculator$CalculatorApplicationKeyPadButton$init(_LOGOS_SELF_TYPE_INIT id __unused self, SEL __unused _cmd) _LOGOS_RETURN_RETAINED {

    return _logos_orig$Calculator$CalculatorApplicationKeyPadButton$init(self, _cmd);

}

static void _logos_method$Calculator$CalculatorApplicationKeyPadButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Calculator$CalculatorApplicationKeyPadButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthCalculatorApplicationKeyPadButtonControl intValue];

	if (CalculatorKeyPadButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (CalculatorKeyPadButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}



static __attribute__((constructor)) void _logosLocalCtor_48bfeab5(int __unused argc, char __unused **argv, char __unused **envp) {
	{Class _logos_class$Calculator$CalculatorApplicationKeyPadButton = objc_getClass("Calculator.CalculatorKeypadButton"); MSHookMessageEx(_logos_class$Calculator$CalculatorApplicationKeyPadButton, @selector(init), (IMP)&_logos_method$Calculator$CalculatorApplicationKeyPadButton$init, (IMP*)&_logos_orig$Calculator$CalculatorApplicationKeyPadButton$init);MSHookMessageEx(_logos_class$Calculator$CalculatorApplicationKeyPadButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Calculator$CalculatorApplicationKeyPadButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Calculator$CalculatorApplicationKeyPadButton$touchesBegan$withEvent$);}
}



static id (*_logos_orig$Sileo$SileoSourcesCell$init)(_LOGOS_SELF_TYPE_INIT id, SEL) _LOGOS_RETURN_RETAINED; static id _logos_method$Sileo$SileoSourcesCell$init(_LOGOS_SELF_TYPE_INIT id, SEL) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$Sileo$SileoSourcesCell$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Sileo$SileoSourcesCell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static id (*_logos_orig$Sileo$SileoPackageCollectionViewCell$init)(_LOGOS_SELF_TYPE_INIT id, SEL) _LOGOS_RETURN_RETAINED; static id _logos_method$Sileo$SileoPackageCollectionViewCell$init(_LOGOS_SELF_TYPE_INIT id, SEL) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$Sileo$SileoPackageCollectionViewCell$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Sileo$SileoPackageCollectionViewCell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static id (*_logos_orig$Sileo$SileoTableViewCell$init)(_LOGOS_SELF_TYPE_INIT id, SEL) _LOGOS_RETURN_RETAINED; static id _logos_method$Sileo$SileoTableViewCell$init(_LOGOS_SELF_TYPE_INIT id, SEL) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$Sileo$SileoTableViewCell$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Sileo$SileoTableViewCell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static id (*_logos_orig$Sileo$SileoFeaturedBannerView$init)(_LOGOS_SELF_TYPE_INIT id, SEL) _LOGOS_RETURN_RETAINED; static id _logos_method$Sileo$SileoFeaturedBannerView$init(_LOGOS_SELF_TYPE_INIT id, SEL) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$Sileo$SileoFeaturedBannerView$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Sileo$SileoFeaturedBannerView$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static id (*_logos_orig$Sileo$SileoConfirmDownloadButton$init)(_LOGOS_SELF_TYPE_INIT id, SEL) _LOGOS_RETURN_RETAINED; static id _logos_method$Sileo$SileoConfirmDownloadButton$init(_LOGOS_SELF_TYPE_INIT id, SEL) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$Sileo$SileoConfirmDownloadButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Sileo$SileoConfirmDownloadButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, id); 

 

static id _logos_method$Sileo$SileoSourcesCell$init(_LOGOS_SELF_TYPE_INIT id __unused self, SEL __unused _cmd) _LOGOS_RETURN_RETAINED {

    return _logos_orig$Sileo$SileoSourcesCell$init(self, _cmd);

}

static void _logos_method$Sileo$SileoSourcesCell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Sileo$SileoSourcesCell$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthSileoSourcesCellControl intValue];

	if (SileoSourcesCellSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (SileoSourcesCellSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}



 

static id _logos_method$Sileo$SileoPackageCollectionViewCell$init(_LOGOS_SELF_TYPE_INIT id __unused self, SEL __unused _cmd) _LOGOS_RETURN_RETAINED {

    return _logos_orig$Sileo$SileoPackageCollectionViewCell$init(self, _cmd);

}

static void _logos_method$Sileo$SileoPackageCollectionViewCell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Sileo$SileoPackageCollectionViewCell$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthSileoPackageCollectionViewCellControl intValue];

	if (SileoPackageCollectionViewCellSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (SileoPackageCollectionViewCellSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}



 

static id _logos_method$Sileo$SileoTableViewCell$init(_LOGOS_SELF_TYPE_INIT id __unused self, SEL __unused _cmd) _LOGOS_RETURN_RETAINED {

    return _logos_orig$Sileo$SileoTableViewCell$init(self, _cmd);

}

static void _logos_method$Sileo$SileoTableViewCell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Sileo$SileoTableViewCell$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthSileoTableViewCellControl intValue];

	if (SileoTableViewCellSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (SileoTableViewCellSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}



 

static id _logos_method$Sileo$SileoFeaturedBannerView$init(_LOGOS_SELF_TYPE_INIT id __unused self, SEL __unused _cmd) _LOGOS_RETURN_RETAINED {

    return _logos_orig$Sileo$SileoFeaturedBannerView$init(self, _cmd);

}

static void _logos_method$Sileo$SileoFeaturedBannerView$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Sileo$SileoFeaturedBannerView$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthSileoFeaturedBannerViewControl intValue];

	if (SileoFeaturedBannerViewSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (SileoFeaturedBannerViewSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}



 

static id _logos_method$Sileo$SileoConfirmDownloadButton$init(_LOGOS_SELF_TYPE_INIT id __unused self, SEL __unused _cmd) _LOGOS_RETURN_RETAINED {

    return _logos_orig$Sileo$SileoConfirmDownloadButton$init(self, _cmd);

}

static void _logos_method$Sileo$SileoConfirmDownloadButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Sileo$SileoConfirmDownloadButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	int customStrength = [customStrengthSileoConfirmDownloadButtonControl intValue];

	if (SileoConfirmDownloadButtonSwitch && customStrength == 0) {
		triggerFeedback();

	} else if (SileoConfirmDownloadButtonSwitch && customStrength != 0) {
		customFeedbackValue = customStrength;
		triggerCustomFeedback();

	}

}



static __attribute__((constructor)) void _logosLocalCtor_d426a121(int __unused argc, char __unused **argv, char __unused **envp) {
	{Class _logos_class$Sileo$SileoSourcesCell = objc_getClass("Sileo.SourcesTableViewCell"); MSHookMessageEx(_logos_class$Sileo$SileoSourcesCell, @selector(init), (IMP)&_logos_method$Sileo$SileoSourcesCell$init, (IMP*)&_logos_orig$Sileo$SileoSourcesCell$init);MSHookMessageEx(_logos_class$Sileo$SileoSourcesCell, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Sileo$SileoSourcesCell$touchesBegan$withEvent$, (IMP*)&_logos_orig$Sileo$SileoSourcesCell$touchesBegan$withEvent$);Class _logos_class$Sileo$SileoPackageCollectionViewCell = objc_getClass("Sileo.PackageCollectionViewCell"); MSHookMessageEx(_logos_class$Sileo$SileoPackageCollectionViewCell, @selector(init), (IMP)&_logos_method$Sileo$SileoPackageCollectionViewCell$init, (IMP*)&_logos_orig$Sileo$SileoPackageCollectionViewCell$init);MSHookMessageEx(_logos_class$Sileo$SileoPackageCollectionViewCell, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Sileo$SileoPackageCollectionViewCell$touchesBegan$withEvent$, (IMP*)&_logos_orig$Sileo$SileoPackageCollectionViewCell$touchesBegan$withEvent$);Class _logos_class$Sileo$SileoTableViewCell = objc_getClass("Sileo.SileoTableViewCell"); MSHookMessageEx(_logos_class$Sileo$SileoTableViewCell, @selector(init), (IMP)&_logos_method$Sileo$SileoTableViewCell$init, (IMP*)&_logos_orig$Sileo$SileoTableViewCell$init);MSHookMessageEx(_logos_class$Sileo$SileoTableViewCell, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Sileo$SileoTableViewCell$touchesBegan$withEvent$, (IMP*)&_logos_orig$Sileo$SileoTableViewCell$touchesBegan$withEvent$);Class _logos_class$Sileo$SileoFeaturedBannerView = objc_getClass("Sileo.FeaturedBannerView"); MSHookMessageEx(_logos_class$Sileo$SileoFeaturedBannerView, @selector(init), (IMP)&_logos_method$Sileo$SileoFeaturedBannerView$init, (IMP*)&_logos_orig$Sileo$SileoFeaturedBannerView$init);MSHookMessageEx(_logos_class$Sileo$SileoFeaturedBannerView, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Sileo$SileoFeaturedBannerView$touchesBegan$withEvent$, (IMP*)&_logos_orig$Sileo$SileoFeaturedBannerView$touchesBegan$withEvent$);Class _logos_class$Sileo$SileoConfirmDownloadButton = objc_getClass("Sileo.DownloadConfirmButton"); MSHookMessageEx(_logos_class$Sileo$SileoConfirmDownloadButton, @selector(init), (IMP)&_logos_method$Sileo$SileoConfirmDownloadButton$init, (IMP*)&_logos_orig$Sileo$SileoConfirmDownloadButton$init);MSHookMessageEx(_logos_class$Sileo$SileoConfirmDownloadButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Sileo$SileoConfirmDownloadButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Sileo$SileoConfirmDownloadButton$touchesBegan$withEvent$);}
}



static __attribute__((constructor)) void _logosLocalCtor_2945c994(int __unused argc, char __unused **argv, char __unused **envp) {

	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)triggerFeedback, (CFStringRef)RoseTriggerActivator, NULL, kNilOptions);

}
	
static __attribute__((constructor)) void _logosLocalCtor_c44666d7(int __unused argc, char __unused **argv, char __unused **envp) {

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

    pfs = [[HBPreferences alloc] initWithIdentifier:@"sh.litten.rosepreferences"];
	
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
	[pfs registerBool:&enterBackgroundSwitch default:NO forKey:@"enterBackground"];
	
	[pfs registerBool:&uiButtonSwitch default:NO forKey:@"uiButton"];
	[pfs registerBool:&uiViewSwitch default:NO forKey:@"uiView"];
	[pfs registerBool:&UIButtonBarButtonSwitch default:NO forKey:@"UIButtonBarButton"];
	[pfs registerBool:&uiImageViewSwitch default:NO forKey:@"uiImageView"];
	[pfs registerBool:&mtMaterialViewSwitch default:NO forKey:@"mtMaterialView"];
	[pfs registerBool:&uiStackViewSwitch default:NO forKey:@"uiStackView"];
	[pfs registerBool:&uiLabelSwitch default:NO forKey:@"uiLabel"];
	[pfs registerBool:&uiVisualEffectViewSwitch default:NO forKey:@"uiVisualEffectView"];
	
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
	
	[pfs registerBool:&ITGlikeButtonSwitch default:NO forKey:@"ITGlikeButton"];
	[pfs registerBool:&ITGcommentButtonSwitch default:NO forKey:@"ITGcommentButton"];
	[pfs registerBool:&ITGsaveButtonSwitch default:NO forKey:@"ITGsaveButton"];
	[pfs registerBool:&ITGsendButtonSwitch default:NO forKey:@"ITGsendButton"];
	
	[pfs registerBool:&TTlikeCommentShareButtonsSwitch default:NO forKey:@"TTlikeCommentShareButtons"];
	
	[pfs registerBool:&TWTtabBarSwitch default:NO forKey:@"TWTtabBar"];
	[pfs registerBool:&TWTtweetViewSwitch default:NO forKey:@"TWTweetTap"];
	[pfs registerBool:&TWTdirectMessagesTapSwitch default:NO forKey:@"TWTdirectMessagesTap"];
	[pfs registerBool:&TWTactivityTapSwitch default:NO forKey:@"TWTactivityTap"];
	[pfs registerBool:&TWTtweetButtonSwitch default:NO forKey:@"TWTtweetButton"];
	
	[pfs registerBool:&SFUrlSwitch default:NO forKey:@"SFUrl"];
	
	[pfs registerBool:&PHNumberPadSwitch default:NO forKey:@"PHNumberPad"];
	[pfs registerBool:&PHContactCellSwitch default:NO forKey:@"PHContactCell"];
	[pfs registerBool:&PHDialerDeleteButtonSwitch default:NO forKey:@"PHDialerDeleteButton"];
	[pfs registerBool:&PHDialerCallButtonSwitch default:NO forKey:@"PHDialerCallButton"];
	
	[pfs registerBool:&FBTabBarSwitch default:NO forKey:@"FBTabBar"];
	[pfs registerBool:&FBQuickAccessButtonsSwitch default:NO forKey:@"QuickAccessButtons"];
	[pfs registerBool:&FBNavigationBarButtonSwitch default:NO forKey:@"FBNavigationBarButton"];
	
	[pfs registerBool:&MusicPlayPauseButtonsSwitch default:NO forKey:@"MusicPlayPauseButtons"];
	[pfs registerBool:&MusicVolumeSliderSwitch default:NO forKey:@"MusicVolumeSlider"];
	[pfs registerBool:&MusicContextualActionsButtonSwitch default:NO forKey:@"MusicContextualActionsButton"];
	[pfs registerBool:&MusicTimeSliderSwitch default:NO forKey:@"MusicTimeSlider"];
	[pfs registerBool:&MusicSongCellSwitch default:NO forKey:@"MusicSongCell"];
	[pfs registerBool:&MusicLibraryCellSwitch default:NO forKey:@"MusicLibraryCell"];
	[pfs registerBool:&MusicAlbumCellSwitch default:NO forKey:@"MusicAlbumCell"];
	[pfs registerBool:&MusicAirPlayButtonSwitch default:NO forKey:@"MusicAirPlayButton"];
	[pfs registerBool:&MusicLiveLyricsQueueButtonSwitch default:NO forKey:@"MusicLiveLyricsQueueButton"];
	
	[pfs registerBool:&CalculatorKeyPadButtonSwitch default:NO forKey:@"CalculatorKeyPadButton"];
	
	[pfs registerBool:&SileoSourcesCellSwitch default:NO forKey:@"SileoSourcesCell"];
	[pfs registerBool:&SileoPackageCollectionViewCellSwitch default:NO forKey:@"SileoPackageCollectionViewCell"];
	[pfs registerBool:&SileoTableViewCellSwitch default:NO forKey:@"SileoTableViewCell"];
	[pfs registerBool:&SileoFeaturedBannerViewSwitch default:NO forKey:@"SileoFeaturedBannerView"];
	[pfs registerBool:&SileoConfirmDownloadButtonSwitch default:NO forKey:@"SileoConfirmDownloadButton"];
	
	[pfs registerBool:&featureWarningSwitch default:YES forKey:@"featureWarning"];
	[pfs registerBool:&hasSeenCompatibilityAlert default:NO forKey:@"CompatibilityAlert"];
	[pfs registerBool:&hasSeeniOSAlert default:NO forKey:@"iOSAlert"];
	
    [pfs registerObject:&hapticLevel default:@"0" forKey:@"HapticStrength"];
	[pfs registerObject:&tapticLevel default:@"0" forKey:@"TapticStrength"];
	
	[pfs registerBool:&delaySwitch default:NO forKey:@"enableHapticDelay"];
	[pfs registerObject:&delayLevel default:@"0" forKey:@"Delay"];
	
	[pfs registerBool:&LowPowerModeSwitch default:NO forKey:@"LowPowerModeSwitch"];
	
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
	[pfs registerObject:&customStrengthEnterBackgroundControl default:@"0" forKey:@"customStrengthEnterBackground"];

	[pfs registerObject:&customStrengthuiButtonControl default:@"0" forKey:@"customStrengthuiButton"];
	[pfs registerObject:&customStrengthuiViewControl default:@"0" forKey:@"customStrengthuiView"];
	[pfs registerObject:&customStrengthuiButtonBarButtonControl default:@"0" forKey:@"customStrengthuiButtonBarButton"];
	[pfs registerObject:&customStrengthuiImageViewControl default:@"0" forKey:@"customStrengthuiImageView"];
	[pfs registerObject:&customStrengthmtMaterialViewControl default:@"0" forKey:@"customStrengthmtMaterialView"];
	[pfs registerObject:&customStrengthuiStackViewControl default:@"0" forKey:@"customStrengthuiStackView"];
	[pfs registerObject:&customStrengthuiLabelControl default:@"0" forKey:@"customStrengthuiLabel"];
	[pfs registerObject:&customStrengthuiVisualEffectViewControl default:@"0" forKey:@"customStrengthuiVisualEffectView"];

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

	[pfs registerObject:&customStrengthMusicApplicationPlayButtonControl default:@"0" forKey:@"customStrengthMusicApplicationPlayButton"];
	[pfs registerObject:&customStrengthMusicApplicationVolumeSliderControl default:@"0" forKey:@"customStrengthMusicApplicationVolumeSlider"];
	[pfs registerObject:&customStrengthMusicApplicationContextualActionsButtonControl default:@"0" forKey:@"customStrengthMusicApplicationContextualActionsButton"];
	[pfs registerObject:&customStrengthMusicApplicationTimeSliderControl default:@"0" forKey:@"customStrengthMusicApplicationTimeSlider"];
	[pfs registerObject:&customStrengthMusicApplicationSongCellControl default:@"0" forKey:@"customStrengthMusicApplicationSongCell"];
	[pfs registerObject:&customStrengthLibraryCellControl default:@"0" forKey:@"customStrengthLibraryCell"];
	[pfs registerObject:&customStrengthMusicApplicationAlbumCellControl default:@"0" forKey:@"customStrengthMusicApplicationAlbumCell"];
	[pfs registerObject:&customStrengthMPRouteButtonControl default:@"0" forKey:@"customStrengthMPRouteButton"];
	[pfs registerObject:&customStrengthMPButtonControl default:@"0" forKey:@"customStrengthMPButton"];

	[pfs registerObject:&customStrengthCalculatorApplicationKeyPadButtonControl default:@"0" forKey:@"customStrengthCalculatorApplicationKeyPadButton"];

	[pfs registerObject:&customStrengthSileoSourcesCellControl default:@"0" forKey:@"customStrengthSileoSourcesCell"];
	[pfs registerObject:&customStrengthSileoPackageCollectionViewCellControl default:@"0" forKey:@"customStrengthSileoPackageCollectionViewCell"];
	[pfs registerObject:&customStrengthSileoTableViewCellControl default:@"0" forKey:@"customStrengthSileoTableViewCell"];
	[pfs registerObject:&customStrengthSileoFeaturedBannerViewControl default:@"0" forKey:@"customStrengthSileoFeaturedBannerView"];
	[pfs registerObject:&customStrengthSileoConfirmDownloadButtonControl default:@"0" forKey:@"customStrengthSileoConfirmDownloadButton"];

	if (!dpkgInvalid && enabled) {
        BOOL ok = false;
        
        ok = ([[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithFormat:@"/var/lib/dpkg/info/%@%@%@%@%@%@%@%@%@.rose.md5sums", @"s", @"h", @".", @"l", @"i", @"t", @"t", @"e", @"n"]]
        );

        if (ok && [@"litten" isEqualToString:@"litten"]) {
            {Class _logos_class$Rose$SpringBoard = objc_getClass("SpringBoard"); MSHookMessageEx(_logos_class$Rose$SpringBoard, @selector(applicationDidFinishLaunching:), (IMP)&_logos_method$Rose$SpringBoard$applicationDidFinishLaunching$, (IMP*)&_logos_orig$Rose$SpringBoard$applicationDidFinishLaunching$);MSHookMessageEx(_logos_class$Rose$SpringBoard, @selector(_ringerChanged:), (IMP)&_logos_method$Rose$SpringBoard$_ringerChanged$, (IMP*)&_logos_orig$Rose$SpringBoard$_ringerChanged$);MSHookMessageEx(_logos_class$Rose$SpringBoard, @selector(_handlePhysicalButtonEvent:), (IMP)&_logos_method$Rose$SpringBoard$_handlePhysicalButtonEvent$, (IMP*)&_logos_orig$Rose$SpringBoard$_handlePhysicalButtonEvent$);Class _logos_class$Rose$SBCoverSheetPrimarySlidingViewController = objc_getClass("SBCoverSheetPrimarySlidingViewController"); MSHookMessageEx(_logos_class$Rose$SBCoverSheetPrimarySlidingViewController, @selector(viewWillDisappear:), (IMP)&_logos_method$Rose$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$, (IMP*)&_logos_orig$Rose$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$);MSHookMessageEx(_logos_class$Rose$SBCoverSheetPrimarySlidingViewController, @selector(viewDidDisappear:), (IMP)&_logos_method$Rose$SBCoverSheetPrimarySlidingViewController$viewDidDisappear$, (IMP*)&_logos_orig$Rose$SBCoverSheetPrimarySlidingViewController$viewDidDisappear$);MSHookMessageEx(_logos_class$Rose$SBCoverSheetPrimarySlidingViewController, @selector(viewDidAppear:), (IMP)&_logos_method$Rose$SBCoverSheetPrimarySlidingViewController$viewDidAppear$, (IMP*)&_logos_orig$Rose$SBCoverSheetPrimarySlidingViewController$viewDidAppear$);Class _logos_class$Rose$SBSleepWakeHardwareButtonInteraction = objc_getClass("SBSleepWakeHardwareButtonInteraction"); MSHookMessageEx(_logos_class$Rose$SBSleepWakeHardwareButtonInteraction, @selector(_playLockSound), (IMP)&_logos_method$Rose$SBSleepWakeHardwareButtonInteraction$_playLockSound, (IMP*)&_logos_orig$Rose$SBSleepWakeHardwareButtonInteraction$_playLockSound);MSHookMessageEx(_logos_class$Rose$SBSleepWakeHardwareButtonInteraction, @selector(consumeInitialPressDown), (IMP)&_logos_method$Rose$SBSleepWakeHardwareButtonInteraction$consumeInitialPressDown, (IMP*)&_logos_orig$Rose$SBSleepWakeHardwareButtonInteraction$consumeInitialPressDown);Class _logos_class$Rose$VolumeControl = objc_getClass("VolumeControl"); MSHookMessageEx(_logos_class$Rose$VolumeControl, @selector(increaseVolume), (IMP)&_logos_method$Rose$VolumeControl$increaseVolume, (IMP*)&_logos_orig$Rose$VolumeControl$increaseVolume);MSHookMessageEx(_logos_class$Rose$VolumeControl, @selector(decreaseVolume), (IMP)&_logos_method$Rose$VolumeControl$decreaseVolume, (IMP*)&_logos_orig$Rose$VolumeControl$decreaseVolume);Class _logos_class$Rose$SBVolumeControl = objc_getClass("SBVolumeControl"); MSHookMessageEx(_logos_class$Rose$SBVolumeControl, @selector(increaseVolume), (IMP)&_logos_method$Rose$SBVolumeControl$increaseVolume, (IMP*)&_logos_orig$Rose$SBVolumeControl$increaseVolume);MSHookMessageEx(_logos_class$Rose$SBVolumeControl, @selector(decreaseVolume), (IMP)&_logos_method$Rose$SBVolumeControl$decreaseVolume, (IMP*)&_logos_orig$Rose$SBVolumeControl$decreaseVolume);Class _logos_class$Rose$SBPowerDownController = objc_getClass("SBPowerDownController"); MSHookMessageEx(_logos_class$Rose$SBPowerDownController, @selector(orderFront), (IMP)&_logos_method$Rose$SBPowerDownController$orderFront, (IMP*)&_logos_orig$Rose$SBPowerDownController$orderFront);Class _logos_class$Rose$SBPowerDownViewController = objc_getClass("SBPowerDownViewController"); MSHookMessageEx(_logos_class$Rose$SBPowerDownViewController, @selector(viewWillAppear:), (IMP)&_logos_method$Rose$SBPowerDownViewController$viewWillAppear$, (IMP*)&_logos_orig$Rose$SBPowerDownViewController$viewWillAppear$);Class _logos_class$Rose$SBMainDisplaySceneManager = objc_getClass("SBMainDisplaySceneManager"); MSHookMessageEx(_logos_class$Rose$SBMainDisplaySceneManager, @selector(_appKilledInAppSwitcher:), (IMP)&_logos_method$Rose$SBMainDisplaySceneManager$_appKilledInAppSwitcher$, (IMP*)&_logos_orig$Rose$SBMainDisplaySceneManager$_appKilledInAppSwitcher$);Class _logos_class$Rose$SBApplication = objc_getClass("SBApplication"); MSHookMessageEx(_logos_class$Rose$SBApplication, @selector(_didExitWithContext:), (IMP)&_logos_method$Rose$SBApplication$_didExitWithContext$, (IMP*)&_logos_orig$Rose$SBApplication$_didExitWithContext$);Class _logos_class$Rose$SBUIIconForceTouchController = objc_getClass("SBUIIconForceTouchController"); MSHookMessageEx(_logos_class$Rose$SBUIIconForceTouchController, @selector(iconForceTouchViewControllerWillDismiss:), (IMP)&_logos_method$Rose$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$, (IMP*)&_logos_orig$Rose$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$);Class _logos_class$Rose$SBUIController = objc_getClass("SBUIController"); MSHookMessageEx(_logos_class$Rose$SBUIController, @selector(ACPowerChanged), (IMP)&_logos_method$Rose$SBUIController$ACPowerChanged, (IMP*)&_logos_orig$Rose$SBUIController$ACPowerChanged);MSHookMessageEx(_logos_class$Rose$SBUIController, @selector(handleWillBeginReachabilityAnimation), (IMP)&_logos_method$Rose$SBUIController$handleWillBeginReachabilityAnimation, (IMP*)&_logos_orig$Rose$SBUIController$handleWillBeginReachabilityAnimation);Class _logos_class$Rose$SBAppSwitcherPageView = objc_getClass("SBAppSwitcherPageView"); MSHookMessageEx(_logos_class$Rose$SBAppSwitcherPageView, @selector(setVisible:), (IMP)&_logos_method$Rose$SBAppSwitcherPageView$setVisible$, (IMP*)&_logos_orig$Rose$SBAppSwitcherPageView$setVisible$);Class _logos_class$Rose$SiriUISiriStatusView = objc_getClass("SiriUISiriStatusView"); MSHookMessageEx(_logos_class$Rose$SiriUISiriStatusView, @selector(layoutSubviews), (IMP)&_logos_method$Rose$SiriUISiriStatusView$layoutSubviews, (IMP*)&_logos_orig$Rose$SiriUISiriStatusView$layoutSubviews);Class _logos_class$Rose$CCUILabeledRoundButton = objc_getClass("CCUILabeledRoundButton"); MSHookMessageEx(_logos_class$Rose$CCUILabeledRoundButton, @selector(buttonTapped:), (IMP)&_logos_method$Rose$CCUILabeledRoundButton$buttonTapped$, (IMP*)&_logos_orig$Rose$CCUILabeledRoundButton$buttonTapped$);Class _logos_class$Rose$SBFolderController = objc_getClass("SBFolderController"); MSHookMessageEx(_logos_class$Rose$SBFolderController, @selector(prepareToOpen), (IMP)&_logos_method$Rose$SBFolderController$prepareToOpen, (IMP*)&_logos_orig$Rose$SBFolderController$prepareToOpen);Class _logos_class$Rose$SBIconController = objc_getClass("SBIconController"); MSHookMessageEx(_logos_class$Rose$SBIconController, @selector(viewWillAppear:), (IMP)&_logos_method$Rose$SBIconController$viewWillAppear$, (IMP*)&_logos_orig$Rose$SBIconController$viewWillAppear$);MSHookMessageEx(_logos_class$Rose$SBIconController, @selector(viewDidAppear:), (IMP)&_logos_method$Rose$SBIconController$viewDidAppear$, (IMP*)&_logos_orig$Rose$SBIconController$viewDidAppear$);MSHookMessageEx(_logos_class$Rose$SBIconController, @selector(iconTapped:), (IMP)&_logos_method$Rose$SBIconController$iconTapped$, (IMP*)&_logos_orig$Rose$SBIconController$iconTapped$);MSHookMessageEx(_logos_class$Rose$SBIconController, @selector(_iconForceTouchControllerDidDismiss:), (IMP)&_logos_method$Rose$SBIconController$_iconForceTouchControllerDidDismiss$, (IMP*)&_logos_orig$Rose$SBIconController$_iconForceTouchControllerDidDismiss$);Class _logos_class$Rose$SBHIconManager = objc_getClass("SBHIconManager"); MSHookMessageEx(_logos_class$Rose$SBHIconManager, @selector(iconTapped:), (IMP)&_logos_method$Rose$SBHIconManager$iconTapped$, (IMP*)&_logos_orig$Rose$SBHIconManager$iconTapped$);Class _logos_class$Rose$SBFolderView = objc_getClass("SBFolderView"); MSHookMessageEx(_logos_class$Rose$SBFolderView, @selector(scrollViewWillBeginDragging:), (IMP)&_logos_method$Rose$SBFolderView$scrollViewWillBeginDragging$, (IMP*)&_logos_orig$Rose$SBFolderView$scrollViewWillBeginDragging$);Class _logos_class$Rose$SSScreenCapturer = objc_getClass("SSScreenCapturer"); Class _logos_metaclass$Rose$SSScreenCapturer = object_getClass(_logos_class$Rose$SSScreenCapturer); MSHookMessageEx(_logos_metaclass$Rose$SSScreenCapturer, @selector(playScreenshotSound), (IMP)&_logos_meta_method$Rose$SSScreenCapturer$playScreenshotSound, (IMP*)&_logos_meta_orig$Rose$SSScreenCapturer$playScreenshotSound);Class _logos_class$Rose$SBUIPasscodeLockViewBase = objc_getClass("SBUIPasscodeLockViewBase"); MSHookMessageEx(_logos_class$Rose$SBUIPasscodeLockViewBase, @selector(_sendDelegateKeypadKeyDown), (IMP)&_logos_method$Rose$SBUIPasscodeLockViewBase$_sendDelegateKeypadKeyDown, (IMP*)&_logos_orig$Rose$SBUIPasscodeLockViewBase$_sendDelegateKeypadKeyDown);Class _logos_class$Rose$UIKeyboardLayoutStar = objc_getClass("UIKeyboardLayoutStar"); MSHookMessageEx(_logos_class$Rose$UIKeyboardLayoutStar, @selector(playKeyClickSoundOnDownForKey:), (IMP)&_logos_method$Rose$UIKeyboardLayoutStar$playKeyClickSoundOnDownForKey$, (IMP*)&_logos_orig$Rose$UIKeyboardLayoutStar$playKeyClickSoundOnDownForKey$);MSHookMessageEx(_logos_class$Rose$UIKeyboardLayoutStar, @selector(setPlayKeyClickSoundOn:), (IMP)&_logos_method$Rose$UIKeyboardLayoutStar$setPlayKeyClickSoundOn$, (IMP*)&_logos_orig$Rose$UIKeyboardLayoutStar$setPlayKeyClickSoundOn$);Class _logos_class$Rose$UICalloutBar = objc_getClass("UICalloutBar"); MSHookMessageEx(_logos_class$Rose$UICalloutBar, @selector(buttonPressed:), (IMP)&_logos_method$Rose$UICalloutBar$buttonPressed$, (IMP*)&_logos_orig$Rose$UICalloutBar$buttonPressed$);Class _logos_class$Rose$SBSearchScrollView = objc_getClass("SBSearchScrollView"); MSHookMessageEx(_logos_class$Rose$SBSearchScrollView, @selector(gestureRecognizerShouldBegin:), (IMP)&_logos_method$Rose$SBSearchScrollView$gestureRecognizerShouldBegin$, (IMP*)&_logos_orig$Rose$SBSearchScrollView$gestureRecognizerShouldBegin$);Class _logos_class$Rose$ICSApplicationDelegate = objc_getClass("ICSApplicationDelegate"); MSHookMessageEx(_logos_class$Rose$ICSApplicationDelegate, @selector(audioCallStatusChanged:), (IMP)&_logos_method$Rose$ICSApplicationDelegate$audioCallStatusChanged$, (IMP*)&_logos_orig$Rose$ICSApplicationDelegate$audioCallStatusChanged$);Class _logos_class$Rose$SBDashBoardViewController = objc_getClass("SBDashBoardViewController"); MSHookMessageEx(_logos_class$Rose$SBDashBoardViewController, @selector(setAuthenticated:), (IMP)&_logos_method$Rose$SBDashBoardViewController$setAuthenticated$, (IMP*)&_logos_orig$Rose$SBDashBoardViewController$setAuthenticated$);Class _logos_class$Rose$SBDashBoardMesaUnlockBehavior = objc_getClass("SBDashBoardMesaUnlockBehavior"); MSHookMessageEx(_logos_class$Rose$SBDashBoardMesaUnlockBehavior, @selector(setAuthenticated:), (IMP)&_logos_method$Rose$SBDashBoardMesaUnlockBehavior$setAuthenticated$, (IMP*)&_logos_orig$Rose$SBDashBoardMesaUnlockBehavior$setAuthenticated$);Class _logos_class$Rose$SBBacklightController = objc_getClass("SBBacklightController"); MSHookMessageEx(_logos_class$Rose$SBBacklightController, @selector(turnOnScreenFullyWithBacklightSource:), (IMP)&_logos_method$Rose$SBBacklightController$turnOnScreenFullyWithBacklightSource$, (IMP*)&_logos_orig$Rose$SBBacklightController$turnOnScreenFullyWithBacklightSource$);Class _logos_class$Rose$UIWindow = objc_getClass("UIWindow"); MSHookMessageEx(_logos_class$Rose$UIWindow, @selector(_shouldHitTestEntireScreen), (IMP)&_logos_method$Rose$UIWindow$_shouldHitTestEntireScreen, (IMP*)&_logos_orig$Rose$UIWindow$_shouldHitTestEntireScreen);Class _logos_class$Rose$SBControlCenterController = objc_getClass("SBControlCenterController"); MSHookMessageEx(_logos_class$Rose$SBControlCenterController, @selector(_willPresent), (IMP)&_logos_method$Rose$SBControlCenterController$_willPresent, (IMP*)&_logos_orig$Rose$SBControlCenterController$_willPresent);Class _logos_class$Rose$CCUIToggleViewController = objc_getClass("CCUIToggleViewController"); MSHookMessageEx(_logos_class$Rose$CCUIToggleViewController, @selector(buttonTapped:forEvent:), (IMP)&_logos_method$Rose$CCUIToggleViewController$buttonTapped$forEvent$, (IMP*)&_logos_orig$Rose$CCUIToggleViewController$buttonTapped$forEvent$);Class _logos_class$Rose$UIButton = objc_getClass("UIButton"); MSHookMessageEx(_logos_class$Rose$UIButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$UIButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$UIButton$touchesBegan$withEvent$);Class _logos_class$Rose$UIView = objc_getClass("UIView"); MSHookMessageEx(_logos_class$Rose$UIView, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$UIView$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$UIView$touchesBegan$withEvent$);Class _logos_class$Rose$_UIButtonBarButton = objc_getClass("_UIButtonBarButton"); MSHookMessageEx(_logos_class$Rose$_UIButtonBarButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$_UIButtonBarButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$_UIButtonBarButton$touchesBegan$withEvent$);Class _logos_class$Rose$UIImageView = objc_getClass("UIImageView"); MSHookMessageEx(_logos_class$Rose$UIImageView, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$UIImageView$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$UIImageView$touchesBegan$withEvent$);Class _logos_class$Rose$MTMaterialView = objc_getClass("MTMaterialView"); MSHookMessageEx(_logos_class$Rose$MTMaterialView, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$MTMaterialView$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$MTMaterialView$touchesBegan$withEvent$);Class _logos_class$Rose$UIStackView = objc_getClass("UIStackView"); MSHookMessageEx(_logos_class$Rose$UIStackView, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$UIStackView$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$UIStackView$touchesBegan$withEvent$);Class _logos_class$Rose$UILabel = objc_getClass("UILabel"); MSHookMessageEx(_logos_class$Rose$UILabel, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$UILabel$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$UILabel$touchesBegan$withEvent$);Class _logos_class$Rose$UIVisualEffectView = objc_getClass("UIVisualEffectView"); MSHookMessageEx(_logos_class$Rose$UIVisualEffectView, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$UIVisualEffectView$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$UIVisualEffectView$touchesBegan$withEvent$);Class _logos_class$Rose$SPTNowPlayingPlayButtonV2 = objc_getClass("SPTNowPlayingPlayButtonV2"); MSHookMessageEx(_logos_class$Rose$SPTNowPlayingPlayButtonV2, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$SPTNowPlayingPlayButtonV2$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$SPTNowPlayingPlayButtonV2$touchesBegan$withEvent$);Class _logos_class$Rose$SPTNowPlayingPreviousTrackButton = objc_getClass("SPTNowPlayingPreviousTrackButton"); MSHookMessageEx(_logos_class$Rose$SPTNowPlayingPreviousTrackButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$SPTNowPlayingPreviousTrackButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$SPTNowPlayingPreviousTrackButton$touchesBegan$withEvent$);Class _logos_class$Rose$SPTNowPlayingNextTrackButton = objc_getClass("SPTNowPlayingNextTrackButton"); MSHookMessageEx(_logos_class$Rose$SPTNowPlayingNextTrackButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$SPTNowPlayingNextTrackButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$SPTNowPlayingNextTrackButton$touchesBegan$withEvent$);Class _logos_class$Rose$SPTNowPlayingRepeatButton = objc_getClass("SPTNowPlayingRepeatButton"); MSHookMessageEx(_logos_class$Rose$SPTNowPlayingRepeatButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$SPTNowPlayingRepeatButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$SPTNowPlayingRepeatButton$touchesBegan$withEvent$);Class _logos_class$Rose$SPTNowPlayingShuffleButton = objc_getClass("SPTNowPlayingShuffleButton"); MSHookMessageEx(_logos_class$Rose$SPTNowPlayingShuffleButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$SPTNowPlayingShuffleButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$SPTNowPlayingShuffleButton$touchesBegan$withEvent$);Class _logos_class$Rose$SPTNowPlayingQueueButton = objc_getClass("SPTNowPlayingQueueButton"); MSHookMessageEx(_logos_class$Rose$SPTNowPlayingQueueButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$SPTNowPlayingQueueButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$SPTNowPlayingQueueButton$touchesBegan$withEvent$);Class _logos_class$Rose$SPTNowPlayingSliderV2 = objc_getClass("SPTNowPlayingSliderV2"); MSHookMessageEx(_logos_class$Rose$SPTNowPlayingSliderV2, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$SPTNowPlayingSliderV2$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$SPTNowPlayingSliderV2$touchesBegan$withEvent$);Class _logos_class$Rose$SPTNowPlayingFreeTierFeedbackButton = objc_getClass("SPTNowPlayingFreeTierFeedbackButton"); MSHookMessageEx(_logos_class$Rose$SPTNowPlayingFreeTierFeedbackButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$SPTNowPlayingFreeTierFeedbackButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$SPTNowPlayingFreeTierFeedbackButton$touchesBegan$withEvent$);Class _logos_class$Rose$SPTGaiaDevicesAvailableViewImplementation = objc_getClass("SPTGaiaDevicesAvailableViewImplementation"); MSHookMessageEx(_logos_class$Rose$SPTGaiaDevicesAvailableViewImplementation, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$SPTGaiaDevicesAvailableViewImplementation$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$SPTGaiaDevicesAvailableViewImplementation$touchesBegan$withEvent$);Class _logos_class$Rose$SPTNowPlayingMarqueeLabel = objc_getClass("SPTNowPlayingMarqueeLabel"); MSHookMessageEx(_logos_class$Rose$SPTNowPlayingMarqueeLabel, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$SPTNowPlayingMarqueeLabel$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$SPTNowPlayingMarqueeLabel$touchesBegan$withEvent$);Class _logos_class$Rose$SPTNowPlayingBarPlayButton = objc_getClass("SPTNowPlayingBarPlayButton"); MSHookMessageEx(_logos_class$Rose$SPTNowPlayingBarPlayButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$SPTNowPlayingBarPlayButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$SPTNowPlayingBarPlayButton$touchesBegan$withEvent$);Class _logos_class$Rose$IGUFIButtonBarView = objc_getClass("IGUFIButtonBarView"); MSHookMessageEx(_logos_class$Rose$IGUFIButtonBarView, @selector(_onLikeButtonPressed:), (IMP)&_logos_method$Rose$IGUFIButtonBarView$_onLikeButtonPressed$, (IMP*)&_logos_orig$Rose$IGUFIButtonBarView$_onLikeButtonPressed$);MSHookMessageEx(_logos_class$Rose$IGUFIButtonBarView, @selector(_onCommentButtonPressed:), (IMP)&_logos_method$Rose$IGUFIButtonBarView$_onCommentButtonPressed$, (IMP*)&_logos_orig$Rose$IGUFIButtonBarView$_onCommentButtonPressed$);MSHookMessageEx(_logos_class$Rose$IGUFIButtonBarView, @selector(_onSaveButtonLongPressed:), (IMP)&_logos_method$Rose$IGUFIButtonBarView$_onSaveButtonLongPressed$, (IMP*)&_logos_orig$Rose$IGUFIButtonBarView$_onSaveButtonLongPressed$);MSHookMessageEx(_logos_class$Rose$IGUFIButtonBarView, @selector(_onSaveButtonPressed:), (IMP)&_logos_method$Rose$IGUFIButtonBarView$_onSaveButtonPressed$, (IMP*)&_logos_orig$Rose$IGUFIButtonBarView$_onSaveButtonPressed$);MSHookMessageEx(_logos_class$Rose$IGUFIButtonBarView, @selector(_onSendButtonPressed:), (IMP)&_logos_method$Rose$IGUFIButtonBarView$_onSendButtonPressed$, (IMP*)&_logos_orig$Rose$IGUFIButtonBarView$_onSendButtonPressed$);Class _logos_class$Rose$AWEFeedVideoButton = objc_getClass("AWEFeedVideoButton"); MSHookMessageEx(_logos_class$Rose$AWEFeedVideoButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$AWEFeedVideoButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$AWEFeedVideoButton$touchesBegan$withEvent$);Class _logos_class$Rose$TFNCustomTabBar = objc_getClass("TFNCustomTabBar"); MSHookMessageEx(_logos_class$Rose$TFNCustomTabBar, @selector(tap:), (IMP)&_logos_method$Rose$TFNCustomTabBar$tap$, (IMP*)&_logos_orig$Rose$TFNCustomTabBar$tap$);Class _logos_class$Rose$T1StandardStatusView = objc_getClass("T1StandardStatusView"); MSHookMessageEx(_logos_class$Rose$T1StandardStatusView, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$T1StandardStatusView$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$T1StandardStatusView$touchesBegan$withEvent$);Class _logos_class$Rose$T1DirectMessageInboxSummaryView = objc_getClass("T1DirectMessageInboxSummaryView"); MSHookMessageEx(_logos_class$Rose$T1DirectMessageInboxSummaryView, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$T1DirectMessageInboxSummaryView$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$T1DirectMessageInboxSummaryView$touchesBegan$withEvent$);Class _logos_class$Rose$T1ActivityCell = objc_getClass("T1ActivityCell"); MSHookMessageEx(_logos_class$Rose$T1ActivityCell, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$T1ActivityCell$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$T1ActivityCell$touchesBegan$withEvent$);Class _logos_class$Rose$TFNFloatingActionButton = objc_getClass("TFNFloatingActionButton"); MSHookMessageEx(_logos_class$Rose$TFNFloatingActionButton, @selector(_tfn_expandingButtonAction:), (IMP)&_logos_method$Rose$TFNFloatingActionButton$_tfn_expandingButtonAction$, (IMP*)&_logos_orig$Rose$TFNFloatingActionButton$_tfn_expandingButtonAction$);Class _logos_class$Rose$_SFNavigationBarURLButton = objc_getClass("_SFNavigationBarURLButton"); MSHookMessageEx(_logos_class$Rose$_SFNavigationBarURLButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$_SFNavigationBarURLButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$_SFNavigationBarURLButton$touchesBegan$withEvent$);Class _logos_class$Rose$PHHandsetDialerNumberPadButton = objc_getClass("PHHandsetDialerNumberPadButton"); MSHookMessageEx(_logos_class$Rose$PHHandsetDialerNumberPadButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$PHHandsetDialerNumberPadButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$PHHandsetDialerNumberPadButton$touchesBegan$withEvent$);Class _logos_class$Rose$CNContactListTableViewCell = objc_getClass("CNContactListTableViewCell"); MSHookMessageEx(_logos_class$Rose$CNContactListTableViewCell, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$CNContactListTableViewCell$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$CNContactListTableViewCell$touchesBegan$withEvent$);Class _logos_class$Rose$PHHandsetDialerDeleteButton = objc_getClass("PHHandsetDialerDeleteButton"); MSHookMessageEx(_logos_class$Rose$PHHandsetDialerDeleteButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$PHHandsetDialerDeleteButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$PHHandsetDialerDeleteButton$touchesBegan$withEvent$);Class _logos_class$Rose$PHBottomBarButton = objc_getClass("PHBottomBarButton"); MSHookMessageEx(_logos_class$Rose$PHBottomBarButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$PHBottomBarButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$PHBottomBarButton$touchesBegan$withEvent$);Class _logos_class$Rose$FBTabBar = objc_getClass("FBTabBar"); MSHookMessageEx(_logos_class$Rose$FBTabBar, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$FBTabBar$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$FBTabBar$touchesBegan$withEvent$);Class _logos_class$Rose$FDSTetraPressStateAnnouncingControl = objc_getClass("FDSTetraPressStateAnnouncingControl"); MSHookMessageEx(_logos_class$Rose$FDSTetraPressStateAnnouncingControl, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$FDSTetraPressStateAnnouncingControl$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$FDSTetraPressStateAnnouncingControl$touchesBegan$withEvent$);Class _logos_class$Rose$FBNavigationBarButton = objc_getClass("FBNavigationBarButton"); MSHookMessageEx(_logos_class$Rose$FBNavigationBarButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$FBNavigationBarButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$FBNavigationBarButton$touchesBegan$withEvent$);Class _logos_class$Rose$NSProcessInfo = objc_getClass("NSProcessInfo"); MSHookMessageEx(_logos_class$Rose$NSProcessInfo, @selector(isLowPowerModeEnabled), (IMP)&_logos_method$Rose$NSProcessInfo$isLowPowerModeEnabled, (IMP*)&_logos_orig$Rose$NSProcessInfo$isLowPowerModeEnabled);}
            return;
        } else {
            dpkgInvalid = YES;
        }
    }
}
