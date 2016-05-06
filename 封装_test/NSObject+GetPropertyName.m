//
//  NSObject+GetPropertyName.m
//  封装_test
//
//  Created by 姜杉 on 16/5/5.
//  Copyright © 2016年 姜杉. All rights reserved.
//

#import "NSObject+GetPropertyName.h"
#import <objc/runtime.h>
@implementation NSObject (GetPropertyName)
- (NSArray *)getproperty{
    NSArray* propertyNameArray = [self allPropertyNames];
    [propertyNameArray enumerateObjectsUsingBlock:^(NSString*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        SEL getter = NSSelectorFromString(obj);
        id myProperty = [self performSelector:getter];
    }];
    return propertyNameArray;
}
- (NSArray *)allPropertyNames
{
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    NSMutableArray *rv = [NSMutableArray array];
    
    unsigned i;
    for (i = 0; i < count; i++)
    {
        objc_property_t property = properties[i];
        NSString *name = [NSString stringWithUTF8String:property_getName(property)];
        [rv addObject:name];
    }
    
    free(properties);
    
    return rv;
}
@end
