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

@interface HotelsViewController ()<UITableViewDataSource>

@property(strong,nonatomic) NSArray *allHotels;
@property(strong,nonatomic) UITableView *tableView;

@end

@implementation HotelsViewController


-(void)loadView{
    [super loadView];
    
    [self setupLayout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableView class] forCellReuseIdentifier:@"cell"];
    
    [self allHotels];
}

-(void)setupLayout{
    self.tableView = [[UITableView alloc]init];
    [self.view addSubview:self.tableView];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [AutoLayout fullScreenConstraintsWithVFLForView:self.tableView];    
}

//getter, if we dont have the data for all Hotels, go bring it!
-(NSArray *)allHotels{
    if(!self.allHotels){
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        
        NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
        
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
        
        NSError *fetchError;
        NSArray *hotels = [context executeFetchRequest:request error:&fetchError];
        
        if(fetchError){
            NSLog(@"There was an error fetching hotels from Core Data!");
        }
        
        self.allHotels = hotels;
        NSLog(@"%@", self.allHotels);
    }
    
    return self.allHotels;

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

@end
