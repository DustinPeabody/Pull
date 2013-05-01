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

- (id) init {
  self = [super init];
  
  if (self) {
    //be default we'll want the ememies to move for now
    _is_pathing = NO;
    
    [self setHorizontalSpeed:EnemySpeed andVerticalSpeed:EnemySpeed];
  }
  
  return self;
}

@end
