//
//  XLPTextView.m
//  runTime
//
//  Created by xulianpeng on 16/8/2.
//  Copyright © 2016年 徐月下. All rights reserved.
//

#import "XLPTextView.h"

@interface XLPTextView ()

{
    UILabel *_placeholderLabel;
}
@end
@implementation XLPTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
       
        _placeholder = [[UILabel alloc]init];
        
        
        
    }
    return self;
}


@end
