//
//  DDLoginViewModel.h
//  DDXR
//
//  Created by CAIMINWEI on 2017/8/3.
//  Copyright © 2017年 NightElf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface DDLoginRXViewModel : NSObject
/// 手机号
@property (nonatomic, readwrite, copy) NSString *mobilePhone;
/// 验证码
@property (nonatomic, readwrite, copy) NSString *verifyCode;
/// 用户头像
@property (nonatomic, readonly, copy) NSString *avatarUrlString;
/// 按钮能否点击
@property (nonatomic, readonly, strong) RACSignal *validLoginSignal;
/// 登录按钮点击执行的命令
@property (nonatomic, readonly, strong) RACCommand *loginCommand;

/// 用户登录 为了减少View对viewModel的状态的监听 这里采用block回调来减少状态的处理
- (void)loginSuccess:(void(^)(id json))success
             failure:(void (^)(NSError *error))failure;


+ (DDLoginRXViewModel *)viewModelWithLogin:(NSString *)mobilePhone andVerifyCode:(NSString *)verifyCode andAvatar:(NSString*)avatarUrlString;

- (void)viewModelWithLogin:(NSString *)mobilePhone andVerifyCode:(NSString *)verifyCode andAvatar:(NSString*)avatarUrlString;
@end
