//
//  PlayerShip.m
//  pull
//
//  Created by Kyle Whittington on 3/30/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "PlayerShip.h"

// The initial speed for the ship will be 5 px/frame
#define ShipSpeed 5

@implementation PlayerShip

- (id) init {
  
  self = [super init];
  
  //if successfully created
  if (self) {
    //set the speed
    [self setHorizontalSpeed:ShipSpeed andVerticalSpeed:ShipSpeed];
  }
  
  return self;
}


//// COMMANDS //////


- (void) update {
  
  //calculate the next position
  CGPoint old_position = self.position;
  
  float new_x = old_position.x + (_direction.x*_speed.x);
  float new_y = old_position.y + (_direction.y*_speed.y);
  
  //reset the direction
  [self resetDirection];
  
  self.position = ccp(new_x,new_y);
}

@end
