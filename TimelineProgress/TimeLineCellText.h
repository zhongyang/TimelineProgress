//
//  TimeLineCellText.h
//  TimelineProgress
//
//  Created by zhongyang on 16/2/23.
//  Copyright © 2016年 zhongyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeLineAtom.h"

@interface TimeLineCellText : UIView {

}

@property(nonatomic, assign) CGFloat horizontalInset;
@property(nonatomic, assign) CGFloat verticalInset;

- (void)display:(TimeLineAtom *)atom
      firstAtom:(BOOL)firstAtom
  withAnimation:(BOOL)animated
     withFinish:(void (^)(BOOL finished))finish;

@end
