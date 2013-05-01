//
//  EnemyObject.h
//  pull
//
//  Created by Kyle Whittington on 4/29/13.
//
//

#import "GameObject.h"

@interface EnemyObject : GameObject {
  // will be used to flip the ai on and off
  BOOL _is_pathing;
}

@property (readonly) BOOL is_pathing;

/*
 * Will turn the pathing of this object on and
 * make it begin folling its AI controls.
 */
- (void) startPathingToTarget: (CGPoint) target;

@end
