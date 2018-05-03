//
//  FYWebVC.m
//  music
//
//  Created by wxj on 2018/5/2.
//  Copyright © 2018年 Fyus. All rights reserved.
//

#import "FYWebVC.h"

@interface FYWebVC ()<UIWebViewDelegate>
@property(nonatomic, strong) UIWebView *webView;
@property(nonatomic, strong) UIView *bottomView;
@end

@implementation FYWebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-40)];
    [self.view addSubview:_webView];
    _webView.delegate = self;
    NSURL *url = [[NSURL alloc] initWithString:self.URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    
    _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, _webView.frame.size.height, self.view.frame.size.width, 40)];
    [self.view addSubview:_bottomView];
    _bottomView.backgroundColor = [UIColor lightGrayColor];
    
    
    UIButton *homeBtn = [[UIButton alloc] initWithFrame:CGRectMake((s_WindowW-40*4)/5.0, 0, 40, 40)];
    [_bottomView addSubview:homeBtn];
    [homeBtn setImage:[UIImage imageNamed:@"home"] forState:UIControlStateNormal];
    [homeBtn addTarget:self action:@selector(gobackHome) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *preBtn = [[UIButton alloc] initWithFrame:CGRectMake(homeBtn.frame.origin.x+homeBtn.frame.size.width+(s_WindowW-40*4)/5.0, 0, 40, 40)];
    [preBtn setImage:[UIImage imageNamed:@"pre"] forState:UIControlStateNormal];
    [_bottomView addSubview:preBtn];
    [preBtn addTarget:self action:@selector(preBtnss) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(preBtn.frame.origin.x+preBtn.frame.size.width+(s_WindowW-40*4)/5.0, 0, 40, 40)];
    [_bottomView addSubview:nextBtn];
    [nextBtn setImage:[UIImage imageNamed:@"next"] forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(backBtnss) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *refreshBtn = [[UIButton alloc] initWithFrame:CGRectMake(nextBtn.frame.origin.x+nextBtn.frame.size.width+(s_WindowW-40*4)/5.0, 0, 40, 40)];
    [_bottomView addSubview:refreshBtn];
    [refreshBtn setTitle:@"刷新" forState:UIControlStateNormal];
    [refreshBtn setImage:[UIImage imageNamed:@"refresh"] forState:UIControlStateNormal];
    [refreshBtn addTarget:self action:@selector(refreshpage) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)gobackHome{
    NSURL *url = [NSURL URLWithString:self.URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}
- (void)preBtnss{
    [_webView goBack];
}
- (void)backBtnss{
    [_webView goForward];
}
- (void)refreshpage{
    [_webView reload];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.hidesBottomBarWhenPushed = YES;
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
