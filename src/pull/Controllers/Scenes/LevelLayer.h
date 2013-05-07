//
//  Level.h
//  pull
//
//  Created by Kyle Whittington on 3/30/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "PlayerShip.h"
#import "GameObject.h"
#import "EnemyObject.h"
#import "BombEnemy.h"
#import "StandardEnemy.h"
#import "VerticalEnemy.h"
#import "HorizontalEnemy.h"
#import "GravityEnemy.h"
#import "KeyListener.h"

@class PlayerShip;
@class KeyListener;
@interface LevelLayer : CCLayer {
  PlayerShip* _player_ship;
  KeyListener* _keyListener;
  CCLayer* _hud;
  CCLayer* _background;
  
}

@end
