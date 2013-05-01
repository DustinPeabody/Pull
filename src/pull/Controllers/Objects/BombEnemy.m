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
    _ai = [[CirclePathing alloc]init];
    
    [self startPathingToTarget:ccp(10,5)];
  }
  
  return self;
}

- (void) update {
  //if pathing is enabled
  if (self.is_pathing) {
  
    //compute the next position
    CGPoint new_position = [_ai position];
    
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
  _ai = [[CirclePathing alloc]initWithCenter:center angle:0 radius:radius velocity:self.speed.x];
  
  self->_is_pathing = YES;
}

@end
