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
@property(strong,nonatomic) UINavigationController *navigationController;
@end


@implementation AutoLayoutTests
- (void)setUp {
    [super setUp];
    self.testController = [[UIViewController alloc]init];
    
    self.testView = [[UIView alloc]init];
    self.superView = [[UIView alloc]init];
    self.navigationController = [[UINavigationController alloc]init];
    
    [self.testController.view addSubview:self.testView];
    [self.testController.view addSubview:self.superView];
    
}
- (void)tearDown {
    self.testController = nil;
    self.testView = nil;
    self.superView = nil;
    
    [super tearDown];
}
-(void)testFullScreenConstraintsWithVFLForView{
    id fullScreenConstraint = [AutoLayout fullScreenConstraintsWithVFLForView:self.superView];
    
    XCTAssertTrue(fullScreenConstraint, @"full Screen is not True");
    XCTAssertNotNil(fullScreenConstraint);
}

-(void)testGenericConstraint{
    id genericConstraint = [AutoLayout genericConstraintFrom:self.testView toView:self.superView withAttribute:NSLayoutAttributeTop];
    
    XCTAssert([genericConstraint isKindOfClass:[NSLayoutConstraint class]], @"Constraint is not an instance of NSLayoutConstraint");
    XCTAssertTrue([(NSLayoutConstraint *)genericConstraint isActive], @"Constraint was not activated");
}

-(void)testEqualHeightConstraint{
    
    id equalConstraint = [AutoLayout equalHeightConstraintFromView:self.testView toView:self.superView withMultiplyer:40];
    
    XCTAssert([equalConstraint isMemberOfClass:[NSLayoutConstraint class]], @"Equal Constraints is not part of NS Object");
}




@end
