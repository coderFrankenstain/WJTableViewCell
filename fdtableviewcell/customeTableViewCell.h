//
//  customeTableViewCell.h
//  fdtableviewcell
//
//  Created by 军魏 on 16/7/14.
//  Copyright © 2016年 weijun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "entity.h"
@interface customeTableViewCell : UITableViewCell
@property(strong,nonatomic) entity* object;

@property (weak, nonatomic) IBOutlet UIImageView *contentImage;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;


@end
