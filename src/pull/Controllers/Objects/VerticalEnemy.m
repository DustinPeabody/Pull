//
//  VerticalEnemy.m
//  pull
//
//  Created by Kyle Whittington on 4/27/13.
//
//

#import "VerticalEnemy.h"

@implementation VerticalEnemy
- (id) init {
    self = [super init];
    
    if (self) {
        //alloc/init a default circle path
        //_ai = [[CirclePathing alloc]init];
        _ai = [[LinePathing alloc]init];
        
        
    }
    
    return self;
}

- (void) update:(ccTime) dt{
    //if pathing is enabled
    if (self.is_pathing) {
        
        //compute the next position
        CGPoint new_position = [_ai currentPosition:dt];
        
        self.position = new_position;
    }
}

/*
 * Will turn the pathing of this object on and
 * make it begin folling its AI controls.
 */
- (void) startPathingToTarget:(CGPoint)target {
    //compute the center of the path's circle
    CGPoint center = ccp(target.x, self.position.y);
    int radius = abs(target.x - self.position.x);
    
    //re-alloc/init the pathing object
    //_ai = [[CirclePathing alloc]initWithCenter:center radius:radius velocity:self.speed.x/20];
    //_ai = [[CirclePathing alloc]initWithCenter:target radius:500 velocity:self.speed.x/2];
    _ai = [[LinePathing alloc]initWithStartingPoint:self.position endPoint:target andVelocity:self.speed.y];
    
    self->_is_pathing = YES;
}

@end
