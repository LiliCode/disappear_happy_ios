//
//  UIAlertView+Extension.h
//  disappear_happy_ios
//
//  Created by Lili on 16/7/26.
//  Copyright © 2016年 李立. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (Extension)

/**
 *  弹出一个alert消息
 *
 *  @param msg 消息
 *
 *  @return 返回当前alert框
 */
+ (instancetype)alert:(NSString *)msg;

/**
 *  弹出一个alert消息
 *
 *  @param msg      消息
 *  @param target   代理
 *
 *  @return 返回当前alert框
 */
+ (instancetype)alert:(NSString *)msg target:(id<UIAlertViewDelegate>)target;

@end
