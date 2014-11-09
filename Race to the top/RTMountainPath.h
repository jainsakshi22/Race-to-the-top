//
//  RTMountainPath.h
//  Race to the top
//
//  Created by Sakshi Jain on 05/11/14.
//
//

#import <Foundation/Foundation.h>
//#include <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@interface RTMountainPath : NSObject

+(NSArray *)mountainPathsForRect : (CGRect)rect;

+(UIBezierPath *)tapTargetForPath : (UIBezierPath *)path;

@end
