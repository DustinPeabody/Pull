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

- (id) init {
  self = [super init];
  
  if (self) {
      //default values for variables
      _start_point = ccp(0,0);
      _end_point = ccp(0, 0);
      _current_time = 0;
      
      // velocity should have a default value of 1 for movement to occur
      _velocity = 1;
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
  }
  
  return self;
}

- (CGPoint) currentPosition:(ccTime) dt {
    /* parametric equation for line through two points P and Q
     * P = P + t(Q - P); t => { Real Number }
     */
    
    // compute initial t value
    _current_time = _current_time + dt;
    
    // modify t by velocity 
    ccTime t = _current_time * _velocity;
    
    double dx = t * (_end_point.x - _start_point.x);
    double dy = t * (_end_point.y - _start_point.y);
    int current_x = round(_start_point.x + dx);
    int current_y = round(_start_point.y + dy);
    
    return ccp(current_x, current_y);
}

@end
