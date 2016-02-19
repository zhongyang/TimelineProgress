//
//  TimeLineView.h
//  TimelineProgress
//
//  Created by zhongyang on 16/2/19.
//  Copyright © 2016年 zhongyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeLineAtom.h"
#import "UIView+Utils.h"

typedef void(^TimeLineAnimationFinished)();
#define TimeLineAnimationFinished() ^()

@interface TimeLineView : UIView {

}

@property(nonatomic, strong) UIColor *textColor;
@property(nonatomic, strong) UIColor *lineColor;

- (void)addInitialAtoms:(NSArray *)atoms
          withAnimation:(BOOL)animated;

- (void)addAtom:(TimeLineAtom *)atom
  withAnimation:(BOOL)animated
     completion:(TimeLineAnimationFinished)completed;

@end
