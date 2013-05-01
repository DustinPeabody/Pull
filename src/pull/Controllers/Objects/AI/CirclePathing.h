//
//  CirclePathing.h
//  pull
//
//  Created by Kyle Whittington on 4/29/13.
//
//

#import "PathingAI.h"

/*
 * Describes a path that orbits an object clockwise around the specified center,
 * at the specified rotational velocity.
 */
@interface CirclePathing : PathingAI {
  CGPoint _center;
  int _radius;
  double _velocity;
  double _distance;
}

@property (readonly) CGPoint center;
@property (readonly) int radius;
@property (readonly) double velocity;
@property (readonly) double distance;

/*
 * Will initialize this CirclePath with the given variables.
 */
- (id) initWithCenter: (CGPoint) center_point
               radius: (int) radius
             velocity: (double) velocity;

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
 * @require given.distance != nil && 0.0 <= given.distance
 * @ensure  the correct x, y position is returned
 */

- (CGPoint) currentPosition:(ccTime)dt;

/*
 * Computes the position based upon the parametric line between the start
 * and end points, and the given distance traveled between those points.
 *
 * @require given.disatnce != nil && 0.0 <= given.distance <= 1.0
 * @ensure  the correct x, y position is returned
 */
- (CGPoint) computePosition: (double) distance;

@end
