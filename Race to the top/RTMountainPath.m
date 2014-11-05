//
//  RTMountainPath.m
//  Race to the top
//
//  Created by Sakshi Jain on 05/11/14.
//
//

#import "RTMountainPath.h"
@import UIKit;

@implementation RTMountainPath

+(NSArray *)mountainPathsForRect : (CGRect)rect
{
    NSMutableArray *variousPath = [@[] mutableCopy];
    CGPoint firstPoint = CGPointMake(rect.size.width * (1/6.0), CGRectGetMaxY(rect));
    CGPoint secondPoint = CGPointMake(rect.size.width * (1/3.0), rect.size.height * (5/6.0));
    
    UIBezierPath *labryinthPath = [UIBezierPath bezierPath];
    labryinthPath.lineWidth = 4.0;
    [labryinthPath moveToPoint: firstPoint];
    [labryinthPath addLineToPoint: secondPoint];
    
    [variousPath addObject:labryinthPath];
    
    return variousPath;
}

@end
