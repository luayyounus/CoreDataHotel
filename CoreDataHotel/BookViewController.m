//
//  BookViewController.m
//  CoreDataHotel
//
//  Created by Luay Younus on 4/25/17.
//  Copyright © 2017 Luay Younus. All rights reserved.
//

#import "BookViewController.h"

@interface BookViewController ()

@property(strong,nonatomic) NSString *firstName;
@property(strong,nonatomic) NSString *lastName;
@property(strong,nonatomic) NSString *email;
@property(strong,nonatomic) NSNumber *creditCard;

@property(strong,nonatomic) UITextField *firstNameLabel;
@property(strong,nonatomic) UITextField *lastNameLabel;
@property(strong,nonatomic) UITextField *emailLabel;
@property(strong,nonatomic) UITextField *creditCardLabel;

@end

@implementation BookViewController

-(void)loadView{
    [super loadView];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)setupUserLayout{
    self.firstNameLabel.text = self.firstName;
}


@end
