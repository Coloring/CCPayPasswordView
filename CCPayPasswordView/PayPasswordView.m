//
//  PayPasswordView.m
//  WanHuiWang
//
//  Created by mac on 15/9/14.
//  Copyright (c) 2015年 Coloring. All rights reserved.
//

#import "PayPasswordView.h"


@implementation PayPasswordView


- (void)awakeFromNib {
    self.hidTextField.delegate = self;
}



- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (range.length == 1) {
        return YES;
    } else {
        if (self.hidTextField.text.length < 6) {
            [self.delegate eiddingText:string];

            return YES;
        }
        return NO;
    }
}


- (void)cleanView {
    for (NSInteger i = 0; i < self.payPasswordTextField.count; i++) {
        UITextField *textField = self.payPasswordTextField[i];
        textField.text = @"";
    }
}

- (IBAction)editingChanged:(id)sender {
    NSString *passwordText = self.hidTextField.text;// 当前输入的密码
    
    if (passwordText.length == self.payPasswordTextField.count) {
    }

    for (NSInteger i = 0; i < self.payPasswordTextField.count; i++) {
        
        UITextField *textField = self.payPasswordTextField[i];
        
        NSString *passwordChar;
        if (i < passwordText.length)
            passwordChar = [passwordText substringWithRange:NSMakeRange(i, 1)];
        textField.text = passwordChar;
    }
    if (passwordText.length == 6) {
        [self.delegate endEiddingText:passwordText];
    }
}
@end
