//
//  Player.h
//  Shooter
//
//  Created by Jason Schmidt on 6/22/16.
//  Copyright © 2016 Jason Schmidt. All rights reserved.
//

#import "JASEntity.h"

@interface JASPlayer : JASEntity
@property int shootCooldown;
@property int shootCounter;
@property BOOL isTouched;
-(void)handleMoveTouch:(CGPoint) location;
-(void)handleShootTouch:(CGPoint) location;
@end