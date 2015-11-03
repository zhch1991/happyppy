//
//  PublicAPI.h
//  happypy
//
//  Created by nnandzc on 15/10/27.
//  Copyright (c) 2015年 nnandzc. All rights reserved.
//

#ifndef happypy_PublicAPI_h
#define happypy_PublicAPI_h
//广场分类：
//GET请求
//参数        作用            值
//uid          用户ID          可空
//version    版本            一般为2 ，默认为1
//deviceld  设备ID         可空
#define GUARD_CATEGORY_URL @"http://api.huapipi.com/home/navigator/v2?uid=996594&version=2&deviceId=1748192"

//首页：
//GET请求
//参数        作用            值
//uid          用户ID         可空
//deviceld  设备ID         可空
//ver        下一页        可空

#define GUARD_HOME_TABLE_URL @"http://api.huapipi.com/recommend/pipi?uid=996594&deviceId=1748192&ver=%@"
//http://api.huapipi.com/recommend/pipi?uid=996594&ver=1445566486&deviceId=1748192

//首页album类型：
//detail/ 后跟album的ID
//GET请求
//参数        作用            值
//uid          用户ID         可空
//deviceld 设备ID         可空
//w           屏幕宽度      可空
//h            屏幕高度      可空
#define GUARD_ALBUM_TABLE_URL @"http://api.huapipi.com/recommend/v2/detail/%@?w=750&deviceId=1748192&uid=996594&h=1334"

#define GUARD_HOT_TABLE_URL @"http://api.huapipi.com/show/v2/hot/top/1?w=750&deviceId=1748192&uid=996594&h=1334&ver=%@"

#endif
