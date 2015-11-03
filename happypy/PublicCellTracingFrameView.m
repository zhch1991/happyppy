//
//  PublicCellTracingFrameView.m
//  happypy
//
//  Created by nnandzc on 15/10/28.
//  Copyright (c) 2015年 nnandzc. All rights reserved.
//

#import "PublicCellTracingFrameView.h"

@implementation PublicCellTracingFrameView

+(id)PublicCellTracingFrameView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"PublicCellTracingFrameView" owner:nil options:nil] lastObject];
}

-(void)willMoveToSuperview:(UIView *)newSuperview
{
    self.frame = newSuperview.bounds;
}

@end
