//
//  CirclePathing.m
//  pull
//
//  Created by Kyle Whittington on 4/29/13.
//
//

#import "CirclePathing.h"

@implementation CirclePathing

@synthesize position = _postition;
@synthesize radius = _radius;
@synthesize velocity = _velocity;
@synthesize distance = _distance;

- (id) init {
  self = [super init];
  
  if (self) {
    //default values for variables
    _postition = ccp(0, 0);
    _radius = 0;
    _velocity = 0;
    _distance = 0;
  }
  
  return self;
}

/*
 * Will initialize this CirclePath with the given variables.
 */
- (id) initWithCenter: (CGPoint) center_point
                angle: (int) starting_angle
               radius: (int) radius
             velocity: (double) velocity {
  
  self = [self init];
  
  if (self) {
    _postition = center_point;
    _distance = asin(starting_angle);
    _radius = radius;
    _velocity = velocity;
  }
  return self;
}

- (CGPoint) position {
  return [super position];
}

- (double) computeDistance:(double)elapsed_seconds {
  double rev = _velocity * elapsed_seconds;
  double radians = _distance + (rev * (2 * M_PI));
  
  return radians;
}

- (CGPoint) computePosition:(double)distance {
  double x = round(_postition.x + (_radius * cos(distance)));
  double y = round(_postition.y + (_radius * sin(distance)));
  
  return ccp(x, y);
}

@end
