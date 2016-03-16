//
//  ViewController.m
//  Runtime
//
//  Created by suhc on 16/3/16.
//  Copyright © 2016年 kongjianjia. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import <objc/runtime.h>
#import "Student+Category.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self addExtentionProperty];
}

/**
 *  动态变量控制
 */
- (void)changeVariable{
    Student *student = [Student new];
    student.name = @"乔布斯";
    NSLog(@"%@",student.name);
    
    unsigned int count;
    Ivar *ivar = class_copyIvarList([Student class], &count);
    for (int i = 0; i < count; i++) {
        Ivar var = ivar[i];
        const char *varName = ivar_getName(var);
        NSString *name = [NSString stringWithCString:varName encoding:NSUTF8StringEncoding];
        if ([name isEqualToString:@"_name"]) {
            object_setIvar(student, var, @"Steve Jobs");
            break;
        }
        
    }
    
    NSLog(@"%@",student.name);
}

/**
 *  动态添加方法
 */
- (void)addMethod{
    Student *student = [Student new];
    BOOL addSuccess = class_addMethod([Student class], @selector(join), (IMP)happyNewYear, "v@:");
    if (addSuccess) {
        [student performSelector:@selector(join)];
    }
}

void happyNewYear(id self,SEL _cmd){
    NSLog(@"新年快乐");
}

/**
 *  动态为Category扩展加属性
 */
- (void)addExtentionProperty{
    Student *student = [Student new];
    student.firstName = @"Steve";
}

/**
 *  动态交换方法实现
 */
- (void)exchangeMethod{
    NSLog(@"---------交换方法实现前---------");
    Student *student = [Student new];
    student.name = @"乔布斯";
    [student eat];
    [student sleep];
    
    NSLog(@"---------交换方法实现后---------");
    Method method1 = class_getInstanceMethod([Student class], @selector(eat));
    Method method2 = class_getInstanceMethod([Student class], @selector(sleep));
    method_exchangeImplementations(method1, method2);
    [student eat];
    [student sleep];
}

@end
