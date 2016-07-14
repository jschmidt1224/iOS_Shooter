#import "GameScene.h"
#import "JASPlayer.h"
#import "JASEntity.h"

@interface GameScene ()
@property UITouch*moveTouch;
@property UITouch *shootTouch;
@property JASPlayer *player;
@property NSMutableSet *childrenEntity;
@end

@implementation GameScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        NSLog(@"Size: %@", NSStringFromCGSize(size));
        self.view.multipleTouchEnabled = YES;
        
        self.backgroundColor = [SKColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        
        self.player = [[JASPlayer alloc] init];
        
        [self addChild:self.player];
        
    }
    return self;
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([touches count] > 0) {
        for (UITouch *touch in touches) {
            if (touch == self.moveTouch) {
                CGPoint point = [touch locationInNode:self];
                [self.player handleMoveTouch:point];
            }
            if (touch == self.shootTouch) {
                CGPoint point = [touch locationInNode:self];
                [self.player handleShootTouch:point];
            }
        }
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([touches count] > 0) {
        for (UITouch *touch in touches) {
            CGPoint point = [touch locationInNode:self];
            if (point.x < 200 && point.y < 200) {
                self.moveTouch = touch;
                [self.player handleMoveTouch:point];
            }
            if (point.x > self.size.width - 200 && point.y < 200) {
                self.shootTouch = touch;
                [self.player handleShootTouch:point];
                self.player.isTouched = YES;
            }
        }
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([touches count] > 0) {
        for (UITouch *touch in touches) {
            if (touch == self.moveTouch) {
                self.player.V = CGPointMake(0, 0);
            }
            if (touch == self.shootTouch) {
                self.player.isTouched = NO;
            }
        }
    }
}

-(void)update:(NSTimeInterval)currentTime {
    //NSLog(@"%d", self.children.count);
    for (JASEntity* entity in self.children) {
        [entity update];
    }
}


@end