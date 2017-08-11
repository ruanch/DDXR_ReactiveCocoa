//
//  BaseBtn.h
//  Drivers
//
//  Created by muxi on 15/2/6.
//  Copyright (c) 2015年 muxi. All rights reserved.
//  自定义的按钮
//  此按钮可以设置不同状态下的背景色


/*
 ==========================Example=============================
 以下是一些使用示例：
 //代码
 CoreStatusBtn *btn=[[CoreStatusBtn alloc] initWithFrame:CGRectMake(50, 110, 160, 40)];
 btn.msg=@"登陆中";
 //    btn.shutOffZoomAnim = YES;
 //设置文字
 [btn setTitle:@"我是按钮" forState:UIControlStateNormal];
 
 btn.backgroundColorForNormal=[UIColor brownColor];
 btn.backgroundColorForHighlighted=[UIColor redColor];
 btn.backgroundColorForSelected=[UIColor yellowColor];
 self.btn=btn;
 
 //添加事件
 [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
 
 [self.view addSubview:btn];
 
 
 //nib
 self.myBtn.backgroundColorForNormal=rgb(121, 36, 98);
 self.myBtn.shutOffColorLoadingAnim = YES;
 self.myBtn.shutOffZoomAnim = YES;
 self.countBtn.backgroundColorForNormal=rgb(167, 132, 27);
 self.countBtn.countNum=60;
 
 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(16.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
 
 self.countBtn.status=CoreCountBtnStatusNormal;
 });
 
 
 CoreBtn *btn2 = [[CoreBtn alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
 btn2.backgroundColorForNormal = [UIColor redColor];
 [self.view addSubview:btn2];
 [btn2 Click:UIControlEventTouchDown ClickBlock:^{
 NSLog(@"点击");
 }];
 
 
 //点击效果
 -(IBAction)btnClick:(CoreStatusBtn *)btn{
 btn.status=CoreStatusBtnStatusProgress;
 //子线程测试
 dispatch_queue_t queue=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), queue, ^{
 btn.status=CoreStatusBtnStatusFalse;
 });
 }
 
 - (IBAction)getVerify:(CoreCountBtn *)countBtn{
 countBtn.status=CoreCountBtnStatusCounting;
 }
 */


#import <UIKit/UIKit.h>


#define rgb(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f]

@interface CoreBtn : UIButton

//普通状态下的颜色
@property (nonatomic,strong) UIColor *backgroundColorForNormal;

//高亮状态下的颜色
@property (nonatomic,strong) UIColor *backgroundColorForHighlighted;

//不可用状态下的颜色
@property (nonatomic,strong) UIColor *backgroundColorForDisabled;

//被选中状态下的颜色
@property (nonatomic,strong) UIColor *backgroundColorForSelected;

/** 图片着色:普通 */
@property (nonatomic,strong) UIColor *colorForNormal;

/** 图片着色:高亮 */
@property (nonatomic,strong) UIColor *colorForHighlighted;

/** 图片着色:禁用 */
@property (nonatomic,strong) UIColor *colorForDisabled;

/** 图片着色:选中 */
@property (nonatomic,strong) UIColor *colorForSelected;

/** 字体大小 */
@property (nonatomic,assign) CGFloat fontPoint;

/** 最常用的点击事件 */
@property (nonatomic,copy) void (^ClickBlock)();

/** 事件 */
-(void)Click:(UIControlEvents)event ClickBlock:(void(^)())ClickBlock;

@end
