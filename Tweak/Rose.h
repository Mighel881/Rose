#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>
#import <Cephei/HBPreferences.h>

#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

// Utils
HBPreferences *pfs;

// Thanks to Nepeta for the DRM
BOOL dpkgInvalid = NO;

// Option Switches
BOOL enabled = YES;
BOOL enableTapticEngineSwitch = NO;
BOOL enableHapticEngineSwitch = NO;
BOOL enableLegacyEngineSwitch = NO;
BOOL delaySwitch = NO;
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
BOOL ccToggleSwitch = NO;
BOOL folderSwitch = NO;
BOOL iconTapSwitch = NO;
BOOL pageSwipeSwitch = NO;
BOOL screenshotSwitch = NO;
BOOL passcodeSwitch = NO;
BOOL keyboardSwitch = NO;
BOOL ringerSwitch = NO;
BOOL reachabilitySwitch = NO;
BOOL textSelectionSwitch = NO;
BOOL spotlightSwitch = NO;
BOOL callSwitch = NO;
BOOL authenticationSwitch = NO;
BOOL sleepButtonSwitch = NO;
BOOL homeButtonSwitch = NO;
BOOL touchesSwitch = NO;
BOOL openControlCenterSwitch = NO;
BOOL ccModuleSwitch = NO;
BOOL enterBackgroundSwitch = NO;
BOOL shutdownWarningSwitch = YES;
BOOL featureWarningSwitch = YES;

// iOS System Wide
BOOL uiButtonSwitch = NO;
BOOL uiViewSwitch= NO;
BOOL UIButtonBarButtonSwitch = NO;
BOOL uiImageViewSwitch = NO;
BOOL mtMaterialViewSwitch = NO;
BOOL uiStackViewSwitch = NO;
BOOL uiLabelSwitch = NO;
BOOL uiVisualEffectViewSwitch = NO;

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
BOOL SileoPackageCollectionViewCellSwitch = NO;
BOOL SileoTableViewCellSwitch = NO;
BOOL SileoFeaturedBannerViewSwitch = NO;
BOOL SileoConfirmDownloadButtonSwitch = NO;

// Low Power Mode recognition
BOOL LowPowerMode;
BOOL LowPowerModeSwitch = NO;

// Feedback strength segmented controls, custom legacy settings and delay slider
NSString *tapticLevel = @"0";
NSString *hapticLevel = @"0";
NSString *legacyLevel = @"0";
NSString *customlegacyDurationLevel = @"0";
NSString *customlegacyStrengthLevel = @"0";
NSString *delayLevel = @"0";
int customFeedbackValue;

// Custom strength link list controllers
NSString *customStrengthRespringControl = @"0";
NSString *customStrengthRingerControl = @"0";
NSString *customStrengthHomeButtonControl = @"0";
NSString *customStrengthUnlockControl = @"0";
NSString *customStrengthLockControl = @"0";
NSString *customStrengthSleepButtonControl = @"0";
NSString *customStrengthVolumeControl = @"0";
NSString *customStrengthPowerDownControl = @"0";
NSString *customStrengthKillingControl = @"0";
NSString *customStrengthForceTouchControl = @"0";
NSString *customStrengthPluggedControl = @"0";
NSString *customStrengthReachabilityControl = @"0";
NSString *customStrengthSwitcherControl = @"0";
NSString *customStrengthSiriControl = @"0";
NSString *customStrengthCCToggleControl = @"0";
NSString *customStrengthFolderControl = @"0";
NSString *customStrengthIconTapControl = @"0";
NSString *customStrengthPageSwipeControl = @"0";
NSString *customStrengthScreenshotControl = @"0";
NSString *customStrengthPasscodeControl = @"0";
NSString *customStrengthKeyboardControl = @"0";
NSString *customStrengthTextSelectionControl = @"0";
NSString *customStrengthSpotlightControl = @"0";
NSString *customStrengthCallControl = @"0";
NSString *customStrengthAuthenticationControl = @"0";
NSString *customStrengthWakeControl = @"0";
NSString *customStrengthTouchesControl = @"0";
NSString *customStrengthOpenControlCenterControl = @"0";
NSString *customStrengthCCModuleControl = @"0";
NSString *customStrengthEnterBackgroundControl = @"0";

NSString *customStrengthuiButtonControl = @"0";
NSString *customStrengthuiViewControl = @"0";
NSString *customStrengthuiButtonBarButtonControl = @"0";
NSString *customStrengthuiImageViewControl = @"0";
NSString *customStrengthmtMaterialViewControl = @"0";
NSString *customStrengthuiStackViewControl = @"0";
NSString *customStrengthuiLabelControl = @"0";
NSString *customStrengthuiVisualEffectViewControl = @"0";

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

// Taptic Engine Feedback generator
UIImpactFeedbackGenerator *gen;

// File manager and UIApplication
NSFileManager *fileManager;
UIApplication *application;

// Paths for recognition of needed Apps
NSString *pathForiCleaner = @"/Applications/iCleaner.app";
NSString *pathForCydia = @"/Applications/Cydia.app";
NSString *pathForSileo = @"/Applications/Sileo.app";

// Compatibility warning
BOOL hasSeenCompatibilityAlert = NO;
NSString *pathForHapticPasscode = @"/Library/MobileSubstrate/DynamicLibraries/HapticPasscode.dylib";
NSString *pathForHapticKeys = @"/Library/MobileSubstrate/DynamicLibraries/HapticKeys.dylib";
NSString *pathForHapticVolume = @"/Library/MobileSubstrate/DynamicLibraries/HapticVolume.dylib";
NSString *pathForHapticker = @"/Library/MobileSubstrate/DynamicLibraries/Hapticker.dylib";
NSString *pathForHapticLock = @"/Library/MobileSubstrate/DynamicLibraries/HapticLock.dylib";
// Path for the Rose preferences plist
NSString *pathForRosePlist = @"/var/mobile/Library/Preferences/me.shymemoriees.rosepreferences.plist";
// iOS 12 warning to not use Soft or Rigid mode
BOOL hasSeeniOSAlert = NO;

// Needed Interfaces
@interface UIKBTree : NSObject
@property (nonatomic, strong, readwrite) NSString * name;
+ (id)sharedInstance;
+ (id)key;
@end

@interface UIKeyboardLayoutStar : UIView
@property (nonatomic, copy) NSString * localizedInputKey;
- (void)setPlayKeyClickSoundOn:(int)arg1;
@end

@interface SBPowerDownController : UIViewController
- (void)cancel;
@end

@interface SBPowerDownViewController : UIViewController
- (void)cancel;
- (void)viewWillAppear:(BOOL)arg1;
@end

@interface SBIconController : UIViewController
- (void)viewDidAppear:(BOOL)animated;
@end

@interface SBCoverSheetPrimarySlidingViewController : UIViewController
- (void)viewDidDisappear:(BOOL)arg1;
- (void)viewDidAppear:(BOOL)arg1;
@end