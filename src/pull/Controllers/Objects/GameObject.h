//
//  GameObject.h
//  pull
//
//  Created by Kyle Whittington on 3/30/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface GameObject : CCNode {
  BOOL isScheduledForRemove;
  //will be used to determine direction of this ship's movement
  //if velocity.x < 0 -- the ship goes left
  //   velocity.x = 0 -- the ship doesn't move horizontally
  //   velocity.x > 0 -- the ship goes right
  //
  //   velocity.y < 0 -- the ship goes down
  //   velocity.y = 0 -- the ship doesn't move vertically
  //   velocity.y > 0 -- the ship goes up
  CGPoint velocity;
  float velocity_x;
}

@property (nonatomic) float velocity_x;
@property (nonatomic) CGPoint velocity;
@property (nonatomic, assign) BOOL isScheduledForRemove;

-(void) update;
//-(void) moveUp;
//-(void) moveRight;
//-(void) moveDown;
//-(void) moveLeft;
//-(void) resetVelocity;

@end
