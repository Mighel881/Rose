#import "RSERootListController.h"

@implementation RSEAppearanceSettings

-(UIColor *)tintColor {

    return [UIColor colorWithRed:0.74 green:0.79 blue:0.86 alpha:1.00];

}

-(UIColor *)statusBarTintColor {

    return [UIColor whiteColor];

}

-(UIColor *)navigationBarTitleColor {

    return [UIColor whiteColor];

}

-(UIColor *)navigationBarTintColor {

    return [UIColor whiteColor];

}

-(UIColor *)tableViewCellSeparatorColor {

    return [UIColor colorWithWhite:0 alpha:0];

}

-(UIColor *)navigationBarBackgroundColor {

    return [UIColor colorWithRed:0.56 green:0.66 blue:0.79 alpha:1.00];

}

-(BOOL)translucentNavigationBar {
    
    return NO;

}

@end