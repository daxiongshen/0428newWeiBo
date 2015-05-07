//
//  PeTitleButton.m
//  0428newWeiBo
//
//  Created by peter　 on 15/4/30.
//  Copyright (c) 2015年 peter　. All rights reserved.
//

#import "PeTitleButton.h"

@implementation PeTitleButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //图标居中
        self.imageView.contentMode=UIViewContentModeCenter;
        //文字对其
        self.titleLabel.textAlignment = NSTextAlignmentRight;
        //文字颜色
        [self setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        //字体
        self.titleLabel.font = HMNavigationTitleFont;
        // 高亮的时候不需要调整内部的图片为灰色
        self.adjustsImageWhenHighlighted = NO;
        
        
    }
    return self;
}

/**
 *  设置内部图标的frame
 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageY = 0;
    CGFloat imageW = self.height;
    CGFloat imageH = imageW;
    CGFloat imageX = self.width - imageW;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

/**
 *  设置内部文字的frame
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = 0;
    CGFloat titleX = 0;
    CGFloat titleH = self.height;
    CGFloat titleW = self.width - self.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}


@end
