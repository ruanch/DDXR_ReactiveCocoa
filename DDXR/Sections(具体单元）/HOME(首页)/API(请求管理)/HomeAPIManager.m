/*********************************************************************
 *         Copyright © 2015年  All rights reserved.
 *                  Date                Name
 *                  14/3/1             GT-ruan
 **********************************************************************
 * @文件名称: HomeAPIManager.h
 * @文件描述: 用于首页列表请求配置文件
 * @补充说明: 无
 *********************************************************************/

#import "HomeAPIManager.h"

@implementation HomeAPIManager
// NSString *url = @"http://apis.juhe.cn/cook/query";
-(NSString *)serviceType // 缓存唯一标识 inde
{
    return POST_COOK_QUERY;
}

-(NSString *) methodName // api 连接地址（方法名）
{
    return POST_COOK_QUERY;
}

-(GTAPIManagerRequestType) requestType //请求类型
{
    return GTAPIManagerRequestTypePost;
}
/**
 自己处理转换dictionary 传递的参数
 -(NSDictionary *)reformParams:(NSDictionary *)params //返回值格式转换（可以在这中间替换，目前这个工程用不到了）
 {
 return params;
 }
 */
-(BOOL)shouldCache //是否需缓存
{
    return YES;
}

@end
