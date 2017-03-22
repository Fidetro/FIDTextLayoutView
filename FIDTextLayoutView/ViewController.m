//
//  ViewController.m
//  FIDTextLayoutView
//
//  Created by Fidetro on 2017/3/21.
//  Copyright © 2017年 Fidetro. All rights reserved.
//

#import "ViewController.h"
#import "FIDTextLayoutView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    FIDTextLayoutView *layoutView = [[FIDTextLayoutView alloc]init];
    layoutView.placeholderColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    layoutView.highLightColor = [UIColor colorWithRed:23/255.0 green:158/255.0 blue:158/255.0 alpha:1];
    [self.view addSubview:layoutView];
    __weak UIView *superView = self.view;
    layoutView.titleLabel.text = @"用户名";
    [layoutView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(superView.mas_centerX);
        make.centerY.mas_equalTo(superView.mas_centerY);
        make.width.mas_equalTo(200);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
        [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];    
}


@end
