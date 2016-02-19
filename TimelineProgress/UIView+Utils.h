//
//  UIView+Utils.h
//  MIGUOA
//
//  Created by zhongyang on 15/12/1.
//
//

#import <UIKit/UIKit.h>

@interface UIView (Utils)

@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;

@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;


@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat left;

@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@property (readonly) UIViewController *viewController;

- (void)clearSubViews;

@end
