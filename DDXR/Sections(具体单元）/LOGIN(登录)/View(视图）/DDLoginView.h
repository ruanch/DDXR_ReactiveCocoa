//
//  DDLoginView.h
//  DDXR
//
//  Created by CAIMINWEI on 2017/8/3.
//  Copyright © 2017年 NightElf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDLoginViewModel.h"
#import "FBKVOController+MHExtension.h"
@class DDLoginView;
@protocol DDLoginViewDelegate <NSObject>


- (void)textFieldValueDidChanged:(DDLoginView *)loginView changeTextFiled:(UITextField *)sender;
@end

@interface DDLoginView : UIView
{
    UITextField *_userNameTF;
    UITextField *_verfiyCodeTF;
    UIImageView *_imageView;

}
//test1
@property(nonatomic,weak)id<DDLoginViewDelegate> delegate;


- (void)bindDataWithViewModel:(DDLoginViewModel *)viewModel;
@end
