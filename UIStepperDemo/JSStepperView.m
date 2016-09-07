//
//  JSStepperView.m
//  UIStepperDemo
//
//  Created by 姜杉 on 16/9/7.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import "JSStepperView.h"

@interface JSStepperView()<UITextFieldDelegate>
@property(nonatomic,strong)UIButton * addButn;
@property(nonatomic,strong)UIButton * deleteButn;
@property (nonatomic ,assign)    NSInteger minimumNum;
@property (nonatomic ,assign)    NSInteger maxNum;

@end

@implementation JSStepperView

- (instancetype)initWithMix:(NSInteger )mix Max:(NSInteger )max{
    if (self = [super init ]) {
        _minimumNum = mix;
        _maxNum = max;
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    self.TF = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 150, 35)];
    self.TF.text = @"1";
    self.TF.delegate = self;
    self.TF.keyboardType = UIKeyboardTypeNumberPad;
    self.TF.textAlignment = NSTextAlignmentCenter;
    self.TF.background = [UIImage imageNamed:@"productDetail_productNum"];
    UIButton * addButn = [UIButton buttonWithType:UIButtonTypeCustom];
    addButn.frame = CGRectMake(0, 0, 35, self.TF.frame.size.height);
    [addButn setImage:[UIImage imageNamed:@"jia1.png"] forState:UIControlStateNormal];
    [addButn setImage:[UIImage imageNamed:@"jia.png"] forState:UIControlStateDisabled];
    [addButn setImage:[UIImage imageNamed:@"jiaxuanzhong.png"] forState:UIControlStateHighlighted];
    [addButn addTarget:self action:@selector(addAction:) forControlEvents:UIControlEventTouchUpInside];
    self.addButn = addButn;
    
    UIButton * deleteButn = [UIButton buttonWithType:UIButtonTypeCustom];
    deleteButn.frame = CGRectMake(0, 0, 35, self.TF.frame.size.height);
    [deleteButn setImage:[UIImage imageNamed:@"jian.png"] forState:UIControlStateNormal];
    [deleteButn setImage:[UIImage imageNamed:@"jian1.png"] forState:UIControlStateDisabled];
    [deleteButn setImage:[UIImage imageNamed:@"jianxuanzhong.png"] forState:UIControlStateHighlighted];
    [deleteButn addTarget:self action:@selector(deleteAction:) forControlEvents:UIControlEventTouchUpInside];
    self.deleteButn = deleteButn;
    self.deleteButn.enabled = NO;
    self.TF.leftView = deleteButn;
    self.TF.rightView = addButn;
    self.TF.leftViewMode = UITextFieldViewModeAlways;
    self.TF.rightViewMode = UITextFieldViewModeAlways;
    [self addSubview:self.TF];
}


-(void)addAction:(UIButton *)sender{
    NSString * changeStr = self.TF.text;
    [self.TF resignFirstResponder];
    if ([changeStr integerValue] > 0 || [changeStr integerValue] < _maxNum) {
        self.TF.text = [NSString stringWithFormat:@"%ld",[changeStr integerValue]+1];
        
        if ([self.TF.text integerValue] == _maxNum) {
            self.addButn.enabled = NO;
        }
        if ([self.TF.text integerValue] > _minimumNum) {
            self.deleteButn.enabled = YES;

        }
    }
    
}

-(void)deleteAction:(UIButton *)sender{
    NSString * changeStr = self.TF.text;
    [self.TF resignFirstResponder];
    if ([changeStr integerValue] > 0 || [changeStr integerValue] < _maxNum) {
        
        self.TF.text = [NSString stringWithFormat:@"%ld",[changeStr integerValue]-1];
        
        if ([self.TF.text integerValue] == _minimumNum) {
            self.deleteButn.enabled = NO;
        }
        if ([self.TF.text integerValue] < _maxNum) {
            self.addButn.enabled = YES;
        }
    }
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
   if ([textField.text integerValue] > _maxNum) {
        self.TF.text = [NSString stringWithFormat:@"%ld",(long)_maxNum];
    }
    if ([textField.text isEqualToString:@""]) {
        self.TF.text = [NSString stringWithFormat:@"%ld",(long)_minimumNum];
    }
}
//注意此方法只对键盘输入的内容有效
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{  //string就是此时输入的那个字符 textField就是此时正在输入的那个输入框 返回YES就是可以改变输入框的值 NO相反
    if ([string isEqualToString:@"\n"])  //按会车可以改变
    {
        return YES;
    }
    NSString * toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string]; //得到输入框的内容
    if (self.TF == textField)  //判断是否时我们想要限定的那个输入框
    {
        if ([toBeString integerValue] > _maxNum) { //如果输入框内容大于10则弹出警告

            return NO;
        }
        if ([toBeString isEqualToString:@""]) {
           self.deleteButn.enabled = NO;
            self.addButn.enabled = NO;
        }
        else{
            if ([toBeString integerValue] >= _maxNum) {
                self.addButn.enabled = NO;
            }else{
                self.addButn.enabled = YES;
            }
            if ([toBeString integerValue]<= _minimumNum) {
                self.deleteButn.enabled = NO;
            }else{
                self.deleteButn.enabled = YES;
            }
        }
    }
    return YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
        [self.TF resignFirstResponder];
}


@end
