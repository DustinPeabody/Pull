//
//  Square.h
//  pull
//
//  Created by Kyle Whittington on 3/31/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Rectangle.h"

@interface Square : Rectangle {
}

-(Square*) initWithSize: (int) s;
-(void) setSize: (int) s;
-(int) size;

@end
