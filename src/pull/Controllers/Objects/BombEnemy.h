//
//  BombEnemy.h
//  pull
//
//  Created by Kyle Whittington on 4/27/13.
//
//

#import "EnemyObject.h"
#import "LinePathing.h"
#import "CirclePathing.h"

@interface BombEnemy : EnemyObject {
  LinePathing* _ai;
}

@end
