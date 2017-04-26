//
//  AutoLayoutTest.m
//  CoreDataHotel
//
//  Created by Luay Younus on 4/26/17.
//  Copyright © 2017 Luay Younus. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AutoLayout.h"


@interface AutoLayoutTest : XCTestCase

@property(strong,nonatomic) UIViewController *testController;
@property(strong,nonatomic) UIView *testView1;
@property(strong,nonatomic) UIView *testView2;

@end

@implementation AutoLayoutTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.testController = [[UIViewController alloc] init];
    self.testView1 = [[UIView alloc]init];
    self.testView2 = [[UIView alloc]init];
    
    [self.testController.view addSubview:self.testView1];
    [self.testController.view addSubview:self.testView2];
}

- (void)tearDown {
    //tear down properties
    self.testController = nil;
    self.testView1 = nil;
    self.testView2 = nil;
    
    [super tearDown];
}

-(void)testGenericConstraintFromToViewWithAttribute{
    XCTAssertNotNil(self.testController, @"The testController");
    XCTAssertNotNil(self.testView1, @"self.testView1 is nil");
    XCTAssertNotNil(self.testView2, @"self.testView2 is nil");

    id constraint = [AutoLayout genericConstraintFrom:self.testView1 toView:self.testView2 withAttribute:NSLayoutAttributeTop];
    
    XCTAssert([constraint isKindOfClass:[NSLayoutConstraint class]], @"Constraint is not an instance of NSLayout Constraint");
    
    XCTAssertTrue([(NSLayoutConstraint *)constraint isActive], @"Constraint was not Activated");
}


@end
