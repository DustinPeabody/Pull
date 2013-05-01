//
//  GameObject.h
//  pull
//
//  Created by Kyle Whittington on 3/30/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "AppDelegate.h"

@interface GameObject : CCNode {
  //will be used to determine direction of this GameObject's movement
  //if direction.x < 0 -- the GameObject goes left
  //   direction.x = 0 -- the GameObject doesn't move horizontally
  //   direction.x > 0 -- the GameObject goes right
  //
  //   direction.y > 0 -- the GameObject goes down
  //   direction.y = 0 -- the GameObject doesn't move vertically
  //   direction.y < 0 -- the GameObject goes up
  CGPoint _direction;
  CGPoint _speed;
}

@property (readonly) CGPoint direction;
@property (readonly) CGPoint speed;
@property (nonatomic, assign, setter = scheduleForRemoval:)
          BOOL isScheduledForRemoval;

/*
 * Will return an instance of this GameObject with the given speed.
 *
 * Ensure: self.speed.x == abs(given.x_speed) &&
 *          self.speed.y == abs(given.y_speed)
 */
- (id) initWithHorizontalSpeed: (float) x_speed
              andVerticalSpeed: (float) y_speed;
/*
 * Will update this GameObject's state according to the given environment state.
 * parameter dt := ccTime type. Time interval since last update.
 * (once per frame)
 */
-(void) update:(ccTime) dt;

/*
 * Will set the vertical direction of this GameObject to point upwards.
 *
 * Ensure: new.direction.y < 0 &&
            new.direction.x == old.direction.x
 */
-(void) directUp;

/*
 * Will set the horizontal direction of this GameObject to point right.
 *
 * Ensure: new.direction.x > 0 &&
 *          new.direction.y == old.direction.y
 */
-(void) directRight;

/* 
 * Will set the vertical direction of this GameObject to point downards.
 *
 * Ensure: new.direction.y > 0 &&
 *          new.direction.x == old.direction.x
 */
-(void) directDown;

/* 
 * Will set the horizontal direction of this GameObject to point leftwards.
 *
 * Ensure: new.direction.x < 0 &&
 *          new.direction.y == old.direction.y
 */
-(void) directLeft;


/*
 * Will reset this GameObject's direction,
 * pointing it in no specific direction(s) and making it stationary.
 *
 * Ensure: new.direction.x == 0 &&
 *          new.direction.y == 0
 */
-(void) resetDirection;

/*
 * Will reset this GameObject's horizontal direction,
 * halting all horizontal movment.
 *
 * Ensure: new.direction.x == 0
 */
-(void) resetHorizontalDirection;

/*
 * Will reset this GameObject's vertical direction,
 * halting all vertical movemnt.
 *
 * Ensure: new.direction.y == 0
 */
-(void) resetVerticalDirection;

/*
 * Will set this GameObject's horizontal and
 * vertical speed to the given speed.
 *
 * Ensure: new.speed.x == given.x_speed &&
 *          new.speed.y == given.y_speed
 */
-(void) setHorizontalSpeed:(float)x_speed
          andVerticalSpeed:(float)y_speed;

/*
 * Will set this GameObject's horizontal speed to the given speed.
 *
 * Ensure: new.speed.x == given.x_speed
 */
-(void) setHorizontalSpeed:(float)x_speed;

/*
 * Will set this GameObject's vertical speed to the given speed.
 *
 * Ensure: new.speed.y == given.y_speed
 */
-(void) setVerticalSpeed:(float)y_speed;

/*
 * Will reset this GameObject's horizontal and vertical speed.
 *
 * Ensure: new.speed.y == 0 &&
 *          new.speed.x == 0
 */
-(void) resetSpeed;


/////////////////////////////
// START OF: Move Commands //
/////////////////////////////
// Left as relic code, don't want the position changes to be method based,
// want it to happen in the update method.
/////////////////////////////

/*
 * Will move this GameObject upwards based on its vertical velocity.
 *
 * Ensure: new.position.y == old.position.y - self.velocity.y
 *         NOTE: (0,0)px is in the top-left
 */
//-(void) moveUp;

/*
 * Will move this GameObject to the right based on its horizontal velocity.
 *
 * Ensure: new.position.x == old.position.x + self.velocity.x
 *         NOTE: (0,0)px is in the top-left
 */
//-(void) moveRight;

/*
 * Will move this GameObject downwards based on its vertical velocity.
 *
 * Ensure: new.position.y == old.position.y + self.velocity.y
 *         NOTE: (0,0)px is in the top-left
 */
//-(void) moveDown;

/*
 * Will move this GameObject to the left based on its horizontal velocity.
 *
 * Ensure: new.position.x == old.position.x - self.velocity.x
 *         NOTE: (0,0)px is in the top-left
 */
//-(void) moveLeft;

//END OF: Move Commands//
/////////////////////////

@end
