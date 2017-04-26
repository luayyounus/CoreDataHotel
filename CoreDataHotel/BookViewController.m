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
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.bookButton setEnabled:NO];
    
    
    
}

-(void)setupUserLayout{
    self.firstNameField.translatesAutoresizingMaskIntoConstraints = NO;
    self.lastNameField.translatesAutoresizingMaskIntoConstraints = NO;
    self.emailField.translatesAutoresizingMaskIntoConstraints = NO;
    self.bookButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.firstNameField.placeholder = @"First Name";
    self.lastNameField.placeholder = @"Last Name (Optional)";
    self.emailField.placeholder = @"Email (Optional)";
    
    
    
    if([self.firstNameField.text isEqualToString:@""] || [self.firstNameField.text isEqualToString:@" "]) {
        [self.bookButton setEnabled:YES];
        self.bookButton.backgroundColor = [UIColor grayColor];
    }
    
    
    [self bookButtonPressed];

    
    self.firstNameField.borderStyle = UITextBorderStyleRoundedRect;
    self.lastNameField.borderStyle = UITextBorderStyleRoundedRect;
    self.emailField.borderStyle = UITextBorderStyleRoundedRect;
    
    
    [UIButton buttonWithType:UIButtonTypeSystem];
    [self.bookButton setTitle:@"Book Room" forState:UIControlStateNormal];
    [self.bookButton sizeToFit];
    self.bookButton.center = CGPointMake(320/2, 60);

    
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
}

-(void)bookButtonPressed{
    
    Guest *newGuest;
    
    newGuest.firstName = [NSString stringWithFormat:@"%@", self.firstNameField.text];
    newGuest.lastName =  [NSString stringWithFormat:@"%@", self.lastNameField.text];
    newGuest.emailAddress = [NSString stringWithFormat:@"%@", self.emailField.text];
}


@end
