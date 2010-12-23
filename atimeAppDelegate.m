//
//  atimeAppDelegate.m
//  atime
//
//  Created by Joachim Bengtsson on 2010-03-14.
//  Copyright 2010 Third Cog Software. All rights reserved.
//

#import "atimeAppDelegate.h"
#import "NSDate+InternetTime.h"

#define $sf(...) [NSString stringWithFormat:__VA_ARGS__]

@implementation atimeAppDelegate

@synthesize window;
@synthesize label;

- (void)updateTime {
	double internetTime = [NSDate internetTimeOfDay];
	NSUInteger beats = internetTime;
	NSUInteger centiBeats = (internetTime-beats)*100;
	
	NSAttributedString *atString = [[[NSAttributedString alloc] initWithString:@"@" attributes:beatAttributeDictionary] autorelease];
	
	NSAttributedString *beatString = [[[NSAttributedString alloc] initWithString:$sf(@"%3d", beats) attributes:beatAttributeDictionary] autorelease];
	
	NSAttributedString *centiBeatString = [[[NSAttributedString alloc] initWithString:$sf(@"%02d", centiBeats) attributes:centiBeatAttributeDictionary] autorelease];
    
    NSMutableAttributedString *displayString = [[NSMutableAttributedString new] autorelease];
	
	[displayString appendAttributedString:atString];
	[displayString appendAttributedString:beatString];
	[displayString appendAttributedString:centiBeatString];
	[label setAttributedStringValue:displayString];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    beatAttributeDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:[NSFont boldSystemFontOfSize:56], NSFontAttributeName, nil];
    centiBeatAttributeDictionary = [[NSDictionary alloc ] initWithObjectsAndKeys:[NSFont boldSystemFontOfSize:56], NSFontAttributeName, [NSColor colorWithCalibratedWhite:.4 alpha:.7], NSForegroundColorAttributeName, nil];
    
    updater = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
}

@end
