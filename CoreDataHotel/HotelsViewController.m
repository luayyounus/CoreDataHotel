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

@interface HotelsViewController ()

@property(strong,nonatomic) NSArray *allHotels;
@property(strong,nonatomic) UITableView *tableView;

@end

@implementation HotelsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

//getter, if we dont have the data for all Hotels, go bring it!
-(NSArray *)allHotels{
    if(!_allHotels){
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        
        NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
        
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Hotels"];
        
        NSError *fetchError;
        NSArray *hotels = [context executeFetchRequest:request error:&fetchError];
        
        if(fetchError){
            NSLog(@"There was an error fetching hotels from Core Data!");
        }
        
        _allHotels = hotels;
    }
    
    return _allHotels;

}

@end
