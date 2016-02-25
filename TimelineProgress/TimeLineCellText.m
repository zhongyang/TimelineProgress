//
//  TimeLineCellText.m
//  TimelineProgress
//
//  Created by zhongyang on 16/2/23.
//  Copyright © 2016年 zhongyang. All rights reserved.
//

#import "TimeLineCellText.h"
#import "UIView+Utils.h"
#import "JSQMessage.h"
#import "UIImage+JSQMessages.h"
#import "JSQMessagesBubbleImageFactory.h"
#import "JSQMessagesMediaViewBubbleImageMasker.h"
#import <pop/POP.h>
#import "TimelineMarco.h"
#import "TimeLineAnimation.h"

@interface TimeLineCellText () {
    UIImageView *_bubbleImageView;
}

@end

@implementation TimeLineCellText

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
    JSQMessagesBubbleImageFactory *bubbleFactory = [[JSQMessagesBubbleImageFactory alloc] init];
    JSQMessagesBubbleImage *bubbleImage = [bubbleFactory incomingMessagesBubbleImageWithColor:[UIColor orangeColor]];

    CGRect frame = CGRectMake(self.horizontalInset, self.verticalInset, self.width-2*self.horizontalInset, self.height-2*self.verticalInset);
    if (!_bubbleImageView) {
        _bubbleImageView = [[UIImageView alloc] initWithFrame:frame];
        [self addSubview:_bubbleImageView];
    } else {
        _bubbleImageView.frame = frame;
    }

    [_bubbleImageView setImage:bubbleImage.messageBubbleImage];

    UIImage *originBubbleImage = [UIImage jsq_bubbleRegularStrokedTaillessImage];

    frame = CGRectMake(originBubbleImage.size.width/2,  self.verticalInset, self.width-originBubbleImage.size.width, self.height-2*self.verticalInset);
    UILabel *textLabel = [[UILabel alloc] initWithFrame:frame];
    [self addSubview:textLabel];
    textLabel.font = [UIFont systemFontOfSize:14.0f];
    textLabel.textColor = [UIColor orangeColor];
    textLabel.numberOfLines = 0;

    if (animated) {
        CGRect originFrame = CGRectMake(_bubbleImageView.left, _bubbleImageView.top, 0, 0);
        CGRect destFrame = _bubbleImageView.frame;
        [_bubbleImageView setFrame:originFrame];
        [TimeLineAnimation addFrameAnimation:_bubbleImageView originFrame:originFrame destFrame:destFrame duration:0.5f complete:^{
            textLabel.text = atom.text;
            __bool_block_return(finish, YES);
        }];
    } else {
        __bool_block_return(finish, YES);
    }
}

@end
