//
//  BoxView.m
//  disappear_happy_ios
//
//  Created by Lili on 16/7/23.
//  Copyright © 2016年 李立. All rights reserved.
//

#import "BoxView.h"
#import "UIColor+BoxColor.h"

@implementation BoxView

- (void)setColor:(Color )color
{
    _color = color;
    self.backgroundColor = [UIColor colorWithCColor:&color];
}




@end
