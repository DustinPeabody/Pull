//
//  GameScene.m
//  pull
//
//  Created by Kyle Whittington on 5/7/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "GameScene.h"


@implementation GameScene

@synthesize level = _level;
@synthesize hud = _hud;
@synthesize background = _background;

- (id) init {
  self = [super init];
  
  if (self) {
    self->_hud = [[HudLayer alloc]init];
    self->_level = [[LevelLayer alloc]init];
    self->_background = [[BackgroundLayer alloc]init];
    self->_level_number = 1;
    self->_game_over = NO;
  }
  
  return self;
}

-(void) onEnter {
  
  [super onEnter];
  
  //Schedule a selector that is called every frame
  [self schedule:@selector(update:)];
  
}

- (void) onExit {
  
  [super onExit];
  
  //Remove the scheduled selector
  [self unscheduleAllSelectors];
}

- (void) update:(ccTime)delta {
  if (_game_over == NO) {
    [super update:delta];
    
    if (_hud.hearts == 0) {
      CCNode* game_over = [CCBReader nodeGraphFromFile:@"game_over"];
      [game_over setPosition:ccp(self.contentSize.width/2, self.contentSize.height/2)];
      [self addChild:game_over];
      _game_over = YES;
    }
    //if the player was hit
    else if (_level.player_ship.is_hit) {
      //register the hit
      [_level.player_ship hitRegistered];
    
      //remove a heart
      [_hud removeHeart];
    }

    for (CCNode* child in self.children) {
      if ([child isKindOfClass:[EnemyObject class]]) {
        EnemyObject* enemy = (EnemyObject*)child;

        if (enemy.is_pulled) {
          [enemy setVisible:YES];
        }
      }
    }
    
    //if the game is over
    if ([_level isLevelOver] && _level_number == 1) {
      //load up the next level
      CCNode* next_level = [CCBReader nodeGraphFromFile:@"level_layer2"];
      CCNode* next_background = [CCBReader nodeGraphFromFile:@"background_layer2"];
      CCNode* next_hud = [CCBReader nodeGraphFromFile:@"hud_layer"];
      
      LevelLayer* old_level = _level;
      BackgroundLayer* old_background = _background;
      HudLayer* old_hud = _hud;
      
      [self removeChild:old_level];
      [self removeChild:old_background];
      [self removeChild:old_hud];
      
      if ([next_level isKindOfClass:[LevelLayer class]]) _level = (LevelLayer*)next_level;
      if ([next_background isKindOfClass:[BackgroundLayer class]]) _background = (BackgroundLayer*)next_background;
      if ([next_hud isKindOfClass:[HudLayer class]]) _hud = (HudLayer*)next_hud;
      
      [self addChild:_background];
      [self addChild:_level];
      [self addChild:_hud];
      _level_number = 2;
    }
    else if ([_level isLevelOver] && _level_number == 2) {
      CCNode* level_completed = [CCBReader nodeGraphFromFile:@"level_completed"];
      [level_completed setPosition:ccp(self.contentSize.width/2, self.contentSize.height/2)];
      [self addChild:level_completed];
      _game_over = YES;
    }
  }
}

@end
