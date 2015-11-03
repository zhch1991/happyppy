//
//  UINavigationController+AOP.h
//  03-权限控制
//
//  Created by qianfeng on 15-10-9.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (AOP)



- (void)aop_pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

@end
