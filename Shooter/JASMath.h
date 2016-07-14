//
//  JASMath.h
//  Shooter
//
//  Created by Jason Schmidt on 7/13/16.
//  Copyright © 2016 Jason Schmidt. All rights reserved.
//

#ifndef JASMath_h
#define JASMath_h

@import CoreGraphics;

CGPoint CGPointAdd(CGPoint a, CGPoint b);
CGPoint CGPointSub(CGPoint a, CGPoint b);
CGPoint CGPointNormalize(CGPoint a);
CGFloat CGPointNorm(CGPoint a);
CGPoint CGPointMul(CGPoint a, CGFloat b);
CGPoint CGPointDiv(CGPoint a, CGFloat b);

#endif /* JASMath_h */
