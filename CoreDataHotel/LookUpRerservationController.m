//
//  LookUpRerservationController.m
//  CoreDataHotel
//
//  Created by Luay Younus on 4/26/17.
//  Copyright © 2017 Luay Younus. All rights reserved.
//

#import "LookUpRerservationController.h"
#import "AutoLayout.h"
#import "AppDelegate.h"
#import "Reservation+CoreDataClass.h"
#import "Reservation+CoreDataProperties.h"
#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"
#import "Guest+CoreDataClass.h"
#import "Guest+CoreDataProperties.h"


@interface LookUpRerservationController ()<UITableViewDataSource>

@property(strong,nonatomic) NSFetchedResultsController *allReservations;
@property(strong,nonatomic) UITableView *tableView;

@end

@implementation LookUpRerservationController

- (void)loadView{
    [super loadView];
    [self setupLayout];
    
}
-(void)setupLayout{
    self.tableView = [[UITableView alloc]init];
    [self.view addSubview:self.tableView];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [AutoLayout fullScreenConstraintsWithVFLForView:self.tableView];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
//    self.allRooms = [[self.hotel rooms] allObjects];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}

-(NSFetchedResultsController *)allReservations{
    if (!_allReservations) {
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        NSFetchRequest *reservationRequest = [NSFetchRequest fetchRequestWithEntityName:@"Reservation"];
        NSSortDescriptor *hotelDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"room.hotel.name" ascending:YES];
        NSSortDescriptor *roomNumberDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"room.number" ascending:YES];
        NSArray *sortDescriptors = [NSArray arrayWithObjects:hotelDescriptor, roomNumberDescriptor, nil];
        
        reservationRequest.sortDescriptors = sortDescriptors;
        NSError *reservationError;
        
        _allReservations = [[NSFetchedResultsController alloc] initWithFetchRequest:reservationRequest managedObjectContext:appDelegate.persistentContainer.viewContext sectionNameKeyPath:@"room.hotel.name" cacheName:nil];

        [_allReservations performFetch:&reservationError];
    }
    return _allReservations;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(self.allReservations.sections.count == 0){
        return 0;
    } else {
    id<NSFetchedResultsSectionInfo> sectionInfo = [self.allReservations.sections objectAtIndex:section];
    return sectionInfo.numberOfObjects;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.allReservations.sections.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    id<NSFetchedResultsSectionInfo> sectionInfo = [self.allReservations.sections objectAtIndex:section];
    return sectionInfo.name;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    Reservation *reservation = [self.allReservations objectAtIndexPath:indexPath];
    cell.textLabel.numberOfLines = 2;
    cell.textLabel.text = [NSString stringWithFormat:@"Room Number: %i \nGuest Name: %@ %@",reservation.room.number, reservation.guest.firstName,reservation.guest.lastName];
    return cell;
    
}

@end
