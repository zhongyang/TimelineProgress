//
//  TimeLineCell.m
//  TimelineProgress
//
//  Created by zhongyang on 16/2/19.
//  Copyright © 2016年 zhongyang. All rights reserved.
//

#import "TimeLineCellImage.h"
#import "UIView+Utils.h"
#import <pop/POP.h>
#import "TimelineMarco.h"
#import "TimeLineAnimation.h"

@interface TimeLineCellImage () {
    
}

@end

@implementation TimeLineCellImage

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
}

- (void)display:(TimeLineAtom *)atom
      firstAtom:(BOOL)firstAtom
  withAnimation:(BOOL)animated
     withFinish:(void (^)(BOOL finished))finish {
    CGRect imageFrame = CGRectMake((self.width - self.iconImageWidth)/2,
                                   self.height - self.iconImageHeight,
                                   self.iconImageWidth,
                                   self.iconImageHeight);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageFrame];
    [self addSubview:imageView];
    [imageView setImage:[UIImage imageNamed:@"btn_sel_select"]];

    UIView *lineView = nil;
    if (!firstAtom) {
        CGFloat lineWidth = 1.0f;
        CGRect lineFrame = CGRectMake((self.width - lineWidth)/2, 0, lineWidth, self.height - self.iconImageHeight);
        lineView = [[UIView alloc] initWithFrame:lineFrame];
        [self addSubview:lineView];
        [lineView setBackgroundColor:[UIColor orangeColor]];
    }

    if (animated) {
        [imageView setAlpha:0.0f];

        if (firstAtom) {
            [TimeLineAnimation addAlphaAnimation:imageView originAlpha:0.0f destAlpha:1.0f duration:0.5f complete:^{
                __bool_block_return(finish, YES);
            }];
        } else {
            CGRect originFrame = CGRectMake(lineView.left, lineView.top, lineView.width, 0);
            [TimeLineAnimation addFrameAnimation:lineView originFrame:originFrame destFrame:lineView.frame duration:0.5f complete:^{
                [TimeLineAnimation addAlphaAnimation:imageView originAlpha:0.0f destAlpha:1.0f duration:0.5f complete:^{
                    __bool_block_return(finish, YES);
                }];
            }];
        }
    } else {
        __bool_block_return(finish, YES);
    }
}

@end
