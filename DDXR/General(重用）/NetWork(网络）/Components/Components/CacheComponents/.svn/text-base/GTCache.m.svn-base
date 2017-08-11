/*********************************************************************
 *         Copyright © 2015年 NetDragon. All rights reserved.
 *                  Date                Name
 *                  14/3/1             GT-ruan
 **********************************************************************
 * @文件名称: GTCache.m
 * @文件描述: 无
 * @补充说明: 无
 *********************************************************************/
#import "GTCache.h"
#import "NSDictionary+AXNetworkingMethods.h"
#import "GTNetworkingConfiguration.h"
#import "NSString+AXNetworkingMethods.h"
@interface GTCache ()

@property (nonatomic, strong) NSCache *cache;

@end

@implementation GTCache

#pragma mark - getters and setters
- (NSCache *)cache
{
    if (_cache == nil) {
        _cache = [[NSCache alloc] init];
        _cache.countLimit = kGTCacheCountLimit;
    }
    return _cache;
}

#pragma mark - life cycle
+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static GTCache *sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[GTCache alloc] init];
    });
    return sharedInstance;
}

#pragma mark - public method
- (NSData *)fetchCachedDataWithServiceIdentifier:(NSString *)serviceIdentifier
                                      methodName:(NSString *)methodName
                                   requestParams:(NSDictionary *)requestParams
{
    return [self fetchCachedDataWithKey:[self keyWithServiceIdentifier:serviceIdentifier methodName:methodName requestParams:requestParams]];
}
//内存缓存
- (void)saveCacheWithData:(NSData *)cachedData
        serviceIdentifier:(NSString *)serviceIdentifier
               methodName:(NSString *)methodName requestParams:(NSDictionary *)requestParams
{
    [self saveCacheWithData:cachedData key:[self keyWithServiceIdentifier:serviceIdentifier methodName:methodName requestParams:requestParams]];
    
    [self saveArchiverCacheWithData:cachedData serviceIdentifier:serviceIdentifier methodName:methodName requestParams:requestParams];
}
//文件缓存
- (void)saveArchiverCacheWithData:(NSData *)cachedData
        serviceIdentifier:(NSString *)serviceIdentifier
               methodName:(NSString *)methodName requestParams:(NSDictionary *)requestParams
{
    NSString *key = [self keyWithServiceIdentifier:serviceIdentifier methodName:methodName requestParams:requestParams];
    
//    //准备数据
//    NSString *multiHomePath = [NSHomeDirectory() stringByAppendingPathComponent:@"multi.archiver"];
//    NSMutableData *data = [[NSMutableData alloc]init];
//    NSKeyedArchiver *archvier = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
//    
//    NSString *result  =[[ NSString alloc] initWithData:cachedData encoding:NSUTF8StringEncoding];
//    //对多个对象进行归档
//    [archvier encodeObject:result forKey:key];
//    [archvier finishEncoding];
//    [data writeToFile:multiHomePath atomically:YES];
    
    
    
    // 获取程序Documents目录路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSMutableString * path = [[NSMutableString alloc]initWithString:documentsDirectory];
    [path appendString:[NSString stringWithFormat:@"/%@",[key AX_md5]]];
    
    [cachedData writeToFile:path atomically:YES];
    
}
- (NSData *)fetchArchiverCachedDataWithServiceIdentifier:(NSString *)serviceIdentifier
                                      methodName:(NSString *)methodName
                                   requestParams:(NSDictionary *)requestParams
{
//    //准备数据
//    NSString *multiHomePath = [NSHomeDirectory() stringByAppendingPathComponent:@"multi.archiver"];
//    
//    NSMutableData *dataR = [[NSMutableData alloc]initWithContentsOfFile:multiHomePath];
//    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:dataR];
//    
    NSString *key = [self keyWithServiceIdentifier:serviceIdentifier methodName:methodName requestParams:requestParams];
//    NSString *result = [unarchiver decodeObjectForKey:key];
//    NSData *data =[result dataUsingEncoding:NSUTF8StringEncoding];
//    [unarchiver finishDecoding];
    // 获取程序Documents目录路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSMutableString * path = [[NSMutableString alloc]initWithString:documentsDirectory];
    [path appendString:[NSString stringWithFormat:@"/%@",[key AX_md5]]];
    
    NSData * data = [NSData dataWithContentsOfFile:path];
    
    return data;
}

- (void)deleteCacheWithServiceIdentifier:(NSString *)serviceIdentifier
                              methodName:(NSString *)methodName
                           requestParams:(NSDictionary *)requestParams
{
    [self deleteCacheWithKey:[self keyWithServiceIdentifier:serviceIdentifier methodName:methodName requestParams:requestParams]];
}

- (NSData *)fetchCachedDataWithKey:(NSString *)key
{
    GTCachedObject *cachedObject = [self.cache objectForKey:key];
    if (cachedObject.isOutdated || cachedObject.isEmpty) {
        return nil;
    } else {
        return cachedObject.content;
    }
}

- (void)saveCacheWithData:(NSData *)cachedData key:(NSString *)key
{
    GTCachedObject *cachedObject = [self.cache objectForKey:key];
    if (cachedObject == nil) {
        cachedObject = [[GTCachedObject alloc] init];
    }
    [cachedObject updateContent:cachedData];
    [self.cache setObject:cachedObject forKey:key];
}

- (void)deleteCacheWithKey:(NSString *)key
{
    [self.cache removeObjectForKey:key];
}

- (void)clean
{
    [self.cache removeAllObjects];
}

- (NSString *)keyWithServiceIdentifier:(NSString *)serviceIdentifier methodName:(NSString *)methodName requestParams:(NSDictionary *)requestParams
{
    return [NSString stringWithFormat:@"%@%@%@", serviceIdentifier, methodName, [requestParams GT_urlParamsStringSignature:NO]];
}

@end
