//
//  TimelineMarco.h
//  TimelineProgress
//
//  Created by zhongyang on 16/2/19.
//  Copyright © 2016年 zhongyang. All rights reserved.
//

#ifndef TimelineMarco_h
#define TimelineMarco_h

#define __weak_self     __typeof__(self) __weak weakself = self;
#define __strong_self   __strong __typeof(weakself) strongSelf = weakself;

#define __void_block_return(block) \
        if(block) { \
            block(); \
        } \

#define __bool_block_return(block, boolValue) \
        if(block) { \
        block(boolValue); \
        } \


#endif /* TimelineMarco_h */
