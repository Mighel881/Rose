#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>
#import <Cephei/HBPreferences.h>

#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

// Utils
HBPreferences *pfs;

// Thanks to Nepeta for the DRM
BOOL dpkgInvalid = NO;

// Preferences
BOOL enabled = YES;
BOOL enableHapticEngineSwitch = NO;
BOOL enableTapticEngineSwitch = NO;
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
BOOL QuickAccessButtonsSwitch = NO;
BOOL FBNavigationBarButtonSwitch = NO;

BOOL LowPowerMode;
BOOL LowPowerModeSwitch = NO;

NSString *hapticLevel = @"0";
NSString *tapticLevel = @"0";
NSString *delayLevel = @"0";

UIImpactFeedbackGenerator *gen;

NSFileManager *fileManager;
UIApplication *application;

NSString *pathForiCleaner = @"/Applications/iCleaner.app";
NSString *pathForCydia = @"/Applications/Cydia.app";
NSString *pathForSileo = @"/Applications/Sileo.app";

BOOL hasSeenCompatibilityAlert = NO;
NSString *pathForHapticPasscode = @"/Library/MobileSubstrate/DynamicLibraries/HapticPasscode.dylib";
NSString *pathForHapticKeys = @"/Library/MobileSubstrate/DynamicLibraries/HapticKeys.dylib";
NSString *pathForHapticVolume = @"/Library/MobileSubstrate/DynamicLibraries/HapticVolume.dylib";
NSString *pathForHapticker = @"/Library/MobileSubstrate/DynamicLibraries/Hapticker.dylib";
NSString *pathForHapticLock = @"/Library/MobileSubstrate/DynamicLibraries/HapticLock.dylib";

NSString *pathForRosePlist = @"/var/mobile/Library/Preferences/me.shymemoriees.rosepreferences.plist";

BOOL hasSeeniOSAlert = NO;

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