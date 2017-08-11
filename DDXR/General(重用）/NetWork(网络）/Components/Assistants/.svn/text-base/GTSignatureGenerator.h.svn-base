/*********************************************************************
 *         Copyright © 2015年 NetDragon. All rights reserved.
 *                  Date                Name
 *                  14/3/1             GT-ruan
 **********************************************************************
 * @文件名称: GTSignatureGenerator.h
 * @文件描述: 无
 * @补充说明: 无
 *********************************************************************/

#import <Foundation/Foundation.h>

@interface GTSignatureGenerator : NSObject

+ (NSString *)signGetWithSigParams:(NSDictionary *)allParams methodName:(NSString *)methodName apiVersion:(NSString *)apiVersion privateKey:(NSString *)privateKey publicKey:(NSString *)publicKey;
+ (NSString *)signRestfulGetWithAllParams:(NSDictionary *)allParams methodName:(NSString *)methodName apiVersion:(NSString *)apiVersion privateKey:(NSString *)privateKey;

+ (NSString *)signPostWithApiParams:(NSDictionary *)apiParams privateKey:(NSString *)privateKey publicKey:(NSString *)publicKey;
+ (NSString *)signRestfulPOSTWithApiParams:(id)apiParams commonParams:(NSDictionary *)commonParams methodName:(NSString *)methodName apiVersion:(NSString *)apiVersion privateKey:(NSString *)privateKey;

@end
