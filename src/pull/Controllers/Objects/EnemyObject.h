//
//  EnemyObject.h
//  pull
//
//  Created by Kyle Whittington on 4/29/13.
//
//

#import "GameObject.h"
#import "LinePathing.h"

#define ENEMY_SPEED 1

@interface EnemyObject : GameObject {
  // will be used to flip the ai on and off
  BOOL _is_pathing;
  
  // will be used to determine if the enemy was 'pulled'
  BOOL _is_pulled;
}

@property (readonly) BOOL is_pathing;
@property (readonly) BOOL is_pulled;

/*
 * Will turn the pathing of this object on and
 * make it begin folling its AI controls.
 */
//- (void) startPathingToTarget: (CGPoint) target;

@end
