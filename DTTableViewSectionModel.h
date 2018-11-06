//
//  DTSetTableViewSectionModel.h
//  DrivingTest
//
//  Created by 郭大侠 on 2018/6/6.
//  Copyright © 2018年 eclicks. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DTTableViewCellModel.h"

typedef UIView * (^DTViewRenderBlock)(NSInteger section, UITableView *tableView);

@interface DTTableViewSectionModel : NSObject

@property (nonatomic, strong) NSMutableArray<DTTableViewCellModel *> *cellModelArray;
@property (nonatomic, strong) NSString *headerTitle;
@property (nonatomic, strong) NSString *footerTitle;

@property (nonatomic, copy) NSString *defaultHeaderTitle;
@property (nonatomic, copy) NSString *defaultfootTitle;
@property (nonatomic, strong) UIColor *defaultHeaderTextColor;
@property (nonatomic, strong) UIFont *defaultHeaderTextFont;
@property (nonatomic, strong) UIColor *headerBackGroudColor;

@property (nonatomic, assign) CGFloat headerHeight;

@property (nonatomic, assign) CGFloat footerHeight;


@property (nonatomic, copy) DTViewRenderBlock headerViewRenderBlock;

@property (nonatomic, copy) DTViewRenderBlock footerViewRenderBlock;

@property (nonatomic, strong) UIView *headerView;

@property (nonatomic, strong) UIView *footerView;

+(DTTableViewSectionModel *)tableSetSectionWithHeader:(CGFloat)headerHeight andFootHeight:(CGFloat)footHeight;


@end
