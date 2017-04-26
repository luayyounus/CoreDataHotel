//
//  AvailabilityViewController.m
//  CoreDataHotel
//
//  Created by Luay Younus on 4/25/17.
//  Copyright © 2017 Luay Younus. All rights reserved.
//

#import "AvailabilityViewController.h"
#import "AutoLayout.h"
#import "AppDelegate.h"
#import "Reservation+CoreDataClass.h"
#import "Reservation+CoreDataProperties.h"
#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"
#import "BookViewController.h"
#import "Hotel+CoreDataClass.h"
#import "Hotel+CoreDataProperties.h"


@interface AvailabilityViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(strong,nonatomic) NSFetchedResultsController *availableRooms;
@property(strong,nonatomic) UITableView *tableView;

@end

@implementation AvailabilityViewController

-(NSFetchedResultsController *)availableRooms{
    
    if (!_availableRooms){
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Reservation"];
        
        request.predicate = [NSPredicate predicateWithFormat:@"startDate <=%@ AND endDate >= %@", self.endDate, [NSDate date]];
        
        NSError *roomError;
        NSArray *results = [appDelegate.persistentContainer.viewContext executeFetchRequest:request error:&roomError];
        NSMutableArray *unavilableRooms = [[NSMutableArray alloc]init];
        
        
        
        for(Reservation *reservation in results){
            [unavilableRooms addObject:reservation.room];
        }
        
        NSFetchRequest *roomRequest = [NSFetchRequest fetchRequestWithEntityName:@"Room"];
        roomRequest.predicate = [NSPredicate predicateWithFormat:@"NOT self IN %@",unavilableRooms];
        
        NSSortDescriptor *roomSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"hotel.name" ascending:YES];
        
        NSSortDescriptor *roomNumberSortDecriptor = [NSSortDescriptor sortDescriptorWithKey:@"number" ascending:YES];
        
        
        //the first parameter is the section the will be added
        roomRequest.sortDescriptors = @[roomSortDescriptor,roomNumberSortDecriptor];
        
        NSError *availableRoomError;
        
//        _availableRooms = [appDelegate.persistentContainer.viewContext executeFetchRequest:roomRequest error:&availableRoomError];
        
        _availableRooms = [[NSFetchedResultsController alloc]initWithFetchRequest:roomRequest managedObjectContext:appDelegate.persistentContainer.viewContext sectionNameKeyPath:@"hotel.name" cacheName:nil];
        
        [_availableRooms performFetch:&availableRoomError];
        
    }
    
    return _availableRooms;
}

-(void)loadView{
    [super loadView];
    
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self setupTableView];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)setupTableView{
    self.tableView = [[UITableView alloc]init];
    
    [self.view addSubview:self.tableView];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"roomCell"];
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [AutoLayout fullScreenConstraintsWithVFLForView:self.tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    id<NSFetchedResultsSectionInfo> sectionInfo = [[self.availableRooms sections]objectAtIndex:section];
    return sectionInfo.numberOfObjects;
    //    return self.availableRooms.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *roomCell = [tableView dequeueReusableCellWithIdentifier:@"roomCell" forIndexPath:indexPath];
    
//    Room *currentRoom = self.availableRooms[indexPath.row];
    Room *currentRoom = [self.availableRooms objectAtIndexPath:indexPath];
    
    roomCell.textLabel.text = [NSString stringWithFormat:@"%i",currentRoom.number];
    
    return roomCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //Room *room = self.availableRoom[indexPath.row];
    Room *room = [self.availableRooms objectAtIndexPath:indexPath];
    
    BookViewController *bookVC = [[BookViewController alloc]init];
    bookVC.room = room;
    [self.navigationController pushViewController:bookVC animated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.availableRooms.sections.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    id<NSFetchedResultsSectionInfo> sectionInfo = [[self.availableRooms sections]objectAtIndex:section];
    return sectionInfo.name;
}

@end
