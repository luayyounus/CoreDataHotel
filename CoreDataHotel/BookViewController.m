//
//  BookViewController.m
//  CoreDataHotel
//
//  Created by Luay Younus on 4/25/17.
//  Copyright © 2017 Luay Younus. All rights reserved.
//

#import "BookViewController.h"
#import "AutoLayout.h"
#import "Guest+CoreDataClass.h"
#import "Guest+CoreDataProperties.h"
#import "DatePickerViewController.h"
#import "AppDelegate.h"
#import "Reservation+CoreDataClass.h"
#import "Reservation+CoreDataProperties.h"
#import "LookUpRerservationController.h"


@interface BookViewController ()<UITextFieldDelegate>

@property(strong,nonatomic) UITextField *firstNameField;
@property(strong,nonatomic) UITextField *lastNameField;
@property(strong,nonatomic) UITextField *emailField;
@property(strong,nonatomic) UIButton *bookButton;

@end

@implementation BookViewController

-(void)loadView{
    [super loadView];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    

    self.firstNameField = [[UITextField alloc]init];
    self.lastNameField = [[UITextField alloc]init];
    self.emailField = [[UITextField alloc]init];
    self.bookButton = [[UIButton alloc]init];
    
    [self.view addSubview:self.firstNameField];
    [self.view addSubview:self.lastNameField];
    [self.view addSubview:self.emailField];
    [self.view addSubview:self.bookButton];
    
    [self setupUserLayout];
    [self.bookButton addTarget:self
                        action:@selector(bookButtonPressed)
              forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)setupUserLayout{
    self.firstNameField.translatesAutoresizingMaskIntoConstraints = NO;
    self.lastNameField.translatesAutoresizingMaskIntoConstraints = NO;
    self.emailField.translatesAutoresizingMaskIntoConstraints = NO;
    self.bookButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.bookButton setTitle:@"  Book Room  " forState:UIControlStateNormal];
    [self.bookButton sizeToFit];
    [self.bookButton setTitleColor:[UIColor colorWithRed:36/255.0 green:71/255.0 blue:113/255.0 alpha:1.0] forState:UIControlStateNormal];
    [self.bookButton alignmentRectInsets];
    [self.bookButton setBackgroundColor:[UIColor whiteColor]];
    [[self.bookButton layer] setCornerRadius:2.0f];
    [[self.bookButton layer] setMasksToBounds:YES];
    [[self.bookButton layer] setBorderWidth:2.0f];
    [AutoLayout topConstraintFrom:self.bookButton toView:self.view withOffset:200];
    
    self.firstNameField.placeholder = @"First Name (Required)";
    self.lastNameField.placeholder = @"Last Name (Optional)";
    self.emailField.placeholder = @"Email (Optional)";
    
    self.firstNameField.borderStyle = UITextBorderStyleRoundedRect;
    self.lastNameField.borderStyle = UITextBorderStyleRoundedRect;
    self.emailField.borderStyle = UITextBorderStyleRoundedRect;
    
    self.firstNameField.spellCheckingType = UITextSpellCheckingTypeNo;
    self.lastNameField.spellCheckingType = UITextSpellCheckingTypeNo;
    self.emailField.spellCheckingType = UITextSpellCheckingTypeNo;
    
    [AutoLayout topConstraintFrom:self.firstNameField toView:self.view withOffset:80];
    [AutoLayout topConstraintFrom:self.lastNameField toView:self.view withOffset:120];
    [AutoLayout topConstraintFrom:self.emailField toView:self.view withOffset:160];

    [AutoLayout leadingConstraintFrom:self.firstNameField toView:self.view];
    [AutoLayout leadingConstraintFrom:self.lastNameField toView:self.view];
    [AutoLayout leadingConstraintFrom:self.emailField toView:self.view];

    [AutoLayout trailingConstraintFrom:self.firstNameField toView:self.view];
    [AutoLayout trailingConstraintFrom:self.lastNameField toView:self.view];
    [AutoLayout trailingConstraintFrom:self.emailField toView:self.view];

}

-(void)bookButtonPressed{
    
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
    
    Reservation *reservation = [NSEntityDescription insertNewObjectForEntityForName:@"Reservation" inManagedObjectContext:context];
    
    reservation.startDate = self.startDate;
    reservation.endDate = self.endDate;
    reservation.room = self.room;
    
    reservation.guest = [NSEntityDescription insertNewObjectForEntityForName:@"Guest" inManagedObjectContext:context];
    
    reservation.guest.firstName = self.firstNameField.text;
    reservation.guest.lastName = self.lastNameField.text;
    reservation.guest.emailAddress = self.emailField.text;
    
    NSError *saveError;
    
    [context save:&saveError];

    
    if (saveError){
        NSLog(@"The Reservation is NOT made");
    } else {
        NSLog(@"The Reservation is made successfully");
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
    
    
}

//if([self.firstNameField.text isEqualToString:@""] || [self.firstNameField.text isEqualToString:@" "]) {
//    [self.bookButton setEnabled:NO];
//    [[self.bookButton layer] setBorderColor:[UIColor redColor].CGColor];
//} else {
//    [self.bookButton setEnabled:YES];
//    [[self.bookButton layer] setBorderColor:[UIColor greenColor].CGColor];
//}

//    [self.firstNameField addTarget:self
//                            action:@selector(textFieldDidChange:)
//        forControlEvents:UIControlEventEditingChanged];
//
//    -(void)textFieldDidChange:(UITextField *)theTextField{
//
//    }


//    float navBarHeight = CGRectGetHeight(self.navigationController.navigationBar.frame);
//    CGFloat statusBarHeight = 20.0;
//    CGFloat topMargin = 5;
//    CGFloat windowHeight = self.view.frame.size.height;
//    CGFloat textFieldHeight = ((windowHeight - topMargin) / 20);
//
//    NSDictionary *viewDictionary = @{@"firstName": self.firstNameField, @"lastName": self.lastNameField, @"emailAddress": self.emailField};
//    NSDictionary *metricsDictionary = @{@"topMargin": [NSNumber numberWithFloat:topMargin], @"textFieldHeight": [NSNumber numberWithFloat:2]};
//    NSString *visualFormatString = @"H:|-[firstName-|";
//
//    [AutoLayout constraintsWithVFLForViewDictionary:viewDictionary forMetricsDictionary:metricsDictionary withOptions:0 withVisualFormat:visualFormatString];

@end
