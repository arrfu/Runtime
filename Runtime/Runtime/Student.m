//
//  Student.m
//  Runtime
//
//  Created by suhc on 16/3/16.
//  Copyright © 2016年 kongjianjia. All rights reserved.
//

#import "Student.h"

@implementation Student
- (void)eat{
    NSLog(@"%@吃饭了",self.name);
}

- (void)sleep{
    NSLog(@"%@睡觉了",self.name);
}

@end
