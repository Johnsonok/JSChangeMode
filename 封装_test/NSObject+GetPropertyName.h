//
//  NSObject+GetPropertyName.h
//  封装_test
//
//  Created by 姜杉 on 16/5/5.
//  Copyright © 2016年 姜杉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (GetPropertyName)
/**
 *  get ViewController's all members method,if you want to get getter method to refresh ,carry out the method
 */
- (NSArray *)getproperty;
@end
