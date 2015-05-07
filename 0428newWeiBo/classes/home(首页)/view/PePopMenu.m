//
//  PePopMenu.m
//  0428newWeiBo
//
//  Created by peter　 on 15/5/6.
//  Copyright (c) 2015年 peter　. All rights reserved.
//

#import "PePopMenu.h"

@interface  PePopMenu()

@property (nonatomic, strong) UIView *contentView;
/**
 *  最底部的遮盖 ：屏蔽除菜单以外控件的事件
 */
@property (nonatomic, weak) UIButton *cover;
/**
 *  容器 ：容纳具体要显示的内容contentView
 */
@property (nonatomic, weak) UIImageView *container;

@end

@implementation PePopMenu

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        /** 添加菜单内部的2个子控件 **/
        // 添加一个遮盖按钮
        UIButton *cover = [[UIButton alloc] init];
        cover.backgroundColor = [UIColor clearColor];
        [cover addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchDown];
        [self addSubview:cover];
        self.cover = cover;
        
        // 添加带箭头的菜单图片
        UIImageView *container = [[UIImageView alloc] init];
        container.userInteractionEnabled = YES;
        container.image = [UIImage resizedImage:@"popover_background"];
        [self addSubview:container];
        self.container = container;
    }
    return self;
}

- (instancetype)initWithContentView:(UIView *)contentView
{
    if (self = [super init]) {
        self.contentView = contentView;
    }
    return self;
}

+ (instancetype)popMenuWithContentView:(UIView *)contentView
{
    return [[self alloc] initWithContentView:contentView];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.cover.frame = self.bounds;
}

#pragma mark - 内部方法
- (void)coverClick
{
    [self dismiss];
    NSLog(@"aa");
}

#pragma mark - 公共方法
- (void)setBackground:(UIImage *)background
{
    self.container.image = background;
}

- (void)showInRect:(CGRect)rect
{
    // 添加菜单整体到窗口身上
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    self.frame = window.bounds;
    [window addSubview:self];
    
    // 设置容器的frame
    self.container.frame = rect;
    [self.container addSubview:self.contentView];
    
    // 设置容器里面内容的frame
    CGFloat topMargin = 12;
    CGFloat leftMargin = 5;
    CGFloat rightMargin = 5;
    CGFloat bottomMargin = 8;
    
    self.contentView.y = topMargin;
    self.contentView.x = leftMargin;
    self.contentView.width = self.container.width - leftMargin - rightMargin;
    self.contentView.height = self.container.height - topMargin - bottomMargin;
}

- (void)dismiss
{
   
    if ([self.delegate respondsToSelector:@selector(popMenuDidDismissed:)]) {
        [self.delegate popMenuDidDismissed:self];
    }
    
    [self removeFromSuperview];
}
@end
