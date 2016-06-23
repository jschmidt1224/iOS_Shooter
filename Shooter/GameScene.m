#import "GameScene.h"

@interface GameScene ()
@property (nonatomic) SKSpriteNode * player;
@end

@implementation GameScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        // 2
        NSLog(@"Size: %@", NSStringFromCGSize(size));
        
        // 3
        self.backgroundColor = [SKColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        
        // 4
        self.player = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        self.player.xScale = .125;
        self.player.yScale = .125;
        self.player.zRotation = M_PI / -2;
        
        self.player.position = CGPointMake(100, 100);
        [self addChild:self.player];
        
    }
    return self;
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        [self setPlayerPosition:[touch locationInNode:self]];
    }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        [self setPlayerPosition:[touch locationInNode:self]];
    }
}

-(void)setPlayerPosition:(CGPoint) pos {
    self.player.position = pos;
}

@end