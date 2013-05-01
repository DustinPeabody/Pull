//
//  PathingAI.m
//  pull
//
//  Created by Kyle Whittington on 4/29/13.
//
//

#import "PathingAI.h"

@implementation PathingAI

@synthesize current_time = _current_time;

- (id) init {
    self = [super init];
    
    if (self) {
        //don't alloc/init the starting time until we start moving
        _current_time = 0;
    }
    
    return self;
}


@end
