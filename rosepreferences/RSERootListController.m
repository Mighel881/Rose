#include "RSERootListController.h"

@implementation RSERootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

-(void)openGithub {

	[[UIApplication sharedApplication]
	openURL: [NSURL URLWithString:@"https://github.com/ShyMemoriees"]
	options:@{}
	completionHandler:nil];

}

-(void)openTwitter {

	[[UIApplication sharedApplication]
	openURL: [NSURL URLWithString:@"https://twitter.com/ShyMemoriees"]
	options:@{}
	completionHandler:nil];

}

@end
