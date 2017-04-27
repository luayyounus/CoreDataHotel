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


@interface LookUpRerservationController ()<UITableViewDataSource, UITabBarDelegate, UISearchBarDelegate, UISearchResultsUpdating>

@property(strong, nonatomic) UISearchBar *searchBar;
@property(strong,nonatomic) UITableView *tableView;

@property(strong,nonatomic) NSFetchedResultsController *allReservations;
@property(strong,nonatomic) NSFetchedResultsController *filteredReservations;
@property(strong,nonatomic) NSArray *searchResult;

@end

@implementation LookUpRerservationController{
    NSMutableArray *tableArray;
    BOOL searchEnabled;
}

- (void)loadView{
    [super loadView];
    [self setupLayout];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.filteredReservations = self.allReservations;
    
    tableArray = [[NSMutableArray alloc]initWithObjects:self.allReservations, nil];
    self.searchResult = [NSMutableArray arrayWithCapacity:[tableArray count]];

    self.searchBar.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
   
}
-(void)setupLayout{
    UISearchController *searchController = [[UISearchController alloc] initWithSearchResultsController:self];
    [searchController.searchResultsUpdater self];
    searchController.searchBar.placeholder = @"Enter a guest name";
    self.definesPresentationContext = YES;
    
    self.searchBar = [[UISearchBar alloc]init];
    self.searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
    self.searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.searchBar.keyboardType = UIKeyboardTypeAlphabet;

    self.tableView = [[UITableView alloc]init];
    self.tableView.tableHeaderView = searchController.searchBar;
    self.searchBar.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.tableView];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [AutoLayout fullScreenConstraintsWithVFLForView:self.tableView];
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
        id<NSFetchedResultsSectionInfo> sectionInfo = [self.filteredReservations.sections objectAtIndex:section];
        return sectionInfo.numberOfObjects;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.filteredReservations.sections.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    id<NSFetchedResultsSectionInfo> sectionInfo = [self.filteredReservations.sections objectAtIndex:section];
    return sectionInfo.name;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    Reservation *reservation = [self.filteredReservations objectAtIndexPath:indexPath];
    cell.textLabel.numberOfLines = 2;
    cell.textLabel.text = [NSString stringWithFormat:@"Room Number: %i \nGuest Name: %@ %@",reservation.room.number, reservation.guest.firstName,reservation.guest.lastName];

    return cell;
}

//-(void)filterContentForSearchText:(NSString*)searchText{
//    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"%K CONTAINS %@", "guest.firstName", searchText];
//    self.searchResult = [tableArray filteredArrayUsingPredicate:resultPredicate];
//    [self.tableView reloadData];
//}
//
//-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
//    if (self.searchBar.text.length == 0){
//        searchEnabled = NO;
//        [self.tableView reloadData];
//    } else{
//        searchEnabled = YES;
//        
//    }
//}
//-(void) searchBarTextDidBeginEditing(searchBar: UISearchBar) {
//    shouldShowSearchResults = true
//    tblSearchResults.reloadData()
//}
//
//
//func searchBarCancelButtonClicked(searchBar: UISearchBar) {
//    shouldShowSearchResults = false
//    tblSearchResults.reloadData()
//}


//- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope{

    //    NSString *tempText = self.searchBar.text;
    //
    //    if (tempText != nil){
    //        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name contains[cd] %@", tempText];
    //        [NSFetchedResultsController.fetchRequest setPredicate:predicate];
    //    } else {
    //        NSPredicate *predicate =[NSPredicate predicateWithFormat:@"All"];
    //        [NSFetchedResultsController.fetchRequest setPredicate:predicate];
    //    }
    
//    [self.tableView reloadData];

    //    [searchBar resignFirstResponder];
    //    [_shadeView setAlpha:0.0f];
    
//}


@end
