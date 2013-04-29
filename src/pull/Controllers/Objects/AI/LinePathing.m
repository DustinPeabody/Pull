//
//  LinePathing.m
//  pull
//
//  Created by Kyle Whittington on 4/29/13.
//
//

#import "LinePathing.h"

@implementation LinePathing

@synthesize start_point = _start_point;
@synthesize end_point = _end_point;
@synthesize velocity = _velocity;
@synthesize distance = _distance;

- (id) init {
  self = [super init];
  
  if (self) {
    //default values for variables
    _start_point = ccp(0,0);
    _end_point = ccp(0, 0);
    _velocity = 0;
    _distance = 0;
  }
  
  return self;
}

/*
 * Will initialize this LinePathing AI with the given velocity,
 * starting and end points.
 *
 * NOTE: use this over default init.
 */
- (id) initWithStartingPoint: (CGPoint) starting_point
                    endPoint: (CGPoint) end_point
                 andVelocity: (double) velocity {
  self = [self init];
  
  if (self) {
    _start_point = starting_point;
    _end_point = end_point;
    _velocity = velocity;
    
    // compute the distance between the two points
    double dx = (end_point.x - starting_point.x);
    double dy = (end_point.y - starting_point.y);
    _distance = sqrt(dx*dx + dy*dy);
  }
  
  return self;
}

- (CGPoint) position {
  return [super position];
}

- (double) computeDistance:(double)elapsed_seconds {
  // distance traveled = velocity * elapsed time
  double pixels_traveled = _velocity * elapsed_seconds;
  
  // what percentage of total distance?
  double t = _distance / pixels_traveled;
  
  return t;
}

- (CGPoint) computePosition:(double)distance {
  // parametric equations for a line, given two points
  //
  // x(t) = x0 - x0t + x1t, 0 <= t
  // y(t) = y0 - y0t + y1t, 0 <= t
  //
  
  int current_x = round(_start_point.x - (_start_point.x * distance)
                        + (_end_point.x * distance));
  int current_y = round(_start_point.y - (_start_point.y * distance)
                        + (_end_point.y * distance));
  
  return ccp(current_x, current_y);
}

@end
