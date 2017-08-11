/*********************************************************************
 *           Copyright © 2017年 NightElf. All rights reserved.
 *                  Date                Name
 *                 17/2/4             Ruancanghui
 **********************************************************************
 * @文件名称: DDSearchDataManager.h
 * @文件描述: 处理查询页面的所有数据相关的处理
 * @补充说明: 无
 *********************************************************************/

#import "DDSearchDataManager.h"

#import "Recipe.h"
#import "DDHeader.h"
#import "SearchAPI.h"

@interface DDSearchDataManager()
 
@end

@implementation DDSearchDataManager

- (instancetype)init{
    self = [super init];
    if (self) {
        self.recipes = [[NSArray alloc] init];
    }
    return self;
}
//请求数据
- (void)reque3stDataWhenSuccess:(Success)success fail:(Fail)fail{
   
    [super requestDataWhenSuccess:success fail:fail];
    
    SearchAPI *api = [[SearchAPI alloc] initWithKey:@"ece65c27ede91b57c652f30b59ed5dcd" andMenu:@"炒鸡蛋"];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        id data = request.responseJSONObject;
        [self generateRecipeWithResponseData:data];
         self.success();
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        self.fail(request.error.code,request.error.userInfo.description);
    }];
}

 // 加工获取到的数据
- (void)generateRecipeWithResponseData:(id)responseObj{
    if ([responseObj isKindOfClass:[NSDictionary class]]) {
    
        NSDictionary *responseDic = (NSDictionary *)responseObj;
        NSString *resultCode = responseDic[@"resultcode"];
        if ([resultCode intValue] != 1) {
            return;
        }
        
        NSDictionary *resultDic = responseDic[@"result"];
        NSArray *dataArr = resultDic[@"data"];
        NSMutableArray *recipeArr = [[NSMutableArray alloc] init];
        for (NSDictionary *dic in dataArr) {
            Recipe *recipe = [[Recipe alloc] init];
            recipe.recipeId = dic[@"id"];
            recipe.recipeTitle = dic[@"title"];
            recipe.recipeTags = dic[@"tags"];
            recipe.recipeDesc = dic[@"imtro"];
            recipe.recipeAlbum = dic[@"albums"][0];
            [recipeArr addObject:recipe];
        }
        self.recipes = recipeArr;
    }
}
    

#pragma mark - getter/setter
- (NSArray<Recipe *> *)recipes{
    if (!_recipes) {
        _recipes = [[NSArray alloc] init];
    }
    return _recipes;
}
@end
