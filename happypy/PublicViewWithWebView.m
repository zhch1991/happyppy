//
//  PublicViewWithWebView.m
//  happypy
//
//  Created by nnandzc on 15/10/27.
//  Copyright (c) 2015年 nnandzc. All rights reserved.
//

#import "PublicViewWithWebView.h"
#import "ShowPicView.h"

@interface PublicViewWithWebView()<UIWebViewDelegate>
@property (nonatomic, weak) UIWebView *webView;
@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, weak) ShowPicView  *showPicView;
@end

@implementation PublicViewWithWebView

+(id)PublicViewWithWebView
{
    return [[self alloc] init];
}

-(void)setUrl:(NSString *)url
{
    _url = url;
    
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = self.bounds;
    [self addSubview:webView];
    self.webView = webView;
    self.webView.delegate = self;
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
}

-(void)willMoveToSuperview:(UIView *)newSuperview
{
    self.frame = newSuperview.bounds;
    self.backgroundColor = [UIColor purpleColor];
    

}

-(ShowPicView *)showPicView
{
    if(_showPicView == nil)
    {
        ShowPicView *showPicView = [ShowPicView ShowPicView];
//        showPicView.backgroundColor = [UIColor greenColor];
//        showPicView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        [self.webView addSubview:showPicView];
        showPicView.alpha = 0;
        _showPicView = showPicView;
    }
    return _showPicView;
}

#pragma mark --UIWebViewDelegate
//webView截取URL代理方法
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    //获得请求字符串
    NSLog(@"request = %@", request);
    NSString *requestString = [[request URL] absoluteString];
    NSLog(@"requestString = %@", requestString);
    if([requestString containsString:@"index"])
    {
        //已经获取到图片url数组＋index
        NSRange range = [requestString rangeOfString:@"http"];
        NSString *imagesStr = [requestString substringFromIndex:range.location];
        NSArray *array = [imagesStr componentsSeparatedByString:@","];
        NSMutableArray *arrayM = [NSMutableArray arrayWithArray:array];
        [arrayM removeObject:[arrayM lastObject]];
        self.imageArray = arrayM;
        NSLog(@"imageArray = %@", arrayM);

        self.showPicView.hidden = NO;
        [UIView animateWithDuration:1.0 animations:^{
            self.showPicView.alpha = 1;
        }];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClicked:)];
        [self.showPicView addGestureRecognizer:tap];
    }
    return  YES;
}

-(void)viewClicked:(UITapGestureRecognizer *)tap
{
    [UIView animateWithDuration:1.0 animations:^{
        self.showPicView.alpha = 0;
    } completion:^(BOOL finished) {
        self.showPicView.hidden = YES;
    }];
}

@end
