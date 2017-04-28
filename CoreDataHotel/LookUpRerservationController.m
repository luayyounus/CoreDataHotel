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


@interface LookUpRerservationController ()<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property(strong, nonatomic) UISearchBar *searchBar;
@property(strong,nonatomic) UITableView *tableView;

@property(strong,nonatomic) NSFetchedResultsController *resultsFetched;
@property(strong,nonatomic) NSArray *allReservations;
@property(strong,nonatomic) NSArray *filteredReservations;

@end

@implementation LookUpRerservationController{
    BOOL searchEnabled;
}

- (void)loadView{
    [super loadView];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setupLayout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    
    self.filteredReservations = self.resultsFetched.fetchedObjects;
    self.allReservations = self.filteredReservations;
}

-(void)setupLayout{
    
    self.searchBar = [[UISearchBar alloc]init];
    self.tableView = [[UITableView alloc] init];
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.searchBar];
    
    self.searchBar.delegate = self;
    
    self.searchBar.placeholder = @"Enter a guest name";
    self.searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
    self.searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.searchBar.keyboardType = UIKeyboardTypeAlphabet;
    self.searchBar.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [AutoLayout leadingConstraintFrom:self.searchBar toView:self.view];
    [AutoLayout trailingConstraintFrom:self.searchBar toView:self.view];
    [AutoLayout fullScreenConstraintsWithVFLForView:self.tableView];
    
    
    self.tableView.tableHeaderView = self.searchBar;
    [self.tableView.tableHeaderView layoutIfNeeded];
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];

}

-(NSFetchedResultsController *)resultsFetched{
    if (!_resultsFetched) {
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        NSFetchRequest *reservationRequest = [NSFetchRequest fetchRequestWithEntityName:@"Reservation"];
        NSSortDescriptor *hotelDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"room.hotel.name" ascending:YES];
        NSSortDescriptor *roomNumberDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"room.number" ascending:YES];
        NSArray *sortDescriptors = [NSArray arrayWithObjects:hotelDescriptor, roomNumberDescriptor, nil];
        
        reservationRequest.sortDescriptors = sortDescriptors;
        NSError *reservationError;
        
        _resultsFetched = [[NSFetchedResultsController alloc] initWithFetchRequest:reservationRequest managedObjectContext:appDelegate.persistentContainer.viewContext sectionNameKeyPath:@"room.hotel.name" cacheName:nil];

        [_resultsFetched performFetch:&reservationError];
    }
    return _resultsFetched;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.filteredReservations.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    Reservation *reservation = self.filteredReservations[indexPath.row];
    cell.textLabel.numberOfLines = 2;
    
    cell.textLabel.text = [NSString stringWithFormat:@"Room Number: %i \nGuest Name: %@ %@",reservation.room.number, reservation.guest.firstName,reservation.guest.lastName];
    return cell;
}

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    
}

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    searchEnabled = YES;
    [self.searchBar setShowsCancelButton:YES];
    [self.searchBar isFirstResponder];
}
-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    searchEnabled = NO;
    [searchBar setShowsCancelButton:NO];
    [self.tableView reloadData];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self.searchBar setShowsCancelButton:NO];
    [self.searchBar resignFirstResponder];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    searchEnabled = YES;
    if ([self.searchBar.text isEqual: @""]){
        self.filteredReservations = self.allReservations;
    } else {
        self.filteredReservations = [[self.filteredReservations filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"guest.lastName CONTAINS[c] %@ OR guest.firstName CONTAINS[c] %@", self.searchBar.text, self.searchBar.text]] mutableCopy];
    }
    [self.tableView reloadData];
}

@end
