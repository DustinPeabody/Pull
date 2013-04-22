//
//  Level.h
//  pull
//
//  Created by Kyle Whittington on 3/30/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class PlayerShip;
@class KeyListener;
@interface Level : CCLayer {
  PlayerShip* _player_ship;
  KeyListener* _keyListener;
  CCLayer* _hud;
  CCLayer* _background;
}

@end
