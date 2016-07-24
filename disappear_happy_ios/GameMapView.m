//
//  GameMapView.m
//  disappear_happy_ios
//
//  Created by Lili on 16/7/23.
//  Copyright © 2016年 李立. All rights reserved.
//

#import "GameMapView.h"
#import "GameSettingManager.h"
#import "BoxView.h"
#import "UIColor+BoxColor.h"
#import "Core/DHMap.h"



void alertMessage(String msg, MsgCode code)
{
    NSString *message = [NSString stringWithUTF8String:msg];
    NSLog(@"callback msg -> %@  msg code -> %d\n", message, code);
}


@interface GameMapView ()
@property (assign , nonatomic) Map map;

@end

@implementation GameMapView


- (void)awakeFromNib
{
    [super awakeFromNib];
    
    //创建地图数据
    self.map = createMap(alertMessage);
    //创建map UI
    [self layoutMapUI:self.map];
}

- (instancetype)init
{
    if (self = [super init])
    {
        //创建地图数据
        self.map = createMap(alertMessage);
        //创建map UI
        [self layoutMapUI:self.map];
    }
    
    return self;
}

- (void)layoutMapUI:(Map)map
{
    CGSize size = self.bounds.size;
    GameSettingManager *manager = [GameSettingManager settingManager];
    //计算方块的宽度
    CGFloat boxSize = (size.width - ((map.rect.size.width + 1) * manager.boxSpacing)) / map.rect.size.width;
    for (int y = 0; y < map.rect.size.height; y++)
    {
        for (int x = 0; x < map.rect.size.width; x++)
        {
            BoxView *boxView = [[BoxView alloc] init];
            boxView.frame = CGRectMake(manager.boxSpacing + (x*(boxSize+manager.boxSpacing)), manager.boxSpacing + (y*(boxSize+manager.boxSpacing)), boxSize, boxSize);
            Box *box = *(map.map_array + y) + x;    //获取map中的方块
            boxView.location = box->point;  //设置位置
            boxView.color = box->boxColor;  //设置颜色
            //点击的事件
            [boxView addTarget:self action:@selector(clickBox:) forControlEvents:UIControlEventTouchUpInside];
            //添加
            [self addSubview:boxView];
        }
    }
}

- (void)clickBox:(BoxView *)boxView
{
    NSLog(@"location: {%d , %d}", boxView.location.x, boxView.location.y);
    
    if (boxView.color.type == clr)
    {
        return;
    }
    
    clickMapPoint(self.map, boxView.location);
    
    //删除全部方块
    [self removeAllSubviews];
    //重新布局
    [self layoutMapUI:self.map];
}

- (void)removeAllSubviews
{
    for (UIView *subview in self.subviews)
    {
        [subview removeFromSuperview];
    }
}


- (void)dealloc
{
    //删除地图
    deleteMap(self.map);
}

@end




