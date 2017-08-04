//
//  NSObject+DebugDescription.m
//  DebugDescription
//
//  Created by 曾国锐 on 2017/8/4.
//  Copyright © 2017年 曾国锐. All rights reserved.
//

#import "NSObject+DebugDescription.h"
#import <objc/runtime.h>

@implementation NSObject (DebugDescription)

-(NSString *)debugDescription{

    return [self getDictionary:NO];
}

-(NSString *)description{
    
    return [self getDictionary:YES];
}

- (NSString *)getDictionary:(BOOL)isDescription{

    if ([self isKindOfClass:[NSArray class]] || [self isKindOfClass:[NSDictionary class]] || [self isKindOfClass:[NSNumber class]] || [self isKindOfClass:[NSString class]]) {
        return isDescription?self.description:self.debugDescription;
    }
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    //得到当前class的所有属性
    uint count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    for (int i=0; i<count; i++) {//循环并用KVC得到每个属性的值
        objc_property_t *property = &properties[i];
        NSString *name = @(property_getName(*property));
        id value = [self valueForKey:name]?:@"nil";//默认值为nil字符串
        [dictionary setObject:value forKey:name];
    }
    //释放
    free(properties);
    return [NSString stringWithFormat:@"<%@:%p> -- %@", [self class], self, dictionary];

}

@end
