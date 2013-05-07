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

@synthesize ammo_slot = _ammo_slot;

//// QUERIES ////

- (id) init {
  
  self = [super init];
  
  //if successfully created
  if (self) {
    //set the speed
    [self setHorizontalSpeed:ShipSpeed andVerticalSpeed:ShipSpeed];
    //init the ammo slot, making it empty
    _ammo_slot = [[NSMutableArray alloc]init];
  }
  
  return self;
}

/*
 * Will return the top-most enemy in the ammo slot.
 * @require this.ammo_slot.count > 0
 * @ensure  return this.ammo_slot.last
 */
- (EnemyObject*) nextEnemy {
  return (EnemyObject*)[[self ammo_slot] lastObject];
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

/*
 * Will add the given Enemy to this PlayerShip's ammo slot.
 * @require this.ammo_slot.count < 4
 * @ensure  this.ammo_slot.count == old.count + 1
 */
- (void) pullEnemy:(EnemyObject*) enemy {
  [self->_ammo_slot addObject:enemy];
}

/*
 * Will remove the top-most ammo from this.ammo_slot.
 * @require this.ammo_slot.count > 0
 * @ensure this.ammo_slot.count == old.count - 1
 */
- (void) pushEnemy {
  [self->_ammo_slot removeLastObject];
}

@end
