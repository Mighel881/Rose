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

BOOL enableSafariSection;

BOOL SFUrlSwitch;
NSString* customStrengthSFUrlControl;

BOOL delaySwitch;
NSString* delayLevel;

BOOL LowPowerMode;
BOOL LowPowerModeSwitch;
BOOL isDNDActive;
BOOL isDNDActiveSwitch;
BOOL isRingerSilent;
BOOL isRingerSilentSwitch;

%group Safari

%hook _SFNavigationBarURLButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!SFUrlSwitch) return;
	int customStrength = [customStrengthSFUrlControl intValue];

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
	[pfs registerBool:&enableSafariSection default:nil forKey:@"EnableSafariSection"];
	
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

	if (enableSafariSection) {
		[pfs registerBool:&SFUrlSwitch default:NO forKey:@"SFUrl"];
		[pfs registerObject:&customStrengthSFUrlControl default:@"0" forKey:@"customStrengthSFUrl"];
	}

    if (enabled && enableSafariSection) {
		haptics = [[roseCall alloc] init];
		tapticLVL = [tapticLevel intValue];
		hapticLVL = [hapticLevel intValue];
		delayLVL = [delayLevel doubleValue];
		selectedLegacyMode = [legacyLevel intValue];
		customLegacyDuration = [customlegacyDurationLevel doubleValue];
		customLegacyStrength = [customlegacyStrengthLevel doubleValue];
		%init(Safari);
		return;
    }

}