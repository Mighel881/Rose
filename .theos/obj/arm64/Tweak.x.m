#line 1 "Tweak.x"
#import <AudioToolbox/AudioServices.h>


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

@class SBAppSwitcherPageView; @class SpringBoard; @class SBPowerDownController; @class SBUIIconForceTouchController; @class VolumeControl; @class SBSleepWakeHardwareButtonInteraction; @class SBUIController; @class SBMainDisplaySceneManager; @class SBCoverSheetPrimarySlidingViewController; 
static void (*_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$)(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$_ungrouped$SBSleepWakeHardwareButtonInteraction$_playLockSound)(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBSleepWakeHardwareButtonInteraction$_playLockSound(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBSleepWakeHardwareButtonInteraction$_performWake)(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBSleepWakeHardwareButtonInteraction$_performWake(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$VolumeControl$increaseVolume)(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$VolumeControl$increaseVolume(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$VolumeControl$decreaseVolume)(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$VolumeControl$decreaseVolume(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBPowerDownController$displayWillAppear)(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBPowerDownController$displayWillAppear(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBMainDisplaySceneManager$_appKilledInAppSwitcher$)(_LOGOS_SELF_TYPE_NORMAL SBMainDisplaySceneManager* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SBMainDisplaySceneManager$_appKilledInAppSwitcher$(_LOGOS_SELF_TYPE_NORMAL SBMainDisplaySceneManager* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$)(_LOGOS_SELF_TYPE_NORMAL SBUIIconForceTouchController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$(_LOGOS_SELF_TYPE_NORMAL SBUIIconForceTouchController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$SBUIController$ACPowerChanged)(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBUIController$ACPowerChanged(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBAppSwitcherPageView$setVisible$)(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherPageView* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$SBAppSwitcherPageView$setVisible$(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherPageView* _LOGOS_SELF_CONST, SEL, BOOL); 

#line 3 "Tweak.x"


static void _logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id application) {

	_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$(self, _cmd, application);

	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"me.shymemoriees.rosepreferences"];

	id ReSpringSwitch = [bundleDefaults valueForKey:@"ReSpringSwitch"];
	if ([ReSpringSwitch isEqual:@1]) {

		AudioServicesPlaySystemSound(1519);

	}

}





static void _logos_method$_ungrouped$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$(_LOGOS_SELF_TYPE_NORMAL SBCoverSheetPrimarySlidingViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {

	_logos_orig$_ungrouped$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$(self, _cmd, arg1);

	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"me.shymemoriees.rosepreferences"];

	id UnlockSwitch = [bundleDefaults valueForKey:@"UnlockSwitch"];
	if ([UnlockSwitch isEqual:@1]) {

		AudioServicesPlaySystemSound(1519);

	}

}





static void _logos_method$_ungrouped$SBSleepWakeHardwareButtonInteraction$_playLockSound(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$_ungrouped$SBSleepWakeHardwareButtonInteraction$_playLockSound(self, _cmd);

	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"me.shymemoriees.rosepreferences"];

	id LockSwitch = [bundleDefaults valueForKey:@"LockSwitch"];
	if ([LockSwitch isEqual:@1]) {

		AudioServicesPlaySystemSound(1519);

	}

}

static void _logos_method$_ungrouped$SBSleepWakeHardwareButtonInteraction$_performWake(_LOGOS_SELF_TYPE_NORMAL SBSleepWakeHardwareButtonInteraction* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$_ungrouped$SBSleepWakeHardwareButtonInteraction$_performWake(self, _cmd);

	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"me.shymemoriees.rosepreferences"];

	id WakeWithSleepButton = [bundleDefaults valueForKey:@"WakeWithSleepButton"];
	if ([WakeWithSleepButton isEqual:@1]) {

		AudioServicesPlaySystemSound(1519);

	}

}





static void _logos_method$_ungrouped$VolumeControl$increaseVolume(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$_ungrouped$VolumeControl$increaseVolume(self, _cmd);
	
	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"me.shymemoriees.rosepreferences"];

	id VolumeChangedSwitch = [bundleDefaults valueForKey:@"VolumeChangedSwitch"];
	if ([VolumeChangedSwitch isEqual:@1]) {

		AudioServicesPlaySystemSound(1519);

	}

}

static void _logos_method$_ungrouped$VolumeControl$decreaseVolume(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$_ungrouped$VolumeControl$decreaseVolume(self, _cmd);

	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"me.shymemoriees.rosepreferences"];

	id VolumeChangedSwitch = [bundleDefaults valueForKey:@"VolumeChangedSwitch"];
	if ([VolumeChangedSwitch isEqual:@1]) {

		AudioServicesPlaySystemSound(1519);

	}

}





static void _logos_method$_ungrouped$SBPowerDownController$displayWillAppear(_LOGOS_SELF_TYPE_NORMAL SBPowerDownController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$_ungrouped$SBPowerDownController$displayWillAppear(self, _cmd);

	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"me.shymemoriees.rosepreferences"];

	id PowerDownViewSwitch = [bundleDefaults valueForKey:@"PowerDownViewSwitch"];
	if ([PowerDownViewSwitch isEqual:@1]) {

		AudioServicesPlaySystemSound(1519);

	}

}





static void _logos_method$_ungrouped$SBMainDisplaySceneManager$_appKilledInAppSwitcher$(_LOGOS_SELF_TYPE_NORMAL SBMainDisplaySceneManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$_ungrouped$SBMainDisplaySceneManager$_appKilledInAppSwitcher$(self, _cmd, arg1);

	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"me.shymemoriees.rosepreferences"];

	id KillingAppSwitch = [bundleDefaults valueForKey:@"KillingAppSwitch"];
	if ([KillingAppSwitch isEqual:@1]) {

		AudioServicesPlaySystemSound(1519);

	}

}





static void _logos_method$_ungrouped$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$(_LOGOS_SELF_TYPE_NORMAL SBUIIconForceTouchController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

	_logos_orig$_ungrouped$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$(self, _cmd, arg1);

	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"me.shymemoriees.rosepreferences"];

	id ForceTouchDismiss = [bundleDefaults valueForKey:@"ForceTouchDismiss"];
	if ([ForceTouchDismiss isEqual:@1]) {

		AudioServicesPlaySystemSound(1519);

	}

}





static void _logos_method$_ungrouped$SBUIController$ACPowerChanged(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

	_logos_orig$_ungrouped$SBUIController$ACPowerChanged(self, _cmd);

	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"me.shymemoriees.rosepreferences"];

	id ChargerPluggedInOrOut = [bundleDefaults valueForKey:@"ChargerPluggedInOrOut"];
	if ([ChargerPluggedInOrOut isEqual:@1]) {

		AudioServicesPlaySystemSound(1519);

	}

}





static void _logos_method$_ungrouped$SBAppSwitcherPageView$setVisible$(_LOGOS_SELF_TYPE_NORMAL SBAppSwitcherPageView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {

	_logos_orig$_ungrouped$SBAppSwitcherPageView$setVisible$(self, _cmd, arg1);

	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"me.shymemoriees.rosepreferences"];

	id AppSwitcherFeedback = [bundleDefaults valueForKey:@"AppSwitcherFeedback"];
	if ([AppSwitcherFeedback isEqual:@1]) {

		AudioServicesPlaySystemSound(1519);

	}

}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SpringBoard = objc_getClass("SpringBoard"); MSHookMessageEx(_logos_class$_ungrouped$SpringBoard, @selector(applicationDidFinishLaunching:), (IMP)&_logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$, (IMP*)&_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$);Class _logos_class$_ungrouped$SBCoverSheetPrimarySlidingViewController = objc_getClass("SBCoverSheetPrimarySlidingViewController"); MSHookMessageEx(_logos_class$_ungrouped$SBCoverSheetPrimarySlidingViewController, @selector(viewWillDisappear:), (IMP)&_logos_method$_ungrouped$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$, (IMP*)&_logos_orig$_ungrouped$SBCoverSheetPrimarySlidingViewController$viewWillDisappear$);Class _logos_class$_ungrouped$SBSleepWakeHardwareButtonInteraction = objc_getClass("SBSleepWakeHardwareButtonInteraction"); MSHookMessageEx(_logos_class$_ungrouped$SBSleepWakeHardwareButtonInteraction, @selector(_playLockSound), (IMP)&_logos_method$_ungrouped$SBSleepWakeHardwareButtonInteraction$_playLockSound, (IMP*)&_logos_orig$_ungrouped$SBSleepWakeHardwareButtonInteraction$_playLockSound);MSHookMessageEx(_logos_class$_ungrouped$SBSleepWakeHardwareButtonInteraction, @selector(_performWake), (IMP)&_logos_method$_ungrouped$SBSleepWakeHardwareButtonInteraction$_performWake, (IMP*)&_logos_orig$_ungrouped$SBSleepWakeHardwareButtonInteraction$_performWake);Class _logos_class$_ungrouped$VolumeControl = objc_getClass("VolumeControl"); MSHookMessageEx(_logos_class$_ungrouped$VolumeControl, @selector(increaseVolume), (IMP)&_logos_method$_ungrouped$VolumeControl$increaseVolume, (IMP*)&_logos_orig$_ungrouped$VolumeControl$increaseVolume);MSHookMessageEx(_logos_class$_ungrouped$VolumeControl, @selector(decreaseVolume), (IMP)&_logos_method$_ungrouped$VolumeControl$decreaseVolume, (IMP*)&_logos_orig$_ungrouped$VolumeControl$decreaseVolume);Class _logos_class$_ungrouped$SBPowerDownController = objc_getClass("SBPowerDownController"); MSHookMessageEx(_logos_class$_ungrouped$SBPowerDownController, @selector(displayWillAppear), (IMP)&_logos_method$_ungrouped$SBPowerDownController$displayWillAppear, (IMP*)&_logos_orig$_ungrouped$SBPowerDownController$displayWillAppear);Class _logos_class$_ungrouped$SBMainDisplaySceneManager = objc_getClass("SBMainDisplaySceneManager"); MSHookMessageEx(_logos_class$_ungrouped$SBMainDisplaySceneManager, @selector(_appKilledInAppSwitcher:), (IMP)&_logos_method$_ungrouped$SBMainDisplaySceneManager$_appKilledInAppSwitcher$, (IMP*)&_logos_orig$_ungrouped$SBMainDisplaySceneManager$_appKilledInAppSwitcher$);Class _logos_class$_ungrouped$SBUIIconForceTouchController = objc_getClass("SBUIIconForceTouchController"); MSHookMessageEx(_logos_class$_ungrouped$SBUIIconForceTouchController, @selector(iconForceTouchViewControllerWillDismiss:), (IMP)&_logos_method$_ungrouped$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$, (IMP*)&_logos_orig$_ungrouped$SBUIIconForceTouchController$iconForceTouchViewControllerWillDismiss$);Class _logos_class$_ungrouped$SBUIController = objc_getClass("SBUIController"); MSHookMessageEx(_logos_class$_ungrouped$SBUIController, @selector(ACPowerChanged), (IMP)&_logos_method$_ungrouped$SBUIController$ACPowerChanged, (IMP*)&_logos_orig$_ungrouped$SBUIController$ACPowerChanged);Class _logos_class$_ungrouped$SBAppSwitcherPageView = objc_getClass("SBAppSwitcherPageView"); MSHookMessageEx(_logos_class$_ungrouped$SBAppSwitcherPageView, @selector(setVisible:), (IMP)&_logos_method$_ungrouped$SBAppSwitcherPageView$setVisible$, (IMP*)&_logos_orig$_ungrouped$SBAppSwitcherPageView$setVisible$);} }
#line 214 "Tweak.x"
