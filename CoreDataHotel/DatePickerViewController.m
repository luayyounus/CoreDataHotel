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

@property(strong,nonatomic)UIDatePicker *endDate;
//LABWORK build another one

@end

@implementation DatePickerViewController

-(void)loadView{
    [super loadView];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setupDatePickers];
    [self setupDoneButton];
    
    [self.view addSubview:self.endDate];
}

-(void)setupDoneButton{
    //LABWORK for some logic
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonPressed)];
    [self.navigationItem setRightBarButtonItem:doneButton];
}
-(void)doneButtonPressed{
    NSDate *endDate = self.endDate.date;
    
    if ([[NSDate date] timeIntervalSinceReferenceDate] > [endDate timeIntervalSinceReferenceDate]) {
        self.endDate.date = [NSDate date];
        return;
    }
    
    AvailabilityViewController *availabilityVC = [[AvailabilityViewController alloc]init];
    availabilityVC.endDate = endDate;
    [self.navigationController pushViewController:availabilityVC animated:YES];

}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)setupDatePickers{
    //LABWORK
    self.endDate = [[UIDatePicker alloc]init];
    self.endDate.datePickerMode = UIDatePickerModeDateAndTime;
    [self.view addSubview:self.endDate];
    self.endDate.translatesAutoresizingMaskIntoConstraints = NO;

    [AutoLayout topConstraintFrom:self.endDate toView:self.view withOffset:50.0];
    [AutoLayout leadingConstraintFrom:self.endDate toView:self.view];
    [AutoLayout trailingConstraintFrom:self.endDate toView:self.view];
    
    
    
}



@end
