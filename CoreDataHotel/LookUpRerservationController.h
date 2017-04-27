//
//  LookUpRerservationController.h
//  CoreDataHotel
//
//  Created by Luay Younus on 4/26/17.
//  Copyright © 2017 Luay Younus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"

@interface LookUpRerservationController : UIViewController

@property(strong,nonatomic) Room *room;
@property(strong,nonatomic) NSDate *startDate;
@property(strong,nonatomic) NSDate *endDate;
@property(strong,nonatomic) NSFetchedResultsController *availableRooms;

@end
