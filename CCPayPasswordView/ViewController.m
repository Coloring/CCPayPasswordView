//
//  ViewController.m
//  CCPayPasswordView
//
//  Created by Coloring on 16/3/13.
//  Copyright © 2016年 Coloring. All rights reserved.
//

#import "ViewController.h"

#import "CCPayPasswordView.h"

@interface ViewController ()<PayPasswordViewDelegate> {

    CCPayPasswordView *_payPasswordView;
    
    NSString *_password;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _password = @"123456";
    
}
- (IBAction)click:(id)sender {
    
    _payPasswordView = [[CCPayPasswordView alloc] initInView:self.view];
    _payPasswordView.paywordView.delegate = self;
}

- (void)endEiddingText:(NSString *)text {
    NSLog(@"6位密码 %@", text);
    
    if ([text isEqualToString:_password]) {
        [_payPasswordView removeFromSuperview];
        
    } else {
        
        [_payPasswordView setShowText:@"密码错误，请重新输入"];
        _payPasswordView.paywordView.hidTextField.text = @"";
        [_payPasswordView.paywordView cleanView];
    }
}

- (void)eiddingText:(NSString *)text {
    NSLog(@"输入了 %@", text);
    [_payPasswordView setShowText:@"输入支付密码"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
