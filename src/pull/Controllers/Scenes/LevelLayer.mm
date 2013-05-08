//
//  Level.m
//  pull
//
//  Created by Kyle Whittington on 3/30/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "LevelLayer.h"
#import "PlayerShip.h"
#import "KeyListener.h"

@implementation LevelLayer

@synthesize player_ship = _player_ship;

- (id) init {
  
  self = [super init];
  
  if (self) {
    self->_player_ship = [[PlayerShip alloc]init];
    self->_keyListener = [[KeyListener alloc]init];
//    self->_hud = [[HudLayer alloc]init];
  }
  
  return self;
}

//- (id) initWithHud:(HudLayer*)hud {
//  self = [self init];
//
//  if (self) {
//    self->_hud = hud;
//  }
//
//  return self;
//}

-(void) onEnter {
  
  [super onEnter];
  
  //Schedule a selector that is called every frame
  [self schedule:@selector(update:)];
  
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
  for (CCNode* child in self.children) {

    //if the child is an Enemy
    if ([child isKindOfClass:[EnemyObject class]]) {
      EnemyObject* enemy_object = (EnemyObject*)child;
      
      //if the enemy is visible
      if (enemy_object.visible) {
        
        //does the enemy intersect the player
        if ([self does:enemy_object intersect:_player_ship]) {
          //the player has been hit
          [_player_ship hitByEnemy];
          
          //replace the enemy with an explosion
          Explosion* explosion = [self explosionForEnemy:enemy_object];
          [explosion setPosition:enemy_object.position];
          [self addChild:explosion];
          [enemy_object scheduleForRemoval:YES];
        }
        
        //does the enemy intersect an explosion
        for (CCNode* child in self.children) {
          //find an explosion
          if ([child isKindOfClass:[Explosion class]]) {
            Explosion* explosion = (Explosion*)child;
            
            if ([self does:enemy_object intersect:explosion]) {
              
              //replace the enemy with an explosion
              Explosion* enemy_explosion = [self explosionForEnemy:enemy_object];
              [enemy_explosion setPosition:enemy_object.position];
              [self addChild:enemy_explosion];
              [enemy_object scheduleForRemoval:YES];
            }
          }
        }
      }
      
      //move it down
      [enemy_object directDown];
      
      //then update it
      [enemy_object update:delta];
    }
  }
  
  //update the player ship
  [_player_ship update:delta];
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

- (BOOL) ccRightMouseDown:(NSEvent *)event {
  //get the location of the mouse click
  CGPoint mouse_position = [[CCDirector sharedDirector]convertEventToGL:event];
  
  //if there is room to pull enemies
  if (_player_ship.ammo_slot.count < 4) {
    EnemyObject* pulled_enemy = [self findTargetEnemy:mouse_position];
    
    //if an enemy was pulled
    if (pulled_enemy.is_pulled) {
      //give it to the playership
      //and display it
      [self addEnemyToAmmoSlot:pulled_enemy];
    }
  }
  
  return YES; //successfully completed execution
}

/*
 * Will find the targeted enemy of the mouse click.
 */
- (EnemyObject*) findTargetEnemy:(CGPoint)mouse_position {
  EnemyObject* targetted_enemy = [[EnemyObject alloc]init];
  
  //if the mouse is clicked,
  //check if any enemies were targetted
  for (CCNode* child in self.children) {
    
    //if the child is an Enemy
    if ([child isKindOfClass:[EnemyObject class]]) {
      targetted_enemy = (EnemyObject*)child;
      
      //if the mouse click was within the enemy's bounds
      if (CGRectContainsPoint(targetted_enemy.boundingBox, mouse_position))
        [targetted_enemy pull];
      
      //now do the same for the enemy's children
      //NOTE: This is needed for any enemy node with children (e.g All of them)
      for (CCNode* enemy_child in targetted_enemy.children) {
        
        //we need to compute children's bounds in relation to the enemy's position
        CGRect childs_bounds = CGRectMake(targetted_enemy.position.x + enemy_child.boundingBox.origin.x,
                                          targetted_enemy.position.y + enemy_child.boundingBox.origin.y,
                                          enemy_child.boundingBox.size.width,
                                          enemy_child.boundingBox.size.height);
        
        if (CGRectContainsPoint(childs_bounds, mouse_position))
          [targetted_enemy pull];
        
      }
    }
    //if an enemy was pulled
    if (targetted_enemy.is_pulled) break; //break out of the loop
    
  }//END OF: for-in loop
  
  return targetted_enemy;
}

/*
 * Will 'pull' the given EnemyObject, removing them from play and adding them
 * to the player's ammo slot.
 * @require given.enemy.is_pulled == NO && player_ship.ammo_slot.size < 4
 * @ensure  given.enemy.is_pulled == YES && player_ship.ammo_slot.size = old.size + 1
 */
- (void) addEnemyToAmmoSlot:(EnemyObject*)enemy {
  CCNode* ammo = [[CCNode alloc]init];
  
  //if enemy is bomb
  if ([enemy isKindOfClass:[BombEnemy class]]) {
    ammo = [CCBReader nodeGraphFromFile:@"bomb_enemy"];
  }
  else if ([enemy isKindOfClass:[GravityEnemy class]]) {
    ammo = [CCBReader nodeGraphFromFile:@"gravity_enemy"];
  }
  else if ([enemy isKindOfClass:[HorizontalEnemy class]]) {
    ammo = [CCBReader nodeGraphFromFile:@"horizontal_enemy"];
  }
  else if ([enemy isKindOfClass:[StandardEnemy class]]) {
    ammo = [CCBReader nodeGraphFromFile:@"standard_enemy"];
  }
  else if ([enemy isKindOfClass:[VerticalEnemy class]]) {
    ammo = [CCBReader nodeGraphFromFile:@"vertical_enemy"];
  }
  
  if ([ammo isKindOfClass:[EnemyObject class]]) {
    //cast as enemy
    EnemyObject* ammo_enemy = (EnemyObject*)ammo;
  
    //for first slot
    if (_player_ship.ammo_slot.count == 0) {
      [ammo_enemy setPosition:ccp(AMMO_ONE_X,AMMO_HEIGHT)];
    }
    else if (_player_ship.ammo_slot.count == 1) {
      [ammo_enemy setPosition:ccp(AMMO_TWO_X,AMMO_HEIGHT)];
    }
    else if (_player_ship.ammo_slot.count == 2) {
      [ammo_enemy setPosition:ccp(AMMO_THREE_X, AMMO_HEIGHT)];
    }
    else if (_player_ship.ammo_slot.count == 3) {
      [ammo_enemy setPosition:ccp(AMMO_FOUR_X, AMMO_HEIGHT)];
    }
    
    [ammo_enemy pull];
    [_player_ship pullEnemy:ammo_enemy];
    [self.parent addChild:ammo_enemy];
    [self removeChild:enemy];
  }
}

- (BOOL) ccMouseDown:(NSEvent *)event {
  //get the location of the mouse click
  CGPoint mouse_position = [[CCDirector sharedDirector]convertEventToGL:event];
  
  //if there's any pulled enemies
  if (_player_ship.ammo_slot.count > 0) {
    //get the enemy to be thrown
    EnemyObject* to_throw = _player_ship.nextEnemy;
    
    Explosion* explosion = [self explosionForEnemy:to_throw];
    
    [explosion setPosition:mouse_position];
    [_player_ship pushEnemy];
    [self.parent removeChild:to_throw];
    [self addChild:explosion];
  }
  
  return YES; //succesfully completed execution
}

- (Explosion*) explosionForEnemy:(EnemyObject*)enemy {
  CCNode* explosion = [[CCNode alloc]init];
  
  //if enemy is bomb
  if ([enemy isKindOfClass:[BombEnemy class]]) {
    explosion = [CCBReader nodeGraphFromFile:@"bomb_explosion"];
  }
  else if ([enemy isKindOfClass:[GravityEnemy class]]) {
    explosion = [CCBReader nodeGraphFromFile:@"bomb_explosion"];
  }
  else if ([enemy isKindOfClass:[HorizontalEnemy class]]) {
    explosion = [CCBReader nodeGraphFromFile:@"horizontal_explosion"];
  }
  else if ([enemy isKindOfClass:[StandardEnemy class]]) {
    explosion = [CCBReader nodeGraphFromFile:@"bomb_explosion"];
  }
  else if ([enemy isKindOfClass:[VerticalEnemy class]]) {
    explosion = [CCBReader nodeGraphFromFile:@"vertical_explosion"];
  }
  
  Explosion* casted_explosion = [[Explosion alloc]init];
  
  if ([explosion isKindOfClass:[Explosion class]]) {
    casted_explosion = (Explosion*)explosion;
  }
  return casted_explosion;
}

- (BOOL) does:(CCNode*)node intersect:(CCNode*)other{
  BOOL result = NO;
  
  //check if the base boudning boxes collide
  CGRect node_box = CGRectMake(node.position.x, node.position.y, node.boundingBox.size.width, node.boundingBox.size.height);
  CGRect other_box = CGRectMake(other.position.x, other.position.y, other.boundingBox.size.width, other.boundingBox.size.height);
  
  if (CGRectIntersectsRect(node_box,other_box)) result = YES;
  else {
    //check the children
    for (CCNode* node_child in node.children) {
      CGRect node_child_box = CGRectMake(node.position.x + node_child.boundingBox.origin.x, node.position.y + node_child.boundingBox.origin.y, node_child.boundingBox.size.width, node_child.boundingBox.size.height);
      
      if (CGRectIntersectsRect(other_box, node_child_box)) result = YES;
      
      for (CCNode* other_child in other.children) {
        CGRect other_child_box = CGRectMake(other.position.x + other_child.boundingBox.origin.x, other.position.y + other_child.boundingBox.origin.y, other_child.boundingBox.size.width, other_child.boundingBox.size.height);
        
        if (CGRectIntersectsRect(node_child_box, other_child_box)) result = YES;
      }
    }
  }
  
  
  
  return result;
}

- (BOOL) isLevelOver {
  BOOL result = YES;
  
  //check for remaining enemies
  for (CCNode* child in self.children) {
    //if the child is an enemy
    if ([child isKindOfClass:[EnemyObject class]]) {
      //game is not over
      result = NO;
      break;
    }
  }
  
  return result;
}

@end
