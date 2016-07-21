//
//  masoryCell.m
//  fdtableviewcell
//
//  Created by 军魏 on 16/7/15.
//  Copyright © 2016年 weijun. All rights reserved.
//

#import "masoryCell.h"
#import "Masonry.h"
#import <UIImageView+WebCache.h>
@interface masoryCell()
@property(strong,nonatomic) UIImageView* imageV;
@property(strong,nonatomic) UIImageView* headImageV;
@property(strong,nonatomic) UILabel* contentLabel;
@end


@implementation masoryCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupLayout];
    }
    
    return self;
}

- (void) setFrame:(CGRect)frame {
    frame.size.height -=20;
    [super setFrame:frame];
}

- (void) setupLayout {
    
    __weak typeof(self) weakSelf = self;
    UIImageView *contentImageView = [[UIImageView alloc] init];
   // contentImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:contentImageView];
    self.imageV = contentImageView;
    
    UIImageView *headImageV = [[UIImageView alloc] init];
    [self.contentView addSubview:headImageV];
    self.headImageV = headImageV;
    
    UILabel* contentLabel = [[UILabel alloc] init];
    contentLabel.font = [UIFont systemFontOfSize:13.0f];
    contentLabel.textColor = [UIColor redColor];
    contentLabel.numberOfLines = 0;
    contentLabel.textAlignment = NSTextAlignmentNatural;
    self.contentLabel = contentLabel;
    [self.contentView addSubview:contentLabel];
    
    [contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.contentView.mas_top).offset(0);
        make.left.equalTo(weakSelf.contentView.mas_left).offset(0);
        make.right.equalTo(weakSelf.contentView.mas_right).offset(0);
        //make.height.equalTo(weakSelf.contentView.mas_width).multipliedBy(0.5);
         make.bottom.equalTo(headImageV.mas_top).offset(-10);
    }];
    
    [headImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 60));
        make.left.equalTo(weakSelf.contentView.mas_left).offset(10);
        make.top.equalTo(contentImageView.mas_bottom).offset(10);
       // make.bottom.equalTo(weakSelf.contentView.mas_bottom).offset(-10);
        make.bottom.equalTo(weakSelf.contentView.mas_bottom).offset(-10).priorityMedium(0);
    }];
    
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentImageView.mas_bottom).offset(10);
        make.left.equalTo(headImageV.mas_right).offset(10);
        make.right.equalTo(weakSelf.contentView.mas_right).offset(-10);
        make.bottom.equalTo(weakSelf.contentView.mas_bottom).offset(-10).priorityHigh(0);
    }];
}


- (void)setObject:(entity *)object {
    _object = object;
    [_imageV setImage:[UIImage imageNamed:@"contentImage"]];
    [_headImageV setImage:[UIImage imageNamed:@"headImage"]];
    [_contentLabel setText:@"1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111"];
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
