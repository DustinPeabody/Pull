//
//  CirclePathing.m
//  pull
//
//  Created by Kyle Whittington on 4/29/13.
//
//

#import "CirclePathing.h"

@implementation CirclePathing

@synthesize center = _center;
@synthesize radius = _radius;
@synthesize velocity = _velocity;
@synthesize distance = _distance;

- (id) init {
  self = [super init];
  
  if (self) {
      //default values for variables
      _center = ccp(0, 0);
      _radius = 0;
      _distance = 0;
      _current_time = 0;
      
      // velocity should have a default factor of 1 for movement to occur
      _velocity = 1;
  }
  
  return self;
}

/*
 * Will initialize this CirclePath with the given variables.
 */
- (id) initWithCenter: (CGPoint) center_point
               radius: (int) radius
             velocity: (double) velocity {
  
  self = [self init];
  
  if (self) {
    _center = center_point;
    _radius = radius;
    _velocity = velocity;
  }
  return self;
}

- (CGPoint) position {
  return [super position];
}

// DEPRECATED. Don't use.

- (double) computeDistance:(double)elapsed_seconds {
  double rev = _velocity * elapsed_seconds;
  double radians = _distance + (rev * (2 * M_PI));
  
  return radians;
}

- (CGPoint) currentPosition:(ccTime)dt {
    
    // increment elapsed time since start
    _current_time = _current_time + dt;
    
    /* Parametric equation for point P along circle with radius r
     * and center C, with respect to variable t:
     *
     * Px = Cx + rcos(2pi * v * t), t => { Real Number }
     * Py = Cy + rsin(2pi * v * t), t => { Real Number }
     *
     * v := velocity constant
     */
    
    // modify t by velocity
    ccTime t = _current_time * _velocity;
    
    // compute t as a proportion of 2pi radians
    double theta = t * (2 * M_PI);
    
    int current_x = round(_center.x + (_radius * cos(theta)));
    int current_y = round(_center.y + (_radius * sin(theta)));
    
    return ccp(current_x, current_y);
}

// DEPRECATED. Don't use.

- (CGPoint) computePosition:(double)distance {
  double x = round(_center.x + (_radius * cos(distance)));
  double y = round(_center.y + (_radius * sin(distance)));
  
  return ccp(x, y);
}

@end
