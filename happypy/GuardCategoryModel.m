//
//  GuardCategoryModel.m
//  happypy
//
//  Created by nnandzc on 15/10/27.
//  Copyright (c) 2015年 nnandzc. All rights reserved.
//

#import "GuardCategoryModel.h"

@implementation GuardCategoryModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if([key isEqualToString:@"id"])
    {
        self.id1 = value;
    }
}
@end
