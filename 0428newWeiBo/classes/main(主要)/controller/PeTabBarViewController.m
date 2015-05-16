//
//  PeTabBarViewController.m
//  0428newWeiBo
//
//  Created by peter　 on 15/4/28.
//  Copyright (c) 2015年 peter　. All rights reserved.
//

#import "PeTabBarViewController.h"
#import "HomeViewController.h"
#import "DiscorverController.h"
#import "ProfileViewController.h"
#import "PeTabBar.h"
#import "ComPoseController.h"
@interface PeTabBarViewController() <UITabBarControllerDelegate,PeTabBarProtocol>

@end


@implementation PeTabBarViewController

 - (void)viewDidLoad
{
    [super viewDidLoad];

    
    HomeViewController *home = [[HomeViewController alloc]init];
    [self addOneChildVc:home title:@"首页" imageName:@"tabbar_home"  selectedName:@"tabbar_home_selected"];
    
    UITableViewController *message = [[UITableViewController alloc]init];
      [self addOneChildVc:message title:@"消息" imageName:@"tabbar_message_center"  selectedName:@"tabbar_message_center_selected"];
    DiscorverController *discover = [[DiscorverController alloc]init];
      [self addOneChildVc:discover title:@"发现" imageName:@"tabbar_discover"  selectedName:@"tabbar_discover_selected"];
    ProfileViewController *profile = [[ProfileViewController alloc]init];
      [self addOneChildVc:profile title:@"我" imageName:@"tabbar_profile"  selectedName:@"tabbar_profile_selected"];
    
    //更换自定义的tabbar
    PeTabBar *tabbar = [[PeTabBar alloc]init];
    tabbar.backgroundImage = [UIImage imageNamed:@"tabbar_background"];
    tabbar.selectionIndicatorImage = [UIImage imageWithName:@"navigationbar_button_background"];
    [self setValue:tabbar forKey:@"tabBar"];
    
    //监听按钮点击
     self.delegate = self;
    //把所有的文字大小都统一
    [self fontInit];
}

-(void)PlusBtnClick:(UITabBar *)tabBar
{
    NSLog(@"点击了按钮");
    //弹出发微博的控制器
    ComPoseController *compose =[[ComPoseController alloc]init];
    UINavigationController *controller = [[UINavigationController alloc]initWithRootViewController:compose];
    [self presentViewController:controller animated:YES completion:nil];
    
    
}

- (void) fontInit
{
    
    // 通过appearance对象能修改整个项目中所有UIBarButtonItem的样式
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    
    /**设置文字属性**/
    // 设置普通状态的文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
   
    
    
    
    
    textAttrs[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    [appearance setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置高亮状态的文字属性
    NSMutableDictionary *highTextAttrs = [NSMutableDictionary dictionaryWithDictionary:textAttrs];
    highTextAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    [appearance setTitleTextAttributes:highTextAttrs forState:UIControlStateHighlighted];
    
    // 设置不可用状态(disable)的文字属性
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionaryWithDictionary:textAttrs];
    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [appearance setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
    
    /**设置背景**/
    // 技巧: 为了让某个按钮的背景消失, 可以设置一张完全透明的背景图片
    [appearance setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    

}

/**
 *  添加一个子控制器
 *
 *  @param childVc           子控制器对象
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */


-(void) addOneChildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imagedName selectedName:(NSString *) selectedName
{
    childVc.title = title;
    
   
    childVc.tabBarItem.image = [UIImage imageNamed:imagedName];
    UIImage *selectedImage = [UIImage imageWithName:selectedName];
    
    // 设置tabBarItem的普通文字颜色
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置tabBarItem的选中文字颜色
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    if (iOS7) {
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    childVc.tabBarItem.selectedImage = selectedImage;
   
    
    
    // 添加为tabbar控制器的子控制器
    //自定义navigationContoller
//    PeNavigationController *nav = [[PeNavigationController alloc] initWithRootViewController:childVc];
//    [self addChildViewController:nav];
    
    UINavigationController *nav  = [[UINavigationController alloc] initWithRootViewController:childVc];
     [self addChildViewController:nav];
    //    [self addChildViewController:nav];
}
/**
 
 */

@end
