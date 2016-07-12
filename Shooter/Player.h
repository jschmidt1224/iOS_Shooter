//
//  Player.h
//  Shooter
//
//  Created by Jason Schmidt on 6/22/16.
//  Copyright © 2016 Jason Schmidt. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Player : SKSpriteNode
@property float xSpeed;
@property float ySpeed;
-(void)handleMoveTouch:(CGPoint) location;
-(void)handleShootTouch:(CGPoint) location;
-(void)update;
@end