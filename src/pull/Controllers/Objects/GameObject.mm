//
//  GameObject.m
//  pull
//
//  Created by Kyle Whittington on 3/30/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "GameObject.h"


@implementation GameObject

@synthesize direction = _direction;
@synthesize speed = _speed;
@synthesize isScheduledForRemoval;

/*
 * Will return an instance of this class with a speed of (0,0)
 */
- (id) init {
  
  self = [super init];
  
  if (self) {
    //we want there to be no movement at start
    [self resetSpeed];
    [self resetDirection];
  }
  
  return self;
}

/*
 * Will return an instance of this GameObject with the given speed.
 *
 * Ensure: self.speed.x == abs(given.x_speed) &&
 *          self.speed.y == abs(given.y_speed)
 */
- (id) initWithHorizontalSpeed: (float) x_speed
              andVerticalSpeed: (float) y_speed {

  self = [self init];

  //no need to check if nil, messages wont run code if nil
  [self setHorizontalSpeed:x_speed andVerticalSpeed:y_speed];

  return self;
}

/*
 * Will update this GameObject's state according to the given environment state.
 * (once per frame)
 */
-(void) update {
  //calculate the next position
  CGPoint old_position = self.position;
  
  //compute the next horizontal and vertical position
  float new_x = old_position.x + (_direction.x*_speed.x);
  float new_y = old_position.y + (_direction.y*_speed.y);
  
  //be sure to keep them within the window's bounds though
  if (0 > new_x) new_x = 0;
  else if (WINDOW_WIDTH < new_x) new_x = WINDOW_WIDTH;
  
  if (0 > new_y) new_y = 0;
  else if (WINDOW_HEIGHT < new_y) new_y = WINDOW_HEIGHT;
  
  self.position = ccp(new_x,new_y);
}

/*
 * Will set the vertical direction of this GameObject to point upwards.
 *
 * Ensure: new.direction.y < 0 &&
 *          new.direction.x == old.direction.x
 */
-(void) directUp {
  self->_direction.y = 1;
}

/*
 * Will set the horizontal direction of this GameObject to point right.
 *
 * Ensure: new.direction.x > 0 &&
 *          new.direction.y == old.direction.y
 */
-(void) directRight {
  self->_direction.x = 1;
}

/*
 * Will set the vertical direction of this GameObject to point downards.
 *
 * Ensure: new.direction.y > 0 &&
 *          new.direction.x == old.direction.x
 */
-(void) directDown {
  self->_direction.y = -1;
}

/*
 * Will set the horizontal direction of this GameObject to point leftwards.
 *
 * Ensure: new.direction.x < 0 &&
 *          new.direction.y == old.direction.y
 */
-(void) directLeft {
  self->_direction.x = -1;
}


/*
 * Will reset this GameObject's direction,
 * pointing it in no specific direction(s) and making it stationary.
 *
 * Ensure: new.direction.x == 0 &&
 *          new.direction.y == 0
 */
-(void) resetDirection {
  self->_direction = ccp(0, 0);
}

/*
 * Will reset this GameObject's horizontal direction,
 * halting all horizontal movment.
 *
 * Ensure: new.direction.x == 0
 */
-(void) resetHorizontalDirection {
  self->_direction.x = 0;
}

/*
 * Will reset this GameObject's vertical direction,
 * halting all vertical movemnt.
 *
 * Ensure: new.direction.y == 0
 */
-(void) resetVerticalDirection {
  self->_direction.y = 0;
}

/*
 * Will set this GameObject's horizontal and
 * vertical speed to the given speed.
 *
 * Ensure: new.speed.x == given.x_speed &&
 *          new.speed.y == given.y_speed
 */
-(void) setHorizontalSpeed:(float)x_speed
          andVerticalSpeed:(float)y_speed {
  [self setHorizontalSpeed:x_speed];
  [self setVerticalSpeed:y_speed];
}

/*
 * Will set this GameObject's horizontal speed to the given speed.
 *
 * Ensure: new.speed.x == given.x_speed
 */
-(void) setHorizontalSpeed:(float)x_speed {
  self->_speed.x = x_speed;
}

/*
 * Will set this GameObject's vertical speed to the given speed.
 *
 * Ensure: new.speed.y == given.y_speed
 */
-(void) setVerticalSpeed:(float)y_speed {
  self->_speed.y = y_speed;
}

/*
 * Will reset this GameObject's horizontal and vertical speed.
 *
 * Ensure: new.speed.y == 0 &&
 *          new.speed.x == 0
 */
-(void) resetSpeed {
  self->_speed = ccp(0, 0);
}

@end