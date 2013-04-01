//
//  Square.m
//  pull
//
//  Created by Kyle Whittington on 3/31/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Square.h"


@implementation Square

-(Square*) initWithSize:(int)s {
  self = [super init];
  
  if (self) {
    [self setSize:s];
  }
  
  return self;
}

-(void) setSize:(int)s {
  self.width = s;
  self.height = s;
  
  
}

-(int) size {
  return self.width;
}

@end
