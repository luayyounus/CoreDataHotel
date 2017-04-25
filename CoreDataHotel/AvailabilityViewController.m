//
//  AvailabilityViewController.m
//  CoreDataHotel
//
//  Created by Luay Younus on 4/25/17.
//  Copyright © 2017 Luay Younus. All rights reserved.
//

#import "AvailabilityViewController.h"

@interface AvailabilityViewController ()<UITableViewDataSource>

@property(strong,nonatomic) NSArray *availableRooms;
@property(strong,nonatomic) UITableView *tableView;

@end

@implementation AvailabilityViewController

-(void)loadView{
    [super loadView];
    [self setupTableView];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)setupTableView{
    self.tableView = [[UITableView alloc]init];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"roomCell"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.availableRooms.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *roomCell = [tableView dequeueReusableCellWithIdentifier:@"roomCell" forIndexPath:indexPath];
    
    //Some Logic for the cell
    return roomCell;
}



@end
