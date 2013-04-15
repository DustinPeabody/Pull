//
//  KeyListener.h
//  pull
//
//  Created by Kyle Whittington on 4/12/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

typedef enum _Keys {
  UP = 0,
  DOWN,
  LEFT,
  RIGHT,
  PULL,
  PUSH,
  KEYS_MAX_SIZE
} Keys;

@interface KeyListener : NSObject {
  
  /*
   * Will store the state of the keys
   * (whether or not they are pressed).
   * YES -- key is down
   * NO  -- key is up
   */
  BOOL _keyStates[KEYS_MAX_SIZE];
}

@property (readonly) const BOOL *keyStates;

- (BOOL) isKeyPressed:(Keys) key;
- (void) keyIsPressed:(Keys) key;
- (void) keyIsUnpressed:(Keys) key;

@end
