//
//  UnusedCode.m
//  CoreDataHotel
//
//  Created by Luay Younus on 4/27/17.
//  Copyright © 2017 Luay Younus. All rights reserved.
//

#import <Foundation/Foundation.h>

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
