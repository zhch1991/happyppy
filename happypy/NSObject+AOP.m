//
//  NSObject+AOP.m
//  01-改变方法指向
//
//  Created by qianfeng on 15-10-9.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import "NSObject+AOP.h"
#import <objc/runtime.h>

@implementation NSObject (AOP)

+(void)aop_ExchangeSelector:(SEL)oldSel andNewSelector:(SEL)newSel
{
    Method oldMethod =  class_getInstanceMethod([self class], oldSel);
    Method newMethod  = class_getInstanceMethod([self class], newSel);
    
    //改变两个方法的具体指针指向
    method_exchangeImplementations(oldMethod, newMethod);
}

@end
