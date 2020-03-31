#include "RSERootListController.h"
#include <Cephei/HBRespringController.h>
#import "../Tweak/Rose.h"
#import <sys/utsname.h>
#import <spawn.h>

BOOL enabled = NO;
BOOL enableTapticEngineSwitch;
BOOL enableHapticEngineSwitch;
BOOL enableLegacyEngineSwitch;

int currentAction = 0;
BOOL hasCompletedSetup = NO;
BOOL isTapticEngineDevice;
BOOL isHapticEngineDevice;
BOOL isOldEngineDevice;

UIViewController* controller;
UIViewController* controller2;
UIButton* continueButton;
UIActivityIndicatorView *loadingIndicator;
UITextView* textView;
NSString* logText = @"";

UIImpactFeedbackGenerator* gen;

@implementation RSERootListController

- (instancetype)init {

    self = [super init];

    if (self) {
        RSEAppearanceSettings *appearanceSettings = [[RSEAppearanceSettings alloc] init];
        self.hb_appearanceSettings = appearanceSettings;
        self.enableSwitch = [[UISwitch alloc] init];
        self.enableSwitch.onTintColor = [UIColor colorWithRed:0.11 green:0.22 blue:0.44 alpha:1.00];
        [self.enableSwitch addTarget:self action:@selector(toggleState) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem* switchy = [[UIBarButtonItem alloc] initWithCustomView: self.enableSwitch];
        self.navigationItem.rightBarButtonItem = switchy;

        self.navigationItem.titleView = [UIView new];
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,10,10)];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.titleLabel.text = @"5.3.1";
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.navigationItem.titleView addSubview:self.titleLabel];

        self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,10,10)];
        self.iconView.contentMode = UIViewContentModeScaleAspectFit;
        self.iconView.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/RosePrefs.bundle/icon@2x.png"];
        self.iconView.translatesAutoresizingMaskIntoConstraints = NO;
        self.iconView.alpha = 0.0;
        [self.navigationItem.titleView addSubview:self.iconView];
        
        [NSLayoutConstraint activateConstraints:@[
            [self.titleLabel.topAnchor constraintEqualToAnchor:self.navigationItem.titleView.topAnchor],
            [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.navigationItem.titleView.leadingAnchor],
            [self.titleLabel.trailingAnchor constraintEqualToAnchor:self.navigationItem.titleView.trailingAnchor],
            [self.titleLabel.bottomAnchor constraintEqualToAnchor:self.navigationItem.titleView.bottomAnchor],
            [self.iconView.topAnchor constraintEqualToAnchor:self.navigationItem.titleView.topAnchor],
            [self.iconView.leadingAnchor constraintEqualToAnchor:self.navigationItem.titleView.leadingAnchor],
            [self.iconView.trailingAnchor constraintEqualToAnchor:self.navigationItem.titleView.trailingAnchor],
            [self.iconView.bottomAnchor constraintEqualToAnchor:self.navigationItem.titleView.bottomAnchor],
        ]];
    }

    return self;

}

- (NSArray *)specifiers {

	if (_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
        
	}

	return _specifiers;
    
}

- (void)viewDidLoad {

    [super viewDidLoad];

    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,200,200)];
    self.headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,200,200)];
    self.headerImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.headerImageView.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/RosePrefs.bundle/Banner.png"];
    self.headerImageView.translatesAutoresizingMaskIntoConstraints = NO;

    [self.headerView addSubview:self.headerImageView];
    [NSLayoutConstraint activateConstraints:@[
        [self.headerImageView.topAnchor constraintEqualToAnchor:self.headerView.topAnchor],
        [self.headerImageView.leadingAnchor constraintEqualToAnchor:self.headerView.leadingAnchor],
        [self.headerImageView.trailingAnchor constraintEqualToAnchor:self.headerView.trailingAnchor],
        [self.headerImageView.bottomAnchor constraintEqualToAnchor:self.headerView.bottomAnchor],
    ]];

    _table.tableHeaderView = self.headerView;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    tableView.tableHeaderView = self.headerView;
    return [super tableView:tableView cellForRowAtIndexPath:indexPath];

}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];

    CGRect frame = self.table.bounds;
    frame.origin.y = -frame.size.height;

    self.navigationController.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.56 green:0.66 blue:0.79 alpha:1.00];
    [self.navigationController.navigationController.navigationBar setShadowImage: [UIImage new]];
    self.navigationController.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationController.navigationBar.translucent = NO;

    self.enableSwitch.enabled = YES;

}

- (void)viewDidAppear:(BOOL)animated {

    [super viewDidAppear:animated];

    [self.navigationController.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];

    NSString* path = [NSString stringWithFormat:@"/var/mobile/Library/Preferences/sh.litten.rosepreferences.plist"];
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    NSSet* allKeys = [NSSet setWithArray:[dictionary allKeys]];
    HBPreferences *pfs = [[HBPreferences alloc] initWithIdentifier: @"sh.litten.rosepreferences"];
    
    if (!([allKeys containsObject:@"hasCompletedSetup"]) || [[pfs objectForKey:@"hasCompletedSetup"] isEqual: @(NO)])
        [self presentIntroductionViewController];

    [self setEnableSwitchState];

}

- (void)viewWillDisappear:(BOOL)animated {

    [super viewWillDisappear:animated];

    [self.navigationController.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    CGFloat offsetY = scrollView.contentOffset.y;

    if (offsetY > 200) {
        [UIView animateWithDuration:0.2 animations:^{
            self.iconView.alpha = 1.0;
            self.titleLabel.alpha = 0.0;

        }];

    } else {
        [UIView animateWithDuration:0.2 animations:^{
            self.iconView.alpha = 0.0;
            self.titleLabel.alpha = 1.0;

        }];

    }
    
    if (offsetY > 0) offsetY = 0;
    self.headerImageView.frame = CGRectMake(0, offsetY, self.headerView.frame.size.width, 200 - offsetY);

}

- (void)toggleState {

    self.enableSwitch.enabled = NO;

    HBPreferences *pfs = [[HBPreferences alloc] initWithIdentifier: @"sh.litten.rosepreferences"];
    
    if ([[pfs objectForKey:@"Enabled"] isEqual: @(NO)]) {
        enabled = YES;
        [pfs setBool:enabled forKey: @"Enabled"];
        currentAction = 1;
        [self respring];
        
    } else if ([[pfs objectForKey:@"Enabled"] isEqual: @(YES)]) {
        enabled = NO;
        [pfs setBool:enabled forKey: @"Enabled"];
        currentAction = 3;
        [self respring];

    }

}

- (void)setEnableSwitchState {

    NSString* path = [NSString stringWithFormat:@"/var/mobile/Library/Preferences/sh.litten.rosepreferences.plist"];
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    NSSet* allKeys = [NSSet setWithArray:[dictionary allKeys]];
    
    if (!([allKeys containsObject:@"Enabled"])) {
        [self.enableSwitch setOn:NO animated: YES];

    } else if ([[dictionary objectForKey:@"Enabled"] isEqual: @(YES)]) {
        [self.enableSwitch setOn:YES animated: YES];

    } else if ([[dictionary objectForKey:@"Enabled"] isEqual: @(NO)]) {
        [self.enableSwitch setOn:NO animated: YES];
        
    }

}

- (void)presentIntroductionViewController {

    controller = [[UIViewController alloc] init];
    
    controller.view.backgroundColor = [UIColor whiteColor];

    CAGradientLayer* gradient = [[CAGradientLayer alloc] init];
    [gradient setFrame: [[controller view] bounds]];
    [gradient setStartPoint:CGPointMake(0.0, -0.5)];
    [gradient setEndPoint:CGPointMake(1.0, 1.0)];
    [gradient setColors:@[(id)[[UIColor colorWithRed:0.76 green:0.12 blue:0.34 alpha:1.0] CGColor], (id)[[UIColor whiteColor] CGColor]]];
    [gradient setLocations:@[@0,@1]];

    [[[controller view] layer] insertSublayer:gradient atIndex:0];

    UILabel* headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, controller.view.center.x, controller.view.center.y)];
    CGPoint center = controller.view.center;
    center.y = controller.view.frame.size.height / 3;
    [headerLabel setCenter:center];
    headerLabel.textColor = [UIColor whiteColor];
    headerLabel.text = @"Welcome\nTo Rose";
    headerLabel.numberOfLines = 2;
    headerLabel.clipsToBounds = YES;
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.font = [UIFont fontWithName: @"HelveticaNeue-Bold" size:40];
    headerLabel.adjustsFontSizeToFitWidth = YES;
    headerLabel.minimumScaleFactor = 0.5;

    UILabel* introductionText = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, controller.view.center.x, controller.view.center.y)];
    [introductionText setCenter:controller.view.center];
    introductionText.textColor = [UIColor whiteColor];
    introductionText.text = @"Rose Will Automatically Set Everything Up For You So Just Lean Back";
    introductionText.numberOfLines = 4;
    introductionText.clipsToBounds = YES;
    introductionText.textAlignment = NSTextAlignmentCenter;
    introductionText.font = [UIFont fontWithName: @"HelveticaNeue-Regular" size:27];
    introductionText.adjustsFontSizeToFitWidth = YES;
    introductionText.minimumScaleFactor = 0.5;
    
    continueButton = [[UIButton alloc] initWithFrame:CGRectMake(controller.view.center.x - 125, 80, 250.0f, 50.0f)];
    [continueButton addTarget:self action:@selector(vc2) forControlEvents:UIControlEventTouchUpInside];
    [continueButton setTitle:@"Continue" forState:UIControlStateNormal];
    continueButton.backgroundColor = [UIColor colorWithRed:1.00 green:0.18 blue:0.33 alpha:1.0];
    continueButton.titleLabel.font = [UIFont systemFontOfSize: 17];
    continueButton.layer.cornerRadius = 10;
    [continueButton setTintColor: [UIColor blackColor]];

    loadingIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 50.0f, 50.0f)];
    CGPoint center2 = controller.view.center;
    center2.y = controller.view.frame.size.height / 1.5;
    [loadingIndicator setCenter:center2];
    [loadingIndicator setColor: [UIColor blackColor]];
    loadingIndicator.alpha = 0.0;
     
    [controller.view addSubview: headerLabel];
    [controller.view addSubview: introductionText];
    [controller.view addSubview: continueButton];
    [controller.view addSubview: loadingIndicator];
    
    [self presentViewController:controller animated:YES completion:nil];
    
}

- (void)vc2 {

    continueButton.enabled = NO;
    continueButton.alpha = 0.7;
    loadingIndicator.alpha = 1.0;
    [loadingIndicator startAnimating];
    self.enableSwitch.enabled = NO;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{

        [self dismissViewControllerAnimated:YES completion:nil];

        [loadingIndicator stopAnimating];

        controller2 = [[UIViewController alloc] init];
        controller2.view.backgroundColor = [UIColor whiteColor];

        CAGradientLayer* gradient = [[CAGradientLayer alloc] init];
        [gradient setFrame: [[controller2 view] bounds]];
        [gradient setStartPoint:CGPointMake(0.0, -0.5)];
        [gradient setEndPoint:CGPointMake(1.0, 1.0)];
        [gradient setColors:@[(id)[[UIColor colorWithRed:0.76 green:0.12 blue:0.34 alpha:1.0] CGColor], (id)[[UIColor whiteColor] CGColor]]];
        [gradient setLocations:@[@0,@1]];

        [[[controller2 view] layer] insertSublayer:gradient atIndex:0];

        UILabel* headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, controller2.view.frame.size.height, controller2.view.frame.size.width)];
        CGPoint center = controller2.view.center;
        center.y = controller2.view.frame.size.height / 4.5;
        [headerLabel setCenter:center];
        headerLabel.textColor = [UIColor colorWithRed:0.76 green:0.12 blue:0.34 alpha:1.0];
        headerLabel.text = @"Performing\nActions";
        headerLabel.numberOfLines = 2;
        headerLabel.clipsToBounds = YES;
        headerLabel.textAlignment = NSTextAlignmentCenter;
        headerLabel.font = [UIFont fontWithName: @"HelveticaNeue-Bold" size:40];
        
        UITextView* textView = [[UITextView alloc] initWithFrame: CGRectMake(controller2.view.center.x - 165, controller2.view.center.y - 125, controller2.view.frame.size.height, controller2.view.frame.size.width)];
        textView.text = @"";
        textView.selectable = NO;
        textView.editable = NO;
        textView.textColor = [UIColor whiteColor];
        textView.backgroundColor = [UIColor clearColor];
        [textView setFont: [UIFont fontWithName: @"HelveticaNeue-Medium" size:18]];

        [controller2.view addSubview: headerLabel];
        [controller2.view addSubview: textView];

        gen = [[UIImpactFeedbackGenerator alloc] initWithStyle: UIImpactFeedbackStyleLight];
        [gen impactOccurred];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{

            [gen impactOccurred];

        });

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            textView.text = [NSString stringWithFormat: @"rose$  Enabling Tweak..\nrose$"];
            
            HBPreferences *pfs = [[HBPreferences alloc] initWithIdentifier: @"sh.litten.rosepreferences"];
            enabled = YES;
            [pfs setBool:enabled forKey: @"Enabled"];
            hasCompletedSetup = YES;
            [pfs setBool:hasCompletedSetup forKey:@"hasCompletedSetup"];
            [self.enableSwitch setOn:YES animated: YES];

            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.7 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                textView.text = [NSString stringWithFormat:@"rose$  Enabling Tweak..\nrose$  Gathering Device Information..\nrose$"];

                NSArray* tapticEngineDevices = [NSArray arrayWithObjects: @"iPhone9,1", @"iPhone9,3", @"iPhone9,2", @"iPhone9,4", @"iPhone10,1", @"iPhone10,4", @"iPhone10,2", @"iPhone10,5", @"iPhone10,3", @"iPhone10,6", @"iPhone11,2", @"iPhone11,4", @"iPhone11,6", @"iPhone11,8", @"iPhone12,1"@"iPhone12,3", @"iPhone12,5", nil];
                NSArray* hapticEngineDevices = [NSArray arrayWithObjects: @"iPhone8,1", @"iPhone8,2", nil];
                NSArray* oldEngineDevices = [NSArray arrayWithObjects: @"iPhone6,1", @"iPhone6,2", @"iPhone7,1", @"iPhone7,2", @"iPhone8,4", nil];

                struct utsname systemInfo;
                uname(&systemInfo);
                NSString* deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
            
                for (NSString* stringFromArray in tapticEngineDevices) {
                    if ([deviceModel isEqualToString:stringFromArray]) {
                        isTapticEngineDevice = YES;
                        isHapticEngineDevice = NO;
                        isOldEngineDevice = NO;

                    }

                }

                for (NSString* stringFromArray in hapticEngineDevices) {
                    if ([deviceModel isEqualToString:stringFromArray]) {
                        isTapticEngineDevice = NO;
                        isHapticEngineDevice = YES;
                        isOldEngineDevice = NO;
                        

                    }

                }

                for (NSString* stringFromArray in oldEngineDevices) {
                    if ([deviceModel isEqualToString:stringFromArray]) {
                        isTapticEngineDevice = NO;
                        isHapticEngineDevice = NO;
                        isOldEngineDevice = YES;

                    }

                }

                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                    textView.text = [NSString stringWithFormat:@"rose$  Enabling Tweak..\nrose$  Gathering Device Information..\nrose$  Configuring Engine Settings..\nrose$"];
                
                    HBPreferences *pfs = [[HBPreferences alloc] initWithIdentifier: @"sh.litten.rosepreferences"];

                    if (isTapticEngineDevice) {
                        enableTapticEngineSwitch = YES;
                        enableHapticEngineSwitch = NO;
                        enableLegacyEngineSwitch = NO;
                        [pfs setBool:enableTapticEngineSwitch forKey:@"enableTapticEngine"];
                        [pfs setBool:enableHapticEngineSwitch forKey:@"enableHapticEngine"];
                        [pfs setBool:enableLegacyEngineSwitch forKey:@"enableLegacyEngine"];

                    } else if (isHapticEngineDevice) {
                        enableTapticEngineSwitch = NO;
                        enableHapticEngineSwitch = YES;
                        enableLegacyEngineSwitch = NO;
                        [pfs setBool:enableTapticEngineSwitch forKey:@"enableTapticEngine"];
                        [pfs setBool:enableHapticEngineSwitch forKey:@"enableHapticEngine"];
                        [pfs setBool:enableLegacyEngineSwitch forKey:@"enableLegacyEngine"];

                    } else if (isOldEngineDevice) {
                        enableTapticEngineSwitch = NO;
                        enableHapticEngineSwitch = NO;
                        enableLegacyEngineSwitch = YES;
                        [pfs setBool:enableTapticEngineSwitch forKey:@"enableTapticEngine"];
                        [pfs setBool:enableHapticEngineSwitch forKey:@"enableHapticEngine"];
                        [pfs setBool:enableLegacyEngineSwitch forKey:@"enableLegacyEngine"];

                    }

                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                        textView.text = [NSString stringWithFormat:@"rose$  Enabling Tweak..\nrose$  Gathering Device Information..\nrose$  Configuring Engine Settings..\nrose$  Done, Respringing\nrose$"];
                        
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                            
                            [self respringUtil];

                        });

                    });

                });
            
            });
            
        });
        
        [self presentViewController:controller2 animated:YES completion:nil];

    });
    
}

- (void)resetPrompt {

    UIAlertController *resetAlert = [UIAlertController alertControllerWithTitle:@"Rose"
	message:@"Do You Really Want To Reset Your Preferences?"
	preferredStyle:UIAlertControllerStyleActionSheet];
	
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"Yep" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
			
            [self resetPreferences];

	}];

	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Nope" style:UIAlertActionStyleCancel handler:nil];

	[resetAlert addAction:confirmAction];
	[resetAlert addAction:cancelAction];

	[self presentViewController:resetAlert animated:YES completion:nil];

}

- (void)resetPreferences {

    HBPreferences *pfs = [[HBPreferences alloc] initWithIdentifier: @"sh.litten.rosepreferences"];
    for (NSString *key in [pfs dictionaryRepresentation]) {
        [pfs removeObjectForKey:key];

    }

    currentAction = 2;
    [self.enableSwitch setOn:NO animated: YES];
    [self respring];

}

- (void)respring {
	
    gen = [[UIImpactFeedbackGenerator alloc] initWithStyle: UIImpactFeedbackStyleHeavy];
    [gen impactOccurred];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{

        gen = [[UIImpactFeedbackGenerator alloc] initWithStyle: UIImpactFeedbackStyleMedium];
        [gen impactOccurred];

    });

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{

        gen = [[UIImpactFeedbackGenerator alloc] initWithStyle: UIImpactFeedbackStyleLight];
        [gen impactOccurred];

    });

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.6 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{

        controller2 = [[UIViewController alloc] init];
        controller2.view.backgroundColor = [UIColor whiteColor];

        CAGradientLayer* gradient = [[CAGradientLayer alloc] init];
        [gradient setFrame: [[controller2 view] bounds]];
        [gradient setStartPoint:CGPointMake(0.0, -0.5)];
        [gradient setEndPoint:CGPointMake(1.0, 1.0)];
        [gradient setColors:@[(id)[[UIColor colorWithRed:0.76 green:0.12 blue:0.34 alpha:1.0] CGColor], (id)[[UIColor whiteColor] CGColor]]];
        [gradient setLocations:@[@0,@1]];

        [[[controller2 view] layer] insertSublayer:gradient atIndex:0];

        UILabel* headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, controller2.view.frame.size.height, controller2.view.frame.size.width)];
        CGPoint center = controller2.view.center;
        center.y = controller2.view.frame.size.height / 4.5;
        [headerLabel setCenter:center];
        headerLabel.textColor = [UIColor colorWithRed:0.76 green:0.12 blue:0.34 alpha:1.0];
        headerLabel.text = @"Performing\nActions";
        headerLabel.numberOfLines = 2;
        headerLabel.clipsToBounds = YES;
        headerLabel.textAlignment = NSTextAlignmentCenter;
        headerLabel.font = [UIFont fontWithName: @"HelveticaNeue-Bold" size:40];
        
        UITextView* textView = [[UITextView alloc] initWithFrame: CGRectMake(controller2.view.center.x - 140, controller2.view.center.y - 125, controller2.view.frame.size.height, controller2.view.frame.size.width)];
        textView.text = @"";
        textView.selectable = NO;
        textView.editable = NO;
        textView.textColor = [UIColor whiteColor];
        textView.backgroundColor = [UIColor clearColor];
        [textView setFont: [UIFont fontWithName: @"HelveticaNeue-Medium" size:18]];

        [controller2.view addSubview: headerLabel];
        [controller2.view addSubview: textView];

        [self presentViewController:controller2 animated:YES completion:nil];

        if (currentAction == 0)
            logText = @"- Respring Requested";
        else if (enabled && currentAction == 1)
            logText = @"Enabled";
        else if (currentAction == 2)
            logText = @"Preferences Reset";
        else if (!enabled && currentAction == 3)
            logText = @"Disabled";

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            textView.text = [NSString stringWithFormat: @"rose$  Tweak %@\nrose$", logText];

            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                textView.text = [NSString stringWithFormat:@"rose$  Tweak %@\nrose$  Applying Changes\nrose$", logText];

                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                    textView.text = [NSString stringWithFormat:@"rose$  Tweak %@\nrose$  Applying Changes\nrose$  Respringing..\nrose$", logText];

                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.6 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                        [self respringUtil];
            
                    });
            
                });
            
            });
            
        });

    });

}

- (void)respringWithButton {

    currentAction = 0;
    [self respring];

}

- (void)respringUtil {

    pid_t pid;
    const char *args[] = {"killall", "backboardd", NULL};
    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char *const *)args, NULL);

}

@end