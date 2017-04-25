//
//  HotelsViewController.m
//  CoreDataHotel
//
//  Created by Luay Younus on 4/24/17.
//  Copyright © 2017 Luay Younus. All rights reserved.
//

#import "HotelsViewController.h"
#import "AppDelegate.h"
#import "Hotel+CoreDataClass.h"
#import "Hotel+CoreDataProperties.h"
#import "AutoLayout.h"
#import "ViewController.h"
#import "RoomsViewController.h"


@interface HotelsViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(strong,nonatomic) NSArray *allHotels;
@property(strong,nonatomic) UITableView *tableView;

@end

@implementation HotelsViewController


-(void)loadView{
    [super loadView];
    
}

- (void)viewDidLoad {
    [self setupLayout];

    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self allHotels];
}

-(void)setupLayout{
    self.tableView = [[UITableView alloc]init];
    [self.view addSubview:self.tableView];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [AutoLayout fullScreenConstraintsWithVFLForView:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];

}

//getter, if we dont have the data for all Hotels, go bring it!
-(NSArray *)allHotels{
    if(!_allHotels){
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        
        NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
        
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
        
        NSError *fetchError;
        NSArray *hotels = [context executeFetchRequest:request error:&fetchError];
        
        if(fetchError){
            NSLog(@"There was an error fetching hotels from Core Data!");
        }
        
        _allHotels = hotels;
        NSLog(@"%@", self.allHotels);
    }
    
    return _allHotels;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.allHotels.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Hotel *currentHotel = self.allHotels[indexPath.row];
    cell.textLabel.text = currentHotel.name;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    RoomsViewController *roomVC = [[RoomsViewController alloc]init];
    roomVC.hotel = self.allHotels[indexPath.row];
    [self.navigationController pushViewController:roomVC animated:YES];
}


@end
