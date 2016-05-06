//
//  Model.m
//  封装_test
//
//  Created by 姜杉 on 16/5/5.
//  Copyright © 2016年 姜杉. All rights reserved.
//

#import "Model.h"

#define KChangeModelNotification @"ChangeModelNotification"
@implementation Model
- (void)setIsgreen:(BOOL)isgreen{
    _isgreen = isgreen;
    [self buttonColor];
    [[NSNotificationCenter defaultCenter] postNotificationName:KChangeModelNotification object:nil];
    
}
+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    static Model *model = nil;
    dispatch_once(&onceToken, ^{
        model = [[Model alloc]init];
        [model loadAccountInfoFromDisk];
    });
    return model;
}

- (UIColor *)buttonColor {
    if (_isgreen) {
        return kMyButtonColorGreen;
    } else {
        return kMyButtonColorRed;
    }
}
/**
 *  Use NSUserDefault to save the present mode
 */
- (void)saveAccountInfoToDisk {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    NSString  *isNigthStr;
    if (self.isgreen) {
        isNigthStr = @"yes";
    } else {
        isNigthStr = @"no";
    }
    [ud setObject:isNigthStr forKey:@"isNight"];
    
    [ud synchronize];
    
}
/**
 *  Load mode from NSUserDefault
 */
- (void)loadAccountInfoFromDisk {
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    NSString  *isNigthStr = [ud objectForKey:@"isNight"];
    self.isgreen = [isNigthStr isEqualToString:@"yes"];

}


@end
