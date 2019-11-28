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

@class SBUIIconForceTouchController; @class SBPowerDownController; @class SPTNowPlayingPlayButtonV2; @class PHHandsetDialerDeleteButton; @class SPTNowPlayingPreviousTrackButton; @class SBDashBoardMesaUnlockBehavior; @class CCUIToggleViewController; @class CNContactListTableViewCell; @class SBBacklightController; @class SBUIPasscodeLockViewBase; @class SPTNowPlayingShuffleButton; @class SBUIController; @class CCUILabeledRoundButton; @class SpringBoard; @class UIKBTree; @class SBSleepWakeHardwareButtonInteraction; @class TFNCustomTabBar; @class TFNFloatingActionButton; @class SPTNowPlayingSliderV2; @class SPTNowPlayingMarqueeLabel; @class SBVolumeControl; @class SPTNowPlayingQueueButton; @class SBFolderController; @class UICalloutBar; @class SBSearchScrollView; @class SBFolderView; @class SBCoverSheetPrimarySlidingViewController; @class VolumeControl; @class SBHIconManager; @class SBControlCenterController; @class UIKeyboardLayoutStar; @class AWEFeedVideoButton; @class T1ActivityCell; @class PHHandsetDialerNumberPadButton; @class SSScreenCapturer; @class SBIconController; @class SPTNowPlayingRepeatButton; @class ICSApplicationDelegate; @class SPTGaiaDevicesAvailableViewImplementation; @class T1StandardStatusView; @class SBAppSwitcherPageView; @class T1DirectMessageInboxSummaryView; @class SBPowerDownViewController; @class SBDashBoardViewController; @class SiriUISiriStatusView; @class PHBottomBarButton; @class IGUFIButtonBarView; @class SBMainDisplaySceneManager; @class SPTNowPlayingNextTrackButton; @class UIWindow; @class SPTNowPlayingFreeTierFeedbackButton; @class _SFNavigationBarURLButton; 

static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$UIKBTree(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("UIKBTree"); } return _klass; }
#line 71 "Tweak.x"
static void (*_logos_orig$Rose$SpringBoard$applicationDidFinishLaunching$)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SpringBoard$_ringerChanged$)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SpringBoard$_ringerChanged$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static BOOL (*_logos_orig$Rose$SpringBoard$_handlePhysicalButtonEvent$)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, UIPressesEvent *); static BOOL _logos_method$Rose$SpringBoard$_handlePhysicalButtonEvent$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, UIPressesEvent *); static void (*_logos_orig$Rose$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$)(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$SBSleepWakeHardwareButtonInteraction$_playLockSound)(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBSleepWakeHardwareButtonInteraction$_playLockSound(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$Rose$SBSleepWakeHardwareButtonInteraction$consumeInitialPressDown)(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$Rose$SBSleepWakeHardwareButtonInteraction$consumeInitialPressDown(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$VolumeControl$increaseVolume)(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$VolumeControl$increaseVolume(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$VolumeControl$decreaseVolume)(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$VolumeControl$decreaseVolume(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBVolumeControl$increaseVolume)(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBVolumeControl$increaseVolume(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBVolumeControl$decreaseVolume)(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBVolumeControl$decreaseVolume(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBPowerDownController$orderFront)(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBPowerDownController$orderFront(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBPowerDownViewController$viewWillAppear$)(_LOGOS_SELF_TYPE_NORMAL SBPowerDownViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$SBPowerDownViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL SBPowerDownViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$SBMainDisplaySceneManager$_appKilledInAppSwitcher$)(_LOGOS_SELF_TYPE_NORMAL SBMainDisplaySceneManager* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SBMainDisplaySceneManager$_appKilledInAppSwitcher$(_LOGOS_SELF_TYPE_NORMAL SBMainDisplaySceneManager* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$)(_LOGOS_SELF_TYPE_NORMAL SBUIIconForceTouchController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$(_LOGOS_SELF_TYPE_NORMAL SBUIIconForceTouchController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SBUIController$ACPowerChanged)(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBUIController$ACPowerChanged(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBUIController$handleWillBeginReachabilityAnimation)(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBUIController$handleWillBeginReachabilityAnimation(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBAppSwitcherPageView$setVisible$)(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherPageView* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$SBAppSwitcherPageView$setVisible$(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherPageView* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$SiriUISiriStatusView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL SiriUISiriStatusView* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SiriUISiriStatusView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SiriUISiriStatusView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$CCUILabeledRoundButton$buttonTapped$)(_LOGOS_SELF_TYPE_NORMAL CCUILabeledRoundButton* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$CCUILabeledRoundButton$buttonTapped$(_LOGOS_SELF_TYPE_NORMAL CCUILabeledRoundButton* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SBFolderController$prepareToOpen)(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBFolderController$prepareToOpen(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBIconController$viewDidAppear$)(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$SBIconController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$SBIconController$iconTapped$)(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SBIconController$iconTapped$(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SBHIconManager$iconTapped$)(_LOGOS_SELF_TYPE_NORMAL SBHIconManager* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SBHIconManager$iconTapped$(_LOGOS_SELF_TYPE_NORMAL SBHIconManager* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SBFolderView$scrollViewWillBeginDragging$)(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SBFolderView$scrollViewWillBeginDragging$(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_meta_orig$Rose$SSScreenCapturer$playScreenshotSound)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void _logos_meta_method$Rose$SSScreenCapturer$playScreenshotSound(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBUIPasscodeLockViewBase$_sendDelegateKeypadKeyDown)(_LOGOS_SELF_TYPE_NORMAL SBUIPasscodeLockViewBase* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBUIPasscodeLockViewBase$_sendDelegateKeypadKeyDown(_LOGOS_SELF_TYPE_NORMAL SBUIPasscodeLockViewBase* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$UIKeyboardLayoutStar$playKeyClickSoundOnDownForKey$)(_LOGOS_SELF_TYPE_NORMAL UIKeyboardLayoutStar* _LOGOS_SELF_CONST, SEL, UIKBTree *); static void _logos_method$Rose$UIKeyboardLayoutStar$playKeyClickSoundOnDownForKey$(_LOGOS_SELF_TYPE_NORMAL UIKeyboardLayoutStar* _LOGOS_SELF_CONST, SEL, UIKBTree *); static void (*_logos_orig$Rose$UIKeyboardLayoutStar$setPlayKeyClickSoundOn$)(_LOGOS_SELF_TYPE_NORMAL UIKeyboardLayoutStar* _LOGOS_SELF_CONST, SEL, int); static void _logos_method$Rose$UIKeyboardLayoutStar$setPlayKeyClickSoundOn$(_LOGOS_SELF_TYPE_NORMAL UIKeyboardLayoutStar* _LOGOS_SELF_CONST, SEL, int); static void (*_logos_orig$Rose$UICalloutBar$buttonPressed$)(_LOGOS_SELF_TYPE_NORMAL UICalloutBar* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$UICalloutBar$buttonPressed$(_LOGOS_SELF_TYPE_NORMAL UICalloutBar* _LOGOS_SELF_CONST, SEL, id); static BOOL (*_logos_orig$Rose$SBSearchScrollView$gestureRecognizerShouldBegin$)(_LOGOS_SELF_TYPE_NORMAL SBSearchScrollView* _LOGOS_SELF_CONST, SEL, id); static BOOL _logos_method$Rose$SBSearchScrollView$gestureRecognizerShouldBegin$(_LOGOS_SELF_TYPE_NORMAL SBSearchScrollView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$ICSApplicationDelegate$audioCallStatusChanged$)(_LOGOS_SELF_TYPE_NORMAL ICSApplicationDelegate* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$ICSApplicationDelegate$audioCallStatusChanged$(_LOGOS_SELF_TYPE_NORMAL ICSApplicationDelegate* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SBDashBoardViewController$setAuthenticated$)(_LOGOS_SELF_TYPE_NORMAL SBDashBoardViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$SBDashBoardViewController$setAuthenticated$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$SBDashBoardMesaUnlockBehavior$setAuthenticated$)(_LOGOS_SELF_TYPE_NORMAL SBDashBoardMesaUnlockBehavior* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$SBDashBoardMesaUnlockBehavior$setAuthenticated$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardMesaUnlockBehavior* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$SBBacklightController$turnOnScreenFullyWithBacklightSource$)(_LOGOS_SELF_TYPE_NORMAL SBBacklightController* _LOGOS_SELF_CONST, SEL, long long); static void _logos_method$Rose$SBBacklightController$turnOnScreenFullyWithBacklightSource$(_LOGOS_SELF_TYPE_NORMAL SBBacklightController* _LOGOS_SELF_CONST, SEL, long long); static BOOL (*_logos_orig$Rose$UIWindow$_shouldHitTestEntireScreen)(_LOGOS_SELF_TYPE_NORMAL UIWindow* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$Rose$UIWindow$_shouldHitTestEntireScreen(_LOGOS_SELF_TYPE_NORMAL UIWindow* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBControlCenterController$_willPresent)(_LOGOS_SELF_TYPE_NORMAL SBControlCenterController* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBControlCenterController$_willPresent(_LOGOS_SELF_TYPE_NORMAL SBControlCenterController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$CCUIToggleViewController$buttonTapped$forEvent$)(_LOGOS_SELF_TYPE_NORMAL CCUIToggleViewController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$CCUIToggleViewController$buttonTapped$forEvent$(_LOGOS_SELF_TYPE_NORMAL CCUIToggleViewController* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$SPTNowPlayingPlayButtonV2$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingPlayButtonV2* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$SPTNowPlayingPlayButtonV2$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingPlayButtonV2* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$SPTNowPlayingPreviousTrackButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingPreviousTrackButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$SPTNowPlayingPreviousTrackButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingPreviousTrackButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$SPTNowPlayingNextTrackButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingNextTrackButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$SPTNowPlayingNextTrackButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingNextTrackButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$SPTNowPlayingRepeatButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingRepeatButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$SPTNowPlayingRepeatButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingRepeatButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$SPTNowPlayingShuffleButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingShuffleButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$SPTNowPlayingShuffleButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingShuffleButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$SPTNowPlayingQueueButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingQueueButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$SPTNowPlayingQueueButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingQueueButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$SPTNowPlayingFreeTierFeedbackButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingFreeTierFeedbackButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$SPTNowPlayingFreeTierFeedbackButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingFreeTierFeedbackButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$SPTNowPlayingSliderV2$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingSliderV2* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$SPTNowPlayingSliderV2$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingSliderV2* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$SPTGaiaDevicesAvailableViewImplementation$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SPTGaiaDevicesAvailableViewImplementation* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$SPTGaiaDevicesAvailableViewImplementation$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTGaiaDevicesAvailableViewImplementation* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$SPTNowPlayingMarqueeLabel$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingMarqueeLabel* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$SPTNowPlayingMarqueeLabel$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingMarqueeLabel* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$IGUFIButtonBarView$_onLikeButtonPressed$)(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$IGUFIButtonBarView$_onLikeButtonPressed$(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$IGUFIButtonBarView$_onCommentButtonPressed$)(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$IGUFIButtonBarView$_onCommentButtonPressed$(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$IGUFIButtonBarView$_onSaveButtonLongPressed$)(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$IGUFIButtonBarView$_onSaveButtonLongPressed$(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$IGUFIButtonBarView$_onSaveButtonPressed$)(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$IGUFIButtonBarView$_onSaveButtonPressed$(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$IGUFIButtonBarView$_onSendButtonPressed$)(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$IGUFIButtonBarView$_onSendButtonPressed$(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$AWEFeedVideoButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL AWEFeedVideoButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$AWEFeedVideoButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL AWEFeedVideoButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$TFNCustomTabBar$tap$)(_LOGOS_SELF_TYPE_NORMAL TFNCustomTabBar* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$TFNCustomTabBar$tap$(_LOGOS_SELF_TYPE_NORMAL TFNCustomTabBar* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$T1StandardStatusView$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL T1StandardStatusView* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$T1StandardStatusView$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL T1StandardStatusView* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$T1DirectMessageInboxSummaryView$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL T1DirectMessageInboxSummaryView* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$T1DirectMessageInboxSummaryView$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL T1DirectMessageInboxSummaryView* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$T1ActivityCell$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL T1ActivityCell* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$T1ActivityCell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL T1ActivityCell* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$TFNFloatingActionButton$_tfn_expandingButtonAction$)(_LOGOS_SELF_TYPE_NORMAL TFNFloatingActionButton* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$TFNFloatingActionButton$_tfn_expandingButtonAction$(_LOGOS_SELF_TYPE_NORMAL TFNFloatingActionButton* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$_SFNavigationBarURLButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL _SFNavigationBarURLButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$_SFNavigationBarURLButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL _SFNavigationBarURLButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$PHHandsetDialerNumberPadButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL PHHandsetDialerNumberPadButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$PHHandsetDialerNumberPadButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL PHHandsetDialerNumberPadButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$CNContactListTableViewCell$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL CNContactListTableViewCell* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$CNContactListTableViewCell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL CNContactListTableViewCell* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$PHHandsetDialerDeleteButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL PHHandsetDialerDeleteButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$PHHandsetDialerDeleteButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL PHHandsetDialerDeleteButton* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$Rose$PHBottomBarButton$touchesBegan$withEvent$)(_LOGOS_SELF_TYPE_NORMAL PHBottomBarButton* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$Rose$PHBottomBarButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL PHBottomBarButton* _LOGOS_SELF_CONST, SEL, id, id); 



static void _logos_method$Rose$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$SpringBoard$applicationDidFinishLaunching$(self, _cmd, arg1);

	if (enabled && respringSwitch) {
		triggerFeedback();

	}

}

static void _logos_method$Rose$SpringBoard$_ringerChanged$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$SpringBoard$_ringerChanged$(self, _cmd, arg1);

	if (enabled && ringerSwitch) {
		triggerFeedback();

	}

}

static BOOL _logos_method$Rose$SpringBoard$_handlePhysicalButtonEvent$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIPressesEvent * arg1) {

	
	
	

	
	int force = arg1.allPresses.allObjects[0].force;

	if (force == 1) {
		if (enabled && homeButtonSwitch) {
			triggerFeedback();

		}

	}

	return _logos_orig$Rose$SpringBoard$_handlePhysicalButtonEvent$(self, _cmd, arg1);
}





static void _logos_method$Rose$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {

	_logos_orig$Rose$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$(self, _cmd, arg1);

	if (enabled && unlockSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$SBSleepWakeHardwareButtonInteraction$_playLockSound(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SBSleepWakeHardwareButtonInteraction$_playLockSound(self, _cmd);

	if (enabled && lockSwitch) {
		triggerFeedback();

	}

}

static BOOL _logos_method$Rose$SBSleepWakeHardwareButtonInteraction$consumeInitialPressDown(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	if (enabled && sleepButtonSwitch) {
		triggerFeedback();

	}

	return _logos_orig$Rose$SBSleepWakeHardwareButtonInteraction$consumeInitialPressDown(self, _cmd);

}





static void _logos_method$Rose$VolumeControl$increaseVolume(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$VolumeControl$increaseVolume(self, _cmd);
	
	if (enabled && volumeSwitch) {
		triggerFeedback();

	}

}

static void _logos_method$Rose$VolumeControl$decreaseVolume(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$VolumeControl$decreaseVolume(self, _cmd);

	if (enabled && volumeSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$SBVolumeControl$increaseVolume(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SBVolumeControl$increaseVolume(self, _cmd);
	
	if (enabled && volumeSwitch) {
		triggerFeedback();

	}

}

static void _logos_method$Rose$SBVolumeControl$decreaseVolume(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SBVolumeControl$decreaseVolume(self, _cmd);

	if (enabled && volumeSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$SBPowerDownController$orderFront(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SBPowerDownController$orderFront(self, _cmd);

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
		_logos_orig$Rose$SBPowerDownController$orderFront(self, _cmd);
		triggerFeedback();

	} else {
		_logos_orig$Rose$SBPowerDownController$orderFront(self, _cmd);

	}

}





static void _logos_method$Rose$SBPowerDownViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL SBPowerDownViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {

	_logos_orig$Rose$SBPowerDownViewController$viewWillAppear$(self, _cmd, arg1);

	if (enabled && powerSwitch) {
		triggerFeedback();

	}
}





static void _logos_method$Rose$SBMainDisplaySceneManager$_appKilledInAppSwitcher$(_LOGOS_SELF_TYPE_NORMAL SBMainDisplaySceneManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$SBMainDisplaySceneManager$_appKilledInAppSwitcher$(self, _cmd, arg1);

	if (enabled && killingSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$(_LOGOS_SELF_TYPE_NORMAL SBUIIconForceTouchController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$(self, _cmd, arg1);

	if (enabled && forceSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$SBUIController$ACPowerChanged(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SBUIController$ACPowerChanged(self, _cmd);

	if (enabled && pluggedSwitch) {
		triggerFeedback();

	}

}

static void _logos_method$Rose$SBUIController$handleWillBeginReachabilityAnimation(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SBUIController$handleWillBeginReachabilityAnimation(self, _cmd);

	if (enabled && reachabilitySwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$SBAppSwitcherPageView$setVisible$(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherPageView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {

	_logos_orig$Rose$SBAppSwitcherPageView$setVisible$(self, _cmd, arg1);

	if (enabled && switcherSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$SiriUISiriStatusView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SiriUISiriStatusView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SiriUISiriStatusView$layoutSubviews(self, _cmd);
	
	if (enabled && siriSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$CCUILabeledRoundButton$buttonTapped$(_LOGOS_SELF_TYPE_NORMAL CCUILabeledRoundButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$CCUILabeledRoundButton$buttonTapped$(self, _cmd, arg1);

	if (enabled && ccToggleSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$SBFolderController$prepareToOpen(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SBFolderController$prepareToOpen(self, _cmd);

	if (enabled && folderSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$SBIconController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL animated) {

	_logos_orig$Rose$SBIconController$viewDidAppear$(self, _cmd, animated);

	if (enabled && touchesSwitch && featureWarningSwitch) {
		UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Rose"
		message:@"Please consider to not using the 'feedback on every touch' feature too often, because it could harm your Haptic/Taptic Engine. It's not my fault if something happens.\n[This alert can be turned off in Rose's settings]"
		preferredStyle:UIAlertControllerStyleAlert];

		UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Understood" style:UIAlertActionStyleCancel handler:nil];

		[alert addAction:cancelAction];

		[self presentViewController:alert animated:YES completion:nil];

	}

}

static void _logos_method$Rose$SBIconController$iconTapped$(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$SBIconController$iconTapped$(self, _cmd, arg1);

	if (enabled && iconTapSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$SBHIconManager$iconTapped$(_LOGOS_SELF_TYPE_NORMAL SBHIconManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$SBHIconManager$iconTapped$(self, _cmd, arg1);

	if (enabled && iconTapSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$SBFolderView$scrollViewWillBeginDragging$(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$SBFolderView$scrollViewWillBeginDragging$(self, _cmd, arg1);

	if (enabled && pageSwipeSwitch) {
		triggerFeedback();

	}

}





static void _logos_meta_method$Rose$SSScreenCapturer$playScreenshotSound(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_meta_orig$Rose$SSScreenCapturer$playScreenshotSound(self, _cmd);

	if (enabled && screenshotSwitch) {
		triggerFeedback();

	}

}



 

static void _logos_method$Rose$SBUIPasscodeLockViewBase$_sendDelegateKeypadKeyDown(_LOGOS_SELF_TYPE_NORMAL SBUIPasscodeLockViewBase* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SBUIPasscodeLockViewBase$_sendDelegateKeypadKeyDown(self, _cmd);

	if (enabled && passcodeSwitch) {
		triggerFeedback();

	}

}

	



static void _logos_method$Rose$UIKeyboardLayoutStar$playKeyClickSoundOnDownForKey$(_LOGOS_SELF_TYPE_NORMAL UIKeyboardLayoutStar* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIKBTree * key) {

	_logos_orig$Rose$UIKeyboardLayoutStar$playKeyClickSoundOnDownForKey$(self, _cmd, key);

	if (enabled && keyboardSwitch) {
		triggerFeedback();

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

	if (enabled && textSelectionSwitch) {
		triggerFeedback();

	}

}





static BOOL _logos_method$Rose$SBSearchScrollView$gestureRecognizerShouldBegin$(_LOGOS_SELF_TYPE_NORMAL SBSearchScrollView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$SBSearchScrollView$gestureRecognizerShouldBegin$(self, _cmd, arg1);

	if (enabled && spotlightSwitch) {
		triggerFeedback();

	}

	return _logos_orig$Rose$SBSearchScrollView$gestureRecognizerShouldBegin$(self, _cmd, arg1);

}





static void _logos_method$Rose$ICSApplicationDelegate$audioCallStatusChanged$(_LOGOS_SELF_TYPE_NORMAL ICSApplicationDelegate* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$ICSApplicationDelegate$audioCallStatusChanged$(self, _cmd, arg1);

	if (enabled && callSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$SBDashBoardViewController$setAuthenticated$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL authenticated) {

    _logos_orig$Rose$SBDashBoardViewController$setAuthenticated$(self, _cmd, authenticated);

    if (authenticated) {

		if (enabled && authenticationSwitch) {
			triggerFeedback();

		}

	}

}





static void _logos_method$Rose$SBDashBoardMesaUnlockBehavior$setAuthenticated$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardMesaUnlockBehavior* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {

	_logos_orig$Rose$SBDashBoardMesaUnlockBehavior$setAuthenticated$(self, _cmd, arg1);

    if (arg1) {

		if (enabled && authenticationSwitch) {
			triggerFeedback();

		}

	}

}





static void _logos_method$Rose$SBBacklightController$turnOnScreenFullyWithBacklightSource$(_LOGOS_SELF_TYPE_NORMAL SBBacklightController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, long long source) {

	_logos_orig$Rose$SBBacklightController$turnOnScreenFullyWithBacklightSource$(self, _cmd, source);
	
	if (source != 26) {
		if (enabled && wakeSwitch) {
			triggerFeedback();

		}

	}
}





static BOOL _logos_method$Rose$UIWindow$_shouldHitTestEntireScreen(_LOGOS_SELF_TYPE_NORMAL UIWindow* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	if (enabled && touchesSwitch) {
		triggerFeedback();

		return YES;

	} else {
		return _logos_orig$Rose$UIWindow$_shouldHitTestEntireScreen(self, _cmd);

	}

}





static void _logos_method$Rose$SBControlCenterController$_willPresent(_LOGOS_SELF_TYPE_NORMAL SBControlCenterController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SBControlCenterController$_willPresent(self, _cmd);

	if (enabled && openControlCenterSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$CCUIToggleViewController$buttonTapped$forEvent$(_LOGOS_SELF_TYPE_NORMAL CCUIToggleViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$CCUIToggleViewController$buttonTapped$forEvent$(self, _cmd, arg1, arg2);

	if (enabled && ccModuleSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$SPTNowPlayingPlayButtonV2$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingPlayButtonV2* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$SPTNowPlayingPlayButtonV2$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	if (enabled && SPTplayButtonSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$SPTNowPlayingPreviousTrackButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingPreviousTrackButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$SPTNowPlayingPreviousTrackButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	if (enabled && SPTpreviousTrackButtonSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$SPTNowPlayingNextTrackButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingNextTrackButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$SPTNowPlayingNextTrackButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	if (enabled && SPTnextTrackButtonSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$SPTNowPlayingRepeatButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingRepeatButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$SPTNowPlayingRepeatButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	if (enabled && SPTrepeatButtonSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$SPTNowPlayingShuffleButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingShuffleButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$SPTNowPlayingShuffleButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	if (enabled && SPTshuffleButtonSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$SPTNowPlayingQueueButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingQueueButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$SPTNowPlayingQueueButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	if (enabled && SPTqueueButtonSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$SPTNowPlayingFreeTierFeedbackButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingFreeTierFeedbackButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$SPTNowPlayingFreeTierFeedbackButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	if (enabled && SPTfreeTierButtonSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$SPTNowPlayingSliderV2$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingSliderV2* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$SPTNowPlayingSliderV2$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	if (enabled && SPTsliderSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$SPTGaiaDevicesAvailableViewImplementation$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTGaiaDevicesAvailableViewImplementation* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$SPTGaiaDevicesAvailableViewImplementation$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	if (enabled && SPTavailableDevicesButtonSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$SPTNowPlayingMarqueeLabel$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL SPTNowPlayingMarqueeLabel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$SPTNowPlayingMarqueeLabel$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	if (enabled && SPTnowPlayingLabelSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$IGUFIButtonBarView$_onLikeButtonPressed$(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$IGUFIButtonBarView$_onLikeButtonPressed$(self, _cmd, arg1);

	if (enabled && ITGlikeButtonSwitch) {
		triggerFeedback();

	}

}

static void _logos_method$Rose$IGUFIButtonBarView$_onCommentButtonPressed$(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$IGUFIButtonBarView$_onCommentButtonPressed$(self, _cmd, arg1);

	if (enabled && ITGcommentButtonSwitch) {
		triggerFeedback();

	}

}

static void _logos_method$Rose$IGUFIButtonBarView$_onSaveButtonLongPressed$(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$IGUFIButtonBarView$_onSaveButtonLongPressed$(self, _cmd, arg1);

	if (enabled && ITGsaveButtonSwitch) {
		triggerFeedback();

	}

}

static void _logos_method$Rose$IGUFIButtonBarView$_onSaveButtonPressed$(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$IGUFIButtonBarView$_onSaveButtonPressed$(self, _cmd, arg1);

	if (enabled && ITGsaveButtonSwitch) {
		triggerFeedback();

	}

}

static void _logos_method$Rose$IGUFIButtonBarView$_onSendButtonPressed$(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$IGUFIButtonBarView$_onSendButtonPressed$(self, _cmd, arg1);

	if (enabled && ITGsendButtonSwitch) {
		triggerFeedback();

	}
	
}





static void _logos_method$Rose$AWEFeedVideoButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL AWEFeedVideoButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$AWEFeedVideoButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	if (enabled && TTlikeCommentShareButtonsSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$TFNCustomTabBar$tap$(_LOGOS_SELF_TYPE_NORMAL TFNCustomTabBar* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$TFNCustomTabBar$tap$(self, _cmd, arg1);

	if (enabled && TWTtabBarSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$T1StandardStatusView$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL T1StandardStatusView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$T1StandardStatusView$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	if (enabled && TWTtweetViewSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$T1DirectMessageInboxSummaryView$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL T1DirectMessageInboxSummaryView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$T1DirectMessageInboxSummaryView$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	if (enabled && TWTdirectMessagesTapSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$T1ActivityCell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL T1ActivityCell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$T1ActivityCell$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	if (enabled && TWTactivityTapSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$TFNFloatingActionButton$_tfn_expandingButtonAction$(_LOGOS_SELF_TYPE_NORMAL TFNFloatingActionButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$TFNFloatingActionButton$_tfn_expandingButtonAction$(self, _cmd, arg1);

	if (enabled && TWTtweetButtonSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$_SFNavigationBarURLButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL _SFNavigationBarURLButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$_SFNavigationBarURLButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	if (enabled && SFUrlSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$PHHandsetDialerNumberPadButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL PHHandsetDialerNumberPadButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$PHHandsetDialerNumberPadButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	if (enabled && PHNumberPadSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$CNContactListTableViewCell$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL CNContactListTableViewCell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$CNContactListTableViewCell$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	if (enabled && PHContactCellSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$PHHandsetDialerDeleteButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL PHHandsetDialerDeleteButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$PHHandsetDialerDeleteButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	if (enabled && PHDialerDeleteButtonSwitch) {
		triggerFeedback();

	}

}





static void _logos_method$Rose$PHBottomBarButton$touchesBegan$withEvent$(_LOGOS_SELF_TYPE_NORMAL PHBottomBarButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {

	_logos_orig$Rose$PHBottomBarButton$touchesBegan$withEvent$(self, _cmd, arg1, arg2);

	if (enabled && PHDialerCallButtonSwitch) {
		triggerFeedback();

	}

}



 
 
static __attribute__((constructor)) void _logosLocalCtor_b1b5d1aa(int __unused argc, char __unused **argv, char __unused **envp) {

	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)triggerFeedback, (CFStringRef)RoseTriggerActivator, NULL, kNilOptions);

}

static __attribute__((constructor)) void _logosLocalCtor_6fcf395e(int __unused argc, char __unused **argv, char __unused **envp) {
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

	[pfs registerBool:&shutdownWarningSwitch default:YES forKey:@"shutdownWarning"];
	[pfs registerBool:&featureWarningSwitch default:YES forKey:@"featureWarning"];
    [pfs registerObject:&hapticLevel default:@"0" forKey:@"HapticStrength"];
	[pfs registerObject:&tapticLevel default:@"0" forKey:@"TapticStrength"];
	[pfs registerBool:&delaySwitch default:NO forKey:@"enableHapticDelay"];
	[pfs registerObject:&delayLevel default:@"0" forKey:@"Delay"];

    if(enabled)
    	{Class _logos_class$Rose$SpringBoard = objc_getClass("SpringBoard"); MSHookMessageEx(_logos_class$Rose$SpringBoard, @selector(applicationDidFinishLaunching:), (IMP)&_logos_method$Rose$SpringBoard$applicationDidFinishLaunching$, (IMP*)&_logos_orig$Rose$SpringBoard$applicationDidFinishLaunching$);MSHookMessageEx(_logos_class$Rose$SpringBoard, @selector(_ringerChanged:), (IMP)&_logos_method$Rose$SpringBoard$_ringerChanged$, (IMP*)&_logos_orig$Rose$SpringBoard$_ringerChanged$);MSHookMessageEx(_logos_class$Rose$SpringBoard, @selector(_handlePhysicalButtonEvent:), (IMP)&_logos_method$Rose$SpringBoard$_handlePhysicalButtonEvent$, (IMP*)&_logos_orig$Rose$SpringBoard$_handlePhysicalButtonEvent$);Class _logos_class$Rose$SBCoverSheetPrimarySlidingViewController = objc_getClass("SBCoverSheetPrimarySlidingViewController"); MSHookMessageEx(_logos_class$Rose$SBCoverSheetPrimarySlidingViewController, @selector(viewWillDisappear:), (IMP)&_logos_method$Rose$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$, (IMP*)&_logos_orig$Rose$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$);Class _logos_class$Rose$SBSleepWakeHardwareButtonInteraction = objc_getClass("SBSleepWakeHardwareButtonInteraction"); MSHookMessageEx(_logos_class$Rose$SBSleepWakeHardwareButtonInteraction, @selector(_playLockSound), (IMP)&_logos_method$Rose$SBSleepWakeHardwareButtonInteraction$_playLockSound, (IMP*)&_logos_orig$Rose$SBSleepWakeHardwareButtonInteraction$_playLockSound);MSHookMessageEx(_logos_class$Rose$SBSleepWakeHardwareButtonInteraction, @selector(consumeInitialPressDown), (IMP)&_logos_method$Rose$SBSleepWakeHardwareButtonInteraction$consumeInitialPressDown, (IMP*)&_logos_orig$Rose$SBSleepWakeHardwareButtonInteraction$consumeInitialPressDown);Class _logos_class$Rose$VolumeControl = objc_getClass("VolumeControl"); MSHookMessageEx(_logos_class$Rose$VolumeControl, @selector(increaseVolume), (IMP)&_logos_method$Rose$VolumeControl$increaseVolume, (IMP*)&_logos_orig$Rose$VolumeControl$increaseVolume);MSHookMessageEx(_logos_class$Rose$VolumeControl, @selector(decreaseVolume), (IMP)&_logos_method$Rose$VolumeControl$decreaseVolume, (IMP*)&_logos_orig$Rose$VolumeControl$decreaseVolume);Class _logos_class$Rose$SBVolumeControl = objc_getClass("SBVolumeControl"); MSHookMessageEx(_logos_class$Rose$SBVolumeControl, @selector(increaseVolume), (IMP)&_logos_method$Rose$SBVolumeControl$increaseVolume, (IMP*)&_logos_orig$Rose$SBVolumeControl$increaseVolume);MSHookMessageEx(_logos_class$Rose$SBVolumeControl, @selector(decreaseVolume), (IMP)&_logos_method$Rose$SBVolumeControl$decreaseVolume, (IMP*)&_logos_orig$Rose$SBVolumeControl$decreaseVolume);Class _logos_class$Rose$SBPowerDownController = objc_getClass("SBPowerDownController"); MSHookMessageEx(_logos_class$Rose$SBPowerDownController, @selector(orderFront), (IMP)&_logos_method$Rose$SBPowerDownController$orderFront, (IMP*)&_logos_orig$Rose$SBPowerDownController$orderFront);Class _logos_class$Rose$SBPowerDownViewController = objc_getClass("SBPowerDownViewController"); MSHookMessageEx(_logos_class$Rose$SBPowerDownViewController, @selector(viewWillAppear:), (IMP)&_logos_method$Rose$SBPowerDownViewController$viewWillAppear$, (IMP*)&_logos_orig$Rose$SBPowerDownViewController$viewWillAppear$);Class _logos_class$Rose$SBMainDisplaySceneManager = objc_getClass("SBMainDisplaySceneManager"); MSHookMessageEx(_logos_class$Rose$SBMainDisplaySceneManager, @selector(_appKilledInAppSwitcher:), (IMP)&_logos_method$Rose$SBMainDisplaySceneManager$_appKilledInAppSwitcher$, (IMP*)&_logos_orig$Rose$SBMainDisplaySceneManager$_appKilledInAppSwitcher$);Class _logos_class$Rose$SBUIIconForceTouchController = objc_getClass("SBUIIconForceTouchController"); MSHookMessageEx(_logos_class$Rose$SBUIIconForceTouchController, @selector(iconForceTouchViewControllerWillDismiss:), (IMP)&_logos_method$Rose$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$, (IMP*)&_logos_orig$Rose$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$);Class _logos_class$Rose$SBUIController = objc_getClass("SBUIController"); MSHookMessageEx(_logos_class$Rose$SBUIController, @selector(ACPowerChanged), (IMP)&_logos_method$Rose$SBUIController$ACPowerChanged, (IMP*)&_logos_orig$Rose$SBUIController$ACPowerChanged);MSHookMessageEx(_logos_class$Rose$SBUIController, @selector(handleWillBeginReachabilityAnimation), (IMP)&_logos_method$Rose$SBUIController$handleWillBeginReachabilityAnimation, (IMP*)&_logos_orig$Rose$SBUIController$handleWillBeginReachabilityAnimation);Class _logos_class$Rose$SBAppSwitcherPageView = objc_getClass("SBAppSwitcherPageView"); MSHookMessageEx(_logos_class$Rose$SBAppSwitcherPageView, @selector(setVisible:), (IMP)&_logos_method$Rose$SBAppSwitcherPageView$setVisible$, (IMP*)&_logos_orig$Rose$SBAppSwitcherPageView$setVisible$);Class _logos_class$Rose$SiriUISiriStatusView = objc_getClass("SiriUISiriStatusView"); MSHookMessageEx(_logos_class$Rose$SiriUISiriStatusView, @selector(layoutSubviews), (IMP)&_logos_method$Rose$SiriUISiriStatusView$layoutSubviews, (IMP*)&_logos_orig$Rose$SiriUISiriStatusView$layoutSubviews);Class _logos_class$Rose$CCUILabeledRoundButton = objc_getClass("CCUILabeledRoundButton"); MSHookMessageEx(_logos_class$Rose$CCUILabeledRoundButton, @selector(buttonTapped:), (IMP)&_logos_method$Rose$CCUILabeledRoundButton$buttonTapped$, (IMP*)&_logos_orig$Rose$CCUILabeledRoundButton$buttonTapped$);Class _logos_class$Rose$SBFolderController = objc_getClass("SBFolderController"); MSHookMessageEx(_logos_class$Rose$SBFolderController, @selector(prepareToOpen), (IMP)&_logos_method$Rose$SBFolderController$prepareToOpen, (IMP*)&_logos_orig$Rose$SBFolderController$prepareToOpen);Class _logos_class$Rose$SBIconController = objc_getClass("SBIconController"); MSHookMessageEx(_logos_class$Rose$SBIconController, @selector(viewDidAppear:), (IMP)&_logos_method$Rose$SBIconController$viewDidAppear$, (IMP*)&_logos_orig$Rose$SBIconController$viewDidAppear$);MSHookMessageEx(_logos_class$Rose$SBIconController, @selector(iconTapped:), (IMP)&_logos_method$Rose$SBIconController$iconTapped$, (IMP*)&_logos_orig$Rose$SBIconController$iconTapped$);Class _logos_class$Rose$SBHIconManager = objc_getClass("SBHIconManager"); MSHookMessageEx(_logos_class$Rose$SBHIconManager, @selector(iconTapped:), (IMP)&_logos_method$Rose$SBHIconManager$iconTapped$, (IMP*)&_logos_orig$Rose$SBHIconManager$iconTapped$);Class _logos_class$Rose$SBFolderView = objc_getClass("SBFolderView"); MSHookMessageEx(_logos_class$Rose$SBFolderView, @selector(scrollViewWillBeginDragging:), (IMP)&_logos_method$Rose$SBFolderView$scrollViewWillBeginDragging$, (IMP*)&_logos_orig$Rose$SBFolderView$scrollViewWillBeginDragging$);Class _logos_class$Rose$SSScreenCapturer = objc_getClass("SSScreenCapturer"); Class _logos_metaclass$Rose$SSScreenCapturer = object_getClass(_logos_class$Rose$SSScreenCapturer); MSHookMessageEx(_logos_metaclass$Rose$SSScreenCapturer, @selector(playScreenshotSound), (IMP)&_logos_meta_method$Rose$SSScreenCapturer$playScreenshotSound, (IMP*)&_logos_meta_orig$Rose$SSScreenCapturer$playScreenshotSound);Class _logos_class$Rose$SBUIPasscodeLockViewBase = objc_getClass("SBUIPasscodeLockViewBase"); MSHookMessageEx(_logos_class$Rose$SBUIPasscodeLockViewBase, @selector(_sendDelegateKeypadKeyDown), (IMP)&_logos_method$Rose$SBUIPasscodeLockViewBase$_sendDelegateKeypadKeyDown, (IMP*)&_logos_orig$Rose$SBUIPasscodeLockViewBase$_sendDelegateKeypadKeyDown);Class _logos_class$Rose$UIKeyboardLayoutStar = objc_getClass("UIKeyboardLayoutStar"); MSHookMessageEx(_logos_class$Rose$UIKeyboardLayoutStar, @selector(playKeyClickSoundOnDownForKey:), (IMP)&_logos_method$Rose$UIKeyboardLayoutStar$playKeyClickSoundOnDownForKey$, (IMP*)&_logos_orig$Rose$UIKeyboardLayoutStar$playKeyClickSoundOnDownForKey$);MSHookMessageEx(_logos_class$Rose$UIKeyboardLayoutStar, @selector(setPlayKeyClickSoundOn:), (IMP)&_logos_method$Rose$UIKeyboardLayoutStar$setPlayKeyClickSoundOn$, (IMP*)&_logos_orig$Rose$UIKeyboardLayoutStar$setPlayKeyClickSoundOn$);Class _logos_class$Rose$UICalloutBar = objc_getClass("UICalloutBar"); MSHookMessageEx(_logos_class$Rose$UICalloutBar, @selector(buttonPressed:), (IMP)&_logos_method$Rose$UICalloutBar$buttonPressed$, (IMP*)&_logos_orig$Rose$UICalloutBar$buttonPressed$);Class _logos_class$Rose$SBSearchScrollView = objc_getClass("SBSearchScrollView"); MSHookMessageEx(_logos_class$Rose$SBSearchScrollView, @selector(gestureRecognizerShouldBegin:), (IMP)&_logos_method$Rose$SBSearchScrollView$gestureRecognizerShouldBegin$, (IMP*)&_logos_orig$Rose$SBSearchScrollView$gestureRecognizerShouldBegin$);Class _logos_class$Rose$ICSApplicationDelegate = objc_getClass("ICSApplicationDelegate"); MSHookMessageEx(_logos_class$Rose$ICSApplicationDelegate, @selector(audioCallStatusChanged:), (IMP)&_logos_method$Rose$ICSApplicationDelegate$audioCallStatusChanged$, (IMP*)&_logos_orig$Rose$ICSApplicationDelegate$audioCallStatusChanged$);Class _logos_class$Rose$SBDashBoardViewController = objc_getClass("SBDashBoardViewController"); MSHookMessageEx(_logos_class$Rose$SBDashBoardViewController, @selector(setAuthenticated:), (IMP)&_logos_method$Rose$SBDashBoardViewController$setAuthenticated$, (IMP*)&_logos_orig$Rose$SBDashBoardViewController$setAuthenticated$);Class _logos_class$Rose$SBDashBoardMesaUnlockBehavior = objc_getClass("SBDashBoardMesaUnlockBehavior"); MSHookMessageEx(_logos_class$Rose$SBDashBoardMesaUnlockBehavior, @selector(setAuthenticated:), (IMP)&_logos_method$Rose$SBDashBoardMesaUnlockBehavior$setAuthenticated$, (IMP*)&_logos_orig$Rose$SBDashBoardMesaUnlockBehavior$setAuthenticated$);Class _logos_class$Rose$SBBacklightController = objc_getClass("SBBacklightController"); MSHookMessageEx(_logos_class$Rose$SBBacklightController, @selector(turnOnScreenFullyWithBacklightSource:), (IMP)&_logos_method$Rose$SBBacklightController$turnOnScreenFullyWithBacklightSource$, (IMP*)&_logos_orig$Rose$SBBacklightController$turnOnScreenFullyWithBacklightSource$);Class _logos_class$Rose$UIWindow = objc_getClass("UIWindow"); MSHookMessageEx(_logos_class$Rose$UIWindow, @selector(_shouldHitTestEntireScreen), (IMP)&_logos_method$Rose$UIWindow$_shouldHitTestEntireScreen, (IMP*)&_logos_orig$Rose$UIWindow$_shouldHitTestEntireScreen);Class _logos_class$Rose$SBControlCenterController = objc_getClass("SBControlCenterController"); MSHookMessageEx(_logos_class$Rose$SBControlCenterController, @selector(_willPresent), (IMP)&_logos_method$Rose$SBControlCenterController$_willPresent, (IMP*)&_logos_orig$Rose$SBControlCenterController$_willPresent);Class _logos_class$Rose$CCUIToggleViewController = objc_getClass("CCUIToggleViewController"); MSHookMessageEx(_logos_class$Rose$CCUIToggleViewController, @selector(buttonTapped:forEvent:), (IMP)&_logos_method$Rose$CCUIToggleViewController$buttonTapped$forEvent$, (IMP*)&_logos_orig$Rose$CCUIToggleViewController$buttonTapped$forEvent$);Class _logos_class$Rose$SPTNowPlayingPlayButtonV2 = objc_getClass("SPTNowPlayingPlayButtonV2"); MSHookMessageEx(_logos_class$Rose$SPTNowPlayingPlayButtonV2, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$SPTNowPlayingPlayButtonV2$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$SPTNowPlayingPlayButtonV2$touchesBegan$withEvent$);Class _logos_class$Rose$SPTNowPlayingPreviousTrackButton = objc_getClass("SPTNowPlayingPreviousTrackButton"); MSHookMessageEx(_logos_class$Rose$SPTNowPlayingPreviousTrackButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$SPTNowPlayingPreviousTrackButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$SPTNowPlayingPreviousTrackButton$touchesBegan$withEvent$);Class _logos_class$Rose$SPTNowPlayingNextTrackButton = objc_getClass("SPTNowPlayingNextTrackButton"); MSHookMessageEx(_logos_class$Rose$SPTNowPlayingNextTrackButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$SPTNowPlayingNextTrackButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$SPTNowPlayingNextTrackButton$touchesBegan$withEvent$);Class _logos_class$Rose$SPTNowPlayingRepeatButton = objc_getClass("SPTNowPlayingRepeatButton"); MSHookMessageEx(_logos_class$Rose$SPTNowPlayingRepeatButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$SPTNowPlayingRepeatButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$SPTNowPlayingRepeatButton$touchesBegan$withEvent$);Class _logos_class$Rose$SPTNowPlayingShuffleButton = objc_getClass("SPTNowPlayingShuffleButton"); MSHookMessageEx(_logos_class$Rose$SPTNowPlayingShuffleButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$SPTNowPlayingShuffleButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$SPTNowPlayingShuffleButton$touchesBegan$withEvent$);Class _logos_class$Rose$SPTNowPlayingQueueButton = objc_getClass("SPTNowPlayingQueueButton"); MSHookMessageEx(_logos_class$Rose$SPTNowPlayingQueueButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$SPTNowPlayingQueueButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$SPTNowPlayingQueueButton$touchesBegan$withEvent$);Class _logos_class$Rose$SPTNowPlayingFreeTierFeedbackButton = objc_getClass("SPTNowPlayingFreeTierFeedbackButton"); MSHookMessageEx(_logos_class$Rose$SPTNowPlayingFreeTierFeedbackButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$SPTNowPlayingFreeTierFeedbackButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$SPTNowPlayingFreeTierFeedbackButton$touchesBegan$withEvent$);Class _logos_class$Rose$SPTNowPlayingSliderV2 = objc_getClass("SPTNowPlayingSliderV2"); MSHookMessageEx(_logos_class$Rose$SPTNowPlayingSliderV2, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$SPTNowPlayingSliderV2$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$SPTNowPlayingSliderV2$touchesBegan$withEvent$);Class _logos_class$Rose$SPTGaiaDevicesAvailableViewImplementation = objc_getClass("SPTGaiaDevicesAvailableViewImplementation"); MSHookMessageEx(_logos_class$Rose$SPTGaiaDevicesAvailableViewImplementation, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$SPTGaiaDevicesAvailableViewImplementation$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$SPTGaiaDevicesAvailableViewImplementation$touchesBegan$withEvent$);Class _logos_class$Rose$SPTNowPlayingMarqueeLabel = objc_getClass("SPTNowPlayingMarqueeLabel"); MSHookMessageEx(_logos_class$Rose$SPTNowPlayingMarqueeLabel, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$SPTNowPlayingMarqueeLabel$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$SPTNowPlayingMarqueeLabel$touchesBegan$withEvent$);Class _logos_class$Rose$IGUFIButtonBarView = objc_getClass("IGUFIButtonBarView"); MSHookMessageEx(_logos_class$Rose$IGUFIButtonBarView, @selector(_onLikeButtonPressed:), (IMP)&_logos_method$Rose$IGUFIButtonBarView$_onLikeButtonPressed$, (IMP*)&_logos_orig$Rose$IGUFIButtonBarView$_onLikeButtonPressed$);MSHookMessageEx(_logos_class$Rose$IGUFIButtonBarView, @selector(_onCommentButtonPressed:), (IMP)&_logos_method$Rose$IGUFIButtonBarView$_onCommentButtonPressed$, (IMP*)&_logos_orig$Rose$IGUFIButtonBarView$_onCommentButtonPressed$);MSHookMessageEx(_logos_class$Rose$IGUFIButtonBarView, @selector(_onSaveButtonLongPressed:), (IMP)&_logos_method$Rose$IGUFIButtonBarView$_onSaveButtonLongPressed$, (IMP*)&_logos_orig$Rose$IGUFIButtonBarView$_onSaveButtonLongPressed$);MSHookMessageEx(_logos_class$Rose$IGUFIButtonBarView, @selector(_onSaveButtonPressed:), (IMP)&_logos_method$Rose$IGUFIButtonBarView$_onSaveButtonPressed$, (IMP*)&_logos_orig$Rose$IGUFIButtonBarView$_onSaveButtonPressed$);MSHookMessageEx(_logos_class$Rose$IGUFIButtonBarView, @selector(_onSendButtonPressed:), (IMP)&_logos_method$Rose$IGUFIButtonBarView$_onSendButtonPressed$, (IMP*)&_logos_orig$Rose$IGUFIButtonBarView$_onSendButtonPressed$);Class _logos_class$Rose$AWEFeedVideoButton = objc_getClass("AWEFeedVideoButton"); MSHookMessageEx(_logos_class$Rose$AWEFeedVideoButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$AWEFeedVideoButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$AWEFeedVideoButton$touchesBegan$withEvent$);Class _logos_class$Rose$TFNCustomTabBar = objc_getClass("TFNCustomTabBar"); MSHookMessageEx(_logos_class$Rose$TFNCustomTabBar, @selector(tap:), (IMP)&_logos_method$Rose$TFNCustomTabBar$tap$, (IMP*)&_logos_orig$Rose$TFNCustomTabBar$tap$);Class _logos_class$Rose$T1StandardStatusView = objc_getClass("T1StandardStatusView"); MSHookMessageEx(_logos_class$Rose$T1StandardStatusView, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$T1StandardStatusView$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$T1StandardStatusView$touchesBegan$withEvent$);Class _logos_class$Rose$T1DirectMessageInboxSummaryView = objc_getClass("T1DirectMessageInboxSummaryView"); MSHookMessageEx(_logos_class$Rose$T1DirectMessageInboxSummaryView, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$T1DirectMessageInboxSummaryView$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$T1DirectMessageInboxSummaryView$touchesBegan$withEvent$);Class _logos_class$Rose$T1ActivityCell = objc_getClass("T1ActivityCell"); MSHookMessageEx(_logos_class$Rose$T1ActivityCell, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$T1ActivityCell$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$T1ActivityCell$touchesBegan$withEvent$);Class _logos_class$Rose$TFNFloatingActionButton = objc_getClass("TFNFloatingActionButton"); MSHookMessageEx(_logos_class$Rose$TFNFloatingActionButton, @selector(_tfn_expandingButtonAction:), (IMP)&_logos_method$Rose$TFNFloatingActionButton$_tfn_expandingButtonAction$, (IMP*)&_logos_orig$Rose$TFNFloatingActionButton$_tfn_expandingButtonAction$);Class _logos_class$Rose$_SFNavigationBarURLButton = objc_getClass("_SFNavigationBarURLButton"); MSHookMessageEx(_logos_class$Rose$_SFNavigationBarURLButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$_SFNavigationBarURLButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$_SFNavigationBarURLButton$touchesBegan$withEvent$);Class _logos_class$Rose$PHHandsetDialerNumberPadButton = objc_getClass("PHHandsetDialerNumberPadButton"); MSHookMessageEx(_logos_class$Rose$PHHandsetDialerNumberPadButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$PHHandsetDialerNumberPadButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$PHHandsetDialerNumberPadButton$touchesBegan$withEvent$);Class _logos_class$Rose$CNContactListTableViewCell = objc_getClass("CNContactListTableViewCell"); MSHookMessageEx(_logos_class$Rose$CNContactListTableViewCell, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$CNContactListTableViewCell$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$CNContactListTableViewCell$touchesBegan$withEvent$);Class _logos_class$Rose$PHHandsetDialerDeleteButton = objc_getClass("PHHandsetDialerDeleteButton"); MSHookMessageEx(_logos_class$Rose$PHHandsetDialerDeleteButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$PHHandsetDialerDeleteButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$PHHandsetDialerDeleteButton$touchesBegan$withEvent$);Class _logos_class$Rose$PHBottomBarButton = objc_getClass("PHBottomBarButton"); MSHookMessageEx(_logos_class$Rose$PHBottomBarButton, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$Rose$PHBottomBarButton$touchesBegan$withEvent$, (IMP*)&_logos_orig$Rose$PHBottomBarButton$touchesBegan$withEvent$);}
}
