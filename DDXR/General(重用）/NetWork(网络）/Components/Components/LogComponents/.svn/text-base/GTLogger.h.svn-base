/*********************************************************************
 *         Copyright © 2015年 NetDragon. All rights reserved.
 *                  Date                Name
 *                  14/3/1             GT-ruan
 **********************************************************************
 * @文件名称: GTLogger.h
 * @文件描述: 无
 * @补充说明: 无
 *********************************************************************/
#import <Foundation/Foundation.h>
#import "GTService.h"
#import "GTLoggerConfiguration.h"
#import "GTURLResponse.h"


@interface GTLogger : NSObject

@property (nonatomic, strong, readonly) GTLoggerConfiguration *configParams;

+ (void)logDebugInfoWithRequest:(NSURLRequest *)request apiName:(NSString *)apiName service:(GTService *)service requestParams:(id)requestParams httpMethod:(NSString *)httpMethod;
+ (void)logDebugInfoWithResponse:(NSHTTPURLResponse *)response resposeString:(NSString *)responseString request:(NSURLRequest *)request error:(NSError *)error;
+ (void)logDebugInfoWithCachedResponse:(GTURLResponse *)response methodName:(NSString *)methodName serviceIdentifier:(GTService *)service;

+ (instancetype)sharedInstance;
- (void)logWithActionCode:(NSString *)actionCode params:(NSDictionary *)params;

@end
