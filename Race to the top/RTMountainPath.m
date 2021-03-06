//
//  RTMountainPath.m
//  Race to the top
//
//  Created by Sakshi Jain on 05/11/14.
//
//

#import "RTMountainPath.h"
@import UIKit;

#define PATH_WIDTH 60

@implementation RTMountainPath

+(NSArray *)mountainPathsForRect : (CGRect)rect
{
//    NSMutableArray *variousPath = [@[] mutableCopy];
//   CGPoint firstPoint = CGPointMake(rect.size.width * (1/6.0), CGRectGetMaxY(rect));
//    CGPoint secondPoint = CGPointMake(rect.size.width * (1/3.0), rect.size.height * (5/6.0));
//    
//    UIBezierPath *labryinthPath = [UIBezierPath bezierPath];
//    labryinthPath.lineWidth = 4.0;
//    [labryinthPath moveToPoint: firstPoint];
//    [labryinthPath addLineToPoint: secondPoint];
//    
//    [variousPath addObject:labryinthPath];
//    
//    return variousPath;
    
        
    NSMutableArray *variousPaths = [@[] mutableCopy];
    
    // First Path
        
    CGPoint firstPoint = CGPointMake(rect.size.width * (1/6.0), CGRectGetMaxY(rect));
    CGPoint secondPoint = CGPointMake(rect.size.width * (1/3.0), rect.size.height * (5/6.0));
    CGPoint thirdPoint = CGPointMake(CGRectGetMaxX(rect), rect.size.height * (5/6.0));
    CGPoint fourthPoint = CGPointMake(CGRectGetMaxX(rect), rect.size.height * (2/3.0));
    CGPoint fifthPoint = CGPointMake(rect.size.width * (1/6.0), rect.size.height * (6/12.0));
//   CGPoint sixthPoint = CGPointMake(rect.size.width * (1/6.0), rect.size.height * (6/12.0));
    CGPoint seventhPoint = CGPointMake(rect.size.width * (1/3.0), rect.size.height * (2/6.0));
    CGPoint eigthPoint = CGPointMake(rect.size.width * (2/3.0), rect.size.height * (6/12.0));
    CGPoint ninthPoint = CGPointMake(rect.size.width * (11/20.0), rect.size.height * (5/24.0));
    CGPoint controlPoint = CGPointMake(rect.size.width * (6 / 8.0), rect.size.height * (1/ 3.0));
    
    // Second Path
        
    CGPoint firstPointForSecondPath = CGPointMake(rect.size.width * (1/6.0) - PATH_WIDTH, CGRectGetMaxY(rect));
    CGPoint secondPointForSecondPath = CGPointMake(rect.size.width * (1/3.0), rect.size.height * (5/6.0) - PATH_WIDTH);
    CGPoint thirdPointForSecondPath = CGPointMake(CGRectGetMaxX(rect) - PATH_WIDTH, rect.size.height * (5/6.0) - PATH_WIDTH);
    CGPoint fourthPointForSecondPath = CGPointMake(CGRectGetMaxX(rect)- PATH_WIDTH, rect.size.height * (2/3.0) + PATH_WIDTH);
    CGPoint fifthPointForSecondPath = CGPointMake(rect.size.width * (1/6.0) - PATH_WIDTH, rect.size.height * (6/12.0) + PATH_WIDTH / 2);
//   CGPoint sixthPointForSecondPath = CGPointMake(rect.size.width * (1/6.0) - PATH_WIDTH, rect.size.height * (6/12.0));
    CGPoint seventhPointForSecondPath = CGPointMake(rect.size.width * (1/3.0) - PATH_WIDTH / 4, rect.size.height * (2/6.0) - PATH_WIDTH);
    CGPoint eigthPointForSecondPath = CGPointMake(rect.size.width * (2/3.0) - PATH_WIDTH, rect.size.height * (6/12.0) - PATH_WIDTH);
    CGPoint ninthPointForSecondPath = CGPointMake(rect.size.width * (11/20.0) - PATH_WIDTH, rect.size.height * (5/24.0));
    CGPoint controlPointForSecondpath = CGPointMake(rect.size.width * (6 / 8.0) - PATH_WIDTH, rect.size.height * (1/ 3.0));
        
    UIBezierPath *rightMountainPath = [UIBezierPath bezierPath]; // alternative to alloc, init, nested method calls
    UIBezierPath *leftMountainPath = [UIBezierPath bezierPath];
        
    rightMountainPath.lineWidth = 4.0;
    leftMountainPath.lineWidth = 4.0;
        
    [rightMountainPath moveToPoint:firstPoint];
    [rightMountainPath addLineToPoint:secondPoint];
    [rightMountainPath addLineToPoint:thirdPoint];
    [rightMountainPath addLineToPoint:fourthPoint];
    [rightMountainPath addLineToPoint:fifthPoint];
//Fifth and sixth point has same coordinates
    //[rightMountainPath addLineToPoint:sixthPoint];
    [rightMountainPath addLineToPoint:seventhPoint];
    [rightMountainPath addLineToPoint:eigthPoint];

    [rightMountainPath addQuadCurveToPoint:ninthPoint controlPoint:controlPoint];

    [leftMountainPath moveToPoint:firstPointForSecondPath];
    [leftMountainPath addLineToPoint:secondPointForSecondPath];
    [leftMountainPath addLineToPoint:thirdPointForSecondPath];
    [leftMountainPath addLineToPoint:fourthPointForSecondPath];
    [leftMountainPath addLineToPoint:fifthPointForSecondPath];
    //Fifth and sixth point has same coordinates
    //[leftMountainPath addLineToPoint:sixthPointForSecondPath];
    [leftMountainPath addLineToPoint:seventhPointForSecondPath];
    [leftMountainPath addLineToPoint:eigthPointForSecondPath];
    
    [leftMountainPath addQuadCurveToPoint:ninthPointForSecondPath controlPoint:controlPointForSecondpath];
        
    [variousPaths addObject:rightMountainPath];
    [variousPaths addObject:leftMountainPath];
        
    return [variousPaths copy];
}

+(UIBezierPath *)tapTargetForPath : (UIBezierPath *)path
{
    CGPathRef tapTargetPath = CGPathCreateCopyByStrokingPath(path.CGPath, NULL, fmaxf(10.0f, path.lineWidth), path.lineCapStyle, path.lineJoinStyle, path.miterLimit);
    
    UIBezierPath *tapTarget = [UIBezierPath bezierPathWithCGPath:tapTargetPath];
    
    CGPathRelease(tapTargetPath);
    
    return tapTarget;
}

@end
