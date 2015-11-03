//
//  GuardImageCell.m
//  happypy
//
//  Created by nnandzc on 15/10/27.
//  Copyright (c) 2015年 nnandzc. All rights reserved.
//

#import "GuardImageCell.h"
#import "UITableViewCell+initcell.h"
#import "GuardHomeModel.h"
#import "ContentModel.h"

@interface GuardImageCell()
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *typeImage;

@end

@implementation GuardImageCell


+(id)GuardImageCellWithTableView:(UITableView *)tableView
{
    return [self cellWithTableView:tableView];
}

-(void)setModel:(GuardHomeModel *)model
{
    _model = model;
    [self.backImageView setImageWithURL:[NSURL URLWithString:model.content1.url]];
    self.titleLabel.text = model.content1.title;
    self.timeLabel.text = [NSString stringWithFormat:@"%@小时前", model.content1.time];
}

@end
