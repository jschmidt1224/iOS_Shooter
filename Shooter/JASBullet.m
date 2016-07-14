//
//  JASBullet.m
//  Shooter
//
//  Created by Jason Schmidt on 7/13/16.
//  Copyright © 2016 Jason Schmidt. All rights reserved.
//

#import "JASBullet.h"

@implementation JASBullet

-(id)init {
    if (self = [super init]) {
        self.ttl = 100;
        self.texture = [SKTexture textureWithImageNamed:@"Spaceship"];
        self.size = self.texture.size;
        self.anchorPoint = CGPointMake(0.5, 0.5);
        self.xScale = .125/8;
        self.yScale = .125/2;
        self.zRotation = M_PI / -2;
    }
    return self;
}
@end
