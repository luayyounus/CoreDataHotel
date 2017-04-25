//
//  ViewController.m
//  CoreDataHotel
//
//  Created by Luay Younus on 4/24/17.
//  Copyright © 2017 Luay Younus. All rights reserved.
//

#import "ViewController.h"
#import "AutoLayout.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)loadView{
    [super loadView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupLayout];
}

-(void)setupLayout{
    
//    float navBarHEight = CGRect
    
    UIButton *browseButton = [self createButtonWithTitle:@"Browse"];
    UIButton *bookButton = [self createButtonWithTitle:@"Book"];
    UIButton *lookupButton = [self createButtonWithTitle:@"Look Up"];
    
    browseButton.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:0.75 alpha:1.0];
    
    [AutoLayout leadingConstraintFrom:browseButton toView:self.view];
    [AutoLayout trailingContraintsFrom:browseButton toView:self.view];
    
    
    NSLayoutConstraint *browserHeight = [AutoLayout equalHeightConstraintFromView:browseButton toView:self.view withMultiplyer:0.33];
    
    [browseButton addTarget:self action:@selector(browseButtonSelected) forControlEvents:UIControlEventTouchUpInside];
    
    browserHeight.constant = 100;
}

-(void)browseButtonSelected{
    NSLog(@"LAB");
}

-(UIButton *)createButtonWithTitle:(NSString *)title{
    UIButton *button = [[UIButton alloc]init];
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleShadowColor:[UIColor greenColor] forState:UIControlStateSelected];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    //it will apply sconstraints to this - We tell it NO! use our contraints
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view addSubview:button];
    
    return button;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
