//
//  UIAlertView+Extension.m
//  disappear_happy_ios
//
//  Created by Lili on 16/7/26.
//  Copyright © 2016年 李立. All rights reserved.
//

#import "UIAlertView+Extension.h"

@implementation UIAlertView (Extension)

+ (instancetype)alert:(NSString *)msg
{
    return [[self alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
}

+ (instancetype)alert:(NSString *)msg target:(id<UIAlertViewDelegate>)target
{
    return [[self alloc] initWithTitle:nil message:msg delegate:target cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
}


@end
