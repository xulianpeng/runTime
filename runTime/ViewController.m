//
//  ViewController.m
//  runTime
//
//  Created by 徐月下 on 16/6/5.
//  Copyright © 2016年 徐月下. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "Engine.h"
#import "SubEngine.h"

typedef void(^clickBlock)(NSInteger);
@interface ViewController ()<UIAlertViewDelegate>
{
    NSTimer *atimer;
    NSInteger type;
}

@property(nonatomic,copy)clickBlock theClickBlock;
@end

@implementation ViewController
static void *alertViewKey = @"alertViewKey";

/**
 *  这是需要好好研究研究的sadasdasd
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.view.backgroundColor = [UIColor blueColor];
//    atimer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(handle) userInfo:nil repeats:YES];
//    type = 1;
    
    /**
     *  数组越界采取的处理
     *
     *  @return nil
     */
    
    Engine *subEngine1 = [[Engine alloc]init];
    
    SubEngine *subEngine2 = [[SubEngine alloc]init];
    
    [subEngine1 printfClassName];
    [subEngine2 printfClassName];
    
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
    [bt addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt];
    bt.backgroundColor = [UIColor redColor];
    bt.frame = CGRectMake(100, 200, 200, 50);
    
    
    
}
- (void)click:(UIButton *)bt
{
    
  
    
    if (self.myLoginBlock) {
        
        
    }
    NSLog(@"点我点我点我======");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushAlertNew:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"撒娇和返回时打发" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
//    void (^alertBlock)(NSInteger) = ^(NSInteger buttonIndexmm){
//        
//        if (buttonIndexmm == 0) {
//            NSLog(@"取消了啦啦啦");
//        }else if (buttonIndexmm == 1)
//        {
//            NSLog(@"确认了啦啦啦");
//        }
//    };
//    objc_setAssociatedObject(alert, alertViewKey, alertBlock, OBJC_ASSOCIATION_COPY);
    
    self.theClickBlock = ^(NSInteger buttonIndex)
    {
        if (buttonIndex== 0) {
            NSLog(@"取消了啦啦啦");
        }else if (buttonIndex == 1)
        {
            NSLog(@"确认了啦啦啦");
        }
    };
    
    
    objc_setAssociatedObject(alert, alertViewKey, self.theClickBlock, OBJC_ASSOCIATION_COPY);
    

    
    [alert show];
//
//    if (type == 1) {
//        
//        [atimer setFireDate:[NSDate distantFuture]];//暂停
//        type = 2;
//    }else
//    {
//        [atimer setFireDate:[NSDate distantPast]];//重启
//        type = 1;
//    }
}
- (void)handle
{
    NSLog(@"===什么会");
}
- (void)dealloc
{
//    objc_removeAssociatedObjects((__bridge id)(alertViewKey));
    
//    objc_removeAssociatedObjects((__bridge id) (self.theClickBlock));
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{

//    void (^alertBlcok)(NSInteger) = objc_getAssociatedObject(alertView, alertViewKey);
//    alertBlcok(buttonIndex);
    
    
    self.theClickBlock = objc_getAssociatedObject(alertView, alertViewKey);
    self.theClickBlock(buttonIndex);
}
@end
