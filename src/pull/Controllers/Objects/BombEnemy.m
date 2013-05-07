//
//  BombEnemy.m
//  pull
//
//  Created by Kyle Whittington on 4/27/13.
//
//

#import "BombEnemy.h"

@implementation BombEnemy

- (id) init {
  self = [super init];
  
  if (self) {
    //alloc/init a default circle path
    //_ai = [[CirclePathing alloc]init];
      _ai = [[LinePathing alloc]init];
      
    
  }
  
  return self;
}

- (void) didLoadFromCCB {
  [super didLoadFromCCB];
}

- (void) update:(ccTime) dt{
  //if pathing is enabled
  if (self.is_pathing) {
  
    //compute the next position
    CGPoint new_position = [_ai currentPosition:dt];
  
    self.position = new_position;
  }
  else {
    [super update:dt];
  }
}

/*
 * Will turn the pathing of this object on and
 * make it begin folling its AI controls.
 */
- (void) startPathingToTarget:(CGPoint)target {
  
    _ai = [[LinePathing alloc]initWithStartingPoint:self.position endPoint:target andVelocity:self.speed.y];
  
  self->_is_pathing = YES;
}

@end
