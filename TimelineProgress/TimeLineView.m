//
//  TimeLineView.m
//  TimelineProgress
//
//  Created by zhongyang on 16/2/19.
//  Copyright © 2016年 zhongyang. All rights reserved.
//

#import "TimeLineView.h"
#import "TimeLineAtom.h"
#import "TimeLineCell.h"

@interface TimeLineView () {
    NSMutableArray *_atoms;

    UIScrollView *_containView;
}

@end

@implementation TimeLineView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureDefalutTheme];
        [self setupUI];
    }
    return self;
}

- (void)configureDefalutTheme {
    self.textColor = [UIColor orangeColor];
    self.lineColor = [UIColor orangeColor];
}

- (void)setupUI {
    _containView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    _containView.showsVerticalScrollIndicator = NO;
    _containView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_containView];
}

- (void)addInitialAtoms:(NSArray *)atoms
          withAnimation:(BOOL)animated {

}

- (void)addAtom:(TimeLineAtom *)atom
  withAnimation:(BOOL)animated
     completion:(TimeLineAnimationFinished)completed {

}

@end
