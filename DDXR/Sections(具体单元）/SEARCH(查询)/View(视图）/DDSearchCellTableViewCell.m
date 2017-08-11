/*********************************************************************
 *           Copyright © 2017年 NightElf. All rights reserved.
 *                  Date                Name
 *                 17/2/4             Ruancanghui
 **********************************************************************
 * @文件名称: DDSearchCellTableViewCell.m
 * @文件描述: 查询的列表选项cell控件
 * @补充说明: 无
 *********************************************************************/

#import "DDSearchCellTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "DDSearchTableCellViewModel.h"

@interface DDSearchCellTableViewCell(){
}
@property (strong, nonatomic) UIImageView *recipeAvatar;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *descLabel;

@end

@implementation DDSearchCellTableViewCell

#pragma mark - life cycle
- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.recipeAvatar];
        [self addSubview:self.titleLabel];
        [self addSubview:self.descLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - private method
- (void)bindDataWithViewModel:(DDSearchTableCellViewModel *)viewModel{
    [self.recipeAvatar sd_setImageWithURL:[NSURL URLWithString:viewModel.avatarURL]];
    self.titleLabel.text = viewModel.title;
    
    //如果菜谱标题中包含西红柿三个字，则字体颜色变化
    if ([viewModel.title containsString:@"西红柿"]) {
        self.titleLabel.textColor = viewModel.titleColor;
    }
    self.descLabel.text = viewModel.desc;
}

#pragma mark - setters and getters
- (UIImageView *)recipeAvatar{
    if (_recipeAvatar == nil) {
        _recipeAvatar = [[UIImageView alloc] initWithFrame:CGRectMake(5, 15, 60, 60)];
    }
    return _recipeAvatar;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 15, screenSize.width-80, 30)];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:13];
    }
    return _titleLabel;
}

- (UILabel *)descLabel{
    if (_descLabel == nil) {
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        _descLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 50, screenSize.width-80, 30)];
        _descLabel.textColor = [UIColor grayColor];
        _descLabel.font = [UIFont systemFontOfSize:12];
    }
    return _descLabel;
}
@end
