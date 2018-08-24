//
//  CodeCell.h
//  cellAutoHeight
//
//  Created by jiangwei.wang on 2018/8/20.
//  Copyright © 2018年 jiangwei.wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CodeCellModel.h"


@interface CodeCell : UITableViewCell

@property (nonatomic, strong) CodeCellModel *cellModel;
+ (id)cellWithTableView:(UITableView *)tableView;
- (void)setCellModel:(CodeCellModel *)cellModel;
@end
