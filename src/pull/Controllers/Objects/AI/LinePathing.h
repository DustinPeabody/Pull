//
//  LinePathing.h
//  pull
//
//  Created by Kyle Whittington on 4/29/13.
//
//

#import "PathingAI.h"

@interface LinePathing : PathingAI {
  CGPoint _start_point;
  CGPoint _end_point;
  double _velocity;
  double _distance;
}

@property (readonly) CGPoint start_point;
@property (readonly) CGPoint end_point;
@property (readonly) double velocity;
@property (readonly) double distance;

/*
 * Will return the current position of this AI path based on the current time.
 *
 * @ensure  correct position is returned
 */
- (CGPoint) position;

- (double) computeDistance: (double) elapsed_seconds;

/*
 * Computes the position based upon the parametric line between the start
 * and end points, and the given distance traveled between those points.
 *
 * @require given.distance != nil && given.distance >= 0.0
 * @ensure  the correct x, y position is returned
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
