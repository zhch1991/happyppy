//
//  GuardViewController.m
//  happypy
//
//  Created by nnandzc on 15/10/26.
//  Copyright (c) 2015年 nnandzc. All rights reserved.
//

#import "GuardViewController.h"
#import "GuardContentView.h"
#import "MyTabbar.h"
#import "GuardCategoryModel.h"
#import "GuardHomeModel.h"
#import "ContentModel.h"
#import "PublicViewWithTableView.h"
#import "AlbumViewController.h"
#import "PublicAlbumModel.h"
#import "ContentModel.h"
#import "PublicUidModel.h"


@interface GuardViewController ()<MyTablebarDelegate, UIScrollViewDelegate>
{
    NSInteger *ver;
}
@property (weak, nonatomic) GuardContentView *contentView;
@property (weak, nonatomic) MyTabbar *tabbar;
@property (strong, nonatomic) NSArray *sectionArray;
@property (strong, nonatomic) NSArray *homeArray;
@property (strong, nonatomic) NSArray *hotAlbumArray;
@end

@implementation GuardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //下载数据
    [self Guard_Category_Data];
    
}

-(void)createSectionBar
{
    MyTabbar *tabbar = [MyTabbar tabbar];
    [self.view addSubview:tabbar];
    self.tabbar = tabbar;
    NSMutableArray *buttonArray = [[NSMutableArray alloc] init];
    for(int i = 0; i < self.sectionArray.count;i ++)
    {
        GuardCategoryModel *gm = self.sectionArray[i];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:gm.name forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [buttonArray addObject:button];
        tabbar.delegate = self;
    }
    self.tabbar.items = buttonArray;
}

-(void)createContentView
{
    GuardContentView *contentView = [GuardContentView GuardContentView];
    [self.view addSubview:contentView];
    self.contentView = contentView;
    self.contentView.delegate = self;
    self.contentView.sectionArray = self.sectionArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//创建控件的入口，在此方法中保持控件创建的先后顺序，保证数据有效性
-(void)setSectionArray:(NSArray *)sectionArray
{
    _sectionArray = sectionArray;
    
    //得到数据后根据数据创建UI
    [self createContentView];
    [self createSectionBar];
    
    //在保证有contentView的情况下，加载数据
    [self Guard_Home_Data];
    
    [self Guard_Album_Data];
    
    //在contentView中设置代理，代理较复杂，为了不破坏结构
    self.contentView.View0HeaderRefresh = ^(PublicViewWithTableView *view, int index)
    {
        sleep(3.0);
        view.num = 0;
        [view endHeaderRefresh];
    };
    self.contentView.View0FooterrRefresh = ^(PublicViewWithTableView *view, int index)
    {
        sleep(3.0);
        [view endFooterRefresh];
    };
    self.contentView.View1HeaderRefresh = ^(PublicViewWithTableView *view, int index)
    {
        sleep(3.0);
        view.num = 1;
        [view endHeaderRefresh];
    };
    self.contentView.View1FooterRefresh = ^(PublicViewWithTableView *view, int index)
    {
        sleep(3.0);
        [view endFooterRefresh];
    };
    self.contentView.View2headerRefresh = ^(PublicViewWithTableView *view, int index)
    {
        sleep(3.0);
        view.num = 2;
        [view endHeaderRefresh];
    };
    self.contentView.View3headerRefresh = ^(PublicViewWithTableView *view, int index)
    {
        sleep(3.0);
        view.num = 3;
        [view endHeaderRefresh];
    };
    
    //选中跳转到另一个Controller
    self.contentView.View0CellSelected = ^(PublicViewWithTableView *view, NSIndexPath *indexPath, id sender )
    {
        [self performSegueWithIdentifier:@"AlbumView" sender:sender];
    };
    self.contentView.View1CellSelected = ^(PublicViewWithTableView *view, NSIndexPath *indexPath, id sender)
    {
        NSLog(@"view2 perfom Segue");
    };
    self.contentView.View2CellSelected = ^(PublicViewWithTableView *view, NSIndexPath *indexPath, id sender)
    {
        NSLog(@"view3 perfom Segue");
    };
    self.contentView.View3CellSelected = ^(PublicViewWithTableView *view, NSIndexPath *indexPath, id sender)
    {
        NSLog(@"view4 perfom Segue");
    };
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"AlbumView"])
    {
        NSLog(@"view0 perfom Segue");
        AlbumViewController *ac = segue.destinationViewController;
        ac.sender = sender;
    }
}

#pragma mark -- 数据控制
//section
-(void)Guard_Category_Data
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:GUARD_CATEGORY_URL parameters:nil success:^void(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *array = dict[@"rows"];
        NSMutableArray *arrayM = [[NSMutableArray alloc] init];
//        [ZJModelTool createModelWithDictionary:array[0] modelName:@"aaa"];
        for(NSDictionary *subDict in array)
        {
            GuardCategoryModel *GM = [[GuardCategoryModel alloc] init];
            [GM setValuesForKeysWithDictionary:subDict];
            [arrayM addObject:GM];
        }
        self.sectionArray = arrayM;
    } failure:^void(AFHTTPRequestOperation *operation, NSError * error) {
        NSLog(@"error = %@",error);
    }];
}

//home
-(void)Guard_Home_Data
{
    NSString *url = [NSString stringWithFormat:GUARD_HOME_TABLE_URL, @""];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^void(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *array = dict[@"rows"];
        NSMutableArray *arrayM = [[NSMutableArray alloc] init];
        
        for(NSDictionary *subDict in array)
        {
            GuardHomeModel *GM = [[GuardHomeModel alloc] init];
            [GM setValuesForKeysWithDictionary:subDict];
            ContentModel *CM = [[ContentModel alloc] init];
            [CM setValuesForKeysWithDictionary:subDict[@"content"]];
            GM.content1 = CM;
            
            [arrayM addObject:GM];
            
        }
        self.homeArray = arrayM;
        self.contentView.homeArray = arrayM;
        if(self.contentView == nil)
            NSLog(@"contentView == nil");

    } failure:^void(AFHTTPRequestOperation *operation, NSError * error) {
        NSLog(@"error = %@",error);
    }];
}

-(void)Guard_Album_Data
{
    NSString *url = [NSString stringWithFormat:GUARD_HOT_TABLE_URL, @""];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil success:^void(AFHTTPRequestOperation *operation, id responseObject) {
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
            [ZJModelTool createModelWithDictionary:subDict[@"content"] modelName:@"aaa"];
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
        self.hotAlbumArray = arrayM;
        self.contentView.hotAlbumArray = arrayM;
        
    } failure:^void(AFHTTPRequestOperation *operation, NSError * error) {
        NSLog(@"error = %@",error);
    }];
}

#pragma mark -- MyTablebarDelegate
-(void)tabbarDidSelectedItem:(MyTabbar *)tabbar index:(NSInteger)index item:(UIButton *)btn
{
    for(UIButton* button in tabbar.items)
    {
        button.selected = NO;
    }
    btn.selected = YES;
    [self.contentView setContentOffset:CGPointMake(index * ScreenWidth, 0)];
}

#pragma mark -- GuardContentViewDelegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger x = scrollView.contentOffset.x / ScreenWidth;
    for(UIButton* button in self.tabbar.items)
    {
        button.selected = NO;
    }
    UIButton *btn = self.tabbar.items[x];
    btn.selected = YES;
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
