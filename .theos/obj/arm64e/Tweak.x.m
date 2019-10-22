#line 1 "Tweak.x"
#import <Rose.h>


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

@class SpringBoard; @class SBUIPasscodeLockViewBase; @class SBUIController; @class SBMainDisplaySceneManager; @class CCUILabeledRoundButton; @class SBFolderView; @class SBAppSwitcherPageView; @class SSScreenCapturer; @class VolumeControl; @class SBCoverSheetPrimarySlidingViewController; @class SBUIIconForceTouchController; @class SBPowerDownController; @class SiriUISiriStatusView; @class SBSleepWakeHardwareButtonInteraction; @class UIKeyboardLayoutStar; @class UIKBTree; @class SBFolderController; @class SBIconController; 

static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$UIKBTree(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("UIKBTree"); } return _klass; }
#line 3 "Tweak.x"
static void (*_logos_orig$Rose$SpringBoard$applicationDidFinishLaunching$)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SpringBoard$_ringerChanged$)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SpringBoard$_ringerChanged$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SpringBoard$takeScreenshotAndEdit$)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$SpringBoard$takeScreenshotAndEdit$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$)(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$SBSleepWakeHardwareButtonInteraction$_playLockSound)(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBSleepWakeHardwareButtonInteraction$_playLockSound(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBSleepWakeHardwareButtonInteraction$_performWake)(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBSleepWakeHardwareButtonInteraction$_performWake(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$VolumeControl$increaseVolume)(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$VolumeControl$increaseVolume(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$VolumeControl$decreaseVolume)(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$VolumeControl$decreaseVolume(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBPowerDownController$displayWillAppear)(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBPowerDownController$displayWillAppear(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBMainDisplaySceneManager$_appKilledInAppSwitcher$)(_LOGOS_SELF_TYPE_NORMAL SBMainDisplaySceneManager* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SBMainDisplaySceneManager$_appKilledInAppSwitcher$(_LOGOS_SELF_TYPE_NORMAL SBMainDisplaySceneManager* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$)(_LOGOS_SELF_TYPE_NORMAL SBUIIconForceTouchController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$(_LOGOS_SELF_TYPE_NORMAL SBUIIconForceTouchController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SBUIController$ACPowerChanged)(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBUIController$ACPowerChanged(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBUIController$handleWillBeginReachabilityAnimation)(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBUIController$handleWillBeginReachabilityAnimation(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBAppSwitcherPageView$setVisible$)(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherPageView* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$SBAppSwitcherPageView$setVisible$(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherPageView* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$SiriUISiriStatusView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL SiriUISiriStatusView* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SiriUISiriStatusView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SiriUISiriStatusView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$CCUILabeledRoundButton$buttonTapped$)(_LOGOS_SELF_TYPE_NORMAL CCUILabeledRoundButton* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$CCUILabeledRoundButton$buttonTapped$(_LOGOS_SELF_TYPE_NORMAL CCUILabeledRoundButton* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SBFolderController$prepareToOpen)(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBFolderController$prepareToOpen(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBIconController$setIsEditing$)(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$SBIconController$setIsEditing$(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$SBFolderView$scrollViewWillBeginDragging$)(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SBFolderView$scrollViewWillBeginDragging$(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_meta_orig$Rose$SSScreenCapturer$playScreenshotSound)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void _logos_meta_method$Rose$SSScreenCapturer$playScreenshotSound(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBUIPasscodeLockViewBase$_sendDelegateKeypadKeyDown)(_LOGOS_SELF_TYPE_NORMAL SBUIPasscodeLockViewBase* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBUIPasscodeLockViewBase$_sendDelegateKeypadKeyDown(_LOGOS_SELF_TYPE_NORMAL SBUIPasscodeLockViewBase* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBUIPasscodeLockViewBase$setPlaysKeypadSounds$)(_LOGOS_SELF_TYPE_NORMAL SBUIPasscodeLockViewBase* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$SBUIPasscodeLockViewBase$setPlaysKeypadSounds$(_LOGOS_SELF_TYPE_NORMAL SBUIPasscodeLockViewBase* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$UIKeyboardLayoutStar$playKeyClickSoundOnDownForKey$)(_LOGOS_SELF_TYPE_NORMAL UIKeyboardLayoutStar* _LOGOS_SELF_CONST, SEL, UIKBTree *); static void _logos_method$Rose$UIKeyboardLayoutStar$playKeyClickSoundOnDownForKey$(_LOGOS_SELF_TYPE_NORMAL UIKeyboardLayoutStar* _LOGOS_SELF_CONST, SEL, UIKBTree *); static void (*_logos_orig$Rose$UIKeyboardLayoutStar$setPlayKeyClickSoundOn$)(_LOGOS_SELF_TYPE_NORMAL UIKeyboardLayoutStar* _LOGOS_SELF_CONST, SEL, int); static void _logos_method$Rose$UIKeyboardLayoutStar$setPlayKeyClickSoundOn$(_LOGOS_SELF_TYPE_NORMAL UIKeyboardLayoutStar* _LOGOS_SELF_CONST, SEL, int); 

void triggerHapticFeedback() {
    int hapticStrength = [hapticLevel intValue];

    if(hapticStrength == 0)
        AudioServicesPlaySystemSound(1519);
    else if(hapticStrength == 1)
        AudioServicesPlaySystemSound(1520);
    else
        AudioServicesPlaySystemSound(1521);
}



static void _logos_method$Rose$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id application) {

	_logos_orig$Rose$SpringBoard$applicationDidFinishLaunching$(self, _cmd, application);

	if (respringSwitch)
		triggerHapticFeedback();
}

static void _logos_method$Rose$SpringBoard$_ringerChanged$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$SpringBoard$_ringerChanged$(self, _cmd, arg1);

	if (ringerSwitch) {
		triggerHapticFeedback();

	}

}

static void _logos_method$Rose$SpringBoard$takeScreenshotAndEdit$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {

	_logos_orig$Rose$SpringBoard$takeScreenshotAndEdit$(self, _cmd, arg1);

	if (screenshotSwitch) {
		triggerHapticFeedback();

	}
	
}





static void _logos_method$Rose$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {

	_logos_orig$Rose$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$(self, _cmd, arg1);

	if (unlockSwitch)
		triggerHapticFeedback();

}





static void _logos_method$Rose$SBSleepWakeHardwareButtonInteraction$_playLockSound(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SBSleepWakeHardwareButtonInteraction$_playLockSound(self, _cmd);

	if (lockSwitch)
		triggerHapticFeedback();

}

static void _logos_method$Rose$SBSleepWakeHardwareButtonInteraction$_performWake(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SBSleepWakeHardwareButtonInteraction$_performWake(self, _cmd);

	if (wakeSwitch)
		triggerHapticFeedback();

}





static void _logos_method$Rose$VolumeControl$increaseVolume(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$VolumeControl$increaseVolume(self, _cmd);
	
	if (volumeSwitch)
		triggerHapticFeedback();

}

static void _logos_method$Rose$VolumeControl$decreaseVolume(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$VolumeControl$decreaseVolume(self, _cmd);

	if (volumeSwitch)
		triggerHapticFeedback();

}





static void _logos_method$Rose$SBPowerDownController$displayWillAppear(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SBPowerDownController$displayWillAppear(self, _cmd);

	if (powerSwitch)		
		triggerHapticFeedback();

}





static void _logos_method$Rose$SBMainDisplaySceneManager$_appKilledInAppSwitcher$(_LOGOS_SELF_TYPE_NORMAL SBMainDisplaySceneManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$SBMainDisplaySceneManager$_appKilledInAppSwitcher$(self, _cmd, arg1);

	if (killingSwitch)
		triggerHapticFeedback();

}





static void _logos_method$Rose$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$(_LOGOS_SELF_TYPE_NORMAL SBUIIconForceTouchController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$(self, _cmd, arg1);

	if (forceSwitch)
		triggerHapticFeedback();

}





static void _logos_method$Rose$SBUIController$ACPowerChanged(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SBUIController$ACPowerChanged(self, _cmd);

	if (pluggedSwitch)
		triggerHapticFeedback();

}

static void _logos_method$Rose$SBUIController$handleWillBeginReachabilityAnimation(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SBUIController$handleWillBeginReachabilityAnimation(self, _cmd);

	if (reachabilitySwitch) {
		triggerHapticFeedback();

	}

}





static void _logos_method$Rose$SBAppSwitcherPageView$setVisible$(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherPageView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {

	_logos_orig$Rose$SBAppSwitcherPageView$setVisible$(self, _cmd, arg1);

	if (switcherSwitch)
		triggerHapticFeedback();

}





static void _logos_method$Rose$SiriUISiriStatusView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SiriUISiriStatusView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SiriUISiriStatusView$layoutSubviews(self, _cmd);
	
	if (siriSwitch)
		triggerHapticFeedback();

}





static void _logos_method$Rose$CCUILabeledRoundButton$buttonTapped$(_LOGOS_SELF_TYPE_NORMAL CCUILabeledRoundButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$CCUILabeledRoundButton$buttonTapped$(self, _cmd, arg1);

	if (ccToggleSwitch) {
		triggerHapticFeedback();

	}

}





static void _logos_method$Rose$SBFolderController$prepareToOpen(_LOGOS_SELF_TYPE_NORMAL SBFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SBFolderController$prepareToOpen(self, _cmd);

	if (folderSwitch) {
		triggerHapticFeedback();

	}

}





static void _logos_method$Rose$SBIconController$setIsEditing$(_LOGOS_SELF_TYPE_NORMAL SBIconController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {

	_logos_orig$Rose$SBIconController$setIsEditing$(self, _cmd, arg1);

	if (openCloseAppSwitch) {
		triggerHapticFeedback();

	}

}





static void _logos_method$Rose$SBFolderView$scrollViewWillBeginDragging$(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$Rose$SBFolderView$scrollViewWillBeginDragging$(self, _cmd, arg1);

	if (pageSwipeSwitch) {
		triggerHapticFeedback();

	}

}





static void _logos_meta_method$Rose$SSScreenCapturer$playScreenshotSound(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_meta_orig$Rose$SSScreenCapturer$playScreenshotSound(self, _cmd);

	if (screenshotSwitch) {
		triggerHapticFeedback();

	}

}



 

static void _logos_method$Rose$SBUIPasscodeLockViewBase$_sendDelegateKeypadKeyDown(_LOGOS_SELF_TYPE_NORMAL SBUIPasscodeLockViewBase* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$Rose$SBUIPasscodeLockViewBase$_sendDelegateKeypadKeyDown(self, _cmd);

	if (passcodeSwitch) {
		triggerHapticFeedback();

	}

}

static void _logos_method$Rose$SBUIPasscodeLockViewBase$setPlaysKeypadSounds$(_LOGOS_SELF_TYPE_NORMAL SBUIPasscodeLockViewBase* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {

	_logos_orig$Rose$SBUIPasscodeLockViewBase$setPlaysKeypadSounds$(self, _cmd, arg1);

	if (passcodeSwitch) {
		triggerHapticFeedback();

	}

}

	



static void _logos_method$Rose$UIKeyboardLayoutStar$playKeyClickSoundOnDownForKey$(_LOGOS_SELF_TYPE_NORMAL UIKeyboardLayoutStar* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIKBTree * key) {

	if (keyboardSwitch) {
		_logos_orig$Rose$UIKeyboardLayoutStar$playKeyClickSoundOnDownForKey$(self, _cmd, key);
		triggerHapticFeedback();

	}	
	
	else {
		_logos_orig$Rose$UIKeyboardLayoutStar$playKeyClickSoundOnDownForKey$(self, _cmd, key);
	}
}

static void _logos_method$Rose$UIKeyboardLayoutStar$setPlayKeyClickSoundOn$(_LOGOS_SELF_TYPE_NORMAL UIKeyboardLayoutStar* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, int arg1) {

	if (keyboardSwitch) {
	            UIKBTree *delKey = [_logos_static_class_lookup$UIKBTree() key];
				NSString *myDelKeyString = [delKey name];

		 if ([myDelKeyString isEqualToString:@"Delete-Key"]) {
            
		
      } else {
		  _logos_orig$Rose$UIKeyboardLayoutStar$setPlayKeyClickSoundOn$(self, _cmd, arg1);

	}
}

}



 


static __attribute__((constructor)) void _logosLocalCtor_59a68cba(int __unused argc, char __unused **argv, char __unused **envp) {
    pfs = [[HBPreferences alloc] initWithIdentifier:@"me.shymemoriees.rosepreferences"];

    [pfs registerBool:&enabled default:NO forKey:@"Enabled"];
    [pfs registerBool:&respringSwitch default:NO forKey:@"ReSpringSwitch"];
    [pfs registerBool:&unlockSwitch default:NO forKey:@"UnlockSwitch"];
    [pfs registerBool:&lockSwitch default:NO forKey:@"LockSwitch"];
    [pfs registerBool:&wakeSwitch default:NO forKey:@"WakeWithSleepButton"];
    [pfs registerBool:&volumeSwitch default:NO forKey:@"VolumeChangedSwitch"];
    [pfs registerBool:&powerSwitch default:NO forKey:@"PowerDownViewSwitch"];
    [pfs registerBool:&killingSwitch default:NO forKey:@"KillingAppSwitch"];
    [pfs registerBool:&forceSwitch default:NO forKey:@"ForceTouchDismiss"];
    [pfs registerBool:&pluggedSwitch default:NO forKey:@"ChargerPluggedInOrOut"];
    [pfs registerBool:&switcherSwitch default:NO forKey:@"AppSwitcherFeedback"];
    [pfs registerBool:&siriSwitch default:NO forKey:@"SiriUIFeedback"];
	[pfs registerBool:&ccToggleSwitch default:NO forKey:@"ControlCenterToggleFeedback"];
	[pfs registerBool:&folderSwitch default:NO forKey:@"FolderFeedback"];
	[pfs registerBool:&openCloseAppSwitch default:NO forKey:@"openCloseApp"];
	[pfs registerBool:&pageSwipeSwitch default:NO forKey:@"pageSwipe"];
	[pfs registerBool:&screenshotSwitch default:NO forKey:@"takeScreenshot"];
	[pfs registerBool:&passcodeSwitch default:NO forKey:@"enterPasscode"];
	[pfs registerBool:&keyboardSwitch default:NO forKey:@"usingKeyboard"];
	[pfs registerBool:&ringerSwitch default:NO forKey:@"unmuting"];
	[pfs registerBool:&reachabilitySwitch default:NO forKey:@"reachability"];
    [pfs registerObject:&hapticLevel default:@"0" forKey:@"HapticStrength"];

    if(enabled)
    	{Class _logos_class$Rose$SpringBoard = objc_getClass("SpringBoard"); MSHookMessageEx(_logos_class$Rose$SpringBoard, @selector(applicationDidFinishLaunching:), (IMP)&_logos_method$Rose$SpringBoard$applicationDidFinishLaunching$, (IMP*)&_logos_orig$Rose$SpringBoard$applicationDidFinishLaunching$);MSHookMessageEx(_logos_class$Rose$SpringBoard, @selector(_ringerChanged:), (IMP)&_logos_method$Rose$SpringBoard$_ringerChanged$, (IMP*)&_logos_orig$Rose$SpringBoard$_ringerChanged$);MSHookMessageEx(_logos_class$Rose$SpringBoard, @selector(takeScreenshotAndEdit:), (IMP)&_logos_method$Rose$SpringBoard$takeScreenshotAndEdit$, (IMP*)&_logos_orig$Rose$SpringBoard$takeScreenshotAndEdit$);Class _logos_class$Rose$SBCoverSheetPrimarySlidingViewController = objc_getClass("SBCoverSheetPrimarySlidingViewController"); MSHookMessageEx(_logos_class$Rose$SBCoverSheetPrimarySlidingViewController, @selector(viewWillDisappear:), (IMP)&_logos_method$Rose$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$, (IMP*)&_logos_orig$Rose$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$);Class _logos_class$Rose$SBSleepWakeHardwareButtonInteraction = objc_getClass("SBSleepWakeHardwareButtonInteraction"); MSHookMessageEx(_logos_class$Rose$SBSleepWakeHardwareButtonInteraction, @selector(_playLockSound), (IMP)&_logos_method$Rose$SBSleepWakeHardwareButtonInteraction$_playLockSound, (IMP*)&_logos_orig$Rose$SBSleepWakeHardwareButtonInteraction$_playLockSound);MSHookMessageEx(_logos_class$Rose$SBSleepWakeHardwareButtonInteraction, @selector(_performWake), (IMP)&_logos_method$Rose$SBSleepWakeHardwareButtonInteraction$_performWake, (IMP*)&_logos_orig$Rose$SBSleepWakeHardwareButtonInteraction$_performWake);Class _logos_class$Rose$VolumeControl = objc_getClass("VolumeControl"); MSHookMessageEx(_logos_class$Rose$VolumeControl, @selector(increaseVolume), (IMP)&_logos_method$Rose$VolumeControl$increaseVolume, (IMP*)&_logos_orig$Rose$VolumeControl$increaseVolume);MSHookMessageEx(_logos_class$Rose$VolumeControl, @selector(decreaseVolume), (IMP)&_logos_method$Rose$VolumeControl$decreaseVolume, (IMP*)&_logos_orig$Rose$VolumeControl$decreaseVolume);Class _logos_class$Rose$SBPowerDownController = objc_getClass("SBPowerDownController"); MSHookMessageEx(_logos_class$Rose$SBPowerDownController, @selector(displayWillAppear), (IMP)&_logos_method$Rose$SBPowerDownController$displayWillAppear, (IMP*)&_logos_orig$Rose$SBPowerDownController$displayWillAppear);Class _logos_class$Rose$SBMainDisplaySceneManager = objc_getClass("SBMainDisplaySceneManager"); MSHookMessageEx(_logos_class$Rose$SBMainDisplaySceneManager, @selector(_appKilledInAppSwitcher:), (IMP)&_logos_method$Rose$SBMainDisplaySceneManager$_appKilledInAppSwitcher$, (IMP*)&_logos_orig$Rose$SBMainDisplaySceneManager$_appKilledInAppSwitcher$);Class _logos_class$Rose$SBUIIconForceTouchController = objc_getClass("SBUIIconForceTouchController"); MSHookMessageEx(_logos_class$Rose$SBUIIconForceTouchController, @selector(iconForceTouchViewControllerWillDismiss:), (IMP)&_logos_method$Rose$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$, (IMP*)&_logos_orig$Rose$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$);Class _logos_class$Rose$SBUIController = objc_getClass("SBUIController"); MSHookMessageEx(_logos_class$Rose$SBUIController, @selector(ACPowerChanged), (IMP)&_logos_method$Rose$SBUIController$ACPowerChanged, (IMP*)&_logos_orig$Rose$SBUIController$ACPowerChanged);MSHookMessageEx(_logos_class$Rose$SBUIController, @selector(handleWillBeginReachabilityAnimation), (IMP)&_logos_method$Rose$SBUIController$handleWillBeginReachabilityAnimation, (IMP*)&_logos_orig$Rose$SBUIController$handleWillBeginReachabilityAnimation);Class _logos_class$Rose$SBAppSwitcherPageView = objc_getClass("SBAppSwitcherPageView"); MSHookMessageEx(_logos_class$Rose$SBAppSwitcherPageView, @selector(setVisible:), (IMP)&_logos_method$Rose$SBAppSwitcherPageView$setVisible$, (IMP*)&_logos_orig$Rose$SBAppSwitcherPageView$setVisible$);Class _logos_class$Rose$SiriUISiriStatusView = objc_getClass("SiriUISiriStatusView"); MSHookMessageEx(_logos_class$Rose$SiriUISiriStatusView, @selector(layoutSubviews), (IMP)&_logos_method$Rose$SiriUISiriStatusView$layoutSubviews, (IMP*)&_logos_orig$Rose$SiriUISiriStatusView$layoutSubviews);Class _logos_class$Rose$CCUILabeledRoundButton = objc_getClass("CCUILabeledRoundButton"); MSHookMessageEx(_logos_class$Rose$CCUILabeledRoundButton, @selector(buttonTapped:), (IMP)&_logos_method$Rose$CCUILabeledRoundButton$buttonTapped$, (IMP*)&_logos_orig$Rose$CCUILabeledRoundButton$buttonTapped$);Class _logos_class$Rose$SBFolderController = objc_getClass("SBFolderController"); MSHookMessageEx(_logos_class$Rose$SBFolderController, @selector(prepareToOpen), (IMP)&_logos_method$Rose$SBFolderController$prepareToOpen, (IMP*)&_logos_orig$Rose$SBFolderController$prepareToOpen);Class _logos_class$Rose$SBIconController = objc_getClass("SBIconController"); MSHookMessageEx(_logos_class$Rose$SBIconController, @selector(setIsEditing:), (IMP)&_logos_method$Rose$SBIconController$setIsEditing$, (IMP*)&_logos_orig$Rose$SBIconController$setIsEditing$);Class _logos_class$Rose$SBFolderView = objc_getClass("SBFolderView"); MSHookMessageEx(_logos_class$Rose$SBFolderView, @selector(scrollViewWillBeginDragging:), (IMP)&_logos_method$Rose$SBFolderView$scrollViewWillBeginDragging$, (IMP*)&_logos_orig$Rose$SBFolderView$scrollViewWillBeginDragging$);Class _logos_class$Rose$SSScreenCapturer = objc_getClass("SSScreenCapturer"); Class _logos_metaclass$Rose$SSScreenCapturer = object_getClass(_logos_class$Rose$SSScreenCapturer); MSHookMessageEx(_logos_metaclass$Rose$SSScreenCapturer, @selector(playScreenshotSound), (IMP)&_logos_meta_method$Rose$SSScreenCapturer$playScreenshotSound, (IMP*)&_logos_meta_orig$Rose$SSScreenCapturer$playScreenshotSound);Class _logos_class$Rose$SBUIPasscodeLockViewBase = objc_getClass("SBUIPasscodeLockViewBase"); MSHookMessageEx(_logos_class$Rose$SBUIPasscodeLockViewBase, @selector(_sendDelegateKeypadKeyDown), (IMP)&_logos_method$Rose$SBUIPasscodeLockViewBase$_sendDelegateKeypadKeyDown, (IMP*)&_logos_orig$Rose$SBUIPasscodeLockViewBase$_sendDelegateKeypadKeyDown);MSHookMessageEx(_logos_class$Rose$SBUIPasscodeLockViewBase, @selector(setPlaysKeypadSounds:), (IMP)&_logos_method$Rose$SBUIPasscodeLockViewBase$setPlaysKeypadSounds$, (IMP*)&_logos_orig$Rose$SBUIPasscodeLockViewBase$setPlaysKeypadSounds$);Class _logos_class$Rose$UIKeyboardLayoutStar = objc_getClass("UIKeyboardLayoutStar"); MSHookMessageEx(_logos_class$Rose$UIKeyboardLayoutStar, @selector(playKeyClickSoundOnDownForKey:), (IMP)&_logos_method$Rose$UIKeyboardLayoutStar$playKeyClickSoundOnDownForKey$, (IMP*)&_logos_orig$Rose$UIKeyboardLayoutStar$playKeyClickSoundOnDownForKey$);MSHookMessageEx(_logos_class$Rose$UIKeyboardLayoutStar, @selector(setPlayKeyClickSoundOn:), (IMP)&_logos_method$Rose$UIKeyboardLayoutStar$setPlayKeyClickSoundOn$, (IMP*)&_logos_orig$Rose$UIKeyboardLayoutStar$setPlayKeyClickSoundOn$);}
}
