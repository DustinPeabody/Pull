//
//  StandardEnemy.h
//  pull
//
//  Created by Kyle Whittington on 4/27/13.
//
//

#import "EnemyObject.h"
#import "GameObject.h"
#import "LinePathing.h"

@interface StandardEnemy : EnemyObject {
    LinePathing* _ai;
}

@end
