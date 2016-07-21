//
//  customeTableViewCell.m
//  fdtableviewcell
//
//  Created by 军魏 on 16/7/14.
//  Copyright © 2016年 weijun. All rights reserved.
//

#import "customeTableViewCell.h"
#import <UIImageView+WebCache.h>
@implementation customeTableViewCell

- (void)setObject:(entity *)object {
    _object = object;
   
    [_contentImage setImage:[UIImage imageNamed:@"contentImage"]];
    [_headImage setImage:[UIImage imageNamed:@"headImage"]];
 //  [_contentImage sd_setImageWithURL:[NSURL URLWithString:object.contentUrl] placeholderImage:nil];
   // [_contentImage sd_setImageWithURL:[NSURL URLWithString:object.contentUrl] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
       
  //  }];
    
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
