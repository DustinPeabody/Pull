//
//  AnglePathing.m
//  pull
//
//  Created by Kyle Whittington on 4/29/13.
//
//

#import "AnglePathing.h"

@implementation AnglePathing

@synthesize starting_point = _starting_point;
@synthesize radians = _radians;
@synthesize distance = _distance;
@synthesize velocity = _velocity;

- (id) init {
  self = [super init];
  
  if (self) {
    //default variable values
    _starting_point = ccp(0,0);
    _radians = 0;
    _distance = 0;
    _velocity = 0;
  }
  
  return self;
}

/*
 * Will initialize this AnglePathing AI with the given
 * start point, angle, and velocity.
 *
 * NOTE: use this over default init.
 */
- (id) initWithStartingPoint: (CGPoint) start_point
                       angle: (int) angle
                 andVelocity: (double) velocity {
  self = [self init];
  
  if (self) {
    _starting_point = start_point;
    _velocity = velocity;
    _radians = asin(angle);
  }
  
  return self;
}

@end
