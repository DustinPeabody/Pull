//
//  GameScene.h
//  pull
//
//  Created by Kyle Whittington on 5/7/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "HudLayer.h"
#import "LevelLayer.h"
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

@interface GameScene : CCLayer {
  LevelLayer* _level;
  HudLayer* _hud;
  BackgroundLayer* _background;
}

@end
