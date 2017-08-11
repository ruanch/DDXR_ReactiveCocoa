/*********************************************************************
 *         Copyright © 2015年 NetDragon. All rights reserved.
 *                  Date                Name
 *                  14/3/1             GT-ruan
 **********************************************************************
 * @文件名称: GTCache.h
 * @文件描述: 无
 * @补充说明: 无
 *********************************************************************/
#import <Foundation/Foundation.h>
#import "GTCachedObject.h"

@interface GTCache : NSObject

+ (instancetype)sharedInstance;

- (NSString *)keyWithServiceIdentifier:(NSString *)serviceIdentifier
                                    methodName:(NSString *)methodName
                                 requestParams:(NSDictionary *)requestParams;



- (NSData *)fetchCachedDataWithServiceIdentifier:(NSString *)serviceIdentifier
                                methodName:(NSString *)methodName
                             requestParams:(NSDictionary *)requestParams;

- (void)saveCacheWithData:(NSData *)cachedData
        serviceIdentifier:(NSString *)serviceIdentifier
               methodName:(NSString *)methodName
            requestParams:(NSDictionary *)requestParams;

- (void)deleteCacheWithServiceIdentifier:(NSString *)serviceIdentifier
                              methodName:(NSString *)methodName
                           requestParams:(NSDictionary *)requestParams;



- (NSData *)fetchCachedDataWithKey:(NSString *)key;
- (void)saveCacheWithData:(NSData *)cachedData key:(NSString *)key;
- (void)deleteCacheWithKey:(NSString *)key;
- (void)clean;



//文件缓存
- (void)saveArchiverCacheWithData:(NSData *)cachedData
                serviceIdentifier:(NSString *)serviceIdentifier
                       methodName:(NSString *)methodName requestParams:(NSDictionary *)requestParams;
- (NSData *)fetchArchiverCachedDataWithServiceIdentifier:(NSString *)serviceIdentifier
                                              methodName:(NSString *)methodName
                                           requestParams:(NSDictionary *)requestParams;

@end
