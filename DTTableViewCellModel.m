//
//  DTTableViewSectionCellModel.m
//  DrivingTest
//
//  Created by 郭大侠 on 2018/6/6.
//  Copyright © 2018年 eclicks. All rights reserved.
//

#import "DTTableViewCellModel.h"

@implementation DTTableViewCellModel
- (instancetype)init {
    self = [super init];
    if (self) {
        self.height = UITableViewAutomaticDimension;
    }
    return self;
}

+(DTTableViewCellModel *)cellModeWithHeight:(CGFloat)height
{
    DTTableViewCellModel *cellMode = [[DTTableViewCellModel alloc]init];
    cellMode.height = height;
    return cellMode;
}

@end
