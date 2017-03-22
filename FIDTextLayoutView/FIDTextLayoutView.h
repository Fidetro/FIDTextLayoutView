//
//  FIDTextLayoutView.h
//  FIDTextLayoutView
//
//  Created by Fidetro on 2017/3/21.
//  Copyright © 2017年 Fidetro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>


@interface FIDTextLayoutView : UIView<UITextFieldDelegate>
/** title and placeholder **/
@property(nonatomic,strong) UILabel *titleLabel;
/** inputTextField **/
@property(nonatomic,strong) UITextField *textField;
/** placeholder **/
@property(nonatomic,strong) UIColor *placeholderColor;
/** highLightColor **/
@property(nonatomic,strong) UIColor *highLightColor;


@end
