//
//  HomeViewController.m
//  0428newWeiBo
//
//  Created by peter　 on 15/4/28.
//  Copyright (c) 2015年 peter　. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"aa");
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_friendsearch"  highImageName:@"navigationbar_friendsearch_highlighted" target:self action:@selector(friendSearch)];
   
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_friendsearch"  highImageName:@"navigationbar_friendsearch_highlighted" target:self action:@selector(friendSearch)];
    
    //加载一个textView玩一玩
    
    UITextField *text = [[UITextField alloc]init];
    text.backgroundColor = [UIColor greenColor];
    text.frame = CGRectMake(100, 100, 100, 30);
    //可以使用inputAccessoryView 这个属性自定义键盘

      text.inputAccessoryView = [[[NSBundle mainBundle] loadNibNamed:@"KeyboardTool" owner:nil options:nil] lastObject];
    
    
      [self.view addSubview:text];
    
    
    

}

- (void)friendSearch
{
    NSLog(@"friendSearch---");
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"首页测试数据----%d", indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *newVc = [[UIViewController alloc] init];
    newVc.view.backgroundColor = [UIColor redColor];
    newVc.title = @"新控制器";
    [self.navigationController pushViewController:newVc animated:YES];
}


@end
