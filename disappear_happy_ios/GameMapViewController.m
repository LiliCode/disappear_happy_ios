//
//  GameMapViewController.m
//  disappear_happy_ios
//
//  Created by Lili on 16/7/23.
//  Copyright © 2016年 李立. All rights reserved.
//

#import "GameMapViewController.h"
#import "GameMapView.h"
#import "GameSettingManager.h"

@interface GameMapViewController ()<GameMapDelegate>
@property (weak, nonatomic) IBOutlet GameMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (assign , nonatomic) NSInteger currentScore;
@property (weak, nonatomic) IBOutlet UILabel *maxScoreLabel;

@end

@implementation GameMapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mapView.delegate = self;
    self.maxScoreLabel.text = [NSString stringWithFormat:@"最高分数:%ld", [GameSettingManager settingManager].maxScore];
}

- (void)gameMapView:(GameMapView *)mapView currentScore:(NSInteger)score
{
    NSInteger total = score + self.currentScore;
    self.scoreLabel.text = [NSString stringWithFormat:@"当前分数:%ld", total];
    self.currentScore = total;
    //如果当前分数大于最大分数，就设置最大分数
    if(total > [GameSettingManager settingManager].maxScore)
    {
        [GameSettingManager settingManager].maxScore = total;
        self.maxScoreLabel.text = [NSString stringWithFormat:@"最高分数:%ld", total];
    }
}

/**
 *  重置成绩
 */
- (void)resetCurrenScore
{
    self.scoreLabel.text = @"当前分数:0";
    self.currentScore = 0;
}

- (IBAction)quitGameAction:(UIBarButtonItem *)sender
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"是否退出游戏" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alert addAction:ok];
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)resetGameAction:(UIBarButtonItem *)sender
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"是否重置游戏" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self.mapView resetGame];   //重置游戏
        [self resetCurrenScore];    //重置当前成绩
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alert addAction:ok];
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:nil];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (void)dealloc
{
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}

@end




