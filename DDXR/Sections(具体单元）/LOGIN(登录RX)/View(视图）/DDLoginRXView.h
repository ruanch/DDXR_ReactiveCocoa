//
//  DDLoginView.h
//  DDXR
//
//  Created by CAIMINWEI on 2017/8/3.
//  Copyright © 2017年 NightElf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDLoginRXViewModel.h"
#import "FBKVOController+MHExtension.h"
@class DDLoginRXView;
@protocol DDLoginRXViewDelegate <NSObject>


- (void)textFieldValueDidChanged:(DDLoginRXView *)loginView changeTextFiled:(UITextField *)sender;
@end

@interface DDLoginRXView : UIView
{
//    UITextField *_userNameTF;
//    UITextField *_verfiyCodeTF;
//    UIImageView *_imageView;
}
@property(nonatomic,strong)UITextField *userNameTF;
@property(nonatomic,strong)UITextField *verfiyCodeTF;
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UIButton *loginBtn;


//test1
@property(nonatomic,weak)id<DDLoginRXViewDelegate> delegate;


- (void)bindDataWithViewModel:(DDLoginRXViewModel *)viewModel;

- (void)changeHeaderImageView:(NSString *)avatarUrlString;
@end
