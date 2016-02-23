//
//  TimeLineCell.h
//  TimelineProgress
//
//  Created by zhongyang on 16/2/19.
//  Copyright © 2016年 zhongyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeLineAtom.h"

@interface TimeLineCellImage : UIView {

}

@property(nonatomic, assign) CGFloat iconImageWidth;
@property(nonatomic, assign) CGFloat iconImageHeight;
@property(nonatomic, assign) CGFloat horizontalInset;

- (void)display:(TimeLineAtom *)atom
      firstAtom:(BOOL)firstAtom
  withAnimation:(BOOL)animated
     withFinish:(void (^)(BOOL finished))finish;

@end
