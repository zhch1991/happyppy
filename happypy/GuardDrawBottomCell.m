//
//  GuardDrawBottomCell.m
//  happypy
//
//  Created by nnandzc on 15/10/27.
//  Copyright (c) 2015年 nnandzc. All rights reserved.
//

#import "GuardDrawBottomCell.h"
#import "UITableViewCell+initcell.h"

@interface GuardDrawBottomCell()
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIButton *button6;

@end

@implementation GuardDrawBottomCell

+(id)GuardDrawBottomCellWithTableView:(UITableView *)tableView
{
    return [self cellWithTableView:tableView];
}

@end
