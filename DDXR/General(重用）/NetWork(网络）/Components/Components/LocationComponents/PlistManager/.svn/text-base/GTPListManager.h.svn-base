/*********************************************************************
 *         Copyright © 2015年 NetDragon. All rights reserved.
 *                  Date                Name
 *                  14/3/1             GT-ruan
 **********************************************************************
 * @文件名称: GTPListManager.h
 * @文件描述: 无
 * @补充说明: 无
 *********************************************************************/
#import <Foundation/Foundation.h>

@interface GTPListManager : NSObject

@property (nonatomic, strong, readonly) NSString *fileName;
@property (nonatomic, copy) id listData; //plist中读出的数据
@property (nonatomic, readonly) BOOL isBundle; //是否从bunlde读取

/*
    以下涉及的filename都不需要带.plist的后缀, 如果文件名是@"abc.plist",那么传入的参数就是 @"abc"
    所有的plist文件都是在NSLibraryDirectory目录下。
 */

- (BOOL)isExistWithFileNameInLibrary:(NSString *)plistFileName;
- (BOOL)isExistWithFileNameInBundle:(NSString *)plistFileName;

/** 
    如果文件不存在的话就新建一个，如果文件已经存在的话，就会删掉已经有的文件重新创建一个
    data只能传NSArray或者NSDictionary
 */
- (BOOL)saveData:(id)data withFileName:(NSString *)fileName;
- (BOOL)saveString:(NSString *)string withFileName:(NSString *)fileName;

/** 如果文件不存在的话返回YES */
- (BOOL)deletePlistFile:(NSString *)fileName;

- (id)loadDataWithFileName:(NSString *)fileName;
- (NSString *)loadStringWithFileName:(NSString *)fileName;


@end
