//
//  UIColor+Colors.m
//  Layout
//
//  Created by jiangmm on 16/12/12.
//  Copyright © 2016年 jchvip.rch. All rights reserved.
//

#import "UIColor+Colors.h"

@implementation UIColor (Colors)
+(UIColor *)colorFromHexString:(NSString *)hexString
{
    unsigned rgbValue = 0;
    hexString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}
@end
