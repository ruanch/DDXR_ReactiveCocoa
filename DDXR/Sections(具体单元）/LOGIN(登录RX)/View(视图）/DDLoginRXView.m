//
//  DDLoginView.m
//  DDXR
//
//  Created by CAIMINWEI on 2017/8/3.
//  Copyright © 2017年 NightElf. All rights reserved.
//

#import "DDLoginRXView.h"
#import "MyLayout.h"
#import "CFTool.h"
#import <SDWebImage/UIImageView+WebCache.h>
 

@implementation DDLoginRXView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)bindDataWithViewModel:(DDLoginRXViewModel *)viewModel
{
 
}
- (void)changeHeaderImageView:(NSString *)avatarUrlString
{
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:avatarUrlString] placeholderImage:[UIImage imageNamed:@"mh_defaultAvatar"]];
}

- (void)createUI
{
   _userNameTF = [[UITextField alloc] initWithFrame:CGRectMake(30, 120, [UIScreen mainScreen].bounds.size.width-60, 30)];
    _userNameTF.backgroundColor = [UIColor whiteColor];
    _userNameTF.text = @"";
    //_userNameTF.delegate = self;
    _userNameTF.borderStyle = UITextBorderStyleRoundedRect;//设置输入框的边框类型为圆角
    [self addSubview:_userNameTF];
    
    _verfiyCodeTF =  [[UITextField alloc]initWithFrame:CGRectMake(30, 180, [UIScreen mainScreen].bounds.size.width-60, 30)];
    _verfiyCodeTF.backgroundColor = [UIColor whiteColor];
    _verfiyCodeTF.text = @"";
    //_verfiyCodeTF.delegate = self;
    _verfiyCodeTF.borderStyle = UITextBorderStyleRoundedRect;//设置输入框的边框类型为圆角

    [self addSubview:_verfiyCodeTF];

    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-60)/2, 10, 60, 60)];
    _imageView.image = [UIImage imageNamed:@"mh_defaultAvatar"];
    [self addSubview:_imageView];
    
    
    _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _loginBtn.frame = CGRectMake(30, 220, [UIScreen mainScreen].bounds.size.width-60, 44);
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [_loginBtn setBackgroundColor:[UIColor blueColor]];
    [self addSubview:_loginBtn];

}

#pragma mark -- Layout Construction

-(UILabel*)createSectionLabel:(NSString*)title
{
    UILabel *sectionLabel = [UILabel new];
    sectionLabel.text = title;
    sectionLabel.font = [CFTool font:17];
    [sectionLabel sizeToFit];             //sizeToFit函数的意思是让视图的尺寸刚好包裹其内容。注意sizeToFit方法必要在设置字体、文字后调用才正确。
    return sectionLabel;
}

-(UILabel*)createLabel:(NSString*)title backgroundColor:(UIColor*)color
{
    UILabel *v = [UILabel new];
    v.text = title;
    v.font = [CFTool font:15];
    v.numberOfLines = 0;
    v.textAlignment = NSTextAlignmentCenter;
    v.adjustsFontSizeToFitWidth = YES;
    v.backgroundColor =  color;
    v.layer.shadowOffset = CGSizeMake(3, 3);
    v.layer.shadowColor = [CFTool color:4].CGColor;
    v.layer.shadowRadius = 2;
    v.layer.shadowOpacity = 0.3;
    
    return v;
}

/**
 * 创建一个垂直的线性子布局。
 */
-(MyLinearLayout*)createVertSubviewLayout
{
    //创建垂直布局视图。
    MyLinearLayout *vertLayout = [MyLinearLayout linearLayoutWithOrientation:MyLayoutViewOrientation_Vert];
    vertLayout.backgroundColor = [CFTool color:0];
    

    
    
    return vertLayout;
    
}

/**
 * 创建一个水平的线性子布局。
 */
-(MyLinearLayout*)createHorzSubviewLayout
{
    //创建水平布局视图。
    MyLinearLayout *horzLayout = [MyLinearLayout linearLayoutWithOrientation:MyLayoutViewOrientation_Horz];
    horzLayout.backgroundColor = [CFTool color:0];
    
    /*
     对于水平线性布局里面的子视图来说:
     1.如果不设置任何边距则每个子视图的上边都跟父视图上对齐，而左右则依次按加入的顺序排列。
     2.myTopMargin, myBottomMargin的意义是子视图距离父视图的上下边距。
     3.myLeftMargin, myRightMargin的意义是子视图和兄弟视图之间的左右间距。
     4.如果同时设置了myTopMargin,myBottomMargin则除了能确定上下边距，还能确定子视图的高度。
     5.如果同时设置了myLeftMargin,myRightMargin则只能确定和其他兄弟视图之间的左右间距，但不能确定子视图的宽度。
     6.myCenterYOffset表示子视图的垂直中心点在父视图的垂直中心点上的偏移。
     7.myCenterXOffset的设置没有意义。
     */
    
    
    UILabel *v1 = [self createLabel:NSLocalizedString(@"top marginasldflkasdfkllkjasdlkjflkjaslkjdflkjkajlsdfjkllakjsdlfjkljkas", @"") backgroundColor:[CFTool color:5]];
    v1.myTopMargin = 10; //上边边距10
    v1.myLeftMargin = 10;
    v1.myWidth = 60;
    v1.myHeight = 60;
    [horzLayout addSubview:v1];
    
    
    
    UILabel *v2 = [self createLabel:NSLocalizedString(@"vert center", @"") backgroundColor:[CFTool color:6]];
    v2.myLeftMargin = 10;
    v2.myCenterYOffset = 0; //垂直居中，如果不等于0则会产生居中偏移
    v2.mySize = CGSizeMake(60, 60);
    [horzLayout addSubview:v2];
    
    
    UILabel *v3 = [self createLabel:NSLocalizedString(@"bottom margin", @"") backgroundColor:[CFTool color:7]];
    v3.myBottomMargin = 10; //下边边距10
    v3.myLeftMargin = 10;
    v3.myRightMargin = 5;
    v3.frame = CGRectMake(0, 0, 60, 60);
    [horzLayout addSubview:v3];
    
    
    UILabel *v4 = [self createLabel:NSLocalizedString(@"top bottom", @"") backgroundColor:[CFTool color:8]];
    v4.myTopMargin = 10;
    v4.myBottomMargin = 10; //上面两行代码将上下边距设置为10,对于水平线性布局来说如果子视图同时设置了上下边距则高度会自动算出,因此不需要设置myHeight的值了。
    v4.myLeftMargin = 10;
    v4.myRightMargin = 10;
    v4.myWidth = 60;
    [horzLayout addSubview:v4];
    
    
    return horzLayout;
}


/// textField的数据改变
- (void)_textFieldValueDidChanged:(UITextField *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(textFieldValueDidChanged:changeTextFiled:)]) {
        [self.delegate textFieldValueDidChanged:self changeTextFiled:sender];
    }
    /// bind data
    //self.viewModel.mobilePhone = _userNameTF.text;
    //self.viewModel.verifyCode = _verfiyCodeTF.text;
    //self.loginBtn.enabled = self.viewModel.validLogin;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
