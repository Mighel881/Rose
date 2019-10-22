#import <Rose.h>

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

-(void)_ringerChanged:(id)arg1 {

	%orig;

	if (ringerSwitch) {
		triggerHapticFeedback();

	}

}

-(void)takeScreenshotAndEdit:(BOOL)arg1 {

	%orig;

	if (screenshotSwitch) {
		triggerHapticFeedback();

	}
	
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

-(void)handleWillBeginReachabilityAnimation {

	%orig;

	if (reachabilitySwitch) {
		triggerHapticFeedback();

	}

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

%hook CCUILabeledRoundButton

-(void)buttonTapped:(id)arg1 {

	%orig;

	if (ccToggleSwitch) {
		triggerHapticFeedback();

	}

}

%end

%hook SBFolderController

-(void)prepareToOpen {

	%orig;

	if (folderSwitch) {
		triggerHapticFeedback();

	}

}

%end

%hook SBIconController

-(void)setIsEditing:(BOOL)arg1 {

	%orig;

	if (openCloseAppSwitch) {
		triggerHapticFeedback();

	}

}

%end

%hook SBFolderView

-(void)scrollViewWillBeginDragging:(id)arg1 {

	%orig;

	if (pageSwipeSwitch) {
		triggerHapticFeedback();

	}

}

%end

%hook SSScreenCapturer

+(void)playScreenshotSound {

	%orig;

	if (screenshotSwitch) {
		triggerHapticFeedback();

	}

}

%end

%hook SBUIPasscodeLockViewBase 

-(void)_sendDelegateKeypadKeyDown {

	%orig;

	if (passcodeSwitch) {
		triggerHapticFeedback();

	}

}

-(void)setPlaysKeypadSounds:(BOOL)arg1 {

	%orig;

	if (passcodeSwitch) {
		triggerHapticFeedback();

	}

}

%end	

%hook UIKeyboardLayoutStar

-(void)playKeyClickSoundOnDownForKey:(UIKBTree *)key {
	
	%orig;

	if (keyboardSwitch) {
		triggerHapticFeedback();

	}

}

-(void)setPlayKeyClickSoundOn:(int)arg1 {

	UIKBTree *delKey = [%c(UIKBTree) key];
	NSString *myDelKeyString = [delKey name];

	%orig;


	if (keyboardSwitch) {
		triggerHapticFeedback();

	}

}

%end

%end // Rose group


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
    	%init(Rose);
}