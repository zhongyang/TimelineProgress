//
//  TimeLineAnimation.h
//  TimelineProgress
//
//  Created by zhongyang on 16/2/25.
//  Copyright © 2016年 zhongyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeLineAnimation : UIView

+ (void)addAlphaAnimation:(UIView *)view
              originAlpha:(CGFloat)originAlpha
                destAlpha:(CGFloat)destAlpha
                 duration:(CGFloat)duration
                 complete:(void (^)(void))completed;


+ (void)addFrameAnimation:(UIView *)view
              originFrame:(CGRect)originFrame
                destFrame:(CGRect)destFrame
                 duration:(CGFloat)duration
                 complete:(void (^)(void))completed;

@end
