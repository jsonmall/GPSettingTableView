//
//  DTTableViewSectionCellModel.h
//  DrivingTest
//
//  Created by 郭大侠 on 2018/6/6.
//  Copyright © 2018年 eclicks. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef UITableViewCell * (^DTCellRenderBlock)(NSIndexPath *indexPath, UITableView *tableView);
typedef NSIndexPath * (^DTCellWillSelectBlock)(NSIndexPath *indexPath, UITableView *tableView);
typedef void (^DTCellSelectionBlock)(NSIndexPath *indexPath, UITableView *tableView);
typedef void (^DTCellWillDisplayBlock)(UITableViewCell *cell, NSIndexPath *indexPath, UITableView *tableView);
typedef void (^DTCellCommitEditBlock)(NSIndexPath *indexPath, UITableView *tableView,
                                       UITableViewCellEditingStyle editingStyle);

@interface DTTableViewCellModel : NSObject

@property (nonatomic, copy) DTCellRenderBlock renderBlock;            // required

@property (nonatomic, copy) DTCellWillDisplayBlock willDisplayBlock;  // optional
@property (nonatomic, copy) DTCellWillSelectBlock willSelectBlock;    // optional
@property (nonatomic, copy) DTCellWillSelectBlock willDeselectBlock;  // optional
@property (nonatomic, copy) DTCellSelectionBlock selectionBlock;      // optional
@property (nonatomic, copy) DTCellSelectionBlock deselectionBlock;    // optional
@property (nonatomic, copy) DTCellCommitEditBlock commitEditBlock;    // optional

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) BOOL canEdit;                            // default NO

@property (nonatomic, assign) UITableViewCellEditingStyle editingStyle;

@property (nonatomic, copy) NSString *deleteConfirmationButtonTitle;

+ (DTTableViewCellModel *)cellModeWithHeight:(CGFloat)height;

@end
