//
//  GravityEnemy.h
//  pull
//
//  Created by Kyle Whittington on 4/27/13.
//
//

#import "GameObject.h"
#import "EnemyObject.h"
#import "LinePathing.h"

@interface GravityEnemy : EnemyObject {
    LinePathing* _ai;
}
@end
