//
//  DTSetTableViewSectionModel.m
//  DrivingTest
//
//  Created by 郭大侠 on 2018/6/6.
//  Copyright © 2018年 eclicks. All rights reserved.
//

#import "DTTableViewSectionModel.h"

@implementation DTTableViewSectionModel
- (instancetype)init {
    self = [super init];
    if (self) {
        self.headerHeight = UITableViewAutomaticDimension;
        self.footerHeight = UITableViewAutomaticDimension;
        self.cellModelArray = [NSMutableArray array];
    }
    return self;
}

+(DTTableViewSectionModel *)tableSetSectionWithHeader:(CGFloat)headerHeight andFootHeight:(CGFloat)footHeight
{
    DTTableViewSectionModel *sectionModel = [[DTTableViewSectionModel alloc]init];
    sectionModel.headerHeight = headerHeight;
    sectionModel.footerHeight = footHeight;
    sectionModel.headerBackGroudColor = [UIColor clearColor];
    return sectionModel;
}

@end
