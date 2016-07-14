//
//  Player.m
//  Shooter
//
//  Created by Jason Schmidt on 6/22/16.
//  Copyright © 2016 Jason Schmidt. All rights reserved.
//

#import "JASPlayer.h"
#import "JASMath.h"
#import "JASBullet.h"
#define SCALE .125

@implementation JASPlayer

-(id)init {
    if (self = [super init]) {
        self.texture = [SKTexture textureWithImageNamed:@"Spaceship"];
        self.size = self.texture.size;
        self.anchorPoint = CGPointMake(0.5, 0.5);
        self.xScale = SCALE;
        self.yScale = SCALE;
        self.zRotation = M_PI / -2;
        self.X = CGPointMake(100, 100);
        self.shootCooldown = 2;
        self.shootCounter = self.shootCooldown;
    }
    return self;
}

-(void)handleMoveTouch:(CGPoint) location {
    CGPoint center = CGPointMake(100 ,100);
    CGPoint delta = CGPointSub(location, center);
    CGFloat norm = CGPointNorm(delta) / 10;
    if (norm > 100.0) {
        norm = 100.0;
    }
    self.V = CGPointMul(CGPointNormalize(delta), norm);
}

-(void)handleShootTouch:(CGPoint) location {
    location.x -= (667 - 100);
    location.y -= 100;
    self.zRotation = atan2(-location.y, -location.x) + M_PI / 2;
}

-(void)update {
    [super update];
    JASBullet *bullet;
    CGPoint direction = CGPointMake(cos(self.zRotation + M_PI / 2), sin(self.zRotation + M_PI / 2));
    if (self.shootCounter <= 0 && self.isTouched) {
        self.shootCounter = self.shootCooldown;
        bullet = [[JASBullet alloc] init];
        bullet.V = CGPointMul(CGPointNormalize(direction), 20);
        bullet.X = self.X;
        bullet.zRotation = self.zRotation;
        [self.parent addChild:bullet];
    }
    self.shootCounter -= 1;
}


@end
