#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>
#import <Cephei/HBPreferences.h>

// Used To Detect What iOS Version Is Being Used
#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

// Utils
HBPreferences *pfs;

// Thanks to Nepeta for the DRM
BOOL dpkgInvalid = NO;

// Option Switches
extern BOOL enabled;
extern BOOL enableTapticEngineSwitch;
extern BOOL enableHapticEngineSwitch;
extern BOOL enableLegacyEngineSwitch;

// Feedback Strength Segmented Controls, Custom Legacy Settings And Delay Slider
NSString* tapticLevel = @"0";
NSString* hapticLevel = @"0";
NSString* legacyLevel = @"0";
NSString* customlegacyDurationLevel = @"0";
NSString* customlegacyStrengthLevel = @"0";
int customFeedbackValue;

// Taptic Engine Feedback generator
UIImpactFeedbackGenerator *gen;

// Switches To Enable Sections
BOOL anywhereSectionSupportSwitch = NO;
BOOL controlCenterSectionSupportSwitch = NO;
BOOL hardwareButtonsSectionSupportSwitch = NO;
BOOL homescreenSectionSupportSwitch = NO;
BOOL lockscreenSectionSupportSwitch = NO;
BOOL otherHardwareActionsSectionSupportSwitch = NO;
BOOL statusChangesSectionSupportSwitch = NO;
BOOL systemWideSectionSupportSwitch = NO;
BOOL extrasSectionSupportSwitch = NO;
BOOL exceptionsSectionSupportSwitch = NO;

// Anywhere Section
BOOL killingSwitch = NO;
BOOL switcherSwitch = NO;
BOOL siriSwitch = NO;
BOOL screenshotSwitch = NO;
BOOL reachabilitySwitch = NO;
BOOL textSelectionSwitch = NO;
BOOL powerSwitch = NO;
BOOL respringSwitch = NO;
BOOL touchesSwitch = NO;
BOOL keyboardSwitch = NO;
BOOL enterBackgroundSwitch = NO;
BOOL alertAppearSwitch = NO;
BOOL alertDisappearSwitch = NO;

// Control Center Section
BOOL ccToggleSwitch = NO;
BOOL openControlCenterSwitch = NO;
BOOL ccModuleSwitch = NO;

// Hardware Buttons
BOOL volumeSwitch = NO;
BOOL sleepButtonSwitch = NO;
BOOL homeButtonSwitch = NO;
BOOL ringerSwitch = NO;

// Homescreen Section
BOOL forceSwitch = NO;
BOOL folderOpenSwitch = NO;
BOOL folderCloseSwitch = NO;
BOOL iconTapSwitch = NO;
BOOL pageSwipeSwitch = NO;
BOOL spotlightSwitch = NO;

// Lockscreen Section
BOOL passcodeSwitch = NO;
BOOL quickActionsButtonSwitch = NO;

// Other Hardware Actions Section
BOOL wakeSwitch = NO;
BOOL pluggedSwitch = NO;
BOOL connectBluetoothDeviceSwitch = NO;

// Status Changes Section
BOOL unlockSwitch = NO;
BOOL lockSwitch = NO;
BOOL authenticationSwitch = NO;
BOOL callSwitch = NO;

// System Wide Section
BOOL UIButtonSwitch = NO;
BOOL UIButtonBarButtonSwitch = NO;
BOOL UITabBarButtonSwitch = NO;

// Additionals Section
BOOL lockAnimationSwitch = NO;

// Enable App Support Switches
BOOL apolloSupportSwitch = NO;
BOOL calculatorSupportSwitch = NO;
BOOL facebookSupportSwitch = NO;
BOOL instagramSupportSwitch = NO;
BOOL musicSupportSwitch = NO;
BOOL phoneSupportSwitch = NO;
BOOL safariSupportSwitch = NO;
BOOL sileoSupportSwitch = NO;
BOOL spotifySupportSwitch = NO;
BOOL tiktokSupportSwitch = NO;
BOOL twitterSupportSwitch = NO;

// Spotify
BOOL SPTplayButtonSwitch = NO;
BOOL SPTplayBarButtonSwitch = NO;
BOOL SPTpreviousTrackButtonSwitch = NO;
BOOL SPTnextTrackButtonSwitch = NO;
BOOL SPTrepeatButtonSwitch = NO;
BOOL SPTshuffleButtonSwitch = NO;
BOOL SPTqueueButtonSwitch = NO;
BOOL SPTsliderSwitch = NO;
BOOL SPTfreeTierButtonSwitch = NO;
BOOL SPTavailableDevicesButtonSwitch = NO;
BOOL SPTnowPlayingLabelSwitch = NO;

// Instagram
BOOL ITGlikeButtonSwitch = NO;
BOOL ITGdoubleTapToLikeSwitch = NO;
BOOL ITGcommentButtonSwitch = NO;
BOOL ITGsaveButtonSwitch = NO;
BOOL ITGsendButtonSwitch = NO;

// TikTok
BOOL TTlikeCommentShareButtonsSwitch = NO;

// Twitter
BOOL TWTtabBarSwitch = NO;
BOOL TWTtweetViewSwitch = NO;
BOOL TWTdirectMessagesTapSwitch = NO;
BOOL TWTactivityTapSwitch = NO;
BOOL TWTtweetButtonSwitch = NO;

// Safari
BOOL SFUrlSwitch = NO;

// Phone
BOOL PHNumberPadSwitch = NO;
BOOL PHContactCellSwitch = NO;
BOOL PHDialerDeleteButtonSwitch = NO;
BOOL PHDialerCallButtonSwitch = NO;

// Facebook
BOOL FBTabBarSwitch = NO;
BOOL FBQuickAccessButtonsSwitch = NO;
BOOL FBNavigationBarButtonSwitch = NO;

// Music
BOOL MusicPlayPauseButtonsSwitch = NO;
BOOL MusicVolumeSliderSwitch = NO;
BOOL MusicContextualActionsButtonSwitch = NO;
BOOL MusicTimeSliderSwitch = NO;
BOOL MusicSongCellSwitch = NO;
BOOL MusicLibraryCellSwitch = NO;
BOOL MusicAlbumCellSwitch = NO;
BOOL MusicAirPlayButtonSwitch = NO;
BOOL MusicLiveLyricsQueueButtonSwitch = NO;

// Calculator
BOOL CalculatorKeyPadButtonSwitch = NO;

// Sileo
BOOL SileoSourcesCellSwitch = NO;
BOOL SileoPackageCollectionViewCellSwitch;
BOOL SileoTableViewCellSwitch = NO;
BOOL SileoFeaturedBannerViewSwitch = NO;
BOOL SileoConfirmDownloadButtonSwitch = NO;

// Apollo
BOOL apolloJumpBarSwitch = NO;
BOOL apolloFloatingActionButtonSwitch = NO;
BOOL apolloASDisplayViewSwitch = NO;
BOOL apolloUIButtonSwitch = NO;

// Delay
BOOL delaySwitch = NO;
NSString* delayLevel = @"0.0";

// Low Power Mode And DND Mode Recognition
BOOL LowPowerMode;
BOOL LowPowerModeSwitch = NO;
BOOL isDNDActive;
BOOL isDNDActiveSwitch = NO;

// Anywhere Section (Custom)
NSString* customStrengthKillingControl = @"0";
NSString* customStrengthSwitcherControl = @"0";
NSString* customStrengthSiriControl = @"0";
NSString* customStrengthScreenshotControl = @"0";
NSString* customStrengthReachabilityControl = @"0";
NSString* customStrengthTextSelectionControl = @"0";
NSString* customStrengthPowerDownControl = @"0";
NSString* customStrengthRespringControl = @"0";
NSString* customStrengthTouchesControl = @"0";
NSString* customStrengthKeyboardControl = @"0";
NSString* customStrengthEnterBackgroundControl = @"0";
NSString* customStrengthAlertAppearControl = @"0";
NSString* customStrengthAlertDisappearControl = @"0";

// Control Center Section (Custom)
NSString* customStrengthCCToggleControl = @"0";
NSString* customStrengthOpenControlCenterControl = @"0";
NSString* customStrengthCCModuleControl = @"0";

// Hardware Buttons Section (Custom)
NSString* customStrengthVolumeControl = @"0";
NSString* customStrengthSleepButtonControl = @"0";
NSString* customStrengthHomeButtonControl = @"0";
NSString* customStrengthRingerControl = @"0";

// Homescreen Section (Custom)
NSString* customStrengthForceTouchControl = @"0";
NSString* customStrengthFolderOpenControl = @"0";
NSString* customStrengthFolderCloseControl = @"0";
NSString* customStrengthIconTapControl = @"0";
NSString* customStrengthPageSwipeControl = @"0";
NSString* customStrengthSpotlightControl = @"0";

// Lockscreen Section (Custom)
NSString* customStrengthPasscodeControl = @"0";
NSString* customStrengthQuickActionsButtonControl = @"0";

// Other Hardware Action Section (Custom)
NSString* customStrengthWakeControl = @"0";
NSString* customStrengthPluggedControl = @"0";
NSString* customStrengthConnectBluetoothDeviceControl = @"0";

// Status Changes Section (Custom)
NSString* customStrengthUnlockControl = @"0";
NSString* customStrengthLockControl = @"0";
NSString* customStrengthAuthenticationControl = @"0";
NSString* customStrengthCallControl = @"0";

// System Wide Section (Custom)
NSString* customStrengthUIButtonControl = @"0";
NSString* customStrengthUIButtonBarButtonControl = @"0";
NSString* customStrengthUITabBarButtonControl = @"0";

NSString *customStrengthSPTplayButtonControl = @"0";
NSString *customStrengthSPTplayBarButtonControl = @"0";
NSString *customStrengthSPTpreviousTrackButtonControl = @"0";
NSString *customStrengthSPTnextTrackButtonControl = @"0";
NSString *customStrengthSPTrepeatButtonControl = @"0";
NSString *customStrengthSPTshuffleButtonControl = @"0";
NSString *customStrengthSPTqueueButtonControl = @"0";
NSString *customStrengthSPTsliderControl = @"0";
NSString *customStrengthSPTfreeTierButtonControl = @"0";
NSString *customStrengthSPTavailableDevicesButtonControl = @"0";
NSString *customStrengthSPTnowPlayingLabelControl = @"0";

NSString *customStrengthITGlikeButtonControl = @"0";
NSString *customStrengthITGdoubleTapToLikeControl = @"0";
NSString *customStrengthITGcommentButtonControl = @"0";
NSString *customStrengthITGsaveButtonControl = @"0";
NSString *customStrengthITGsendButtonControl = @"0";

NSString *customStrengthTTlikeCommentShareButtonsControl = @"0";

NSString *customStrengthTWTtabBarControl = @"0";
NSString *customStrengthTWTtweetViewControl = @"0";
NSString *customStrengthTWTdirectMessagesTapControl = @"0";
NSString *customStrengthTWTactivityTapControl = @"0";
NSString *customStrengthTWTtweetButtonControl = @"0";

NSString *customStrengthSFUrlControl = @"0";

NSString *customStrengthPHNumberPadControl = @"0";
NSString *customStrengthPHContactCellControl = @"0";
NSString *customStrengthPHDialerDeleteButtonControl = @"0";
NSString *customStrengthPHDialerCallButtonControl = @"0";

NSString *customStrengthFBTabBarControl = @"0";
NSString *customStrengthFBQuickAccessButtonsControl = @"0";
NSString *customStrengthFBNavigationBarButtonControl = @"0";

NSString *customStrengthMusicApplicationPlayButtonControl = @"0";
NSString *customStrengthMusicApplicationVolumeSliderControl = @"0";
NSString *customStrengthMusicApplicationContextualActionsButtonControl = @"0";
NSString *customStrengthMusicApplicationTimeSliderControl = @"0";
NSString *customStrengthMusicApplicationSongCellControl = @"0";
NSString *customStrengthLibraryCellControl = @"0";
NSString *customStrengthMusicApplicationAlbumCellControl = @"0";
NSString *customStrengthMPRouteButtonControl = @"0";
NSString *customStrengthMPButtonControl = @"0";

NSString *customStrengthCalculatorApplicationKeyPadButtonControl = @"0";

NSString *customStrengthSileoSourcesCellControl = @"0";
NSString *customStrengthSileoPackageCollectionViewCellControl = @"0";
NSString *customStrengthSileoTableViewCellControl = @"0";
NSString *customStrengthSileoFeaturedBannerViewControl = @"0";
NSString *customStrengthSileoConfirmDownloadButtonControl = @"0";

NSString *customStrengthApolloJumpBarControl = @"0";
NSString *customStrengthApolloFloatingActionButtonControl = @"0";
NSString *customStrengthApolloASDisplayViewControl = @"0";
NSString *customStrengthApolloUIButtonControl = @"0";

// File manager For Later
NSFileManager *fileManager;

// Compatibility Warning
BOOL hasSeenCompatibilityAlert = NO;
NSString *pathForHapticPasscode = @"/Library/MobileSubstrate/DynamicLibraries/HapticPasscode.dylib";
NSString *pathForHapticKeys = @"/Library/MobileSubstrate/DynamicLibraries/HapticKeys.dylib";
NSString *pathForHapticVolume = @"/Library/MobileSubstrate/DynamicLibraries/HapticVolume.dylib";
NSString *pathForHapticker = @"/Library/MobileSubstrate/DynamicLibraries/Hapticker.dylib";
NSString *pathForHapticLock = @"/Library/MobileSubstrate/DynamicLibraries/HapticLock.dylib";
// Path For The Rose Preferences plist
NSString *pathForRosePlist = @"/var/mobile/Library/Preferences/sh.litten.rosepreferences.plist";
// iOS 12 Warning To Not Use Soft Or Rigid Mode
BOOL hasSeeniOSAlert = NO;

// Needed Interfaces
@interface UIKBTree : NSObject
@end

@interface DNDState : NSObject
- (BOOL)isActive;
@end

@interface SBIconController : UIViewController
- (void)viewDidAppear:(BOOL)animated;
@end

@interface SBCoverSheetPrimarySlidingViewController : UIViewController
- (void)viewDidDisappear:(BOOL)arg1;
- (void)viewDidAppear:(BOOL)arg1;
@end