//
//  PathingAI.h
//  pull
//
//  Created by Kyle Whittington on 4/29/13.
//
//

#import <Foundation/Foundation.h>

@interface PathingAI : NSObject {
    // Will represent the time (in seconds) that this pathing AI started.
    double _starting_time;
    
    // Will represent the elapsed time since the pathing AI started.
    // The measurement is unknown, but as long as it's consistent, it's irrelevant
    ccTime _current_time;
}

@property (readonly) double starting_time;
@property (readonly) ccTime current_time;

/*
 * Will return the current position of this AI path based on the current time.
 *
 * @ensure  correct position is returned
 */
- (CGPoint) position;

- (double) computeDistance: (double) elapsed_seconds;

/*
 * Will return the current position given time interval dt.
 *
 * @require given.distance != nil && given.distance >= 0.0
 * @ensure correct position is returned
 */
- (CGPoint) currentPosition: (ccTime) dt;

/*
 * Computes the position based upon the parametric line between the start
 * and end points, and the given distance traveled between those points.
 *
 * @require given.disatnce != nil && 0.0 <= given.distance <= 1.0
 * @ensure  the correct x, y position is returned
 */
- (CGPoint) computePosition: (double) distance;

@end
