//
//  PublicAlbumModel.h
//  happypy
//
//  Created by nnandzc on 15/10/28.
//  Copyright (c) 2015年 nnandzc. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ContentModel;
@interface PublicAlbumModel : NSObject
@property (nonatomic,copy) NSNumber *id1;
@property (nonatomic,copy) NSNumber *comments;
@property (nonatomic,copy) NSString *ftype;
@property (nonatomic,copy) NSNumber *channelId;
@property (nonatomic,copy) NSNumber *likeIn;
@property (nonatomic,copy) NSString *suffix;
@property (nonatomic,copy) NSNumber *uid;
@property (nonatomic,copy) NSString *labels;
@property (nonatomic,copy) NSNumber *likes;
@property (nonatomic,copy) NSString *channelName;
@property (nonatomic,copy) NSNumber *updateTime;
@property (nonatomic,copy) NSString *atUids;
@property (nonatomic,copy) NSNumber *ver;
@property (nonatomic,copy) NSNumber *collectIn;
@property (nonatomic,strong) NSArray *likeUids1;
@property (nonatomic,copy) NSNumber *perms;
@property (nonatomic,strong) ContentModel *content1;
@property (nonatomic, strong) NSArray *uidArray;
@property (nonatomic, strong) NSArray *picArray;
@end
