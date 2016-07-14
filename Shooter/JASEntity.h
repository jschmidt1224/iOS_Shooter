//
//  JASEntity.h
//  Shooter
//
//  Created by Jason Schmidt on 7/12/16.
//  Copyright © 2016 Jason Schmidt. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface JASEntity : SKSpriteNode
@property CGPoint X;
@property CGPoint V;
@property CGPoint A;
@property int ttl;
-(void)update;
@end
