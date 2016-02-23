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
        __weak_self;
        if (firstAtom) {
            [self addAlphaAnimation:imageView duration:0.5f complete:^{
                __bool_block_return(finish, YES);
            }];
        } else {
            [self addFrameAnimation:lineView duration:0.5f complete:^{
                [weakself addAlphaAnimation:imageView duration:0.6f complete:^{
                    __bool_block_return(finish, YES);
                }];
            }];
        }
    } else {
        __bool_block_return(finish, YES);
    }
}

- (void)addAlphaAnimation:(UIView *)view duration:(CGFloat)duration complete:(void (^)(void))completed {
    POPBasicAnimation *opacityAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    opacityAnimation.fromValue = @(0);
    opacityAnimation.toValue = @(1);
    opacityAnimation.duration = duration;

    opacityAnimation.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        if (completed) {
            completed();
        }
    };

    [view.layer pop_addAnimation:opacityAnimation forKey:@"opacityAnimation"];
}

- (void)addFrameAnimation:(UIView *)view duration:(CGFloat)duration complete:(void (^)(void))completed {
    CGRect targetFrame = view.frame;
    [view setFrame:CGRectMake(targetFrame.origin.x, targetFrame.origin.y, targetFrame.size.width, 0)];
    [view setHidden:NO];

    POPBasicAnimation *opacityAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewFrame];
    opacityAnimation.fromValue = [NSValue valueWithCGRect:view.frame];;
    opacityAnimation.toValue = [NSValue valueWithCGRect:targetFrame];;
    opacityAnimation.duration = duration;

    opacityAnimation.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        if (completed) {
            completed();
        }
    };

    [view.layer pop_addAnimation:opacityAnimation forKey:@"opacityAnimation"];
}

@end
