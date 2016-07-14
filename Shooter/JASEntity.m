//
//  JASEntity.m
//  Shooter
//
//  Created by Jason Schmidt on 7/12/16.
//  Copyright © 2016 Jason Schmidt. All rights reserved.
//

#import "JASEntity.h"
#import "JASMath.h"

@implementation JASEntity

-(id)init {
    if (self = [super init]) {
        self.X = CGPointMake(0, 0);
        self.V = CGPointMake(0, 0);
        self.A = CGPointMake(0, 0);
        self.ttl = -1;
    }
    return self;
}

-(void)update {
    if (self.ttl == 0) {
        [self removeFromParent];
    } else if (self.ttl > 0) {
        self.ttl -= 1;
    }
    self.X = CGPointAdd(self.X, self.V);
    self.V = CGPointAdd(self.V, self.A);
    self.position = self.X;
}
@end
