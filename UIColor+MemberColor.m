//
//  UIColor+MemberColor.m
//  封装_test
//
//  Created by 姜杉 on 16/5/6.
//  Copyright © 2016年 姜杉. All rights reserved.
//

#import "UIColor+MemberColor.h"
#import "Model.h"

@implementation UIColor (MemberColor)

+ (UIColor *)getbuttonColor{
    return [Model shareInstance].buttonColor;
}


@end
