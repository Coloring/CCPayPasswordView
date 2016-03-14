//
//  PayPasswordView.h
//  WanHuiWang
//
//  Created by mac on 15/9/14.
//  Copyright (c) 2015年 Coloring. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PayPasswordViewDelegate <NSObject>

@optional
- (void)endEiddingText:(NSString *)text;
- (void)eiddingText:(NSString *)text;

@end




@interface PayPasswordView : UIView<UITextFieldDelegate>

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *payPasswordTextField;

@property (weak, nonatomic) IBOutlet UITextField *hidTextField;

@property (weak, nonatomic) id<PayPasswordViewDelegate>delegate;

- (IBAction)editingChanged:(id)sender;
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;

- (void)cleanView;
@end
