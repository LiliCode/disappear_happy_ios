//
//  GameSettingManager.m
//  disappear_happy_ios
//
//  Created by Lili on 16/7/23.
//  Copyright © 2016年 李立. All rights reserved.
//

#import "GameSettingManager.h"

@implementation GameSettingManager

static GameSettingManager *manager = nil;

+ (instancetype)settingManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    
    return manager;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t alloc_token;
    dispatch_once(&alloc_token, ^{
        manager = [super allocWithZone:zone];
    });
    
    return manager;
}

- (id)copyWithZone:(NSZone *)zone
{
    return manager;
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    return manager;
}

- (instancetype)init
{
    if (self = [super init])
    {
        self.maxScore = [self integerForKey:@"MaxScore"];
        self.boxSpacing = 1.0f;
    }
    
    return self;
}


- (void)setMaxScore:(NSInteger)maxScore
{
    _maxScore = maxScore;
    //保存文件系统
    [self setInteger:maxScore forKey:@"MaxScore"];
}


- (void)setInteger:(NSInteger)score forKey:(NSString *)key
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setInteger:score forKey:key];
    [ud synchronize];
}

- (NSInteger)integerForKey:(NSString *)key
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    return [ud integerForKey:key];
}

@end





