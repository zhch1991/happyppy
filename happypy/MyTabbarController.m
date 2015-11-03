//
//  MyTabbarController.m
//  happypy
//
//  Created by nnandzc on 15/10/26.
//  Copyright (c) 2015年 nnandzc. All rights reserved.
//

#import "MyTabbarController.h"

@interface MyTabbarController () <UITabBarControllerDelegate>
@property (weak,nonatomic)UIVisualEffectView * backgroundview;
@end

@implementation MyTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITabBarItem *item = self.tabBar.items[2];
    item.title = nil;
    item.image = [[UIImage imageNamed:@"ico_copy_off"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    self.delegate = self;
}

-(UIVisualEffectView *)backgroundview
{
    if(_backgroundview == nil)
    {
        //1. 创建UIBlurEffect类的实例，并指定某一种毛玻璃效果。
        UIBlurEffect * blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        //2. 创建UIVisualEffectView类的实例，将步骤1中的UIBlurEffect类的实例应用到UIVisualEffectView类的实例上。
        UIVisualEffectView * blurView = [[UIVisualEffectView alloc] initWithEffect:blur];
        //3. 将UIVisualEffectView类的实例置于待毛玻璃化的视图之上即可。
        [self.view addSubview:blurView];
        
        _backgroundview = blurView;
        [blurView setFrame:CGRectMake(0, 64+44, self.view.frame.size.width, self.view.frame.size.height - (47 + 64 + 44))];
        self.backgroundview.hidden = YES;
    }
    return _backgroundview;
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    NSInteger index = [self.tabBar.items indexOfObject:item];
    if(index == 2)
    {
        [self showMenus];
    }
    
}
-(void)showMenus
{
    self.backgroundview.hidden = !self.backgroundview.hidden;
}

-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    NSArray *controllers = self.viewControllers;
    NSInteger index = [controllers indexOfObject:viewController];
    if(index == 2)
    {
        return NO;
    }
    return true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
