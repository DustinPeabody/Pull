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

- (CGPoint) position {
  return [super position];
}

- (double) computeDistance:(double)elapsed_seconds {
  // compute distance = time * velocity
  _distance = elapsed_seconds * _velocity;
  
  // return radian global as our T value
  return _radians;
}

- (CGPoint) computePosition:(double)distance {
  // use the circle parametization equation -> constant t value:
  // x(t) = x0 + rcos(t), 0 <= t <= 2pi
  // y(t) = y0 + rsin(t), 0 <= t <= 2pi
  
  double current_x = round(_starting_point.x + (_radians * cos(distance)));
  double current_y = round(_starting_point.y + (_radians * sin(distance)));
  
  return ccp(current_x, current_y);
}

@end
