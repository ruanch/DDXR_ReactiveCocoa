//
//  ChrysanthemumRemnants.h
//  DrawCircle
//
//  Created by Qi Jiyu on 16/3/21.
//  Copyright © 2016年 Qi Jiyu. All rights reserved.
//

/*
 ==========================Example=============================
 两行代码快速集成高斯模糊的活动指示器 好难解释, 额..就像支付宝如果你进去后台再回到前台的时候会有一个模糊效果
 
 _testHUD = [[JYFrostedProgressHUD alloc] initWithView:self.view]; WithView可以传你想要覆盖的view层
 
 [self.view addSubview:_testHUD];
 
 调用[_testHUD stop]HUD停止
*/

#import <UIKit/UIKit.h>

@interface JYFrostedProgressHUD : UIView

@property (nonatomic, strong) CAShapeLayer *arcLayer;

@property (nonatomic, strong) UIView *parentView;// 父视图的view

@property (nonatomic, assign) CGPoint location; //菊花的位置, 默认中心
@property (nonatomic, assign) float radius;//菊花半径, 默认20.0f

/**
 *  初始化方法
 *
 *  @param bigView 本视图的 view 层
 */
- (instancetype)initWithView:(UIView *)selfView;

/**
 *  停止转圈
 */
- (void)stop;

@end
