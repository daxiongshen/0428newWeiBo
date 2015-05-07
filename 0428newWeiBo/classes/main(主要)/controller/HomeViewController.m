//
//  HomeViewController.m
//  0428newWeiBo
//
//  Created by peter　 on 15/4/28.
//  Copyright (c) 2015年 peter　. All rights reserved.
//

#import "HomeViewController.h"
#import "PeTitleButton.h"
#import "PePopMenu.h"

@interface HomeViewController () <PePopMenuDelegate>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_friendsearch"  highImageName:@"navigationbar_friendsearch_highlighted" target:self action:@selector(friendSearch)];
   
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_friendsearch"  highImageName:@"navigationbar_friendsearch_highlighted" target:self action:@selector(friendSearch)];
    
    //加载一个textView玩一玩
    
    UITextField *text = [[UITextField alloc]init];
    text.backgroundColor = [UIColor greenColor];
    text.frame = CGRectMake(100, 100, 100, 30);
    //可以使用inputAccessoryView 这个属性自定义键盘

      text.inputAccessoryView = [[[NSBundle mainBundle] loadNibNamed:@"KeyboardTool" owner:nil options:nil] lastObject];
    
    
      [self.view addSubview:text];
    
    //搞一个标题按钮
    
    PeTitleButton *titleButton= [[PeTitleButton alloc]init];
    // 设置文字
    [titleButton setTitle:@"首页" forState:UIControlStateNormal];
    // 设置图标
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    // 设置背景
    [titleButton setBackgroundImage:[UIImage resizedImage:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];
    // 设置尺寸
    titleButton.width = 100;
    titleButton.height = 35;
    // 监听按钮点击
    // 监听按钮点击
    [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
      self.navigationItem.titleView = titleButton;
   

}





- (void)titleClick:(UIButton *)titleButton
{
    
    /**
    NSLog(@"按钮点击");
    if (titleButton.tag==10) {
        titleButton.tag=1;
        [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    }
    else
    {
        titleButton.tag=10;
        [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];

    }
     **/
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    
    // 弹出菜单
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.backgroundColor = [UIColor redColor];

    PePopMenu *menu = [[PePopMenu alloc]initWithContentView:button];
     menu.delegate = self;
     [menu showInRect:CGRectMake(100, 100, 100, 100)];

}


- (void)friendSearch
{
    NSLog(@"friendSearch---");
    
    
}

#pragma mark - 弹出菜单协议
- (void)popMenuDidDismissed:(PePopMenu *)menu
{
   
    PeTitleButton *titleBtn = (PeTitleButton *)self.navigationItem.titleView;
    [titleBtn setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
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
