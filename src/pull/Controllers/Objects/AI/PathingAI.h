//
//  PathingAI.h
//  pull
//
//  Created by Kyle Whittington on 4/29/13.
//
//

#import <Foundation/Foundation.h>

@interface PathingAI : NSObject {
    
    // Will represent the elapsed time since the pathing AI started.
    // The measurement is unknown, but as long as it's consistent, it's irrelevant
    ccTime _current_time;
}

@property (readonly) ccTime current_time;

/*
 * Will return the current position given time interval dt.
 *
 * @require given.distance != nil && given.distance >= 0.0
 * @ensure correct position is returned
 */
- (CGPoint) currentPosition: (ccTime) dt;

@end
