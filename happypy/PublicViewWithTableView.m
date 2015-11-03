//
//  PublicViewWithTableView.m
//  happypy
//
//  Created by nnandzc on 15/10/27.
//  Copyright (c) 2015年 nnandzc. All rights reserved.
//

#import "PublicViewWithTableView.h"
#import "GuardImageCell.h"
#import "GuardChannelCell.h"
#import "PublicHeaderView.h"
#import "GuardDrawBottomCell.h"
#import "GuardDrawTopCell.h"
#import "PublicHeaderViewWithScrollView.h"
#import "GuardHomeModel.h"
#import "SegueSender.h"
#import "PublicAlbumModel.h"
#import "PublicAlbumTableViewCell.h"
#import "NSString+Frame.h"
#import "ContentModel.h"


@interface PublicViewWithTableView() <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) UITableView *tableView;
@end

@implementation PublicViewWithTableView

#pragma mark -- 返回实例的类方法
+(id)PublicViewWithTableView
{
    return [[self alloc] init];
}

#pragma mark -- 各页数据设置方法
-(void)setHomeArray:(NSArray *)homeArray
{
    _homeArray = homeArray;
    [_tableView reloadData];
}

-(void)setAlbumArray:(NSArray *)albumArray
{
    _albumArray = albumArray;
    [_tableView reloadData];
}

#pragma mark -- 本页面入口
-(void)willMoveToSuperview:(UIView *)newSuperview
{
    self.backgroundColor = [self randomColor];
    [self createTableView];
}

#pragma mark -- 上下拉刷新
-(void)setRefershType:(RefreshType)refershType
{
    _refershType = refershType;
    if(refershType & RefreshTypeHeader){
        self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
    }
    
    if(refershType & RefreshTypeFooter){
        self.tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefresh)];
    }
}

-(void)headerRefresh
{
    NSLog(@"headerRefresh in ");
    [self.delegate HeaderRefreshWithPublicViewWithTableView:self];
}

-(void)footerRefresh
{
    NSLog(@"footerRefresh in");
    [self.delegate FooterRefreshWithPublicViewWithTableView:self];
}

-(void)endHeaderRefresh
{
    NSLog(@"endHeaderRefresh");
    [_tableView.header endRefreshing];
//    NSLog(@"num = %ld", self.num);
}

-(void)endFooterRefresh
{
    NSLog(@"endFooterRefresh");
    [_tableView.footer endRefreshing];
}

#pragma mark -- 控件
-(void)createTableView
{
   UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, ScreenWidth, ScreenHeight - 64 - 44) style:UITableViewStylePlain];
    if(self.viewType == UIViewTypeHotTable)
    {
        PublicHeaderViewWithScrollView *headerView = [PublicHeaderViewWithScrollView PublicHeaderViewWithScrollView];
        CGFloat Height = CGRectGetMaxY(headerView.frame);
        tableView.contentInset = UIEdgeInsetsMake(Height, 0, 0, 0);
        headerView.frame = CGRectMake(0, -Height, ScreenWidth, headerView.frame.size.height);
        tableView.header.frame = CGRectMake(0, -Height, ScreenWidth, tableView.header.frame.size.height);
        [tableView addSubview:headerView];
        
    }
    if(self.viewType == UIViewTypeAlbumTable)
    {
        tableView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    }
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.dataSource = self;
    tableView.delegate = self;
    [self addSubview:tableView];
    self.tableView = tableView;
}

#pragma mark -- UITableViewDelegate/UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    switch (self.viewType) {
        case UIViewTypeDrawTable:
            return 2;
        default:
            return 1;
    }
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (self.viewType) {
        case UIViewTypeDrawTable:
            return 1;
        case UIViewTypeHomeTable:
            return self.homeArray.count;
        case UIViewTypeAlbumTable:
            return self.albumArray.count;
        case UIViewTypeHotTable:
            return self.albumArray.count;
        default:
            return 10;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if(self.viewType == UIViewTypeHomeTable)
    {
        GuardImageCell *homeCell = [GuardImageCell GuardImageCellWithTableView:tableView];
        GuardHomeModel *model = self.homeArray[indexPath.row];
        homeCell.model = model;
        cell = homeCell;
    }
    else if(self.viewType == UIViewTypeAlbumTable || self.viewType == UIViewTypeHotTable)
    {
        PublicAlbumTableViewCell *albumCell = [PublicAlbumTableViewCell PublicAlbumTableViewCellWithTableView:tableView];
        PublicAlbumModel *model = self.albumArray[indexPath.row];
        albumCell.model = model;
        cell = albumCell;
    }
    else if(self.viewType == UIViewTypeChannelTable)
    {
        cell = [GuardChannelCell GuardChannelCellWithTableView:tableView];
    }
    else if(self.viewType == UIViewTypeDrawTable)
    {
        if(indexPath.section == 0)
        {
            cell = [GuardDrawTopCell GuardDrawTopCellWithTableView:tableView];
        }
        if(indexPath.section == 1)
        {
            cell = [GuardDrawBottomCell GuardDrawBottomCellWithTableView:tableView];
        }
    }
    else
    {
        cell = [[UITableViewCell alloc] init];
        cell.textLabel.text = @"asdasd";
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.viewType == UIViewTypeHomeTable)
    {
        return 150;
    }
    else if(self.viewType == UIViewTypeChannelTable)
    {
        return 60;
    }
    else if(self.viewType == UIViewTypeAlbumTable || self.viewType == UIViewTypeHotTable)
    {
        PublicAlbumModel *model = self.albumArray[indexPath.row];
        CGFloat frameViewHeight = 0;
        if([model.ftype isEqualToString:@"pic"])
        {
            frameViewHeight = 100;
        }
        else if([model.ftype isEqualToString:@"tracing"])
        {
            frameViewHeight = 250;
        }
        else if([model.ftype isEqualToString:@"talk"])
        {
            frameViewHeight = 0;
        }
        return 342 - 58 + [model.content1.word heightWithFont:[UIFont systemFontOfSize:17] withinWidth:ScreenWidth - 16] - 100 + frameViewHeight;
    }
    else if(self.viewType == UIViewTypeDrawTable)
    {
        if(indexPath.section == 0)
        {
            return 150;
        }
        else
        {
            return 200;
        }
    }
    else
    {
        return 60;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SegueSender *sender = [[SegueSender alloc] init];
    
    if(self.viewType == UIViewTypeHomeTable)
    {
        GuardHomeModel *model = self.homeArray[indexPath.row];
        if(model.webUrl != nil)
        {
            sender.url = model.webUrl;
            sender.isWeb = YES;
            [self.delegate PublicViewWithTableView:self ClickedOnTableIndexPath:indexPath sender:sender];
        }
        else
        {
            
            NSString *albumUrl = [NSString stringWithFormat:GUARD_ALBUM_TABLE_URL, [NSString stringWithFormat:@"%@", model.fid]];
            sender.url = albumUrl;
            sender.isWeb = NO;
            [self.delegate PublicViewWithTableView:self ClickedOnTableIndexPath:indexPath sender:sender];
        }
    }
    else
    {
        sender.isWeb = NO;
        [self.delegate PublicViewWithTableView:self ClickedOnTableIndexPath:indexPath sender:sender];
    }
}

#pragma mark -- 随机颜色（测试）
-(UIColor *)randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return color;
}
@end
