//
//  ViewController.m
//  UIStepperDemo
//
//  Created by 姜杉 on 16/9/7.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import "ViewController.h"
#import "JSStepperView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    JSStepperView *js = [[JSStepperView alloc]initWithMix:1 Max:7];
    js.frame = CGRectMake(100, 100, 150, 35);
    [self.view addSubview:js];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
