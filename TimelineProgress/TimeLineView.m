//
//  TimeLineView.m
//  TimelineProgress
//
//  Created by zhongyang on 16/2/19.
//  Copyright © 2016年 zhongyang. All rights reserved.
//

#import "TimeLineView.h"
#import "TimeLineAtom.h"
#import "TimeLineCellImage.h"
#import "TimeLineCellText.h"
#import "TimelineMarco.h"

@interface TimeLineView () {
    NSMutableArray *_atoms;

    UIScrollView *_containView;
}

@end

@implementation TimeLineView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _atoms = [[NSMutableArray alloc] init];

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
    _containView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64.0f, self.width, self.height-64.0f)];
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
    BOOL firstItem = [_atoms count] == 0;

    CGFloat itemHeight = 80.0f;

    CGFloat itemIconWidth = 20.0f;
    CGFloat itemIconHeight = 20.0f;
    CGFloat itemIconHorizontalInset = 10.0f;

    CGFloat itemIconViewWidth = itemIconWidth + 2*itemIconHorizontalInset;
    CGFloat itemIconViewHeight = itemHeight;
    CGFloat itemIconViewTop = ([_atoms count]-1)*itemHeight + (itemHeight - itemIconHeight)/2 + itemIconHeight;
    if (firstItem) {
        itemIconViewHeight = (itemHeight - itemIconHeight)/2 + itemIconHeight;
        itemIconViewTop = 0.0f;
    }
    CGRect itemIconViewFrame = CGRectMake(0, itemIconViewTop, itemIconViewWidth, itemIconViewHeight);

    CGFloat itemTextViewWidth = _containView.width - itemIconViewWidth;
    CGFloat itemTextViewHeight= itemHeight;
    CGFloat itemTextViewTop = [_atoms count]*itemHeight;
    CGFloat itemTextViewLeft = itemIconViewWidth;

    CGRect itemTextViewFrame = CGRectMake(itemTextViewLeft, itemTextViewTop, itemTextViewWidth, itemTextViewHeight);

    //display icon text view
    void (^displayIconTextView)() = ^() {
        TimeLineCellText *textView = [[TimeLineCellText alloc] initWithFrame:itemTextViewFrame];
        [_containView addSubview:textView];
        textView.horizontalInset = itemIconHorizontalInset;
        textView.verticalInset = itemIconHorizontalInset;

        [textView display:atom firstAtom:firstItem withAnimation:animated withFinish:^(BOOL finished) {
            __void_block_return(completed);
        }];
    };

    //display icon image view
    void (^displayIconImageView)() = ^() {
        TimeLineCellImage *imageView = [[TimeLineCellImage alloc] initWithFrame:itemIconViewFrame];

        imageView.iconImageWidth = itemIconWidth;
        imageView.iconImageHeight = itemIconHeight;
        imageView.horizontalInset = itemIconHorizontalInset;

        [_containView addSubview:imageView];
        [imageView display:atom firstAtom:firstItem withAnimation:animated withFinish:^(BOOL finished) {
            displayIconTextView();
        }];
    };

    displayIconImageView();

    [_atoms addObject:atom];
    [_containView setContentSize:CGSizeMake(_containView.width, [_atoms count]*itemHeight)];
    [self scrollToBottom];
}

- (void)scrollToBottom {
    CGPoint bottomOffset = CGPointMake(0, _containView.contentSize.height - _containView.frame.size.height + _containView.contentInset.bottom);
    if (bottomOffset.y > 0) {
        [_containView setContentOffset: bottomOffset animated:NO];
    }
}

@end
