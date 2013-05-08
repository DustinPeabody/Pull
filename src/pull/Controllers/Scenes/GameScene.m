//
//  GameScene.m
//  pull
//
//  Created by Kyle Whittington on 5/7/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "GameScene.h"


@implementation GameScene

- (id) init {
  self = [super init];
  
  if (self) {
    self->_hud = [[HudLayer alloc]init];
    self->_level = [[LevelLayer alloc]initWithHud:_hud];
    self->_background = [[BackgroundLayer alloc]init];
  }
  
  return self;
}

-(void) onEnter {
  
  [super onEnter];
  
  //Schedule a selector that is called every frame
  [self schedule:@selector(update:)];
  
}

- (void) onExit {
  
  [super onExit];
  
  //Remove the scheduled selector
  [self unscheduleAllSelectors];
}

- (void) update:(ccTime)delta {
  [super update:delta];
}

@end
