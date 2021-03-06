//
//  PeTabBar.m
//  0428newWeiBo
//
//  Created by peter　 on 15/5/8.
//  Copyright (c) 2015年 peter　. All rights reserved.
//

#import "PeTabBar.h"
@interface PeTabBar()<PeTabBarProtocol>
@property (nonatomic, weak) UIButton *plusButton;
@end

@implementation PeTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 添加加号按钮
        NSLog(@"自己的tabbar");
        [self addPlusBtn];
    }
    return self;
}

- (void) addPlusBtn
{
    UIButton *btn = [[UIButton alloc]init];
    //背景
    
    [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    
    [btn setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    // 设置图标

    
    [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    
      [btn setImage:[UIImage imageWithName:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    
    [btn addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
    
    // 添加
    
    [self addSubview:btn];

    self.plusButton = btn;
}

-(void) plusClick
{
   
    //这里应该是需要给控制器发出通知代理 让他知道这个按钮进行了点击并反应
    // 通知代理
    if ([self.delegate respondsToSelector:@selector(PlusBtnClick:)]) {
        [self.delegate PlusBtnClick:self];
    }

    
}

/**
 *  布局子控件
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
   
    //这里是加载新加的btn
    [self setupPlusButtonFrame];
    
    //更换所有btn的位置
    [self updateAllBtn];
    
  }


/**
 *  设置所有plusButton的frame
 */
- (void)setupPlusButtonFrame
{
    self.plusButton.size = self.plusButton.currentBackgroundImage.size;
    self.plusButton.center = CGPointMake(self.width * 0.5, self.height * 0.5);
}

-(void) updateAllBtn
{
    int index = 0;
    
    // 遍历所有的button
    for (UIView *tabBarButton in self.subviews) {
        // 如果不是UITabBarButton， 直接跳过
        if (![tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        
        // 根据索引调整位置
        [self setupTabBarButtonFrame:tabBarButton atIndex:index];
        
        // 遍历UITabBarButton中的所有子控件
        [self setupTabBarButtonTextColor:tabBarButton atIndex:index];
        
        // 索引增加
        index++;
    }

}


- (void)setupTabBarButtonTextColor:(UIView *)tabBarButton atIndex:(int)index
{
    // 选中按钮的索引
    int selectedIndex = [self.items indexOfObject:self.selectedItem];
    
    for (UILabel *label in tabBarButton.subviews) {
        // 说明不是个Label
        if (![label isKindOfClass:[UILabel class]]) continue;
        
        // 设置字体
        label.font = [UIFont systemFontOfSize:10];
        if (selectedIndex == index) { // 说明这个Button选中, 设置label颜色为橙色
            label.textColor = [UIColor orangeColor];
        } else { // 说明这个Button没有选中, 设置label颜色为黑色
            label.textColor = [UIColor blackColor];
        }
    }
}


/**
 *  设置某个按钮的frame
 *
 *  @param tabBarButton 需要设置的按钮
 *  @param index        按钮所在的索引
 */
- (void)setupTabBarButtonFrame:(UIView *)tabBarButton atIndex:(int)index
{
    // 计算button的尺寸
    CGFloat buttonW = self.width / (self.items.count + 1);
    CGFloat buttonH = self.height;
    
    tabBarButton.width = buttonW;
    tabBarButton.height = buttonH;
    if (index >= 2) {
        tabBarButton.x = buttonW * (index + 1);
    } else {
        tabBarButton.x = buttonW * index;
    }
    tabBarButton.y = 0;
}

@end
