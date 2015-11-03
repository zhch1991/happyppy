//
//  PublicAlbumTableViewCell.m
//  happypy
//
//  Created by nnandzc on 15/10/27.
//  Copyright (c) 2015年 nnandzc. All rights reserved.
//

#import "PublicAlbumTableViewCell.h"
#import "UITableViewCell+initcell.h"
#import "PublicAlbumModel.h"
#import "ContentModel.h"
#import "PublicUidModel.h"
#import "UIViewAdditions.h"
#import "NSString+Frame.h"
#import "publicCellImageFrameView.h"
#import "PublicCellTracingFrameView.h"

@interface PublicAlbumTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
//@property (weak, nonatomic) IBOutlet UIImageView *contentImage1;
//@property (weak, nonatomic) IBOutlet UIImageView *contentImage2;
//@property (weak, nonatomic) IBOutlet UIImageView *contentImage3;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel2;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel3;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *uid0;
@property (weak, nonatomic) IBOutlet UIImageView *uid1;
@property (weak, nonatomic) IBOutlet UIImageView *uid2;
@property (weak, nonatomic) IBOutlet UIImageView *uid3;
@property (weak, nonatomic) IBOutlet UIImageView *uid4;
@property (weak, nonatomic) IBOutlet UIImageView *uid5;
@property (weak, nonatomic) IBOutlet UIImageView *uid6;
@property (weak, nonatomic) IBOutlet UIImageView *uid7;
@property (weak, nonatomic) IBOutlet UIImageView *uid8;

@property (weak, nonatomic) IBOutlet UIButton *segueButton;

@property (weak, nonatomic) IBOutlet UIButton *share;
@property (weak, nonatomic) IBOutlet UIButton *action;
@property (weak, nonatomic) IBOutlet UIButton *zan;
@property (weak, nonatomic) IBOutlet UIButton *message;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentLabelHeight;
@property (weak, nonatomic) IBOutlet UIView *imageFrameView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ImageFrameViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameLabel2Width;

@end

@implementation PublicAlbumTableViewCell

+(id)PublicAlbumTableViewCellWithTableView:(UITableView *)tableView
{
    return [self cellWithTableView:tableView];
}

-(void)setModel:(PublicAlbumModel *)model
{
    _model = model;
    [self createUI];
}

-(void)createUI
{
    PublicUidModel *uidModel = [self UidModelByUid:self.model.uid];
    [self.iconImageView setImageWithURL:[NSURL URLWithString:uidModel.portrait]];
    self.nameLabel.text = uidModel.nickname;
    self.timeLabel.text =[NSString stringWithFormat:@"%@", self.model.content1.time];
    self.nameLabel2.text = self.model.channelName;
    self.nameLabel2Width.constant = [self.model.channelName widthWithFont:[UIFont systemFontOfSize:17]] + 20;
    self.contentLabel.text = self.model.content1.word;
    
    self.contentLabelHeight.constant = [self.model.content1.word heightWithFont:[UIFont systemFontOfSize:17] withinWidth:self.contentLabel.width];
    
    if([self.model.ftype isEqualToString:@"pic"])
    {
        self.ImageFrameViewHeight.constant = 100;
        self.imageFrameView.hidden = NO;
        publicCellImageFrameView *picFrameView = [publicCellImageFrameView publicCellImageFrameView];
        [self.imageFrameView addSubview:picFrameView];
        NSArray *imageViewArray = @[picFrameView.imageView0, picFrameView.imageView1, picFrameView.imageView2];
            for(int i = 0; i < self.model.picArray.count; i++)
            {
                NSString *url = self.model.picArray[i];
                UIImageView *imageView = imageViewArray[i];
                [imageView setImageWithURL:[NSURL URLWithString:url]];
            }
        
    }
    else if([self.model.ftype isEqualToString:@"talk"])
    {
        self.ImageFrameViewHeight.constant = 0;
        self.imageFrameView.hidden = YES;
    }
    else if([self.model.ftype isEqualToString:@"tracing"])
    {
        self.ImageFrameViewHeight.constant = 250;
        self.imageFrameView.hidden = NO;
        PublicCellTracingFrameView *tracingFrameView = [PublicCellTracingFrameView PublicCellTracingFrameView];
        [self.imageFrameView addSubview:tracingFrameView];
        [tracingFrameView.imageView setImageWithURL:[NSURL URLWithString:self.model.content1.url]];
    }

    NSArray *uidViewArray = @[self.uid0, self.uid1, self.uid2, self.uid3, self.uid4, self.uid5, self.uid6, self.uid7, self.uid8];
    
    for (int i = 0; i < self.model.likeUids1.count && i < 9; i++) {
        UIImageView *imageView = uidViewArray[i];
        [imageView setImageWithURL:[NSURL URLWithString:[self UidModelByUid:self.model.likeUids1[i]].portrait ]];
    }


}

-(PublicUidModel *)UidModelByUid:(NSNumber *)uid
{
    for(PublicUidModel * model in self.model.uidArray)
    {
        if(model.uid.integerValue == uid.integerValue)
        {
            return  model;
        }
    }
    return nil;
}
@end
