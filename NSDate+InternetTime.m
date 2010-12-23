//
//  NSDate+InternetTime.m
//  atime
//
//  Created by Joachim Bengtsson on 2010-03-14.
//  Copyright 2010 Third Cog Software. All rights reserved.
//

#import "NSDate+InternetTime.h"


@implementation NSDate (TCInternetTime)

+ (double)internetTimeOfDay {
    // Return the number of "beats" elapsed in GMT+1.
    // There are 86.4 seconds to a "beat".
	return fmod([NSDate timeIntervalSinceReferenceDate]+3600, 86400)/86.4;
}

@end
