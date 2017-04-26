//
//  AvailabilityViewController.h
//  CoreDataHotel
//
//  Created by Luay Younus on 4/25/17.
//  Copyright © 2017 Luay Younus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"

@interface AvailabilityViewController : UIViewController

@property(strong,nonatomic) NSDate *startDate;
@property(strong,nonatomic) NSDate *endDate;

@end
