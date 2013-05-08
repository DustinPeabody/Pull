//
//  Level.h
//  pull
//
//  Created by Kyle Whittington on 3/30/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "HudLayer.h"
#import "BackgroundLayer.h"
#import "PlayerShip.h"
#import "GameObject.h"
#import "EnemyObject.h"
#import "BombEnemy.h"
#import "StandardEnemy.h"
#import "VerticalEnemy.h"
#import "HorizontalEnemy.h"
#import "GravityEnemy.h"
#import "KeyListener.h"

#define AMMO_HEIGHT 20
#define AMMO_ONE_X 310
#define AMMO_TWO_X 358
#define AMMO_THREE_X 408
#define AMMO_FOUR_X 458

@class PlayerShip;
@class KeyListener;
@interface LevelLayer : CCLayer {
  PlayerShip* _player_ship;
  KeyListener* _keyListener;
}

@end
