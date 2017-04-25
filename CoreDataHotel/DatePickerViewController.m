//
//  DatePickerViewController.m
//  CoreDataHotel
//
//  Created by Luay Younus on 4/25/17.
//  Copyright © 2017 Luay Younus. All rights reserved.
//

#import "DatePickerViewController.h"
#import "AvailabilityViewController.h"
#import "AutoLayout.h"

@interface DatePickerViewController ()

@property(strong,nonatomic)UIDatePicker *startDate;
@property(strong,nonatomic)UIDatePicker *endDate;
@property(strong,nonatomic)NSCalendar *tomorrow;

@end

@implementation DatePickerViewController

-(void)loadView{
    [super loadView];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setupDatePickers];
    [self setupDoneButton];
    
    [self.view addSubview:self.startDate];
    [self.view addSubview:self.endDate];
}

-(void)setupDoneButton{

    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonPressed)];
    [self.navigationItem setRightBarButtonItem:doneButton];
}
-(void)doneButtonPressed{
    
    NSDate *startDate = self.startDate.date;
    NSDate *endDate = self.endDate.date;
    
    if ([endDate timeIntervalSinceReferenceDate] < [startDate timeIntervalSinceReferenceDate]) {
        self.endDate.date = self.startDate.date;
    }
    
    if ([endDate timeIntervalSinceReferenceDate] < [endDate timeIntervalSinceReferenceDate]){
        self.endDate.date = [NSDate date];
        
    }
    
    AvailabilityViewController *availabilityVC = [[AvailabilityViewController alloc]init];
    availabilityVC.endDate = endDate;
    [self.navigationController pushViewController:availabilityVC animated:YES];


}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)eventListenerForStartDate{
    NSCalendar *calender = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    self.endDate.date = [calender dateByAddingUnit:NSCalendarUnitDay value:1 toDate:self.startDate.date options:NSCalendarMatchFirst];

}

-(void)setupDatePickers{
    self.startDate = [[UIDatePicker alloc]init];
    self.startDate.datePickerMode = UIDatePickerModeDate;
    [self.view addSubview:self.startDate];
    self.startDate.translatesAutoresizingMaskIntoConstraints = NO;
    
    [AutoLayout topConstraintFrom:self.startDate toView:self.view withOffset:50.0];
    [AutoLayout leadingConstraintFrom:self.startDate toView:self.view];
    [AutoLayout trailingConstraintFrom:self.startDate toView:self.view];
    self.startDate.minimumDate = [NSDate date];
    [self.startDate addTarget:self action:@selector(eventListenerForStartDate) forControlEvents:UIControlEventValueChanged];


    
    self.endDate = [[UIDatePicker alloc]init];
    self.endDate.datePickerMode = UIDatePickerModeDate;
    [self.view addSubview:self.endDate];
    self.endDate.translatesAutoresizingMaskIntoConstraints = NO;

    [AutoLayout topConstraintFrom:self.endDate toView:self.view withOffset:self.startDate.frame.size.height];
    [AutoLayout leadingConstraintFrom:self.endDate toView:self.view];
    [AutoLayout trailingConstraintFrom:self.endDate toView:self.view];
    [self eventListenerForStartDate];
}



@end
