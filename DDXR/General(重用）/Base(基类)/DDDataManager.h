/*********************************************************************
 *           Copyright © 2017年 NightElf. All rights reserved.
 *                  Date                Name
 *                 17/2/4             Ruancanghui
 **********************************************************************
 * @文件名称: DDDataManager.h
 * @文件描述: 数据管理器基类
 * @补充说明: 无
 *********************************************************************/

#import <Foundation/Foundation.h>
#import "HomeAPIManager.h"

typedef void (^Success)(void);
typedef void (^Fail)(NSInteger,NSString *);

@interface DDDataManager : NSObject<GTAPIManagerApiCallBackDelegate,GTAPIManagerParamSourceDelegate,GTAPIManagerInterceptor,GTAPIManagerValidator>

//请求参数
@property(nonatomic,strong)NSDictionary *parameter;
//是否有缓存
@property(nonatomic,assign)BOOL hasCache;
    
//成功值返回
@property(nonatomic,copy) Success success;
//失败值返回
@property(nonatomic,copy) Fail fail;
/**
 *  请求数据
 *  成功返回食谱数据 
 */
- (void)requestDataWhenSuccess:(Success)success fail:(Fail)fail;

@end
