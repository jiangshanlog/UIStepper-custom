//
//  JSStepperView.h
//  UIStepperDemo
//
//  Created by 姜杉 on 16/9/7.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSStepperView : UIView

@property (nonatomic ,strong)UITextField *TF;


- (instancetype)initWithMix:(NSInteger )mix Max:(NSInteger )max;
@end
