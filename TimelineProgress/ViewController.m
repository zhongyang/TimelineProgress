//
//  ViewController.m
//  TimelineProgress
//
//  Created by zhongyang on 16/2/19.
//  Copyright © 2016年 zhongyang. All rights reserved.
//

#import "ViewController.h"
#import "TimeLineView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect viewFrame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    TimeLineView *view = [[TimeLineView alloc] initWithFrame:viewFrame];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
