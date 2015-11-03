//
//  GuardImageCell.h
//  happypy
//
//  Created by nnandzc on 15/10/27.
//  Copyright (c) 2015年 nnandzc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GuardHomeModel;
@interface GuardImageCell : UITableViewCell
@property (nonatomic, strong) GuardHomeModel *model;
+(id)GuardImageCellWithTableView:(UITableView *)tableView;
@end
