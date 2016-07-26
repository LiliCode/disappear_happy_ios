//
//  GameMapViewController.m
//  disappear_happy_ios
//
//  Created by Lili on 16/7/23.
//  Copyright © 2016年 李立. All rights reserved.
//

#import "GameMapViewController.h"
#import "GameMapView.h"

@interface GameMapViewController ()
@property (weak, nonatomic) IBOutlet GameMapView *mapView;

@end

@implementation GameMapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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
        [self.mapView resetGame];
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




