//
//  DDLoginViewModel.h
//  DDXR
//
//  Created by CAIMINWEI on 2017/8/3.
//  Copyright © 2017年 NightElf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDLoginViewModel : NSObject

/// 手机号
@property (nonatomic, readwrite, copy) NSString *mobilePhone;

/// 验证码
@property (nonatomic, readwrite, copy) NSString *verifyCode;

/// 登录按钮的点击状态
@property (nonatomic, readonly, assign) BOOL validLogin;

/// 用户头像
@property (nonatomic, readonly, copy) NSString *avatarUrlString;

/// 用户登录 为了减少View对viewModel的状态的监听 这里采用block回调来减少状态的处理
- (void)loginSuccess:(void(^)(id json))success
             failure:(void (^)(NSError *error))failure;


+ (DDLoginViewModel *)viewModelWithLogin:(NSString *)mobilePhone andVerifyCode:(NSString *)verifyCode andAvatar:(NSString*)avatarUrlString;

- (void)viewModelWithLogin:(NSString *)mobilePhone andVerifyCode:(NSString *)verifyCode andAvatar:(NSString*)avatarUrlString;
@end
