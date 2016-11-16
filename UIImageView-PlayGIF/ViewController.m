//
//  ViewController.m
//  UIImageView-PlayGIF
//
//  Created by Yang Fei on 14-3-25.
//  Copyright (c) 2014年 yangfei.me. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
#import "YFGIFImageView.h"
#import "UIImageView+PlayGIF.h"

#import "YLImageView.h"
#import "YLGIFImage.h"

#import "OLImageViewDelegate.h"
#import "OLImage.h"
#import "OLImageView.h"

#import "YYImage.h"

@interface ViewController ()<OLImageViewDelegate>
@property (nonatomic, getter=isRunning) BOOL running;

@end

@implementation ViewController

//- (void)rightItemClicked:(id)sender{
//    TableViewController *vc = [[TableViewController alloc] initWithStyle:UITableViewStyleGrouped];
//    [self.navigationController pushViewController:vc animated:YES];
//}
//
//- (void)tapped:(UITapGestureRecognizer *)gestureRecognizer {
//    YFGIFImageView *gifView = (YFGIFImageView *)gestureRecognizer.view;
//    if (gifView.isGIFPlaying) {
//        [gifView stopGIF];
//    }else{
//        [gifView startGIF];
//    }
//}

- (void)viewDidLoad
{
    [super viewDidLoad];

//1 YFGIFImageView
//    YFGIFImageView *gifView = [[YFGIFImageView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
//    NSData *gifData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"test.gif" ofType:nil]];
//    gifView.backgroundColor = [UIColor darkGrayColor];
//            gifView.gifData = gifData;
//            [self.view addSubview:gifView];
//    
//    [gifView startGIF];
//    gifView.userInteractionEnabled = YES;
    
//2 YLImageView
//    self.navigationController.navigationBar.translucent = NO;
//    YLImageView *gifView = [[YLImageView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
//    gifView.backgroundColor = [UIColor blueColor];
//    gifView.image = [YLGIFImage imageNamed:@"gif.gif"];
//    gifView.contentMode = UIViewContentModeScaleAspectFit;
//    [self.view addSubview:gifView];

//3 WebView
//    [self showGifImageWithWebView];
    
//4 OLImageView
//     NSData *gifData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"test.gif" ofType:nil]];
//    OLImageView *gifView = [[OLImageView alloc] initWithFrame:CGRectMake(0, 64, 300, 50)];
//    gifView.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
//    gifView.contentMode = UIViewContentModeScaleAspectFit;
//    gifView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:gifView];
//    gifView.image = [OLImage imageWithData:gifData];
//    [gifView setUserInteractionEnabled:YES];
//    [gifView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)]];

//5 YYImage
    // !
//    UIImage *image = [YYImage imageNamed:@"test.gif"];
//    UIImageView *imageView = [[YYAnimatedImageView alloc] initWithImage:image];
//    imageView.frame = CGRectMake(0, 64, 300, 50);
//    imageView.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
//    imageView.contentMode = UIViewContentModeScaleAspectFit;
//    imageView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:imageView];

    // !!
    UIImage *image = [YYImage imageNamed:@"test.gif"];
    YYAnimatedImageView *imageView = [[YYAnimatedImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(0, 64, 300, 50);
    imageView.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
    imageView.userInteractionEnabled = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:imageView];
    [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapYYImage:)] ];
}

- (void)tapYYImage:(UITapGestureRecognizer *)gestRecognizer {
    YYAnimatedImageView *imageView = (YYAnimatedImageView *)gestRecognizer.view;
    if (imageView.currentIsPlayingAnimation) {
        [imageView stopAnimating];
    }else{
        [imageView startAnimating];
    }
}

- (void)handleTap:(UITapGestureRecognizer *)gestRecon {
    OLImageView *imageView = (OLImageView *)gestRecon.view;
    if (self.isRunning) {
        self.running = NO;
        NSLog(@"STOP");
        [imageView stopAnimating];
    } else {
        self.running = YES;
        NSLog(@"START");
        [imageView startAnimating];
    }
}


-(void)showGifImageWithWebView{
    //读取gif图片数据
    NSData *gifData = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"gif" ofType:@"gif"]];
    //UIWebView生成
    UIWebView *imageWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    //用户不可交互
    imageWebView.userInteractionEnabled = NO;
    //加载gif数据
    [imageWebView loadData:gifData MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    //视图添加此gif控件
    [self.view addSubview:imageWebView];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
