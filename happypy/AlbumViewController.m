//
//  AlbumViewController.m
//  happypy
//
//  Created by nnandzc on 15/10/27.
//  Copyright (c) 2015年 nnandzc. All rights reserved.
//

#import "AlbumViewController.h"
#import "PublicViewWithWebView.h"
#import "PublicViewWithTableView.h"
#import "SegueSender.h"
#import "PublicAlbumModel.h"
#import "ContentModel.h"
#import "PublicUidModel.h"

@interface AlbumViewController ()<PublicViewWithTableViewDelegate>
@property (nonatomic, weak) PublicViewWithWebView *viewWithwebView;
@property (nonatomic, weak) PublicViewWithTableView *viewWithtableView;
@property (nonatomic, strong) NSMutableArray *albumArray;
@property (nonatomic, strong) NSMutableArray *uidArray;
@end

@implementation AlbumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(self.sender.isWeb == YES)
    {
        self.viewWithwebView;
    }
    else
    {
        self.viewWithtableView;
        //确保viewWithtableView不为空的时候get网络数据
        [self Guard_Album_Data];
    }
//    [self Guard_Album_Data1];
}

-(PublicViewWithWebView *)viewWithwebView
{
    if(_viewWithwebView == nil)
    {
        
        PublicViewWithWebView *viewWithwebView = [PublicViewWithWebView PublicViewWithWebView];
        [self.view addSubview:viewWithwebView];
        viewWithwebView.url = self.sender.url;
        self.viewWithwebView = viewWithwebView;
    }
    return _viewWithwebView;
}

-(PublicViewWithTableView *)viewWithtableView
{
    if(_viewWithtableView == nil)
    {
        PublicViewWithTableView *viewWithtableView = [PublicViewWithTableView PublicViewWithTableView];
        viewWithtableView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        viewWithtableView.viewType = UIViewTypeAlbumTable;
        [self.view addSubview:viewWithtableView];
        viewWithtableView.refershType = RefreshTypeAll;
        viewWithtableView.delegate = self;
        //获取数据添加给viewWithtableView
        self.viewWithtableView = viewWithtableView;
    }
    return _viewWithtableView;
}

//-(void)Guard_Album_Data1
//{
//    NSString *url = @"http://zhibo.yesky.com/newlive.interface?num=10&type=style4&os=ios&time=2015-10-28%2017:28";
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    [manager POST:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
//        NSString *str = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//        NSLog(@"%@", str);
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        NSLog(@"failure");
//    }];
//}

//有data＝前缀的数据怎么解析为字典
-(void)Guard_Album_Data1
{
    NSString *url = @"http://zhibo.yesky.com/newlive.interface?num=10&type=style4&os=ios&time=2015-10-28%2017:28";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSString *dataString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSString *userfulData = [dataString substringFromIndex:9];
        NSLog(@"%@", userfulData);
//        NSData *data = [userfulData dataUsingEncoding:NSUTF8StringEncoding];
        NSLog(@"data %@",userfulData);
        
        NSDictionary * objects = [NSJSONSerialization JSONObjectWithData:userfulData options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",objects);

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"failure");
    }];
}

#pragma mark -- 数据控制
//section
-(void)Guard_Album_Data
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:self.sender.url parameters:nil success:^void(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];

        //到用户头像model数组
        NSArray * uidArray = dict[@"users"];
        NSMutableArray *uidArrayM = [[NSMutableArray alloc] init];
        
//        [ZJModelTool createModelWithDictionary:uidArray[0] modelName:@"aaa"];
        for(NSDictionary *subDict in uidArray)
        {
//            [ZJModelTool createModelWithDictionary:subDict modelName:@"aaa"];
            PublicUidModel *puidModel = [[PublicUidModel alloc] init];
            [puidModel setValuesForKeysWithDictionary:subDict];
            [uidArrayM addObject:puidModel];
        }
        
        NSArray *array = dict[@"rows"];
        NSMutableArray *arrayM = [[NSMutableArray alloc] init];
        //cell内容数组
        for(NSDictionary *subDict in array)
        {
            PublicAlbumModel *PM = [[PublicAlbumModel alloc] init];
            [PM setValuesForKeysWithDictionary:subDict];
            
            ContentModel *CM = [[ContentModel alloc] init];
//            [ZJModelTool createModelWithDictionary:subDict[@"content"] modelName:@"aaa"];
            [CM setValuesForKeysWithDictionary:subDict[@"content"]];
            PM.content1 = CM;
            NSMutableArray *likeUids = [[NSMutableArray alloc] init];
            for(NSString *str in subDict[@"likeUids"])
            {
                [likeUids addObject:str];
            }
            
            NSArray *picArray = [CM.url componentsSeparatedByString:@","];

            PM.likeUids1 = likeUids;
            PM.uidArray = uidArrayM;
            PM.picArray = picArray;
            [arrayM addObject:PM];
        }
        self.albumArray = arrayM;
        self.viewWithtableView.albumArray = arrayM;

    } failure:^void(AFHTTPRequestOperation *operation, NSError * error) {
        NSLog(@"error = %@",error);
    }];
}

#pragma mark - PublicViewWithTableViewDelegate
//上下拉刷新代理
-(void)HeaderRefreshWithPublicViewWithTableView:(PublicViewWithTableView *)view
{
    sleep(3);
    [self.viewWithtableView endHeaderRefresh];
}

-(void)FooterRefreshWithPublicViewWithTableView:(PublicViewWithTableView *)view
{
    sleep(3);
    [self.viewWithtableView endFooterRefresh];
}

#pragma mark -- 生成核心动画
-(CATransition *)createTransitionAnimation
{
    //切换之前添加动画效果
    //后面知识: Core Animation 核心动画
    //不要写成: CATransaction
    //创建CATransition动画对象
    CATransition *animation = [CATransition animation];
    //设置动画的类型:
    //    animation.type = @"cube"; animation.type = @"suckEffect"; animation.type = @"oglFlip";  animation.type = @"rippleEffect"; animation.type = @"pageCurl"; animation.type = @"pageUnCurl";  animation.type = @"cameraIrisHollowOpen";  animation.type = @"cameraIrisHollowClose";
    animation.type = @"rippleEffect";
    //设置动画的方向
    animation.subtype = kCATransitionFromBottom;
    //设置动画的持续时间
    animation.duration = 1.5;
    //设置动画速率(可变的)
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //动画添加到切换的过程中
    return animation;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
