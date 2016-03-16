//
//  Student+Category.m
//  Runtime
//
//  Created by suhc on 16/3/16.
//  Copyright © 2016年 kongjianjia. All rights reserved.
//

#import "Student+Category.h"
#import <objc/runtime.h>

@implementation Student (Category)
const char name;
- (void)setFirstName:(NSString *)firstName{
    objc_setAssociatedObject(self, &name, firstName, OBJC_ASSOCIATION_COPY);
}

- (NSString *)firstName{
    return objc_getAssociatedObject(self, &name);
}

@end
