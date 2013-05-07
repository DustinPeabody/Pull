//
//  EnemyObject.m
//  pull
//
//  Created by Kyle Whittington on 4/29/13.
//
//

#import "EnemyObject.h"

@implementation EnemyObject

@synthesize is_pathing = _is_pathing;
@synthesize is_pulled = _is_pulled;

- (id) init {
  self = [super init];
  
  if (self) {
    //by default:
    _is_pathing = NO; //we don't want the enemies to move
    _is_pulled = NO;  //or be pulled
    
    [self setHorizontalSpeed:ENEMY_SPEED andVerticalSpeed:ENEMY_SPEED];
  }
  
  return self;
}

/*
 * Will be called by CCBReader after the object is given its children.
 */
- (void) didLoadFromCCB {
}

/*
 * Will be called when this EnemyObject is added to a scene.
 */
- (void) onEnter {
  [super onEnter];
  //more than likely the enemy will be off-screen
  [self setVisible:NO]; //so don't draw it
}

/*
 * Will update this GameObject's state according to the given environment state.
 * parameter dt := ccTime type. Time interval since last update.
 * (once per frame)
 */
- (void) update:(ccTime)dt {
  [super update:dt];
  
  //check if the enemy has left the field of view
  
  //if it's entered the screen then left horizontally
  if ((self.position.y > WINDOW_HEIGHT &&
      self.position.x < 0 && self.position.x > WINDOW_WIDTH) ||
      //or entered the screen and traveled past the bottom
      (self.position.y < 0)) {
    //remove it
    [self scheduleForRemoval:YES];
  }
  //otherwise, if the Enemy is on-screen and not visible
  else if (self.visible == NO && self.position.y < WINDOW_HEIGHT) {
    //draw it
    [self setVisible:YES];
  }
}

@end
