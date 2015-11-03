//
//  PublicHeaderViewWithScrollView.m
//  happypy
//
//  Created by nnandzc on 15/10/27.
//  Copyright (c) 2015年 nnandzc. All rights reserved.
//

#import "PublicHeaderViewWithScrollView.h"
@interface PublicHeaderViewWithScrollView()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation PublicHeaderViewWithScrollView
+(id)PublicHeaderViewWithScrollView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"PublicHeaderViewWithScrollView" owner:nil options:nil] lastObject];
}

-(void)willMoveToSuperview:(UIView *)newSuperview
{
    CGFloat X = 0;
    CGFloat Y = 0;
    CGFloat W = ScreenWidth;
    CGFloat H = self.frame.size.height;
    
    for(int i = 0; i < 2; i++)
    {
        UIImageView *imageView = [[UIImageView alloc] init];
        [self.scrollView addSubview:imageView];
        imageView.frame = CGRectMake(X, Y, W, H);
        imageView.backgroundColor = (i == 0)?[UIColor greenColor]:[UIColor redColor];
    }
    self.scrollView.contentSize = CGSizeMake(ScreenWidth * 2, 0);
    self.scrollView.pagingEnabled = YES;
}

@end
