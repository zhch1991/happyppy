//
//  PublicViewWithTableView.h
//  happypy
//
//  Created by nnandzc on 15/10/27.
//  Copyright (c) 2015年 nnandzc. All rights reserved.
//

#import <UIKit/UIKit.h>

//需显示的上拉或下拉
typedef NS_ENUM(NSUInteger, RefreshType)
{
    RefreshTypeHeader = 1,
    RefreshTypeFooter = 1 << 1,
    RefreshTypeAll = RefreshTypeHeader | RefreshTypeFooter,
};

//需显示的页面类型
typedef NS_ENUM(NSInteger, UIViewType) {
    UIViewTypeHomeTable = 0,
    UIViewTypeHotTable,
    UIViewTypeChannelTable,
    UIViewTypeDrawTable,
    UIViewTypeAlbumTable,
};

@class PublicViewWithTableView;

@protocol PublicViewWithTableViewDelegate <NSObject>
//上下拉刷新代理
-(void)HeaderRefreshWithPublicViewWithTableView:(PublicViewWithTableView *)view;
-(void)FooterRefreshWithPublicViewWithTableView:(PublicViewWithTableView *)view;
//点击事件代理
-(void)PublicViewWithTableView:(PublicViewWithTableView *)view ClickedOnTableIndexPath:(NSIndexPath *)indexPath sender:(id)sender ;
@end

@interface PublicViewWithTableView : UIView

@property (nonatomic, assign) UIViewType viewType;
@property (nonatomic, weak) NSArray *homeArray;
@property (nonatomic, weak) NSArray *albumArray;
@property (nonatomic, assign) RefreshType refershType;
@property (nonatomic ,weak) id<PublicViewWithTableViewDelegate> delegate;

@property (nonatomic,assign) NSInteger num;

+(id)PublicViewWithTableView;
-(void)endFooterRefresh;
-(void)endHeaderRefresh;

@end
