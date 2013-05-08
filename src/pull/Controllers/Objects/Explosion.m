//
//  Explosion.m
//  pull
//
//  Created by Kyle Whittington on 5/8/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Explosion.h"


@implementation Explosion

- (void) didLoadFromCCB {
  CCBAnimationManager* animationManager = self.userObject;
  animationManager.delegate = self;
}

- (void) completedAnimationSequenceNamed:(NSString*)name {
  self.isScheduledForRemoval = YES;
}

@end
