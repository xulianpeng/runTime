//
//  SubEngine.m
//  runTime
//
//  Created by xulianpeng on 2016/11/9.
//  Copyright © 2016年 徐月下. All rights reserved.
//

#import "SubEngine.h"

@implementation SubEngine
- (id)init
{
    if (self = [super init]) {
        
        NSLog(@"%@",NSStringFromClass([self class]));
        NSLog(@"%@",NSStringFromClass([super class]));
    }
    return self;
}
- (void)pritfSuperClassName
{
    [super printfClassName];
}
@end
