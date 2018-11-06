//
//  DTSetTableViewModel.h
//  DrivingTest
//
//  Created by 郭大侠 on 2018/6/6.
//  Copyright © 2018年 eclicks. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DTTableViewSectionModel.h"

@class DTSetTableViewModel;

@protocol DTSetTableViewModelDelegate<NSObject>

@optional

- (void)DTScrollViewDidScroll:(UIScrollView *)scrollView;

@end


@interface DTSetTableViewModel : NSObject<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray<DTTableViewSectionModel *> *sectionModelArray;

@property (nonatomic, weak) id<DTSetTableViewModelDelegate> dtDelegate;


@end
