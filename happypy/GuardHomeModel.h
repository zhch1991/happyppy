//
//  GuardHomeModel.h
//  happypy
//
//  Created by nnandzc on 15/10/27.
//  Copyright (c) 2015年 nnandzc. All rights reserved.
//

#import <Foundation/Foundation.h>


@class ContentModel;
@interface GuardHomeModel : NSObject
@property (nonatomic,copy) NSString *ftype;
@property (nonatomic,copy) NSNumber *id1;
@property (nonatomic,strong) ContentModel *content1;
@property (nonatomic,copy) NSNumber *fid;
@property (nonatomic,copy) NSString *webUrl;
@property (nonatomic,copy) NSNumber *ver;

@end
