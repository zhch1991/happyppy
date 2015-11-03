//
//  PublicHeaderView.m
//  happypy
//
//  Created by nnandzc on 15/10/27.
//  Copyright (c) 2015年 nnandzc. All rights reserved.
//

#import "PublicHeaderView.h"

@interface PublicHeaderView()
@property (nonatomic, weak) UIView *TopView;
@property (nonatomic, weak) UIView *sectionView;
//内容label的高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentLabelHeight;
//sectionView的高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ViewTobottomHeight;
@property (weak, nonatomic) IBOutlet UIView *bottomSepratorView;
@end

@implementation PublicHeaderView

//从xib中获取控件
+(id)PublicHeaderView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"PublicHeaderView" owner:nil options:nil] lastObject];
}

//段选接口
-(void)setTopView:(UIView *)TopView
{
    _TopView = TopView;
    [self addSubview:TopView];
    TopView.frame = CGRectMake(0, 0, ScreenWidth, 140);
}

//顶部视图接口
-(void)setSectionView:(UIView *)sectionView
{
    _sectionView = sectionView;
    [self addSubview:sectionView];
    
    CGFloat X = 0;
    CGFloat Y = CGRectGetMaxY(self.bottomSepratorView.frame);
    CGFloat W = ScreenWidth;
    CGFloat H = 40;
    sectionView.frame = CGRectMake(X, Y, W, H);
}

//设置数据，根据数据填UI，计算contentlabel高度，判断是否有Section，据此计算headerView的高度，设置完数据之后才得到高度
-(void)setDataArray:(NSArray *)dataArray
{
}

-(void)willMoveToSuperview:(UIView *)newSuperview
{
    
}


@end
