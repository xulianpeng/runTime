//
//  ViewController.h
//  runTime
//
//  Created by 徐月下 on 16/6/5.
//  Copyright © 2016年 徐月下. All rights reserved.
//

#import <UIKit/UIKit.h>
//typeof myBlock = (void)myBlock()
typedef void(^loginSuccessBlock)(NSArray *arr);

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *pushAlert;

@property(nonatomic,copy)loginSuccessBlock myLoginBlock;

- (IBAction)pushAlertNew:(id)sender;


@end

