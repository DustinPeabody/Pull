//
//  Level.m
//  pull
//
//  Created by Kyle Whittington on 3/30/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Level.h"
#import "PlayerShip.h"
#import "GameObject.h"

@implementation Level

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
  
  //Iterate through all objects in the level layer
  CCNode* child;
  
  CCARRAY_FOREACH(self.children, child) {
    
    //if the child is a GameObject
    if ([child isKindOfClass:[GameObject class]]) {
      GameObject* game_object = (GameObject*)child;
      
      //call its update method
      [game_object update];
    }
  }
  
  //Now check for objects to remove
  NSArray* game_objects_to_remove = [NSArray array];
  
  CCARRAY_FOREACH(self.children, child) {
    
    //if the child is a GameObject
    if ([child isKindOfClass:[GameObject class]]) {
      GameObject* game_object = (GameObject*)child;
      
      //if the object is scheduled for removal
      if (game_object.isScheduledForRemove) {
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
-(BOOL) ccKeyDown:(NSEvent *)event
{
  NSString *keyPressed = [event charactersIgnoringModifiers];
  unichar uc = 0;
  
  if ( [keyPressed length] == 1 )
  {
    uc = [keyPressed characterAtIndex:0];
    if ( uc == NSLeftArrowFunctionKey )
    {
      
      // left arrow pressed
//      player_ship.velocity = ccp(-1,player_ship.velocity.y);
//      [player_ship moveToTheLeft];
      NSLog(@"Left arrow %f, %f",player_ship.velocity.x, player_ship.velocity_x);
    }
    
    if ( uc == NSRightArrowFunctionKey )
    {
      // right arrow pressed
//      [player_ship moveRight];
    }
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
    if ( uc == NSLeftArrowFunctionKey )
    {
      // left arrow released
    }
    
    if ( uc == NSRightArrowFunctionKey )
    {
      // right arrow released
    }
  }
  return YES;
}

@end
