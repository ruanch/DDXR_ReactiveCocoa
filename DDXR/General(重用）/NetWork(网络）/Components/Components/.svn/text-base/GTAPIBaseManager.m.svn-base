/*********************************************************************
 *         Copyright © 2015年 NetDragon. All rights reserved.
 *                  Date                Name
 *                  14/3/1             GT-ruan
 **********************************************************************
 * @文件名称: GTAPIBaseManager.m
 * @文件描述: 无
 * @补充说明: 无
 *********************************************************************/

#import "GTAPIBaseManager.h"
#import "GTNetworking.h"
#import "GTCache.h"
#import "GTLogger.h"
#import "GTServiceFactory.h"
#import "Reachability.h"
#define AXCallAPI(REQUEST_METHOD, REQUEST_ID)                                                       \
{                                                                                       \
    REQUEST_ID = [[GTApiProxy sharedInstance] call##REQUEST_METHOD##WithParams:apiParams serviceIdentifier:self.child.serviceType methodName:self.child.methodName success:^(GTURLResponse *response) { \
        [self successedOnCallingAPI:response];                                          \
    } fail:^(GTURLResponse *response) {                                                \
        [self failedOnCallingAPI:response withErrorType:GTAPIManagerErrorTypeDefault];  \
    }];                                                                                 \
    [self.requestIdList addObject:@(REQUEST_ID)];                                          \
}

@interface GTAPIBaseManager ()

@property (nonatomic, strong, readwrite) id fetchedRawData;

@property (nonatomic, copy, readwrite) NSString *errorMessage;
@property (nonatomic, readwrite) GTAPIManagerErrorType errorType;
@property (nonatomic, strong) NSMutableArray *requestIdList;
@property (nonatomic, strong) GTCache *cache;

@end

@implementation GTAPIBaseManager

#pragma mark - getters and setters
- (GTCache *)cache
{
    if (_cache == nil) {
        _cache = [GTCache sharedInstance];
    }
    return _cache;
}

- (NSMutableArray *)requestIdList
{
    if (_requestIdList == nil) {
        _requestIdList = [[NSMutableArray alloc] init];
    }
    return _requestIdList;
}

- (BOOL)isReachable
{
    BOOL isReachability = NO;//[GTAppContext sharedInstance].isReachable;
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    if (networkStatus != NotReachable) {
        isReachability = YES;
    }
    if (!isReachability) {
        self.errorType = GTAPIManagerErrorTypeNoNetWork;
    }
    return isReachability;
}

- (BOOL)isLoading
{
    return [self.requestIdList count] > 0;
}

#pragma mark - life cycle
- (instancetype)init
{
    self = [super init];
    if (self) {
        _delegate = nil;
        _validator = nil;
        _paramSource = nil;
        
        _fetchedRawData = nil;
        
        _errorMessage = nil;
        _errorType = GTAPIManagerErrorTypeDefault;
        
        if ([self conformsToProtocol:@protocol(GTAPIManager)]) {
            self.child = (id <GTAPIManager>)self;
        }
    }
    return self;
}

- (void)dealloc
{
    [self cancelAllRequests];
    self.requestIdList = nil;
}

#pragma mark - public methods
- (void)cancelAllRequests
{
    [[GTApiProxy sharedInstance] cancelRequestWithRequestIDList:self.requestIdList];
    [self.requestIdList removeAllObjects];
}

- (void)cancelRequestWithRequestId:(NSInteger)requestID
{
    [self removeRequestIdWithRequestID:requestID];
    [[GTApiProxy sharedInstance] cancelRequestWithRequestID:@(requestID)];
}

- (id)fetchDataWithReformer:(id<GTAPIManagerCallbackDataReformer>)reformer
{
    id resultData = nil;
    if ([reformer respondsToSelector:@selector(manager:reformData:)]) {
        resultData = [reformer manager:self reformData:self.fetchedRawData];
    } else {
        resultData = [self.fetchedRawData mutableCopy];
    }
    return resultData;
}

#pragma mark - calling api
- (NSInteger)loadData
{
    NSDictionary *params = [self.paramSource paramsForApi:self];
    NSInteger requestId = [self loadDataWithParams:params];
    return requestId;
}
/**
 * 1.参数自定义化处理，比如你从多个平台服务器传输的数据，需要统一处理reformParams
 * 2.在传入API之前只想查看传入参数详细信息
 * 3.在传入API之前可以检查参数转换后的合法性，可以在你所在controller中回调协议，如果返回NO=》api将不进行,并返回参数错误
 * 4.检查是否有缓存，如果有就返回0
 * 5.检查网络是否可用，不可用返回网络错误
 * 6.根据requestType调用相关请求
 * 7.在结束后之前AOP拦住并把参数和requestID返回
 */
- (NSInteger)loadDataWithParams:(NSDictionary *)params
{
    NSInteger requestId = 0;
    NSDictionary *apiParams = [self reformParams:params];
    if ([self shouldCallAPIWithParams:apiParams]) {
        if ([self.validator manager:self isCorrectWithParamsData:apiParams]) {
            
//            // 先检查一下是否有缓存 (策略改为断开网络后检查缓存）
//            if ([self shouldCache] && [self hasCacheWithParams:apiParams]) {
//                return 0;
//            }
            // 先检查一下是否有缓存,利用文件缓存 (策略改为断开网络后检查缓存）
            if ([self shouldCache] && [self hasArchiverCacheWithParams:apiParams]) {
                //return 0;
            }
            
            // 实际的网络请求
            if ([self isReachable]) {
                    switch (self.child.requestType)
                    {
                        case GTAPIManagerRequestTypeGet:
                            AXCallAPI(GET, requestId);
                            break;
                        case GTAPIManagerRequestTypePost:
                            AXCallAPI(POST, requestId);
                            break;
                        case GTAPIManagerRequestTypeRestGet:
                            AXCallAPI(RestfulGET, requestId);
                            break;
                        case GTAPIManagerRequestTypeRestPost:
                            AXCallAPI(RestfulPOST, requestId);
                            break;
                        default:
                            break;
                    }
            
                NSMutableDictionary *params = [apiParams mutableCopy];
                params[kGTAPIBaseManagerRequestID] = @(requestId);
                [self afterCallingAPIWithParams:params];
                return requestId;
            
            } else {
                // 断开网络后 先检查一下是否有缓存（网络断开，内存拿缓存）
                if ([self shouldCache] && [self hasCacheWithParams:apiParams]) {
                    //return 0;
                }
                [self failedOnCallingAPI:nil withErrorType:GTAPIManagerErrorTypeNoNetWork];
                return requestId;
            }
        } else {
            [self failedOnCallingAPI:nil withErrorType:GTAPIManagerErrorTypeParamsError];
            return requestId;
        }
    }
    return requestId;
}

#pragma mark - api callbacks
- (void)apiCallBack:(GTURLResponse *)response
{
    if (response.status == GTURLResponseStatusSuccess) {
        [self successedOnCallingAPI:response];
    }else{
        [self failedOnCallingAPI:response withErrorType:GTAPIManagerErrorTypeTimeout];
    }
}

- (void)successedOnCallingAPI:(GTURLResponse *)response
{
    if (response.content) {
        self.fetchedRawData = [response.content copy];
    } else {
        self.fetchedRawData = [response.responseData copy];
    }
    [self removeRequestIdWithRequestID:response.requestId];
    if ([self.validator manager:self isCorrectWithCallBackData:response.content]) {
        
        if ([self shouldCache] && !response.isCache) {
            [self.cache saveCacheWithData:response.responseData serviceIdentifier:self.child.serviceType methodName:self.child.methodName requestParams:response.requestParams];
        }
        
        [self beforePerformSuccessWithResponse:response];
        [self.delegate managerCallAPIDidSuccess:self];
        [self afterPerformSuccessWithResponse:response];
    } else {
        [self failedOnCallingAPI:response withErrorType:GTAPIManagerErrorTypeNoContent];
    }
}

- (void)failedOnCallingAPI:(GTURLResponse *)response withErrorType:(GTAPIManagerErrorType)errorType
{
    self.errorType = errorType;
    if (response) {
        if (response.status == GTURLResponseStatusErrorTimeout) {
            self.errorType = GTAPIManagerErrorTypeTimeout;
        }else if (response.status == GTURLResponseStatusErrorNoNetwork){
            self.errorType = GTAPIManagerErrorTypeNoNetWork;
        }
    }
    [self removeRequestIdWithRequestID:response.requestId];
    [self beforePerformFailWithResponse:response];
    [self.delegate managerCallAPIDidFailed:self];
    [self afterPerformFailWithResponse:response];
}

#pragma mark - method for interceptor

/*
    拦截器的功能可以由子类通过继承实现，也可以由其它对象实现,两种做法可以共存
    当两种情况共存的时候，子类重载的方法一定要调用一下super
    然后它们的调用顺序是BaseManager会先调用子类重载的实现，再调用外部interceptor的实现
    
    notes:
        正常情况下，拦截器是通过代理的方式实现的，因此可以不需要以下这些代码
        但是为了将来拓展方便，如果在调用拦截器之前manager又希望自己能够先做一些事情，所以这些方法还是需要能够被继承重载的
        所有重载的方法，都要调用一下super,这样才能保证外部interceptor能够被调到
        这就是decorate pattern
 */
- (void)beforePerformSuccessWithResponse:(GTURLResponse *)response
{
    self.errorType = GTAPIManagerErrorTypeSuccess;
    if (self != self.interceptor && [self.interceptor respondsToSelector:@selector(manager:beforePerformSuccessWithResponse:)]) {
        [self.interceptor manager:self beforePerformSuccessWithResponse:response];
    }
}

- (void)afterPerformSuccessWithResponse:(GTURLResponse *)response
{
    if (self != self.interceptor && [self.interceptor respondsToSelector:@selector(manager:afterPerformSuccessWithResponse:)]) {
        [self.interceptor manager:self afterPerformSuccessWithResponse:response];
    }
}

- (void)beforePerformFailWithResponse:(GTURLResponse *)response
{
    if (self != self.interceptor && [self.interceptor respondsToSelector:@selector(manager:beforePerformFailWithResponse:)]) {
        [self.interceptor manager:self beforePerformFailWithResponse:response];
    }
}

- (void)afterPerformFailWithResponse:(GTURLResponse *)response
{
    if (self != self.interceptor && [self.interceptor respondsToSelector:@selector(manager:afterPerformFailWithResponse:)]) {
        [self.interceptor manager:self afterPerformFailWithResponse:response];
    }
}

//只有返回YES才会继续调用API
- (BOOL)shouldCallAPIWithParams:(NSDictionary *)params
{
    if (self != self.interceptor && [self.interceptor respondsToSelector:@selector(manager:shouldCallAPIWithParams:)]) {
        return [self.interceptor manager:self shouldCallAPIWithParams:params];
    } else {
        return YES;
    }
}

- (void)afterCallingAPIWithParams:(NSDictionary *)params
{
    if (self != self.interceptor && [self.interceptor respondsToSelector:@selector(manager:afterCallingAPIWithParams:)]) {
        [self.interceptor manager:self afterCallingAPIWithParams:params];
    }
}

#pragma mark - method for child
- (void)cleanData
{
    IMP childIMP = [self.child methodForSelector:@selector(cleanData)];
    IMP selfIMP = [self methodForSelector:@selector(cleanData)];
    
    if (childIMP == selfIMP) {
        self.fetchedRawData = nil;
        self.errorMessage = nil;
        self.errorType = GTAPIManagerErrorTypeDefault;
    } else {
        if ([self.child respondsToSelector:@selector(cleanData)]) {
            [self.child cleanData];
        }
    }
}

//如果需要在调用API之前额外添加一些参数，比如pageNumber和pageSize之类的就在这里添加
//子类中覆盖这个函数的时候就不需要调用[super reformParams:params]了
- (NSDictionary *)reformParams:(NSDictionary *)params
{
    IMP childIMP = [self.child methodForSelector:@selector(reformParams:)];
    IMP selfIMP = [self methodForSelector:@selector(reformParams:)];
    
    if (childIMP == selfIMP) {
        return params;
    } else {
        // 如果child是继承得来的，那么这里就不会跑到，会直接跑子类中的IMP。
        // 如果child是另一个对象，就会跑到这里
        NSDictionary *result = nil;
        result = [self.child reformParams:params];
        if (result) {
            return result;
        } else {
            return params;
        }
    }
}

- (BOOL)shouldCache
{
    return kGTShouldCache;
}

#pragma mark - private methods
- (void)removeRequestIdWithRequestID:(NSInteger)requestId
{
    NSNumber *requestIDToRemove = nil;
    for (NSNumber *storedRequestId in self.requestIdList) {
        if ([storedRequestId integerValue] == requestId) {
            requestIDToRemove = storedRequestId;
        }
    }
    if (requestIDToRemove) {
        [self.requestIdList removeObject:requestIDToRemove];
    }
}

- (BOOL)hasCacheWithParams:(NSDictionary *)params
{
    NSString *serviceIdentifier = self.child.serviceType;
    NSString *methodName = self.child.methodName;
    NSData *result = [self.cache fetchCachedDataWithServiceIdentifier:serviceIdentifier methodName:methodName requestParams:params];
    
    if (result == nil) {
        return NO;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        GTURLResponse *response = [[GTURLResponse alloc] initWithData:result];
        response.requestParams = params;
        [GTLogger logDebugInfoWithCachedResponse:response methodName:methodName serviceIdentifier:[[GTServiceFactory sharedInstance] serviceWithIdentifier:serviceIdentifier]];
        [self successedOnCallingAPI:response];
    });
    return YES;
}

- (BOOL)hasArchiverCacheWithParams:(NSDictionary *)params
{
    NSString *serviceIdentifier = self.child.serviceType;
    NSString *methodName = self.child.methodName;
    NSData *result = [self.cache fetchArchiverCachedDataWithServiceIdentifier:serviceIdentifier methodName:methodName requestParams:params];
    
    if (result == nil) {
        return NO;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        GTURLResponse *response = [[GTURLResponse alloc] initWithData:result];
        response.requestParams = params;
        [GTLogger logDebugInfoWithCachedResponse:response methodName:methodName serviceIdentifier:[[GTServiceFactory sharedInstance] serviceWithIdentifier:serviceIdentifier]];
        [self successedOnCallingAPI:response];
    });
    return YES;
}

@end
