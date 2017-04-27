//
//  AutoLayoutTest.m
//  CoreDataHotel
//
//  Created by Luay Younus on 4/26/17.
//  Copyright © 2017 Luay Younus. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AutoLayout.h"

@interface AutoLayoutTests : XCTestCase

@property(strong, nonatomic) UIViewController *testController;
@property(strong,nonatomic) UIView *testView;
@property(strong,nonatomic) UIView *superView;
@property(strong,nonatomic) UIView *equalHeightConstraintView;
@property(strong,nonatomic) UIView *equalHeightConstraintOtherView;
@property(strong,nonatomic) UIView *leadingConstraintsView;
@property(strong,nonatomic) UIView *leadingConstraintOtherView;
@property(strong,nonatomic) UIView *trailingConstraintView;
@property(strong,nonatomic) UIView *trailingConstraintOtherView;
@property(strong,nonatomic) UIView *genericView;
@property(strong,nonatomic) UIView *genericSuperView;
@end


@implementation AutoLayoutTests
- (void)setUp {
    [super setUp];
    self.testController = [[UIViewController alloc]init];
    
    self.testView = [[UIView alloc]init];
    self.superView = [[UIView alloc]init];
    
    self.equalHeightConstraintView = [[UIView alloc]init];
    self.equalHeightConstraintOtherView = [[UIView alloc]init];
    
    self.leadingConstraintsView = [[UIView alloc]init];
    self.leadingConstraintOtherView = [[UIView alloc]init];
    
    self.trailingConstraintView = [[UIView alloc]init];
    self.trailingConstraintOtherView = [[UIView alloc]init];
    
    self.genericView = [[UIView alloc]init];
    self.genericSuperView = [[UIView alloc]init];
    
    
    
    //creating subViews
    [self.testController.view addSubview:self.testView];
    [self.testController.view addSubview:self.superView];
    
    [self.testController.view addSubview:self.equalHeightConstraintView];
    [self.testController.view addSubview:self.equalHeightConstraintOtherView];
    
    [self.testController.view addSubview:self.leadingConstraintsView];
    [self.testController.view addSubview:self.leadingConstraintOtherView];
    
    [self.testController.view addSubview:self.trailingConstraintView];
    [self.testController.view addSubview:self.trailingConstraintOtherView];
    
    [self.testController.view addSubview:self.genericView];
    [self.testController.view addSubview:self.genericSuperView];
}
- (void)tearDown {
    //tearing down properties
    self.testController = nil;
    self.testView = nil;
    self.superView = nil;
    
    self.equalHeightConstraintView = nil;
    self.equalHeightConstraintOtherView = nil;
    
    self.leadingConstraintsView = nil;
    self.leadingConstraintOtherView = nil;
    
    self.trailingConstraintView = nil;
    self.trailingConstraintOtherView = nil;
    
    self.genericView = nil;
    self.genericSuperView = nil;
    [super tearDown];
}
//Assertion on Methods
-(void)testGenericConstraintFromToViewWithAttribute{
    
    XCTAssertNotNil(self.testController, @"The testController is nil!");
    XCTAssertNotNil(self.testView, @"Self.testView is nil!");
    XCTAssertNotNil(self.superView, @"Self.superView is nil!");
    
    id constraint = [AutoLayout genericConstraintFrom:self.testView toView:self.superView withAttribute:NSLayoutAttributeTop];
    
    XCTAssert([constraint isKindOfClass:[NSLayoutConstraint class]], @"Constraint is not an instance of NSLayoutConstraint");
    XCTAssertTrue([(NSLayoutConstraint *)constraint isActive], @"Constraint was not activated");
}
-(void)testEqualHeightConstraintFromView{
    
    XCTAssertNotNil(self.equalHeightConstraintView, @"Self.equalHeightConstraintView");
    XCTAssertNotNil(self.equalHeightConstraintOtherView, @"Self.equalHeightConstraintOtherView");
    
    id equalConstraint = [AutoLayout equalHeightConstraintFromView:self.equalHeightConstraintView toView:self.equalHeightConstraintOtherView withMultiplyer:NSLayoutAttributeTop];
    
    XCTAssert([equalConstraint isKindOfClass:[NSLayoutConstraint class]], @"Equal constraint is not an instance of NSLayoutConstraint");
    XCTAssertTrue([(NSLayoutConstraint *)equalConstraint isActive], @"Equal Constraint were not equal");
}
-(void)testLeadingConstraintFrom{
    
    XCTAssertNotNil(self.leadingConstraintsView, @"Self.leadingConstraintsView");
    XCTAssertNotNil(self.leadingConstraintOtherView, @"Self.leadingConstraintOtherView");
    
    id leadingConstraint = [AutoLayout leadingConstraintFrom:self.leadingConstraintsView toView:self.leadingConstraintOtherView];
    
    XCTAssert([leadingConstraint isKindOfClass:[NSLayoutConstraint class]], @"Leading constraint is not a instance of NSLayoutConstraint");
    XCTAssertTrue([(NSLayoutConstraint *)leadingConstraint isActive], @"No Leading constraints!");
}
-(void)testTrailingConstraintFrom{
    
    XCTAssertNotNil(self.trailingConstraintView, @"Self.trailingConstraintView");
    XCTAssertNotNil(self.trailingConstraintOtherView, @"Self.trailingConstraintOtherView");
    
    id trailingConstraint = [AutoLayout trailingConstraintFrom:self.trailingConstraintView toView:self.trailingConstraintOtherView];
    
    XCTAssert([trailingConstraint isKindOfClass:[NSLayoutConstraint class]], @"Trailing constraint is not an instance of NSLayoutConstraint");
    XCTAssertTrue([(NSLayoutConstraint *)trailingConstraint isActive], @"Constraint is not trailing");
}
-(void)testGenericConstraintFrom{
    
    XCTAssertNotNil(self.genericView, @"Self.genericVie is nil!");
    XCTAssertNotNil(self.genericSuperView, @"Self.genericSuperView is nil!");
    
    id genericConstraint = [AutoLayout genericConstraintFrom:self.genericView toView:self.genericSuperView withAttribute:NSLayoutAttributeTop];
    
    XCTAssert([genericConstraint isKindOfClass:[NSLayoutConstraint class]], @"Constraint is not an instance of NSLayoutConstraint");
    XCTAssertTrue([(NSLayoutConstraint *)genericConstraint isActive], @"Constraint was not activated");
}

@end
