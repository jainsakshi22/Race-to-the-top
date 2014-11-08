//
//  RTPathView.m
//  Race to the top
//
//  Created by Sakshi Jain on 06/11/14.
//
//

#import "RTPathView.h"
#import "RTMountainPath.h"

@implementation RTPathView

//Purpose of this method here? as we wil never call this method from story board, we are actuall archiving it from storyboard
//-(id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self)
//    {
//        [self setup];
//    }
//    return self;
//}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self setup];
    }
    return self;
}

-(void)setup
{
    self.backgroundColor = [UIColor clearColor];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    for (UIBezierPath *path in [RTMountainPath mountainPathsForRect:self.bounds]) {
        [[UIColor blackColor] setStroke];
        [path stroke];
    }
}


@end
