//
//  PathingAI.m
//  pull
//
//  Created by Kyle Whittington on 4/29/13.
//
//

#import "PathingAI.h"

@implementation PathingAI

@synthesize starting_time = _starting_time;
@synthesize current_time = _current_time;

- (id) init {
    self = [super init];
    
    if (self) {
        //don't alloc/init the starting time until we start moving
        _starting_time = [[NSDate date] timeIntervalSince1970];
        _current_time = 0;
    }
    
    return self;
}

/*
 * Will return the current position of this AI path based on the given time.
 *
 * @require given.current_time != nil
 * @ensure  correct position is returned
 */
- (CGPoint) position {
  //get the current time
  double current_t = [[NSDate date] timeIntervalSince1970];
  //compute elapsed time, in seconds
  double elapsed_seconds = (current_t  - _starting_time);
  
  CGPoint point = [self computePosition:[self computeDistance:elapsed_seconds]];
  
  return point;
}

@end
