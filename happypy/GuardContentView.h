//
//  GuardContentView.h
//  happypy
//
//  Created by nnandzc on 15/10/26.
//  Copyright (c) 2015年 nnandzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PublicViewWithTableView;
@interface GuardContentView : UIScrollView

@property (nonatomic, strong) NSArray *sectionArray;
@property (nonatomic, strong) NSArray *homeArray;
@property (nonatomic, strong) NSArray *hotAlbumArray;
//虽然所有tableView由一个publick公共类展示，但实际上创建了多个publick公共类对象，每个对象需要单独的和contentView形成代理关系，所以contentView中需要对每一个子View都设置block回调，content相当于一个总成，多流汇聚给content，content发送出去也要保持多流
//刷新block
@property (nonatomic, copy) void (^View0HeaderRefresh)(PublicViewWithTableView *view, int index);
@property (nonatomic, copy) void (^View0FooterrRefresh)(PublicViewWithTableView *view, int index);
@property (nonatomic, copy) void (^View1HeaderRefresh)(PublicViewWithTableView *view, int index);
@property (nonatomic, copy) void (^View1FooterRefresh)(PublicViewWithTableView *view, int index);
@property (nonatomic, copy) void (^View2headerRefresh)(PublicViewWithTableView *view, int index);
@property (nonatomic, copy) void (^View3headerRefresh)(PublicViewWithTableView *view, int index);

//cell选中跳转block
@property (nonatomic, copy) void (^View0CellSelected)(PublicViewWithTableView *view, NSIndexPath *indexPath,id sender);
@property (nonatomic, copy) void (^View1CellSelected)(PublicViewWithTableView *view, NSIndexPath *indexPath, id sender);
@property (nonatomic, copy) void (^View2CellSelected)(PublicViewWithTableView *view, NSIndexPath *indexPath, id sender);
@property (nonatomic, copy) void (^View3CellSelected)(PublicViewWithTableView *view, NSIndexPath *indexPath, id sender);

+(GuardContentView *)GuardContentView;

@end
