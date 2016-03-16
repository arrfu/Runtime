//
//  Student.h
//  Runtime
//
//  Created by suhc on 16/3/16.
//  Copyright © 2016年 kongjianjia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
/**
 * 名字
 */
@property (nonatomic, copy) NSString *name;

/**
 * 性别
 */
@property (nonatomic, copy) NSString *sex;

- (void)eat;

-(void)sleep;

@end
