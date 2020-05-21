#include "RSERootListController.h"
#include <Cephei/HBRespringController.h>
#import "../Tweak/Rose.h"
#import <sys/utsname.h>
#import <spawn.h>
#import <Rose/librose.h>

roseCall* haptics;

BOOL enabled = NO;
BOOL enableTapticEngineSwitch;
BOOL enableHapticEngineSwitch;
BOOL enableLegacyEngineSwitch;

NSString* tapticLevel;
NSString* hapticLevel;
NSString* legacyLevel;
NSString* customlegacyDurationLevel;
NSString* customlegacyStrengthLevel;

BOOL showBlurViewSwitch = YES;

int currentAction = 0;
BOOL hasCompletedSetup = NO;
BOOL isTapticEngineDevice;
BOOL isHapticEngineDevice;
BOOL isOldEngineDevice;

UIView* darkBackground;
UIVisualEffectView *blurView;
UIImageView* roseGlyphView;
UILabel* blurTitle;
UILabel* blurTitle2;
CGPoint centerGlyph;
CGPoint centerTitle;
CGPoint centerTitle2;

UITapGestureRecognizer* tap;

UIViewController* controller; // Introduction
UIViewController* controller2; // Device Detection
UIViewController* controller3; // Quick Tips
UIViewController* controller4; // Help Controller
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
        self.titleLabel.text = @"6.0.2";
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

    NSString* path = [NSString stringWithFormat:@"/var/mobile/Library/Preferences/sh.litten.rosepreferences.plist"];
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    NSSet* allKeys = [NSSet setWithArray:[dictionary allKeys]];
    HBPreferences *pfs = [[HBPreferences alloc] initWithIdentifier: @"sh.litten.rosepreferences"];
    
    if (!([allKeys containsObject:@"hasCompletedSetup"]) || [[pfs objectForKey:@"hasCompletedSetup"] isEqual: @(NO)])
        self.enableSwitch.enabled = NO;
    else
        self.enableSwitch.enabled = YES;

}

- (void)viewDidAppear:(BOOL)animated {

    [super viewDidAppear:animated];

    [self.navigationController.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];

    NSString* path = [NSString stringWithFormat:@"/var/mobile/Library/Preferences/sh.litten.rosepreferences.plist"];
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    NSSet* allKeys = [NSSet setWithArray:[dictionary allKeys]];
    HBPreferences *pfs = [[HBPreferences alloc] initWithIdentifier: @"sh.litten.rosepreferences"];
    
    if (!([allKeys containsObject:@"hasCompletedSetup"]) || [[pfs objectForKey:@"hasCompletedSetup"] isEqual: @(NO)]) {
        [self showIntroduction];
        self.enableSwitch.enabled = NO;

    }

    showBlurViewSwitch = [[pfs objectForKey:@"showBlurView"] boolValue];
    hasCompletedSetup = [[pfs objectForKey:@"hasCompletedSetup"] boolValue];

    if (showBlurViewSwitch && hasCompletedSetup) {
        UIBlurEffect *blurEffectA = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
        UIVisualEffectView *blurViewA = [[UIVisualEffectView alloc] initWithEffect:blurEffectA];
        blurViewA.frame = CGRectMake(self.view.center.x, self.view.center.y, 260, 300);
        CGPoint centerBlurA = self.view.center;
        centerBlurA.y = self.view.frame.size.height / 2.5;
        [blurViewA setCenter:centerBlurA];
        blurViewA.clipsToBounds = YES;
        blurViewA.layer.cornerRadius = 15;
        blurViewA.hidden = NO;
        blurViewA.alpha = 0;
        
        UIImage* roseGlyphA = [UIImage imageNamed:@"/Library/Rose/roseGlyph.png"];
        UIImageView* roseGlyphViewA = [[UIImageView alloc] initWithImage:roseGlyphA];
        roseGlyphViewA.contentMode = UIViewContentModeScaleAspectFit;
        roseGlyphViewA.frame = CGRectMake(self.view.center.x, self.view.center.y, 175, 175);
        CGPoint centerGlyphA = self.view.center;
        centerGlyphA.y = self.view.frame.size.height / 2.75;
        [roseGlyphViewA setCenter:centerGlyphA];
        roseGlyphViewA.hidden = NO;
        roseGlyphViewA.alpha = 0;

        UILabel* blurTitleA = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.center.x, self.view.center.y)];
        CGPoint centerTitleA = self.view.center;
        centerTitleA.y = self.view.frame.size.height / 1.85;
        [blurTitleA setCenter:centerTitleA];
        blurTitleA.textColor = [UIColor colorWithRed:120 green:120 blue:120 alpha:1];
        blurTitleA.text = @"Rose";
        blurTitleA.numberOfLines = 2;
        blurTitleA.clipsToBounds = YES;
        blurTitleA.textAlignment = NSTextAlignmentCenter;
        blurTitleA.font = [UIFont fontWithName: @"HelveticaNeue-Medium" size:40];
        blurTitleA.adjustsFontSizeToFitWidth = YES;
        blurTitleA.minimumScaleFactor = 0.5;
        blurTitleA.hidden = NO;
        blurTitleA.alpha = 0;

        [[self view] addSubview:blurViewA];
        [[self view] addSubview:roseGlyphViewA];
        [[self view] addSubview:blurTitleA];

        [UIView animateWithDuration:.1 delay:.05 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            blurViewA.alpha = 1;
            
        } completion:nil];

        [UIView animateWithDuration:.1 delay:.125 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            roseGlyphViewA.alpha = 1;
            blurTitleA.alpha = 1;
            
        } completion:nil];

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, .8 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{

            [UIView animateWithDuration:.1 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
                blurTitleA.alpha = 0;
                roseGlyphViewA.alpha = 0;
                blurViewA.alpha = 0;
            
            } completion:nil];

            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{

                [blurTitleA removeFromSuperview];
                [roseGlyphViewA removeFromSuperview];
                [blurViewA removeFromSuperview];

            });

        });

    }

    [self setEnableSwitchState];

}

- (void)showIntroduction {

    darkBackground = [[UIView alloc] initWithFrame:self.view.bounds];
    darkBackground.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.95];
    darkBackground.hidden = NO;
    darkBackground.alpha = 0;
        
    [[self view] addSubview:darkBackground];
        
    UIBlurEffect* blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
    blurView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    blurView.frame = CGRectMake(self.view.center.x, self.view.center.y, 260, 300);
    CGPoint centerBlur = self.view.center;
    centerBlur.y = self.view.frame.size.height / 2.5;
    [blurView setCenter:centerBlur];
    blurView.clipsToBounds = YES;
    blurView.layer.cornerRadius = 15;
    blurView.hidden = NO;
    blurView.alpha = 0;
        
    UIImage* roseGlyph = [UIImage imageNamed:@"/Library/Rose/roseGlyph.png"];
    roseGlyphView = [[UIImageView alloc] initWithImage:roseGlyph];
    roseGlyphView.contentMode = UIViewContentModeScaleAspectFit;
    roseGlyphView.frame = CGRectMake(self.view.center.x, self.view.center.y, 175, 175);
    centerGlyph = self.view.center;
    centerGlyph.y = self.view.frame.size.height / 3.5;
    [roseGlyphView setCenter:centerGlyph];
    roseGlyphView.hidden = NO;
    roseGlyphView.alpha = 0;

    blurTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.center.x, self.view.center.y)];
    centerTitle = self.view.center;
    centerTitle.y = self.view.frame.size.height / 1.9;
    [blurTitle setCenter:centerTitle];
    blurTitle.textColor = [UIColor colorWithRed:120 green:120 blue:120 alpha:1];
    blurTitle.text = @"Rose";
    blurTitle.numberOfLines = 1;
    blurTitle.clipsToBounds = YES;
    blurTitle.textAlignment = NSTextAlignmentCenter;
    blurTitle.font = [UIFont fontWithName: @"HelveticaNeue-Medium" size:40];
    blurTitle.adjustsFontSizeToFitWidth = YES;
    blurTitle.minimumScaleFactor = 0.5;
    blurTitle.hidden = NO;
    blurTitle.alpha = 0;
        
    blurTitle2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.center.x, self.view.center.y)];
    centerTitle2 = self.view.center;
    centerTitle2.y = self.view.frame.size.height / 1.75;
    [blurTitle2 setCenter:centerTitle2];
    blurTitle2.textColor = [UIColor colorWithRed:120 green:120 blue:120 alpha:1];
    blurTitle2.text = @"Tap To Begin";
    blurTitle2.numberOfLines = 1;
    blurTitle2.clipsToBounds = YES;
    blurTitle2.textAlignment = NSTextAlignmentCenter;
    blurTitle2.font = [UIFont fontWithName: @"HelveticaNeue-Regular" size:24];
    blurTitle2.adjustsFontSizeToFitWidth = YES;
    blurTitle2.minimumScaleFactor = 0.5;
    blurTitle2.hidden = NO;
    blurTitle2.alpha = 0;

    [[self view] addSubview:blurView];
    [[self view] addSubview:roseGlyphView];
    [[self view] addSubview:blurTitle];
    [[self view] addSubview:blurTitle2];
        
    [UIView animateWithDuration:.5 delay:.3 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
        darkBackground.alpha = .9;
            
    } completion:nil];
        
    [UIView animateWithDuration:.3 delay:.7 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
        blurView.alpha = 1;
            
    } completion:nil];
        
    centerGlyph.y = self.view.frame.size.height / 3;
        
    [UIView animateWithDuration:.5 delay:.85 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
        roseGlyphView.alpha = 1;
        [roseGlyphView setCenter:centerGlyph];
            
    } completion:nil];
        
    centerTitle.y = self.view.frame.size.height / 1.95;
        
    [UIView animateWithDuration:.5 delay:.95 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
        blurTitle.alpha = 1;
        [blurTitle setCenter:centerTitle];
            
    } completion:nil];
        
    centerTitle2.y = self.view.frame.size.height / 1.775;
        
    [UIView animateWithDuration:.5 delay:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
        blurTitle2.alpha = 1;
        [blurTitle2 setCenter:centerTitle2];
            
    } completion:nil];
        
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(beginSetup)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
        
    [[self view] addGestureRecognizer:tap];

}

- (void)beginSetup {
    
    [[self view] removeGestureRecognizer:tap];
    
    centerTitle2.y = self.view.frame.size.height / 1.725;
    
    [UIView animateWithDuration:.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        blurTitle2.alpha = 0;
        [blurTitle2 setCenter:centerTitle2];
        
    } completion:nil];
    
    centerTitle.y = self.view.frame.size.height / 1.85;
    
    [UIView animateWithDuration:.25 delay:.15 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        blurTitle.alpha = 0;
        [blurTitle setCenter:centerTitle];
        
    } completion:nil];
    
    centerGlyph.y = self.view.frame.size.height / 2.2;
    
    [UIView animateWithDuration:.35 delay:.25 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        roseGlyphView.alpha = 1;
        [roseGlyphView setCenter:centerGlyph];
        roseGlyphView.frame = CGRectMake(self.view.center.x -50, self.view.center.y -230, 110, 110);
        
    } completion:nil];
    
    [UIView animateWithDuration:.6 delay:.5 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        blurView.alpha = 0;
        
    } completion:nil];
    
    [UIView animateWithDuration:.25 delay:.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        roseGlyphView.alpha = 0;
        roseGlyphView.frame = CGRectMake(self.view.center.x -800, self.view.center.y -1150, 1500, 1500);
        darkBackground.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:1];
        darkBackground.alpha = 0;
        
    } completion:nil];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, .65 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{

        [self presentIntroductionViewController];

    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.1* NSEC_PER_SEC), dispatch_get_main_queue(), ^{

        controller.view.backgroundColor = [UIColor blackColor];

        [UIView animateWithDuration:.2 delay:.4 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
            darkBackground.alpha = 0;
            controller.view.backgroundColor = [UIColor whiteColor];
        
        } completion:nil];
        
    });

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
    
    controller.view.backgroundColor = [UIColor blackColor];

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
    introductionText.text = @"Rose Will Automatically Set Your Engine Settings, So You Won't Have To";
    introductionText.numberOfLines = 4;
    introductionText.clipsToBounds = YES;
    introductionText.textAlignment = NSTextAlignmentCenter;
    introductionText.font = [UIFont fontWithName: @"HelveticaNeue-Regular" size:27];
    introductionText.adjustsFontSizeToFitWidth = YES;
    introductionText.minimumScaleFactor = 0.5;
    
    continueButton = [[UIButton alloc] initWithFrame:CGRectMake(controller.view.center.x - 125, 80, 250.0f, 50.0f)];
    [continueButton addTarget:self action:@selector(showController2) forControlEvents:UIControlEventTouchUpInside];
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
     
    [[controller view] addSubview:headerLabel];
    [[controller view] addSubview:introductionText];
    [[controller view] addSubview:continueButton];
    [[controller view] addSubview:loadingIndicator];
    
    [self presentViewController:controller animated:YES completion:nil];
    
}

- (void)showController2 {

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
        [gradient setColors:@[(id)[[UIColor whiteColor] CGColor], (id)[[UIColor colorWithRed:0.72 green:0.56 blue:0.78 alpha:1.0] CGColor]]];
        [gradient setLocations:@[@0,@1]];

        [[[controller2 view] layer] insertSublayer:gradient atIndex:0];

        UILabel* headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, controller2.view.frame.size.height, controller2.view.frame.size.width)];
        CGPoint center = controller2.view.center;
        center.y = controller2.view.frame.size.height / 4.5;
        [headerLabel setCenter:center];
        headerLabel.textColor = [UIColor colorWithRed:0.59 green:0.47 blue:0.73 alpha:1.0];
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

        UIButton* continueBtn = [[UIButton alloc] initWithFrame:CGRectMake(controller.view.center.x - 125, 550, 250.0f, 50.0f)];
        continueBtn.backgroundColor = [UIColor colorWithRed:0.79 green:0.73 blue:0.87 alpha:1.0];
        continueBtn.titleLabel.font = [UIFont systemFontOfSize: 17];
        continueBtn.layer.cornerRadius = 10;
        [continueBtn setTintColor: [UIColor blackColor]];
        continueBtn.hidden = NO;
        continueBtn.alpha = 0;

        [[controller2 view] addSubview:headerLabel];
        [[controller2 view] addSubview:textView];
        [[controller2 view] addSubview:continueBtn];

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

                NSArray* tapticEngineDevices = [NSArray arrayWithObjects: @"iPhone9,1", @"iPhone9,3", @"iPhone9,2", @"iPhone9,4", @"iPhone10,1", @"iPhone10,4", @"iPhone10,2", @"iPhone10,5", @"iPhone10,3", @"iPhone10,6", @"iPhone11,2", @"iPhone11,4", @"iPhone11,6", @"iPhone11,8", @"iPhone12,1", @"iPhone12,3", @"iPhone12,5", @"iPhone12,8", nil];
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

                    } else if (!isTapticEngineDevice && !isHapticEngineDevice && !isOldEngineDevice) {
                        enableTapticEngineSwitch = NO;
                        enableHapticEngineSwitch = NO;
                        enableLegacyEngineSwitch = NO;
                        [pfs setBool:enableTapticEngineSwitch forKey:@"enableTapticEngine"];
                        [pfs setBool:enableHapticEngineSwitch forKey:@"enableHapticEngine"];
                        [pfs setBool:enableLegacyEngineSwitch forKey:@"enableLegacyEngine"];

                    }

                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{

                        if (!isTapticEngineDevice && !isHapticEngineDevice && !isOldEngineDevice) {
                            textView.text = [NSString stringWithFormat:@"rose$  Enabling Tweak..\nrose$  Gathering Device Information..\nrose$  Failure, Device Unidentified\nrose$"];
                            [continueBtn addTarget:self action:@selector(showHelpController) forControlEvents:UIControlEventTouchUpInside];
                            [continueBtn setTitle:@"Get Help" forState:UIControlStateNormal];
                            controller4 = [[UIViewController alloc] init];
                            controller4.view.backgroundColor = [UIColor whiteColor];

                        } else {
                            currentAction = 4;
                            [continueBtn addTarget:self action:@selector(showQuickTipsController) forControlEvents:UIControlEventTouchUpInside];
                            [continueBtn setTitle:@"Continue" forState:UIControlStateNormal];
                            textView.text = [NSString stringWithFormat:@"rose$  Enabling Tweak..\nrose$  Gathering Device Information..\nrose$  Configuring Engine Settings..\nrose$  Success\nrose$"];

                        }

                        [UIView animateWithDuration:.4 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{

                            continueBtn.alpha = 1;
        
                        } completion:nil];

                    });

                });
            
            });
            
        });

        [self presentViewController:controller2 animated:YES completion:nil];

        controller3 = [[UIViewController alloc] init];
        controller3.view.backgroundColor = [UIColor whiteColor];

    });
    
}

- (void)showQuickTipsController {

    if (!controller.isBeingPresented) {
        controller3 = [[UIViewController alloc] init];
        controller3.view.backgroundColor = [UIColor whiteColor];

    }

    CAGradientLayer* gradient = [[CAGradientLayer alloc] init];
    [gradient setFrame: [[controller3 view] bounds]];
    [gradient setStartPoint:CGPointMake(0.0, -0.5)];
    [gradient setEndPoint:CGPointMake(1.0, 1.0)];
    [gradient setColors:@[(id)[[UIColor colorWithRed:0.53 green:0.64 blue:0.83 alpha:1.0] CGColor], (id)[[UIColor whiteColor] CGColor]]];
    [gradient setLocations:@[@0,@1]];

    [[[controller3 view] layer] insertSublayer:gradient atIndex:0];

    UILabel* headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, controller3.view.center.x, controller3.view.center.y)];
    CGPoint center = controller3.view.center;
    center.y = controller3.view.frame.size.height / 3.5;
    [headerLabel setCenter:center];
    headerLabel.textColor = [UIColor whiteColor];
    headerLabel.text = @"Quick Tips";
    headerLabel.numberOfLines = 2;
    headerLabel.clipsToBounds = YES;
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.font = [UIFont fontWithName: @"HelveticaNeue-Bold" size:40];
    headerLabel.adjustsFontSizeToFitWidth = YES;
    headerLabel.minimumScaleFactor = 0.5;

    UILabel* tips = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, controller3.view.center.x + 50, controller3.view.center.y)];
    [tips setCenter:controller3.view.center];
    tips.textColor = [UIColor whiteColor];
    tips.text = @"Shake Your Device In The Preferences Main Page To Test Haptics\n\nYou Can Customize The Preferences In The Preferences Sub Menu";
    tips.numberOfLines = 10;
    tips.clipsToBounds = YES;
    tips.textAlignment = NSTextAlignmentCenter;
    tips.font = [UIFont fontWithName: @"HelveticaNeue-Regular" size:35];
    tips.adjustsFontSizeToFitWidth = YES;
    tips.minimumScaleFactor = 0.5;

    UIButton* continueBtn = [[UIButton alloc] initWithFrame:CGRectMake(controller3.view.center.x - 125, 550, 250.0f, 50.0f)];
    [continueBtn addTarget:self action:@selector(respring) forControlEvents:UIControlEventTouchUpInside];
    [continueBtn setTitle:@"Finish Up" forState:UIControlStateNormal];
    continueBtn.backgroundColor = [UIColor colorWithRed:0.79 green:0.73 blue:0.87 alpha:1.0];
    continueBtn.titleLabel.font = [UIFont systemFontOfSize: 17];
    continueBtn.layer.cornerRadius = 10;
    [continueBtn setTintColor: [UIColor blackColor]];
    continueBtn.hidden = NO;
    continueBtn.alpha = 1;

    [[controller3 view] addSubview:headerLabel];
    [[controller3 view] addSubview:tips];
    [[controller3 view] addSubview:continueBtn];

    [controller2 presentViewController:controller3 animated:YES completion:nil];
    if (!controller3.isBeingPresented) {
        [self presentViewController:controller3 animated:YES completion:nil];
        continueBtn.hidden = YES;

    }
    
}

- (void)showHelpController {

    CAGradientLayer* gradient = [[CAGradientLayer alloc] init];
    [gradient setFrame: [[controller4 view] bounds]];
    [gradient setStartPoint:CGPointMake(0.0, -0.5)];
    [gradient setEndPoint:CGPointMake(1.0, 1.0)];
    [gradient setColors:@[(id)[[UIColor colorWithRed:0.53 green:0.64 blue:0.83 alpha:1.0] CGColor], (id)[[UIColor whiteColor] CGColor]]];
    [gradient setLocations:@[@0,@1]];

    [[[controller4 view] layer] insertSublayer:gradient atIndex:0];

    UILabel* headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, controller4.view.center.x, controller4.view.center.y)];
    CGPoint center = controller4.view.center;
    center.y = controller4.view.frame.size.height / 3.5;
    [headerLabel setCenter:center];
    headerLabel.textColor = [UIColor whiteColor];
    headerLabel.text = @"Help";
    headerLabel.numberOfLines = 2;
    headerLabel.clipsToBounds = YES;
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.font = [UIFont fontWithName: @"HelveticaNeue-Bold" size:40];
    headerLabel.adjustsFontSizeToFitWidth = YES;
    headerLabel.minimumScaleFactor = 0.5;

    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, controller4.view.center.x + 50, controller4.view.center.y)];
    CGPoint center2 = controller4.view.center;
    center2.y = controller4.view.frame.size.height / 2.2;
    [label setCenter:center2];
    label.textColor = [UIColor whiteColor];
    label.text = @"Rose Couldn't Detect What Device You Use, Means You'll Have To Set Your Engine Settings Up Yourself\n\nYou Can Send Me An Email With Your Device And iOS Though To Help Me Fix It";
    label.numberOfLines = 10;
    label.clipsToBounds = YES;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont fontWithName: @"HelveticaNeue-Regular" size:32];
    label.adjustsFontSizeToFitWidth = YES;
    label.minimumScaleFactor = 0.5;

    UIButton* continueBtn = [[UIButton alloc] initWithFrame:CGRectMake(controller4.view.center.x - 125, 550, 250.0f, 50.0f)];
    [continueBtn addTarget:self action:@selector(sendMail) forControlEvents:UIControlEventTouchUpInside];
    [continueBtn setTitle:@"Send Mail" forState:UIControlStateNormal];
    continueBtn.backgroundColor = [UIColor colorWithRed:0.79 green:0.73 blue:0.87 alpha:1.0];
    continueBtn.titleLabel.font = [UIFont systemFontOfSize: 17];
    continueBtn.layer.cornerRadius = 10;
    [continueBtn setTintColor: [UIColor blackColor]];
    continueBtn.hidden = NO;
    continueBtn.alpha = 1;

    UIButton* continueBtn2 = [[UIButton alloc] initWithFrame:CGRectMake(controller4.view.center.x - 125, 610, 250.0f, 50.0f)];
    [continueBtn2 addTarget:self action:@selector(respring) forControlEvents:UIControlEventTouchUpInside];
    [continueBtn2 setTitle:@"Respring" forState:UIControlStateNormal];
    continueBtn2.backgroundColor = [UIColor colorWithRed:0.79 green:0.73 blue:0.87 alpha:1.0];
    continueBtn2.titleLabel.font = [UIFont systemFontOfSize: 17];
    continueBtn2.layer.cornerRadius = 10;
    [continueBtn2 setTintColor: [UIColor blackColor]];
    continueBtn2.hidden = NO;
    continueBtn2.alpha = 1;

    [[controller4 view] addSubview:headerLabel];
    [[controller4 view] addSubview:label];
    [[controller4 view] addSubview:continueBtn];
    [[controller4 view] addSubview:continueBtn2];

    currentAction = 4;

    [controller2 presentViewController:controller4 animated:YES completion:nil];

}

- (void)sendMail {

    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://litten.love/report.html"] options:@{} completionHandler:nil];

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

    [self dismissViewControllerAnimated:YES completion:nil];
	
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
            logText = @"- Enabled";
        else if (currentAction == 2)
            logText = @"- Preferences Reset";
        else if (!enabled && currentAction == 3)
            logText = @"- Disabled";
        else if (currentAction == 4)
            logText = @"- Finishing Setup";

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

    [HBRespringController respringAndReturnTo:[NSURL URLWithString:@"prefs:root=Rose"]];

    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char *const *)args, NULL);

}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    
    if (event.type == UIEventSubtypeMotionShake) {

        HBPreferences *pfs = [[HBPreferences alloc] initWithIdentifier: @"sh.litten.rosepreferences"];

        enableTapticEngineSwitch = [[pfs objectForKey:@"enableTapticEngine"] boolValue];
        enableHapticEngineSwitch = [[pfs objectForKey:@"enableHapticEngine"] boolValue];
        enableLegacyEngineSwitch = [[pfs objectForKey:@"enableLegacyEngine"] boolValue];

        haptics = [[roseCall alloc] init];
        int tapticLVL = [[pfs objectForKey:@"TapticStrength"] intValue];
		int hapticLVL = [[pfs objectForKey:@"HapticStrength"] intValue];
		int selectedLegacyMode = [[pfs objectForKey:@"LegacyStrength"] intValue];
		double customLegacyDuration = [[pfs objectForKey:@"customLegacyDuration"] doubleValue];
		double customLegacyStrength = [[pfs objectForKey:@"customLegacyStrength"] doubleValue];

        if (enableTapticEngineSwitch || enableHapticEngineSwitch) {
            [haptics prepareForHaptic:enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];

            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                
                [haptics prepareForHaptic:enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];

                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                
                    [haptics prepareForHaptic:enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];

                });

            });

        } else if (enableLegacyEngineSwitch && selectedLegacyMode == 0) {
            [haptics prepareLegacyFeedback:0.025 intensivity:0.05 count:1];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                
                [haptics prepareLegacyFeedback:0.025 intensivity:0.05 count:1];

                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                
                    [haptics prepareLegacyFeedback:0.025 intensivity:0.05 count:1];

                });

            });

        } else if (enableLegacyEngineSwitch && selectedLegacyMode != 0) {
            [haptics prepareLegacyFeedback:customLegacyDuration intensivity:customLegacyStrength count:1];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                
                    [haptics prepareLegacyFeedback:customLegacyDuration intensivity:customLegacyStrength count:1];

                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                
                        [haptics prepareLegacyFeedback:customLegacyDuration intensivity:customLegacyStrength count:1];

                    });

                });

        }

    }

}

@end