#import <AudioToolbox/AudioServices.h>

%hook SpringBoard

- (void)applicationDidFinishLaunching:(id)application {

	%orig;

	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"me.shymemoriees.rosepreferences"];

	id ReSpringSwitch = [bundleDefaults valueForKey:@"ReSpringSwitch"];
	if ([ReSpringSwitch isEqual:@1]) {

		AudioServicesPlaySystemSound(1519);

	}

}

%end

%hook SBCoverSheetPrimarySlidingViewController

- (void)viewWillDisappear:(BOOL)arg1 {

	%orig;

	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"me.shymemoriees.rosepreferences"];

	id UnlockSwitch = [bundleDefaults valueForKey:@"UnlockSwitch"];
	if ([UnlockSwitch isEqual:@1]) {

		AudioServicesPlaySystemSound(1519);

	}

}

%end

%hook SBSleepWakeHardwareButtonInteraction

- (void)_playLockSound {

	%orig;

	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"me.shymemoriees.rosepreferences"];

	id LockSwitch = [bundleDefaults valueForKey:@"LockSwitch"];
	if ([LockSwitch isEqual:@1]) {

		AudioServicesPlaySystemSound(1519);

	}

}

-(void)_performWake {

	%orig;

	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"me.shymemoriees.rosepreferences"];

	id WakeWithSleepButton = [bundleDefaults valueForKey:@"WakeWithSleepButton"];
	if ([WakeWithSleepButton isEqual:@1]) {

		AudioServicesPlaySystemSound(1519);

	}

}

%end

%hook VolumeControl

-(void)increaseVolume {

	%orig;
	
	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"me.shymemoriees.rosepreferences"];

	id VolumeChangedSwitch = [bundleDefaults valueForKey:@"VolumeChangedSwitch"];
	if ([VolumeChangedSwitch isEqual:@1]) {

		AudioServicesPlaySystemSound(1519);

	}

}

-(void)decreaseVolume {

	%orig;

	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"me.shymemoriees.rosepreferences"];

	id VolumeChangedSwitch = [bundleDefaults valueForKey:@"VolumeChangedSwitch"];
	if ([VolumeChangedSwitch isEqual:@1]) {

		AudioServicesPlaySystemSound(1519);

	}

}

%end

%hook SBPowerDownController

-(void)displayWillAppear {

	%orig;

	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"me.shymemoriees.rosepreferences"];

	id PowerDownViewSwitch = [bundleDefaults valueForKey:@"PowerDownViewSwitch"];
	if ([PowerDownViewSwitch isEqual:@1]) {

		AudioServicesPlaySystemSound(1519);

	}

}

%end

%hook SBMainDisplaySceneManager

-(void)_appKilledInAppSwitcher:(id)arg1 {

	%orig;

	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"me.shymemoriees.rosepreferences"];

	id KillingAppSwitch = [bundleDefaults valueForKey:@"KillingAppSwitch"];
	if ([KillingAppSwitch isEqual:@1]) {

		AudioServicesPlaySystemSound(1519);

	}

}

%end

%hook SBUIIconForceTouchController

-(void)iconForceTouchViewControllerWillDismiss:(id)arg1 {

	%orig;

	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"me.shymemoriees.rosepreferences"];

	id ForceTouchDismiss = [bundleDefaults valueForKey:@"ForceTouchDismiss"];
	if ([ForceTouchDismiss isEqual:@1]) {

		AudioServicesPlaySystemSound(1519);

	}

}

%end

%hook SBUIController

-(void)ACPowerChanged {

	%orig;

	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"me.shymemoriees.rosepreferences"];

	id ChargerPluggedInOrOut = [bundleDefaults valueForKey:@"ChargerPluggedInOrOut"];
	if ([ChargerPluggedInOrOut isEqual:@1]) {

		AudioServicesPlaySystemSound(1519);

	}

}

%end

%hook SBAppSwitcherPageView

-(void)setVisible:(BOOL)arg1 {

	%orig;

	NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"me.shymemoriees.rosepreferences"];

	id AppSwitcherFeedback = [bundleDefaults valueForKey:@"AppSwitcherFeedback"];
	if ([AppSwitcherFeedback isEqual:@1]) {

		AudioServicesPlaySystemSound(1519);

	}

}

%end