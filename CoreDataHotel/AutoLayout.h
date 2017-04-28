//
//  AutoLayout.h
//  CoreDataHotel
//
//  Created by Luay Younus on 4/24/17.
//  Copyright © 2017 Luay Younus. All rights reserved.
//

@import UIKit;

@interface AutoLayout : NSObject


+(NSLayoutConstraint *)genericConstraintFrom:(UIView *)view
                                      toView:(UIView *)superView
                               withAttribute:(NSLayoutAttribute)attribute
                               andMultiplier:(CGFloat)multiplier;

+(NSLayoutConstraint *)genericConstraintFrom:(UIView *)view
                                      toView:(UIView *)superView
                               withAttribute:(NSLayoutAttribute)attribute;

+(NSArray *)fullScreenConstraintsWithVFLForView:(UIView *)view;

+(NSArray *)constraintsWithVFLForViewDictionary:(NSDictionary *)viewDictionary
                           forMetricsDictionary:(NSDictionary *)metricsDictionary
                                    withOptions:(NSLayoutFormatOptions)options
                               withVisualFormat:(NSString *)visualFormat;

+(NSLayoutConstraint *) equalHeightConstraintFromView:(UIView *)view
                                               toView:(UIView *)otherView
                                       withMultiplyer:(CGFloat)multiplier;

+(NSLayoutConstraint *) equalWidthConstraintFromView:(UIView *)view
                                              toView:(UIView *)otherView
                                      withMultiplier:(CGFloat)multiplier;

+(NSLayoutConstraint *) topConstraintFrom:(UIView *)view
                                   toView:(UIView *)otherView
                               withOffset:(CGFloat)offset;

+(NSLayoutConstraint *) leadingConstraintFrom:(UIView *)view
                                       toView:(UIView *)otherView;

+(NSLayoutConstraint *) trailingConstraintFrom:(UIView *)view
                                         toView:(UIView *)overView;

+(NSLayoutConstraint *) topConstraintFrom:(UIView *)view
                                   toView:(UIView *)otherView;


@end
