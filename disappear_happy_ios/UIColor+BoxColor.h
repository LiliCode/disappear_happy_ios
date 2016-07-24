//
//  UIColor+BoxColor.h
//  disappear_happy_ios
//
//  Created by Lili on 16/7/24.
//  Copyright © 2016年 李立. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Core/Color.h"

@interface UIColor (BoxColor)

/**
 *  C Color转换成OC Color
 *
 *  @param cColor c Color
 *
 *  @return 返回OC Color
 */
+ (UIColor *)colorWithCColor:(Color *)cColor;


@end
