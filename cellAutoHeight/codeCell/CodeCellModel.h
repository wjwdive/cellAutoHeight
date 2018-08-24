//
//  CodeCellModel.h
//  cellAutoHeight
//
//  Created by jiangwei.wang on 2018/8/24.
//  Copyright © 2018年 jiangwei.wang. All rights reserved.
//

#import "BaseModel.h"

@interface CodeCellModel : BaseModel
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *photoName;
@property (nonatomic, copy) NSString *subTitle;
@end
