//
//  AppDelegate.mm
//  pull
//
//  Created by Kyle Whittington on 3/11/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


#import "AppDelegate.h"
#import "CCBReader.h"

@implementation pullAppDelegate
@synthesize window=window_, glView=glView_, director=director_;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
  NSRect aFrame = [[NSScreen mainScreen] frame];
  
  CGSize winSize = CGSizeMake(WINDOW_WIDTH,WINDOW_HEIGHT);
  
  CC_DIRECTOR_INIT(winSize);
  [self.window showsResizeIndicator];
  
  CCDirectorMac *director = (CCDirectorMac*) [CCDirector sharedDirector];
  [director setResizeMode:kCCDirectorResize_AutoScale];
  [director setProjection:kCCDirectorProjection2D];
  
  // Enable "moving" mouse event. Default no.
  [window_ setAcceptsMouseMovedEvents:YES];
  [window_ setContentAspectRatio:NSMakeSize(winSize.width, winSize.height)];
  [window_ setStyleMask:[window_ styleMask] | NSResizableWindowMask | NSMiniaturizableWindowMask];
  [window_ setTitle:@"Boxman"];
  
//  TODO: Figure out what this does
  aFrame = [[NSScreen mainScreen] frame];
  if (aFrame.size.width <= winSize.width || aFrame.size.height <= winSize.height) [window_ zoom:self];
  [window_ center];
  [glView_ setFrameSize:NSMakeSize(window_.frame.size.width, window_.frame.size.height-22)];
  
  CCScene* mainScene = [CCBReader sceneWithNodeGraphFromFile:@"level_layer"];
  
  [director runWithScene:mainScene];
}

- (BOOL) applicationShouldTerminateAfterLastWindowClosed: (NSApplication *) theApplication
{
	return YES;
}

- (void)dealloc
{
	[[CCDirector sharedDirector] end];
	[window_ release];
	[super dealloc];
}

#pragma mark AppDelegate - IBActions

- (IBAction)toggleFullScreen: (id)sender
{
	CCDirectorMac *director = (CCDirectorMac*) [CCDirector sharedDirector];
	[director setFullScreen: ! [director isFullScreen] ];
}

@end
