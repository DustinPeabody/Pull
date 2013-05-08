//
//  HudLayer.h
//  pull
//
//  Created by Kyle Whittington on 4/27/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "EnemyObject.h"

@interface HudLayer : CCLayer {
  // will show the ships in the ammo slot
  CCNode* _ammo_display;
  
  // will represent the player's health
  CCNode* _heart_one;
  CCNode* _heart_two;
  CCNode* _heart_three;
  int _hearts;
  
//  //Are the slot positions of the ammo enemies
//  CGPoint _slot_one;
//  CGPoint _slot_two;
//  CGPoint _slot_three;
//  CGPoint _slot_four;
}

@property (readonly) CCNode* ammo_display;
@property (readonly) int hearts;

/*
 * Will place the given enemy into the ammo display.
 * @require player_ship.ammo_slot.count < 4
 * @ensure  given.enemy is added to ammo_display as child
 */
//- (void) addEnemyToAmmoDisplay:(EnemyObject*)enemy;

/*
 * Will remove given enemy from the ammo display.
 * @ensure  given.enemy is removed from the ammo_display as a child
 */
//- (void) removeEnemyFromAmmoDisplay:(EnemyObject*)enemy;

/*
 * Will remove a heart from the display.
 */
- (void) removeHeart;

@end
