//
//  DatePickerViewController.m
//  CoreDataHotel
//
//  Created by Luay Younus on 4/25/17.
//  Copyright © 2017 Luay Younus. All rights reserved.
//

#import "DatePickerViewController.h"

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

}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)setupDatePickers{
    //LABWORK
    self.endDate = [[UIDatePicker alloc]init];
    self.endDate.datePickerMode = UIDatePickerModeDateAndTime;
    
    //acount for in LABWORK - make sure you assing constraints and not a frame
    self.endDate.frame = CGRectMake(0, 84.0, self.view.frame.size.width, 200.0);
    
    
    
}



@end
