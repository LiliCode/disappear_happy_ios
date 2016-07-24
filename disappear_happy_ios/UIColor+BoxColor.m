//
//  UIColor+BoxColor.m
//  disappear_happy_ios
//
//  Created by Lili on 16/7/24.
//  Copyright © 2016年 李立. All rights reserved.
//

#import "UIColor+BoxColor.h"

@implementation UIColor (BoxColor)


+ (UIColor *)colorWithCColor:(Color *)cColor
{
    return [UIColor colorWithRed:cColor->R green:cColor->G blue:cColor->B alpha:cColor->alpha];
}


@end
