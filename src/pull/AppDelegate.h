//
//  AppDelegate.h
//  pull
//
//  Created by Kyle Whittington on 3/11/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//

#import "cocos2d.h"

#define WINDOW_WIDTH 480
#define WINDOW_HEIGHT 700

@interface pullAppDelegate : NSObject <NSApplicationDelegate>
{
	NSWindow	*window_;
	CCGLView	*glView_;
  CCDirectorMac *director_;
}

@property (assign) IBOutlet NSWindow	*window;
@property (assign) IBOutlet CCGLView	*glView;
@property (readonly) CCDirectorMac *director;

- (IBAction)toggleFullScreen:(id)sender;

@end
