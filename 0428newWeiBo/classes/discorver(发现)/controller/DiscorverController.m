//
//  DiscorverController.m
//  0428newWeiBo
//
//  Created by peter　 on 15/4/29.
//  Copyright (c) 2015年 peter　. All rights reserved.
//

#import "DiscorverController.h"
 #import "UIImage+Extension.h"
@interface DiscorverController ()

@end

@implementation DiscorverController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITextField *searchBar = [[UITextField alloc]init];
    searchBar.width = 300;
    searchBar.height=30;
    
  
    // 设置背景
    searchBar.background = [UIImage resizedImage:@"searchbar_textfield_background"];
    
    //内容垂直居中
    searchBar.contentVerticalAlignment =UIControlContentVerticalAlignmentCenter;
    
    //加放大镜
    UIImageView *leftView = [[UIImageView alloc]init];
    leftView.image  = [UIImage imageWithName:@"searchbar_textfield_search_icon"];
    leftView.height = searchBar.height;
    leftView.width = searchBar.height;
    
    leftView.contentMode=UIViewContentModeCenter;
    searchBar.leftView = leftView;
    
    // 设置左边的view永远显示
    searchBar.leftViewMode = UITextFieldViewModeAlways;
    //设置右边的清除按钮
    searchBar.clearButtonMode = UITextFieldViewModeAlways;
    
    self.navigationItem.titleView = searchBar;
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

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
