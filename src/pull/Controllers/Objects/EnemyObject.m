//
//  EnemyObject.m
//  pull
//
//  Created by Kyle Whittington on 4/29/13.
//
//

#import "EnemyObject.h"

#define EnemySpeed 1

@implementation EnemyObject

@synthesize is_pathing = _is_pathing;
@synthesize is_pulled = _is_pulled;

- (id) init {
  self = [super init];
  
  if (self) {
    //by default:
    _is_pathing = NO; //we don't want the enemies to move
    _is_pulled = NO;  //or be pulled
    
    [self setHorizontalSpeed:EnemySpeed andVerticalSpeed:EnemySpeed];
  }
  
  return self;
}

@end
