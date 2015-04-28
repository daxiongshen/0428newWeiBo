//
//  PeTabBarViewController.m
//  0428newWeiBo
//
//  Created by peter　 on 15/4/28.
//  Copyright (c) 2015年 peter　. All rights reserved.
//

#import "PeTabBarViewController.h"

@implementation PeTabBarViewController

 - (void)viewDidLoad
{
    
    UITableViewController *home = [[UITableViewController alloc]init];
    [self addOneChildVc:home title:@"首页" imageName:@"tabbar_home"  selectedName:@"tabbar_home_selected"];
    UITableViewController *message = [[UITableViewController alloc]init];
      [self addOneChildVc:message title:@"消息" imageName:@"tabbar_message_center"  selectedName:@"tabbar_message_center_selected"];
    UITableViewController *discover = [[UITableViewController alloc]init];
      [self addOneChildVc:discover title:@"发现" imageName:@"tabbar_discover"  selectedName:@"tabbar_discover_selected"];
    UITableViewController *profile = [[UITableViewController alloc]init];
      [self addOneChildVc:profile title:@"我" imageName:@"tabbar_profile"  selectedName:@"tabbar_profile_selected"];
    
    
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
    childVc.view.backgroundColor = HMRandomColor;
    
    childVc.tabBarItem.title=title;
    childVc.tabBarItem.image = [UIImage imageNamed:imagedName];
    UIImage *selectedImage = [UIImage imageWithName:selectedName];
    
    if (iOS7) {
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    childVc.tabBarItem.selectedImage = selectedImage;
    [self addChildViewController:childVc];
}
/**
 
 */

@end
