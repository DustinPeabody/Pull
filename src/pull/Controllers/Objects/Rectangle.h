//
//  Rectangle.h
//  pull
//
//  Created by Kyle Whittington on 3/31/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Rectangle : CCNode {
  int _width;
  int _height;
}

@property (nonatomic) int width;
@property (nonatomic) int height;

-(Rectangle*) initWithWidth: (int) w height: (int) h;
-(void) setWidth: (int) w height: (int) h;
-(void) print;

@end
