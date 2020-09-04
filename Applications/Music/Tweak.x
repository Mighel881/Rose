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

BOOL enableMusicSection;

BOOL MusicPlayPauseButtonsSwitch;
BOOL MusicVolumeSliderSwitch;
BOOL MusicContextualActionsButtonSwitch;
BOOL MusicTimeSliderSwitch;
BOOL MusicSongCellSwitch;
BOOL MusicLibraryCellSwitch;
BOOL MusicAlbumCellSwitch;
BOOL MusicAirPlayButtonSwitch;
BOOL MusicLiveLyricsQueueButtonSwitch;
NSString *customStrengthMusicApplicationPlayButtonControl;
NSString *customStrengthMusicApplicationVolumeSliderControl;
NSString *customStrengthMusicApplicationContextualActionsButtonControl;
NSString *customStrengthMusicApplicationTimeSliderControl;
NSString *customStrengthMusicApplicationSongCellControl;
NSString *customStrengthLibraryCellControl;
NSString *customStrengthMusicApplicationAlbumCellControl;
NSString *customStrengthMPRouteButtonControl;
NSString *customStrengthMPButtonControl;

BOOL delaySwitch;
NSString* delayLevel;

BOOL LowPowerMode;
BOOL LowPowerModeSwitch;
BOOL isDNDActive;
BOOL isDNDActiveSwitch;
BOOL isRingerSilent;
BOOL isRingerSilentSwitch;

%group Music

%hook MusicApplicationPlayButton // Play/Pause, Skip, Previous Song buttons

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!MusicPlayPauseButtonsSwitch) return;
	int customStrength = [customStrengthMusicApplicationPlayButtonControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook _TtCC16MusicApplication32NowPlayingControlsViewController12VolumeSlider // This is not a ObjC method, just badly converted to ObjC , Volume Slider

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!MusicVolumeSliderSwitch) return;
	int customStrength = [customStrengthMusicApplicationVolumeSliderControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook MusicApplicationContextualActionsButton // "..." More Actions Button

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!MusicContextualActionsButtonSwitch) return;
	int customStrength = [customStrengthMusicApplicationContextualActionsButtonControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook MusicApplicationTimeSlider // Time Slider

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!MusicTimeSliderSwitch) return;
	int customStrength = [customStrengthMusicApplicationTimeSliderControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook MusicApplicationSongCell // Song Cell

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!MusicSongCellSwitch) return;
	int customStrength = [customStrengthMusicApplicationSongCellControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook  _TtCC16MusicApplication30LibraryMenuTableViewController4Cell // Same here, badly converted to ObjC , Library selections like "Songs" or "Albums"

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!MusicLibraryCellSwitch) return;
	int customStrength = [customStrengthLibraryCellControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook MusicApplicationAlbumCell // Album Cell

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!MusicAlbumCellSwitch) return;
	int customStrength = [customStrengthMusicApplicationAlbumCellControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook MPRouteButton // Airplay Button

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!MusicAirPlayButtonSwitch) return;
	NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];

	if ([bundleIdentifier isEqualToString:@"com.apple.Music"]) {
		int customStrength = [customStrengthMPRouteButtonControl intValue];

		if (customStrength == 0 && !enableLegacyEngineSwitch)
			[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
		else if (customStrength != 0 && !enableLegacyEngineSwitch)
			[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
		else if (customStrength == 0 && enableLegacyEngineSwitch)
			[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

	}

}

%end

%hook MPButton // Live Lyrics, Queue Button

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!MusicLiveLyricsQueueButtonSwitch) return;
	NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];

	if ([bundleIdentifier isEqualToString:@"com.apple.Music"]) {
		int customStrength = [customStrengthMPButtonControl intValue];

		if (customStrength == 0 && !enableLegacyEngineSwitch)
			[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	 	else if (customStrength != 0 && !enableLegacyEngineSwitch)
			[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	 	else if (customStrength == 0 && enableLegacyEngineSwitch)
			[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

	}

}

%end

%end

%ctor {

	pfs = [[HBPreferences alloc] initWithIdentifier:@"sh.litten.rosepreferences"];

    [pfs registerBool:&enabled default:nil forKey:@"Enabled"];
	[pfs registerBool:&enableExceptionsSection default:nil forKey:@"EnableExceptionsSection"];
	[pfs registerBool:&enableMusicSection default:nil forKey:@"EnableMusicSection"];

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

	if (enableMusicSection) {
		[pfs registerBool:&MusicPlayPauseButtonsSwitch default:NO forKey:@"MusicPlayPauseButtons"];
		[pfs registerBool:&MusicVolumeSliderSwitch default:NO forKey:@"MusicVolumeSlider"];
		[pfs registerBool:&MusicContextualActionsButtonSwitch default:NO forKey:@"MusicContextualActionsButton"];
		[pfs registerBool:&MusicTimeSliderSwitch default:NO forKey:@"MusicTimeSlider"];
		[pfs registerBool:&MusicSongCellSwitch default:NO forKey:@"MusicSongCell"];
		[pfs registerBool:&MusicLibraryCellSwitch default:NO forKey:@"MusicLibraryCell"];
		[pfs registerBool:&MusicAlbumCellSwitch default:NO forKey:@"MusicAlbumCell"];
		[pfs registerBool:&MusicAirPlayButtonSwitch default:NO forKey:@"MusicAirPlayButton"];
		[pfs registerBool:&MusicLiveLyricsQueueButtonSwitch default:NO forKey:@"MusicLiveLyricsQueueButton"];
		[pfs registerObject:&customStrengthMusicApplicationPlayButtonControl default:@"0" forKey:@"customStrengthMusicApplicationPlayButton"];
		[pfs registerObject:&customStrengthMusicApplicationVolumeSliderControl default:@"0" forKey:@"customStrengthMusicApplicationVolumeSlider"];
		[pfs registerObject:&customStrengthMusicApplicationContextualActionsButtonControl default:@"0" forKey:@"customStrengthMusicApplicationContextualActionsButton"];
		[pfs registerObject:&customStrengthMusicApplicationTimeSliderControl default:@"0" forKey:@"customStrengthMusicApplicationTimeSlider"];
		[pfs registerObject:&customStrengthMusicApplicationSongCellControl default:@"0" forKey:@"customStrengthMusicApplicationSongCell"];
		[pfs registerObject:&customStrengthLibraryCellControl default:@"0" forKey:@"customStrengthLibraryCell"];
		[pfs registerObject:&customStrengthMusicApplicationAlbumCellControl default:@"0" forKey:@"customStrengthMusicApplicationAlbumCell"];
		[pfs registerObject:&customStrengthMPRouteButtonControl default:@"0" forKey:@"customStrengthMPRouteButton"];
		[pfs registerObject:&customStrengthMPButtonControl default:@"0" forKey:@"customStrengthMPButton"];
	}

    if (enabled && enableMusicSection) {
		haptics = [[roseCall alloc] init];
		tapticLVL = [tapticLevel intValue];
		hapticLVL = [hapticLevel intValue];
		delayLVL = [delayLevel doubleValue];
		selectedLegacyMode = [legacyLevel intValue];
		customLegacyDuration = [customlegacyDurationLevel doubleValue];
		customLegacyStrength = [customlegacyStrengthLevel doubleValue];
		%init(Music, MusicApplicationPlayButton=objc_getClass("MusicApplication.NowPlayingTransportButton"), MusicApplicationContextualActionsButton=objc_getClass("MusicApplication.ContextualActionsButton"), MusicApplicationTimeSlider=objc_getClass("MusicApplication.PlayerTimeControl"), MusicApplicationSongCell=objc_getClass("MusicApplication.SongCell"), MusicApplicationAlbumCell=objc_getClass("MusicApplication.AlbumCell"));
		return;
    }

}