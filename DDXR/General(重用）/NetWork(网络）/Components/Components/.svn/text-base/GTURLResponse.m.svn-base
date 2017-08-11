/*********************************************************************
 *         Copyright © 2015年 NetDragon. All rights reserved.
 *                  Date                Name
 *                  14/3/1             GT-ruan
 **********************************************************************
 * @文件名称: GTURLResponse.m
 * @文件描述: 无
 * @补充说明: 无
 *********************************************************************/
#import "GTURLResponse.h"
#import "NSObject+AXNetworkingMethods.h"
#import "NSURLRequest+GTNetworkingMethods.h"

@interface GTURLResponse ()

@property (nonatomic, assign, readwrite) GTURLResponseStatus status;
@property (nonatomic, copy, readwrite) NSString *contentString;
@property (nonatomic, copy, readwrite) id content;
@property (nonatomic, copy, readwrite) NSURLRequest *request;
@property (nonatomic, assign, readwrite) NSInteger requestId;
@property (nonatomic, copy, readwrite) NSData *responseData;
@property (nonatomic, assign, readwrite) BOOL isCache;

@end

@implementation GTURLResponse

#pragma mark - life cycle
- (instancetype)initWithResponseString:(NSString *)responseString requestId:(NSNumber *)requestId request:(NSURLRequest *)request responseData:(NSData *)responseData status:(GTURLResponseStatus)status
{
    self = [super init];
    if (self) {
        self.contentString = responseString;
        self.content = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:NULL];
        self.status = status;
        self.requestId = [requestId integerValue];
        self.request = request;
        self.responseData = responseData;
        self.requestParams = request.requestParams;
        self.isCache = NO;
    }
    return self;
}
- (instancetype)initWithData:(NSData *)data requestParams:(NSDictionary *)requestParams  requestId:(NSNumber *)requestId  status:(GTURLResponseStatus)status
{
    self = [super init];
    if (self) {
        self.contentString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        self.status = status;//[self responseStatusWithError:nil];
        self.requestId = [requestId integerValue];
        self.request = nil;
        self.responseData = [data copy];
        self.content = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
        self.requestParams = requestParams;
        self.isCache = NO;
    }
    return self;
}

- (instancetype)initWithData:(NSNumber *)requestId requestParams:(NSDictionary *)requestParams error:(NSError *)error
{
    self = [super init];
    if (self) {
        self.contentString = nil;//[responseString GT_defaultValue:@""];
        self.status = [self responseStatusWithError:error];
        self.requestId = [requestId integerValue];
        self.request = nil;//request;
        self.responseData = nil;//responseData;
        self.requestParams = requestParams;
        self.isCache = NO;
        
        //if (responseData) {
        //    self.content = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:NULL];
        //} else {
            self.content = nil;
        //}
        
    }
    return self;
}


- (instancetype)initWithResponseString:(NSString *)responseString requestId:(NSNumber *)requestId request:(NSURLRequest *)request responseData:(NSData *)responseData error:(NSError *)error
{
    self = [super init];
    if (self) {
        self.contentString = [responseString GT_defaultValue:@""];
        self.status = [self responseStatusWithError:error];
        self.requestId = [requestId integerValue];
        self.request = request;
        self.responseData = responseData;
        self.requestParams = request.requestParams;
        self.isCache = NO;
        
        if (responseData) {
            self.content = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:NULL];
        } else {
            self.content = nil;
        }
    }
    return self;
}

- (instancetype)initWithData:(NSData *)data
{
    self = [super init];
    if (self) {
        self.contentString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        self.status = [self responseStatusWithError:nil];
        self.requestId = 0;
        self.request = nil;
        self.responseData = [data copy];
        self.content = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
        self.isCache = YES;//可以用来分页加载时是否需要缓存来添加更多数据的标识（可以判断当前数据是不是缓存数据）
    }
    return self;
}

#pragma mark - private methods
- (GTURLResponseStatus)responseStatusWithError:(NSError *)error
{
    if (error) {
        GTURLResponseStatus result = GTURLResponseStatusErrorNoNetwork;
        
        // 除了超时以外，所有错误都当成是无网络
        if (error.code == NSURLErrorTimedOut) {
            result = GTURLResponseStatusErrorTimeout;
        }
        return result;
    } else {
        return GTURLResponseStatusSuccess;
    }
}

@end
