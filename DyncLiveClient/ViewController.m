//
//  ViewController.m
//  DyncLiveClient
//
//  Created by jianqiangzhang on 16/6/23.
//  Copyright © 2016年 jianqiangzhang. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+Category.h"
#import "AvPlayerViewController.h"
#import "AvStreamerViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *pushButton;
@property (weak, nonatomic) IBOutlet UIButton *pullButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pushButton.layer.cornerRadius = 24;
    self.pushButton.backgroundColor = [UIColor colorWithHexString:@"2fcf6f"];
    
    self.pullButton.layer.cornerRadius = 24;
    self.pullButton.backgroundColor = [UIColor colorWithHexString:@"2fcf6f"];
}
- (IBAction)pushButtonEvent:(id)sender {
    AvStreamerViewController* viewController = [AvStreamerViewController new];
    viewController.modalTransitionStyle =
    UIModalTransitionStyleCrossDissolve;
    [self presentViewController:viewController
                       animated:YES
                     completion:nil];
}
- (IBAction)pullButtonEvent:(id)sender {
    AvPlayerViewController* viewController = [AvPlayerViewController new];
    viewController.modalTransitionStyle =
    UIModalTransitionStyleCrossDissolve;
    [self presentViewController:viewController
                       animated:YES
                     completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
