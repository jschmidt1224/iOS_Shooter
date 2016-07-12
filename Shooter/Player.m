//
//  Player.m
//  Shooter
//
//  Created by Jason Schmidt on 6/22/16.
//  Copyright © 2016 Jason Schmidt. All rights reserved.
//

#import "Player.h"
#define SCALE .125

@implementation Player 

-(id)init {
    NSLog(@"Begining Init of Player");
    if (self = [super initWithImageNamed:@"Spaceship"]) {
        self.xScale = SCALE;
        self.yScale = SCALE;
        self.zRotation = M_PI / -2;
        self.position = CGPointMake(100, 100);
        _xSpeed = 0;
        _ySpeed = 0;
    }
    NSLog(@"Initialized Player");
    return self;
}

-(void)handleMoveTouch:(CGPoint) location {
    _xSpeed = (location.x - 100) / 10;
    _ySpeed = (location.y - 100) / 10;
    if (_xSpeed > 10)
        _xSpeed = 10;
    if (_ySpeed > 10)
        _ySpeed = 10;
}

-(void)handleShootTouch:(CGPoint) location {
    location.x -= (667 - 100);
    location.y -= 100;
    self.zRotation = atan2(-location.y, -location.x) + M_PI / 2;
    NSLog(@"%f", self.zRotation);
}

-(void)update {
    float newX = self.position.x + _xSpeed;
    float newY = self.position.y + _ySpeed;
    if (newX < 0)
        newX = 0;
    if (newX > 667)
        newX = 667;
    if (newY < 0)
        newY = 0;
    if (newY > 375)
        newY = 375;
    self.position = CGPointMake(newX, newY);
}


@end
