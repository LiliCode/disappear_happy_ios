//
//  BoxView.h
//  disappear_happy_ios
//
//  Created by Lili on 16/7/23.
//  Copyright © 2016年 李立. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Core/Rect.h"
#import "Core/Color.h"

@interface BoxView : UIButton
//位置
@property (assign , nonatomic) DHPoint location;
//颜色
@property (assign , nonatomic) Color color;


@end
