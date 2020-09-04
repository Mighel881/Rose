#import "../../Tweak/Rose.h"
#import "Rose/librose.h"

roseCall* haptics;

BOOL enabled;
BOOL enableTapticEngineSwitch;
BOOL enableHapticEngineSwitch;
BOOL enableLegacyEngineSwitch;

NSString* tapticLevel;
NSString* hapticLevel;
NSString* legacyLevel;
NSString* customlegacyDurationLevel;
NSString* customlegacyStrengthLevel;

int tapticLVL;
int hapticLVL;
double delayLVL;
int selectedLegacyMode;
double customLegacyDuration;
double customLegacyStrength;

BOOL enableExceptionsSection;

BOOL enablePhoneSection;

// Phone
BOOL PHNumberPadSwitch;
BOOL PHContactCellSwitch;
BOOL PHDialerDeleteButtonSwitch;
BOOL PHDialerCallButtonSwitch;
NSString* customStrengthPHNumberPadControl;
NSString* customStrengthPHContactCellControl;
NSString* customStrengthPHDialerDeleteButtonControl;
NSString* customStrengthPHDialerCallButtonControl;

BOOL delaySwitch;
NSString* delayLevel;

BOOL LowPowerMode;
BOOL LowPowerModeSwitch;
BOOL isDNDActive;
BOOL isDNDActiveSwitch;
BOOL isRingerSilent;
BOOL isRingerSilentSwitch;

%group Phone

%hook PHHandsetDialerNumberPadButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!PHNumberPadSwitch) return;
	int customStrength = [customStrengthPHNumberPadControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook CNContactListTableViewCell

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!PHContactCellSwitch) return;
	int customStrength = [customStrengthPHContactCellControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook PHHandsetDialerDeleteButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!PHDialerDeleteButtonSwitch) return;
	int customStrength = [customStrengthPHDialerDeleteButtonControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook PHBottomBarButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!PHDialerCallButtonSwitch) return;
	int customStrength = [customStrengthPHDialerCallButtonControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%end

%ctor {

    pfs = [[HBPreferences alloc] initWithIdentifier:@"sh.litten.rosepreferences"];

	[pfs registerBool:&enabled default:nil forKey:@"Enabled"];
	[pfs registerBool:&enableExceptionsSection default:nil forKey:@"EnableExceptionsSection"];
	[pfs registerBool:&enablePhoneSection default:nil forKey:@"EnablePhoneSection"];

	[pfs registerBool:&enableTapticEngineSwitch default:NO forKey:@"enableTapticEngine"];
	[pfs registerBool:&enableHapticEngineSwitch default:NO forKey:@"enableHapticEngine"];
	[pfs registerBool:&enableLegacyEngineSwitch default:NO forKey:@"enableLegacyEngine"];

	[pfs registerObject:&tapticLevel default:@"0" forKey:@"TapticStrength"];
    [pfs registerObject:&hapticLevel default:@"0" forKey:@"HapticStrength"];
	[pfs registerObject:&legacyLevel default:@"0" forKey:@"LegacyStrength"];

	[pfs registerObject:&customlegacyDurationLevel default:@"0" forKey:@"customLegacyDuration"];
	[pfs registerObject:&customlegacyStrengthLevel default:@"0" forKey:@"customLegacyStrength"];

	if (enableExceptionsSection) {
		[pfs registerBool:&LowPowerModeSwitch default:NO forKey:@"lowPowerMode"];
		[pfs registerBool:&isDNDActiveSwitch default:NO forKey:@"isDNDActive"];
		[pfs registerBool:&isRingerSilentSwitch default:NO forKey:@"isRingerSilent"];
	}

	if (enablePhoneSection) {
		[pfs registerBool:&PHNumberPadSwitch default:NO forKey:@"PHNumberPad"];
		[pfs registerBool:&PHContactCellSwitch default:NO forKey:@"PHContactCell"];
		[pfs registerBool:&PHDialerDeleteButtonSwitch default:NO forKey:@"PHDialerDeleteButton"];
		[pfs registerBool:&PHDialerCallButtonSwitch default:NO forKey:@"PHDialerCallButton"];
		[pfs registerObject:&customStrengthPHNumberPadControl default:@"0" forKey:@"customStrengthPHNumberPad"];
		[pfs registerObject:&customStrengthPHContactCellControl default:@"0" forKey:@"customStrengthPHContactCell"];
		[pfs registerObject:&customStrengthPHDialerDeleteButtonControl default:@"0" forKey:@"customStrengthPHDialerDeleteButton"];
		[pfs registerObject:&customStrengthPHDialerCallButtonControl default:@"0" forKey:@"customStrengthPHDialerCallButton"];
	}

    if (enabled && enablePhoneSection) {
		haptics = [[roseCall alloc] init];
		tapticLVL = [tapticLevel intValue];
		hapticLVL = [hapticLevel intValue];
		delayLVL = [delayLevel doubleValue];
		selectedLegacyMode = [legacyLevel intValue];
		customLegacyDuration = [customlegacyDurationLevel doubleValue];
		customLegacyStrength = [customlegacyStrengthLevel doubleValue];
		%init(Phone);
		return;
    }

}