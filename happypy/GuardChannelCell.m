//
//  GuardChannelCell.m
//  happypy
//
//  Created by nnandzc on 15/10/27.
//  Copyright (c) 2015年 nnandzc. All rights reserved.
//

#import "GuardChannelCell.h"
#import "UITableViewCell+initcell.h"
@interface GuardChannelCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;

@end

@implementation GuardChannelCell

+(id)GuardChannelCellWithTableView:(UITableView *)tableView
{
    return [self cellWithTableView:tableView];
}

@end
