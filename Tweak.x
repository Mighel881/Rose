#import <AudioToolbox/AudioServices.h>
#import <Cephei/HBPreferences.h>

// Utils
HBPreferences *pfs;

// Preferences
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

%group Rose

void triggerHapticFeedback() {
    int hapticStrength = [hapticLevel intValue];

    if(hapticStrength == 0)
        AudioServicesPlaySystemSound(1519);
    else if(hapticStrength == 1)
        AudioServicesPlaySystemSound(1520);
    else
        AudioServicesPlaySystemSound(1521);
}

%hook SpringBoard

- (void)applicationDidFinishLaunching:(id)application {

	%orig;

	if (respringSwitch)
		triggerHapticFeedback();
}

%end

%hook SBCoverSheetPrimarySlidingViewController

- (void)viewWillDisappear:(BOOL)arg1 {

	%orig;

	if (unlockSwitch)
		triggerHapticFeedback();

}

%end

%hook SBSleepWakeHardwareButtonInteraction

- (void)_playLockSound {

	%orig;

	if (lockSwitch)
		triggerHapticFeedback();

}

-(void)_performWake {

	%orig;

	if (wakeSwitch)
		triggerHapticFeedback();

}

%end

%hook VolumeControl

-(void)increaseVolume {

	%orig;
	
	if (volumeSwitch)
		triggerHapticFeedback();

}

-(void)decreaseVolume {

	%orig;

	if (volumeSwitch)
		triggerHapticFeedback();

}

%end

%hook SBPowerDownController

-(void)displayWillAppear {

	%orig;

	if (powerSwitch)		
		triggerHapticFeedback();

}

%end

%hook SBMainDisplaySceneManager

-(void)_appKilledInAppSwitcher:(id)arg1 {

	%orig;

	if (killingSwitch)
		triggerHapticFeedback();

}

%end

%hook SBUIIconForceTouchController

-(void)iconForceTouchViewControllerWillDismiss:(id)arg1 {

	%orig;

	if (forceSwitch)
		triggerHapticFeedback();

}

%end

%hook SBUIController

-(void)ACPowerChanged {

	%orig;

	if (pluggedSwitch)
		triggerHapticFeedback();

}

%end

%hook SBAppSwitcherPageView

-(void)setVisible:(BOOL)arg1 {

	%orig;

	if (switcherSwitch)
		triggerHapticFeedback();

}

%end

%hook SiriUISiriStatusView

-(void)layoutSubviews {

	%orig;
	
	if (siriSwitch)
		triggerHapticFeedback();

}

%end

%ctor {
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
    	%init(Rose);
}