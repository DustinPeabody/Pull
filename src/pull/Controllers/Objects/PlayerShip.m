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
  if (!self) return NULL;
  
  return self;
}


//// COMMANDS //////


- (void) update {
  
  //calculate the next position
  CGPoint old_position = self.position;
  
  float new_x = old_position.x + (ShipSpeed*velocity_x);
  float new_y = old_position.y + (ShipSpeed*velocity.y);
  
  if (velocity.x == -1) {
    NSLog(@"move left");
  }
  else if (velocity.x == 1) {
    NSLog(@"move right");
  }
  //now reset the velocity
//  [self resetVelocity];
  
  
  self.position = ccp(new_x,new_y);
}

-(void) moveToTheLeft {
  velocity = ccp(-1, velocity.y);
  velocity_x = -1;
}
@end
