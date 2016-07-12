#import "GameScene.h"
#import "Player.h"

@interface GameScene () {
    UITouch* moveTouch;
    UITouch* shootTouch;
}
@property Player * player;
@end

@implementation GameScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        NSLog(@"Size: %@", NSStringFromCGSize(size));
        self.view.multipleTouchEnabled = YES;
        
        self.backgroundColor = [SKColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        NSLog(@"About to Init Player");
        
        self.player = [[Player alloc] init];
        
        [self addChild:self.player];
        
    }
    return self;
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([touches count] > 0) {
        for (UITouch *touch in touches) {
            if (touch == moveTouch) {
                CGPoint point = [touch locationInNode:self];
                [_player handleMoveTouch:point];
            }
            if (touch == shootTouch) {
                CGPoint point = [touch locationInNode:self];
                [_player handleShootTouch:point];
            }
        }
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([touches count] > 0) {
        for (UITouch *touch in touches) {
            CGPoint point = [touch locationInNode:self];
            if (point.x < 200 && point.y < 200) {
                moveTouch = touch;
                [_player handleMoveTouch:point];
            }
            if (point.x > self.size.width - 200 && point.y < 200) {
                shootTouch = touch;
                [_player handleShootTouch:point];
            }
        }
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([touches count] > 0) {
        for (UITouch *touch in touches) {
            if (touch == moveTouch) {
                self.player.xSpeed = 0;
                self.player.ySpeed = 0;
            }
        }
    }
}

//-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    for (UITouch *touch in touches) {
//        [_player handleTouch:[touch locationInNode:self]];
//    }
//}
//
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    for (UITouch *touch in touches) {
//        [_player handleTouch:[touch locationInNode:self]];
//    }
//}
//
//-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    for (UITouch *touch in touches) {
//        self.player.xSpeed = 0;
//        self.player.ySpeed = 0;
//    }
//}

-(void)update:(NSTimeInterval)currentTime {
    //NSLog(@"updating");
    [_player update];
}


@end