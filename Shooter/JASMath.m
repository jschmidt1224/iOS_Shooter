//
//  JASMath.m
//  Shooter
//
//  Created by Jason Schmidt on 7/13/16.
//  Copyright © 2016 Jason Schmidt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JASMath.h"

CGPoint CGPointAdd(CGPoint a, CGPoint b) {
    return CGPointMake(a.x + b.x, a.y + b.y);
}

CGPoint CGPointSub(CGPoint a, CGPoint b) {
    return CGPointMake(a.x - b.x, a.y - b.y);
}

CGPoint CGPointNormalize(CGPoint a) {
    CGFloat length = sqrt(a.x * a.x + a.y * a.y);
    return CGPointMake(a.x / length, a.y / length);
}

CGFloat CGPointNorm(CGPoint a) {
    return sqrt(a.x * a.x + a.y * a.y);
}

CGPoint CGPointMul(CGPoint a, CGFloat b) {
    return CGPointMake(a.x * b, a.y * b);
}

CGPoint CGPointDiv(CGPoint a, CGFloat b) {
    return CGPointMake(a.x / b, a.y / b);
}