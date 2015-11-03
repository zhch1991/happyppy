//
//  GuardContentView.m
//  happypy
//
//  Created by nnandzc on 15/10/26.
//  Copyright (c) 2015年 nnandzc. All rights reserved.
//

#import "GuardContentView.h"
#import "PublicViewWithTableView.h"
#import "GuardCategoryModel.h"

@interface GuardContentView()<PublicViewWithTableViewDelegate>
@property (nonatomic, strong) NSMutableArray *viewArray;
@end

@implementation GuardContentView

+(GuardContentView *)GuardContentView
{
    return [[self alloc] init];
}

-(void)setSectionArray:(NSArray *)sectionArray
{
    _sectionArray = sectionArray;
    [self createUI];
}

-(void)setHomeArray:(NSArray *)homeArray
{
    PublicViewWithTableView *view = self.viewArray[0];
    view.homeArray = homeArray;
}

-(void)setHotAlbumArray:(NSArray *)hotAlbumArray
{
    PublicViewWithTableView *view = self.viewArray[1];
    view.albumArray = hotAlbumArray;
}

-(void)createUI
{
    CGFloat X = 0;
    CGFloat Y = 0;
    CGFloat W = ScreenWidth;
    CGFloat H = ScreenHeight;
    
    self.viewArray = [[NSMutableArray alloc] init];
    for(int i =0 ; i < self.sectionArray.count; i++)
    {
        GuardCategoryModel *gm = self.sectionArray[i];
        
        X = i * ScreenWidth;
        PublicViewWithTableView *view = [PublicViewWithTableView PublicViewWithTableView];
        view.delegate = self;
        //设置页面类型
        switch (gm.id1.integerValue) {
            case 6:
                view.viewType = UIViewTypeHomeTable;
                view.refershType = RefreshTypeAll;
                break;
            case 1:
                view.viewType = UIViewTypeHotTable;
//                view.viewType = UIViewTypeAlbumTable;
                break;
            case 2:
                view.viewType = UIViewTypeChannelTable;
                break;
            case 5:
                view.viewType = UIViewTypeDrawTable;
                break;
            default:
                break;
        }
        
        [self addSubview:view];
        
        //设置上下拉类型
        switch (gm.id1.integerValue) {
            case 6:
                view.refershType = RefreshTypeAll;
                break;
            case 1:
                view.refershType = RefreshTypeAll;
                break;
            case 2:
                view.refershType = RefreshTypeHeader;
                break;
            case 5:
                view.refershType = RefreshTypeHeader;
                break;
            default:
                //                view.viewType = UIViewTypeDrawTable;
                break;
        }
        
        view.frame = CGRectMake(X, Y, W, H);
        [self.viewArray addObject:view];
    }
    
    self.contentSize = CGSizeMake(ScreenWidth * 4, 0);
}

-(void)HeaderRefreshWithPublicViewWithTableView:(PublicViewWithTableView *)view
{
    switch ([self.viewArray indexOfObject:view]) {
        case 0:
            self.View0HeaderRefresh(view, 0);
            break;
        case 1:
            self.View1HeaderRefresh(view, 1);
            break;
        case 2:
            self.View2headerRefresh(view, 2);
        case 3:
            self.View3headerRefresh(view, 3);
        default:
            break;
    }
}

-(void)FooterRefreshWithPublicViewWithTableView:(PublicViewWithTableView *)view
{
    switch ([self.viewArray indexOfObject:view]) {
        case 0:
            self.View0FooterrRefresh(view, 0);
            break;
        case 1:
            self.View1FooterRefresh(view, 0);
            break;
        default:
            break;
    }
}

-(void)PublicViewWithTableView:(PublicViewWithTableView *)view ClickedOnTableIndexPath:(NSIndexPath *)indexPath sender:(id)sender
{
    switch ([self.viewArray indexOfObject:view]) {
        case 0:
            self.View0CellSelected(view, indexPath, sender);
            break;
        case 1:
            self.View1CellSelected(view, indexPath, sender);
            break;
        case 2:
            self.View2CellSelected(view, indexPath, sender);
            break;
        case 3:
            self.View3CellSelected(view, indexPath, sender);
            break;
            
        default:
            break;
    }
}

-(void)willMoveToSuperview:(UIView *)newSuperview
{
    self.backgroundColor = [UIColor greenColor];
    self.frame = CGRectMake(0, 64, ScreenWidth, ScreenHeight - 64);
    
//    CGFloat X = 0;
//    CGFloat Y = 0;
//    CGFloat W = ScreenWidth;
//    CGFloat H = ScreenHeight;
//    
//    for(int i =0 ; i < 4; i++)
//    {
//        X = i * ScreenWidth;
//        PublicViewWithTableView *view = [PublicViewWithTableView PublicViewWithTableView];
//        if(i % 2 == 0)
//        {
//            view.viewType = UIViewTypeHomeTable;
//        }
//        else
//        {
//            view.viewType = UIViewTypeHotTable;
//        }
//        [self addSubview:view];
//        view.frame = CGRectMake(X, Y, W, H);
//    }
//    
//    self.contentSize = CGSizeMake(ScreenWidth * 4, 0);
    self.pagingEnabled = YES;
}


@end
