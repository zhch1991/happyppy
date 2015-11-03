//
//  PublicAlbumModel.m
//  happypy
//
//  Created by nnandzc on 15/10/28.
//  Copyright (c) 2015年 nnandzc. All rights reserved.
//

#import "PublicAlbumModel.h"

@implementation PublicAlbumModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if([key isEqualToString:@"id"])
    {
        self.id1 = value;
    }
}

@end
