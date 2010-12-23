//
//  atimeAppDelegate.m
//  atime
//
//  Created by Joachim Bengtsson on 2010-03-14.
//  Copyright 2010 Third Cog Software. All rights reserved.
//

#import "atimeAppDelegate.h"
#import "NSDate+InternetTime.h"

@implementation atimeAppDelegate

@synthesize window;
@synthesize label;

- (void)updateTime {
    double internetTime = [NSDate internetTimeOfDay];
    NSUInteger iTimeInCentiBeats = (NSUInteger)(internetTime * 100);
    
    NSString *iTimeAsString = [[NSString alloc] initWithFormat:@"@%lu", (unsigned long)iTimeInCentiBeats];
    NSString *centiBeats = [iTimeAsString substringFromIndex:[iTimeAsString length] - 2];
    NSString *beats = [iTimeAsString substringToIndex:[iTimeAsString length] - 2];
    
    [iTimeAsString release];
	
	NSAttributedString *beatString = [[NSAttributedString alloc] initWithString:beats attributes:beatAttributeDictionary];
	
	NSAttributedString *centiBeatString = [[NSAttributedString alloc] initWithString:centiBeats attributes:centiBeatAttributeDictionary];
    
    NSMutableAttributedString *displayString = [[NSMutableAttributedString alloc] initWithAttributedString:beatString];
	
	[displayString appendAttributedString:centiBeatString];
	[label setAttributedStringValue:displayString];
    
    [beatString release];
    [centiBeatString release];
    [displayString release];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    beatAttributeDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:[NSFont boldSystemFontOfSize:56], NSFontAttributeName, nil];
    centiBeatAttributeDictionary = [[NSDictionary alloc ] initWithObjectsAndKeys:[NSFont boldSystemFontOfSize:56], NSFontAttributeName, [NSColor colorWithCalibratedWhite:.4 alpha:.7], NSForegroundColorAttributeName, nil];
    
    updater = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
}

@end
