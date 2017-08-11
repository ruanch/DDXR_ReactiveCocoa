//
//  DDLoginViewModel.m
//  DDXR
//
//  Created by CAIMINWEI on 2017/8/3.
//  Copyright © 2017年 NightElf. All rights reserved.
//

#import "DDLoginViewModel.h"
#import "FBKVOController.h"
#import "FBKVOController+MHExtension.h"
@interface DDLoginViewModel ()
/// 用户头像
@property (nonatomic, readwrite, copy) NSString *avatarUrlString;
@end

@implementation DDLoginViewModel
{
     FBKVOController *_KVOController;
}

- (void)loginSuccess:(void(^)(id json))success
             failure:(void (^)(NSError *error))failure
{
    
}



- (id) init
{
    if(self = [super init])
    {
        _KVOController = [FBKVOController controllerWithObserver:self];
        __weak DDLoginViewModel *weakSelf = self;
        [_KVOController mh_observe:self keyPath:@"mobilePhone" block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSString *,id> * _Nonnull change) {
            
            NSString *mobilePhone = change[NSKeyValueChangeNewKey];
            if ([mobilePhone isMemberOfClass:[NSNull class]] || mobilePhone.length < 13) {
                weakSelf.avatarUrlString = nil;
                return ;
            }
            /// 模拟从数据库获取用户头像的数据
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.75f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                /// 假数据 别在意
                weakSelf.avatarUrlString = @"abc";
            });
        }];

    }
    return self;
}

+ (DDLoginViewModel *)viewModelWithLogin:(NSString *)mobilePhone andVerifyCode:(NSString *)verifyCode andAvatar:(NSString*)avatarUrlString
{
    DDLoginViewModel *vm = [[DDLoginViewModel alloc] init];
    vm.mobilePhone = mobilePhone;
    vm.verifyCode = verifyCode;
    //vm.avatarUrlString = avatarUrlString;
    return vm;
}

- (void)viewModelWithLogin:(NSString *)mobilePhone andVerifyCode:(NSString *)verifyCode andAvatar:(NSString*)avatarUrlString
{
    
    self.mobilePhone = mobilePhone;
    self.verifyCode = verifyCode;
    //vm.avatarUrlString = avatarUrlString;
}
@end
