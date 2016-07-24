//
//  GameSettingManager.h
//  disappear_happy_ios
//
//  Created by Lili on 16/7/23.
//  Copyright © 2016年 李立. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameSettingManager : NSObject<NSCopying, NSMutableCopying>
//格子间距
@property (assign , nonatomic) double boxSpacing;
//最大分数
@property (assign , nonatomic) double maxScore;



/**
 *  设置初始化
 *
 *  @return 返回当前对象
 */
+ (instancetype)settingManager;



@end
