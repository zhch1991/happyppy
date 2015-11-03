//
//  ShowPicView.m
//  happypy
//
//  Created by nnandzc on 15/10/30.
//  Copyright (c) 2015年 nnandzc. All rights reserved.
//

#import "ShowPicView.h"

@implementation ShowPicView

+(id)ShowPicView
{
    return [[self alloc] init];
}

-(void)willMoveToSuperview:(UIView *)newSuperview
{
    self.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    self.backgroundColor = [UIColor blackColor];
}

@end
