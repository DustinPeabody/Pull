//
//  Level.h
//  pull
//
//  Created by Kyle Whittington on 3/30/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Rectangle.h"
#import "Square.h"

@class PlayerShip;
@interface Level : CCLayer {
  PlayerShip* player_ship;
  Rectangle* rectangle;
  Square* square;
}

@end
