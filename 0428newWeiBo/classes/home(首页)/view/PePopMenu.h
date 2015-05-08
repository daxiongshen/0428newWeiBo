//
//  PePopMenu.h
//  0428newWeiBo
//
//  Created by peter　 on 15/5/6.
//  Copyright (c) 2015年 peter　. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    PositionCenter = 0,
    PositionLeft = 1,
    PositionRight = 2,
} ArrayPosition ;
@class PePopMenu;



@protocol PePopMenuDelegate <NSObject>

@optional
-(void) popMenuDidDismissed:(PePopMenu *)popMenu;
@end





@interface PePopMenu : UIView
@property(nonatomic,weak) id <PePopMenuDelegate> delegate;

@property(nonatomic,assign,getter= isDimBackGround ) BOOL dimBackGround;



@property (nonatomic, assign) ArrayPosition arrowPosition ;

-(instancetype) initWithContentView:(UIView *)view;

-(void) showInRect:(CGRect )rect;
@end
