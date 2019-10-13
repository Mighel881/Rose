#line 1 "Tweak.x"
#import <AudioToolbox/AudioServices.h>
#import <Cephei/HBPreferences.h>


HBPreferences *pfs;


BOOL enabled = NO;
BOOL respringSwitch = NO;
BOOL unlockSwitch = NO;
BOOL lockSwitch = NO;
BOOL wakeSwitch = NO;
BOOL volumeSwitch = NO;
BOOL powerSwitch = NO;
BOOL killingSwitch = NO;
BOOL forceSwitch = NO;
BOOL pluggedSwitch = NO;
BOOL switcherSwitch = NO;
BOOL siriSwitch = NO;
NSString *hapticLevel = @"1";


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

@class SBCoverSheetPrimarySlidingViewController; @class SBMainDisplaySceneManager; @class SBUIIconForceTouchController; @class SiriUISiriStatusView; @class SBAppSwitcherPageView; @class SpringBoard; @class SBUIController; @class SBSleepWakeHardwareButtonInteraction; @class SBPowerDownController; @class VolumeControl; 


#line 22 "Tweak.x"
static void (*_logos_orig$Rose$SpringBoard$applicationDidFinishLaunching$)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$)(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$SBSleepWakeHardwareButtonInteraction$_playLockSound)(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBSleepWakeHardwareButtonInteraction$_playLockSound(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBSleepWakeHardwareButtonInteraction$_performWake)(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBSleepWakeHardwareButtonInteraction$_performWake(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$VolumeControl$increaseVolume)(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$VolumeControl$increaseVolume(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$VolumeControl$decreaseVolume)(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$VolumeControl$decreaseVolume(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBPowerDownController$displayWillAppear)(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBPowerDownController$displayWillAppear(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBMainDisplaySceneManager$_appKilledInAppSwitcher$)(_LOGOS_SELF_TYPE_NORMAL SBMainDisplaySceneManager* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SBMainDisplaySceneManager$_appKilledInAppSwitcher$(_LOGOS_SELF_TYPE_NORMAL SBMainDisplaySceneManager* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$)(_LOGOS_SELF_TYPE_NORMAL SBUIIconForceTouchController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Rose$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$(_LOGOS_SELF_TYPE_NORMAL SBUIIconForceTouchController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$Rose$SBUIController$ACPowerChanged)(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SBUIController$ACPowerChanged(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Rose$SBAppSwitcherPageView$setVisible$)(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherPageView* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Rose$SBAppSwitcherPageView$setVisible$(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherPageView* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$Rose$SiriUISiriStatusView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL SiriUISiriStatusView* _LOGOS_SELF_CONST, SEL); static void _logos_method$Rose$SiriUISiriStatusView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SiriUISiriStatusView* _LOGOS_SELF_CONST, SEL); 

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


 

static __attribute__((constructor)) void _logosLocalCtor_c722081e(int __unused argc, char __unused **argv, char __unused **envp) {
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
    [pfs registerObject:&hapticLevel default:@"1" forKey:@"HapticStrength"];

    if(enabled)
    	{Class _logos_class$Rose$SpringBoard = objc_getClass("SpringBoard"); MSHookMessageEx(_logos_class$Rose$SpringBoard, @selector(applicationDidFinishLaunching:), (IMP)&_logos_method$Rose$SpringBoard$applicationDidFinishLaunching$, (IMP*)&_logos_orig$Rose$SpringBoard$applicationDidFinishLaunching$);Class _logos_class$Rose$SBCoverSheetPrimarySlidingViewController = objc_getClass("SBCoverSheetPrimarySlidingViewController"); MSHookMessageEx(_logos_class$Rose$SBCoverSheetPrimarySlidingViewController, @selector(viewWillDisappear:), (IMP)&_logos_method$Rose$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$, (IMP*)&_logos_orig$Rose$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$);Class _logos_class$Rose$SBSleepWakeHardwareButtonInteraction = objc_getClass("SBSleepWakeHardwareButtonInteraction"); MSHookMessageEx(_logos_class$Rose$SBSleepWakeHardwareButtonInteraction, @selector(_playLockSound), (IMP)&_logos_method$Rose$SBSleepWakeHardwareButtonInteraction$_playLockSound, (IMP*)&_logos_orig$Rose$SBSleepWakeHardwareButtonInteraction$_playLockSound);MSHookMessageEx(_logos_class$Rose$SBSleepWakeHardwareButtonInteraction, @selector(_performWake), (IMP)&_logos_method$Rose$SBSleepWakeHardwareButtonInteraction$_performWake, (IMP*)&_logos_orig$Rose$SBSleepWakeHardwareButtonInteraction$_performWake);Class _logos_class$Rose$VolumeControl = objc_getClass("VolumeControl"); MSHookMessageEx(_logos_class$Rose$VolumeControl, @selector(increaseVolume), (IMP)&_logos_method$Rose$VolumeControl$increaseVolume, (IMP*)&_logos_orig$Rose$VolumeControl$increaseVolume);MSHookMessageEx(_logos_class$Rose$VolumeControl, @selector(decreaseVolume), (IMP)&_logos_method$Rose$VolumeControl$decreaseVolume, (IMP*)&_logos_orig$Rose$VolumeControl$decreaseVolume);Class _logos_class$Rose$SBPowerDownController = objc_getClass("SBPowerDownController"); MSHookMessageEx(_logos_class$Rose$SBPowerDownController, @selector(displayWillAppear), (IMP)&_logos_method$Rose$SBPowerDownController$displayWillAppear, (IMP*)&_logos_orig$Rose$SBPowerDownController$displayWillAppear);Class _logos_class$Rose$SBMainDisplaySceneManager = objc_getClass("SBMainDisplaySceneManager"); MSHookMessageEx(_logos_class$Rose$SBMainDisplaySceneManager, @selector(_appKilledInAppSwitcher:), (IMP)&_logos_method$Rose$SBMainDisplaySceneManager$_appKilledInAppSwitcher$, (IMP*)&_logos_orig$Rose$SBMainDisplaySceneManager$_appKilledInAppSwitcher$);Class _logos_class$Rose$SBUIIconForceTouchController = objc_getClass("SBUIIconForceTouchController"); MSHookMessageEx(_logos_class$Rose$SBUIIconForceTouchController, @selector(iconForceTouchViewControllerWillDismiss:), (IMP)&_logos_method$Rose$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$, (IMP*)&_logos_orig$Rose$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$);Class _logos_class$Rose$SBUIController = objc_getClass("SBUIController"); MSHookMessageEx(_logos_class$Rose$SBUIController, @selector(ACPowerChanged), (IMP)&_logos_method$Rose$SBUIController$ACPowerChanged, (IMP*)&_logos_orig$Rose$SBUIController$ACPowerChanged);Class _logos_class$Rose$SBAppSwitcherPageView = objc_getClass("SBAppSwitcherPageView"); MSHookMessageEx(_logos_class$Rose$SBAppSwitcherPageView, @selector(setVisible:), (IMP)&_logos_method$Rose$SBAppSwitcherPageView$setVisible$, (IMP*)&_logos_orig$Rose$SBAppSwitcherPageView$setVisible$);Class _logos_class$Rose$SiriUISiriStatusView = objc_getClass("SiriUISiriStatusView"); MSHookMessageEx(_logos_class$Rose$SiriUISiriStatusView, @selector(layoutSubviews), (IMP)&_logos_method$Rose$SiriUISiriStatusView$layoutSubviews, (IMP*)&_logos_orig$Rose$SiriUISiriStatusView$layoutSubviews);}
}
