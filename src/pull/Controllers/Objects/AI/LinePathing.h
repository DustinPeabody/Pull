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
}

@property (readonly) CGPoint start_point;
@property (readonly) CGPoint end_point;
@property (readonly) double velocity;

- (id) initWithStartingPoint: (CGPoint) starting_point
                    endPoint: (CGPoint) end_point
                 andVelocity: (double) velocity;

/*
 * Computes the position based upon the parametric line between the start
 * and end points, and the given distance traveled between those points.
 *
 * @require given.distance != nil && given.distance >= 0.0
 * @ensure  the correct x, y position is returned
 */
- (CGPoint) currentPosition: (ccTime) dt;

@end
