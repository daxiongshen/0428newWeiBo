//
//  ProfileViewController.m
//  0428newWeiBo
//
//  Created by peter　 on 15/5/7.
//  Copyright (c) 2015年 peter　. All rights reserved.
//

#import "ProfileViewController.h"
#import "PePopMenu.h"

@interface ProfileViewController ()<PePopMenuDelegate>

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStyleBordered target:self action:@selector(setting)];
}

- (void)setting
{
    UITableView *tableView = [[UITableView alloc] init];
    tableView.backgroundColor = [UIColor redColor];
    
    PePopMenu *menu = [[PePopMenu alloc]initWithContentView:tableView];
    CGFloat menuW = 100;
    CGFloat menuH = 200;
    CGFloat menuY = 55;
    CGFloat menuX = (self.view.width - menuW) * 0.5;
    menu.delegate= self;
    [menu showInRect:CGRectMake(menuX, menuY, menuW, menuH)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}



#pragma mark - 弹出菜单协议
- (void)popMenuDidDismissed:(PePopMenu *)menu
{
    
    NSLog(@"点击了取消");
}

@end
