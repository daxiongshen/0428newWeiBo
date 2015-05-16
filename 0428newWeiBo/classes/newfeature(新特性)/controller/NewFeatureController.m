//
//  NewFeatureController.m
//  0428newWeiBo
//
//  Created by peter　 on 15/5/14.
//  Copyright (c) 2015年 peter　. All rights reserved.
//
#define scViewImgCount  4

#import "NewFeatureController.h"
#import "PeTabBarViewController.h"



@interface NewFeatureController()<UIScrollViewDelegate>

@property(nonatomic,weak)UIPageControl *pageControl;


@end

@implementation NewFeatureController

- (void)viewDidLoad
{
    NSLog(@"新特性界面");
    [super viewDidLoad];
    
    // 1.添加UISrollView
    [self setupScrollView];
    // PAGEControl
    [self setupPageControl];
}

-(void) setupScrollView
{
    UIScrollView *scView = [[UIScrollView alloc]init];
    scView.frame = self.view.bounds;
    scView.delegate = self;
    [self.view addSubview:scView];
    
    //添加图片
    CGFloat imageW = scView.width;
    CGFloat imageH = scView.height;
    for (int i = 0; i<scViewImgCount; i++) {
        // 创建UIImageView
        UIImageView *imageView = [[UIImageView alloc] init];
        NSString *name = [NSString stringWithFormat:@"new_feature_%d", i + 1];
        if (FourInch) { // 4inch  需要手动去加载4inch对应的-568h图片
            name = [name stringByAppendingString:@"-568h"];
        }
        UIImage *image = [UIImage imageWithName:name];
        imageView.image = image;
        [scView addSubview:imageView];
        
        // 设置frame
        imageView.y = 0;
        imageView.width = imageW;
        imageView.height = imageH;
        imageView.x = i * imageW;
        
        if(i==scViewImgCount-1)
        {
            [self setupLastConfirmView:imageView];
        }
    }
    
    // 3.设置其他属性
    scView.contentSize = CGSizeMake(scViewImgCount * imageW, 0);
    scView.pagingEnabled = YES;
    scView.showsHorizontalScrollIndicator = NO;
    scView.backgroundColor = HMColor(246, 246, 246);
    
}

- (void)setupLastConfirmView:(UIImageView *) imageView
{
      imageView.userInteractionEnabled = YES;
    // 1.添加开始按钮
    [self setupStartButton:imageView];
    
    // 2.添加分享按钮
    [self setupShareButton:imageView];
}

- (void)setupPageControl
{
    // 1.添加
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = scViewImgCount;
    pageControl.centerX= self.view.width * 0.5;
    pageControl.centerY = self.view.height - 30;
    [self.view addSubview:pageControl];
    
    // 2.设置圆点的颜色
    pageControl.currentPageIndicatorTintColor = HMColor(253, 98, 42); // 当前页的小圆点颜色
    pageControl.pageIndicatorTintColor = HMColor(189, 189, 189); // 非当前页的小圆点颜色
    self.pageControl = pageControl;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
   //获得页码
   
    CGFloat doublePage = scrollView.contentOffset.x/scrollView.width;
    int intPage = (int)(doublePage + 0.5);
    
    // 设置页码
    self.pageControl.currentPage = intPage;
    
}



/**
 *  添加开始按钮
 */
- (void)setupStartButton:(UIImageView *)imageView
{
    // 1.添加开始按钮
    UIButton *startButton = [[UIButton alloc] init];
    [imageView addSubview:startButton];
    
    // 2.设置背景图片
    [startButton setBackgroundImage:[UIImage imageWithName:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startButton setBackgroundImage:[UIImage imageWithName:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    
    // 3.设置frame
    startButton.size = startButton.currentBackgroundImage.size;
    startButton.centerX = self.view.width * 0.5;
    startButton.centerY = self.view.height * 0.8;
    
    // 4.设置文字
    [startButton setTitle:@"开始微博" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
}

- (void) start{
    NSLog(@"开始程序");
    PeTabBarViewController *controll = [[PeTabBarViewController alloc]init];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = controll;
    
}


/**
 *  添加分享按钮
 */
- (void)setupShareButton:(UIImageView *)imageView
{
    // 1.添加分享按钮
    UIButton *shareButton = [[UIButton alloc] init];
    //    shareButton.backgroundColor = [UIColor redColor];
    //    shareButton.titleLabel.backgroundColor = [UIColor blueColor];
    [imageView addSubview:shareButton];
    
    // 2.设置文字和图标
    [shareButton setTitle:@"分享给大家" forState:UIControlStateNormal];
    [shareButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [shareButton setImage:[UIImage imageWithName:@"new_feature_share_false"] forState:UIControlStateNormal];
    [shareButton setImage:[UIImage imageWithName:@"new_feature_share_true"] forState:UIControlStateSelected];
    [shareButton addTarget:self action:@selector(shared:) forControlEvents:UIControlEventTouchUpInside];
    
    // 3.设置frame
    shareButton.size = CGSizeMake(150, 35);
    shareButton.centerX = self.view.width * 0.5;
    shareButton.centerY = self.view.height * 0.7;
      shareButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
}

- (void)shared :(UIButton *)shareButton
{
    shareButton.selected = !shareButton.isSelected;
    if (shareButton.selected==YES) {
        NSLog(@"分享给大家");
    }
    

}


@end
