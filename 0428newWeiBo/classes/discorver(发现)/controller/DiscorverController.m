//
//  DiscorverController.m
//  0428newWeiBo
//
//  Created by peter　 on 15/4/29.
//  Copyright (c) 2015年 peter　. All rights reserved.
//

#import "DiscorverController.h"
#import "PeSearchBar.h"


@interface DiscorverController ()

@end

@implementation DiscorverController

- (void)viewDidLoad {
    [super viewDidLoad];
    PeSearchBar *searchBar = [PeSearchBar initWithSearchBar];
    searchBar.width=300;
    searchBar.height=30;
      
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



@end
