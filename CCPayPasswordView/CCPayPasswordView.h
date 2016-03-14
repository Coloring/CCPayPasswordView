//
//  CCPayPasswordView.h
//  CCPayPasswordView
//
//  Created by Coloring on 16/3/13.
//  Copyright © 2016年 Coloring. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PayPasswordView.h"

@interface CCPayPasswordView : UIView

@property (strong, nonatomic)     PayPasswordView *paywordView;


@property (strong, nonatomic) NSString *showText;
//+ (instancetype)showInView:(UIView *)view;

- (instancetype)initInView:(UIView *)view;

@end
