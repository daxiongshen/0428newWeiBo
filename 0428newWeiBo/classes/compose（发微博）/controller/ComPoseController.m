//
//  ComPoseController.m
//  0428newWeiBo
//
//  Created by peter　 on 15/5/8.
//  Copyright (c) 2015年 peter　. All rights reserved.
//

#import "ComPoseController.h"

@implementation ComPoseController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"这是微博界面了");
    self.title = @"发微博";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStylePlain target:self action:@selector(send)];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
}


- (void) cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) send
{
    NSLog(@"发送");
}
@end
