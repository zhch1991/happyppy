//
//  MyTabbar.m
//  内存问题
//
//  Created by nnandzc on 15/9/22.
//  Copyright (c) 2015年 nnandzc. All rights reserved.
//

#import "MyTabbar.h"

@interface MyTabbar ()

@property (nonatomic, strong) UIPageControl *pageControl;
@end

@implementation MyTabbar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(id)tabbar
{
    MyTabbar *tabbar = [[self alloc] init];
    return tabbar;
}

-(id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
    }
    return self;
}

//设置数组
-(void)setItems:(NSArray *)items
{
    _items = items;
    CGFloat btnW = self.frame.size.width/items.count;
    
    /**
     *  scrollView
     */
    _scrollView  = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 49)];
    _scrollView.contentSize = CGSizeMake(items.count * btnW, self.frame.size.height);
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
//    _scrollView.pagingEnabled = YES;
    [self addSubview:_scrollView];
    
    for(int i = 0; i < items.count; i++)
    {
        UIButton *btn = items[i];
        [_scrollView addSubview:btn];
        
        CGFloat btnX = i * btnW;
        CGFloat btnY = 0;
        CGFloat btnH = self.frame.size.height;
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        btn.tag = i;
        [btn addTarget:self action:@selector(btnTouch:) forControlEvents:UIControlEventTouchUpInside];
    }
    [self btnTouch:items[0]];
}

-(void)btnTouch:(UIButton *)btn
{
    [_delegate tabbarDidSelectedItem:self index:btn.tag item:btn];
}

//即将添加到父view里
-(void)willMoveToSuperview:(UIView *)newSuperview
{
    self.backgroundColor = [UIColor lightGrayColor];
    self.frame = CGRectMake(0, 64, ScreenWidth, 49);
}
@end
