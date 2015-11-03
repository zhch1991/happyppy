//
//  MyTabbar.h
//  内存问题
//
//  Created by nnandzc on 15/9/22.
//  Copyright (c) 2015年 nnandzc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyTabbar;
@protocol MyTablebarDelegate <NSObject>

/**
 *  当点击了某一个item时，会调用该代理方法
 *
 *  @param tabbar tabbar
 *  @param index  点击item对应的索引值
 *  @param btn    点击item对象
 */
-(void)tabbarDidSelectedItem:(MyTabbar *)tabbar index:(NSInteger)index item:(UIButton *)btn;

@end

@interface MyTabbar : UIView
+(id)tabbar;

@property (nonatomic, strong) UIScrollView *scrollView;
//传入装满了button的数组
@property (nonatomic, strong) NSArray *items;

@property (nonatomic,assign) id<MyTablebarDelegate> delegate;

@end
