//
//  GameSettingTableViewController.m
//  disappear_happy_ios
//
//  Created by 圈圈科技 on 16/7/27.
//  Copyright © 2016年 李立. All rights reserved.
//

#import "GameSettingTableViewController.h"
#import "GameSettingManager.h"
#import "UIAlertView+Extension.h"

@interface GameSettingTableViewController ()

@end

@implementation GameSettingTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}





#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row)
    {
        case 0:
            [GameSettingManager settingManager].maxScore = 0;
            [[UIAlertView alert:@"已清空!"] show];
            break;
            
        case 1:  break;
            
        case 2:  break;
            
        default: break;
    }
    
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





