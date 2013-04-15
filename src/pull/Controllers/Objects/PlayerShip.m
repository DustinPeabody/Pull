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
  //call the super version of this method
  [super update];
}

@end
