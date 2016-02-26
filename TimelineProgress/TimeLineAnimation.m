//
//  TimeLineAnimation.m
//  TimelineProgress
//
//  Created by zhongyang on 16/2/25.
//  Copyright © 2016年 zhongyang. All rights reserved.
//

#import "TimeLineAnimation.h"
#import <pop/POP.h>

@implementation TimeLineAnimation

+ (void)addAlphaAnimation:(UIView *)view
              originAlpha:(CGFloat)originAlpha
                destAlpha:(CGFloat)destAlpha
                 duration:(CGFloat)duration
                 complete:(void (^)(void))completed {
    POPBasicAnimation *opacityAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    opacityAnimation.fromValue = [NSNumber numberWithFloat:originAlpha];
    opacityAnimation.toValue = [NSNumber numberWithFloat:destAlpha];
    opacityAnimation.duration = duration;

    opacityAnimation.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        if (completed) {
            completed();
        }
    };

    [view.layer pop_addAnimation:opacityAnimation forKey:@"opacityAnimation"];
}


+ (void)addFrameSpringAnimation:(UIView *)view
                    originFrame:(CGRect)originFrame
                      destFrame:(CGRect)destFrame
                       duration:(CGFloat)duration
                       complete:(void (^)(void))completed {
    POPSpringAnimation *opacityAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    opacityAnimation.fromValue = [NSValue valueWithCGRect:originFrame];;
    opacityAnimation.toValue = [NSValue valueWithCGRect:destFrame];;
    opacityAnimation.springBounciness = 15;
    opacityAnimation.springSpeed = 36;

    opacityAnimation.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        if (completed) {
            completed();
        }
    };

    [view.layer pop_addAnimation:opacityAnimation forKey:@"opacityAnimation"];
}

+ (void)addFrameAnimation:(UIView *)view
              originFrame:(CGRect)originFrame
                destFrame:(CGRect)destFrame
                 duration:(CGFloat)duration
                 complete:(void (^)(void))completed {
    POPBasicAnimation *opacityAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewFrame];
    opacityAnimation.fromValue = [NSValue valueWithCGRect:originFrame];;
    opacityAnimation.toValue = [NSValue valueWithCGRect:destFrame];;
    opacityAnimation.duration = duration;

    opacityAnimation.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        if (completed) {
            completed();
        }
    };

    [view.layer pop_addAnimation:opacityAnimation forKey:@"opacityAnimation"];
}

@end
