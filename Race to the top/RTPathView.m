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
