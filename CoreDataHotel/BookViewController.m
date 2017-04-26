//
//  BookViewController.m
//  CoreDataHotel
//
//  Created by Luay Younus on 4/25/17.
//  Copyright © 2017 Luay Younus. All rights reserved.
//

#import "BookViewController.h"
#import "AutoLayout.h"

@interface BookViewController ()

@property(strong,nonatomic) UITextField *firstNameField;
@property(strong,nonatomic) UITextField *lastNameField;
@property(strong,nonatomic) UITextField *emailField;

@end

@implementation BookViewController

-(void)loadView{
    [super loadView];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    

    self.firstNameField = [[UITextField alloc]init];
    self.lastNameField = [[UITextField alloc]init];
    self.emailField = [[UITextField alloc]init];
    
    [self.view addSubview:self.firstNameField];
    [self.view addSubview:self.lastNameField];
    [self.view addSubview:self.emailField];
    
    [self setupUserLayout];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

-(void)setupUserLayout{
    self.firstNameField.translatesAutoresizingMaskIntoConstraints = NO;
    self.lastNameField.translatesAutoresizingMaskIntoConstraints = NO;
    self.emailField.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.firstNameField.placeholder = @"First Name";
    self.lastNameField.placeholder = @"Last Name";
    self.emailField.placeholder = @"Email";
    
    self.firstNameField.borderStyle = UITextBorderStyleRoundedRect;
    [AutoLayout topConstraintFrom:self.firstNameField toView:self.view withOffset:80];
    [AutoLayout leadingConstraintFrom:self.firstNameField toView:self.view];
    [AutoLayout trailingConstraintFrom:self.firstNameField toView:self.view];
    
    
    self.lastNameField.borderStyle = UITextBorderStyleRoundedRect;
    [AutoLayout topConstraintFrom:self.lastNameField toView:self.view withOffset:120];
    [AutoLayout leadingConstraintFrom:self.lastNameField toView:self.view];
    [AutoLayout trailingConstraintFrom:self.lastNameField toView:self.view];
    
    self.emailField.borderStyle = UITextBorderStyleRoundedRect;
    [AutoLayout topConstraintFrom:self.emailField toView:self.view withOffset:160];
    [AutoLayout leadingConstraintFrom:self.emailField toView:self.view];
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

-(void)setupDoneButton{
    UIBarButtonItem *bookButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(bookButtonPressed)];
    [self.navigationItem setRightBarButtonItem:bookButton];
}

-(void)bookButtonPressed{
    NSString *firstName = self.firstNameField.text;
}





@end
