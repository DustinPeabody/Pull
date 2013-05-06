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


- (void) update:(ccTime)dt {
  //call the super version of this method
  [super update:dt];
  
  //be sure to keep them within the window's bounds though
  float pos_x = self.position.x;
  float pos_y = self.position.y;
  
  if (0 > pos_x) pos_x = 0;
  else if (WINDOW_WIDTH < pos_x) pos_x = WINDOW_WIDTH;
  
  if (0 > pos_y) pos_y = 0;
  else if (WINDOW_HEIGHT < pos_y) pos_y = WINDOW_HEIGHT;
  
  self.position = ccp(pos_x, pos_y);
}

@end
