//
//  DTConfigNavigationBar.h
//  DrivingTest
//
//  Created by 郭大侠 on 2018/6/7.
//  Copyright © 2018年 eclicks. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface DTConfigNavigationBar : UINavigationBar

@property (nonatomic, strong) UIBarButtonItem *leftItem;

@property (nonatomic, strong) UIBarButtonItem *rightItem;

@property (nonatomic, copy) NSString *navigationTitle;

@property (nonatomic, assign) CGFloat maxHeight; //偏移的最大高度，超过则可见

@property (nonatomic, copy) void (^leftActionBlcok) ();

- (void)setContentOffset:(CGFloat)offset;

- (instancetype)initWithFrame:(CGRect)frame withNavigationTile:(NSString *)title;



@end
