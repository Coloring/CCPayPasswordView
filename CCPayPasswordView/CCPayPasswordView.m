//
//  CCPayPasswordView.m
//  CCPayPasswordView
//
//  Created by Coloring on 16/3/13.
//  Copyright © 2016年 Coloring. All rights reserved.
//


#define S_Width   [UIScreen mainScreen].bounds.size.width
#define S_Height  [UIScreen mainScreen].bounds.size.height

#import "CCPayPasswordView.h"

@interface Overlay : UIView
@end


@interface CCPayPasswordView ()<PayPasswordViewDelegate> {
    UILabel *titleLabel;
}
@end

@implementation CCPayPasswordView

//+ (instancetype)showInView:(UIView *)view {
//    return [[CCPayPasswordView alloc] initInView:view];
//}

- (void)setShowText:(NSString *)showText {
    titleLabel.text = showText;
}

- (instancetype)initInView:(UIView *)view {
    self = [super init];
    if (self) {
        
        [self setUpPasswordView];
        [self setUpTitleLabelView];
        
        self.frame = CGRectMake(0, S_Height, S_Width, 216.+ _paywordView.frame.size.height + 44. + 40);
        self.backgroundColor = [UIColor colorWithWhite:.99 alpha:1.];
        UITapGestureRecognizer *noTap;
        noTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(noRecognizer)];
        [self addGestureRecognizer:noTap];

        Overlay *overlay = [[Overlay alloc] initWithFrame:view.bounds];
        [view addSubview:overlay];
        [overlay addSubview:self];
        
        [UIView animateWithDuration:0.3 animations:^{
            self.frame = CGRectMake(0, S_Height - self.frame.size.height, self.frame.size.width, self.frame.size.height);
        }];
        
    }
    return self;
}

- (void)setUpPasswordView {
    CGFloat width = S_Width-40;
    UIView * paywordBGView = [[UIView alloc] initWithFrame:CGRectMake((S_Width-width)/2, 60, width, width*50/280)];
    paywordBGView.backgroundColor = [UIColor clearColor];
    
    _paywordView  = [[[NSBundle mainBundle] loadNibNamed:@"PayPasswordView" owner:self options:nil] objectAtIndex:0];
    _paywordView.frame = paywordBGView.bounds;
    [_paywordView.hidTextField becomeFirstResponder];
    
    [paywordBGView addSubview:_paywordView];
    [self addSubview:paywordBGView];
}

- (void)setUpTitleLabelView {
    titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(-.5, 0, S_Width+1, 44.)];
    titleLabel.text = @"输入支付密码";
    titleLabel.font = [UIFont systemFontOfSize:14.];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [titleLabel.layer setBorderWidth:.5];
    [titleLabel.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self addSubview:titleLabel];
}

- (void)noRecognizer {
}

- (void)dismissCCPayPasswordView {
    [_paywordView.hidTextField resignFirstResponder];
    [UIView animateWithDuration:.3 animations:^{
        self.frame = CGRectMake(0, S_Height, self.frame.size.width, self.frame.size.height);
    } completion:^(BOOL finished) {
        if ([self.superview isKindOfClass:[Overlay class]])
            [self.superview removeFromSuperview];
        [super removeFromSuperview];
    }];
}

- (void)removeFromSuperview {
    [self dismissCCPayPasswordView];
}


@end


@implementation Overlay

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:.0 alpha:.3];
        self.opaque = NO;
        
        UITapGestureRecognizer *gestureRecognizer;
        gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                    action:@selector(singleTap:)];
        [self addGestureRecognizer:gestureRecognizer];
    }
    return self;
}

- (void)singleTap:(UITapGestureRecognizer *)recognizer {
    for (UIView *v in self.subviews) {
        if ([v isKindOfClass:[CCPayPasswordView class]] && [v respondsToSelector:@selector(dismissCCPayPasswordView)]) {
            [v performSelector:@selector(dismissCCPayPasswordView) withObject:@(YES)];
        }
    }
}

@end