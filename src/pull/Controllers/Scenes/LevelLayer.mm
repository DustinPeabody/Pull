//
//  Level.m
//  pull
//
//  Created by Kyle Whittington on 3/30/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "LevelLayer.h"
#import "PlayerShip.h"
#import "GameObject.h"
#import "KeyListener.h"


@implementation LevelLayer

- (id) init {
  
  self = [super init];
  
  if (self) {
    self->_keyListener = [[KeyListener alloc] init];
  }
  
  return self;
}

-(void) onEnter {
  
  [super onEnter];
  
  //Schedule a selector that is called every frame
  [self schedule:@selector(update:)];
  
  //Make sure the keyboard is enabled
  [self setKeyboardEnabled:YES];
}

- (void) onExit {
  
  [super onExit];
  
  //Remove the scheduled selector
  [self unscheduleAllSelectors];
}

- (void) update:(ccTime)delta {
    
    //Update all children of this level
    [self updateGameObjects:delta];
    
    // TODO: [self checkForCollisions];
    [self handleGameObjectRemoval];
    
    // Now check ship movement stuff
    [self handleKeyboard];
}

/*
 * Will update all GameObject children of this level.
 */
- (void) updateGameObjects:(ccTime)delta {
    //Iterate through all objects in the level layer
    CCNode* child;
    
    CCARRAY_FOREACH(self.children, child) {
        
        //if the child is a GameObject
        if ([child isKindOfClass:[GameObject class]]) {
            GameObject* game_object = (GameObject*)child;
            
            //call its update method
            [game_object update:delta];
        }
    }
}

/*
 * Will check if any child GameObjects are marked for removal,
 * then remove them.
 */
- (void) handleGameObjectRemoval {
  
  CCNode* child;
  
  //Check if any GameObjects are colliding with each other
  //Now check for objects to remove
  NSArray* game_objects_to_remove = [NSArray array];
  
  CCARRAY_FOREACH(self.children, child) {
    
    //if the child is a GameObject
    if ([child isKindOfClass:[GameObject class]]) {
      GameObject* game_object = (GameObject*)child;
      
      //if the object is scheduled for removal
      if (game_object.isScheduledForRemoval) {
        game_objects_to_remove = [game_objects_to_remove arrayByAddingObject:child];
      }
    }
  }
  
  //for each object in the array
  for (GameObject* game_object in game_objects_to_remove) {
    
    //remove it
    [self removeChild:game_object cleanup:YES];
  }
}

/*
 * Will check for keyboard input from the user.
 */
- (void) handleKeyboard {
  // First, check if there are any keys pressed
  // if neither horizontal movement keys are pressed
  if ([_keyListener isKeyPressed:RIGHT] == NO &&
      [_keyListener isKeyPressed:LEFT] == NO) {
    
    //stop the ship's horizontal movment
    [_player_ship resetHorizontalDirection];
  }
  // otherwise, at least one is pressed
  else {
    
    // We want separate if statements so they're independent
    if ([_keyListener isKeyPressed:RIGHT]) [_player_ship directRight];
    if ([_keyListener isKeyPressed:LEFT]) [_player_ship directLeft];
  }
  
  // and if neither vertical movement keys are pressed
  if ([_keyListener isKeyPressed:UP] == NO &&
      [_keyListener isKeyPressed:DOWN] == NO) {
    
    //stop the ship's vertical movement
    [_player_ship resetVerticalDirection];
  }
  // otherwise, at least one is pressed
  else {
    
    // Again, we want them to be separate so they're independent
    if ([_keyListener isKeyPressed:DOWN]) [_player_ship directDown];
    if ([_keyListener isKeyPressed:UP])
      [_player_ship directUp];
  }
}

-(BOOL) ccKeyDown:(NSEvent *)event
{
  NSString *keyPressed = [event charactersIgnoringModifiers];
  unichar uc = 0;
  
  if ( [keyPressed length] == 1 )
  {
    uc = [keyPressed characterAtIndex:0];
    
    // if any arrow keys are pressed, tell the KeyListener
    if (uc == NSLeftArrowFunctionKey || uc == 'a') [_keyListener keyIsPressed:LEFT];
    if (uc == NSRightArrowFunctionKey || uc == 'd') [_keyListener keyIsPressed:RIGHT];
    if (uc == NSUpArrowFunctionKey || uc == 'w') [_keyListener keyIsPressed:UP];
    if (uc == NSDownArrowFunctionKey || uc == 's') [_keyListener keyIsPressed:DOWN];
  }
  return YES;
}

-(BOOL) ccKeyUp:(NSEvent *)event
{
  NSString *keyReleased = [event charactersIgnoringModifiers];
  unichar uc = 0;
  
  if ( [keyReleased length] == 1 )
  {
    uc = [keyReleased characterAtIndex:0];
    
    // if any arrow keys are unpressed, tell the KeyListener
    if (uc == NSLeftArrowFunctionKey || uc == 'a') [_keyListener keyIsUnpressed:LEFT];
    if (uc == NSRightArrowFunctionKey || uc == 'd') [_keyListener keyIsUnpressed:RIGHT];
    if (uc == NSUpArrowFunctionKey || uc == 'w') [_keyListener keyIsUnpressed:UP];
    if (uc == NSDownArrowFunctionKey || uc == 's') [_keyListener keyIsUnpressed:DOWN];
  }
  return YES;
}

//TODO: Remove this code, not needed
//-(BOOL) ccMouseMoved:(NSEvent *)event {
//  CGPoint mouse_location = ccp(event.locationInWindow.x,event.locationInWindow.y);
//  
//  //if the mouse is to the right of the ship
//  if (_player_ship.position.x - mouse_location.x < 0) {
//    [_player_ship directRight];
//  }
//  //or if the mouse is to the left of the ship
//  else if (_player_ship.position.x - mouse_location.x > 0) {
//    [_player_ship directLeft];
//  }
//  
//  return YES;
//}

@end
