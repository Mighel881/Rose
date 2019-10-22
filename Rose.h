#import <UIKit/UIKit.h>
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
BOOL ccToggleSwitch = NO;
BOOL folderSwitch = NO;
BOOL openCloseAppSwitch = NO;
BOOL pageSwipeSwitch = NO;
BOOL screenshotSwitch = NO;
BOOL passcodeSwitch = NO;
BOOL keyboardSwitch = NO;
BOOL ringerSwitch = NO;
BOOL reachabilitySwitch = NO;
NSString *hapticLevel = @"0";

@interface UIKBTree : NSObject
@property (nonatomic, strong, readwrite) NSString * name;
+(id)sharedInstance;
+(id)key;
@end

@interface UIKeyboardLayoutStar : UIView
@property (nonatomic, copy) NSString * localizedInputKey;
-(void)setPlayKeyClickSoundOn:(int)arg1;
@end