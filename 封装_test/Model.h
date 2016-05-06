//
//  Model.h
//  封装_test
//
//  Created by 姜杉 on 16/5/5.
//  Copyright © 2016年 姜杉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#define kMyButtonColorGreen [UIColor greenColor]
#define kMyButtonColorRed [UIColor redColor]
@interface Model : NSObject
@property (nonatomic,strong)UIColor *buttonColor; //member's color
@property (nonatomic,assign)BOOL    isgreen; //Change Mode


+ (instancetype)shareInstance;



/**
 *  Public Pork
 */
- (void)saveAccountInfoToDisk;

- (void)loadAccountInfoFromDisk;
@end
