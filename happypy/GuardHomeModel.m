//
//  GuardHomeModel.m
//  happypy
//
//  Created by nnandzc on 15/10/27.
//  Copyright (c) 2015年 nnandzc. All rights reserved.
//

#import "GuardHomeModel.h"

@implementation GuardHomeModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if([key isEqualToString:@"id1"])
    {
        self.id1 = value;
    }
}
@end
