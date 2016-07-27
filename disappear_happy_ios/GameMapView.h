//
//  GameMapView.h
//  disappear_happy_ios
//
//  Created by Lili on 16/7/23.
//  Copyright © 2016年 李立. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GameMapView;
@protocol GameMapDelegate <NSObject>

- (void)gameMapView:(GameMapView *)mapView currentScore:(NSInteger)score;

@end


@interface GameMapView : UIView

@property (weak , nonatomic) id<GameMapDelegate> delegate;

/**
 *  重置游戏
 */
- (void)resetGame;


@end
