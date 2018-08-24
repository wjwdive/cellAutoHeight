//
//  CodeCell.m
//  cellAutoHeight
//
//  Created by jiangwei.wang on 2018/8/20.
//  Copyright © 2018年 jiangwei.wang. All rights reserved.
//

#import "CodeCell.h"

@interface CodeCell()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIImageView *photoView;
@property (nonatomic, strong) UIButton *subBtn;

@end

@implementation CodeCell


+ (id)cellWithTableView:(UITableView *)tableView {
    static NSString *cellID = @"codeCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[CodeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)configUI {
    UILabel *label1 = [[UILabel alloc] init];
    _titleLabel = label1;
    [self.contentView addSubview:_titleLabel];
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.preferredMaxLayoutWidth = kScreenW - 40 ;
    label2.numberOfLines = 0;
    _contentLabel = label2;
    [self.contentView addSubview:_contentLabel];

    UIImageView *photoView = [[UIImageView alloc] init];
    photoView.contentMode = UIViewContentModeScaleAspectFit;
    _photoView = photoView;
    [self.contentView addSubview:_photoView];
    
    UIButton *subBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    subBtn.titleLabel.text = @"button";
    [subBtn setBackgroundColor:[UIColor greenColor]];
    _subBtn = subBtn;
    [self.contentView addSubview:_subBtn];
    
    int margin = 5;
    int padding = 10;
    
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).offset(padding);
        make.right.equalTo(self.contentView.mas_right).offset(-padding);
    }];
    
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(margin);
    }];
    
    [_photoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.contentLabel.mas_bottom).offset(margin);
    }];
    
    [_subBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.photoView.mas_bottom).offset(margin);
        make.bottom.equalTo(self.contentView);
    }];
    
    
    
}

// 如果你是自动布局子控件，就不需要实现此方法，如果是计算子控件frame的话就需要实现此方法
//- (CGSize)sizeThatFits:(CGSize)size {
//
//    CGFloat cellHeight = 0;
//
//    cellHeight += [self.titleLabel sizeThatFits:size].height;
//    cellHeight += [self.contentLabel sizeThatFits:size].height;
//    cellHeight += [self.contentImageView sizeThatFits:size].height;
//    cellHeight += [self.userLabel sizeThatFits:size].height;
//    cellHeight += 40;
//
//    return CGSizeMake(size.width, cellHeight);
//}



- (void)setCellModel:(CodeCellModel *)cellModel {
    self.titleLabel.text = cellModel.name;
    self.contentLabel.text = cellModel.content;
    self.photoView.image = [UIImage imageNamed:cellModel.photoName];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
