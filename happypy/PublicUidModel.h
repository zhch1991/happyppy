//
//  PublicUidModel.h
//  happypy
//
//  Created by nnandzc on 15/10/28.
//  Copyright (c) 2015年 nnandzc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublicUidModel : NSObject

@property (nonatomic,copy) NSString *ident;
@property (nonatomic,copy) NSNumber *sex;
@property (nonatomic,copy) NSNumber *level;
@property (nonatomic,copy) NSString *nickname;
@property (nonatomic,copy) NSString *portrait;
@property (nonatomic,copy) NSNumber *uid;

@end
