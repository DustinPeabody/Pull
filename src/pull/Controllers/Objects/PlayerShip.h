//
//  PlayerShip.h
//  pull
//
//  Created by Kyle Whittington on 3/30/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "GameObject.h"
#import "EnemyObject.h"

@interface PlayerShip : GameObject {
  // will store the player's pulled enemies as ammo
  NSMutableArray* _ammo_slot;
  
  BOOL _is_hit;
}

@property (readonly) NSMutableArray* ammo_slot;
@property (readonly) BOOL is_hit;

/*
 * Will return the top-most enemy in the ammo slot.
 * @ensure  return this.ammo_slot.last
 */
- (EnemyObject*) nextEnemy;

/*
 * Will add the given Enemy to this PlayerShip's ammo slot.
 * @require this.ammo_slot.count < 4
 * @ensure  this.ammo_slot.count == old.count + 1
 */
- (void) pullEnemy:(EnemyObject*) enemy;

/*
 * Will remove the top-most ammo from this.ammo_slot.
 * @require this.ammo_slot.count > 0
 * @ensure this.ammo_slot.count == old.count - 1
 */
- (void) pushEnemy;

- (void) hitByEnemy;
- (void) hitRegistered;
@end
