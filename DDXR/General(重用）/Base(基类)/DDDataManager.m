/*********************************************************************
 *           Copyright © 2017年 NightElf. All rights reserved.
 *                  Date                Name
 *                 17/2/4             Ruancanghui
 **********************************************************************
 * @文件名称: DDDataManager.m
 * @文件描述: 处理主页上的所有数据相关的处理
 * @补充说明: 无
 *********************************************************************/

#import "DDDataManager.h"
//#import <AFNetworking/AFNetworking.h>
#import "Recipe.h"

 

@implementation DDDataManager

- (instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}
    
- (void)requestDataWhenSuccess:(Success)success fail:(Fail)fail{
    self.success = success;
    self.fail = fail;
}
    
#pragma mark GTAPIManagerParamSourceDelegate
- (NSDictionary *)paramsForApi:(GTAPIBaseManager *)manager
    {
        return self.parameter;
    }
#pragma mark GTAPIManagerValidator
- (BOOL)manager:(GTAPIBaseManager *)manager isCorrectWithParamsData:(NSDictionary *)data
    {
        return YES;
    }
- (BOOL)manager:(GTAPIBaseManager *)manager isCorrectWithCallBackData:(NSDictionary *)data
    {
        return YES;
    }
    
#pragma mark GTAPIManagerApiCallBackDelegate
- (void)manager:(GTAPIBaseManager *)manager beforePerformSuccessWithResponse:(GTURLResponse *)response
    {
        self.hasCache = response.isCache;
    }
    
- (void)managerCallAPIDidSuccess:(GTAPIBaseManager *)manager
    {
                self.success();
    }
- (void)managerCallAPIDidFailed:(GTAPIBaseManager *)manager
    {
        self.fail(manager.errorType,manager.errorMessage);
    }
@end
