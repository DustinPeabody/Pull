//
//  GameObject.m
//  pull
//
//  Created by Kyle Whittington on 3/30/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "GameObject.h"


@implementation GameObject

@synthesize velocity_x;
@synthesize velocity;
@synthesize isScheduledForRemove;

/*
 * Will return an instance of this class with a velocity of (0,0)
 */
- (id) init {
  
  self = [super init];
  if (!self) return NULL;
  
  //we want there to be no movement at start
  velocity = ccp(0,0);
  velocity_x = 0;
  
  return self;
}

/*
 * Update is called for every game object once every frame.
 */
- (void) update {
}

//- (void) moveLeft {
//  velocity = ccp(-1, velocity.y);
//  NSLog(@"Moved Left!!!!");
//}
//
//- (void) moveRight {
//  velocity.x = 1;
//}
//
//- (void) moveUp {
//  velocity.y = 1;
//}
//
//- (void) moveDown {
//  velocity.y = -1;
//}
//
//- (void) resetVelocity {
//  velocity = ccp(0,0);
//}

@end
