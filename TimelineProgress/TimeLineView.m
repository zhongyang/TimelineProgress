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
    _containView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    _containView.showsVerticalScrollIndicator = NO;
    _containView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_containView];
}

- (void)addInitialAtoms:(NSArray *)atoms
          withAnimation:(BOOL)animated {
     __block NSInteger index = 0;

    __typeof__(self) __weak weakself = self;
    __block void (^addAtom)(TimeLineAtom *atom, BOOL animated) = ^(TimeLineAtom *atom, BOOL animated) {
        [weakself addAtom:atom withAnimation:animated completion:^{
            index++;
            if (index < [atoms count]) {
                TimeLineAtom *atom = atoms[index];
                addAtom(atom, animated);
            }
        }];
    };

    TimeLineAtom *atom = atoms[index];
    addAtom(atom, animated);
}

- (void)addAtom:(TimeLineAtom *)atom
  withAnimation:(BOOL)animated
     completion:(TimeLineAnimationFinished)completed {
    NSArray *colors = @[[UIColor  greenColor],
                        [UIColor yellowColor],
                        [UIColor magentaColor],
                        [UIColor brownColor],
                        [UIColor orangeColor]];

    CGRect frame = CGRectMake(0, _containView.contentSize.height, _containView.width, 60.0f);
    TimeLineCell *cell = [[TimeLineCell alloc] initWithFrame:frame];
    cell.backgroundColor = colors[rand()%[colors count]];

    [_containView addSubview:cell];
    [_containView setContentSize:CGSizeMake(_containView.width, cell.bottom)];

    if (completed) {
        completed();
    }
}

@end
