//
//  KeyListener.m
//  pull
//
//  Created by Kyle Whittington on 4/12/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "KeyListener.h"


@implementation KeyListener

- (id) init {
  
  self = [super init];
  
  if (self) {
    //need to initialize the bool array
    for (int i = 0; i < KEYS_MAX_SIZE; i++) {
      //by deafult we make all keys unpressed
      self->_keyStates[i] = NO;
    }
  }
  
  return self;
}

/*
 * Will replace the getter for keyStates.
 */
- (const BOOL *)keyStates {
  return _keyStates;
}

/*
 * Will return whether or not the given key is pressed.
 * @require  given.key isContained:KeyListener.Keys
 * @ensure   if given.key.state == pressed
 *             return YES
 *           else
 *             return NO
 */
- (BOOL) isKeyPressed:(Keys) key {
  return self->_keyStates[key] == YES;
}

/*
 * Will change the state of the given key to pressed.
 * @require  given.key isContained:KeyListener.Keys
 * @ensure   new.isKeyPressed:given.key == YES
 */
- (void) keyIsPressed:(Keys) key {
  self->_keyStates[key] = YES;
}

/*
 * Wil change the state of the given key to unpressed.
 * @require  given.key isContained:KeyListener.Keys
 * @ensure   new.isKeyPressed:given.key == NO
 */
- (void) keyIsUnpressed:(Keys) key {
  self->_keyStates[key] = NO;
}

@end
