//
//  atimeAppDelegate.h
//  atime
//
//  Created by Joachim Bengtsson on 2010-03-14.
//  Copyright 2010 Third Cog Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface atimeAppDelegate : NSObject {
@private
    NSTimer *updater;
    NSDictionary *beatAttributeDictionary;
    NSDictionary *centiBeatAttributeDictionary;
    
    NSWindow *window;
    NSTextField *label;
    
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTextField *label;

@end
