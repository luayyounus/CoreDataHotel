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

@property(strong,nonatomic) NSString *firstName;
@property(strong,nonatomic) NSString *lastName;
@property(strong,nonatomic) NSString *email;

@property(strong,nonatomic) UITextField *firstNameLabel;
@property(strong,nonatomic) UITextField *lastNameLabel;
@property(strong,nonatomic) UITextField *emailLabel;

@end

@implementation BookViewController

-(void)loadView{
    [super loadView];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.firstNameLabel];
    [self.view addSubview:self.lastNameLabel];
    [self.view addSubview:self.emailLabel];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.firstNameLabel = [[UITextField alloc]init];
    self.lastNameLabel = [[UITextField alloc]init];
    self.emailLabel = [[UITextField alloc]init];
    
}

-(void)setupUserLayout{
    self.firstNameLabel.text = self.firstName;
}


@end
