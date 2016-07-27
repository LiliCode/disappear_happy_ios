//
//  GameHomeViewController.m
//  disappear_happy_ios
//
//  Created by Lili on 16/7/23.
//  Copyright © 2016年 李立. All rights reserved.
//

#import "GameHomeViewController.h"

@interface GameHomeViewController ()

@end

@implementation GameHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

- (IBAction)startGameAction:(UIButton *)sender
{
    [self performSegueWithIdentifier:@"goto_game_interface" sender:nil];
}


- (IBAction)gameSettingAction:(UIButton *)sender
{
    [self performSegueWithIdentifier:@"setting" sender:nil];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}


@end


