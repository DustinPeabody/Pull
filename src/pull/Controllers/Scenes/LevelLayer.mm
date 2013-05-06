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
#import "BombEnemy.h"

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

//      TODO: Remove.
//      if ([child isKindOfClass:[BombEnemy class]]) {
//        BombEnemy* bomb_enemy = (BombEnemy*)child;
//        
//        [bomb_enemy startPathingToTarget:ccp(20,25)];
//      }
      
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

-(BOOL) ccKeyUp:(NSEvent *)event {
  
  NSString *keyReleased = [event charactersIgnoringModifiers];
  unichar uc = 0;
  
  if ( [keyReleased length] == 1 )   {
    uc = [keyReleased characterAtIndex:0];
    
    // if any arrow keys are unpressed, tell the KeyListener
    if (uc == NSLeftArrowFunctionKey || uc == 'a') [_keyListener keyIsUnpressed:LEFT];
    if (uc == NSRightArrowFunctionKey || uc == 'd') [_keyListener keyIsUnpressed:RIGHT];
    if (uc == NSUpArrowFunctionKey || uc == 'w') [_keyListener keyIsUnpressed:UP];
    if (uc == NSDownArrowFunctionKey || uc == 's') [_keyListener keyIsUnpressed:DOWN];
  }
  return YES;
}

- (BOOL) ccMouseDown:(NSEvent *)event {
  //get the location of the mouse click
  CGPoint mouse_position = [[CCDirector sharedDirector]convertEventToGL:event];
  
  //if the mouse is clicked,
  //check if any enemies were targetted
  for (CCNode* child in self.children) {
    
    //if the child is an Enemy
    if ([child isKindOfClass:[EnemyObject class]]) {
      EnemyObject* targetted_enemey = (EnemyObject*)child;
      
      //if the mouse click was within the enemy's bounds
      if (CGRectContainsPoint(targetted_enemey.boundingBox, mouse_position))
        [targetted_enemey scheduleForRemoval:YES];
      
      //now do the same for the enemy's children
      //NOTE: This is needed for any enemy node with children (e.g All of them)
      for (CCNode* enemy_child in targetted_enemey.children) {
        
        //we need to compute children's bounds in relation to the enemy's position
        CGRect childs_bounds = CGRectMake(targetted_enemey.position.x + enemy_child.boundingBox.origin.x,
                                           targetted_enemey.position.y + enemy_child.boundingBox.origin.y,
                                           enemy_child.boundingBox.size.width,
                                           enemy_child.boundingBox.size.height);
        
        if (CGRectContainsPoint(childs_bounds, mouse_position)) {
          
          [targetted_enemey scheduleForRemoval:YES];
        }
      }
    }
  }
  
  return YES; //successfully completed execution
}

@end
