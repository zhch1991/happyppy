//
//  publicCellImageFrameView.m
//  happypy
//
//  Created by nnandzc on 15/10/28.
//  Copyright (c) 2015年 nnandzc. All rights reserved.
//

#import "publicCellImageFrameView.h"

@interface publicCellImageFrameView()


@end

@implementation publicCellImageFrameView

+(id)publicCellImageFrameView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"publicCellImageFrameView" owner:nil options:nil] lastObject];
}
-(void)willMoveToSuperview:(UIView *)newSuperview
{
    self.frame = newSuperview.bounds;
}
@end
