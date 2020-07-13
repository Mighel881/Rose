#import <UIKit/UIKit.h>
#import <Cephei/HBPreferences.h>

#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

HBPreferences *pfs;

BOOL dpkgInvalid;

extern BOOL enabled;
extern BOOL enableHomescreenSection;
extern BOOL enableLockscreenSection;
extern BOOL enableAnywhereSection;
extern BOOL enableHardwareButtonsSection;
extern BOOL enableControlCenterSection;
extern BOOL enableStatusChangesSection;
extern BOOL enableOtherHardwareActionsSection;
extern BOOL enableSystemWideSection;
extern BOOL enableApplicationsSection;
extern BOOL enableExceptionsSection;

extern BOOL enableApolloSection;
extern BOOL enableCalculatorSection;
extern BOOL enableFacebookSection;
extern BOOL enableInstagramSection;
extern BOOL enableMusicSection;
extern BOOL enablePhoneSection;
extern BOOL enableSafariSection;
extern BOOL enableSpotifySection;
extern BOOL enableTikTokSection;
extern BOOL enableTwitterSection;

extern BOOL enableTapticEngineSwitch;
extern BOOL enableHapticEngineSwitch;
extern BOOL enableLegacyEngineSwitch;

extern NSString* tapticLevel;
extern NSString* hapticLevel;
extern NSString* legacyLevel;
extern NSString* customlegacyDurationLevel;
extern NSString* customlegacyStrengthLevel;

// Homescreen Section
extern BOOL forceSwitch;
extern BOOL folderOpenSwitch;
extern BOOL folderCloseSwitch;
extern BOOL iconTapSwitch;
extern BOOL pageSwipeSwitch;
extern BOOL spotlightSwitch;
extern NSString* customStrengthForceTouchControl;
extern NSString* customStrengthFolderOpenControl;
extern NSString* customStrengthFolderCloseControl;
extern NSString* customStrengthIconTapControl;
extern NSString* customStrengthPageSwipeControl;
extern NSString* customStrengthSpotlightControl;

// Lockscreen Section
extern BOOL passcodeSwitch;
extern BOOL quickActionsButtonSwitch;
extern NSString* customStrengthPasscodeControl;
extern NSString* customStrengthQuickActionsButtonControl;

// Anywhere Section
extern BOOL killingSwitch;
extern BOOL switcherSwitch;
extern BOOL siriSwitch;
extern BOOL screenshotSwitch;
extern BOOL reachabilitySwitch;
extern BOOL textSelectionSwitch;
extern BOOL powerSwitch;
extern BOOL respringSwitch;
extern BOOL keyboardSwitch;
extern BOOL enterBackgroundSwitch;
extern BOOL alertAppearSwitch;
extern BOOL alertDisappearSwitch;
extern NSString* customStrengthKillingControl;
extern NSString* customStrengthSwitcherControl;
extern NSString* customStrengthSiriControl;
extern NSString* customStrengthScreenshotControl;
extern NSString* customStrengthReachabilityControl;
extern NSString* customStrengthTextSelectionControl;
extern NSString* customStrengthPowerDownControl;
extern NSString* customStrengthRespringControl;
extern NSString* customStrengthKeyboardControl;
extern NSString* customStrengthEnterBackgroundControl;
extern NSString* customStrengthAlertAppearControl;
extern NSString* customStrengthAlertDisappearControl;

// Hardware Buttons
extern BOOL volumeSwitch;
extern BOOL sleepButtonSwitch;
extern BOOL lockAnimationSwitch;
extern BOOL ringerSwitch;
extern NSString* customStrengthVolumeControl;
extern NSString* customStrengthSleepButtonControl;
extern NSString* customStrengthRingerControl;

// Control Center Section
extern BOOL ccToggleSwitch;
extern BOOL openControlCenterSwitch;
extern BOOL ccModuleSwitch;
extern NSString* customStrengthCCToggleControl;
extern NSString* customStrengthOpenControlCenterControl;
extern NSString* customStrengthCCModuleControl;

// Status Changes Section
extern BOOL unlockSwitch;
extern BOOL lockSwitch;
extern BOOL authenticationSwitch;
extern BOOL callSwitch;
extern NSString* customStrengthUnlockControl;
extern NSString* customStrengthLockControl;
extern NSString* customStrengthAuthenticationControl;
extern NSString* customStrengthCallControl;

// Other Hardware Actions Section
extern BOOL wakeSwitch;
extern BOOL pluggedSwitch;
extern BOOL connectBluetoothDeviceSwitch;
extern NSString* customStrengthWakeControl;
extern NSString* customStrengthPluggedControl;
extern NSString* customStrengthConnectBluetoothDeviceControl;

// System Wide Section
extern BOOL UIButtonSwitch;
extern BOOL UIButtonBarButtonSwitch;
extern BOOL UITabBarButtonSwitch;
extern BOOL UIImageViewSwitch;
extern BOOL UIViewSwitch;
extern BOOL UIWindowSwitch;
extern NSString* customStrengthUIButtonControl;
extern NSString* customStrengthUIButtonBarButtonControl;
extern NSString* customStrengthUITabBarButtonControl;
extern NSString* customStrengthUIImageViewControl;
extern NSString* customStrengthUIViewControl;
extern NSString* customStrengthUIWindowControl;

// Apollo
extern BOOL apolloJumpBarSwitch;
extern BOOL apolloFloatingActionButtonSwitch;
extern BOOL apolloASDisplayViewSwitch;
extern BOOL apolloUIButtonSwitch;
extern NSString* customStrengthApolloJumpBarControl;
extern NSString* customStrengthApolloFloatingActionButtonControl;
extern NSString* customStrengthApolloASDisplayViewControl;
extern NSString* customStrengthApolloUIButtonControl;

// Calculator
extern BOOL CalculatorKeyPadButtonSwitch;
extern NSString* customStrengthCalculatorApplicationKeyPadButtonControl;

// Facebook
extern BOOL FBTabBarSwitch;
extern BOOL FBQuickAccessButtonsSwitch;
extern BOOL FBNavigationBarButtonSwitch;
extern NSString* customStrengthFBTabBarControl;
extern NSString* customStrengthFBQuickAccessButtonsControl;
extern NSString* customStrengthFBNavigationBarButtonControl;

// Instagram
extern BOOL ITGlikeButtonSwitch;
extern BOOL ITGdoubleTapToLikeSwitch;
extern BOOL ITGcommentButtonSwitch;
extern BOOL ITGsaveButtonSwitch;
extern BOOL ITGsendButtonSwitch;
extern NSString* customStrengthITGlikeButtonControl;
extern NSString* customStrengthITGdoubleTapToLikeControl;
extern NSString* customStrengthITGcommentButtonControl;
extern NSString* customStrengthITGsaveButtonControl;
extern NSString* customStrengthITGsendButtonControl;

// Music
extern BOOL MusicPlayPauseButtonsSwitch;
extern BOOL MusicVolumeSliderSwitch;
extern BOOL MusicContextualActionsButtonSwitch;
extern BOOL MusicTimeSliderSwitch;
extern BOOL MusicSongCellSwitch;
extern BOOL MusicLibraryCellSwitch;
extern BOOL MusicAlbumCellSwitch;
extern BOOL MusicAirPlayButtonSwitch;
extern BOOL MusicLiveLyricsQueueButtonSwitch;
extern NSString *customStrengthMusicApplicationPlayButtonControl;
extern NSString *customStrengthMusicApplicationVolumeSliderControl;
extern NSString *customStrengthMusicApplicationContextualActionsButtonControl;
extern NSString *customStrengthMusicApplicationTimeSliderControl;
extern NSString *customStrengthMusicApplicationSongCellControl;
extern NSString *customStrengthLibraryCellControl;
extern NSString *customStrengthMusicApplicationAlbumCellControl;
extern NSString *customStrengthMPRouteButtonControl;
extern NSString *customStrengthMPButtonControl;

// Phone
extern BOOL PHNumberPadSwitch;
extern BOOL PHContactCellSwitch;
extern BOOL PHDialerDeleteButtonSwitch;
extern BOOL PHDialerCallButtonSwitch;
extern NSString* customStrengthPHNumberPadControl;
extern NSString* customStrengthPHContactCellControl;
extern NSString* customStrengthPHDialerDeleteButtonControl;
extern NSString* customStrengthPHDialerCallButtonControl;

// Safari
extern BOOL SFUrlSwitch;
extern NSString* customStrengthSFUrlControl;

// Spotify
extern BOOL SPTplayButtonSwitch;
extern BOOL SPTplayBarButtonSwitch;
extern BOOL SPTpreviousTrackButtonSwitch;
extern BOOL SPTnextTrackButtonSwitch;
extern BOOL SPTrepeatButtonSwitch;
extern BOOL SPTshuffleButtonSwitch;
extern BOOL SPTqueueButtonSwitch;
extern BOOL SPTsliderSwitch;
extern BOOL SPTfreeTierButtonSwitch;
extern BOOL SPTavailableDevicesButtonSwitch;
extern BOOL SPTnowPlayingLabelSwitch;
extern BOOL SPTplaylistButtonsSwitch;
extern NSString* customStrengthSPTplayButtonControl;
extern NSString* customStrengthSPTplayBarButtonControl;
extern NSString* customStrengthSPTpreviousTrackButtonControl;
extern NSString* customStrengthSPTnextTrackButtonControl;
extern NSString* customStrengthSPTrepeatButtonControl;
extern NSString* customStrengthSPTshuffleButtonControl;
extern NSString* customStrengthSPTqueueButtonControl;
extern NSString* customStrengthSPTsliderControl;
extern NSString* customStrengthSPTfreeTierButtonControl;
extern NSString* customStrengthSPTavailableDevicesButtonControl;
extern NSString* customStrengthSPTnowPlayingLabelControl;
extern NSString* customStrengthSPTplaylistButtonsControl;

// TikTok
extern BOOL TTlikeCommentShareButtonsSwitch;
extern NSString* customStrengthTTlikeCommentShareButtonsControl;

// Twitter
extern BOOL TWTtabBarSwitch;
extern BOOL TWTtweetViewSwitch;
extern BOOL TWTdirectMessagesTapSwitch;
extern BOOL TWTactivityTapSwitch;
extern BOOL TWTtweetButtonSwitch;
extern NSString* customStrengthTWTtabBarControl;
extern NSString* customStrengthTWTtweetViewControl;
extern NSString* customStrengthTWTdirectMessagesTapControl;
extern NSString* customStrengthTWTactivityTapControl;
extern NSString* customStrengthTWTtweetButtonControl;

// Delay
extern BOOL delaySwitch;
extern NSString* delayLevel;

// Low Power Mode And DND Mode Recognition
extern BOOL LowPowerMode;
extern BOOL LowPowerModeSwitch;
extern BOOL isDNDActive;
extern BOOL isDNDActiveSwitch;
extern BOOL isRingerSilent;
extern BOOL isRingerSilentSwitch;

@interface UIKBTree : NSObject
@end

@interface SBIconController : UIViewController
- (void)viewDidAppear:(BOOL)animated;
@end

@interface SBCoverSheetPrimarySlidingViewController : UIViewController
- (void)viewDidAppear:(BOOL)arg1;
@end