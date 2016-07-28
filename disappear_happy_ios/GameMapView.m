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
#import "UIAlertView+Extension.h"
#import "Core/DHMap.h"


#define Debug   (0)


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
    
    [self initGame];
}

- (instancetype)init
{
    if (self = [super init])
    {
        [self initGame];
    }
    
    return self;
}

- (void)initGame
{
    //创建地图数据
    self.map = createMap(alertMessage);
    //创建map UI
    [self layoutMapUI:self.map];
}

- (void)layoutMapUI:(Map)map
{
#if Debug
    printf("----------------------------------\n");
#endif
    for (int y = 0; y < map.rect.size.height; y++)
    {
        for (int x = 0; x < map.rect.size.width; x++)
        {
            BoxView *boxView = [[BoxView alloc] init];
            boxView.frame = [self boxViewFrameWithPoint:pointMake(x, y)];
            Box *box = *(map.map_array + y) + x;    //获取map中的方块
            boxView.location = box->point;  //设置位置
            boxView.color = box->boxColor;  //设置颜色
            boxView.tag = box->tag; //设置tag
            //点击的事件
            [boxView addTarget:self action:@selector(clickBox:) forControlEvents:UIControlEventTouchUpInside];
            //添加
            [self addSubview:boxView];
#if Debug
            printf("{%d , %d}",box->point.x, box->point.y);
#endif
        }
#if Debug
        printf("\n");
#endif
    }
#if Debug
    printf("----------------------------------\n");
#endif
}

/**
 *  重置游戏
 */
- (void)resetGame
{
    [self removeAllSubviews];
    [self initGame];
}

- (void)clickBox:(BoxView *)boxView
{
    NSLog(@"location: {%d , %d}", boxView.location.x, boxView.location.y);
    
    if (boxView.color.type == clr)
    {
        return;
    }
    
    //点击 并获取本次成绩
    NSInteger score = clickMapPoint(self.map, boxView.location);
    if(score && [self.delegate respondsToSelector:@selector(gameMapView:currentScore:)])
    {
        [self.delegate gameMapView:self currentScore:score];
    }
    
    //重布局
    [self resetLayoutMap:self.map];
    
    if (isGameover(self.map))
    {
        [[UIAlertView alert:@"游戏结束!"] show];
    }
}


- (void)resetLayoutMap:(Map)map
{
    for (BoxView *boxView in self.subviews)
    {
        Box box = getBox(map, boxView.tag);
        boxView.color = box.boxColor;
        boxView.location = box.point;
//        [UIView animateWithDuration:.3 animations:^{
//            boxView.frame = [self boxViewFrameWithPoint:box.point];
//        }];
        [UIView animateWithDuration:.3 delay:0 usingSpringWithDamping:.5 initialSpringVelocity:0 options:0 animations:^{
            boxView.frame = [self boxViewFrameWithPoint:box.point];
        } completion:nil];
    }
}


- (CGRect)boxViewFrameWithPoint:(DHPoint)point
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    GameSettingManager *manager = [GameSettingManager settingManager];
    //计算方块的宽度
    CGFloat boxSize = (size.width - ((self.map.rect.size.width + 1) * manager.boxSpacing)) / self.map.rect.size.width;
    return CGRectMake(manager.boxSpacing + (point.x*(boxSize+manager.boxSpacing)), manager.boxSpacing + (point.y*(boxSize+manager.boxSpacing)), boxSize, boxSize);
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




