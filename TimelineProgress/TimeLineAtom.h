//
//  TimeLineAtom.h
//  TimelineProgress
//
//  Created by zhongyang on 16/2/19.
//  Copyright © 2016年 zhongyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeLineAtom : NSObject

@property(nonatomic, copy) NSString *text;
@property(nonatomic, assign) BOOL isDone;

@end
