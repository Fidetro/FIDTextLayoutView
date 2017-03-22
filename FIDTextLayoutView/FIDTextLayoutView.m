//
//  FIDTextLayoutView.m
//  FIDTextLayoutView
//
//  Created by Fidetro on 2017/3/21.
//  Copyright © 2017年 Fidetro. All rights reserved.
//

#import "FIDTextLayoutView.h"
CGFloat const kScaleMultiplied = 0.8;
CGFloat const kDuringTime = 0.5;
@interface FIDTextLayoutView ()
/** 底部线 **/
@property(nonatomic,strong) UIView *bottomLineView;
@end

@implementation FIDTextLayoutView

- (instancetype)init
{
    if ([super init]) {
        [self masLayoutSubview];
    }
    return self;
}


#pragma mark - --------------------------TextField delegate--------------------------
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [UIView animateWithDuration:kDuringTime animations:^{
        [self titleMoveToTop];
        [self layoutIfNeeded];
    }];
    self.titleLabel.textColor = self.highLightColor;
    self.bottomLineView.backgroundColor = self.highLightColor;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([textField.text length] == 0) {
        [UIView animateWithDuration:kDuringTime animations:^{
            [self titleMoveToBottom];
            [self layoutIfNeeded];
        }];
    }
    
    self.titleLabel.textColor = self.placeholderColor;
    self.bottomLineView.backgroundColor = self.placeholderColor;
}


- (void)titleMoveToTop
{
    
    self.titleLabel.layer.transform = CATransform3DScale(CATransform3DMakeTranslation(-self.titleLabel.frame.size.width*(1-kScaleMultiplied)/2, 0, 0), kScaleMultiplied, kScaleMultiplied, 1);;
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.textField.mas_top);
        make.left.mas_equalTo(self.textField.mas_left);
    }];
    
    
}

- (void)titleMoveToBottom
{
    __weak UIView *superView = self;
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(superView.mas_centerY);
        make.left.mas_equalTo(self.textField.mas_left);
        make.height.mas_equalTo(self.textField);
    }];
    self.titleLabel.layer.transform = CATransform3DIdentity;
}

#pragma mark - --------------------------getter and setter--------------------------

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        __weak UIView *superView = self;
        _titleLabel = [[UILabel alloc]init];
        [superView addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UITextField *)textField
{
    if (!_textField) {
        __weak UIView *superView = self;
        _textField = [[UITextField alloc]init];
        [superView addSubview:_textField];
        _textField.delegate = self;
    }
    return _textField;
}

- (UIView *)bottomLineView
{
    if (!_bottomLineView) {
        __weak UIView *superView = self;
        _bottomLineView = [[UIView alloc]init];
        [superView addSubview:_bottomLineView];
    }
    return _bottomLineView;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    _placeholderColor = placeholderColor;
    self.bottomLineView.backgroundColor = placeholderColor;
    self.titleLabel.textColor = placeholderColor;
}

- (void)masLayoutSubview
{
    __weak UIView *superView = self;
    [self.textField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(superView);
    }];
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(superView.mas_centerY);
        make.left.mas_equalTo(self.textField.mas_left);
    }];
    [self.bottomLineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(superView.mas_bottom);
        make.left.mas_equalTo(superView.mas_left);
        make.right.mas_equalTo(superView.mas_right);
        make.height.mas_equalTo(1);
    }];

}



@end
