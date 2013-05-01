//
//  BombEnemy.h
//  pull
//
//  Created by Kyle Whittington on 4/27/13.
//
//

#import "EnemyObject.h"
#import "CirclePathing.h"

@interface BombEnemy : EnemyObject {
  CirclePathing* _ai;
}

@end
