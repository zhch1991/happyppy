//
//  PublicAlbumTableViewCell.h
//  happypy
//
//  Created by nnandzc on 15/10/27.
//  Copyright (c) 2015年 nnandzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PublicAlbumModel;
@interface PublicAlbumTableViewCell : UITableViewCell
@property (nonatomic, strong) PublicAlbumModel *model;
+(id)PublicAlbumTableViewCellWithTableView:(UITableView *)tableView;
@end
