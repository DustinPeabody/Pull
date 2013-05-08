//
//  HudLayer.m
//  pull
//
//  Created by Kyle Whittington on 4/27/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "HudLayer.h"


@implementation HudLayer

@synthesize ammo_display = _ammo_display;
@synthesize hearts = _hearts;

//// QUERIES ////

- (id) init {
  self = [super init];
  
  if (self) {
    _ammo_display = [[CCNode alloc]init];
    _heart_one = [[CCNode alloc]init];
    _heart_two = [[CCNode alloc]init];
    _heart_three = [[CCNode alloc]init];
    _hearts = 3;
  }
  
  return self;
}

-(void) onEnter {
  
  [super onEnter];
  
  //Schedule a selector that is called every frame
  [self schedule:@selector(update:)];
  
  [self setKeyboardEnabled:YES];
}

- (void) onExit {
  
  [super onExit];
  
  //Remove the scheduled selector
  [self unscheduleAllSelectors];
}

/*
 * Will place the given enemy into the ammo display.
 * @require player_ship.ammo_slot.count < 4
 * @ensure  given.enemy is added to ammo_display as child
 */
//- (void) addEnemyToAmmoDisplay:(EnemyObject*)enemy {
//  [enemy resetDirection];
//  [enemy resetSpeed];
//  [enemy setPosition:_slot_one];
//}

/*
 * Will remove given enemy from the ammo display.
 * @ensure  given.enemy is removed from the ammo_display as a child
 */
//- (void) removeEnemyFromAmmoDisplay:(EnemyObject*)enemy{
//  [_ammo_display removeChild:enemy];
//}

/*
 * Will remove a heart from the display.
 */
- (void) removeHeart{
  if (_hearts == 3) {
    [_heart_three setVisible:NO];
  }
  else if (_hearts == 2) {
    [_heart_two setVisible:NO];
  }
  else if (_hearts == 1) {
    [_heart_one setVisible:NO];
  }
  _hearts = _hearts - 1;
}

@end
