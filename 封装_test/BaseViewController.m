//
//  BaseViewController.m
//  UI封装demo
//
//  Created by 姜杉 on 16/5/5.
//  Copyright © 2016年 姜杉. All rights reserved.
//

#import "BaseViewController.h"
#import "Model.h"
#import "AppDelegate.h"
#define KChangeModelNotification @"ChangeModelNotification"
@implementation BaseViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    [self setModel];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setModel) name:KChangeModelNotification object:nil];
    
    
}


- (void)setModel {
    NSLog(@"-------Do nothing");
}

- (void)dealloc {
    
    // 必须在dealloc方法中移除观察
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
