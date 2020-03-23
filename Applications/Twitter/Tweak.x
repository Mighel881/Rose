#import "../../Tweak/Rose.h"

// Enabled And Engine Switches
BOOL enabled = NO;
BOOL enableTapticEngineSwitch = NO;
BOOL enableHapticEngineSwitch = NO;
BOOL enableLegacyEngineSwitch = NO;

BOOL twitterSupportSwitch = NO;

BOOL exceptionsSectionSupportSwitch = NO;

BOOL TWTtabBarSwitch = NO;
BOOL TWTtweetViewSwitch = NO;
BOOL TWTdirectMessagesTapSwitch = NO;
BOOL TWTactivityTapSwitch = NO;
BOOL TWTtweetButtonSwitch = NO;

NSString* customStrengthTWTtabBarControl = @"0";
NSString* customStrengthTWTtweetViewControl = @"0";
NSString* customStrengthTWTdirectMessagesTapControl = @"0";
NSString* customStrengthTWTactivityTapControl = @"0";
NSString* customStrengthTWTtweetButtonControl = @"0";

// Delay
BOOL delaySwitch = NO;
NSString* delayLevel = @"0.0";

// Low Power Mode And DND Mode Recognition
BOOL LowPowerMode = NO;
BOOL LowPowerModeSwitch = NO;
BOOL isDNDActive = NO;
BOOL isDNDActiveSwitch = NO;

// Rose wide haptics controller
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

	// Rose wide haptics trigger
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

	// Rose custom haptis controller
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

	// Rose custom haptics trigger
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

// https://stackoverflow.com/a/43816242
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

	// Rose legacy haptics trigger
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

%group Twitter

%hook TFNCustomTabBar

- (void)tap:(id)arg1 {

	%orig;

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

%end

%hook T1StandardStatusView

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

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

%end

%hook T1DirectMessageInboxSummaryView

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

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

%end

%hook T1ActivityCell

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

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

%end

%hook TFNFloatingActionButton

- (void)_tfn_expandingButtonAction:(id)arg1 {

	%orig;

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

%end

%end

%ctor {

    pfs = [[HBPreferences alloc] initWithIdentifier:@"sh.litten.rosepreferences"];

	[pfs registerBool:&enabled default:nil forKey:@"Enabled"];
	// Engine Switches
	[pfs registerBool:&enableTapticEngineSwitch default:NO forKey:@"enableTapticEngine"];
	[pfs registerBool:&enableHapticEngineSwitch default:NO forKey:@"enableHapticEngine"];
	[pfs registerBool:&enableLegacyEngineSwitch default:NO forKey:@"enableLegacyEngine"];
	// Segmented Controls For Feedback Strength
	[pfs registerObject:&tapticLevel default:@"0" forKey:@"TapticStrength"];
    [pfs registerObject:&hapticLevel default:@"0" forKey:@"HapticStrength"];
	[pfs registerObject:&legacyLevel default:@"0" forKey:@"LegacyStrength"];
	// Custom Legacy Sliders
	[pfs registerObject:&customlegacyDurationLevel default:@"0" forKey:@"customLegacyDuration"];
	[pfs registerObject:&customlegacyStrengthLevel default:@"0" forKey:@"customLegacyStrength"];

	[pfs registerBool:&exceptionsSectionSupportSwitch default:NO forKey:@"exceptionsSectionSupport"];
	[pfs registerBool:&twitterSupportSwitch default:NO forKey:@"twitterSupport"];

	// Twitter
	if (twitterSupportSwitch) {
		[pfs registerBool:&TWTtabBarSwitch default:NO forKey:@"TWTtabBar"];
		[pfs registerBool:&TWTtweetViewSwitch default:NO forKey:@"TWTweetTap"];
		[pfs registerBool:&TWTdirectMessagesTapSwitch default:NO forKey:@"TWTdirectMessagesTap"];
		[pfs registerBool:&TWTactivityTapSwitch default:NO forKey:@"TWTactivityTap"];
		[pfs registerBool:&TWTtweetButtonSwitch default:NO forKey:@"TWTtweetButton"];

	}

	if (twitterSupportSwitch) {
		[pfs registerObject:&customStrengthTWTtabBarControl default:@"0" forKey:@"customStrengthTWTtabBar"];
		[pfs registerObject:&customStrengthTWTtweetViewControl default:@"0" forKey:@"customStrengthTWTtweetView"];
		[pfs registerObject:&customStrengthTWTdirectMessagesTapControl default:@"0" forKey:@"customStrengthTWTdirectMessagesTap"];
		[pfs registerObject:&customStrengthTWTactivityTapControl default:@"0" forKey:@"customStrengthTWTactivityTap"];
		[pfs registerObject:&customStrengthTWTtweetButtonControl default:@"0" forKey:@"customStrengthTWTtweetButton"];

	}

    if (!dpkgInvalid && enabled) {
        if (twitterSupportSwitch)
			%init(Twitter);

		return;

    }

}