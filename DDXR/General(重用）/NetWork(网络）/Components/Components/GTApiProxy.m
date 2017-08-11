/*********************************************************************
 *         Copyright © 2015年 NetDragon. All rights reserved.
 *                  Date                Name
 *                  14/3/1             GT-ruan
 **********************************************************************
 * @文件名称: GTApiProxy.m
 * @文件描述: 无
 * @补充说明: 无
 *********************************************************************/
#import "AFNetworking.h"
#import "GTApiProxy.h"
#import "GTServiceFactory.h"
#import "GTRequestGenerator.h"
#import "GTLogger.h"
#import "NSURLRequest+GTNetworkingMethods.h"
#import "DDWSUtil.h"

static NSString * const kAXApiProxyDispatchItemKeyCallbackSuccess = @"kAXApiProxyDispatchItemCallbackSuccess";
static NSString * const kAXApiProxyDispatchItemKeyCallbackFail = @"kAXApiProxyDispatchItemCallbackFail";

@interface GTApiProxy ()

@property (nonatomic, strong) NSMutableDictionary *dispatchTable;
@property (nonatomic, strong) NSNumber *recordedRequestId;

//AFNetworking stuff
//@property (nonatomic, strong) AFHTTPRequestOperationManager *operationManager;
@property(nonatomic,strong)AFHTTPSessionManager *operationManager;
@end

@implementation GTApiProxy
#pragma mark - getters and setters
- (NSMutableDictionary *)dispatchTable
{
    if (_dispatchTable == nil) {
        _dispatchTable = [[NSMutableDictionary alloc] init];
    }
    return _dispatchTable;
}

//- (AFHTTPRequestOperationManager *)operationManager
//{
//    if (_operationManager == nil) {
//        _operationManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:nil];
//        _operationManager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    }
//    return _operationManager;
//}
- (AFHTTPSessionManager *)operationManager
{
    if (_operationManager == nil) {
        _operationManager = [[AFHTTPSessionManager alloc] initWithBaseURL:nil];
        _operationManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        
        if ([DDWSUtil addressType] == DDWSAddressTypeQA ||[DDWSUtil addressType] == DDWSAddressTypeDEV ) {//UAT环境忽略掉，服务器上面的自签证书
            _operationManager.securityPolicy.allowInvalidCertificates = YES;
            [_operationManager.securityPolicy setValidatesDomainName:NO];
        }
        
    }
    return _operationManager;
}


#pragma mark - life cycle
+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static GTApiProxy *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[GTApiProxy alloc] init];
    });
    return sharedInstance;
}

#pragma mark - public methods
- (NSInteger)callGETWithParams:(NSDictionary *)params serviceIdentifier:(NSString *)servieIdentifier methodName:(NSString *)methodName success:(AXCallback)success fail:(AXCallback)fail
{
    /**
     * 封装了REQUEST具体需要的参数层
     * 1.指定不同的服务层
     * 2.拼接参数的URL,包括sign以及一些公共参数
     * 3.序列化裢接参数
     * 4.设置request过期时间
     * 5.封装LOG日志，打印reqeuest请求信息
     */
    NSURLRequest *request = [[GTRequestGenerator sharedInstance] generateGETRequestWithServiceIdentifier:servieIdentifier requestParams:params methodName:methodName];
    /**
     * 1.生成一个requestId
     * 2.将请求请求Operation操作加入自定义队列用于后期维护请求，且加入self.operationManager operationQueue的串行队列开始请求
     * 3.判断之前的操作是否被cacel如果是就不处理请求了
     * 4.加入log日志,打印reponse返回信息
     * 5.将返回的reponse,封装GTURLResponse信息，并返回
     */
    NSNumber *requestId = [self callApiWithRequest:request.URL.absoluteString parameters:params success:success fail:fail];
    return [requestId integerValue];
}

- (NSInteger)callPOSTWithParams:(NSDictionary *)params serviceIdentifier:(NSString *)servieIdentifier methodName:(NSString *)methodName success:(AXCallback)success fail:(AXCallback)fail
{
    NSURLRequest *request = [[GTRequestGenerator sharedInstance] generatePOSTRequestWithServiceIdentifier:servieIdentifier requestParams:params methodName:methodName];
    NSNumber *requestId = [self callApiWithRequest:request.URL.absoluteString parameters:params success:success fail:fail];
    return [requestId integerValue];
}

- (NSInteger)callRestfulGETWithParams:(NSDictionary *)params serviceIdentifier:(NSString *)servieIdentifier methodName:(NSString *)methodName success:(AXCallback)success fail:(AXCallback)fail
{
    NSURLRequest *request = [[GTRequestGenerator sharedInstance] generateRestfulGETRequestWithServiceIdentifier:servieIdentifier requestParams:params methodName:methodName];
    NSNumber *requestId = [self callApiWithRequest:request.URL.absoluteString parameters:params success:success fail:fail];
    return [requestId integerValue];
}

- (NSInteger)callRestfulPOSTWithParams:(NSDictionary *)params serviceIdentifier:(NSString *)servieIdentifier methodName:(NSString *)methodName success:(AXCallback)success fail:(AXCallback)fail
{
    NSURLRequest *request = [[GTRequestGenerator sharedInstance] generateRestfulPOSTRequestWithServiceIdentifier:servieIdentifier requestParams:params methodName:methodName];
    NSNumber *requestId = [self callApiWithRequest:request.URL.absoluteString parameters:params success:success fail:fail];
    return [requestId integerValue];
}

- (NSInteger)callGoogleMapAPIWithParams:(NSDictionary *)params serviceIdentifier:(NSString *)serviceIdentifier success:(AXCallback)success fail:(AXCallback)fail
{
    NSURLRequest *request = [[GTRequestGenerator sharedInstance] generateGoolgeMapAPIRequestWithParams:params serviceIdentifier:serviceIdentifier];
    NSNumber *requestId = [self callApiWithRequest:request.URL.absoluteString parameters:params success:success fail:fail];
    return [requestId integerValue];
}

/**
 * 取消指定的请求
 * 重复刷新/筛选刷新
 */
- (void)cancelRequestWithRequestID:(NSNumber *)requestID
{
    //anf 2.0
//    NSOperation *requestOperation = self.dispatchTable[requestID];
//    [requestOperation cancel];
    //anf 3.0
    NSURLSessionDataTask *requestOperation = self.dispatchTable[requestID];
    [requestOperation cancel];
    
    [self.dispatchTable removeObjectForKey:requestID];
}
/**
 * 取消所有的请求
 */
- (void)cancelRequestWithRequestIDList:(NSArray *)requestIDList
{
    for (NSNumber *requestId in requestIDList) {
        [self cancelRequestWithRequestID:requestId];
    }
}

#pragma mark - private methods
/** 这个函数存在的意义在于，如果将来要把AFNetworking换掉，只要修改这个函数的实现即可。 */
- (NSNumber *)callApiWithRequest:(NSString *)strURL parameters:(NSDictionary *)params success:(AXCallback)success fail:(AXCallback)fail
{
    // 之所以不用getter，是因为如果放到getter里面的话，每次调用self.recordedRequestId的时候值就都变了，违背了getter的初衷
    NSNumber *requestId = [self generateRequestId];
    
    strURL = [NSString stringWithFormat:@"%@/%@",[NSURL URLWithString:[DDWSUtil baseURL]],strURL];
    
    
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
    //securityPolicy.allowInvalidCertificates = YES;
    //AFSecurityPolicy *securityPolicy = [AFSecurityPolicy AFSSLPinningModePublicKey];
    securityPolicy.allowInvalidCertificates = YES; //还是必须设成YES
    /**
     *发送之前设置token,发送请求标识次数，时间等
     */
//    [self.operationManager.requestSerializer setValue:[requestId stringValue] forHTTPHeaderField:@"requestid"];
    self.operationManager.requestSerializer = [AFJSONRequestSerializer serializer];//申明请求的数据是json类型;
   
    //[self.operationManager.requestSerializer setValue:[UserSession sharedInstance].token
    //                     forHTTPHeaderField:@"Token"];
    
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    [self.operationManager.requestSerializer setValue:timeZone.name forHTTPHeaderField:@"TimeZone"];
    
//    NSTimeZone *zone = [NSTimeZone systemTimeZone];
//    [self.operationManager.requestSerializer setValue:zone.name
//                         forHTTPHeaderField:@"Timezone"];
//    ZNLog(@"POST DATA: %@ \n To Path %@ \n With Token %@ \n With RequestId %@",
//          [ZNWSUtil replaceUnicode:[self descriptionForDictionary:params omitKey:@"Photo"]],
//          strURL,
//          [self.operationManager.requestSerializer valueForHTTPHeaderField:@"Token"],
//          [self.operationManager.requestSerializer valueForHTTPHeaderField:@"requestid"]);
    //[ZNWSUtil replaceUnicode:[self descriptionForDictionary:params omitKey:@"Photo"]];
   // [self.operationManager.requestSerializer valueForHTTPHeaderField:@"Token"],
   // [self.operationManager.requestSerializer valueForHTTPHeaderField:@"requestid"];
    
    // 跑到这里的block的时候，就已经是主线程了。
   NSURLSessionDataTask *dataTask = [self.operationManager POST:strURL parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        /**
         * 这段代码处理如果像多次刷新这种频繁操作时需从队列中获取指定请求操作
         */
        NSURLSessionDataTask *storedOperation = self.dispatchTable[requestId];
        if (storedOperation == nil) {
            // 如果这个operation是被cancel的，那就不用处理回调了。
            return;
        } else {
            [self.dispatchTable removeObjectForKey:requestId];
        }
        [GTLogger logDebugInfoWithResponse:task.response
                             resposeString:responseObject
                                   request:task.currentRequest
                                     error:NULL];
        
       
        GTURLResponse *response = [[GTURLResponse alloc] initWithData:responseObject  requestParams:params requestId:requestId status:GTURLResponseStatusSuccess];
    /*
        [[GTURLResponse alloc] initWithData:responseObject];
        [[GTURLResponse alloc] initWithResponseString:operation.responseString requestId:requestId
                                                                        request:operation.request
                                                                   responseData:operation.responseData
                                                                         status:GTURLResponseStatusSuccess];
     */
        
//根据服务器标识区分错误（针对服务器失败请求处理,不是系统错误，服务器发送出来的错误码,错误码建立后在实现）
//        NSInteger code = [[response.content objectForKey:@"code"] integerValue] ;
//        if ([[response.content objectForKey:@"code"] intValue] == 1) {
            success?success(response):nil;
//        }else{
//            [self serverErrorCode:response];
//            NSString *errMsg = @"";
//            if (code == 2) {
//               errMsg = @"服务器异常...";
//            }else if (code == 3){
//               errMsg = @"token失效...";
//            }
//            NSError *error = [[NSError alloc] initWithDomain:@"SERVER_ERROR" code:code userInfo:@{@"error":errMsg}];
//            response = [[GTURLResponse alloc] initWithData:requestId requestParams:params error:error];
//            fail(response);
//        }
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        /**
         * 这段代码处理如果像多次刷新这种频繁操作时需从队列中获取指定请求操作
         */
        NSURLSessionDataTask *storedOperation = self.dispatchTable[requestId];
        if (storedOperation == nil) {
            // 如果这个operation是被cancel的，那就不用处理回调了。
            return;
        } else {
            [self.dispatchTable removeObjectForKey:requestId];
        }
        
        
        [GTLogger logDebugInfoWithResponse:task.response
                             resposeString:nil
                                   request:task.currentRequest
                                     error:error];
        
        GTURLResponse *response = [[GTURLResponse alloc] initWithData:requestId requestParams:params error:error];
//        [[GTURLResponse alloc] initWithResponseString:operation.responseString
//                                                                      requestId:requestId
//                                                                        request:operation.request
//                                                                   responseData:operation.responseData
//                                                                          error:error];
        fail?fail(response):nil;
        
    }];
    
    
    /**
     * 赋值请求的队列，用于后期根据requestId进行取消操作本次请求
     */
    self.dispatchTable[requestId] = dataTask;
    /**
     * 加入anfnetworking请求串行队列开始发送服务器请求
     */
    //[[self.operationManager operationQueue] addOperation:dataTask];
    return requestId;
}
//处理错误信息码
-(void)serverErrorCode:(GTURLResponse *)response
{
    
}

//- (NSNumber *)callApiWithRequest:(NSURLRequest *)request success:(AXCallback)success fail:(AXCallback)fail
//{
//    // 之所以不用getter，是因为如果放到getter里面的话，每次调用self.recordedRequestId的时候值就都变了，违背了getter的初衷
//    NSNumber *requestId = [self generateRequestId];
//    
//    // 跑到这里的block的时候，就已经是主线程了。
//    AFHTTPRequestOperation *httpRequestOperation = [self.operationManager HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        /**
//         * 这段代码处理如果像多次刷新这种频繁操作时需从队列中获取指定请求操作
//         */
//        AFHTTPRequestOperation *storedOperation = self.dispatchTable[requestId];
//        if (storedOperation == nil) {
//            // 如果这个operation是被cancel的，那就不用处理回调了。
//            return;
//        } else {
//            [self.dispatchTable removeObjectForKey:requestId];
//        }
//        
//        [GTLogger logDebugInfoWithResponse:operation.response
//                              resposeString:operation.responseString
//                                    request:operation.request
//                                      error:NULL];
//        
//        GTURLResponse *response = [[GTURLResponse alloc] initWithResponseString:operation.responseString
//                                                                        requestId:requestId
//                                                                          request:operation.request
//                                                                     responseData:operation.responseData
//                                                                           status:GTURLResponseStatusSuccess];
//        success?success(response):nil;
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        /**
//         * 这段代码处理如果像多次刷新这种频繁操作时需从队列中获取指定请求操作
//         */
//        AFHTTPRequestOperation *storedOperation = self.dispatchTable[requestId];
//        if (storedOperation == nil) {
//            // 如果这个operation是被cancel的，那就不用处理回调了。
//            return;
//        } else {
//            [self.dispatchTable removeObjectForKey:requestId];
//        }
//        
//        
//        [GTLogger logDebugInfoWithResponse:operation.response
//                              resposeString:operation.responseString
//                                    request:operation.request
//                                      error:error];
//        
//        GTURLResponse *response = [[GTURLResponse alloc] initWithResponseString:operation.responseString
//                                                                        requestId:requestId
//                                                                          request:operation.request
//                                                                     responseData:operation.responseData
//                                                                            error:error];
//        fail?fail(response):nil;
//        
//    }];
//    /**
//     * 赋值请求的队列，用于后期根据requestId进行取消操作本次请求
//     */
//    self.dispatchTable[requestId] = httpRequestOperation;
//    /**
//     * 加入anfnetworking请求串行队列开始发送服务器请求
//     */
//    [[self.operationManager operationQueue] addOperation:httpRequestOperation];
//    return requestId;
//}

- (NSString *)descriptionForDictionary:(NSDictionary *)dic omitKey:(NSString *)key
{
    //做一下保护，如果参数不是字典，直接返回desc
    if (![dic isKindOfClass:[NSDictionary class]])
    {
        return [dic description];
    }
    NSMutableDictionary *mutableDic = [NSMutableDictionary dictionaryWithDictionary:dic];
    if ([mutableDic.allKeys containsObject:key])
    {
        [mutableDic removeObjectForKey:key];
        [mutableDic setObject:@"这个key的数据省略" forKey:key];
    }
    return [mutableDic description];
}

- (NSNumber *)generateRequestId
{
    if (_recordedRequestId == nil) {
        _recordedRequestId = @(1);
    } else {
        if ([_recordedRequestId integerValue] == NSIntegerMax) {
            _recordedRequestId = @(1);
        } else {
            _recordedRequestId = @([_recordedRequestId integerValue] + 1);
        }
    }
    return _recordedRequestId;
}

-(NSString*)DataTOjsonString:(id)object
{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:0 // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

@end
